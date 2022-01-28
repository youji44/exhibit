import 'package:cached_network_image/cached_network_image.dart';
import 'package:exhibit/exhibit_model.dart';
import 'package:flutter/material.dart';

class ExhibitItem extends StatelessWidget {
  const ExhibitItem({Key? key, required this.exhibit}) : super(key: key);
  final Exhibit exhibit;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl: exhibit.images[index],
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: exhibit.images.length);
  }
}
