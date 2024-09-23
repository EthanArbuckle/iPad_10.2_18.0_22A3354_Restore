@implementation _UICoversheetClickInteractionDriver

- (_UICoversheetClickInteractionDriver)init
{
  _UICoversheetClickInteractionDriver *v2;
  _UICoversheetClickInteractionDriver *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICoversheetClickInteractionDriver;
  v2 = -[_UILongPressClickInteractionDriver init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UILongPressClickInteractionDriver primaryGestureRecognizer](v2, "primaryGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMinimumDurationRequired:", 0.0);

  }
  return v3;
}

- (double)clickDownDuration
{
  int v2;
  double result;

  v2 = _AXSForceTouchTimeDuration();
  result = 0.2;
  if (v2 == 1)
    result = 0.25;
  if (!v2)
    return 0.5;
  return result;
}

@end
