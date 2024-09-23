@implementation DMDSSRequestDelegate

+ (double)timeout
{
  return 0.0;
}

- (DMDSSRequestDelegate)initWithRequest:(id)a3
{
  id v5;
  DMDSSRequestDelegate *v6;
  DMDSSRequestDelegate *v7;
  void *v8;
  uint64_t v9;
  NSTimer *timeoutTimer;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMDSSRequestDelegate;
  v6 = -[DMDSSRequestDelegate init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    if (!v5)
      sub_1000797F8();
    objc_storeStrong((id *)&v6->_request, a3);
    -[SSRequest setDelegate:](v7->_request, "setDelegate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v9 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v7, "_timerDidFire:", v7, 1));
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (NSTimer *)v9;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)DMDSSRequestDelegate;
  -[DMDSSRequestDelegate dealloc](&v4, "dealloc");
}

- (void)startWithCompletionBlock:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065308;
  v4[3] = &unk_1000BA7F0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  _performBlockOnMainThread(v4);

}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100065454;
  v2[3] = &unk_1000BA4B0;
  v2[4] = self;
  _performBlockOnMainThread(v2);
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v7, "setFireDate:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate completionBlock](self, "completionBlock"));
  -[DMDSSRequestDelegate setCompletionBlock:](self, "setCompletionBlock:", 0);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000655E4;
    v11[3] = &unk_1000BB380;
    v13 = v8;
    v12 = v5;
    dispatch_async(v10, v11);

  }
}

- (void)requestDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v5, "setFireDate:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate completionBlock](self, "completionBlock"));
  -[DMDSSRequestDelegate setCompletionBlock:](self, "setCompletionBlock:", 0);
  if (v6)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000656D8;
    block[3] = &unk_1000BB4A8;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

- (void)_timerDidFire:(id)a3
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  -[DMDSSRequestDelegate cancel](self, "cancel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSSRequestDelegate completionBlock](self, "completionBlock"));
  -[DMDSSRequestDelegate setCompletionBlock:](self, "setCompletionBlock:", 0);
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065794;
    block[3] = &unk_1000BB4A8;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (SSRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
