import 'package:flutter/material.dart';

class CalculateTriangleScreen extends StatefulWidget {
  const CalculateTriangleScreen({super.key});
  static const routeName = '/calculate-triangle';

  @override
  State<CalculateTriangleScreen> createState() =>
      _CalculateTriangleScreenState();
}

class _CalculateTriangleScreenState extends State<CalculateTriangleScreen> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double result = 0;

  void calculate() {
    setState(() {
      result = (0.5 *
          double.parse(_baseController.text) *
          double.parse(_heightController.text));
      _baseController.text = '';
      _heightController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'คำนวณพื้นที่สามเหลี่ยม',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'คำนวณพื้นที่สามเหลี่ยมมุมฉาก',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextFormField(
                          controller: _baseController,
                          decoration: const InputDecoration(
                            labelText: 'ฐาน',
                            hintText: 'ใส่จำนวนฐาน',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextFormField(
                          controller: _heightController,
                          decoration: const InputDecoration(
                            labelText: 'สูง',
                            hintText: 'ใส่จำนวนสูง',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  result > 0
                      ? const Text('ผลลัพธ์',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                      : Container(),
                  result > 0
                      ? Text('$result', style: const TextStyle(fontSize: 18))
                      : Container(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => calculate(),
                    child: const Text('คำนวณ'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
