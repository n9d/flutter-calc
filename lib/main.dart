import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      home: Calc(title: 'Flutter Calc'),
    );
  }
}

class Calc extends StatefulWidget {
  Calc({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double _view = 0;
  double _register = 0;
  String _mode = "";

  void _handleAddClick(double n) {
    setState(() {
      _view = _view + n;
    });
  }

  void _handleSetNum(double n) {
    setState(() {
      if (_view == 0) {
        _view = n;
      } else {
        if (_register == 0 && _mode != "") {
          _register = _view;
          _view = n;
        } else {
          _view = _view * 10 + n;
        }
      }
    });
  }

  void _handleClear() {
    setState(() {
      _view = 0;
      _register = 0;
      _mode = "";
    });
  }

  void _handleSetMode(String n) {
    setState(() {
      if (_mode == "" || _mode == "=") {
        _register = 0;
        _mode = n;
      } else {
        switch (_mode) {
          case '+':
            _view = _view + _register;
            _register = 0;
            _mode = n;
            break;
          case '-':
            _view = _register - _view;
            _register = 0;
            _mode = n;
            break;
          case '*':
            _view = _view * _register;
            _register = 0;
            _mode = n;
            break;
          case '/':
            if (_view != 0) {
              _view = _register / _view;
              _register = 0;
              _mode = n;
            }
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                (_view.toString().length > 10
                    ? _view.toString().substring(0, 10)
                    : _view.toString()),
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.right,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  padding: const EdgeInsets.all(16),
                  children: [
                    RaisedButton(
                        onPressed: () => _handleSetNum(7),
                        child: Text('7',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(8),
                        child: Text('8',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(9),
                        child: Text('9',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetMode('/'),
                        child: Text('/',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(4),
                        child: Text('4',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(5),
                        child: Text('5',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(6),
                        child: Text('6',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetMode('*'),
                        child: Text('*',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(1),
                        child: Text('1',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(2),
                        child: Text('2',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetNum(3),
                        child: Text('3',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetMode('-'),
                        child: Text('-',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: _handleClear,
                        child: Text('C',
                            style: Theme.of(context).textTheme.headline3.merge(
                                  TextStyle(
                                    color: Colors.red,
                                  ),
                                ))),
                    RaisedButton(
                        onPressed: () => _handleSetNum(0),
                        child: Text('0',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetMode('='),
                        child: Text('=',
                            style: Theme.of(context).textTheme.headline3)),
                    RaisedButton(
                        onPressed: () => _handleSetMode('+'),
                        child: Text('+',
                            style: Theme.of(context).textTheme.headline3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleAddClick(2),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
