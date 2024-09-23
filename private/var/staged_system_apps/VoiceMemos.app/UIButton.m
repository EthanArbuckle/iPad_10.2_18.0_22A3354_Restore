@implementation UIButton

- (void)rc_setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  -[UIButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v5 = 0.2;
  if (v3)
    v5 = 1.0;
  -[UIButton setAlpha:](self, "setAlpha:", v5);
}

@end
