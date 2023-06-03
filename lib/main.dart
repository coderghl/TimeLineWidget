import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Line Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text("Time Line Widget"),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return TimeLineWidget(
              isLast: index == 7,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: index == 4
                    ? Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title $index",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            "SubTitle $index",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
    this.isLast = false,
    required this.child,
  });
  final bool isLast;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade700,
                ),
              ),
              if (isLast)
                const SizedBox.shrink()
              else
                Expanded(
                  child: Container(
                    width: .5,
                    color: Colors.green.shade500,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(child: child),
        ],
      ),
    );
  }
}
