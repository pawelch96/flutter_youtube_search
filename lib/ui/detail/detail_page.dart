import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search/ui/detail/detail.dart';

class DetailPage extends StatefulWidget {
  final String videoId;

  DetailPage({
    Key key,
    @required this.videoId,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _detailBloc = kiwi.Container().resolve<DetailBloc>();

  @override
  void initState() {
    super.initState();
    _detailBloc.onShowDetail(id: widget.videoId);
  }

  @override
  void dispose() {
    super.dispose();
    _detailBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _detailBloc,
      child: Scaffold(
        body: BlocBuilder(
          bloc: _detailBloc,
          builder: _buildScaffoldContent,
        ),
      ),
    );
  }

  Widget _buildScaffoldContent(BuildContext context, DetailState state) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(expandedHeight: 178,
      pinned: true,
      flexibleSpace: _buildSliverAppBarContent(state),
      )
    ],);
  }

FlexibleSpaceBar _buildSliverAppBarContent(DetailState state) {
  if (state.isLoading) {
    return FlexibleSpaceBar();
  }

  if (state.isSuccessful) {
    return FlexibleSpaceBar(
      title: Text(
        state.videoItem.snippet.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      background: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            state.videoItem.snippet.thumbnails.high.url,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: 
            ),
          )
        ],
      ),
    )
  }
}

}
