//Author: Pavlo
//Date: 01/28/2022
//Main page for Exhibit list

import 'package:exhibit/exhibit_item.dart';
import 'package:exhibit/exhibit_model.dart';
import 'package:exhibit/exhibit_provider.dart';
import 'package:flutter/material.dart';

class ExhibitPage extends StatefulWidget {
  const ExhibitPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ExhibitPage> createState() => _ExhibitPageState();
}

class _ExhibitPageState extends State<ExhibitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Exhibit>>(
            future: RestExhibitsLoader().getExhibitList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Exhibit> exhibitList = snapshot.data!;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 120,
                        child: ExhibitItem(exhibit: exhibitList[index]),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemCount: exhibitList.length);
              } else if (snapshot.hasError) {
                return snapshot.error as Widget;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
