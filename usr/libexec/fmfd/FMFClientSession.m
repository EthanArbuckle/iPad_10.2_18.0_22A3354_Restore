@implementation FMFClientSession

- (FMFClientSession)initWithConnection:(id)a3
{
  FMFClientSession *v3;
  dispatch_queue_t v4;
  id v5;
  id v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  FMFClientSession *v11;

  v9.receiver = self;
  v9.super_class = (Class)FMFClientSession;
  v3 = -[ClientSession initWithConnection:](&v9, "initWithConnection:", a3);
  if (v3)
  {
    v4 = dispatch_queue_create("FMFClientSession-HandlesQueue", 0);
    -[FMFClientSession setHandlesQueue:](v3, "setHandlesQueue:", v4);

    v5 = objc_alloc_init((Class)NSMutableSet);
    -[FMFClientSession set_handlesInternal:](v3, "set_handlesInternal:", v5);

    v6 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "📩 %@: init", buf, 0xCu);
    }

  }
  return v3;
}

- (void)getFences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  FMFClientSession *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v10, "getFences:", v4);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fenceSequencer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fences"));

    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: getFences %@", buf, 0x16u);
    }

    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v7, 0);
  }
}

- (void)sessionWasCreatedRefresh
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  int v16;
  FMFClientSession *v17;
  __int16 v18;
  int v19;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: sessionWasCreatedRefresh", (uint8_t *)&v16, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "hasModelInitialized");

  v7 = _os_feature_enabled_impl("FindMy", "Network_Scaling_Improvements");
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 1024;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: networkScalingImprovementsFeatureEnabled: %i", (uint8_t *)&v16, 0x12u);
  }

  if ((v7 & v6) == 1)
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = self;
      v12 = "%@: Skipping init and refresh due to model already being initialized";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v14 = objc_msgSend(v13, "sendInitWithLazyCheckForSession:withReason:completion:", self, 14, &stru_100099F40);

    if ((v14 & 1) != 0)
      return;
    v15 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = self;
      v12 = "%@: Skipping init and refresh due to lazy init controller preventing init";
      goto LABEL_11;
    }
  }

}

- (NSMutableSet)_handlesInternal
{
  return self->__handlesInternal;
}

- (NSXPCProxyCreating)clientProxy
{
  NSXPCProxyCreating *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFClientSession;
  v2 = -[ClientSession clientProxy](&v4, "clientProxy");
  return (NSXPCProxyCreating *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (NSSet)handles
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100024A68;
  v11 = sub_100024A78;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMFClientSession handlesQueue](self, "handlesQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CA94;
  v6[3] = &unk_100099E58;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (OS_dispatch_queue)handlesQueue
{
  return self->_handlesQueue;
}

- (void)set_handlesInternal:(id)a3
{
  objc_storeStrong((id *)&self->__handlesInternal, a3);
}

- (void)setHandlesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlesQueue, a3);
}

- (void)setClientPid:(id)a3
{
  objc_storeStrong((id *)&self->_clientPid, a3);
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

+ (id)sharedHandleTransactionQueue
{
  if (qword_1000B3738 != -1)
    dispatch_once(&qword_1000B3738, &stru_100099E08);
  return (id)qword_1000B3730;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  FMFClientSession *v7;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "📩 %@: deinit", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)FMFClientSession;
  -[ClientSession dealloc](&v5, "dealloc");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientSession connection](self, "connection"));
  v4 = objc_opt_class(self);
  v5 = getpid();
  if (objc_msgSend(v3, "processIdentifier"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> {pid = %d, cpid = %d}"), v4, self, v5, objc_msgSend(v3, "processIdentifier")));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFClientSession clientPid](self, "clientPid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> {pid = %d, cpid = %d}"), v4, self, v5, objc_msgSend(v7, "intValue")));

  }
  return (NSString *)v6;
}

- (void)invalidateMappingPackets:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002467C;
  v9[3] = &unk_100099830;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "invalidateMappingPackets:completion:", v6, v9);

}

- (void)importMappingPacket:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024750;
  v11[3] = &unk_100099E30;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "importMappingPacket:forSession:completion:", v10, self, v11);

}

- (void)upselliCloudIfNeeded
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("lastAlertDate")));

  -[FMFClientSession _alertTimeoutInterval](self, "_alertTimeoutInterval");
  v5 = -v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", v5));

  if (!v10 || objc_msgSend(v10, "compare:", v7) == (id)-1)
  {
    +[FMFDUserNotification upselliCloudAlert](FMFDUserNotification, "upselliCloudAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("lastAlertDate"));

  }
}

- (double)_alertTimeoutInterval
{
  void *v2;
  double v3;
  double v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v2, "upsellTimeoutInSeconds");
  v4 = v3;

  result = 604800.0;
  if (v4 > 0.0)
    return v4;
  return result;
}

