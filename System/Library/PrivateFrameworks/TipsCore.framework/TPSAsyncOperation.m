@implementation TPSAsyncOperation

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_preCompletionBlock, 0);
}

- (void)cancel
{
  _QWORD v3[5];

  -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCancelled"));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__TPSAsyncOperation_cancel__block_invoke;
  v3[3] = &unk_1E395B100;
  v3[4] = self;
  -[TPSAsyncOperation lockExec:](self, "lockExec:", v3);
  -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCancelled"));
  -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TPSAsyncOperation *v12;
  id v13;

  v4 = a3;
  -[TPSAsyncOperation preCompletionBlock](self, "preCompletionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TPSAsyncOperation preCompletionBlock](self, "preCompletionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__TPSAsyncOperation_finishWithError___block_invoke;
  v11 = &unk_1E395B150;
  v12 = self;
  v13 = v4;
  v7 = v4;
  -[TPSAsyncOperation lockExec:](self, "lockExec:", &v8);
  -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"), v8, v9, v10, v11, v12);
  -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));

}

- (void)start
{
  _QWORD v3[5];

  if (-[TPSAsyncOperation isCancelled](self, "isCancelled"))
  {
    -[TPSAsyncOperation finishWithError:](self, "finishWithError:", 0);
  }
  else
  {
    -[TPSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __26__TPSAsyncOperation_start__block_invoke;
    v3[3] = &unk_1E395B100;
    v3[4] = self;
    -[TPSAsyncOperation lockExec:](self, "lockExec:", v3);
    -[TPSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[TPSAsyncOperation main](self, "main");
  }
}

- (BOOL)isCancelled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__TPSAsyncOperation_isCancelled__block_invoke;
  v4[3] = &unk_1E395B128;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSAsyncOperation lockExec:](self, "lockExec:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isFinished
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__TPSAsyncOperation_isFinished__block_invoke;
  v4[3] = &unk_1E395B128;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSAsyncOperation lockExec:](self, "lockExec:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isExecuting
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__TPSAsyncOperation_isExecuting__block_invoke;
  v4[3] = &unk_1E395B128;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSAsyncOperation lockExec:](self, "lockExec:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)lockExec:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __32__TPSAsyncOperation_isExecuting__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 252);
  return result;
}

uint64_t __31__TPSAsyncOperation_isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 253);
  return result;
}

uint64_t __32__TPSAsyncOperation_isCancelled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 254);
  return result;
}

- (TPSAsyncOperation)init
{
  TPSAsyncOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSAsyncOperation;
  result = -[TPSAsyncOperation init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

uint64_t __26__TPSAsyncOperation_start__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 252) = 1;
  return result;
}

void __37__TPSAsyncOperation_finishWithError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 252) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 253) = 1;
}

- (id)preCompletionBlock
{
  return self->_preCompletionBlock;
}

uint64_t __27__TPSAsyncOperation_cancel__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 252) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 253) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 254) = 1;
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setPreCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

@end
