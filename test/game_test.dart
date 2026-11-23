import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bayraklar_bilgi_oyunu/oyun_bayraklar_bilgi_oyunu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bayraklarConfig.title.length, 33);
    expect(bayraklarConfig.tagline.length, 33);
    for (final s in bayraklarConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(bayraklarConfig.gameId, bayraklarId);
    expect(bayraklarRules.gameId, bayraklarId);
    expect(bayraklarConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bayraklarRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bayraklarId, optionalMechanics: bayraklarRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bayraklarRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
