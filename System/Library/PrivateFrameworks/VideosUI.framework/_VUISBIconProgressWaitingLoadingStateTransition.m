@implementation _VUISBIconProgressWaitingLoadingStateTransition

- (void)_updateView:(id)a3
{
  double fraction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VUISBIconProgressWaitingLoadingStateTransition;
  -[_VUISBInstallProgressStateTransition _updateView:](&v6, sel__updateView_);
  objc_msgSend(a3, "setBackgroundAlpha:", 1.0);
  objc_msgSend(a3, "setForegroundAlpha:", 1.0);
  fraction = self->super._fraction;
  if (self->super._fromState != 1)
    fraction = 1.0 - fraction;
  objc_msgSend(a3, "setCircleRadiusFraction:", fraction);
  objc_msgSend(a3, "circleBoundingRect");
  objc_msgSend(a3, "setNeedsDisplayInRect:");
}

@end
