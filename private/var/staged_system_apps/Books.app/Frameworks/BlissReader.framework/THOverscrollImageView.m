@implementation THOverscrollImageView

- (UIView)borderView
{
  return 0;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end
