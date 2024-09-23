@implementation BRXPCSyncProxy

- (id)resultWithTimeout:(int)a3 exitMessage:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v17;
  uint64_t v18;
  intptr_t (*v19)(uint64_t);
  void *v20;
  BRXPCSyncProxy *v21;
  NSObject *v22;

  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10000ABD0;
  v20 = &unk_100024AB0;
  v21 = self;
  v10 = v7;
  v22 = v10;
  dispatch_async(v9, &v17);

  v11 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError br_errorWithPOSIXCode:](NSError, "br_errorWithPOSIXCode:", 60, v17, v18, v19, v20, v21));
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRXPCSyncProxy result](self, "result", v17, v18, v19, v20, v21));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRXPCSyncProxy result](self, "result"));
  if (v13)
  {
    v14 = 0;
    if (!v12)
LABEL_8:
      sub_100017128(v6, v14);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BRXPCSyncProxy error](self, "error"));
    if (!v12)
      goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BRXPCSyncProxy result](self, "result"));

  return v15;
}

@end
