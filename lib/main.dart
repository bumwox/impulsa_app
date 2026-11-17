import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ImpulsaApp());
}

class ImpulsaApp extends StatelessWidget {
  const ImpulsaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Impulsa',
      debugShowCheckedModeBanner: false,
      home: PrototypeScreen(),
    );
  }
}

/// Muestra el prototipo de Impulsa (assets/index.html) a pantalla completa.
class PrototypeScreen extends StatefulWidget {
  const PrototypeScreen({super.key});

  @override
  State<PrototypeScreen> createState() => _PrototypeScreenState();
}

class _PrototypeScreenState extends State<PrototypeScreen> {
  late final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xFFFAFAF6))
    ..loadFlutterAsset('assets/index.html');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF6),
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
