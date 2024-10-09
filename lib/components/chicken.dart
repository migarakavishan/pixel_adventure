import 'dart:async';
import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum ChickenState { idle, run, hit }

class Chicken extends SpriteAnimationGroupComponent<ChickenState> with HasGameRef<PixelAdventure> {
  final double offNeg;
  final double offPos;

  Chicken({
    super.position,
    super.size,
    this.offNeg = 0,
    this.offPos = 0,
  });

  static const stepTime = 0.05;
  final textureSize = Vector2(32, 34);

  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runAnimation;
  late final SpriteAnimation _hitAnimation;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    _idleAnimation = _spriteAnimation('Idle', 13);
    _runAnimation = _spriteAnimation('Run', 14);
    _hitAnimation = _spriteAnimation('Hit', 15)..loop = false;

    // Set animations map for different states
    animations = {
      ChickenState.idle: _idleAnimation,
      ChickenState.run: _runAnimation,
      ChickenState.hit: _hitAnimation,
    };

    current = ChickenState.idle; // Set initial state
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Enemies/Chicken/$state (32x34).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
  }
}
