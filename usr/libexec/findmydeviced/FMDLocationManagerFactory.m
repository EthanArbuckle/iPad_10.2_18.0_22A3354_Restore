@implementation FMDLocationManagerFactory

+ (FMDLocationManagerFactory)sharedInstance
{
  if (qword_100306398 != -1)
    dispatch_once(&qword_100306398, &stru_1002C1170);
  return (FMDLocationManagerFactory *)(id)qword_100306390;
}

- (FMDLocationManagerFactory)init
{
  FMDLocationManagerFactory *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDLocationManagerFactory;
  v2 = -[FMDLocationManagerFactory init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMDLocationManagerFactory setLocationManagers:](v2, "setLocationManagers:", v3);

  }
  return v2;
}

- (id)newLocationManager
{
  id v3;
  FMDLocationManagerProxy *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = -[FMDLocationManagerFactory _newCLLocationManager](self, "_newCLLocationManager");
  v4 = -[FMDLocationManagerProxy initWithLocationManager:]([FMDLocationManagerProxy alloc], "initWithLocationManager:", v3);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006020;
  v6[3] = &unk_1002C1198;
  objc_copyWeak(&v7, &location);
  -[FMDLocationManagerProxy setProxyDeallocationBlock:](v4, "setProxyDeallocationBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_newCLLocationManager
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100006290;
  v16 = sub_1000062A0;
  v17 = 0;
  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDLocationManagerFactory creating location manager", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000062A8;
  v11[3] = &unk_1002C11C0;
  v11[4] = self;
  v11[5] = &v12;
  v5 = objc_retainBlock(v11);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v5[2])(v5);
  else
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v13[5];
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDLocationManagerFactory created %@", buf, 0xCu);
  }

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)_discardLocationManager:(id)a3
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
  block[2] = sub_1000063EC;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSMutableArray)locationManagers
{
  return self->_locationManagers;
}

- (void)setLocationManagers:(id)a3
{
  objc_storeStrong((id *)&self->_locationManagers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagers, 0);
}

@end
