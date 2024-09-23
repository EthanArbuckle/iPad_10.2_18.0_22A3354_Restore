@implementation FMFNetworkObserver

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014B20;
  block[3] = &unk_100099320;
  block[4] = a1;
  if (qword_1000B3688 != -1)
    dispatch_once(&qword_1000B3688, block);
  return (id)qword_1000B3680;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FMFNetworkObserver;
  -[FMFNetworkObserver dealloc](&v4, "dealloc");
}

- (void)_reportReachabilityChange:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014CD8;
  v4[3] = &unk_100099348;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

@end
