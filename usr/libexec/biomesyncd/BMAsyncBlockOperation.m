@implementation BMAsyncBlockOperation

- (BMAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3
{
  id v4;
  BMAsyncBlockOperation *v5;
  id v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAsyncBlockOperation;
  v5 = -[BMAsyncBlockOperation init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = v6;

    v5->_executing = 0;
    v5->_finished = 0;
  }

  return v5;
}

- (void)start
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  if ((-[BMAsyncBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[BMAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[BMAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BMAsyncBlockOperation block](self, "block"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100033FB0;
    v4[3] = &unk_100068B38;
    v4[4] = self;
    ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v4);

  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
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
