@implementation SliderLargerHitArea

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[SliderLargerHitArea bounds](self, "bounds", a4);
  v12.origin.x = v6 + -22.0;
  v12.origin.y = v7 + -22.0;
  v12.size.width = v8 + 44.0;
  v12.size.height = v9 + 22.0;
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(v12, v11);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SliderLargerHitArea *v8;
  id v9;
  SliderLargerHitArea *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SliderLargerHitArea pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SliderLargerHitArea;
    v9 = -[SliderLargerHitArea hitTest:withEvent:](&v12, "hitTest:withEvent:", v7, x, y);
    v8 = (SliderLargerHitArea *)objc_claimAutoreleasedReturnValue(v9);
  }
  v10 = v8;

  return v10;
}

@end
