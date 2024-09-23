@implementation STUCancellableBlockOperation

- (void)cancel
{
  void *v3;
  _QWORD v4[5];

  if ((-[STUCancellableBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002C854;
    v4[3] = &unk_1000C97E8;
    v4[4] = self;
    objc_msgSend(v3, "performBlock:", v4);

  }
}

+ (id)blockOperationWithBlock:(id)a3 cancellationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUCancellableBlockOperation;
  v7 = objc_msgSendSuper2(&v11, "blockOperationWithBlock:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setCancellationBlock:", v6);

  return v9;
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationBlock, 0);
}

@end
