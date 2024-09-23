@implementation SettableIntrinsicSizeView

- (void)setUsesIntrinsicHeightSetting:(BOOL)a3
{
  self->usesIntrinsicHeightSetting = a3;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_intrinsicHeight = a3;
  -[SettableIntrinsicSizeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

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
  v10.super_class = (Class)SettableIntrinsicSizeView;
  -[SettableIntrinsicSizeView intrinsicContentSize](&v10, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  if (-[SettableIntrinsicSizeView usesIntrinsicHeightSetting](self, "usesIntrinsicHeightSetting"))
  {
    -[SettableIntrinsicSizeView intrinsicHeight](self, "intrinsicHeight");
    v6 = v7;
  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

- (BOOL)usesIntrinsicHeightSetting
{
  return self->usesIntrinsicHeightSetting;
}

@end
