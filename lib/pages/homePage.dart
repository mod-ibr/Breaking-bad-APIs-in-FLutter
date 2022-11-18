import 'package:breaking_bad/apisHandler/breakingBadAPIsHandler.dart';
import 'package:breaking_bad/models/braekingbadCharaterModels.dart';
import 'package:breaking_bad/pages/characterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BreakingBadAPIsHandler breakingBadAPIsHandler = BreakingBadAPIsHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: breakingBadAPIsHandler.getAllCharacters(),
          builder: (BuildContext context,
              AsyncSnapshot<List<BreakingBadCharacterModels>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CharacterPage(model: snapshot.data![index]),
                      ),
                    );
                  },
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
                          snapshot.data![index].img,
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
                                'Name: ${snapshot.data![index].name}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Nickname: ${snapshot.data![index].nickname}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Status: ${snapshot.data![index].status}',
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
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(
                child: Text('No Data'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
