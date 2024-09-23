@implementation _VUISBIconProgressLoadingNoneStateTransition

- (void)_updateView:(id)a3
{
  double v5;
  double v6;
  double fraction;
  double v8;
  float v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_VUISBIconProgressLoadingNoneStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v10, sel__updateView_);
  objc_msgSend(a3, "bounds");
  UIRectGetCenter();
  UIDistanceBetweenPoints();
  v6 = v5;
  objc_msgSend(a3, "setBackgroundAlpha:", 1.0);
  fraction = self->super._fraction;
  if (self->super._fromState == 2)
  {
    objc_msgSend(a3, "setForegroundAlpha:", 1.0 - fraction);
    v8 = self->super._fraction;
  }
  else
  {
    objc_msgSend(a3, "setForegroundAlpha:", fraction);
    v8 = 1.0 - self->super._fraction;
  }
  v9 = v6;
  objc_msgSend(a3, "setCircleRadiusFraction:", v8 * (ceilf(v9 / 36.0) + -1.0) + 1.0);
  objc_msgSend(a3, "setNeedsDisplay");
}

@end
