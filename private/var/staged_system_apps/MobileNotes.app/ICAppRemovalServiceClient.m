@implementation ICAppRemovalServiceClient

+ (id)sharedClient
{
  if (qword_1005DDDA8 != -1)
    dispatch_once(&qword_1005DDDA8, &stru_100551DF8);
  return (id)qword_1005DDDA0;
}

- (ICAppRemovalServiceClient)init
{
  ICAppRemovalServiceClient *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAppRemovalServiceClient;
  v2 = -[ICAppRemovalServiceClient init](&v7, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.notes.appremoval", v4);
    -[ICAppRemovalServiceClient setRequestCountQueue:](v2, "setRequestCountQueue:", v5);

    -[ICAppRemovalServiceClient setRequestCount:](v2, "setRequestCount:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ICAppRemovalServiceClient;
  -[ICAppRemovalServiceClient dealloc](&v3, "dealloc");
}

- (void)removeAppWithReply:(id)a3
{
  id v4;
  NSXPCConnection *connectionToService;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[ICAppRemovalServiceClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  connectionToService = self->_connectionToService;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007190C;
  v11[3] = &unk_100550E40;
  v6 = v4;
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v11));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000719E0;
  v9[3] = &unk_10054F8B8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "removeAppWithReply:", v9);

}

- (void)resumeConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICAppRemovalServiceClient requestCountQueue](self, "requestCountQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071AD4;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)suspendConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICAppRemovalServiceClient requestCountQueue](self, "requestCountQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071BF8;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestCountQueue, a3);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
