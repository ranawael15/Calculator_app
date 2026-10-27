import 'package:calculator_app/components/eraser_btn.dart';
import 'package:calculator_app/components/number_btn.dart';
import 'package:calculator_app/components/operate_btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String operation = "";
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: deviceWidth,
                alignment: Alignment.center,
                height: 120,
                child: Text(
                  operation,
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.w300),
                ),
              ),
              const Divider(indent: 25, endIndent: 25),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EraserBtn(
                        mytxt: "C",
                        onPressed: () {
                          setState(() {
                            if (operation.isNotEmpty) {
                              operation = operation.substring(
                                0,
                                operation.length - 1,
                              );
                            }
                          });
                        },
                      ),
                      EraserBtn(
                        mytxt: "AC",
                        onPressed: () {
                          setState(() {
                            operation = "";
                          });
                        },
                      ),
                      OperateBtn(
                        mytxt: '%',
                        onPressed: () {
                          setState(() {
                            operation += "%";
                          });
                        },
                      ),
                      OperateBtn(
                        mytxt: "/",
                        onPressed: () {
                          setState(() {
                            operation += "/";
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberBtn(
                        mytxt: "7",
                        onPressed: () {
                          setState(() {
                            operation += "7";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "8",
                        onPressed: () {
                          setState(() {
                            operation += "8";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "9",
                        onPressed: () {
                          setState(() {
                            operation += "9";
                          });
                        },
                      ),
                      OperateBtn(
                        mytxt: "*",
                        onPressed: () {
                          setState(() {
                            operation += "*";
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberBtn(
                        mytxt: "4",
                        onPressed: () {
                          setState(() {
                            operation += "4";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "5",
                        onPressed: () {
                          setState(() {
                            operation += "5";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "6",
                        onPressed: () {
                          setState(() {
                            operation += "6";
                          });
                        },
                      ),
                      OperateBtn(
                        mytxt: "-",
                        onPressed: () {
                          setState(() {
                            operation += "-";
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberBtn(
                        mytxt: "1",
                        onPressed: () {
                          setState(() {
                            operation += "1";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "2",
                        onPressed: () {
                          setState(() {
                            operation += "2";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "3",
                        onPressed: () {
                          setState(() {
                            operation += "3";
                          });
                        },
                      ),

                      OperateBtn(
                        mytxt: "+",
                        onPressed: () {
                          setState(() {
                            operation += "+";
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OperateBtn(
                        mytxt: "+/-",
                        onPressed: () {
                          setState(() {
                            if (operation.startsWith("-")) {
                              operation = operation.substring(1);
                            } else if (operation.isNotEmpty) {
                              operation = "-$operation";
                            }
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: "0",
                        onPressed: () {
                          setState(() {
                            operation += "0";
                          });
                        },
                      ),
                      NumberBtn(
                        mytxt: ".",
                        onPressed: () {
                          setState(() {
                            operation += ".";
                          });
                        },
                      ),

                      TextButton(
                        onPressed: () {
                          setState(() {
                            try {
                              ShuntingYardParser parser = ShuntingYardParser();
                              Expression expression = parser.parse(operation);
                              ContextModel contextModel = ContextModel();
                              double result = expression.evaluate(
                                EvaluationType.REAL,
                                contextModel,
                              );

                              if (!result.isFinite) {
                                operation = "Error";
                              } else {
                                operation = result == result.roundToDouble()
                                    ? result.toInt().toString()
                                    : result.toString();
                              }
                            } catch (e) {
                              operation = "Error";
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            Colors.green,
                          ),
                          overlayColor: WidgetStatePropertyAll(
                            Colors.green[800],
                          ),
                          shape: const WidgetStatePropertyAll(CircleBorder()),
                          minimumSize: WidgetStatePropertyAll(
                            Size(deviceWidth / 4 - 15, 100),
                          ),
                        ),

                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
