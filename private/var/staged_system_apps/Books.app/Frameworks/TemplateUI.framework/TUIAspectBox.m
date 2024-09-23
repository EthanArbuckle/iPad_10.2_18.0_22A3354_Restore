@implementation TUIAspectBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIAspectLayout, a2);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

@end
