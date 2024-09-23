@implementation _VUISBIconProgressNoneWaitingStateTransition

- (void)_updateView:(id)a3
{
  double fraction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VUISBIconProgressNoneWaitingStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v6, sel__updateView_);
  objc_msgSend(a3, "setCircleRadiusFraction:", 0.0);
  objc_msgSend(a3, "setForegroundAlpha:", 0.0);
  fraction = self->super._fraction;
  if (self->super._fromState)
    fraction = 1.0 - fraction;
  objc_msgSend(a3, "setBackgroundAlpha:", fraction);
  objc_msgSend(a3, "setNeedsDisplay");
}

@end
