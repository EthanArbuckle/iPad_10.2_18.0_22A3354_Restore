@implementation FSKitHelper

- (id)getResourceQueue:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (id)qword_1000087C0;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000087C0, "objectForKeyedSubscript:", v3));
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createQueue:(id)a3
{
  id v3;
  id v4;
  dispatch_queue_t v5;
  id v6;

  v3 = a3;
  if (v3)
  {
    v4 = (id)qword_1000087C0;
    objc_sync_enter(v4);
    v5 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000087C0, "objectForKeyedSubscript:", v3));
    if (!v5)
    {
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.fskit_helper.queue.%@"), v3)));
      v5 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
      objc_msgSend((id)qword_1000087C0, "setObject:forKeyedSubscript:", v5, v3);

    }
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)openDevice:(id)a3 devicePath:(id)a4 flags:(int)a5 auditToken:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *queue;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  queue = objc_claimAutoreleasedReturnValue(-[FSKitHelper createQueue:](self, "createQueue:", v12));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000018EC;
  block[3] = &unk_1000041F0;
  v22 = v13;
  v23 = v14;
  v26 = a5;
  v24 = v12;
  v25 = v15;
  v16 = v12;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  dispatch_sync(queue, block);

}

- (void)wipeFS:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "BSDName"));
  v15 = objc_claimAutoreleasedReturnValue(-[FSKitHelper getResourceQueue:](self, "getResourceQueue:", v14));

  if (v15)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100001DB8;
    v21[3] = &unk_100004240;
    v22 = v10;
    v25 = v13;
    v23 = v11;
    v24 = v12;
    dispatch_sync(v15, v21);

  }
  else
  {
    v17 = fskit_std_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000028B0(v10);

    v19 = fs_errorForPOSIXError(9);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    (*((void (**)(id, void *))v13 + 2))(v13, v20);

  }
}

- (void)revoke:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "BSDName"));
  v9 = objc_claimAutoreleasedReturnValue(-[FSKitHelper getResourceQueue:](self, "getResourceQueue:", v8));

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000248C;
    v15[3] = &unk_100004268;
    v16 = v6;
    v17 = v7;
    dispatch_sync(v9, v15);

  }
  else
  {
    v11 = fskit_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100002BE4(v6);

    v13 = fs_errorForPOSIXError(22);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*((void (**)(id, void *))v7 + 2))(v7, v14);

  }
}

@end
