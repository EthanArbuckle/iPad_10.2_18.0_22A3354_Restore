@implementation FMDBackgroundServerChannel

- (FMDBackgroundServerChannel)init
{
  FMDBackgroundServerChannel *v2;
  void *v3;
  void *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDBackgroundServerChannel;
  v2 = -[FMDBackgroundServerChannel init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    objc_msgSend(v3, "setURLCache:", 0);
    objc_msgSend(v3, "setRequestCachePolicy:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDURLSessionFactory sessionWithConfiguration:](FMDURLSessionFactory, "sessionWithConfiguration:", v3));
    -[FMDBackgroundServerChannel setSession:](v2, "setSession:", v4);

    v5 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBackgroundServerChannel.serialqueue", 0);
    -[FMDBackgroundServerChannel setQueue:](v2, "setQueue:", v5);

  }
  return v2;
}

- (void)resumeBackgroundTasks
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDBackgroundServerChannel queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B9184;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  FMDBackgroundServerChannel *v24;
  id v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_claimAutoreleasedReturnValue(-[FMDBackgroundServerChannel queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B93A4;
  block[3] = &unk_1002C4FA8;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = self;
  v25 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)cancelRequestWithId:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10022DA10(v4);

}

- (void)cancelAllRequests
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDBackgroundServerChannel queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B9624;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return 1;
}

- (BOOL)isActive
{
  return 1;
}

- (void)tasksWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBackgroundServerChannel session](self, "session"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B97DC;
  v7[3] = &unk_1002C4FF0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v7);

}

- (FMDURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
