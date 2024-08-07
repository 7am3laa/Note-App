import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/screens%20controller/notescreen_controller.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/view/widgets/custom_text.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteScreenController controller = Get.find();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: 'Enter Your Note',
              fontSize: 20,
              color: Color(0xff939191),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Note Title',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Note Content',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty) {
                  Note note = Note(
                    title: titleController.text,
                    content: contentController.text,
                    date: DateTime.now().toString(),
                  );
                  
                  await controller.addNote(note);

                  Get.back();
                } else {
                  // Handle empty fields (optional)
                  Get.snackbar('Error', 'Please fill in all fields');
                }
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
