@implementation PLLibraryServicesStateNode

- (int64_t)state
{
  return self->_state;
}

- (PLLibraryServicesStateNode)initWithLibraryServicesState:(int64_t)a3 qualityOfService:(unsigned int)a4 logPrefix:(id)a5
{
  id v8;
  PLLibraryServicesStateNode *v9;
  PLLibraryServicesStateNode *v10;
  uint64_t v11;
  NSString *logPrefix;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PLLibraryServicesStateNode;
  v9 = -[PLLibraryServicesStateNode init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = a3;
    v9->_qos = a4;
    v11 = objc_msgSend(v8, "copy");
    logPrefix = v10->_logPrefix;
    v10->_logPrefix = (NSString *)v11;

    v10->_operationQueueLock._os_unfair_lock_opaque = 0;
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v13;

    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromLibraryServicesState(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@(%@: %@)"), v17, v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v10->_operationQueue, "setName:", v19);

    -[NSOperationQueue setSuspended:](v10->_operationQueue, "setSuspended:", 1);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    if ((int)a4 <= 20)
    {
      if (a4 && a4 != 17)
        goto LABEL_11;
    }
    else if (a4 != 21)
    {
      if (a4 == 25)
      {
        v20 = 25;
        goto LABEL_12;
      }
      if (a4 == 33)
      {
        v20 = 33;
LABEL_12:
        -[NSOperationQueue setQualityOfService:](v10->_operationQueue, "setQualityOfService:", v20);
        goto LABEL_13;
      }
LABEL_11:
      v20 = 9;
      goto LABEL_12;
    }
    v20 = 17;
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (id)operationQueue
{
  os_unfair_lock_s *p_operationQueueLock;
  NSOperationQueue *v4;

  p_operationQueueLock = &self->_operationQueueLock;
  os_unfair_lock_lock(&self->_operationQueueLock);
  v4 = self->_operationQueue;
  os_unfair_lock_unlock(p_operationQueueLock);
  return v4;
}

- (void)setOperationQueue:(id)a3
{
  NSOperationQueue *v4;
  NSOperationQueue *operationQueue;

  v4 = (NSOperationQueue *)a3;
  os_unfair_lock_lock(&self->_operationQueueLock);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v4;

  os_unfair_lock_unlock(&self->_operationQueueLock);
}

- (void)setQos:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_qos = a3;
  if ((int)a3 <= 20)
  {
    if (a3 && a3 != 17)
      goto LABEL_10;
LABEL_8:
    v4 = 0x11u;
    goto LABEL_11;
  }
  switch(a3)
  {
    case 0x15u:
      goto LABEL_8;
    case 0x19u:
      v4 = 25;
      goto LABEL_11;
    case 0x21u:
      v4 = 0x21u;
      goto LABEL_11;
  }
LABEL_10:
  v4 = 9u;
LABEL_11:
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesStateNode logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromLibraryServicesState(self->_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(__CFString **)((char *)&off_1E376CAF8 + v4 - 9);
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting QoS of state node %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQualityOfService:", v4);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PLLibraryServicesStateNode;
  -[PLLibraryServicesStateNode description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "qualityOfService");
  if (v6 <= 16)
  {
    if (v6 == -1)
    {
      v7 = CFSTR("NSQualityOfServiceDefault");
      goto LABEL_13;
    }
    if (v6 == 9)
    {
      v7 = CFSTR("NSQualityOfServiceBackground");
      goto LABEL_13;
    }
LABEL_12:
    v7 = CFSTR("Unknown");
    goto LABEL_13;
  }
  if (v6 == 17)
  {
    v7 = CFSTR("NSQualityOfServiceUtility");
    goto LABEL_13;
  }
  if (v6 == 33)
  {
    v7 = CFSTR("NSQualityOfServiceUserInteractive");
    goto LABEL_13;
  }
  if (v6 != 25)
    goto LABEL_12;
  v7 = CFSTR("NSQualityOfServiceUserInitiated");
LABEL_13:
  v8 = v7;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ qos:%@ queue: %@"), v5, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)run
{
  id v2;

  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

}

- (void)terminate
{
  void *v3;

  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[PLLibraryServicesStateNode setOperationQueue:](self, "setOperationQueue:", 0);
}

- (unint64_t)operationCount
{
  void *v2;
  unint64_t v3;

  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationCount");

  return v3;
}

- (NSArray)operations
{
  void *v2;
  void *v3;

  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)addOperationCountObserver:(id)a3 context:(void *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v6, CFSTR("operationCount"), 5, a4);

  return v8;
}

- (BOOL)enqueueOperation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLLibraryServicesStateNode operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addOperation:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    PLStringFromLibraryServicesState(self->_state);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Attempt to enqueue operation in state %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46502, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      *a4 = objc_retainAutorelease(v14);
    }
    else
    {
      PLLibraryServicesGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[PLLibraryServicesStateNode logPrefix](self, "logPrefix");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unable to enqueue operation: %@", buf, 0x16u);

      }
    }

  }
  return v8 != 0;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

+ (void)removeOperationCountObserver:(id)a3 fromObservedObject:(id)a4 context:(void *)a5
{
  objc_msgSend(a4, "removeObserver:forKeyPath:context:", a3, CFSTR("operationCount"), a5);
}

@end
