import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});
  static const String routeName = '/pembayaran';

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  String? selectedMethod = "pulsa";
  String saldo = "100.000";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[80],
      appBar: AppBar(title: const Text("Metode Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Combo OMG! 6.5 GB",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "4.5 GB Internet + 2 GB OMG! + 60 SMS Tsel + 100 Mins Voice Tsel",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Image.asset('assets/jampasir.png'),
                        SizedBox(width: 6),
                        Text(
                          "Masa aktif 30 hari",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pembayaran di MyTelkomsel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  buildPaymentOption(
                    value: "Pulsa",
                    label: "Pulsa (Rp $saldo tersedia)",
                    iconPath: "assets/pulsa.png",
                  ),

                  buildPaymentOption(
                    value: "Link Aja",
                    label: "Link Aja",
                    iconPath: "assets/linkaja.png",
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "E-Wallet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  buildPaymentOption(
                    value: "Gopay",
                    label: "Gopay",
                    iconPath: "assets/gopay.png",
                  ),
                  buildPaymentOption(
                    value: "Ovo",
                    label: "OVO",
                    iconPath: "assets/ovo.png",
                  ),

                  buildPaymentOption(
                    value: "Link Aja",
                    label: "Link Aja",
                    iconPath: "assets/linkaja.png",
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Rp85.000",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  _showDialog(context);
                },
                child: Text(
                  "KONFIRMASI & BAYAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Sedang Diproses"),
        content: Text(
          "Transaksi berhasil menggunakan ${_methodName(selectedMethod)}! Terima kasih, permintaan anda sedang diproses.",
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/beranda'),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentOption({
    required String value,
    required String label,
    required String iconPath,
  }) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedMethod,
      activeColor: Theme.of(context).primaryColor,
      onChanged: (val) {
        setState(() => selectedMethod = val);
      },
      title: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }

  String _methodName(String? value) {
    switch (value) {
      case "pulsa":
        return "Pulsa";
      case "gopay":
        return "Gopay";
      case "ovo":
        return "OVO";
      case "cc":
        return "Kartu Kredit/Debit";
      default:
        return "";
    }
  }
}
