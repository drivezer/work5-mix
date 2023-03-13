import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> itemsExperience = [
    {
      'title': 'ฝึกงาน ปวช.',
      'detail':
          'ฝึกงานที่ร้านแอดไวซ์แพร่ ทำหน้าที่เกี่ยวกับ ซ่อมคอม ซ่อมโน๊ตบุ๊ค ซ่อมเครื่องปรื้น ประกอบคอม'
    },
    {
      'title': 'แข่งขันสิ่งประดิษฐ์ตอน ปวช.',
      'detail':
          'เข้าร่วมการแข่งขันสิ่งประดิษฐ์ เป็นระบบนิเทศการฝึกงานออนไลน์ ได้รางวัล ระดับอาชีวศึกษาจังหวัดแพร่ ระดับภาคเหนือ ระดับชาติ'
    },
    {
      'title': 'แข่งขันสิ่งประดิษฐ์ตอน ปวส.',
      'detail':
          'เข้าร่วมการแข่งขันสิ่งประดิษฐ์ เป็นระบบ LMS:ระบบการจัดการ การเรียนรู้ออนไลน์  ได้รางวัล ระดับอาชีวศึกษาจังหวัดแพร่ ระดับภาคเหนือ'
    },
    {
      'title': 'ฝึกงาน ปวส.',
      'detail':
          'ฝึกงานที่บริษัท SeedSoft เชียงใหม่ ทำหน้าที่เกี่ยวกับ การเขียนโปรแกรม Frontend Backend DevOps ทุกรูปแบบทั้งเว็บไซต์ แอพพลิเคชั่นบนโทรศัพท์ โปรแกรมDesktop แอพพลิเคชั่นสำหรับเครื่องPOS'
    }
  ];
  List<dynamic> itemsEducation = [
    {
      'year': '2548-2556',
      'detail': 'อนุบาลและประถมศึกษา \nที่โรงเรียนเทพพิทักษ์วิทยา'
    },
    {
      'year': '2556-2559',
      'detail': 'มัธยมศึกษาตอนต้น \nที่โรงเรียนพิริยาลัยจังหวัดแพร่'
    },
    {
      'year': '2559-2564',
      'detail':
          'ปวช. \nที่วิทยาลัยเทคนิคแพร่ \nแผนกเทคนิคคอมพิวเตอร์ \nปวส. \nที่วิทยาลัยเทคนิคแพร่ \nแผนกคอมพิวเตอร์ซอฟต์แวร์'
    },
    {
      'year': '2564-ปัจจุบัน',
      'detail': 'มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา เชียงใหม่'
    }
  ];
  final List<ChartData> chartData = [
    ChartData('ux/ui', 10, const Color.fromARGB(255, 255, 138, 138)),
    ChartData('Web Frontend', 30, const Color.fromARGB(255, 123, 255, 160)),
    ChartData(
        'Mobile App Frontend', 20, const Color.fromARGB(255, 143, 221, 255)),
    ChartData('API Backend', 25, const Color.fromARGB(255, 253, 255, 148)),
    ChartData('DevOps', 15, const Color.fromARGB(255, 251, 196, 255))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'โปรไฟล์',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 5, color: Colors.white))),
                      child: Image.asset('assets/images/background.jpeg'),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width / 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 0.2,
                                blurRadius: 10,
                              )
                            ]),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpeg'),
                          radius: 70,
                        ),
                      ),
                    )
                  ],
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'ข้อมูลส่วนตัว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: const [
                            Text('ชื่อ: '),
                            Text('ภาณุพงศ์ เหมืองจา'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('ชื่อเล่น: '),
                            Text('ไดร์ฟ'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('เพศ: '),
                            Text('ชาย'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('วัน/เดือน/ปี เกิด: '),
                            Text('9 กุมภาพันธ์ 2544'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('สัญชาติ: '),
                            Text('ไทย'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('ศาสนา: '),
                            Text('พุทธ'),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('เกรดเฉลี่ยสะสม (GPA): '),
                            Text(
                              '2.88',
                              style: TextStyle(height: 1.5),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'ช่องทางการติดต่อ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: const [
                            FaIcon(FontAwesomeIcons.facebook),
                            SizedBox(width: 10),
                            Text('ภาณุพงศ์ เหมืองจา')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            FaIcon(FontAwesomeIcons.instagram),
                            SizedBox(width: 10),
                            Text('drive_panupong')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            FaIcon(FontAwesomeIcons.phone),
                            SizedBox(width: 10),
                            Text('0612908891')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.mail),
                            SizedBox(width: 10),
                            Text('panupong_ma641@live.rmutl.ac.th')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 560,
                  child: buildListViewItems(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 430,
                  child: buildGridViewItems(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 530,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              'ทักษะด้านการเขียนโปรแกรม',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 100),
                            SfCircularChart(series: <CircularSeries>[
                              PieSeries<ChartData, String>(
                                radius: '180',
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.name,
                                yValueMapper: (ChartData data, _) => data.value,
                                dataLabelMapper: (ChartData data, _) =>
                                    '${data.name}\n${data.value}%',
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(fontFamily: 'Itim')),
                              ),
                            ]),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListViewItems() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemsExperience.length,
      itemBuilder: (context, int index) =>
          listDataItemsExperience(itemsExperience[index]),
    );
  }

  Widget listDataItemsExperience(dynamic item) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle),
                const SizedBox(width: 5),
                Text(
                  item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(item['detail']),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridViewItems() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: itemsEducation.length,
      itemBuilder: (context, int index) =>
          listDataItemsEducation(itemsEducation[index]),
    );
  }

  Widget listDataItemsEducation(dynamic item) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.history),
                const SizedBox(width: 5),
                Text(item['year']),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Center(
              child: Text(
                item['detail'],
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.name, this.value, this.color);
  final String name;
  final double value;
  final Color color;
}
