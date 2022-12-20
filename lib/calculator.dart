import 'package:calculator/formula.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  final firstController = TextEditingController();
  final secController = TextEditingController();
  RxDouble value = RxDouble(0.0);
  RxBool isAdd = RxBool(false);
  RxBool isSub = RxBool(false);
  RxBool isMulti = RxBool(false);
  RxBool isDivide = RxBool(false);
  RxBool isPercent = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: const Text(
                "Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Enter value"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: firstController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter sec value"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: secController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (firstController.text.isNotEmpty &&
                            secController.text.isNotEmpty) {
                          value.value = Formula.add(
                              double.parse(firstController.text),
                              double.parse(secController.text));
                          FocusManager.instance.primaryFocus?.unfocus();
                          isAdd.value = true;
                          isSub.value = false;
                          isMulti.value = false;
                          isDivide.value = false;
                          isPercent.value = false;
                        }
                      },
                      child: Obx(
                        () => Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color:
                                  isAdd.isFalse ? Colors.blue : Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (firstController.text.isNotEmpty &&
                            secController.text.isNotEmpty) {
                          value.value = Formula.subtract(
                              double.parse(firstController.text),
                              double.parse(secController.text));
                          FocusManager.instance.primaryFocus?.unfocus();
                          isAdd.value = false;
                          isSub.value = true;
                          isMulti.value = false;
                          isDivide.value = false;
                          isPercent.value = false;
                        }
                      },
                      child: Obx(
                        () => Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color:
                                  isSub.isFalse ? Colors.blue : Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Subtract",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (firstController.text.isNotEmpty &&
                            secController.text.isNotEmpty) {
                          value.value = Formula.multiply(
                              double.parse(firstController.text),
                              double.parse(secController.text));
                          FocusManager.instance.primaryFocus?.unfocus();
                          isAdd.value = false;
                          isSub.value = false;
                          isMulti.value = true;
                          isDivide.value = false;
                          isPercent.value = false;
                        }
                      },
                      child: Obx(
                        () => Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: isMulti.isFalse
                                  ? Colors.blue
                                  : Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Multiply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (firstController.text.isNotEmpty &&
                            secController.text.isNotEmpty) {
                          value.value = Formula.divide(
                              double.parse(firstController.text),
                              double.parse(secController.text));
                          isAdd.value = false;
                          isSub.value = false;
                          isMulti.value = false;
                          isDivide.value = true;
                          isPercent.value = false;
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      child: Obx(
                        () => Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: isDivide.isFalse
                                  ? Colors.blue
                                  : Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Divide",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GestureDetector(
                        onTap: () {
                          if (firstController.text.isNotEmpty &&
                              secController.text.isNotEmpty) {
                            isAdd.value = false;
                            isSub.value = false;
                            isMulti.value = false;
                            isDivide.value = false;
                            isPercent.value = true;
                            showDialog(
                                barrierDismissible: false,
                                context: Get.context!,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                "choose percentage type ${secController.text} value",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      value.value =
                                                          Formula.addPercentage(
                                                              double.parse(
                                                                  firstController
                                                                      .text),
                                                              double.parse(
                                                                  secController
                                                                      .text));
                                                      Get.back();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: const Center(
                                                        child: Text(
                                                          "Add",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        value.value = value
                                                                .value =
                                                            Formula.subtractPercentage(
                                                                double.parse(
                                                                    firstController
                                                                        .text),
                                                                double.parse(
                                                                    secController
                                                                        .text));
                                                        Get.back();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Subtract",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      value.value = Formula
                                                          .multiplyPercentage(
                                                              double.parse(
                                                                  firstController
                                                                      .text),
                                                              double.parse(
                                                                  secController
                                                                      .text));
                                                      Get.back();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: const Center(
                                                        child: Text(
                                                          "Multiply",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        value.value = value
                                                                .value =
                                                            Formula.dividePercentage(
                                                                double.parse(
                                                                    firstController
                                                                        .text),
                                                                double.parse(
                                                                    secController
                                                                        .text));
                                                        Get.back();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Divide",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                });
                          }
                        },
                        child: Obx(
                          () => Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: isPercent.isFalse
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Percentage",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 8.0),
                child: Obx(
                  () => Text(
                    "Result->${value.value}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
