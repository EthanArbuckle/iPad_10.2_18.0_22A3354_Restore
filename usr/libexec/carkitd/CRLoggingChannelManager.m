@implementation CRLoggingChannelManager

- (CRLoggingChannelManager)initWithSessionStatus:(id)a3
{
  id v4;
  CRLoggingChannelManager *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLoggingChannelManager;
  v5 = -[CRLoggingChannelManager init](&v7, "init");
  if (v5)
    objc_msgSend(v4, "addSessionObserver:", v5);

  return v5;
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038798;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000388E8;
  v3[3] = &unk_1000B5728;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (CRLoggingFileReceiver)currentLoggingFileReceiver
{
  return self->_currentLoggingFileReceiver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLoggingFileReceiver, 0);
}

@end
