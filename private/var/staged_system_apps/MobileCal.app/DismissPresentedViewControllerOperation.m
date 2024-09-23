@implementation DismissPresentedViewControllerOperation

- (DismissPresentedViewControllerOperation)initWithPresentingViewController:(id)a3 transition:(int)a4 completion:(id)a5
{
  id v9;
  id v10;
  DismissPresentedViewControllerOperation *v11;
  DismissPresentedViewControllerOperation *v12;
  id v13;
  id completion;
  Class v15;
  NSString *v16;
  id v17;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DismissPresentedViewControllerOperation;
  v11 = -[DismissPresentedViewControllerOperation init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presentingViewController, a3);
    v12->_transition = a4;
    v13 = objc_retainBlock(v10);
    completion = v12->_completion;
    v12->_completion = v13;

    objc_opt_class(v12);
    v16 = NSStringFromClass(v15);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v16));
    v18 = (const char *)objc_msgSend(v17, "UTF8String");

    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create(v18, v20);
    -[DismissPresentedViewControllerOperation setQueue:](v12, "setQueue:", v21);

  }
  return v12;
}

- (id)description
{
  double v2;
  uint64_t v3;

  *(_QWORD *)&v2 = objc_opt_class(self->_presentingViewController).n128_u64[0];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ dismisses its presented view controller"), v2, v3);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DismissPresentedViewControllerOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092CBC;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isConcurrent
{
  return 0;
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DismissPresentedViewControllerOperation;
  -[DismissPresentedViewControllerOperation cancel](&v2, "cancel");
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{
  void *v3;
  NSObject *v4;
  Class v5;
  NSString *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  DismissPresentedViewControllerOperation *v11;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Finishing %@ operation: [%p]", (uint8_t *)&v8, 0x16u);

  }
  if (!self->_isFinished)
  {
    if (self->_isExecuting)
    {
      -[DismissPresentedViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      self->_isExecuting = 0;
      -[DismissPresentedViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    }
    -[DismissPresentedViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_isFinished = 1;
    -[DismissPresentedViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

+ (id)blacklistedDismissalClasses
{
  if (qword_1001F6248 != -1)
    dispatch_once(&qword_1001F6248, &stru_1001B3DC8);
  return (id)qword_1001F6240;
}

- (void)main
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  DismissPresentedViewControllerOperation *v6;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Executing operation: %@", buf, 0xCu);
  }
  -[DismissPresentedViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[DismissPresentedViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  if ((-[DismissPresentedViewControllerOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    -[DismissPresentedViewControllerOperation finish](self, "finish");
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000930A0;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
