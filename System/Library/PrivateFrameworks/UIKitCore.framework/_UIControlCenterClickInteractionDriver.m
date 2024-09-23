@implementation _UIControlCenterClickInteractionDriver

- (_UIControlCenterClickInteractionDriver)init
{
  _UIControlCenterClickInteractionDriver *v2;
  _UIControlCenterClickInteractionDriver *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIControlCenterClickInteractionDriver;
  v2 = -[_UILongPressClickInteractionDriver init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UILongPressClickInteractionDriver primaryGestureRecognizer](v2, "primaryGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMinimumDurationRequired:", 0.0);
    objc_msgSend(v4, "_setKeepTouchesOnContinuation:", 1);
    -[_UILongPressClickInteractionDriver setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", objc_msgSend((id)objc_opt_class(), "prefersCancelsTouchesInView"));

  }
  return v3;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 0;
}

- (double)clickDownDuration
{
  int v2;
  double result;

  v2 = _AXSForceTouchTimeDuration();
  result = dbl_18667AE20[v2 == 1];
  if (!v2)
    return 0.5;
  return result;
}

@end