- (void)addFriendHandles:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  FMFClientSession *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FMFClientSession sharedHandleTransactionQueue](FMFClientSession, "sharedHandleTransactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024B1C;
  block[3] = &unk_100099348;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)removeFriendHandles:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFClientSession handlesQueue](self, "handlesQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024F6C;
  block[3] = &unk_100099348;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)removeAllFriendHandles
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFClientSession handlesQueue](self, "handlesQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000250A4;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setDebugContext:(id)a3
{
  -[FMFClientSession set_debugContext:](self, "set_debugContext:", a3);
}

- (void)getCurrentTrackedHandles:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMFClientSession handlesQueue](self, "handlesQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025268;
  block[3] = &unk_100099E80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[FMFClientSession sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:](self, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v16, v15, v14, v13, v12);

}

- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v12 = a7;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFriendshipRequest friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:](FMFFriendshipRequest, "friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:", a3, v13, 0, a4, a6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025490;
  v17[3] = &unk_100099EA8;
  v17[4] = self;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v15, "sendFriendshipOfferRequest:forSession:callerId:completion:", v14, self, v13, v17);

}

- (void)dispayOfferAlertDialogsWithoutRepeatForError:(id)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  FMFClientSession *v8;

  v4 = a3;
  if (!-[FMFClientSession blockingDialogs](self, "blockingDialogs"))
  {
    -[FMFClientSession setBlockingDialogs:](self, "setBlockingDialogs:", 1);
    v5 = dispatch_time(0, 500000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000255BC;
    v6[3] = &unk_100099348;
    v7 = v4;
    v8 = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFriendshipRequest friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:](FMFFriendshipRequest, "friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:", v16, v14, 0, v15, v13));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100025814;
  v20[3] = &unk_100099EA8;
  v20[4] = self;
  v21 = v12;
  v19 = v12;
  objc_msgSend(v18, "extendFriendshipOfferRequest:forSession:callerId:completion:", v17, self, v14, v20);

}

- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFriendshipRequest friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:](FMFFriendshipRequest, "friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:", v16, v14, 1, v15, v13));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000259B4;
  v20[3] = &unk_100099EA8;
  v20[4] = self;
  v21 = v12;
  v19 = v12;
  objc_msgSend(v18, "sendFriendshipInviteRequest:forSession:callerId:completion:", v17, self, v14, v20);

}

- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  FMFClientSession *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFNotNowRequest notNowRequestToHandles:fromHandle:](FMFNotNowRequest, "notNowRequestToHandles:fromHandle:", v11, v9));
  v13 = sub_100011D0C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    *(_DWORD *)buf = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "📩 %@: sending NotNow request (%@,%@)...", buf, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100025BE8;
  v19[3] = &unk_100099EA8;
  v19[4] = self;
  v20 = v10;
  v18 = v10;
  objc_msgSend(v17, "sendNotNowRequest:forSession:callerId:completion:", v12, self, v9, v19);

}

- (void)approveFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025D94;
  v10[3] = &unk_100099830;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "approveFriendshipRequest:forSession:completion:", v7, self, v10);

}

- (void)declineFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025E58;
  v10[3] = &unk_100099830;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "declineFriendshipRequest:forSession:completion:", v7, self, v10);

}

- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FMFClientSession *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100025F80;
  v19[3] = &unk_100099EF8;
  v23 = v12;
  v24 = v13;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  objc_msgSend(v14, "refreshForSession:withReason:withCompletion:", 0, 3, v19);

}

- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FMFClientSession *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026264;
  v19[3] = &unk_100099F20;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "refreshForSession:withReason:withCompletion:", 0, 3, v19);

}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "getPendingFriendshipRequestsWithCompletion:", v3);

}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = (void (**)(id, void *, _QWORD))a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "followerHandleForIdentifier:", v11));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "offerExpireDateForHandle:withGroupId:", v12, v15));

    v8[2](v8, v14, 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 102, 0));
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v14);
  }

}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "getHandlesWithPendingOffers:", v3);

}

- (void)fetchLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v14 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100026780;
    v18[3] = &unk_100099830;
    v19 = v12;
    objc_msgSend(v13, "fetchLocationForHandles:forSession:callerId:priority:completionBlock:", v14, self, v11, a5, v18);

    v15 = v19;
  }
  else
  {
    v16 = FMFErrorDomain;
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("No handle was passed");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 101, v15));
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v17, 0);

  }
}

- (void)fetchLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002692C;
    v17[3] = &unk_100099830;
    v18 = v12;
    objc_msgSend(v13, "fetchLocationForHandles:forSession:callerId:priority:completionBlock:", v10, self, v11, a5, v17);

    v14 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    v15 = FMFErrorDomain;
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("No handle was passed");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 101, v14));
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v16, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)locationForHandle:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationForHandle:", v5));

  if (v8)
    (*((void (**)(id, void *, _QWORD, _QWORD))v8 + 2))(v8, v7, 0, 0);

}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "getHandlesSharingLocationsWithMe:", v3);

}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v7, "getHandlesSharingLocationsWithMeWithGroupId:completion:", v6, v5);

}

