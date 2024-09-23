@implementation _UIAsyncInvocation

+ (_UIAsyncInvocation)invocationWithBlock:(id)a3
{
  id v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *v5;
  uint64_t v6;
  id invocationBlock;
  _UIAsyncInvocation *v8;

  v3 = a3;
  v4 = objc_alloc_init(_UIAsyncInvocation);
  v5 = v4;
  if (v4)
  {
    atomic_store(0, (unint64_t *)&v4->_invokeCallCount);
    atomic_store(0, (unsigned __int8 *)&v4->_invocationBlockHasBeenCalled);
    atomic_store(0, (unint64_t *)&v4->_observer);
    v6 = objc_msgSend(v3, "copy");
    invocationBlock = v5->_invocationBlock;
    v5->_invocationBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)invoke
{
  int64_t *p_invokeCallCount;
  unint64_t v4;
  unint64_t *p_observer;
  _UIAsyncInvocationObserver *v7;
  BOOL *p_invocationBlockHasBeenCalled;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  id v13;
  unint64_t v14;
  _QWORD block[5];

  p_invokeCallCount = &self->_invokeCallCount;
  do
    v4 = __ldaxr((unint64_t *)p_invokeCallCount);
  while (__stlxr(v4 + 1, (unint64_t *)p_invokeCallCount));
  p_observer = (unint64_t *)&self->_observer;
  if (!atomic_load((unint64_t *)&self->_observer))
  {
    v7 = objc_alloc_init(_UIAsyncInvocationObserver);
    while (!__ldaxr(p_observer))
    {
      if (!__stlxr((unint64_t)v7, p_observer))
        goto LABEL_9;
    }
    __clrex();
    CFRelease(v7);
  }
LABEL_9:
  p_invocationBlockHasBeenCalled = &self->_invocationBlockHasBeenCalled;
  do
    v10 = __ldaxr((unsigned __int8 *)p_invocationBlockHasBeenCalled);
  while (__stlxr(1u, (unsigned __int8 *)p_invocationBlockHasBeenCalled));
  if ((v10 & 1) == 0)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28___UIAsyncInvocation_invoke__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(v11, block);

  }
  v12 = (void *)atomic_load(p_observer);
  v13 = objc_retainAutorelease(v12);
  do
    v14 = __ldaxr((unint64_t *)p_invokeCallCount);
  while (__stlxr(v14 - 1, (unint64_t *)p_invokeCallCount));
  return v13;
}

- (void)dealloc
{
  const void *v3;
  unint64_t v5;
  void *v6;
  objc_super v7;

  v3 = (const void *)atomic_load((unint64_t *)&self->_observer);
  if (v3)
  {
    v5 = atomic_load((unint64_t *)&self->_invokeCallCount);
    CFRelease(v3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAsyncInvocation.m"), 77, CFSTR("Attempting to deallocate _UIAsyncInvocation<%p> while still invoking!  invoke count: %li"), self, v5);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIAsyncInvocation;
  -[_UIAsyncInvocation dealloc](&v7, sel_dealloc);
}

+ (id)emptyInvocation
{
  return (id)objc_msgSend((id)objc_opt_class(), "invocationWithBlock:", &__block_literal_global_618);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invocationBlock, 0);
}

@end
