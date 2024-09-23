@implementation SWCrashRetryThrottler

- (BOOL)shouldReloadAfterWebProcessCrash
{
  BOOL v3;

  v3 = -[SWCrashRetryThrottler crashed](self, "crashed");
  if (!v3)
    -[SWCrashRetryThrottler setCrashed:](self, "setCrashed:", 1);
  return !v3;
}

- (unint64_t)retryPolicy
{
  return -[SWCrashRetryThrottler shouldReloadAfterWebProcessCrash](self, "shouldReloadAfterWebProcessCrash") ^ 1;
}

- (BOOL)crashed
{
  return self->_crashed;
}

- (void)setCrashed:(BOOL)a3
{
  self->_crashed = a3;
}

@end
