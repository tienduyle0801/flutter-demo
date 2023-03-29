import 'package:flutter/material.dart';
import 'package:flutterdemo/sum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final api = SumApi();
  int? number = 0;
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  bool isLoading = false;
  String msg = '';

  @override
  void dispose() {
    aController.dispose();
    bController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: isLoading
            ? const MyLoadingWidget()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        msg,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                            fontSize: 100, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: aController,
                        decoration: const InputDecoration(
                          hintText: 'Number a',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: bController,
                        decoration: const InputDecoration(
                          hintText: 'Number b',
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      child: const Text('Calculate Sum'),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final data = await api.sum(SumRequest()
                            ..a = int.parse(aController.text)
                            ..b = int.parse(bController.text));
                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              number = data?.result;
                            });
                            setState(() {
                              msg = 'Call Native Sucsess';
                            });
                          });
                        } catch (e) {
                          debugPrint(e.toString());
                        } finally {
                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              isLoading = false;
                            });
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                msg = '';
                              });
                            });
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.2,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
