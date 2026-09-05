// lib/features/face_engine/domain/face_config.dart
class FaceConfig {
  // Coordenadas normalizadas del panel negro (0.0 a 1.0)
  static const double centerX = 0.5;
  static const double centerY = 0.5;

  // Ajustes proporcionales basados en el robot
  static const double eyeSeparation = 0.22; // Muy juntos
  static const double eyeY = 0.45; // Ligeramente arriba del centro
  static const double mouthY = 0.75; // Justo debajo de los ojos
  static const double eyebrowY = 0.15; // Espacio para las cejas arriba

  // OJOS (Gigantes)
  static Layer leftEye() {
    return Layer(
      id: 'left_eye',
      shapeId: 'robot.eye',
      transform: LayerTransform(
        translation: Offset(centerX - eyeSeparation, eyeY),
        scaleX: 1.8, // Escala masiva para igualar el tamaño
        scaleY: 1.8,
        rotation: 0.0,
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 10,
      opacity: 1.0,
    );
  }

  static Layer rightEye() {
    return Layer(
      id: 'right_eye',
      shapeId: 'robot.eye',
      transform: LayerTransform(
        translation: Offset(centerX + eyeSeparation, eyeY),
        scaleX: 1.8,
        scaleY: 1.8,
        rotation: 0.0,
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 10,
      opacity: 1.0,
    );
  }

  // BOCA (Sonrisa pequeña y centrada)
  static Layer mouth() {
    return Layer(
      id: 'mouth',
      shapeId: 'robot.smile',
      transform: LayerTransform(
        translation: Offset(centerX, mouthY),
        scaleX: 0.6, // Pequeña en comparación a los ojos
        scaleY: 0.6,
        rotation: 0.0,
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 15,
      opacity: 1.0,
    );
  }

  // CEJAS (Expresividad adicional)
  static Layer leftEyebrow() {
    return Layer(
      id: 'left_eyebrow',
      shapeId: 'eyebrow.line',
      transform: LayerTransform(
        translation: Offset(centerX - eyeSeparation, eyebrowY),
        scaleX: 1.0,
        scaleY: 1.0,
        rotation: 0.0,
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 20,
      opacity: 1.0,
    );
  }

  static Layer rightEyebrow() {
    return Layer(
      id: 'right_eyebrow',
      shapeId: 'eyebrow.line',
      transform: LayerTransform(
        translation: Offset(centerX + eyeSeparation, eyebrowY),
        scaleX: 1.0,
        scaleY: 1.0,
        rotation: 0.0, // El MathPipeline modificará esto para expresiones
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 20,
      opacity: 1.0,
    );
  }

  // ACCESORIOS: CORAZONES (Para la emoción "enamorado")
  static Layer leftHeart() {
    return Layer(
      id: 'left_heart',
      shapeId: 'accessory.heart',
      transform: LayerTransform(
        // Se superpone exactamente al centro del ojo
        translation: Offset(centerX - eyeSeparation, eyeY),
        scaleX: 1.2,
        scaleY: 1.2,
        rotation: 0.0,
        skewX: 0.0,
        skewY: 0.0,
      ),
      zIndex: 25, // Sobre el ojo
      opacity: 0.0, // Invisible por defecto
    );
  }

  // ... (Repetir rightHeart y Tears con la misma lógica posicional)
}
