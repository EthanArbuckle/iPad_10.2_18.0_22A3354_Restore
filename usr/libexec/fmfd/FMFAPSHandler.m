@implementation FMFAPSHandler

- (NSString)apsToken
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler apsConnection](self, "apsConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "publicToken"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_hexString"));
  else
    v4 = 0;

  return (NSString *)v4;
}

+ (id)instanceForEnvironment:(id)a3
{
  id v3;
  id v4;
  FMFAPSHandler *v5;

  v3 = a3;
  if (qword_1000B3820 != -1)
    dispatch_once(&qword_1000B3820, &stru_10009A980);
  v4 = (id)qword_1000B3818;
  objc_sync_enter(v4);
  v5 = (FMFAPSHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000B3810, "objectForKeyedSubscript:", v3));
  if (!v5)
  {
    v5 = -[FMFAPSHandler initWithEnvironmentName:]([FMFAPSHandler alloc], "initWithEnvironmentName:", v3);
    objc_msgSend((id)qword_1000B3810, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)handleMessage:(id)a3 onTopic:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008984;
  block[3] = &unk_10009A798;
  block[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = sub_100011D0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received aps message on topic %@: %@", (uint8_t *)&v11, 0x16u);
  }

  -[FMFAPSHandler handleMessage:onTopic:](self, "handleMessage:onTopic:", v8, v7);
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler apsConnection](self, "apsConnection"));
  objc_msgSend(v3, "setEnabledTopics:", 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFAPSHandler;
  -[FMFAPSHandler dealloc](&v4, "dealloc");
}

- (FMFAPSHandler)init
{
  id v3;
  NSObject *v4;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100064964(v4);

  return 0;
}

- (FMFAPSHandler)initWithEnvironmentName:(id)a3
{
  id v4;
  FMFAPSHandler *v5;
  FMFAPSHandler *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMFAPSHandler;
  v5 = -[FMFAPSHandler init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[FMFAPSHandler setEnvironmentName:](v5, "setEnvironmentName:", v4);
    v7 = objc_msgSend(objc_alloc((Class)APSConnection), "initWithEnvironmentName:namedDelegatePort:queue:", v4, CFSTR("com.apple.icloud.fmfd.aps"), &_dispatch_main_q);
    -[FMFAPSHandler setApsConnection:](v6, "setApsConnection:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler apsConnection](v6, "apsConnection"));
    objc_msgSend(v8, "setDelegate:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMFAPSHandler setRegisteredDelegates:](v6, "setRegisteredDelegates:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMFAPSHandler setPendingPushes:](v6, "setPendingPushes:", v10);

  }
  return v6;
}

- (void)registerDelegate:(id)a3 forTopic:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D72C;
  block[3] = &unk_10009A798;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)deregisterDelegate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  FMFAPSHandler *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003DBB4;
  v5[3] = &unk_100099348;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

+ (void)startupComplete
{
  byte_1000B3828 = 1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10009AA18);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FMFAPSHandler *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "description", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("<>")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_10009B948));
  v9 = sub_100011D0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler environmentName](self, "environmentName"));
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received updated aps token %@ for environment %@", buf, 0x16u);

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003E530;
  v13[3] = &unk_100099348;
  v14 = v8;
  v15 = self;
  v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (void)setRegisteredDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDelegates, a3);
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPushes, a3);
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
  objc_storeStrong((id *)&self->_environmentName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end
