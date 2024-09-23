@implementation _UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (void)setContentScaleFactor:(double)a3
{
  objc_super v4;

  if (a3 == 0.0)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    if (!self)
      a3 = 0.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView;
  -[UIView setContentScaleFactor:](&v4, sel_setContentScaleFactor_, a3);
}

@end
