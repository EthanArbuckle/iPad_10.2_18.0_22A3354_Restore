@implementation UIView

- (double)firstBaselineFromTop
{
  UIView *v2;
  double MaxY;
  CGRect v5;

  v2 = self;
  -[UIView frame](v2, "frame");
  MaxY = CGRectGetMaxY(v5);

  return MaxY;
}

- (double)lastBaselineFromBottom
{
  return 0.0;
}

- (double)lastBaselineMaxY
{
  UIView *v2;
  double MaxY;
  double v4;
  double v5;
  CGRect v7;

  v2 = self;
  -[UIView frame](v2, "frame");
  MaxY = CGRectGetMaxY(v7);
  -[UIView lastBaselineFromBottom](v2, "lastBaselineFromBottom");
  v5 = v4;

  return MaxY - v5;
}

@end
