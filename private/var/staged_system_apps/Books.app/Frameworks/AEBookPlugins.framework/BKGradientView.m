@implementation BKGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAGradientLayer);
}

- (id)color
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colors"));

  return v3;
}

- (void)setColors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v5, "setColors:", v4);

}

- (NSArray)colors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colors"));

  return (NSArray *)v3;
}

- (NSArray)locations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locations"));

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v5, "setLocations:", v4);

}

- (CGPoint)startPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v2, "startPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v5, "setStartPoint:", x, y);

}

- (CGPoint)endPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v2, "endPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKGradientView layer](self, "layer"));
  objc_msgSend(v5, "setEndPoint:", x, y);

}

@end
