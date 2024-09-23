@implementation ICAsyncOperation

- (BOOL)isExecuting
{
  ICAsyncOperation *v2;
  os_unfair_lock_s *p_asyncOperationLock;

  v2 = self;
  p_asyncOperationLock = &self->_asyncOperationLock;
  os_unfair_lock_lock(&self->_asyncOperationLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_asyncOperationLock);
  return (char)v2;
}

- (BOOL)isFinished
{
  ICAsyncOperation *v2;
  os_unfair_lock_s *p_asyncOperationLock;

  v2 = self;
  p_asyncOperationLock = &self->_asyncOperationLock;
  os_unfair_lock_lock(&self->_asyncOperationLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_asyncOperationLock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_childOperationQueue, 0);
}

- (void)finish
{
  -[ICAsyncOperation finishWithError:](self, "finishWithError:", 0);
}

- (void)start
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "qualityOfService");

  -[ICAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock(&self->_asyncOperationLock);
  self->_isExecuting = 1;
  self->_qualityOfServiceForChildOperationQueue = v4;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  -[ICAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[ICAsyncOperation _execute](self, "_execute");
}

- (void)finishWithError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)a3;
  -[ICAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  -[ICAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[ICAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock(&self->_asyncOperationLock);
  error = self->_error;
  self->_error = v4;

  self->_isExecuting = 0;
  self->_isFinished = 1;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  -[ICAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  -[ICAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[ICAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (ICAsyncOperation)init
{
  ICAsyncOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAsyncOperation;
  result = -[ICAsyncOperation init](&v3, sel_init);
  if (result)
  {
    result->_asyncOperationLock._os_unfair_lock_opaque = 0;
    result->_qualityOfServiceForChildOperationQueue = -1;
  }
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)enqueueChildOperation:(id)a3
{
  id v4;
  NSOperationQueue *childOperationQueue;
  int v6;
  NSOperationQueue *v7;
  NSOperationQueue *v8;
  NSOperationQueue *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSOperationQueue *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  NSObject *v22;
  uint8_t buf[4];
  ICAsyncOperation *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_asyncOperationLock);
  os_unfair_lock_lock(&self->_asyncOperationLock);
  childOperationQueue = self->_childOperationQueue;
  if (childOperationQueue)
    goto LABEL_2;
  v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  v8 = self->_childOperationQueue;
  self->_childOperationQueue = v7;

  v9 = self->_childOperationQueue;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.iTunesCloud.ICAsyncOperation.childOperationQueue-%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue setName:](v9, "setName:", v13);

  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_childOperationQueue, "setMaxConcurrentOperationCount:", 3);
  if (self->_isExecuting || self->_isFinished)
  {
    -[NSOperationQueue setQualityOfService:](self->_childOperationQueue, "setQualityOfService:", self->_qualityOfServiceForChildOperationQueue);
    v6 = 1;
  }
  else
  {
LABEL_2:
    v6 = 0;
  }
  v14 = self->_childOperationQueue;
  os_unfair_lock_unlock(&self->_asyncOperationLock);
  if (!childOperationQueue)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<%@: %p"), v17, v14);

    -[NSOperationQueue name](v14, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("; name = \"%@\"), v19);

    objc_msgSend(v18, "appendFormat:", CFSTR("; maxConcurrentOperationCount = %ld"),
      -[NSOperationQueue maxConcurrentOperationCount](v14, "maxConcurrentOperationCount"));
    if (v6)
    {
      v20 = -[NSOperationQueue qualityOfService](v14, "qualityOfService");
      v21 = CFSTR("????");
      if (v20 <= 16)
      {
        if (v20 == -1)
        {
          v21 = CFSTR("default");
        }
        else if (v20 == 9)
        {
          v21 = CFSTR("background");
        }
      }
      else
      {
        switch(v20)
        {
          case 17:
            v21 = CFSTR("utility");
            break;
          case 25:
            v21 = CFSTR("userInitiated");
            break;
          case 33:
            v21 = CFSTR("userInteractive");
            break;
        }
      }
      objc_msgSend(v18, "appendFormat:", CFSTR("; qualityOfService = %@"), v21);
    }
    objc_msgSend(v18, "appendString:", CFSTR(">"));
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Created child operation queue: %{public}@.", buf, 0x16u);
    }

  }
  -[NSOperationQueue addOperation:](v14, "addOperation:", v4);

}

- (NSError)error
{
  return self->_error;
}

@end
