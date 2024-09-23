@implementation GTLoopbackService

- (GTLoopbackService)init
{
  GTLoopbackService *v2;
  os_log_t v3;
  OS_os_log *log;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GTLoopbackService;
  v2 = -[GTLoopbackService init](&v8, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.gputools.transport", "Loopback");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_create("com.apple.gputools.loopback", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)echo:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  id v7;
  int v9;
  id v10;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    v9 = 136315138;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sync: %s", (uint8_t *)&v9, 0xCu);

  }
  return v4;
}

- (void)echo:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *log;
  NSObject *v9;
  id v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
    v11 = 136315138;
    v12 = objc_msgSend(v10, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Async: %s", (uint8_t *)&v11, 0xCu);

  }
  v7[2](v7, v6);

}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, id);
  NSObject *log;
  NSObject *v11;
  id v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = log;
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    v13 = 134218242;
    v14 = a4;
    v15 = 2080;
    v16 = objc_msgSend(v12, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Repeat (%llu): %s", (uint8_t *)&v13, 0x16u);

  }
  for (; a4; --a4)
    v9[2](v9, v8);

}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *log;
  NSObject *v14;
  id v15;
  NSObject *serialQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  id v28;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v14 = log;
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
    *(_DWORD *)buf = 134218242;
    v26 = a4;
    v27 = 2080;
    v28 = objc_msgSend(v15, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Repeat (%llu): %s", buf, 0x16u);

  }
  serialQueue = self->_serialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000107C8;
  v20[3] = &unk_100030B78;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a4;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  dispatch_async(serialQueue, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
