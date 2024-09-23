@implementation UIKeyboardTaskExecutionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong(&self->_info, 0);
  objc_storeStrong(&self->_pendingCompletionBlock, 0);
  objc_storeStrong(&self->_continuation, 0);
  objc_storeStrong((id *)&self->_parentExecutionContext, 0);
}

- (void)transferExecutionToMainThreadWithTask:(id)a3
{
  UIKeyboardTaskExecutionContext *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKeyboardTaskQueue executionContext](self->_executionQueue, "executionContext");
  v5 = (UIKeyboardTaskExecutionContext *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 219, CFSTR("Received %s when not the current execution context."), "-[UIKeyboardTaskExecutionContext transferExecutionToMainThreadWithTask:]");

  }
  -[UIKeyboardTaskQueue performTaskOnMainThread:waitUntilDone:](self->_executionQueue, "performTaskOnMainThread:waitUntilDone:", v7, 0);

}

- (id)childWithContinuation:(id)a3
{
  id v5;
  NSObject *v6;
  UIKeyboardTaskExecutionContext *v7;
  UIKeyboardTaskExecutionContext *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (pthread_main_np() != 1)
  {
    _UIKeyboardTaskQueueLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[UIKeyboardTaskExecutionContext childWithContinuation:]";
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%s should probably only be called from the main thread.", buf, 0xCu);
    }

  }
  -[UIKeyboardTaskQueue executionContext](self->_executionQueue, "executionContext");
  v7 = (UIKeyboardTaskExecutionContext *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 176, CFSTR("Received %s when not the current execution context."), "-[UIKeyboardTaskExecutionContext childWithContinuation:]");

  }
  v8 = -[UIKeyboardTaskExecutionContext initWithParentContext:continuation:]([UIKeyboardTaskExecutionContext alloc], "initWithParentContext:continuation:", self, v5);

  -[UIKeyboardTaskQueue setExecutionContext:](self->_executionQueue, "setExecutionContext:", v8);
  return v8;
}

- (void)returnExecutionToParentWithInfo:(id)a3
{
  id v5;
  NSObject *v6;
  UIKeyboardTaskExecutionContext *v7;
  UIKeyboardTaskExecutionContext *parentExecutionContext;
  UIKeyboardTaskExecutionContext *v9;
  UIKeyboardTaskQueue *executionQueue;
  UIKeyboardTaskExecutionContext *v11;
  UIKeyboardTaskQueue *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (pthread_main_np() != 1)
  {
    _UIKeyboardTaskQueueLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[UIKeyboardTaskExecutionContext returnExecutionToParentWithInfo:]";
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%s should probably only be called from the main thread.", buf, 0xCu);
    }

  }
  -[UIKeyboardTaskQueue executionContext](self->_executionQueue, "executionContext");
  v7 = (UIKeyboardTaskExecutionContext *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardTaskQueue.m"), 195, CFSTR("Received %s when not the current execution context."), "-[UIKeyboardTaskExecutionContext returnExecutionToParentWithInfo:]");

  }
  parentExecutionContext = self->_parentExecutionContext;
  if (parentExecutionContext)
  {
    v9 = self;
    -[UIKeyboardTaskExecutionContext setInfo:](parentExecutionContext, "setInfo:", v5);
    -[UIKeyboardTaskQueue setExecutionContext:](self->_executionQueue, "setExecutionContext:", self->_parentExecutionContext);
    (*((void (**)(void))v9->_continuation + 2))();
  }
  else
  {
    executionQueue = self->_executionQueue;
    v11 = self;
    -[UIKeyboardTaskQueue finishExecution](executionQueue, "finishExecution");
  }
  v12 = self->_executionQueue;
  self->_executionQueue = 0;

}

- (void)setInfo:(id)a3
{
  objc_storeStrong(&self->_info, a3);
}

- (UIKeyboardTaskExecutionContext)initWithParentContext:(id)a3 continuation:(id)a4
{
  id v7;
  id v8;
  UIKeyboardTaskExecutionContext *v9;
  uint64_t v10;
  UIKeyboardTaskQueue *executionQueue;
  uint64_t v12;
  id continuation;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardTaskExecutionContext;
  v9 = -[UIKeyboardTaskExecutionContext init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "executionQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    executionQueue = v9->_executionQueue;
    v9->_executionQueue = (UIKeyboardTaskQueue *)v10;

    objc_storeStrong((id *)&v9->_parentExecutionContext, a3);
    v12 = objc_msgSend(v8, "copy");
    continuation = v9->_continuation;
    v9->_continuation = (id)v12;

  }
  return v9;
}

- (UIKeyboardTaskQueue)executionQueue
{
  return self->_executionQueue;
}

- (UIKeyboardTaskExecutionContext)initWithExecutionQueue:(id)a3
{
  id v5;
  UIKeyboardTaskExecutionContext *v6;
  UIKeyboardTaskExecutionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardTaskExecutionContext;
  v6 = -[UIKeyboardTaskExecutionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_executionQueue, a3);

  return v7;
}

- (void)returnExecutionToParent
{
  -[UIKeyboardTaskExecutionContext returnExecutionToParentWithInfo:](self, "returnExecutionToParentWithInfo:", 0);
}

- (UIKeyboardTaskExecutionContext)init
{
  UIKeyboardTaskExecutionContext *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardTaskExecutionContext;
  v3 = -[UIKeyboardTaskExecutionContext init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("UIKeyboardTaskQueue.m"), 136, CFSTR("Only UIKeyboardTaskQueue may create UIKeyboardTaskExecutionContext instances."));

  return v3;
}

- (void)setPendingCompletionBlock:(id)a3
{
  UIKeyboardTaskExecutionContext *v4;
  uint64_t v5;
  id pendingCompletionBlock;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  pendingCompletionBlock = v4->_pendingCompletionBlock;
  v4->_pendingCompletionBlock = (id)v5;

  objc_sync_exit(v4);
}

- (id)takeOwnershipOfPendingCompletionBlock
{
  UIKeyboardTaskExecutionContext *v2;
  void *v3;
  id pendingCompletionBlock;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_pendingCompletionBlock);
  pendingCompletionBlock = v2->_pendingCompletionBlock;
  v2->_pendingCompletionBlock = 0;

  objc_sync_exit(v2);
  v5 = _Block_copy(v3);

  return v5;
}

- (id)info
{
  return self->_info;
}

@end
