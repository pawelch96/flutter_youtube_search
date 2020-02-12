import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:html_unescape/html_unescape.dart';
import 'package:youtube_search/data/model/search/search_snippet.dart';
import 'package:youtube_search/ui/search/search_bloc.dart';
import 'package:youtube_search/ui/search/search_state.dart';
import 'package:youtube_search/ui/search/widget/centered_message.dart';
import 'package:youtube_search/ui/search/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = kiwi.Container().resolve<SearchBloc>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _searchBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: BlocBuilder(
        bloc: _searchBloc,
        builder: (context, SearchState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: "Start searching!",
              icon: Icons.ondemand_video,
            );
          }

          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isSuccessful) {
            return _buildResultList(state);
          } else {
            return CenteredMessage(
              message: state.error,
              icon: Icons.error_outline,
            );
          }
        },
      ),
    );
  }

  Widget _buildResultList(SearchState searchState) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(searchState),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= searchState.searchResults.length
              ? _buildLoaderListItem()
              : _buildVideoListItemCard(
                  searchState.searchResults[index].snippet);
        },
      ),
    );
  }

  int _calculateListItemCount(SearchState searchState) {
    if (searchState.hasReachedEndOfResults) {
      return searchState.searchResults.length;
    } else {
      return searchState.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _searchBloc.fetchNextResultPage();
    }
    return false;
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildVideoListItemCard(SearchSnippet snippet) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                snippet.thumbnails.high.url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6),
            Text(
              HtmlUnescape().convert(snippet.title),
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 6),
            Text(
              snippet.description,
            ),
          ],
        ),
      ),
    );
  }
}
