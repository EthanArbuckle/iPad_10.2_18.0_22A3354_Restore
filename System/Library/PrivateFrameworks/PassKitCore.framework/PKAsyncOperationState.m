@implementation PKAsyncOperationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelActions, 0);
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAsyncOperationState;
  result = -[PKAsyncOperationState init](&v3, sel_init);
  if (result)
  {
    *((_DWORD *)result + 6) = 0;
    *((_DWORD *)result + 2) = 0;
  }
  return result;
}

- (void)_invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *cancelActions;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    cancelActions = self->_cancelActions;
    self->_cancelActions = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_cancel
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *cancelActions;
  os_unfair_lock_s *p_actionLock;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_canceled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_canceled = 1;
    v4 = self->_cancelActions;
    cancelActions = self->_cancelActions;
    self->_cancelActions = 0;

    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      p_actionLock = &self->_actionLock;
      os_unfair_lock_lock(p_actionLock);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v4;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

      os_unfair_lock_unlock(p_actionLock);
    }
  }
}

- (void)addCancelAction:(id)a3
{
  void (**v4)(void);
  os_unfair_lock_s *p_lock;
  NSMutableArray *cancelActions;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void (**aBlock)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_canceled || self->_invalidated)
    {
      os_unfair_lock_unlock(&self->_lock);
      os_unfair_lock_lock(&self->_actionLock);
      aBlock[2]();
      os_unfair_lock_unlock(&self->_actionLock);

    }
    else
    {
      cancelActions = self->_cancelActions;
      if (!cancelActions)
      {
        v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = self->_cancelActions;
        self->_cancelActions = v7;

        cancelActions = self->_cancelActions;
      }
      v9 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](cancelActions, "addObject:", v9);

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (PKAsyncOperationState)init
{

  return 0;
}

- (void)performAction:(id)a3
{
  os_unfair_lock_s *p_actionLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_actionLock = &self->_actionLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_actionLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_actionLock);
  }
}

- (BOOL)isCanceled
{
  PKAsyncOperationState *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

@end
