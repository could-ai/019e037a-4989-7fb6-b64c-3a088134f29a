class Member {
  final String name;
  final String role;
  final String description;
  final String emoji;
  final int colorHex;

  const Member({
    required this.name,
    required this.role,
    required this.description,
    required this.emoji,
    required this.colorHex,
  });
}

const List<Member> teamMembers = [
  Member(
    name: "Dr. Kaffeemaschine",
    role: "Chief Caffeine Officer",
    description: "Läuft nur mit Premium-Bohnen. Hat noch nie vor 10 Uhr gelächelt.",
    emoji: "☕",
    colorHex: 0xFFFFA07A, // Light Salmon
  ),
  Member(
    name: "Bug Magnet",
    role: "Senior Code Breaker",
    description: "Findet Fehler, indem er einfach nur auf den Bildschirm starrt. Features werden bei ihm zu Überraschungen.",
    emoji: "🐛",
    colorHex: 0xFF98FB98, // Pale Green
  ),
  Member(
    name: "Ninja Coder",
    role: "Stealth Developer",
    description: "Schreibt Code im Dunkeln. Commits passieren meistens zwischen 2 und 4 Uhr morgens.",
    emoji: "🥷",
    colorHex: 0xFF87CEFA, // Light Sky Blue
  ),
  Member(
    name: "Chaos Koordinator",
    role: "Projektmanager",
    description: "Versucht, Katzen zu hüten. Bewaffnet mit Post-its und einem gefährlichen Optimismus.",
    emoji: "🌪️",
    colorHex: 0xFFFFD700, // Gold
  ),
  Member(
    name: "Snack Inspector",
    role: "Quality Assurance (Food)",
    description: "Testet alle Büro-Snacks auf Knusprigkeit. Sehr streng bei Schokolade.",
    emoji: "🍩",
    colorHex: 0xFFFF69B4, // Hot Pink
  ),
];
