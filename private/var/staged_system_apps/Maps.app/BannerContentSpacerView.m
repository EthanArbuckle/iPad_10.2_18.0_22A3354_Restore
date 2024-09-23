@implementation BannerContentSpacerView

- (BannerContentSpacerView)initWithFrame:(CGRect)a3
{
  BannerContentSpacerView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BannerContentSpacerView;
  result = -[BannerContentSpacerView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_axis = -1;
  return result;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (double)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(double)a3
{
  self->_minLength = a3;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

@end
