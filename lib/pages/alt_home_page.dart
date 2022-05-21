import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/fullnote.dart';
import 'package:todo/widgets/alternative_list.dart';

class AlternativeHome extends StatefulWidget {
  const AlternativeHome({Key? key}) : super(key: key);

  @override
  State<AlternativeHome> createState() => _AlternativeHomeState();
}

class _AlternativeHomeState extends State<AlternativeHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Color.fromRGBO(38, 38, 38, 1)
        backgroundColor: Colors.black,
        body: ValueListenableBuilder<Box<Task>>(
          valueListenable: Hive.box<Task>("tasks").listenable(),
          builder: (context, box, _) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Notas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Divider(
                    height: 8,
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        Task currentTask = box.getAt(index)!;
                        return AlternativeList(currentTask, index);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 170,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 195, 60, 84),
          elevation: 10,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullNote(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
