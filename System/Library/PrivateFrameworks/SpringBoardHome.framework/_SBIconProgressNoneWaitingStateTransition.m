@implementation _SBIconProgressNoneWaitingStateTransition

- (void)_updateView:(id)a3
{
  id v4;
  double fraction;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SBIconProgressNoneWaitingStateTransition;
  -[_SBIconProgressStateTransition _updateView:](&v6, sel__updateView_, v4);
  objc_msgSend(v4, "setCircleRadiusFraction:", 0.0);
  objc_msgSend(v4, "setForegroundAlpha:", 0.0);
  fraction = self->super._fraction;
  if (self->super._fromState)
    fraction = 1.0 - fraction;
  objc_msgSend(v4, "setBackgroundAlpha:", fraction);
  objc_msgSend(v4, "setNeedsDisplay");

}

@end
