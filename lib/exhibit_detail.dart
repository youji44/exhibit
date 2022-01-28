//Author: Pavlo
//Date: 01/28/2022
//Exhibit image view

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ExhibitDetail extends StatelessWidget {
  final String url;
  final String title;
  const ExhibitDetail({Key? key, required this.url, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SizedBox(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(url),
        ),
      ),
    );
  }
}
