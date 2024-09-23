@implementation BKCriticalAlertAssertion

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014C78;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BKCriticalAlertAssertion)initWithQueue:(id)a3 assertionIsInvalidBlock:(id)a4
{
  id v7;
  id v8;
  BKCriticalAlertAssertion *v9;
  BKCriticalAlertAssertion *v10;
  id v11;
  id assertionIsInvalidBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKCriticalAlertAssertion;
  v9 = -[BKCriticalAlertAssertion init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    assertionIsInvalidBlock = v10->_assertionIsInvalidBlock;
    v10->_assertionIsInvalidBlock = v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BKCriticalAlertAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKCriticalAlertAssertion;
  -[BKCriticalAlertAssertion dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assertionIsInvalidBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)assertionIsInvalidBlock
{
  return self->_assertionIsInvalidBlock;
}

@end
