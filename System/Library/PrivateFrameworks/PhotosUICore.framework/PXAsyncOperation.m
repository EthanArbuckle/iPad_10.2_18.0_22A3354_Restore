@implementation PXAsyncOperation

- (PXAsyncOperation)init
{
  PXAsyncOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAsyncOperation;
  result = -[PXAsyncOperation init](&v3, sel_init);
  if (result)
    result->_stateLock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  os_unfair_lock_s *p_stateLock;
  id v4;

  if (-[PXAsyncOperation isCancelled](self, "isCancelled"))
  {
    NSStringFromSelector(sel_isFinished);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    self->_operationState = 3;
  }
  else
  {
    NSStringFromSelector(sel_isExecuting);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:");
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if (!self->_operationState)
    {
      self->_operationState = 1;
      os_unfair_lock_unlock(&self->_stateLock);
      -[PXAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v4);
      -[PXAsyncOperation px_start](self, "px_start");
      goto LABEL_6;
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  -[PXAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v4);
LABEL_6:

}

- (BOOL)px_shouldWaitForCancel
{
  return 0;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAsyncOperation;
  -[PXAsyncOperation cancel](&v3, sel_cancel);
  if (!-[PXAsyncOperation px_shouldWaitForCancel](self, "px_shouldWaitForCancel"))
    -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");
}

- (BOOL)isExecuting
{
  PXAsyncOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = (v2->_operationState - 1) < 2;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isFinished
{
  PXAsyncOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_operationState == 3;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)px_start
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAsyncOperation.m"), 96, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAsyncOperation px_start]", v6);

  abort();
}

- (void)px_finishIfPossible
{
  os_unfair_lock_s *p_stateLock;
  void *v4;
  id v5;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_operationState == 1)
  {
    self->_operationState = 2;
    os_unfair_lock_unlock(p_stateLock);
    NSStringFromSelector(sel_isExecuting);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_isFinished);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v5);
    -[PXAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v4);
    os_unfair_lock_lock(p_stateLock);
    self->_operationState = 3;
    os_unfair_lock_unlock(p_stateLock);
    -[PXAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v5);
    -[PXAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v4);

  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
}

@end
