@implementation PXGEmptyTexture

- (CGSize)pixelSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)presentationType
{
  return 0;
}

- (int64_t)estimatedByteSize
{
  return 0;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

@end