- (void)getHandlesSharingMyLocation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "getHandlesSharingMyLocation:", v3);

}

- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v7, "getHandlesSharingMyLocationWithGroupId:completion:", v6, v5);

}

- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "followingHandleForIdentifier:", v11));
  if (v12)
  {
    if (v14)
      v13 = (uint64_t)objc_msgSend(v12, "isSharingThroughGroupId:", v14);
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, v13, 0, 0);

}

- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "followerHandleForIdentifier:", v11));

  if (v12 && (!v8 || (objc_msgSend(v12, "isSharingThroughGroupId:", v8) & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v13 = (uint64_t)objc_msgSend(v14, "hasPendingOfferToHandle:withGroupId:", v15, v8);

  }
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, v13, 0, 0);

}

- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v7, "setHideMyLocationEnabled:forSession:completion:", v4, self, v6);

}

- (void)isMyLocationEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(v4, objc_msgSend(v5, "locationHidden") ^ 1, 0);

}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v7, "setAllowFriendRequestsEnabled:forSession:completion:", v4, self, v6);

}

- (void)isAllowFriendRequestsEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v4, objc_msgSend(v5, "isAllowFriendRequestsEnabled"), 0);

}

- (void)getAccountEmailAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAccountEmailAddress"));
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)getAllLocations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026FE0;
  v6[3] = &unk_100099830;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "refreshForSession:withReason:withCompletion:", 0, 3, v6);

}

- (void)forceRefresh
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000270BC;
  v2[3] = &unk_1000995E8;
  v2[4] = self;
  -[FMFClientSession forceRefreshWithCompletion:](self, "forceRefreshWithCompletion:", v2);
}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  FMFClientSession *v9;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Force refreshing", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v7, "refreshForSession:withReason:withCompletion:", self, 1, v4);

}

- (void)setExpiredInitTimestamp
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMFLazyInitController sharedInstance](FMFLazyInitController, "sharedInstance"));
  objc_msgSend(v2, "expireInitTimestamp");

}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v11, "getPendingMappingPacketsForHandle:groupId:forSession:completion:", v10, v9, self, v8);

}

- (void)deviceSharingLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  FMFClientSession *v29;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100024A68;
  v26 = sub_100024A78;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  if ((objc_msgSend(v5, "hasCredentials") & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
  v27 = v6;

  if (v23[5])
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Device sharing location called, but account is not yet initialized or there's no account.", buf, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v10 = objc_msgSend(v9, "hasModelInitialized");

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002762C;
  v18[3] = &unk_100099F68;
  v20 = &v22;
  v18[4] = self;
  v11 = v4;
  v19 = v11;
  v21 = v10;
  v12 = objc_retainBlock(v18);
  v13 = v12;
  if (v23[5])
    v14 = 1;
  else
    v14 = v10;
  if ((v14 & 1) != 0)
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100027890;
    v16[3] = &unk_100099F90;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v15, "refreshForSession:withReason:withCompletion:", self, 11, v16);

  }
  _Block_object_dispose(&v22, 8);

}

- (void)allDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allDevices"));
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)getMaxLocatingInterval:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v5, "maxLocatingInterval");
  (*((void (**)(id, _QWORD))a3 + 2))(v4, 0);

}

- (void)isNetworkReachable:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void (**v6)(id, id, void *);

  v6 = (void (**)(id, id, void *))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFNetworkObserver sharedInstance](FMFNetworkObserver, "sharedInstance"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1009, 0));
  if (v6)
    v6[2](v6, v4, v5);

}

- (void)canOfferToHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v8, "canOfferToHandles:forSession:completion:", v7, self, v6);

}

- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAddressBook sharedAddressBook](FMFAddressBook, "sharedAddressBook"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prettyNameForHandle:", v5));

  if (v8)
    v8[2](v8, v7, 0);

}

- (void)getRecordIdForHandle:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a4)
  {
    v5 = (void (**)(id, id, _QWORD))a4;
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getContactForHandle:", v6));

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v5[2](v5, v9, 0);

  }
}

- (void)setActiveDevice:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100027D64;
  v9[3] = &unk_100099830;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "setActiveDevice:forSession:completion:", v6, 0, v9);

}

- (void)removeDevice:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v7, "removeDevice:forSession:completion:", v6, 0, v5);

}

- (void)iCloudAccountNameWithCompletion:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  id v5;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iCloudAccountName"));

  v3[2](v3, v5);
}

- (void)crashDaemon
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  int v7;
  FMFClientSession *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](Daemon, "sharedInstance"));
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: crashDaemon called!", (uint8_t *)&v7, 0xCu);
    }

    exit(1);
  }
}

- (void)exit5XXGracePeriod
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](Daemon, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalBuild");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    objc_msgSend(v4, "exit5XXGracePeriod");

  }
}

