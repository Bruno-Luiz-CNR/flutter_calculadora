import 'package:calculadora/enum/enum.pages.dart';
import 'package:calculadora/widget/button.widget.dart';
import 'package:calculadora/widget/button.widgetCalc.dart';
import 'package:flutter/material.dart';

class Calculatorpage extends StatefulWidget {
  const Calculatorpage({super.key});

  @override
  State<Calculatorpage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<Calculatorpage> {
  late String display;
  OperationTypeEnum? operationType;

  @override
  void initState() {
    display = "0";
    super.initState();
  }

  void setOperationType(OperationTypeEnum newType) {
    setState(() {
      if (operationType == null) {
        operationType = newType;
        display += newType.symbol;
      }
    });
  }

  void clearDisplay() {
    setState(() {
      display = "0";
      operationType = null;
    });
  }

  void limparUm() {
    setState(() {
      if (display.length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = "0";
      }
    });
  }

  void calculateResult() {
    setState(() {
      if (operationType != null) {
        List<String> parts = display.split(operationType!.symbol);

        if (parts.length == 2) {
          double num1 = double.tryParse(parts[0]) ?? 0;
          double num2 = double.tryParse(parts[1]) ?? 0;
          double result = 0;

          switch (operationType!) {
            case OperationTypeEnum.addition:
              result = num1 + num2;
              break;
            case OperationTypeEnum.subtraction:
              result = num1 - num2;
              break;
            case OperationTypeEnum.multiplication:
              result = num1 * num2;
              break;
            case OperationTypeEnum.division:
              result = num2 != 0 ? num1 / num2 : 0;
              break;
          }

          if (result % 1 == 0) {
            display = result.toInt().toString();
          } else {
            display = result.toString();
          }

          operationType = null;
        }
      }
    });
  }

  void appendToDisplay(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00E5FF),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
        title: const Text(
          'CALCULADORA',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
            color: Color(0xFF00E5FF),
            shadows: [Shadow(color: Color(0xFF00E5FF), blurRadius: 12)],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF1F2933), Color(0xFF0F172A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Text(
                  display,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00E5FF),
                    letterSpacing: 1.2,
                    shadows: [Shadow(color: Color(0xFF00E5FF), blurRadius: 12)],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Buttonwidget(
                    text: "C",
                    color: const Color(0xFFFF5252),
                    onPressed: () {
                      clearDisplay();
                    },
                  ),
                  Buttonwidget(
                    text: "\u232B",
                    color: const Color(0xFFFFA726),
                    onPressed: () {
                      limparUm();
                    },
                  ),
                  Buttonwidget(
                    text: "/",
                    color: const Color(0xFF6C63FF),
                    onPressed: () {
                      setOperationType(OperationTypeEnum.division);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonCalc(
                    text: "1",
                    onPressed: () {
                      appendToDisplay("1");
                    },
                  ),
                  ButtonCalc(
                    text: "2",
                    onPressed: () {
                      appendToDisplay("2");
                    },
                  ),
                  ButtonCalc(
                    text: "3",
                    onPressed: () {
                      appendToDisplay("3");
                    },
                  ),
                  ButtonCalc(
                    text: "X",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.multiplication);
                    },
                    colors: Color(0xFF6C63FF),
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonCalc(
                    text: "4",
                    onPressed: () {
                      appendToDisplay("4");
                    },
                  ),
                  ButtonCalc(
                    text: "5",
                    onPressed: () {
                      appendToDisplay("5");
                    },
                  ),
                  ButtonCalc(
                    text: "6",
                    onPressed: () {
                      appendToDisplay("6");
                    },
                  ),
                  ButtonCalc(
                    text: "-",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.subtraction);
                    },
                    colors: Colors.blue,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonCalc(
                    text: "7",
                    onPressed: () {
                      appendToDisplay("7");
                    },
                  ),
                  ButtonCalc(
                    text: "8",
                    onPressed: () {
                      appendToDisplay("8");
                    },
                  ),
                  ButtonCalc(
                    text: "9",
                    onPressed: () {
                      appendToDisplay("9");
                    },
                  ),
                  ButtonCalc(
                    text: "+",
                    onPressed: () {
                      setOperationType(OperationTypeEnum.addition);
                    },
                    colors: Colors.blue,
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonCalc(
                    text: "0",
                    onPressed: () {
                      appendToDisplay("0");
                    },
                  ),
                  ButtonCalc(
                    text: ",",
                    onPressed: () {
                      appendToDisplay(".");
                    },
                  ),
                  ButtonCalc(
                    text: "=",
                    onPressed: () {
                      calculateResult();
                    },
                    colors: Color(0xFF00E676),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
