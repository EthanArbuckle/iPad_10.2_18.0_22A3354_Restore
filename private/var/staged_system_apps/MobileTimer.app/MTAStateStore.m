@implementation MTAStateStore

- (void)synchronize
{
  uint64_t v3;
  NSObject *v4;
  NSObject *serializerQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MTAStateStore *v8;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronizing state store", buf, 0xCu);
  }

  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006A2C;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_async(serializerQueue, block);
}

- (void)restoreLastEventWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *serializerQueue;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD block[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  MTAStateStore *v36;
  __int16 v37;
  void *v38;

  v4 = (void (**)(id, void *))a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000687C;
  block[3] = &unk_100099BA8;
  block[4] = self;
  block[5] = &v31;
  dispatch_sync(serializerQueue, block);
  if (*((_BYTE *)v32 + 24))
  {
    v7 = MTLogForCategory(8, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ bypassing state restore", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent blankEvent](MTAStateStoreEvent, "blankEvent"));
    v4[2](v4, v9);

    -[MTAStateStore clear](self, "clear");
    self->_shouldBypass = 0;
    goto LABEL_25;
  }
  v10 = MTLogForCategory(8, v6);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ restoring last event", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("kMTAStateStoreLatestEvent")));

  if (v13)
  {
    v29 = 0;
    v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(MTAStateStoreEvent, v14), v13, &v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = v29;
    if (v18)
    {
      v19 = MTLogForCategory(8, v17);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10006530C((uint64_t)self, (uint64_t)v18, v20);

    }
    if (v16)
      goto LABEL_20;
  }
  else
  {
    v22 = MTLogForCategory(8, v14);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ no latest event restored", buf, 0xCu);
    }

  }
  v24 = MTLogForCategory(8, v21);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ using blank event", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent blankEvent](MTAStateStoreEvent, "blankEvent"));
LABEL_20:
  v26 = MTLogForCategory(8, v21);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ restored last event: %{public}@", buf, 0x16u);

  }
  if (v4)
    v4[2](v4, v16);

LABEL_25:
  _Block_object_dispose(&v31, 8);

}

- (void)pushEvent:(id)a3 sync:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *serializerQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  MTAStateStore *v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v7 = MTLogForCategory(8, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setting event: %{public}@", buf, 0x16u);

  }
  serializerQueue = self->_serializerQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006A00;
  v12[3] = &unk_1000993B8;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_sync(serializerQueue, v12);

}

- (void)pushEvent:(id)a3
{
  -[MTAStateStore pushEvent:sync:](self, "pushEvent:sync:", a3, 1);
}

- (void)localSetup
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *serializerQueue;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MTAStateStore.access-queue", 0);
  serializerQueue = self->_serializerQueue;
  self->_serializerQueue = v3;

}

- (MTAStateStore)init
{
  MTAStateStore *v2;
  MTAStateStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAStateStore;
  v2 = -[MTAStateStore init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MTAStateStore localSetup](v2, "localSetup");
  return v3;
}

+ (id)shared
{
  if (qword_1000BFD20 != -1)
    dispatch_once(&qword_1000BFD20, &stru_100099B80);
  return (id)qword_1000BFD18;
}

- (void)bypass
{
  NSObject *serializerQueue;
  _QWORD block[5];

  serializerQueue = self->_serializerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032424;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_sync(serializerQueue, block);
}

- (id)getCurrentEvent
{
  return self->_event;
}

- (void)clear
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("kMTAStateStoreLatestEvent"));

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "synchronize");

}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serializerQueue, a3);
}

- (MTAStateStoreEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (BOOL)shouldBypass
{
  return self->_shouldBypass;
}

- (void)setShouldBypass:(BOOL)a3
{
  self->_shouldBypass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_serializerQueue, 0);
}

@end
