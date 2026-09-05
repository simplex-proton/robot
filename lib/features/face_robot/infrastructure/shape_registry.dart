// lib/features/face_engine/infrastructure/shape_registry.dart

void _registerRobotShapes() {
  // Ojo del robot (Círculo brillante)
  _shapes['robot.eye'] = ShapeDefinition(
    id: 'robot.eye',
    bounds: const Rect.fromLTWH(-0.1, -0.1, 0.2, 0.2), // Base simétrica
    type: ShapeType.primitive,
    paint: (Canvas canvas, Paint basePaint) {
      // Efecto de brillo (Glow) usando MaskFilter
      final glowPaint = Paint()
        ..color =
            const Color(0xFF00E5FF) // Cyan brillante
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0)
        ..style = PaintingStyle.fill;

      final corePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset.zero, 0.1, glowPaint);
      // El círculo central un poco más pequeño para dar profundidad
      canvas.drawCircle(
        Offset.zero,
        0.08,
        basePaint..color = const Color(0xFF00BFFF),
      );
    },
  );

  // Boca (Arco sutil blanco)
  _shapes['robot.smile'] = ShapeDefinition(
    id: 'robot.smile',
    bounds: const Rect.fromLTWH(-0.05, -0.025, 0.1, 0.05),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final strokePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth =
            0.015 // Grosor constante
        ..strokeCap = StrokeCap.round;

      final path = Path()
        ..moveTo(-0.05, -0.01)
        ..quadraticBezierTo(0.0, 0.04, 0.05, -0.01);

      canvas.drawPath(path, strokePaint);
    },
  );

  // Corazón (Vector path)
  _shapes['accessory.heart'] = ShapeDefinition(
    id: 'accessory.heart',
    bounds: const Rect.fromLTWH(-0.1, -0.1, 0.2, 0.2),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final heartPaint = Paint()..color = Colors.pinkAccent;
      // SVG path convertido a comandos de Canvas para el corazón
      final path = Path()
        ..moveTo(0.0, 0.05)
        ..cubicTo(0.1, -0.05, 0.2, 0.05, 0.0, 0.15)
        ..cubicTo(-0.2, 0.05, -0.1, -0.05, 0.0, 0.05)
        ..close();
      canvas.drawPath(path, heartPaint);
    },
  );
}
// lib/features/face_engine/infrastructure/shape_registry.dart

void _registerMouthShapes() {
  // mouth.smile (Sonrisa base)
  _shapes['mouth.smile'] = ShapeDefinition(
    id: 'mouth.smile',
    bounds: const Rect.fromLTWH(-0.05, -0.02, 0.1, 0.04),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final path = Path()
        ..moveTo(-0.05, 0)
        ..quadraticBezierTo(0, 0.04, 0.05, 0);
      canvas.drawPath(
        path,
        paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.015,
      );
    },
  );

  // mouth.smileBig (Sonrisa abierta)
  _shapes['mouth.smileBig'] = ShapeDefinition(
    id: 'mouth.smileBig',
    bounds: const Rect.fromLTWH(-0.06, -0.02, 0.12, 0.06),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final path = Path()
        ..moveTo(-0.06, 0)
        ..quadraticBezierTo(0, 0.06, 0.06, 0)
        ..close();
      canvas.drawPath(path, paint..style = PaintingStyle.fill);
    },
  );

  // mouth.frown (Triste)
  _shapes['mouth.frown'] = ShapeDefinition(
    id: 'mouth.frown',
    bounds: const Rect.fromLTWH(-0.05, -0.02, 0.1, 0.04),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final path = Path()
        ..moveTo(-0.05, 0.02)
        ..quadraticBezierTo(0, -0.02, 0.05, 0.02);
      canvas.drawPath(
        path,
        paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.015,
      );
    },
  );

  // mouth.flat (Enojado/Pensativo)
  _shapes['mouth.flat'] = ShapeDefinition(
    id: 'mouth.flat',
    bounds: const Rect.fromLTWH(-0.04, -0.01, 0.08, 0.02),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      final path = Path()
        ..moveTo(-0.04, 0)
        ..lineTo(0.04, 0);
      canvas.drawPath(
        path,
        paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.015,
      );
    },
  );

  // mouth.o (Sorprendido)
  _shapes['mouth.o'] = ShapeDefinition(
    id: 'mouth.o',
    bounds: const Rect.fromLTWH(-0.02, -0.02, 0.04, 0.04),
    type: ShapeType.primitive,
    paint: (Canvas canvas, Paint paint) {
      canvas.drawCircle(Offset.zero, 0.02, paint..style = PaintingStyle.fill);
    },
  );
}

void _registerSpecialEyes() {
  // eye.star (Emocionado)
  _shapes['eye.star'] = ShapeDefinition(
    id: 'eye.star',
    bounds: const Rect.fromLTWH(-0.1, -0.1, 0.2, 0.2),
    type: ShapeType.path,
    paint: (Canvas canvas, Paint paint) {
      // Implementación vectorial de una estrella de 4 o 5 puntas
      // ...
    },
  );
  // eye.heart ya implementado anteriormente
}
