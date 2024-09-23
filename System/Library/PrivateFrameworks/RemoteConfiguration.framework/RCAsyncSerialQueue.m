@implementation RCAsyncSerialQueue

- (void)enqueueBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rc_addAsyncOperationWithBlock:", v4);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue enqueueBlock:].cold.1();
  }

}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (RCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  RCAsyncSerialQueue *v4;
  NSOperationQueue *v5;
  NSOperationQueue *serialOperationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCAsyncSerialQueue;
  v4 = -[RCAsyncSerialQueue init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialOperationQueue = v4->_serialOperationQueue;
    v4->_serialOperationQueue = v5;

    -[NSOperationQueue setQualityOfService:](v4->_serialOperationQueue, "setQualityOfService:", a3);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v4;
}

- (RCAsyncSerialQueue)init
{
  return -[RCAsyncSerialQueue initWithQualityOfService:](self, "initWithQualityOfService:", 9);
}

- (void)enqueueBlockForMainThread:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke;
    v6[3] = &unk_1E470E948;
    v7 = v4;
    -[RCAsyncSerialQueue enqueueBlock:](self, "enqueueBlock:", v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue enqueueBlockForMainThread:].cold.1();
  }

}

void __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E470E5B8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __48__RCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (v6)
  {
    +[RCAsyncBlockOperation asyncBlockOperationWithMainThreadBlock:](RCAsyncBlockOperation, "asyncBlockOperationWithMainThreadBlock:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQualityOfService:", a3);
    -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCAsyncSerialQueue withQualityOfService:enqueueBlockForMainThread:].cold.1();
  }

}

- (void)enqueueOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (void)cancelAllBlocks
{
  id v2;

  -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (BOOL)suspended
{
  void *v2;
  char v3;

  -[RCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
}

- (void)setSerialOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
}

- (void)enqueueBlock:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)enqueueBlockForMainThread:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)withQualityOfService:enqueueBlockForMainThread:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
