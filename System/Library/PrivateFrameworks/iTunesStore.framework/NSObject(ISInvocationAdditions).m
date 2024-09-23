@implementation NSObject(ISInvocationAdditions)

- (ISMainThreadInvocationRecorder)blockingMainThreadProxy
{
  ISMainThreadInvocationRecorder *v1;

  v1 = -[ISInvocationRecorder initWithTarget:]([ISMainThreadInvocationRecorder alloc], "initWithTarget:", a1);
  -[ISMainThreadInvocationRecorder setWaitUntilDone:](v1, "setWaitUntilDone:", 1);
  return v1;
}

- (ISDelayedInvocationRecorder)delayedProxy:()ISInvocationAdditions
{
  ISDelayedInvocationRecorder *v3;

  v3 = -[ISInvocationRecorder initWithTarget:]([ISDelayedInvocationRecorder alloc], "initWithTarget:", a1);
  -[ISDelayedInvocationRecorder setDelayInterval:](v3, "setDelayInterval:", a2);
  return v3;
}

- (ISMainThreadInvocationRecorder)mainThreadProxy
{
  return -[ISInvocationRecorder initWithTarget:]([ISMainThreadInvocationRecorder alloc], "initWithTarget:", a1);
}

@end
