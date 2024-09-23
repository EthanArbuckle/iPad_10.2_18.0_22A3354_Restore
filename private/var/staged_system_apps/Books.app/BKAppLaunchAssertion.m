@implementation BKAppLaunchAssertion

- (void)invalidate
{
  NSObject *v3;
  unsigned int v4;
  void (**v5)(_QWORD);
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10004E4E8;
  v11 = sub_10004E2E8;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchAssertion queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C700;
  v6[3] = &unk_1008E75B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (v8[5])
  {
    v4 = +[NSThread isMainThread](NSThread, "isMainThread");
    v5 = (void (**)(_QWORD))v8[5];
    if (v4)
      v5[2](v8[5]);
    else
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
  _Block_object_dispose(&v7, 8);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BKAppLaunchAssertion)initWithQueue:(id)a3 releaseBlock:(id)a4
{
  id v7;
  id v8;
  BKAppLaunchAssertion *v9;
  BKAppLaunchAssertion *v10;
  id v11;
  id releaseBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKAppLaunchAssertion;
  v9 = -[BKAppLaunchAssertion init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    releaseBlock = v10->_releaseBlock;
    v10->_releaseBlock = v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BKAppLaunchAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKAppLaunchAssertion;
  -[BKAppLaunchAssertion dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_releaseBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

@end
