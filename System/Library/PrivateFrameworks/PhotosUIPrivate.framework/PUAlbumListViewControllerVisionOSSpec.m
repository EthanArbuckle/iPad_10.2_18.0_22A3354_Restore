@implementation PUAlbumListViewControllerVisionOSSpec

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = PUPixelSizeFromPointSize(224.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)stackSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 224.0;
  v3 = 224.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)posterSquareCornerRadius
{
  return 8.0;
}

- (double)posterSubitemCornerRadius
{
  return 8.0;
}

- (double)cellBackgroundCornerRadius
{
  return 16.0;
}

@end
