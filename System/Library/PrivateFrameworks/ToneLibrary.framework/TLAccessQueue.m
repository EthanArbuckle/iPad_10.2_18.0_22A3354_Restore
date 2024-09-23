@implementation TLAccessQueue

- (TLAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TLAccessQueue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  dispatch_queue_t v19;
  dispatch_queue_t v20;
  uint64_t v22;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TLAccessQueue;
  v7 = -[TLAccessQueue init](&v23, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || v4)
    {
      if (v6 && v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v9);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = objc_msgSend(v9, "copy");
      }
      v10 = (void *)v14;
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v13, v10, v22);
    }
    else
    {
      v10 = (void *)objc_msgSend(v6, "copy");
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@.%@"), v13, v10, v9);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v10);
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), 0);
    v20 = v19;
    if (v9 && v18 && v17 && v19)
    {
      objc_storeStrong((id *)&v7->_label, v18);
      objc_storeStrong((id *)&v7->_threadLocalStorageKey, v17);
      objc_storeStrong((id *)&v7->_serialQueue, v20);
    }
    else
    {

      v7 = 0;
    }

  }
  return v7;
}

- (void)performSynchronousBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *serialQueue;
  void (**v9)(void);
  _QWORD block[5];
  void (**v11)(void);

  v9 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", self->_threadLocalStorageKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v9[2]();
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__TLAccessQueue_performSynchronousBlock___block_invoke;
    block[3] = &unk_1E952B4E0;
    block[4] = self;
    v11 = v9;
    dispatch_sync(serialQueue, block);

  }
}

uint64_t __41__TLAccessQueue_performSynchronousBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSynchronousBlockInSerialQueue:", *(_QWORD *)(a1 + 40));
}

- (void)performAsynchronousBlock:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__TLAccessQueue_performAsynchronousBlock___block_invoke;
  v7[3] = &unk_1E952B4E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

uint64_t __42__TLAccessQueue_performAsynchronousBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSynchronousBlockInSerialQueue:", *(_QWORD *)(a1 + 40));
}

- (void)assertNotRunningInAccessQueue
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
}

- (void)_performSynchronousBlockInSerialQueue:(id)a3
{
  void *v4;
  NSString *v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = self->_threadLocalStorageKey;
  v6 = (void (**)(_QWORD))a3;
  objc_msgSend(v4, "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v5);
  v6[2](v6);

  objc_msgSend(v8, "removeObjectForKey:", v5);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_threadLocalStorageKey, 0);
}

@end
