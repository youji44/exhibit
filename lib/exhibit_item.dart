import 'package:cached_network_image/cached_network_image.dart';
import 'package:exhibit/exhibit_detail.dart';
import 'package:exhibit/exhibit_model.dart';
import 'package:flutter/material.dart';

class ExhibitItem extends StatelessWidget {
  const ExhibitItem({Key? key, required this.exhibit}) : super(key: key);
  final Exhibit exhibit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              exhibit.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.blue),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ExhibitDetail(
                            url: exhibit.images[index], title: exhibit.title),
                      ),
                    );
                  },
                  child: SizedBox(
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: exhibit.images.length),
        ),
      ],
    );
  }
}
