@implementation _ISAnimatedImageTimerForwardingProxy

- (void)_displayLinkFire:(id)a3
{
  ISAnimatedImageTimer **p_forwardingTarget;
  id v4;
  id WeakRetained;

  p_forwardingTarget = &self->__forwardingTarget;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_forwardingTarget);
  objc_msgSend(WeakRetained, "_animationTimerFired:", v4);

}

- (ISAnimatedImageTimer)_forwardingTarget
{
  return (ISAnimatedImageTimer *)objc_loadWeakRetained((id *)&self->__forwardingTarget);
}

- (void)_setForwardingTarget:(id)a3
{
  objc_storeWeak((id *)&self->__forwardingTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__forwardingTarget);
}

@end
