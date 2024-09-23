@implementation ISMainThreadInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  objc_msgSend(a3, "retainArguments");
  objc_msgSend(a3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, self->_waitUntilDone);
}

- (BOOL)waitUntilDone
{
  return self->_waitUntilDone;
}

- (void)setWaitUntilDone:(BOOL)a3
{
  self->_waitUntilDone = a3;
}

@end
