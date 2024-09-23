@implementation UISoftwareDimmingWindow

- (UISoftwareDimmingWindow)initWithFrame:(CGRect)a3
{
  UISoftwareDimmingWindow *v3;
  UISoftwareDimmingWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISoftwareDimmingWindow;
  v3 = -[UIWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIWindow setWindowLevel:](v3, "setWindowLevel:", 2150.0);
    -[UIView setAlpha:](v4, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UISoftwareDimmingWindow updateOverlayColor](v4, "updateOverlayColor");
  }
  return v4;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void)updateOverlayColor
{
  int v3;
  double v4;
  id v5;

  v3 = _AXSInvertColorsEnabled();
  v4 = 1.0;
  if (!v3)
    v4 = 0.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setOverlayLevel:(float)a3
{
  double v6;
  void *v7;

  v6 = a3;
  if (a3 < -1.0 || a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScreen.m"), 281, CFSTR("%f is not a valid overlay level value"), *(_QWORD *)&v6);

  }
  self->_overlayLevel = a3;
  -[UIView setAlpha:](self, "setAlpha:", -v6);
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintSoftwareDimming");
}

- (float)overlayLevel
{
  return self->_overlayLevel;
}

@end
