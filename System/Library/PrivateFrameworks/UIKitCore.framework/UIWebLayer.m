@implementation UIWebLayer

- (void)setNeedsLayout
{
  objc_super v2;

  if (!self->_layoutsSuspended)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebLayer;
    -[UIWebLayer setNeedsLayout](&v2, sel_setNeedsLayout);
  }
}

- (void)setLayoutsSuspended:(BOOL)a3
{
  self->_layoutsSuspended = a3;
}

@end
