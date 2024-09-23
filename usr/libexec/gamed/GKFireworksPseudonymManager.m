@implementation GKFireworksPseudonymManager

- (GKFireworksPseudonymManager)initWithService:(id)a3
{
  id v6;
  GKFireworksPseudonymManager *v7;
  GKFireworksPseudonymManager *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKFireworksPseudonymManager.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  }
  v15.receiver = self;
  v15.super_class = (Class)GKFireworksPseudonymManager;
  v7 = -[GKFireworksPseudonymManager init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_service, a3);
    v8->_inFlightProvision = 0;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.gamekit.pseudonymQueue", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

  }
  return v8;
}

- (void)provisionPseudonymIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKFireworksPseudonymManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D4758;
  v7[3] = &unk_1002BB758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  GKFireworksPseudonymManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[GKFireworksPseudonymManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4DB4;
  block[3] = &unk_1002BB568;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)inFlightProvision
{
  return self->_inFlightProvision;
}

- (void)setInFlightProvision:(BOOL)a3
{
  self->_inFlightProvision = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
