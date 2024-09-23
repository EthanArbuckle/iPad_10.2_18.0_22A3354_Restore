@implementation BCBackgroundTaskAssertion

- (id)_init
{
  BCBackgroundTaskAssertion *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v7;
  NSMutableDictionary *identifiersByTaskID;
  NSMutableArray *v9;
  NSMutableArray *taskIDs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCBackgroundTaskAssertion;
  v2 = -[BCBackgroundTaskAssertion init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BKLibraryIndexerAssetProgressAssertion.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    identifiersByTaskID = v2->_identifiersByTaskID;
    v2->_identifiersByTaskID = v7;

    v9 = objc_opt_new(NSMutableArray);
    taskIDs = v2->_taskIDs;
    v2->_taskIDs = v9;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11D06C;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)BCBackgroundTaskAssertion;
  -[BCBackgroundTaskAssertion dealloc](&v4, "dealloc");
}

+ (BCBackgroundTaskAssertion)sharedAssertion
{
  if (qword_3112F8 != -1)
    dispatch_once(&qword_3112F8, &stru_291978);
  return (BCBackgroundTaskAssertion *)(id)qword_3112F0;
}

- (void)claimAssertionForIdentifier:(id)a3 description:(id)a4
{
  -[BCBackgroundTaskAssertion _claimAssertionForIdentifier:description:signalBlock:](self, "_claimAssertionForIdentifier:description:signalBlock:", a3, a4, 0);
}

- (void)releaseAssertionForIdentifier:(id)a3
{
  -[BCBackgroundTaskAssertion _releaseAssertionForIdentifier:signalBlock:](self, "_releaseAssertionForIdentifier:signalBlock:", a3, 0);
}

- (void)_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11D3E8;
    block[3] = &unk_28C360;
    objc_copyWeak(&v27, &location);
    v24 = v8;
    v25 = v9;
    v26 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B7EB0(v13, v14, v15, v16, v17, v18, v19, v20);

    v21 = objc_retainBlock(v10);
    v22 = v21;
    if (v21)
      (*((void (**)(id))v21 + 2))(v21);

  }
}

- (void)_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_11D554;
    v20[3] = &unk_28CAB8;
    objc_copyWeak(&v23, &location);
    v21 = v6;
    v22 = v7;
    dispatch_async(queue, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = BCIMLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B7EE4(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = objc_retainBlock(v7);
    v19 = v18;
    if (v18)
      (*((void (**)(id))v18 + 2))(v18);

  }
}

- (void)_releaseAssertionForTaskID:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  if (UIBackgroundTaskInvalid != a3)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11D644;
    block[3] = &unk_28CC68;
    objc_copyWeak(v7, &location);
    v7[1] = (id)a3;
    dispatch_async(queue, block);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (void)dq_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  BCBackgroundTaskAssertion *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_11D900;
  v24[3] = &unk_28C430;
  v13 = v8;
  v25 = v13;
  v26 = self;
  v27 = &v28;
  v14 = objc_msgSend(v12, "beginBackgroundTaskWithName:expirationHandler:", v9, v24);

  v29[3] = (uint64_t)v14;
  v15 = BCIMLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v29[3];
    *(_DWORD *)buf = 134218498;
    v33 = v17;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Background task assertion %lu taken for identifier %@ and description %@", buf, 0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion taskIDs](self, "taskIDs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29[3]));
  objc_msgSend(v18, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29[3]));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v21);

  v22 = objc_retainBlock(v10);
  v23 = v22;
  if (v22)
    (*((void (**)(id))v22 + 2))(v22);

  _Block_object_dispose(&v28, 8);
}

- (void)dq_releaseAssertionForTaskID:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  void *v19;

  v5 = objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = BCIMLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
    v16 = 134218242;
    v17 = a3;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Releasing background task assertion %lu for identifier %@.", (uint8_t *)&v16, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  objc_msgSend(v11, "endBackgroundTask:", a3);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion taskIDs](self, "taskIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v12, "removeObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v14, "removeObjectForKey:", v15);

}

- (void)dq_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion taskIDs](self, "taskIDs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectEnumerator"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject"));
    if (!v14)
      goto LABEL_7;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

      if ((objc_msgSend(v6, "isEqualToString:", v16) & 1) != 0)
        break;

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject"));
      v14 = (void *)v17;
      if (!v17)
        goto LABEL_7;
    }
    v18 = objc_msgSend(v14, "unsignedIntegerValue");

    if (v18 != (id)UIBackgroundTaskInvalid)
    {
      v29 = BCIMLog();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v35 = 134218242;
        v36 = v18;
        v37 = 2112;
        v38 = v6;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Releasing background task assertion %lu for identifier %@.", (uint8_t *)&v35, 0x16u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion identifiersByTaskID](self, "identifiersByTaskID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18));
      objc_msgSend(v31, "removeObjectForKey:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCBackgroundTaskAssertion taskIDs](self, "taskIDs"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18));
      objc_msgSend(v33, "removeObject:", v34);

      v20 = objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
      -[NSObject endBackgroundTask:](v20, "endBackgroundTask:", v18);
    }
    else
    {
LABEL_7:
      v19 = BCIMLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1B7F84((uint64_t)v6, v20, v21, v22, v23, v24, v25, v26);
    }

  }
  v27 = objc_retainBlock(v7);
  v28 = v27;
  if (v27)
    (*((void (**)(id))v27 + 2))(v27);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)identifiersByTaskID
{
  return self->_identifiersByTaskID;
}

- (void)setIdentifiersByTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersByTaskID, a3);
}

- (NSMutableArray)taskIDs
{
  return self->_taskIDs;
}

- (void)setTaskIDs:(id)a3
{
  objc_storeStrong((id *)&self->_taskIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIDs, 0);
  objc_storeStrong((id *)&self->_identifiersByTaskID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
