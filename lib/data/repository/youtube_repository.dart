import 'package:built_collection/built_collection.dart';

import '../model/search/model_search.dart';
import '../network/youtube_data_source.dart';

class YoutubeRepository {
  YoutubeDataSource _youtubeDataSource;

  String _lastSearchQuery;
  String _nextPageToken;
  int totalResults;

  YoutubeRepository(this._youtubeDataSource);

  Future<BuiltList<SearchItem>> searchVideos(String query) async {
    final searchResult = await _youtubeDataSource.searchVideos(query: query);
    _cacheValues(
      query: query,
      nextPageToken: searchResult.nextPageToken,
      results: searchResult.pageInfo.totalResults,
    );
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  void _cacheValues({String query, String nextPageToken, int results}) {
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
    totalResults = results;
  }

  Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) throw SearchNotInitiatedException();

    if (_nextPageToken == null) throw NoNextPageTokenException();

    final nextPageSearchResult = await _youtubeDataSource.searchVideos(
      query: _lastSearchQuery,
      pageToken: _nextPageToken,
    );

    _cacheValues(
      query: _lastSearchQuery,
      nextPageToken: nextPageSearchResult.nextPageToken,
    );

    return nextPageSearchResult.items;
  }
}

class NoSearchResultsException implements Exception {
  final message = "No results";
}

class SearchNotInitiatedException implements Exception {
  final message = "Cannot get next page results; Searching wasn't initiated.";
}

class NoNextPageTokenException implements Exception {}