
import 'package:floor/floor.dart';

import 'note.dart';

@dao
abstract class NoteDao{
 @insert
  Future<int> insertNote(Note note);

 @Query('SELECT * FROM notes')
 Future<List<Note>> getAllNotes();

 @update
 Future<int> updateNote(Note note);

 @delete
 Future<int> deleteNote(Note note);

}