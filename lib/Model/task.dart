class Task {
  int _id;
  String _title;
  String _task;
  String _time;

  Task(dynamic obj) {
    _id = obj['id'];
    _title = obj['title'];
    _task = obj['task'];
    _time = obj['time'];
  }

  Task.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _task = data['task'];
    _time = data['time'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'task': _task,
        'time': _time,
      };

    int get  id => _id;  
    String get  title => _title;  
    String get  task => _task;  
    String get  type => _time;  
}
