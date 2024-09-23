@implementation MCDTallCell

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 56.0;
  result.height = v3;
  return result;
}

- (CGSize)sizeForArtwork
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
