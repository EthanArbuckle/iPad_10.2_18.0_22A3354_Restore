@implementation UIStatusBarManager

- (double)bc_defaultPortraitStatusBarHeight
{
  double result;

  -[UIStatusBarManager defaultStatusBarHeightInOrientation:](self, "defaultStatusBarHeightInOrientation:", 1);
  return result;
}

@end
