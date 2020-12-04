import 'package:flutter/cupertino.dart';
import 'package:praticeflutter/src/models/entry.dart';
import 'package:praticeflutter/src/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _entry;
  String _entryId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get entry => _entry;
  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeEntry(String entry){
    _entry = entry;
    notifyListeners();
  }
  //Functions
  loadAll(Entry entry){
    if (entry != null){
      _date = DateTime.parse(entry.date);
      _entry = entry.entry;
      _entryId = entry.entryId;
    }else{
      _date = DateTime.now();
      _entry = null;
      _entryId = null;
    }
  }

  saveEntry(){
    if (_entryId == null){
      //ADD
      var newEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: uuid.v1());
      firestoreService.setEntry(newEntry);
    }else{
      //EDIT
      var updateEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: _entryId);
      firestoreService.setEntry(updateEntry);
    }
  }

  removeEntry(String entryId){
    firestoreService.removeEntry(entryId);

  }


}