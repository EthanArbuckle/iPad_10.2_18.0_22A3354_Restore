@implementation _SBIconProgressLoadingNoneStateTransition

- (void)_updateView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double fraction;
  double v8;
  float v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SBIconProgressLoadingNoneStateTransition;
  -[_SBIconProgressStateTransition _updateView:](&v10, sel__updateView_, v4);
  objc_msgSend(v4, "bounds");
  UIRectGetCenter();
  UIDistanceBetweenPoints();
  v6 = v5;
  objc_msgSend(v4, "setBackgroundAlpha:", 1.0);
  fraction = self->super._fraction;
  if (self->super._fromState == 2)
  {
    objc_msgSend(v4, "setForegroundAlpha:", 1.0 - fraction);
    v8 = self->super._fraction;
  }
  else
  {
    objc_msgSend(v4, "setForegroundAlpha:", fraction);
    v8 = 1.0 - self->super._fraction;
  }
  v9 = v6 / 18.0;
  objc_msgSend(v4, "setCircleRadiusFraction:", v8 * (ceilf(v9) + -1.0) + 1.0);
  objc_msgSend(v4, "setNeedsDisplay");

}

@end
