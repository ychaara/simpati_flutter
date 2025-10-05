import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  bool agree = false;
  String? errorMessage;

  Future<void> _saveNomor(String nomor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nomorHp', nomor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 160.w,
                height: 160.h,
                padding: EdgeInsets.all(16.w),
                child: Image.asset("assets/Layer.png", fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Silahkan masuk dengan nomor telkomsel kamu",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: phoneController,
              onChanged: (_) {
                if (errorMessage != null) {
                  setState(() => errorMessage = null);
                }
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Nomor HP",
                errorText: errorMessage,
                border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Checkbox(
                  value: agree,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    setState(() => agree = val ?? false);
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Saya menyetujui ",
                      style: TextStyle(fontSize: 12.sp),
                      children: [
                        TextSpan(
                          text: "syarat, ketentuan",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: ", dan "),
                        TextSpan(
                          text: "privasi",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: " Telkomsel"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: agree
                    ? () async {
                        String nomor = phoneController.text.trim();
                        if (nomor.isEmpty) {
                          setState(() =>
                              errorMessage = "Nomor HP tidak boleh kosong");
                          return;
                        }
                        await _saveNomor(nomor);
                        Navigator.pushReplacementNamed(
                          context,
                          '/beranda'
                        );
                      }
                    : null,
                child: Text(
                  "MASUK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Atau masuk menggunakan",
              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _socialButton(
                    "assets/facebook.png",
                    "Facebook",
                    const Color(0xFF1877F2),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _socialButton(
                    "assets/twitter.png",
                    "Twitter",
                    const Color(0xFF1DA1F2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(String asset, String text, Color color) {
    return SizedBox(
      height: 45.h,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          side: BorderSide(color: color, width: 1.5),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        icon: Image.asset(asset, width: 20.w, height: 20.h),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
