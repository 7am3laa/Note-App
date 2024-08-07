import 'package:get/get.dart';
import 'package:note_app/controllers/database%20controller/sqflite_controller.dart';
import 'package:note_app/models/note.dart';

class NoteScreenController extends GetxController {
  final SqLiteController _sqLiteController = SqLiteController();
  RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  Future<void> addNote(Note note) async {
    await _sqLiteController.insert(note);
    getNotes();
  }

  Future<void> deleteNote(int id) async {
    await _sqLiteController.delete(id);
    getNotes();
  }

  Future<void> getNotes() async {
    notes.value = await _sqLiteController.getNotes();
  }

  Future<void> updateNote(Note note) async {
    await _sqLiteController.update(note);
    getNotes();
  }
}
