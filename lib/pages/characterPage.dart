import 'package:breaking_bad/models/braekingbadCharaterModels.dart';
import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  BreakingBadCharacterModels model;
  CharacterPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        backgroundColor: Colors.amber[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.amber, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                model.img,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber.withOpacity(0.3),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Name: ${model.name}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Nickname: ${model.nickname}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Status: ${model.status}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
