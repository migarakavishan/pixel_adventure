import 'dart:async';

import 'package:flame/components.dart';

class Chicken extends SpriteAnimationComponent {
  final double offNeg;
  final double offPos;
  Chicken({
    super.position,
    super.size,
    this.offNeg = 0,
    this.offPos = 0,
  });

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    return super.onLoad();
  }
}
