@implementation SCKAsyncBlockOperation

- (SCKAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4;
  SCKAsyncBlockOperation *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKAsyncBlockOperation;
  v5 = -[SCKAsyncBlockOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)start
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  if (-[SCKAsyncBlockOperation isCancelled](self, "isCancelled"))
  {
    -[SCKAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[SCKAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[SCKAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    v3 = (void *)MEMORY[0x219A0B7E0](-[SCKAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting")));
    -[SCKAsyncBlockOperation block](self, "block");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__SCKAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_24D74B7C0;
    v5[4] = self;
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

    objc_autoreleasePoolPop(v3);
  }
}

uint64_t __31__SCKAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
