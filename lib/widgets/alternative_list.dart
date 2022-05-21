// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/fullnote.dart';

class AlternativeList extends StatefulWidget {
  AlternativeList(this.task, this.index, {Key? key}) : super(key: key);
  Task task;
  int index;

  @override
  State<AlternativeList> createState() => _MyListTileState();
}

class _MyListTileState extends State<AlternativeList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FullNote(task: widget.task)))),
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        margin: const EdgeInsets.only(bottom: 20, top: 10),
        // width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 195, 60, 84),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                    child: Text(
                      widget.task.title!,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1.0,
              color: Color.fromARGB(67, 192, 192, 192),
            ),
            Center(
              child: Text(
                widget.task.note!,
                maxLines: 4,
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
