@implementation UIImageView

- (double)firstBaselineFromTop
{
  UIImageView *v2;
  UIImage *v3;
  UIImage *v4;
  double v5;
  double v6;

  v2 = self;
  v3 = -[UIImageView image](v2, "image");
  if (v3)
  {
    v4 = v3;
    -[UIImage size](v3, "size");
    v6 = v5;

  }
  else
  {

    return 0.0;
  }
  return v6;
}

@end
