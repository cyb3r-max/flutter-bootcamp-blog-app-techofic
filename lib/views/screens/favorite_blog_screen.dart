import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/blog/blogs_list_controller.dart';
import '../../controller/blog/favorite_blog_controller.dart';
import 'components/blog_card.dart';

class FavoriteBlogs extends ConsumerStatefulWidget {
  const FavoriteBlogs({Key? key}) : super(key: key);

  @override
  _FavoriteBlogsState createState() => _FavoriteBlogsState();
}

class _FavoriteBlogsState extends ConsumerState<FavoriteBlogs> {
  @override
  Widget build(BuildContext context) {
    final FavblogsListState = ref.watch(FavoriteblogsListProvider);
    final blogsList = FavblogsListState is FavBlogsListSuccessState
        ? FavblogsListState.blogsList
        : [];
    @override
    void initState() {
      super.initState();
      FavblogsListState;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Blogs')),
      body: FavblogsListState is FavBlogsListSuccessState
          ? ListView.builder(
              itemCount: blogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogCard(blogModel: blogsList[index]);
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
