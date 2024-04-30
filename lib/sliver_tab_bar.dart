import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://cdn.pixabay.com/photo/2014/11/03/17/40/leopard-515509_640.jpg";

  List<String> miImages = [
    "https://http2.mlstatic.com/D_NQ_NP_837203-MLM31988632264_082019-O.webp",
    "https://m.media-amazon.com/images/I/61ocQlyo7xL.__AC_SX300_SY300_QL70_ML2_.jpg",
    "https://cms.grupoferrepat.net/assets/img/productos/06011B6_2.jpg",
    "https://m.media-amazon.com/images/I/61YPn6RvDKL.jpg",
  ];

  void tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void dispose() {
    tabController!.removeListener(tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(tabListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Color(0xffb73a3a),
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(""),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          "Ferretería Arellano",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: const Color(0xffffffff),
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                controller: tabController,
                indicatorColor: Color(0xffb73a3a),
                isScrollable: true,
                tabs: const [
                  Tab(text: "Milwakee"),
                  Tab(text: "Pretul"),
                  Tab(text: "Bosh"),
                  Tab(text: "Stanley"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800.0,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text(
                      "Fuente de energía: Baterías \nVoltaje: 115 Voltios \nAmperaje: 1,5 Amperios",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Fuente de energía: Baterías \nVoltaje: 12 Voltios \nAmperaje: 2 Amperios",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Fuente de energía: Cable \nVoltaje: 12 Voltios \nAmperaje: 2.5 Amperios",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Fuente de energía: Baterías \nVoltaje: 11 Voltios \nAmperaje: 2 Amperios",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
