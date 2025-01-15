import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/dynamic_height.dart';
import '../controllers/post_controller.dart';
import '../widgets/post_item_widget.dart';

class PostListPage extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Posts',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Obx(() {
        return Container(
         padding: EdgeInsets.all(DynamicSize.height(context, 0.02)),
          child: controller.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : controller.posts.isNotEmpty // To handle no data situation
                  ? ListView.builder(
                      itemCount: controller.posts.length,
                      itemBuilder: (context, index) {
                        return PostItemWidget(
                          post: controller.posts[index],
                        );
                      },
                    )
                  : const Center(
                      child: Text("No posts available"),
                    ),
        );
      }),
    );
  }
}
