@implementation SFAnalyticsClient

- (NSString)storePath
{
  return (NSString *)-[SFAnalyticsSQLiteStore path](self->_store, "path");
}

- (SFAnalyticsClient)initWithStorePath:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  SFAnalyticsClient *v19;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc((Class)SFAnalyticsSQLiteStore);
  v13 = objc_msgSend(v12, "initWithPath:schema:", v11, SFAnalyticsTableSchema);

  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SFAnalyticsClient queue-%@"), v10)));
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = dispatch_queue_create(v15, v17);

  v19 = -[SFAnalyticsClient initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:](self, "initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:", v13, v18, v10, v7, v6);
  return v19;
}

- (id)initFromExistingClient:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  const char *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  SFAnalyticsClient *v19;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SFAnalyticsClient queue-%@"), v10)));
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  v17 = dispatch_queue_create_with_target_V2(v13, v15, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "store"));
  v19 = -[SFAnalyticsClient initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:](self, "initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:", v18, v17, v10, v7, v6);

  return v19;
}

- (SFAnalyticsClient)initWithStore:(id)a3 queue:(id)a4 name:(id)a5 requireDeviceAnalytics:(BOOL)a6 requireiCloudAnalytics:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  SFAnalyticsClient *v16;
  SFAnalyticsClient *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFAnalyticsClient;
  v16 = -[SFAnalyticsClient init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_store, a3);
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v17->_name, a5);
    v17->_requireDeviceAnalytics = a6;
    v17->_requireiCloudAnalytics = a7;
  }

  return v17;
}

- (void)withStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005858;
  block[3] = &unk_100018668;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)name
{
  return self->_name;
}

- (BOOL)requireDeviceAnalytics
{
  return self->_requireDeviceAnalytics;
}

- (BOOL)requireiCloudAnalytics
{
  return self->_requireiCloudAnalytics;
}

- (SFAnalyticsSQLiteStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)clearSFAnalyticsClientGlobalCache
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001DB68);
  v2 = (void *)qword_10001DB70;
  qword_10001DB70 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
}

+ (id)getSharedClientNamed:(id)a3 orCreateWithStorePath:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  SFAnalyticsClient *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const void *v25;
  const void *v27;
  NSObject *v28;
  const void *v29;
  _QWORD v30[5];
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001DB68);
  if (!qword_10001DB70)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)qword_10001DB70;
    qword_10001DB70 = v11;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByStandardizingPath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001DB70, "objectForKeyedSubscript:", v13));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
    if (v16)
    {
      v17 = v16;
      v18 = (SFAnalyticsClient *)v17;
    }
    else
    {
      v23 = v15;
      *(_QWORD *)buf = 0;
      v32 = buf;
      v33 = 0x3032000000;
      v34 = sub_100005D88;
      v35 = sub_100005D98;
      v36 = 0;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100005DA0;
      v30[3] = &unk_100018908;
      v30[4] = buf;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v30);
      v17 = *((id *)v32 + 5);
      _Block_object_dispose(buf, 8);

      v18 = -[SFAnalyticsClient initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:]([SFAnalyticsClient alloc], "initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:", v17, v9, v7, v6);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v9);
    }
LABEL_18:

    goto LABEL_19;
  }
  v18 = -[SFAnalyticsClient initWithStorePath:name:requireDeviceAnalytics:requireiCloudAnalytics:]([SFAnalyticsClient alloc], "initWithStorePath:name:requireDeviceAnalytics:requireiCloudAnalytics:", v13, v9, v7, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));

  if (v9 && v19)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v18, v9));
    v21 = (void *)qword_10001DB70;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

    goto LABEL_9;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));

  if (v24)
  {
    if (v9)
      goto LABEL_14;
LABEL_23:
    v29 = sub_100010B28("SecError");
    v20 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: name is unexpectedly nil! Not adding to namedSharedClientsByStorePath", buf, 2u);
    }
LABEL_9:

    if (!v18)
      goto LABEL_15;
    goto LABEL_19;
  }
  v27 = sub_100010B28("SecError");
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: sharedClient.storePath is unexpectedly nil! Not adding to namedSharedClientsByStorePath", buf, 2u);
  }

  if (!v9)
    goto LABEL_23;
LABEL_14:
  if (!v18)
  {
LABEL_15:
    v25 = sub_100010B28("SecError");
    v17 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SFAnalyticsClient: sharedClient is unexpectedly nil!", buf, 2u);
    }
    v18 = 0;
    goto LABEL_18;
  }
LABEL_19:

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
  return v18;
}

@end
