@implementation PUTilingViewContentCoordinateSystem

- (id)parentCoordinateSystem
{
  return 0;
}

- (CGPoint)coordinateSystemOrigin
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

@end
