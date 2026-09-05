// En lib/features/face_engine/presentation/face_painter.dart

Color _getColorForLayer(Layer layer) {
  // Si la capa trae un color precalculado en sus modificadores dinámicos, usarlo
  if (layer.modifiers.containsKey('color')) {
    return layer.modifiers['color'] as Color;
  }

  // Fallbacks estáticos según el id
  if (layer.id.contains('eyelid')) return Colors.black.withOpacity(0.3);
  if (layer.id.contains('tear')) return Colors.blue.withOpacity(0.6);
  if (layer.id.contains('cheek')) return FaceColors.blush;

  return Colors.white;
}