- (void)isIn5XXGracePeriodWithCompletion:(id)a3
{
  void *v3;
  id v4;
  void (**v5)(id, id);

  v5 = (void (**)(id, id))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "isIn5XXGracePeriod");

  v5[2](v5, v4);
}

- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, id);
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
  v12 = 0;
  objc_msgSend(v10, "sendMessage:toIdentifier:error:", v9, v8, &v12);

  v11 = v12;
  if (v7)
    v7[2](v7, v11);

}

- (void)dumpStateWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void (**v26)(id, void *);
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];

  v26 = (void (**)(id, void *))a3;
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "\n################GATHERING STATE INFO FOR CLIENT######################\n", buf, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientSessions"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handles"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("identifier")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(",")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientPid"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientBundleId"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMFClientSession(0x%lX), clientPid: %@, clientBundleId: %@, handles(%@)"), v12, v17, v18, v16));
        objc_msgSend(v7, "addObject:", v19);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, CFSTR("clientSessions"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDStoreController sharedInstance](FMFDStoreController, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "modelCache"));

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, CFSTR("modelCache"));
  v23 = sub_100011D0C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "\n################SENDING STATE INFO TO CLIENT######################\n", buf, 2u);
  }

  v26[2](v26, v25);
}

- (void)sessionHandleReport:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *);
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v16 = (void (**)(id, void *))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientSessions"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
        v10 = objc_msgSend(v9, "processIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientPid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientBundleId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %d – %@, %@"), v8, v10, v11, v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handles"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));

        objc_msgSend(v3, "setObject:forKey:", v15, v13);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v19);
  }

  if (v16)
    v16[2](v16, v3);

}

- (void)sendFMFIDSPacketsForHandleIdToMappingIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
        -[FMFClientSession sendFMFIDSPacket:toHandle:](self, "sendFMFIDSPacket:toHandle:", v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)sendFMFIDSPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  FMFClientSession *v31;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v9 = objc_msgSend(v8, "blockFMFChannel");

    if ((v9 & 1) == 0)
    {
      v10 = sub_100011D0C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: sending packet over FMF IDS channel", buf, 0xCu);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
      objc_msgSend(v12, "sendMappingPacket:toHandle:", v6, v7);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v14 = objc_msgSend(v13, "sendOnlyFMFChannel");

    if ((v14 & 1) == 0)
    {
      v15 = sub_100011D0C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: sending packet back to client", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientSessions"));

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1)
                                                                               + 8 * (_QWORD)v23), "clientProxy", (_QWORD)v25));
            objc_msgSend(v24, "sendMappingPacket:toHandle:", v6, v7);

            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v21);
      }

    }
  }

}

- (void)favoritesForMaxCount:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "favoritesSequencer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "favorites"));

  if (v13)
  {
    v10 = objc_msgSend(v9, "count");
    if (v10 > objc_msgSend(v13, "unsignedIntegerValue"))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v13, "unsignedIntegerValue")));

      v9 = (void *)v11;
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    -[FMFClientSession _refreshLocationsForHandles:](self, "_refreshLocationsForHandles:", v12);

  }
  if (v6)
    v6[2](v6, v9, 0);

}

- (void)nearbyLocationsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);

  v9 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "followingHandles"));

  if (objc_msgSend(v5, "count"))
    -[FMFClientSession _refreshLocationsForHandles:](self, "_refreshLocationsForHandles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allLocations"));

  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  else
    v8 = 0;
  if (v9)
    v9[2](v9, v8, 0);

}

- (void)_refreshLocationsForHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iCloudId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v6));

  -[FMFClientSession fetchLocationForHandles:callerId:priority:completion:](self, "fetchLocationForHandles:callerId:priority:completion:", v4, v7, 0, 0);
}

- (void)includeDeviceInAutomations:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  int v14;
  FMFClientSession *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: : includeDeviceInAutomations:", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v8 = objc_msgSend(v7, "isActiveAutoMeDevice");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceSharingLocation"));
    v11 = objc_msgSend(v10, "isThisDevice");

    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138413058;
      v15 = self;
      v16 = 1024;
      v17 = v11;
      v18 = 1024;
      v19 = v8;
      v20 = 1024;
      v21 = v11 | v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: isMeDevice %i : isActiveAutoMeDevice %i : isDeviceIncludedInAutomations %i", (uint8_t *)&v14, 0x1Eu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, v11 | v8, 0);
  }

}

- (void)showActiveDeviceChangedAlert
{
  +[FMFDUserNotification showActiveDeviceChangedAlert](FMFDUserNotification, "showActiveDeviceChangedAlert");
}

- (void)showRestrictedAlert
{
  id v3;
  NSObject *v4;
  int v5;
  FMFClientSession *v6;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: : showRestrictedAlert", (uint8_t *)&v5, 0xCu);
  }

  +[FMFDUserNotification showRestrictedAlert](FMFDUserNotification, "showRestrictedAlert");
}

