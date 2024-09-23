@implementation PUTilingViewFixedCoordinateSystem

- (id)parentCoordinateSystem
{
  void *v2;
  void *v3;

  -[PUTilingViewCoordinateSystem tilingView](self, "tilingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentCoordinateSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)coordinateSystemOrigin
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PUTilingViewCoordinateSystem tilingView](self, "tilingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
