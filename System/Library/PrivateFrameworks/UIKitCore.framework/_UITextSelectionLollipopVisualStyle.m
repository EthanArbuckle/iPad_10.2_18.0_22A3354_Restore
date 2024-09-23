@implementation _UITextSelectionLollipopVisualStyle

- (double)grabberOpacity
{
  return 1.0;
}

- (double)dotSizeWithEngagedEffect:(BOOL)a3
{
  return 16.5;
}

- (double)dotOverlapOffset
{
  return 3.0;
}

- (double)shadowRadius
{
  return 8.0;
}

- (double)shadowOpacity
{
  return 0.3;
}

- (CGSize)shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)stemWidth
{
  return 2.0;
}

+ (id)inferredVisualStyle
{
  return objc_alloc_init(_UITextSelectionLollipopVisualStyle);
}

- (double)minimumStemLength
{
  return 0.0;
}

- (double)smallPaddedInset
{
  return -10.0;
}

- (double)bigPaddedInset
{
  return -30.0;
}

- (BOOL)useGrabberDotsForSelection
{
  return 0;
}

- (CGSize)remoteEffectSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)remoteEffectGroupForOwner:(id)a3
{
  return 0;
}

- (id)dotRemoteEffectsForOwner:(id)a3
{
  return 0;
}

@end
