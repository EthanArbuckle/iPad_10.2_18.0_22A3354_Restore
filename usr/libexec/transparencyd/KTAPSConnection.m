@implementation KTAPSConnection

- (KTAPSConnection)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6;
  KTAPSConnection *v7;
  KTAPSConnection *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  os_log_t v20;
  void *v21;
  void *v22;
  void *v23;
  KTAPSConnection *v24;
  objc_super v26;
  const __CFString *v27;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)KTAPSConnection;
  v7 = -[KTAPSConnection init](&v26, "init");
  v8 = v7;
  if (v7)
  {
    -[KTAPSConnection setNamedDelegatePort:](v7, "setNamedDelegatePort:", v6);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("aps-queue", v10);
    -[KTAPSConnection setQueue:](v8, "setQueue:", v11);

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("aps-delivery-queue", v13);
    -[KTAPSConnection setDeliveryQueue:](v8, "setDeliveryQueue:", v14);

    v15 = -[objc_class alloc](a4, "alloc");
    v16 = APSEnvironmentProduction;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](v8, "queue"));
    v18 = -[objc_class initWithEnvironmentName:namedDelegatePort:queue:](v15, "initWithEnvironmentName:namedDelegatePort:queue:", v16, v6, v17);
    -[KTAPSConnection setApsConnection:](v8, "setApsConnection:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection apsConnection](v8, "apsConnection"));
    objc_msgSend(v19, "setDelegate:", v8);

    v20 = os_log_create("com.apple.Transparency", "KTAPSConnection");
    -[KTAPSConnection setLog:](v8, "setLog:", v20);

    v27 = CFSTR("com.apple.icloud-container.com.apple.transparencyd");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection apsConnection](v8, "apsConnection"));
    objc_msgSend(v22, "_setEnabledTopics:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTAPSConnection setReceivers:](v8, "setReceivers:", v23);

    v24 = v8;
  }

  return v8;
}

- (void)registerPushReceiver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  KTAPSConnection *v9;
  id v10;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001731BC;
  v7[3] = &unk_10023A868;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_claimAutoreleasedReturnValue(-[KTAPSConnection log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "token"));
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didReceiveIncomingMessage: %@: userInfo: %@", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173414;
  block[3] = &unk_10023D398;
  block[4] = self;
  v14 = v5;
  v15 = v7;
  v11 = v7;
  v12 = v5;
  dispatch_async(v10, block);

}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApsConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)receivers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReceivers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)deliveryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeliveryQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
}

@end
