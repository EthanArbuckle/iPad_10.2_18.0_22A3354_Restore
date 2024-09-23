@implementation RCTimeLabel

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)RCTimeLabel;
  -[RCTimeLabel intrinsicContentSize](&v10, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  if (-[RCTimeLabel usesIntrinsicHeightSetting](self, "usesIntrinsicHeightSetting"))
  {
    -[RCTimeLabel intrinsicHeight](self, "intrinsicHeight");
    v6 = v7;
  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)usesIntrinsicHeightSetting
{
  return self->usesIntrinsicHeightSetting;
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

- (void)setUsesIntrinsicHeightSetting:(BOOL)a3
{
  self->usesIntrinsicHeightSetting = a3;
}

- (void)setLabelYOffset:(double)a3
{
  self->_labelYOffset = a3;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_intrinsicHeight = a3;
  -[RCTimeLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (double)labelYOffset
{
  return self->_labelYOffset;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCTimeLabel labelYOffset](self, "labelYOffset");
  v9.receiver = self;
  v9.super_class = (Class)RCTimeLabel;
  -[RCTimeLabel drawTextInRect:](&v9, "drawTextInRect:", x, y - v8, width, height);
}

@end
