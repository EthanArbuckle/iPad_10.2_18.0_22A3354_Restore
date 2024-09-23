@implementation ISDelayedInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  objc_msgSend(a3, "retainArguments");
  objc_msgSend(a3, "performSelector:withObject:afterDelay:", sel_invoke, 0, self->_delayInterval);
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (void)setDelayInterval:(double)a3
{
  self->_delayInterval = a3;
}

@end
