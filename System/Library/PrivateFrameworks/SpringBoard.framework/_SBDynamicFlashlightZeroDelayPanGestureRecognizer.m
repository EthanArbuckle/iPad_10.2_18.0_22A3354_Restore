@implementation _SBDynamicFlashlightZeroDelayPanGestureRecognizer

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBDynamicFlashlightZeroDelayPanGestureRecognizer;
  return -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer _shouldTryToBeginWithEvent:](&v4, sel__shouldTryToBeginWithEvent_, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBDynamicFlashlightZeroDelayPanGestureRecognizer;
  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (!-[_SBDynamicFlashlightZeroDelayPanGestureRecognizer state](self, "state"))
    -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer setState:](self, "setState:", 1);
}

@end
