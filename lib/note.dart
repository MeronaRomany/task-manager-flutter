import 'package:floor/floor.dart';

@Entity(tableName: 'notes')
class Note {

  @PrimaryKey(autoGenerate: true)
  final int? noteId;
  final String title;
   String? location;

  Note({this.noteId, required this.title ,  this.location});
}