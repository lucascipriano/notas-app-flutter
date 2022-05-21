// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/alt_home_page.dart';

class FullNote extends StatefulWidget {
  FullNote({this.task, Key? key}) : super(key: key);
  Task? task;

  @override
  State<FullNote> createState() => _FullNoteState();
}

class _FullNoteState extends State<FullNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _taskTitle = TextEditingController(
        text: widget.task == null ? null : widget.task!.title!);
    TextEditingController _taskNote = TextEditingController(
        text: widget.task == null ? null : widget.task!.note!);

    final dateCreate =
        widget.task != null ? widget.task!.creation_date!.toString() : "";
    final regexp = RegExp("^[^.]+");
    final match = regexp.firstMatch(dateCreate);
    final matchedText = match?.group(0).toString();
    ScrollController _controller = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromARGB(255, 195, 60, 84),
      //   onPressed: () async {
      //     var newTask = Task(
      //       title: _taskTitle.text,
      //       note: _taskNote.text,
      //       creation_date: DateTime.now(),
      //       done: false,
      //     );
      //     Box<Task> taskbox = Hive.box<Task>("tasks");
      //     if (widget.task != null) {
      //       widget.task!.title = newTask.title;
      //       widget.task!.note = newTask.note;
      //       widget.task!.save();
      //       Navigator.of(context).pushReplacementNamed('/');
      //     } else {
      //       await taskbox.add(newTask);
      //       Navigator.of(context).pushReplacementNamed('/');
      //     }
      //   },
      //   child: const Icon(
      //     Icons.save,
      //     color: Colors.white,
      //   ),
      // ),
      backgroundColor: Colors.black,
      // backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.task?.delete();
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 32,
                        ),
                        color: const Color.fromARGB(255, 195, 60, 84),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  // ignore: prefer_const_constructors
                  child: Text(
                    matchedText ?? "Nova nota",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                TextField(
                  maxLines: 1,
                  maxLength: 32,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  controller: _taskTitle,
                  decoration: InputDecoration(
                    filled: false,
                    fillColor:
                        const Color.fromARGB(255, 120, 119, 117).withAlpha(75),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Seu titulo",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                TextField(
                  scrollPadding: const EdgeInsets.only(bottom: 10),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLength: 1000,
                  maxLines: 20,
                  controller: _taskNote,
                  decoration: InputDecoration(
                    fillColor:
                        const Color.fromARGB(255, 120, 119, 117).withAlpha(75),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Write Notes",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: RawMaterialButton(
                        onPressed: () async {
                          var newTask = Task(
                            title: _taskTitle.text,
                            note: _taskNote.text,
                            creation_date: DateTime.now(),
                            done: false,
                          );
                          Box<Task> taskbox = Hive.box<Task>("tasks");
                          if (widget.task != null) {
                            widget.task!.title = newTask.title;
                            widget.task!.note = newTask.note;
                            widget.task!.save();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AlternativeHome()));
                          } else {
                            await taskbox.add(newTask);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AlternativeHome()));
                          }
                        },
                        fillColor: const Color.fromARGB(255, 195, 60, 84),
                        child: Text(
                          widget.task == null ? "Adicionar" : "Atualizar",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
