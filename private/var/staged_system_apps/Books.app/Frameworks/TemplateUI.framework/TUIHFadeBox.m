@implementation TUIHFadeBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHFadeLayout, a2);
}

- (double)gradientWidth
{
  return self->_gradientWidth;
}

- (void)setGradientWidth:(double)a3
{
  self->_gradientWidth = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

@end
