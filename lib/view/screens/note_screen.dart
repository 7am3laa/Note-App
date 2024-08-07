import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/screens%20controller/notescreen_controller.dart';
import 'package:note_app/view/screens/addnote.dart';
import '../widgets/custom_text.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteScreenController controller = Get.put(NoteScreenController());
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/note.png',
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'My Notes',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: '${controller.notes.length} notes',
                fontSize: 15,
                color: const Color(0xff939191),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: controller.notes.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: 'No Notes Added',
                          fontSize: 20,
                          color: Color(0xff939191),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          final note = controller.notes[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(188, 188, 188, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 19,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: CustomText(
                                    text: note.title,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  subtitle: CustomText(
                                    text: note.date.isNotEmpty
                                        ? note.date.split(' ').first
                                        : 'No Date Available',
                                    fontSize: 14,
                                    color: const Color(0xff939191),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      controller.deleteNote(note.id!);
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CustomText(
                                    text: note.content,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddNote());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
