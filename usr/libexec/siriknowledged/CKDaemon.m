@implementation CKDaemon

- (CKDaemon)init
{
  CKDaemon *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *concurrentQueue;
  uint64_t v13;
  NSMutableDictionary *cachedHandlers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKDaemon;
  v2 = -[CKDaemon init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("CKDaemon._serialQueue", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = dispatch_queue_create("CKDaemon._concurrentQueue", v10);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    cachedHandlers = v2->_cachedHandlers;
    v2->_cachedHandlers = (NSMutableDictionary *)v13;

  }
  return v2;
}

- (void)keysInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *concurrentQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDaemon *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F4A8;
  block[3] = &unk_100018B30;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);

}

- (void)keysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F2BC;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

}

- (void)valueForKey:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F0A0;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

}

- (void)valuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *concurrentQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDaemon *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EEF8;
  block[3] = &unk_100018B30;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);

}

- (void)valuesForKeys:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10000ED10;
  v24[4] = sub_10000ED20;
  v25 = &__NSArray0__struct;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10000ED10;
  v22[4] = sub_10000ED20;
  v23 = 0;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000ED28;
  v15[3] = &unk_100018B80;
  v16 = v8;
  v17 = self;
  v20 = v22;
  v21 = v24;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

- (void)valuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EB24;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

}

- (void)keysAndValuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *concurrentQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDaemon *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E97C;
  block[3] = &unk_100018B30;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);

}

- (void)keysAndValuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E790;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

}

- (void)triplesComponentsMatching:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *concurrentQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E5A4;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

}

- (void)saveKeysAndValues:(id)a3 toStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CKDaemon *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E36C;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);

}

- (void)saveKeysAndValues:(id)a3 toSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
    *(_DWORD *)buf = 136315650;
    v22 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]";
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Setting all values for keys=[%@] in synched store %@", buf, 0x20u);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E264;
  v17[3] = &unk_100018BA8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:](self, "saveKeysAndValues:toStoreWithIdentifier:completionHandler:", v14, v13, v17);

}

- (void)recordEventWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6 toStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  CKDaemon *v29;
  void (**v30)(id, void *);
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *))a8;
  if (objc_msgSend(v15, "compare:", v16) == (id)1)
  {
    v20 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]";
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s event startDate should NOT be greater than endDate. (startDate = %@, endDate = %@).", buf, 0x20u);
    }
    v31[0] = CFSTR("localizedDescription");
    v31[1] = CFSTR("storeIdentifier");
    v32[0] = CFSTR("Event startDate is greater than endDate");
    v32[1] = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siriknowledged"), 101, v21));

    v19[2](v19, v22);
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000E040;
    v23[3] = &unk_100018BD0;
    v24 = v14;
    v30 = v19;
    v25 = v18;
    v26 = v15;
    v27 = v16;
    v28 = v17;
    v29 = self;
    -[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:](self, "valueForKey:inStoreWithIdentifier:completionHandler:", v24, v25, v23);

    v22 = v24;
  }

}

- (void)removeValueForKey:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DE84;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);

}

- (void)removeValueForKey:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]";
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Removing value for key %@ in synched store %@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DD48;
  v15[3] = &unk_100018BA8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:](self, "removeValueForKey:fromStoreWithIdentifier:completionHandler:", v14, v13, v15);

}

- (void)removeValuesForKeys:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DBB0;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);

}

- (void)removeValuesForKeys:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]";
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Removing values for keys %@ in synched store %@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DAA0;
  v15[3] = &unk_100018BA8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:](self, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:", v14, v13, v15);

}

- (void)removeValuesMatchingCondition:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CKDaemon *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D8BC;
  v15[3] = &unk_100018B58;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);

}

- (void)removeValuesMatchingCondition:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    *(_DWORD *)buf = 136315650;
    v22 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]";
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Removing values matching condition %@ in synched store %@", buf, 0x20u);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D450;
  v17[3] = &unk_100018C20;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[CKDaemon keysInStoreWithIdentifier:completionHandler:](self, "keysInStoreWithIdentifier:completionHandler:", v12, v17);

}

- (void)removeAllValuesFromStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDaemon *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D2B8;
  block[3] = &unk_100018B30;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)removeAllValuesFromSynchedStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]";
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Removing ALL values in synched store %@", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D11C;
  v11[3] = &unk_100018C98;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CKDaemon keysInStoreWithIdentifier:completionHandler:](self, "keysInStoreWithIdentifier:completionHandler:", v9, v11);

}

- (void)setWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 toValue:(int64_t)a6 inStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  OS_dispatch_queue *serialQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D084;
  block[3] = &unk_100018CC0;
  block[4] = self;
  v26 = v17;
  v27 = v14;
  v28 = v15;
  v30 = v18;
  v31 = a6;
  v29 = v16;
  v20 = v18;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = v17;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)increaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *serialQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000CF20;
  v23[3] = &unk_100018CE8;
  v23[4] = self;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);

}

- (void)decreaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *serialQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000CDBC;
  v23[3] = &unk_100018CE8;
  v23[4] = self;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);

}

- (void)dropLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OS_dispatch_queue *serialQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000CD28;
  v23[3] = &unk_100018CE8;
  v23[4] = self;
  v24 = v15;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);

}

- (void)dropLinksWithLabel:(id)a3 fromSubject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *serialQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC98;
  block[3] = &unk_100018D10;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)dropLinksBetweenSubject:(id)a3 andObject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *serialQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C90C;
  block[3] = &unk_100018D10;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);

}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
  objc_msgSend(v4, "disableSyncAndDeleteCloudDataWithCompletionHandler:", v3);

}

- (NSMutableDictionary)cachedHandlers
{
  return self->_cachedHandlers;
}

- (void)setCachedHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHandlers, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

+ (id)sharedDaemon
{
  if (qword_10001DEE8 != -1)
    dispatch_once(&qword_10001DEE8, &stru_100018B08);
  return (id)qword_10001DEF0;
}

@end