- (void)showMaxFollowersLimitReachedAlert
{
  +[FMFDUserNotification showMaxFollowersLimitReachedAlert](FMFDUserNotification, "showMaxFollowersLimitReachedAlert");
}

- (void)showLocationServicesSwitchOffAlert
{
  +[FMFDUserNotification showLocationServicesSwitchOffAlert](FMFDUserNotification, "showLocationServicesSwitchOffAlert");
}

- (void)showShareMyLocationSystemServiceOffAlert
{
  +[FMFDUserNotification showShareMyLocationSystemServiceOffAlert](FMFDUserNotification, "showShareMyLocationSystemServiceOffAlert");
}

- (void)showShareMyLocationiCloudSettingsOffAlert
{
  +[FMFDUserNotification showShareMyLocationiCloudSettingsOffAlert](FMFDUserNotification, "showShareMyLocationiCloudSettingsOffAlert");
}

- (void)showForbiddenRegionAlert
{
  +[FMFDUserNotification showForbiddenRegionAlert](FMFDUserNotification, "showForbiddenRegionAlert");
}

- (void)show5XXDuringStartOfferAlert
{
  +[FMFDUserNotification show5XXDuringStartOfferAlert](FMFDUserNotification, "show5XXDuringStartOfferAlert");
}

- (void)show5XXDuringStopOfferAlert
{
  +[FMFDUserNotification show5XXDuringStopOfferAlert](FMFDUserNotification, "show5XXDuringStopOfferAlert");
}

- (void)showGenericErrorAlert
{
  +[FMFDUserNotification showGenericErrorAlert](FMFDUserNotification, "showGenericErrorAlert");
}

- (void)showMeDeviceAlert
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  FMFClientSession *v7;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: : showMeDeviceAlert", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028FC0;
  v5[3] = &unk_100099FB8;
  v5[4] = self;
  +[FMFDUserNotification showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:](FMFDUserNotification, "showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:", 0, v5);
}

- (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000290F0;
  v6[3] = &unk_100099FE0;
  v7 = a4;
  v5 = v7;
  +[FMFDUserNotification showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:](FMFDUserNotification, "showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:", a3, v6);

}

- (void)upselliCloudAlert
{
  +[FMFDUserNotification upselliCloudAlert](FMFDUserNotification, "upselliCloudAlert");
}

- (void)showNetworkOfflineDuringOfferAlert
{
  +[FMFDUserNotification showNetworkOfflineDuringOfferAlert](FMFDUserNotification, "showNetworkOfflineDuringOfferAlert");
}

- (void)showNetworkOfflineDuringStopOfferAlert
{
  +[FMFDUserNotification showNetworkOfflineDuringStopOfferAlert](FMFDUserNotification, "showNetworkOfflineDuringStopOfferAlert");
}

- (void)notLoggedIntoiCloudAlert
{
  +[FMFDUserNotification notLoggedIntoiCloudAlert](FMFDUserNotification, "notLoggedIntoiCloudAlert");
}

- (void)showAirDropImportAlertForId:(id)a3
{
  +[FMFDUserNotification showAirDropImportAlertForId:](FMFDUserNotification, "showAirDropImportAlertForId:", a3);
}

- (void)showAirDropImportErrorAlert
{
  +[FMFDUserNotification showAirDropImportErrorAlert](FMFDUserNotification, "showAirDropImportErrorAlert");
}

- (void)getDataForPerformanceRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://statici.icloud.com/fmipmobile/deviceImages-4.0/iPhone/iPhone8,1-e1e4e3-dadcdb/online-nolocation_ipad.png")));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v4, 4, 60000.0);
    objc_msgSend(v5, "setHTTPMethod:", CFSTR("GET"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

    v8 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    objc_msgSend(v9, "setURLCache:", 0);
    objc_msgSend(v9, "setHTTPCookieStorage:", 0);
    objc_msgSend(v9, "setHTTPCookieAcceptPolicy:", 1);
    objc_msgSend(v9, "setURLCredentialStorage:", 0);
    objc_msgSend(v9, "setRequestCachePolicy:", 1);
    objc_msgSend(v9, "set_appleIDContext:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v9, 0, 0));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100029328;
    v12[3] = &unk_10009A008;
    v13 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v5, v12));
    objc_msgSend(v11, "resume");

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

- (void)contactForPayload:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if ((unint64_t)objc_msgSend(v6, "length") > 0xF)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFClientSession _decryptPayload:withToken:withSession:](FMFClientSession, "_decryptPayload:withToken:withSession:", v6, 0, self));
    v10 = v11;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("handle")));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v12, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getContactForHandle:", v13));

        if (v15)
        {
          v7[2](v7, v15, 0);
        }
        else
        {
          v20 = sub_100011D0C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_100063E48();

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1013, 0));
          ((void (**)(id, void *, void *))v7)[2](v7, 0, v22);

        }
      }
      else
      {
        v18 = sub_100011D0C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100063DE4();

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v13);
      }

    }
    else
    {
      v16 = sub_100011D0C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100063D84();

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
    }

  }
  else
  {
    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100063D24();

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);
  }

}

- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CLLocationDegrees v18;
  void *v19;
  double v20;
  CLLocationDegrees v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  CLLocationCoordinate2D v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") > 0xF)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFClientSession _decryptPayload:withToken:withSession:](FMFClientSession, "_decryptPayload:withToken:withSession:", v6, 0, self));
    v10 = v11;
    if (!v11)
    {
      v30 = sub_100011D0C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_100063F08();

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v12);
      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("handle")));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("location")));
    v14 = (void *)v13;
    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v12, 0));
      if (v14)
        goto LABEL_8;
    }
    else
    {
      v15 = 0;
      if (v13)
      {
LABEL_8:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("lat")));
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("lon")));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("hacc")));
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("ts")));
        objc_msgSend(v25, "doubleValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

        v27 = objc_alloc((Class)CLLocation);
        v28 = CLLocationCoordinate2DMake(v18, v21);
        v29 = objc_msgSend(v27, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v26, v28.latitude, v28.longitude, 0.0, v24, 0.0);

        if (v15)
        {
LABEL_9:
          (*((void (**)(id, void *, id, _QWORD))v7 + 2))(v7, v15, v29, 0);
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
LABEL_15:
        v32 = sub_100011D0C();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_100063F68();

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v34);

        goto LABEL_18;
      }
    }
    v29 = 0;
    if (v15)
      goto LABEL_9;
    goto LABEL_15;
  }
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_100063EA8();

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
  (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v10);
LABEL_20:

}

- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  FMFClientSession *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  if ((unint64_t)objc_msgSend(v8, "length") > 0xF)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[FMFClientSession _decryptPayload:withToken:withSession:](FMFClientSession, "_decryptPayload:withToken:withSession:", v8, v9, self));
    v13 = (void *)v14;
    if (v14)
    {
      v30 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
      v25 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v15, 0, &v25));
      v17 = v25;
      v18 = sub_100011D0C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = self;
        v28 = 2112;
        v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: payloadData %@", buf, 0x16u);
      }

      if (v17)
      {
        v20 = sub_100011D0C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10006408C();

        v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
        v10[2](v10, 0, v22);
      }
      else
      {
        v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v16, 4);
        ((void (**)(id, id, id))v10)[2](v10, v22, 0);
      }

    }
    else
    {
      v23 = sub_100011D0C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10006402C();

      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      v10[2](v10, 0, v17);
    }

  }
  else
  {
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100063FCC();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
    v10[2](v10, 0, v13);
  }

}

+ (void)internalDataForPayload:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  double v22;
  CLLocationDegrees v23;
  void *v24;
  double v25;
  CLLocationDegrees v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  CLLocationCoordinate2D v33;
  id v34;
  NSObject *v35;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") > 0xF)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFClientSession _decryptPayload:withToken:withSession:](FMFClientSession, "_decryptPayload:withToken:withSession:", v5, 0, 0));
    v9 = v10;
    if (!v10)
    {
      v19 = sub_100011D0C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10006414C();

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, 0, v15);
      goto LABEL_20;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("handle")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_nullToNil"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("location")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fm_nullToNil"));

    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getContactForHandle:", v15));

      if (!v14)
      {
        if (v15)
        {
          v18 = 0;
LABEL_15:
          (*((void (**)(id, void *, void *, id, _QWORD))v6 + 2))(v6, v15, v17, v18, 0);
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
LABEL_16:
        v34 = sub_100011D0C();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_1000641AC();

        v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, 0, v18);
        v15 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v15 = 0;
      v17 = 0;
      if (!v14)
        goto LABEL_16;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("lat")));
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("lon")));
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("hacc")));
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("ts")));
    objc_msgSend(v30, "doubleValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

    v32 = objc_alloc((Class)CLLocation);
    v33 = CLLocationCoordinate2DMake(v23, v26);
    v18 = objc_msgSend(v32, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v31, v33.latitude, v33.longitude, 0.0, v29, 0.0);

    goto LABEL_15;
  }
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000640EC();

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, 0, v9);
LABEL_21:

}

