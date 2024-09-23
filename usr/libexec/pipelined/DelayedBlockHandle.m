@implementation DelayedBlockHandle

+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dispatch_after:block:onQueue:", a3.__rep_, a4, &_dispatch_main_q));
}

+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1 onQueue:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = -[DelayedBlockHandle init:]([DelayedBlockHandle alloc], "init:", v7);
  v10 = dispatch_time(0, a3.__rep_);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002573F0;
  block[3] = &unk_1003EE788;
  v11 = v9;
  v14 = v11;
  dispatch_after(v10, v8, block);

  return v11;
}

- (id)init:(id)a3
{
  id v4;
  DelayedBlockHandle *v5;
  id v6;
  id cb;
  DelayedBlockHandle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DelayedBlockHandle;
  v5 = -[DelayedBlockHandle init](&v10, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    cb = v5->_cb;
    v5->_cb = v6;

    v8 = v5;
  }

  return v5;
}

- (void)setCancelled:(BOOL)a3
{
  id cb;

  if (a3)
  {
    cb = self->_cb;
    self->_cb = 0;

  }
}

- (BOOL)cancelled
{
  return self->_cb == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cb, 0);
}

@end
