@implementation _SBHIconStyleLabelHidingSegmentedControl

- (_SBHIconStyleLabelHidingSegmentedControl)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBHIconStyleLabelHidingSegmentedControl;
  return -[_SBHIconStyleLabelHidingSegmentedControl initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)_SBHIconStyleLabelHidingSegmentedControl;
  -[_SBHIconStyleLabelHidingSegmentedControl intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v4 = v3 + 60.0;
  result.height = v2;
  result.width = v4;
  return result;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 16.0;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 2.0;
}

@end
