import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // 1번
          topInfoCard(),
          // 2번
          myStateCard(),
          // 3번
          myInfoCard(),
          // 싸이렌오더
          sirenOrderBox(),
          // 슬라이더
          sliderBox(),

        ],
      ),
      // ㅡㅡ [ floatingActionButton ] ㅡㅡ
      floatingActionButton: buildFloatingActionButton(),
      // ㅡㅡ [ bottomNavigationBar ] ㅡㅡ
      bottomNavigationBar: bottomNavigationBar(),

    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // 4개 이상일때 보이기
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_drink),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_drink_sharp),
          label: 'Ohter',
        ),
      ],
    );
  }
}

Widget topInfoCard() {
  return Stack(
    children: [
      Image.network(
        'https://webzine.glovis.net/old_post_data/images/vol150/img/s0302_img01.jpg',
        fit: BoxFit.cover,
      ),
      const Positioned(
        top: 16,
        left: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 40),
              child: Text(
                '올해 크리스마스도 역시,\n스타벅스 케이크와 함께!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 16,
        right: 16,
        child: InkWell(
          onTap: () {
            // 액션 버튼 클릭 시 동작
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 4),
                Text(
                  '내용 보기',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 14,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget myStateCard() {
  return Card(
    elevation: 0, // 그림자를 투명하게 설정
    child: Column(
      children: [
        const Row(
          children: [
            Expanded(
              flex: 7, // 첫 번째 자식 요소는 7의 비율로
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Text('5'),
                        Icon(Icons.star),
                        Text('until Green Level'),
                      ],
                    ),
                    subtitle: LinearProgressIndicator(
                      value: 0.5, // 프로그래스 바의 진행 상태 값 (0.0 ~ 1.0)
                      minHeight: 9,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3, // 두 번째 자식 요소는 3의 비율로
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 우측 정렬을 위해 추가
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text('/'),
                        Text('5'),
                        Icon(Icons.star),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0), // 좌우 간격 설정
            child: Row(
              children: [
                const Row(
                  children: [
                    Icon(Icons.mail, size: 30),
                    SizedBox(width: 8),
                    Text('What\'s New', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(width: 16), // Row와 Row 사이의 간격
                const Row(
                  children: [
                    Icon(Icons.card_giftcard, size: 30),
                    SizedBox(width: 8),
                    Text('Coupon', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget myInfoCard() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2018/07/08/10/11/a-snowy-day-3523618_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 10,
              // bottom: 0,
              left: 10,
              // right: 0,
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2023 WINTER e-Frequency',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '[행사 기간] 11/2(목) ~ 12/31(일)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '증정품은 한정 수량 제젝되어, 매장에 예약 기능 일자 및\n재고가 상이할 수 있으면 조기 소진될 수 있습니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget sirenOrderBox() {
  return Card(
    elevation: 0, // 그림자 높이를 0으로 설정하여 그림자를 제거합니다
    child: Image.asset(
      'lib/assets/orderBox.png',
      fit: BoxFit.fill,
    ),
  );
}



Widget buildFloatingActionButton() {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: FloatingActionButton(
      onPressed: () {
        // 버튼이 클릭되었을 때 실행되는 동작
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.pedal_bike),
      shape: CircleBorder(),
    ),
  );
}


Widget sliderBox() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(
          width: 300, // 카드의 너비 설정
          child: Card(
            child: Column(
              children: [
                Image.asset('lib/assets/cardnews01.png'),
                const Text(
                  '카드 1',
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 1, // 한 줄로 표시
                ),
                const Text(
                  '카드 1 서브타이틀',
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 1, // 한 줄로 표시
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 300, // 카드의 너비 설정
          child: Card(
            child: Column(
              children: [
                Image.asset('lib/assets/04_02_cardnews.png'),
                const Text(
                  '12월 20일, 그리팅 카드 및 모바일 상품권 충전',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 2, // 최대 두 줄까지 표시
                ),
                const Text(
                  '카드 2 서브타이틀',
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 1, // 한 줄로 표시
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 300, // 카드의 너비 설정
          child: Card(
            child: Column(
              children: [
                Image.asset('lib/assets/04_03_cardnews.png'),
                const Text(
                  '카드 3',
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 1, // 한 줄로 표시
                ),
                const Text(
                  '카드 3 서브타이틀',
                  overflow: TextOverflow.ellipsis, // 일정 길이 이상일 경우 "..."으로 표시
                  maxLines: 1, // 한 줄로 표시
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
