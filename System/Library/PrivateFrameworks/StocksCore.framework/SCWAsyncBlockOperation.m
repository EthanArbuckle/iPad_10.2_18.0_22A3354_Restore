@implementation SCWAsyncBlockOperation

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (SCWAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4;
  SCWAsyncBlockOperation *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWAsyncBlockOperation;
  v5 = -[SCWAsyncBlockOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

uint64_t __31__SCWAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  if (-[SCWAsyncBlockOperation isCancelled](self, "isCancelled"))
  {
    -[SCWAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[SCWAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[SCWAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    v3 = (void *)MEMORY[0x1AF4389C0](-[SCWAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting")));
    -[SCWAsyncBlockOperation block](self, "block");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __31__SCWAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E5AF1E88;
    v5[4] = self;
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

    objc_autoreleasePoolPop(v3);
  }
}

- (id)block
{
  return self->_block;
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
