@implementation PUAvalancheReviewControllerSpec

- (CGSize)selectionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 31.0;
  v3 = 31.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIOffset)selectionBadgeOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = 5.0;
  v3 = 5.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (unint64_t)selectionBadgeCorner
{
  return 8;
}

- (BOOL)allowsInterfaceRotation
{
  return 0;
}

- (double)interItemSpacing
{
  int v2;
  double result;

  v2 = PLIsTallScreen();
  result = 15.0;
  if (v2)
    return 10.0;
  return result;
}

@end
