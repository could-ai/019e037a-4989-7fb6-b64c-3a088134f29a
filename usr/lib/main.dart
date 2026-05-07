import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitglieder Präsentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        fontFamily: 'Comic Sans MS', // Fallback to a fun font if available
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
      },
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.celebration, size: 100, color: Colors.deepOrange),
            const SizedBox(height: 20),
            Text(
              'Willkommen im Team!',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Unsere fantastischen Mitglieder stellen sich vor.',
              style: TextStyle(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SlideScreen()),
                );
              },
              icon: const Icon(Icons.play_arrow, size: 30),
              label: const Text('Präsentation starten', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Member {
  final String name;
  final String role;
  final String funFact;
  final String emoji;
  final Color color;

  const Member({
    required this.name,
    required this.role,
    required this.funFact,
    required this.emoji,
    required this.color,
  });
}

const List<Member> members = [
  Member(
    name: 'Alex',
    role: 'Code-Zauberer',
    funFact: 'Trinkt mehr Kaffee als Wasser. ☕',
    emoji: '🧙‍♂️',
    color: Colors.lightBlueAccent,
  ),
  Member(
    name: 'Bella',
    role: 'Design-Königin',
    funFact: 'Kann ein Logo in 5 Minuten zeichnen. 🎨',
    emoji: '👑',
    color: Colors.pinkAccent,
  ),
  Member(
    name: 'Charlie',
    role: 'Chaos-Manager',
    funFact: 'Findet immer den einen Bug, den niemand sonst sieht. 🐛',
    emoji: '🕵️',
    color: Colors.greenAccent,
  ),
];

class SlideScreen extends StatefulWidget {
  const SlideScreen({super.key});

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: members.length + 1, // +1 for the end screen
            itemBuilder: (context, index) {
              if (index < members.length) {
                final member = members[index];
                return Container(
                  color: member.color.withOpacity(0.3),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                member.emoji,
                                style: const TextStyle(fontSize: 100),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                member.name,
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: member.color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  member.role,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Fun Fact:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                member.funFact,
                                style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  color: Colors.purpleAccent.shade100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('🎉', style: TextStyle(fontSize: 100)),
                        const SizedBox(height: 20),
                        const Text(
                          'Das war\'s!',
                          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Danke für die Aufmerksamkeit!',
                          style: TextStyle(fontSize: 24, color: Colors.white70),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const IntroScreen()),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Nochmal von vorn'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.black54),
              onPressed: () {
                _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 40, color: Colors.black54),
              onPressed: () {
                _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
            ),
          ),
        ],
      ),
    );
  }
}
