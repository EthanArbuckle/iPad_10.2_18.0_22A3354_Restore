@implementation _SBIconProgressWaitingLoadingStateTransition

- (void)_updateView:(id)a3
{
  id v4;
  double fraction;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SBIconProgressWaitingLoadingStateTransition;
  -[_SBIconProgressStateTransition _updateView:](&v6, sel__updateView_, v4);
  objc_msgSend(v4, "setBackgroundAlpha:", 1.0);
  objc_msgSend(v4, "setForegroundAlpha:", 1.0);
  fraction = self->super._fraction;
  if (self->super._fromState != 1)
    fraction = 1.0 - fraction;
  objc_msgSend(v4, "setCircleRadiusFraction:", fraction);
  objc_msgSend(v4, "circleBoundingRect");
  objc_msgSend(v4, "setNeedsDisplayInRect:");

}

@end
