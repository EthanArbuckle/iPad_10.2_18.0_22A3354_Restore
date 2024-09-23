@implementation UIStatusBarNewUIDoubleHeightStyleAttributes

- (double)heightForMetrics:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 40.0;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarNewUIDoubleHeightStyleAttributes;
  -[UIStatusBarStyleAttributes heightForMetrics:](&v6, sel_heightForMetrics_);
  return result;
}

- (BOOL)isDoubleHeight
{
  return 1;
}

@end
