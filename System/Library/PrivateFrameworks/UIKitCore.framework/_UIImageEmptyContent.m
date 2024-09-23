@implementation _UIImageEmptyContent

- (CGSize)sizeInPixels
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

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (id)typeName
{
  return CFSTR("empty");
}

- (CGSize)size
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

- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5
{
  void *v5;
  void *v6;

  +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  return 0;
}

@end
