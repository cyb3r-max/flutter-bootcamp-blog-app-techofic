import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/blog_model.dart';
import '../../network/endpoints.dart';
import '../../network/network_utils.dart';
import '../base/base_state.dart';

final FavoriteblogsListProvider =
    StateNotifierProvider<FavBlogsListController, BaseState>(
  (ref) => FavBlogsListController(ref: ref),
);

class FavBlogsListController extends StateNotifier<BaseState> {
  final Ref? ref;
  FavBlogsListController({this.ref}) : super(const InitialState());

  List<BlogModel> blogsList = [];

  Future fetchFavBlogsList() async {
    state = const LoadingState();
    dynamic responseBody;

    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.favoriteBlogs),
      );
      if (responseBody != null) {
        blogsList = (responseBody['data'] as List<dynamic>)
            .map((x) => BlogModel.fromJson(x))
            .toList();

        state = FavBlogsListSuccessState(blogsList);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print('fetchBlogsList() error = $error');
      print(stackTrace);
      state = const ErrorState();
    }
  }
}
