@implementation WLKAsyncOperation

- (void)start
{
  int *p_state;

  -[WLKAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  p_state = &self->_state;
  do
  {
    if (__ldaxr((unsigned int *)p_state))
    {
      __clrex();
      -[WLKAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -start method may only be called once."));
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_state));
  -[WLKAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  if (-[WLKAsyncOperation isCancelled](self, "isCancelled"))
    -[WLKAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  else
    -[WLKAsyncOperation executionDidBegin](self, "executionDidBegin");
}

- (BOOL)isFinished
{
  return self->_state == 2;
}

- (BOOL)isExecuting
{
  return self->_state == 1;
}

- (void)finishExecutionIfPossible
{
  int *p_state;
  unsigned int v4;

  -[WLKAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
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
  -[WLKAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
