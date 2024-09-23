@implementation WFStatusBarStyleViewController

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

@end
