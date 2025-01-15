import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../utils/dynamic_height.dart';

class PostItemWidget extends StatelessWidget {
  final Post post;
  const PostItemWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DynamicSize.height(context, 0.01)),
      ),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8.0),
            Text(post.body, style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ),
      // child: ListTile(
      //   subtitle: Text(post.title),r
      //   title: Text(post.body),
      // )
    );
  }
}
