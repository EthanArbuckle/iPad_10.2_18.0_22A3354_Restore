@implementation RCAsyncBlockOperation

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

uint64_t __30__RCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

+ (id)asyncBlockOperationWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:", v3);

  return v4;
}

- (RCAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4;
  RCAsyncBlockOperation *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCAsyncBlockOperation initWithBlock:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)RCAsyncBlockOperation;
  v5 = -[RCAsyncBlockOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)start
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  if (-[RCAsyncBlockOperation isCancelled](self, "isCancelled"))
  {
    -[RCAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[RCAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[RCAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    v3 = (void *)MEMORY[0x1A8581434](-[RCAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting")));
    -[RCAsyncBlockOperation block](self, "block");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__RCAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E470DFF0;
    v5[4] = self;
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

    objc_autoreleasePoolPop(v3);
  }
}

- (id)block
{
  return self->_block;
}

+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke;
  v8[3] = &unk_1E470E948;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "asyncBlockOperationWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2;
  v5[3] = &unk_1E470E5B8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  RCPerformBlockOnMainThread(v5);

}

uint64_t __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (RCAsyncBlockOperation)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCAsyncBlockOperation init]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCAsyncBlockOperation.m";
    v11 = 1024;
    v12 = 38;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[RCAsyncBlockOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)initWithBlock:.cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCAsyncBlockOperation initWithBlock:]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCAsyncBlockOperation.m";
  v5 = 1024;
  v6 = 43;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

@end
