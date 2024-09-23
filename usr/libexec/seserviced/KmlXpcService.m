@implementation KmlXpcService

- (KmlXpcService)init
{
  KmlXpcService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KmlXpcService;
  v2 = -[KmlXpcService init](&v4, "init");
  if (v2)
    v2->_deviceClass = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
  return v2;
}

- (void)isSupported:(id)a3
{
  void (**v4)(id, id, uint64_t);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v4 = (void (**)(id, id, uint64_t))a3;
  v5 = sub_10021266C((uint64_t)self);
  if (v5 == 1)
  {
    v8 = 0;
    v7 = 1;
  }
  else if (v5 == 4279897)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
    v9 = 0;
    v7 = (uint64_t)objc_msgSend(v6, "areFeaturesSupported:outError:", 256, &v9);
    v8 = v9;

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v4[2](v4, v8, v7);

}

- (void)queueOwnerPairingSession:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, KmlOwnerPairingSession *, _BOOL8, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  KmlOwnerPairingSession *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  NSErrorUserInfoKey v29;
  void *v30;

  v6 = a3;
  v7 = (void (**)(id, KmlOwnerPairingSession *, _BOOL8, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueOwnerPairingSession:callback:]", 253, &stru_100316BD0, v9, v10, v11, v12, v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[KeyManagementLibrary sharedLibrary](KeyManagementLibrary, "sharedLibrary"));
  v28 = 0;
  if (objc_msgSend(v13, "numberOfPairingSessionsQueued") < 6)
  {
    v24 = -[KmlSession initWithRemoteObject:connection:andQueue:]([KmlOwnerPairingSession alloc], "initWithRemoteObject:connection:andQueue:", v6, v8, self->_workQueue);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
    objc_msgSend(v26, "addObject:", v24);
    objc_msgSend(v13, "addNewSession:firstInQueue:", v24, &v28);

    v22 = 0;
    v23 = v28 != 0;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KmlXpcService queueOwnerPairingSession:callback:]", 260, CFSTR("Number of sessions higher than max allowed (%u)"), v14, v15, v16, v17, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.pairing"));
    v29 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(13));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v30 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, 13, v21));

    v23 = 0;
    v24 = 0;
  }
  v7[2](v7, v24, v23, v22);

}

- (void)queueSharingSession:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  KmlKeySharingSession *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueSharingSession:callback:]", 283, &stru_100316BD0, v9, v10, v11, v12, v17);
  v13 = -[KmlSession initWithRemoteObject:connection:andQueue:]([KmlKeySharingSession alloc], "initWithRemoteObject:connection:andQueue:", v7, v8, self->_workQueue);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
  objc_msgSend(v15, "addObject:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[KeyManagementLibrary sharedLibrary](KeyManagementLibrary, "sharedLibrary"));
  v18 = 0;
  objc_msgSend(v16, "addNewSession:firstInQueue:", v13, &v18);
  (*((void (**)(id, KmlKeySharingSession *, _QWORD, _QWORD))v6 + 2))(v6, v13, v18, 0);

}

- (void)queueManagementSession:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  KmlKeyManagementSession *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueManagementSession:callback:]", 307, &stru_100316BD0, v9, v10, v11, v12, v17);
  v13 = -[KmlSession initWithRemoteObject:connection:andQueue:]([KmlKeyManagementSession alloc], "initWithRemoteObject:connection:andQueue:", v7, v8, self->_workQueue);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
  objc_msgSend(v15, "addObject:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[KeyManagementLibrary sharedLibrary](KeyManagementLibrary, "sharedLibrary"));
  v18 = 0;
  objc_msgSend(v16, "addNewSession:firstInQueue:", v13, &v18);
  (*((void (**)(id, KmlKeyManagementSession *, _QWORD, _QWORD))v6 + 2))(v6, v13, v18, 0);

}

- (void)queueCrossPlatformSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 callback:(id)a6
{
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;

  v9 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueCrossPlatformSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:callback:]", 329, &stru_100316BD0, v13, v14, v15, v16, v18);
  v17 = sub_1002342C4((uint64_t)KmlSharingTransport);
  v19 = (id)objc_claimAutoreleasedReturnValue(v17);
  sub_100234DF8((uint64_t)v19, v12, v11, v10);

  v9[2](v9, 0);
}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *workQueue;
  id v13;
  id v14;
  uint64_t v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerOwnerSideSharingTestInvitations:callback:]", 339, &stru_100316BD0, v8, v9, v10, v11, v15[0]);
  workQueue = self->_workQueue;
  v15[0] = (uint64_t)_NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)sub_100213058;
  v15[3] = (uint64_t)&unk_100303078;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(workQueue, v15);

}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerOwnerSideInvitationRequestHandler:]", 349, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213154;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideSharingTestInvitationUUIDHandler:]", 359, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213250;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideSharingTestCompletion:]", 369, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021334C;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideInvitationUnusableHandler:]", 379, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213448;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerCrossPlatformTestMessageOverIDSHandler:]", 389, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213544;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)registerCrossPlatformTestMessageSendHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerCrossPlatformTestMessageSendHandler:]", 399, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213640;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *workQueue;
  id v13;
  id v14;
  uint64_t v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService sendCrossPlatformTestData:toIdsIdentifier:]", 409, &stru_100316BD0, v8, v9, v10, v11, v15[0]);
  workQueue = self->_workQueue;
  v15[0] = (uint64_t)_NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)sub_100213764;
  v15[3] = (uint64_t)&unk_100304370;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(workQueue, v15);

}

- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *workQueue;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSidePasscodeRetryRequestHandler:]", 419, &stru_100316BD0, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100213860;
  block[3] = &unk_100303300;
  v13 = v4;
  v10 = v4;
  dispatch_async(workQueue, block);

}

- (void)unregisterSharingTestHandlers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService unregisterSharingTestHandlers]", 429, &stru_100316BD0, v2, v3, v4, v5, v7);
  dispatch_async((dispatch_queue_t)self->_workQueue, &stru_10030ED88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
