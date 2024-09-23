@implementation VUIAsynchronousOperation

- (BOOL)isExecuting
{
  return self->_state == 1;
}

- (BOOL)isFinished
{
  return self->_state == 2;
}

- (void)finishExecutionIfPossible
{
  int *p_state;
  unsigned int v4;

  -[VUIAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[VUIAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  p_state = &self->_state;
  while (1)
  {
    v4 = __ldaxr((unsigned int *)p_state);
    if (v4 != 1)
      break;
    if (!__stlxr(2u, (unsigned int *)p_state))
      goto LABEL_6;
  }
  __clrex();
LABEL_6:
  -[VUIAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[VUIAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)start
{
  int *p_state;

  -[VUIAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  p_state = &self->_state;
  do
  {
    if (__ldaxr((unsigned int *)p_state))
    {
      __clrex();
      -[VUIAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -start method may only be called once."));
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_state));
  -[VUIAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  if (-[VUIAsynchronousOperation isCancelled](self, "isCancelled"))
    -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  else
    -[VUIAsynchronousOperation executionDidBegin](self, "executionDidBegin");
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
