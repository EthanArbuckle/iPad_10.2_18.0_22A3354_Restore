@implementation _LTDContinuationOperation

- (_LTDContinuationOperation)initWithGroupID:(id)a3 delegate:(id)a4 continuationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTDContinuationOperation *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *groupID;
  _LTDContinuationOperation *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_LTDContinuationOperation;
  v11 = -[NSBlockOperation init](&v27, sel_init);
  if (v11)
  {
    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_LTDContinuationOperation initWithGroupID:delegate:continuationBlock:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_delegate, v9);
    v19 = objc_msgSend(v8, "copy");
    groupID = v11->_groupID;
    v11->_groupID = (NSString *)v19;

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke;
    v23[3] = &unk_251A11A98;
    objc_copyWeak(&v25, &location);
    v24 = v10;
    -[NSBlockOperation addExecutionBlock:](v11, "addExecutionBlock:", v23);
    v21 = v11;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

+ (id)continuationOperationWithGroupID:(id)a3 delegate:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  _LTDContinuationOperation *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_LTDContinuationOperation initWithGroupID:delegate:continuationBlock:]([_LTDContinuationOperation alloc], "initWithGroupID:delegate:continuationBlock:", v9, v8, v7);

  return v10;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "Continuation operation dealloc: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (BOOL)isAsynchronous
{
  _LTDContinuationOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isAsynchronous;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAsynchronous:(BOOL)a3
{
  if (-[_LTDContinuationOperation isAsynchronous](self, "isAsynchronous") != a3)
  {
    -[_LTDContinuationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isAsynchronous"));
    os_unfair_lock_lock(&self->_lock);
    self->_isAsynchronous = a3;
    os_unfair_lock_unlock(&self->_lock);
    -[_LTDContinuationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isAsynchronous"));
  }
}

- (BOOL)isCancelled
{
  _LTDContinuationOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCancelled:(BOOL)a3
{
  if (-[_LTDContinuationOperation isCancelled](self, "isCancelled") != a3)
  {
    -[_LTDContinuationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCancelled"));
    os_unfair_lock_lock(&self->_lock);
    self->_isCancelled = a3;
    os_unfair_lock_unlock(&self->_lock);
    -[_LTDContinuationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCancelled"));
  }
}

- (BOOL)isFinished
{
  _LTDContinuationOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  if (-[_LTDContinuationOperation isFinished](self, "isFinished") != a3)
  {
    -[_LTDContinuationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    os_unfair_lock_lock(&self->_lock);
    self->_isFinished = a3;
    os_unfair_lock_unlock(&self->_lock);
    -[_LTDContinuationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)start
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "Continuation operation start: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)cancel
{
  if (!-[_LTDContinuationOperation isCancelled](self, "isCancelled"))
  {
    -[_LTDContinuationOperation setCancelled:](self, "setCancelled:", 1);
    -[_LTDContinuationOperation setFinished:](self, "setFinished:", 1);
  }
}

- (double)operationTimeout
{
  return self->_operationTimeout;
}

- (void)setOperationTimeout:(double)a3
{
  self->_operationTimeout = a3;
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (_LTDContinuationOperationDelegate)delegate
{
  return (_LTDContinuationOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (void)initWithGroupID:(uint64_t)a3 delegate:(uint64_t)a4 continuationBlock:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "Continuation operation initialized: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