- (void)dataForPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  double v23;
  CLLocationDegrees v24;
  void *v25;
  double v26;
  CLLocationDegrees v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  CLLocationCoordinate2D v34;
  id v35;
  NSObject *v36;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") > 0xF)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFClientSession _decryptPayload:withToken:withSession:](FMFClientSession, "_decryptPayload:withToken:withSession:", v6, 0, self));
    v10 = v11;
    if (!v11)
    {
      v20 = sub_100011D0C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10006414C();

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v16);
      goto LABEL_20;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("handle")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fm_nullToNil"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("location")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fm_nullToNil"));

    if (v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v13));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getContactForHandle:", v16));

      if (!v15)
      {
        if (v16)
        {
          v19 = 0;
LABEL_15:
          (*((void (**)(id, void *, void *, id, _QWORD))v7 + 2))(v7, v16, v18, v19, 0);
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
LABEL_16:
        v35 = sub_100011D0C();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_1000641AC();

        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, v19);
        v16 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v16 = 0;
      v18 = 0;
      if (!v15)
        goto LABEL_16;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("lat")));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("lon")));
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("hacc")));
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("ts")));
    objc_msgSend(v31, "doubleValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

    v33 = objc_alloc((Class)CLLocation);
    v34 = CLLocationCoordinate2DMake(v24, v27);
    v19 = objc_msgSend(v33, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v32, v34.latitude, v34.longitude, 0.0, v30, 0.0);

    goto LABEL_15;
  }
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_1000640EC();

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v10);
LABEL_21:

}

+ (id)_decryptPayload:(id)a3 withToken:(id)a4 withSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *i;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  id obj;
  uint64_t v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  unint64_t v51;
  _BYTE v52[128];
  id v53;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", off_1000B3018));

  if (v8)
  {
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100064210();

    v53 = v8;
    v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));

    v11 = (void *)v14;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v15)
  {
    v37 = v9;
    v38 = v8;
    v16 = 0;
    v17 = 0;
    v41 = *(_QWORD *)v45;
    v18 = obj;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v41)
          objc_enumerationMutation(v18);
        v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);

        v21 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v20, 0);
        v22 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v7, 0);
        v43 = 0;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "decryptWithKey:error:", v21, &v43));
        v17 = (unint64_t)v43;
        if (v17)
        {
          v24 = sub_100011D0C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v49 = a1;
            v50 = 2112;
            v51 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@: Error decrypting data error: %@", buf, 0x16u);
          }
        }
        else
        {

          v42 = 0;
          v25 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v23, 0, &v42));
          v26 = v42;
          if (!v26)
          {
            v15 = (id)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v25, "firstObject"));
            v30 = sub_100011D0C();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v49 = a1;
              v50 = 2112;
              v51 = (unint64_t)v15;
              _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%@: Unencrypted payload %@", buf, 0x16u);
            }

            v16 = 0;
            v17 = 0;
            goto LABEL_23;
          }
          v16 = (unint64_t)v26;
          v27 = v7;
          v28 = sub_100011D0C();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v49 = a1;
            v50 = 2112;
            v51 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@: Error serializing payload data error: %@", buf, 0x16u);
          }

          v7 = v27;
          v18 = obj;
        }

      }
      v15 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v15)
        continue;
      break;
    }
LABEL_23:
    v9 = v37;
    v8 = v38;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v32 = obj;

  if (v17 | v16 || !objc_msgSend(obj, "count"))
  {
    v33 = sub_100011D0C();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = a1;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: Sending refresh client to get new token", buf, 0xCu);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    objc_msgSend(v35, "refreshForSession:withReason:withCompletion:", v9, 10, 0);

    v32 = obj;
  }

  return v15;
}

- (void)encryptPayload:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  v9 = objc_msgSend(v7, "length");
  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((unint64_t)v9 > 0xF)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v19, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFClientSession _encryptPayload:](self, "_encryptPayload:", v7));
    if (v13)
    {
      v8[2](v8, v13, 0);
    }
    else
    {
      v16 = sub_100011D0C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000642D0();

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1012, 0));
      ((void (**)(id, void *, void *))v8)[2](v8, 0, v18);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100064270();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1014, 0));
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
  }

}

- (id)_encryptPayload:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v30;
  id obj;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  FMFClientSession *v40;
  __int16 v41;
  id v42;

  v30 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", off_1000B3018));

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = self;
    v41 = 2112;
    v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: notificationTokens %@", buf, 0x16u);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v32 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v35;
    v12 = v30;
    obj = v7;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataUsingEncoding:", 4));
        v16 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
        v33 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "encryptWithKey:error:", v16, &v33));
        v10 = v33;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "base64EncodedStringWithOptions:", 0));
        v19 = v18;
        if (v10)
        {
          v20 = sub_100011D0C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v40 = self;
            v41 = 2112;
            v42 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@: Error encrypting data error: %@", buf, 0x16u);
          }
        }
        else
        {
          v22 = v18;

          v23 = sub_100011D0C();
          v21 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v40 = self;
            v41 = 2112;
            v42 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Encrypted payload %@", buf, 0x16u);
          }
          v32 = v22;
          v12 = v30;
        }

        if (!v10)
        {
          v7 = obj;
          v24 = v32;
          goto LABEL_20;
        }
      }
      v7 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v9)
        continue;
      break;
    }

    v24 = v32;
    goto LABEL_21;
  }
  v24 = 0;
  v12 = v30;
