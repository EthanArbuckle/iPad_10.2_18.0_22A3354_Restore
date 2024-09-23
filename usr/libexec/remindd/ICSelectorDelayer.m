@implementation ICSelectorDelayer

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  ICSelectorDelayer *v13;
  ICSelectorDelayer *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  objc_super v19;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICSelectorDelayer;
  v13 = -[ICSelectorDelayer init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    -[ICSelectorDelayer setTarget:](v13, "setTarget:", v12);
    -[ICSelectorDelayer setSelector:](v14, "setSelector:", a4);
    -[ICSelectorDelayer setDelay:](v14, "setDelay:", a5);
    -[ICSelectorDelayer setWaitToFireUntilRequestsStop:](v14, "setWaitToFireUntilRequestsStop:", v8);
    -[ICSelectorDelayer setCallOnMainThread:](v14, "setCallOnMainThread:", v7);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("com.apple.reminders.coalescer.requests", v16);
    -[ICSelectorDelayer setRequestQueue:](v14, "setRequestQueue:", v17);

  }
  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E01C;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)ICSelectorDelayer;
  -[ICSelectorDelayer dealloc](&v4, "dealloc");
}

- (void)requestFire
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E090;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)fireImmediately
{
  NSObject *v3;
  _QWORD v4[5];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E384;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_sync(v3, block);

  if (-[ICSelectorDelayer callOnMainThread](self, "callOnMainThread")
    && !+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001E38C;
    v4[3] = &unk_1007D7A60;
    v4[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else
  {
    -[ICSelectorDelayer callTargetSelector](self, "callTargetSelector");
  }
}

- (void)callTargetSelector
{
  void *v3;
  void (*v4)(id, SEL);
  NSObject *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer target](self, "target"));
  v4 = (void (*)(id, SEL))objc_msgSend(v3, "methodForSelector:", -[ICSelectorDelayer selector](self, "selector"));

  if (v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer target](self, "target"));
    v4(v6, -[ICSelectorDelayer selector](self, "selector"));

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100678F68(self, v5);

  }
}

- (BOOL)isScheduledToFire
{
  ICSelectorDelayer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer requestQueue](self, "requestQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001E518;
  v5[3] = &unk_1007D7AF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)cancelPreviousFireRequests
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer requestQueue](self, "requestQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E5C0;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_cancelFireRequests
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer fireBlock](self, "fireBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectorDelayer fireBlock](self, "fireBlock"));
    dispatch_block_cancel(v4);

    -[ICSelectorDelayer setFireBlock:](self, "setFireBlock:", 0);
  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_destroyWeak(&self->_target);
}

@end
