import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});
  static const String routeName = '/beranda';

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;
  String nama = 'Ica';
  String tgl = '31 Agustus 2025';
  String poin = '515';
  String nomorHp = "";
  String gb = "20.00";
  String tlfn = "0";
  String sms = "25";
  String saldo = "100.000";

  @override
  void initState() {
    super.initState();
    _loadNomor();
  }

  Future<void> _loadNomor() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomorHp = prefs.getString('nomorHp') ?? "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red.shade700, Colors.red.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "Hai, $nama !",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipPath(
                  clipper: SimClipper(),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red.shade700, Colors.red.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nomorHp,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset("assets/simpati.png", height: 24),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sisa Pulsa Anda",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rp $saldo",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Berlaku sampai ",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  tgl,
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Isi Pulsa"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              "Telkomsel POIN ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                poin,
                                style: const TextStyle(
                                  color: Colors.black,
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
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QuotaInfo(title: "Internet", value: "$gb GB"),
                    _QuotaInfo(title: "Telpon", value: "$tlfn Min"),
                    _QuotaInfo(title: "SMS", value: "$sms SMS"),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ), 
                      _sectionTitle("Kategori Paket"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          childAspectRatio: 0.9,
                          children: [
                            _menuItem("assets/internet.png", "Internet"),
                            _menuItem("assets/telpon.png", "Telpon"),
                            _menuItem("assets/sms.png", "SMS"),
                            _menuItem("assets/roaming.png", "Roaming"),
                            _menuItem("assets/Hiburan.png", "Hiburan"),
                            _menuItem("assets/unggulan.png", "Unggulan"),
                            _menuItem("assets/tersimpan.png", "Tersimpan"),
                            _menuItem(
                              "assets/riwayat.png",
                              "Riwayat",
                              onTap: () {
                                Navigator.pushNamed(context, '/riwayat');
                              },
                            ),
                          ],
                        ),
                      ),

                      _sectionTitle(
                        "Terbaru dari Telkomsel",
                        trailing: "Lihat Semua",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _promoBanner(
                              title: "Internet OMG!",
                              subtitle: "Bisa YouTube dan Tiktok",
                              color1: Colors.red,
                              color2: Colors.pink,
                              assetPath: "assets/omg.png",
                              imageSize: 60,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/pembayaran',
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            _promoBanner(
                              title: "Undian Kemerdekaan",
                              subtitle: "Beli kuota Pada Masa Kemerdekaan",
                              color1: Colors.deepPurple,
                              color2: Colors.blue,
                              assetPath: "assets/ketengan.png",
                              imageSize: 60,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Bantuan"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun Saya"),
        ],
        onTap: (index) async {
          if (index == 1) {
            debugPrint('riwayat ditekan');
          } else if (index == 2) {
            debugPrint('bantuan ditekan');
          } else if (index == 3) {
            debugPrint('inbox ditekan');
          } else if (index == 4) {
            debugPrint('akun saya ditekan');
          }
        },
      ),
    );
  }

  Widget _menuItem(String assetPath, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.yellow[50],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                assetPath,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _promoBanner({
    required String title,
    required String subtitle,
    required Color color1,
    required Color color2,
    String? assetPath,
    double imageSize = 80,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            if (assetPath != null) ...[
              Image.asset(
                assetPath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}

class SimClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _QuotaInfo extends StatelessWidget {
  final String title;
  final String value;
  const _QuotaInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ],
    );
  }
}
