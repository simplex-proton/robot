// lib/features/face_engine/application/animation_engine.dart

Map<String, Layer> calculateLayers(
  EmotionRecipe recipe,
  double time,
  EventScheduler scheduler,
) {
  final layers = <String, Layer>{};

  // 1. RESOLUCIÓN DE CATÁLOGO (Variables base según emoción)
  String eyeShapeId = 'eye.circle';
  String mouthShapeId = 'mouth.smile';
  Color irisColor = FaceColors.cyan;

  double targetEyeScaleY = 1.0;
  double targetEyeScaleX = 1.0;
  double eyeRotationBase = 0.0;
  Offset eyeTranslationOffset = Offset.zero;

  switch (recipe.emotion) {
    case 'happy':
      mouthShapeId = 'mouth.smileBig';
      break;
    case 'sad':
      targetEyeScaleY = 0.5;
      mouthShapeId = 'mouth.frown';
      break;
    case 'angry':
      targetEyeScaleY = 0.6;
      eyeRotationBase = 0.3; // Rotación matemática para simular ceño fruncido
      mouthShapeId = 'mouth.flat';
      irisColor = FaceColors.red;
      break;
    case 'surprised':
      targetEyeScaleX = 1.3;
      targetEyeScaleY = 1.3;
      mouthShapeId = 'mouth.o';
      break;
    case 'love':
      eyeShapeId = 'eye.heart';
      mouthShapeId = 'mouth.smileBig';
      irisColor = FaceColors.pink;
      break;
    case 'excited':
      eyeShapeId = 'eye.star';
      mouthShapeId = 'mouth.smileBig';
      break;
    case 'sleepy':
      targetEyeScaleY = 0.3;
      mouthShapeId = 'mouth.flat';
      irisColor = FaceColors.cyanDim;
      break;
    case 'thoughtful':
      targetEyeScaleY = 0.9;
      eyeTranslationOffset = const Offset(0.05, -0.05); // Mirada hacia un lado
      mouthShapeId = 'mouth.flat';
      break;
  }

  // 2. APLICACIÓN DE MODIFICADORES MATEMÁTICOS (MathPipeline)
  // Evaluamos la transición temporal para suavizar el cambio de escala
  final currentEyeScaleY = mathPipeline.evaluate(
    MotionModifier(
      target: 'scaleY',
      evaluate: (_) => targetEyeScaleY,
      compose: CompositionStrategy.replace,
    ),
    time,
  );

  // 3. CONSTRUCCIÓN DE CAPAS MUTADAS

  // Ojo Izquierdo
  final baseLeftEye = FaceConfig.leftEye();
  layers['left_eye'] = baseLeftEye.copyWith(
    shapeId: eyeShapeId, // Mutación dinámica del vector
    modifiers: {'color': irisColor}, // Pasamos el color dinámico al Painter
    transform: baseLeftEye.transform.copyWith(
      scaleX: targetEyeScaleX,
      scaleY: currentEyeScaleY,
      rotation: eyeRotationBase, // En ángulo positivo
      translation: baseLeftEye.transform.translation + eyeTranslationOffset,
    ),
  );

  // Ojo Derecho (Espejo para la rotación del ceño fruncido)
  final baseRightEye = FaceConfig.rightEye();
  layers['right_eye'] = baseRightEye.copyWith(
    shapeId: eyeShapeId,
    modifiers: {'color': irisColor},
    transform: baseRightEye.transform.copyWith(
      scaleX: targetEyeScaleX,
      scaleY: currentEyeScaleY,
      rotation: -eyeRotationBase, // Negativo para simetría facial en enojo
      translation: baseRightEye.transform.translation + eyeTranslationOffset,
    ),
  );

  // Boca
  layers['mouth'] = FaceConfig.mouth().copyWith(shapeId: mouthShapeId);

  // Pantalla Base
  layers['face_screen'] = FaceConfig.faceScreen();

  // 4. ACCESORIOS Y EXTRAS (Mejillas, Lágrimas)
  _applyAccessories(recipe, layers, time); // (Lógica de lágrimas y mejillas)

  return layers;
}
