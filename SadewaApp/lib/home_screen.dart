import 'package:flutter/material.dart';
import 'package:sadewa/component/custom_loading.dart';
import 'package:sadewa/component/input_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController pregnant = TextEditingController();
  TextEditingController history = TextEditingController();
  TextEditingController symptomps = TextEditingController();
  TextEditingController examination = TextEditingController();
  TextEditingController laboratoryTest = TextEditingController();

  // yang ini yg di pakai
  TextEditingController symptomps1 = TextEditingController();
  TextEditingController symptomps2 = TextEditingController();
  TextEditingController symptomps3 = TextEditingController();
  TextEditingController symptomps4 = TextEditingController();
  TextEditingController symptomps5 = TextEditingController();
  TextEditingController symptomps6 = TextEditingController();

  bool? isLoading = false;

  List<String> optionsAPI = [
    "fatigue",
    "yellowish_skin",
    "loss_of_appetite",
    "yellowing_of_eyes",
    'family_history',
    "stomach_pain",
    "ulcers_on_tongue",
    "vomiting",
    "cough",
    "chest_pain"
  ];

  List<String> options = [
    "Kelelahan",
    "Kulit Kuning",
    "Kehilangan Selera Makan",
    "Penguningan pada Mata",
    'Riwayat Keluarga',
    "Nyeri Perut",
    "Luka di Lidah",
    "Muntah",
    "Batuk",
    "Nyeri Dada"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff1db3ad),
          centerTitle: true,
          title: const Text("Sadewa App"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Cara menggunakan aplikasi ini:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text("1. Isi Kolom Gejala di bawah ini"),
                              Text(
                                "2. Kirim laporan (Tidak ada data yang disimpan atau dibagikan)",
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Tutup dialog
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.info_outline)),
          ],
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Prediksi Penyakit berdasarkan Gejala",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InputTextField(
                      labelTitle: "Gejala 1",
                      controller: symptomps1,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps1.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InputTextField(
                      labelTitle: "Gejala 2",
                      controller: symptomps2,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps2.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InputTextField(
                      labelTitle: "Gejala 3",
                      controller: symptomps3,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps3.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InputTextField(
                      labelTitle: "Gejala 4",
                      controller: symptomps4,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps4.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InputTextField(
                      labelTitle: "Gejala 5",
                      controller: symptomps5,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps5.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InputTextField(
                      labelTitle: "Gejala 6",
                      controller: symptomps6,
                      hint: "Pilih Gejala yang mendekati",
                      isVisible: false,
                      isPassword: false,
                      isDropDown: true,
                      dropdownItems: options,
                      onChangedDropdown: (selected) {
                        setState(() {
                          symptomps6.text = selected;
                        });
                      },
                      onPressedSuffixIcon: () {},
                    ),
                    InkWell(
                      onTap: () async {
                        // if (symptomps1.text.isNotEmpty &&
                        //     symptomps2.text.isNotEmpty &&
                        //     symptomps3.text.isNotEmpty &&
                        //     symptomps4.text.isNotEmpty &&
                        //     symptomps5.text.isNotEmpty &&
                        //     symptomps6.text.isNotEmpty) {
                        //   setState(() {});
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //           content: Text("Please Fill the data above")));
                        // }
                        showProgressDialog(context: context);
                        await Future.delayed(const Duration(seconds: 3));
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Anda mengalami batuk ringan, dan butuh istirahat",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: const Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Tutup dialog
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 24,
                        ),
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Color(0xff1db3ad),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                            ]),
                        child: const Center(
                          child: Text(
                            "Periksa",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if(isLoading!){}
            //   showProgressDialog();
            // isLoading! ?
            //  Container(
            //   color: Colors.red,
            // ),
          ],
        ),
        // body: Container(
        //   margin: const EdgeInsets.all(16),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         InputTextField(
        //           labelTitle: "Gender",
        //           controller: gender,
        //           hint: "Male or Female ?",
        //           isVisible: false,
        //           isPassword: false,
        //           isDropDown: true,
        //           dropdownItems: const ['Male', 'Female'],
        //           onChangedDropdown: (selected) {
        //             setState(() {
        //               gender.text = selected;
        //             });
        //           },
        //           onPressedSuffixIcon: () {},
        //         ),
        //         gender.text != "Male"
        //             ? InputTextField(
        //                 labelTitle: "Pregnant",
        //                 controller: age,
        //                 hint: "Yes or No ?",
        //                 isVisible: false,
        //                 isPassword: false,
        //                 isDropDown: true,
        //                 dropdownItems: const ['Yes', 'No'],
        //                 onChangedDropdown: (selected) {
        //                   setState(() {
        //                     age.text = selected;
        //                   });
        //                 },
        //                 onPressedSuffixIcon: () {},
        //               )
        //             : const SizedBox(),
        //         InputTextField(
        //           maxLength: 100,
        //           maxLines: 3,
        //           labelTitle: "History",
        //           controller: history,
        //           hint:
        //               "Example: gone to an outdoor music festival in north america, shared drinks and cigarettes with friends with similar symptoms",
        //           isVisible: false,
        //           isPassword: false,
        //           onPressedSuffixIcon: () {},
        //         ),
        //         InputTextField(
        //           maxLength: 100,
        //           maxLines: 3,
        //           labelTitle: "Symptoms",
        //           controller: symptomps,
        //           hint:
        //               "Example: high-grade fever, lethargy, headache, and abdominal pain for two days",
        //           isVisible: false,
        //           isPassword: false,
        //           onPressedSuffixIcon: () {},
        //         ),
        //         InputTextField(
        //           maxLength: 100,
        //           maxLines: 3,
        //           labelTitle: "Examination Findings",
        //           controller: examination,
        //           hint:
        //               "Example: petechial lesions on the palms of his hands and feet, bug bites",
        //           isVisible: false,
        //           isPassword: false,
        //           onPressedSuffixIcon: () {},
        //         ),
        //         //Laboratory test results
        //         InputTextField(
        //           maxLength: 100,
        //           maxLines: 3,
        //           labelTitle: "Laboratory test results",
        //           controller: laboratoryTest,
        //           hint: "Example: w/IgE levels > 3000 IU/m",
        //           isVisible: false,
        //           isPassword: false,
        //           onPressedSuffixIcon: () {},
        //         ),
        //         InkWell(
        //           onTap: () {
        //             if (symptomps.text.isNotEmpty &&
        //                 gender.text.isNotEmpty &&
        //                 examination.text.isNotEmpty &&
        //                 laboratoryTest.text.isNotEmpty) {
        //               setState(() {});
        //             } else {
        //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //                   content: Text("Please Fill the data above")));
        //             }
        //           },
        //           child: Container(
        //             width: MediaQuery.of(context).size.width,
        //             margin: const EdgeInsets.symmetric(
        //               horizontal: 14,
        //               vertical: 24,
        //             ),
        //             padding: const EdgeInsets.all(15),
        //             decoration: const BoxDecoration(
        //                 color: Colors.green,
        //                 borderRadius: BorderRadius.all(Radius.circular(15)),
        //                 boxShadow: [
        //                   BoxShadow(
        //                     color: Colors.grey,
        //                     offset: Offset(0, 2),
        //                     spreadRadius: 1,
        //                     blurRadius: 3,
        //                   ),
        //                 ]),
        //             child: const Center(
        //               child: Text(
        //                 "Save",
        //                 style: TextStyle(color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