LABEL_20:

  v10 = 0;
  if (!objc_msgSend(v7, "count"))
  {
LABEL_21:
    v25 = sub_100011D0C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_100064330();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    objc_msgSend(v27, "refreshForSession:withReason:withCompletion:", self, 10, 0);

  }
  return v24;
}

- (void)addFence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  FMFClientSession *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v8, "addFence:completion:", v6, v7);

    goto LABEL_14;
  }
  v9 = sub_100011D0C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: addFence %@", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  if (v11 != (void *)FMFFenceTypeNotifyMe)
    goto LABEL_10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipients"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipients"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "followingHandleForIdentifier:", v17));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverId"));
    objc_msgSend(v6, "setFriendIdentifier:", v18);

    v19 = sub_100011D0C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverId"));
      *(_DWORD *)buf = 138412802;
      v36 = self;
      v37 = 2112;
      v38 = v21;
      v39 = 2112;
      v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: matching fence for friend identifier: %@, handle: %@", buf, 0x20u);

    }
LABEL_10:

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "friendIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fenceSequencer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v24));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recurringAndScheduledFencesForHandles:", v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "anyObject"));
  if (objc_msgSend(v29, "isMuted"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "muteEndDate"));
    objc_msgSend(v6, "setMuteEndDate:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fenceSequencer"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002B244;
  v33[3] = &unk_10009A030;
  v33[4] = self;
  v34 = v7;
  objc_msgSend(v32, "addFence:clientSession:completion:", v6, self, v33);

LABEL_14:
}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v8, "deleteFence:completion:", v7, v6);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fenceSequencer"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002B47C;
    v11[3] = &unk_10009A030;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v10, "removeFence:clientSession:completion:", v7, self, v11);

  }
}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  FMFClientSession *v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    objc_msgSend(v8, "fencesForHandles:completion:", v9, v7);

  }
  else
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: fencesForHandles %@", (uint8_t *)&v13, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fenceSequencer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fencesForHandles:", v6));
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v12, 0);

  }
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  FMFClientSession *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v17, "triggerWithUUID:forFenceWithID:withStatus:forDate:completion:", v12, v13, v14, v15, v16);

  }
  else
  {
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v24 = self;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: uuid: %@ fenceID: %@ status: %@ date: %@", buf, 0x34u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fenceSequencer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fenceManager"));
    objc_msgSend(v22, "triggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:clientSession:completion:", v12, v13, v14, v15, 0, self, v16);

  }
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v22, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:", v19, v18, v17, v16, v15, v14);
  }
  else
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fenceSequencer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fenceManager"));
    objc_msgSend(v21, "triggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:clientSession:completion:", v19, v18, v17, v16, v15, self, v14);

    v14 = v16;
    v15 = v17;
    v16 = v18;
    v17 = v19;
    v18 = v21;
    v19 = v20;
  }

}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  FMFClientSession *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl("FindMy", "Fences_Migration"))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[FindMyLocateShims shared](_TtC4fmfd17FindMyLocateShims, "shared"));
    objc_msgSend(v11, "muteFencesForHandle:untilDate:completion:", v8, v9, v10);
  }
  else
  {
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: handle: %@ date: %@", buf, 0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fenceSequencer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recurringAndScheduledFencesForHandles:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fenceSequencer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fenceManager"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002BC84;
    v21[3] = &unk_10009A080;
    v21[4] = self;
    v22 = v17;
    v23 = v10;
    v11 = v17;
    objc_msgSend(v20, "muteFences:withEndDate:completion:", v11, v9, v21);

  }
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  FMFClientSession *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: addFavorite: %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "followingHandleForIdentifier:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "favoritesSequencer"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C19C;
  v16[3] = &unk_100099F90;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  objc_msgSend(v14, "addFavorite:clientSession:completion:", v12, self, v16);

}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "followingHandleForIdentifier:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "favoritesSequencer"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C384;
  v14[3] = &unk_100099F90;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "removeFavorite:clientSession:completion:", v10, self, v14);

}

- (void)getFavoritesWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  FMFClientSession *v11;
  __int16 v12;
  void *v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "favoritesSequencer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "favorites"));

  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: getFavoritesWithCompletion %@", (uint8_t *)&v10, 0x16u);
  }

  v4[2](v4, v7, 0);
}

- (NSNumber)clientPid
{
  return self->_clientPid;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (BOOL)blockingDialogs
{
  return self->_blockingDialogs;
}

- (void)setBlockingDialogs:(BOOL)a3
{
  self->_blockingDialogs = a3;
}

- (NSString)_debugContext
{
  return self->__debugContext;
}

- (void)set_debugContext:(id)a3
{
  objc_storeStrong((id *)&self->__debugContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugContext, 0);
  objc_storeStrong((id *)&self->_handlesQueue, 0);
  objc_storeStrong((id *)&self->__handlesInternal, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientPid, 0);
}

@end
