@implementation CKDatabase

- (void)addSubscriptionForDatabaseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKDatabase *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)CKFetchSubscriptionsOperation);
  v18 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v10 = objc_msgSend(v8, "initWithSubscriptionIDs:", v9);

  objc_msgSend(v10, "setQualityOfService:", 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _getOperationConfiguration](self, "_getOperationConfiguration"));
  objc_msgSend(v10, "setConfiguration:", v11);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000021BC;
  v14[3] = &unk_100048960;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "setFetchSubscriptionCompletionBlock:", v14);
  -[CKDatabase addOperation:](self, "addOperation:", v10);

}

- (void)_addSubscriptionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)CKNotificationInfo);
  objc_msgSend(v8, "setShouldSendContentAvailable:", 1);
  v9 = objc_msgSend(objc_alloc((Class)CKDatabaseSubscription), "initWithSubscriptionID:", v7);

  objc_msgSend(v9, "setNotificationInfo:", v8);
  if (v9)
  {
    v10 = objc_alloc((Class)CKModifySubscriptionsOperation);
    v18 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v12 = objc_msgSend(v10, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v11, 0);

    objc_msgSend(v12, "setQualityOfService:", 17);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _getOperationConfiguration](self, "_getOperationConfiguration"));
    objc_msgSend(v12, "setConfiguration:", v13);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000025BC;
    v16[3] = &unk_100048988;
    v17 = v6;
    objc_msgSend(v12, "setModifySubscriptionsCompletionBlock:", v16);
    -[CKDatabase addOperation:](self, "addOperation:", v12);

LABEL_7:
    goto LABEL_8;
  }
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000026F0(v15);

  if (v6)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_getOperationConfiguration
{
  return (id)objc_opt_new(CKOperationConfiguration, a2);
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CKDatabase *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc((Class)MSServiceEvent);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceID"));
  v16 = objc_msgSend(v14, "initWithEventType:serviceID:", 0, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stopwatch"));
  objc_msgSend(v17, "start");

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000061A8;
  v33[3] = &unk_100048B38;
  v34 = v16;
  v18 = v16;
  v19 = objc_retainBlock(v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000621C;
  v26[3] = &unk_100048C28;
  v31 = v19;
  v32 = v13;
  v27 = v10;
  v28 = v11;
  v29 = self;
  v30 = v12;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v24 = v19;
  v25 = v10;
  objc_msgSend(v20, "syncDataWithCloudKit:", v26);

}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MSDFetchCKDataOptions *v8;
  void *v9;
  void *v10;
  MSDFetchCKDataOptions *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  MSDFetchCKDataOptions *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v8, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v8, "setUserInitiatedRequest:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006FCC;
    v16[3] = &unk_100048C78;
    v19 = v7;
    v16[4] = self;
    v17 = v6;
    v18 = v8;
    v11 = v8;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v9, v10, v11, v16);

    v12 = v19;
LABEL_8:

    goto LABEL_9;
  }
  v13 = sub_10002E034();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_10000C598();

  if (v7)
  {
    v15 = MSErrorDomain;
    v20 = MSUserInfoErrorStringKey;
    v21 = CFSTR("Failed to fetch available services, NIL HomeID and HomeUserID");
    v11 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 1, v11));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSDFetchCKDataOptions *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;
  uint64_t v24;
  const __CFString *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_initWeak(&location, self);
    v11 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000786C;
    v18[3] = &unk_100048CC8;
    v21 = v10;
    objc_copyWeak(&v22, &location);
    v19 = v8;
    v20 = v9;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v12, v13, v11, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000C634();

    if (v10)
    {
      v24 = MSUserInfoErrorStringKey;
      v25 = CFSTR("Failed to update default service, NIL HomeID and HomeUserID");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, v16));
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v17);

    }
  }

}

- (void)_updateDefaultService:(id)a3 serviceID:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007B18;
  v18[3] = &unk_100048D18;
  v14 = v10;
  v19 = v14;
  v15 = v13;
  v22 = v15;
  objc_copyWeak(&v23, &location);
  v16 = v12;
  v20 = v16;
  v17 = v11;
  v21 = v17;
  -[CKDatabase fetchRecordWithID:completionHandler:](self, "fetchRecordWithID:completionHandler:", v14, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  MSDFetchCKDataOptions *v12;
  void *v13;
  MSDFetchCKDataOptions *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  MSDFetchCKDataOptions *v20;
  id v21;
  id v22;
  id v23;
  id location;
  uint64_t v25;
  const __CFString *v26;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc((Class)NSUUID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    v10 = objc_msgSend(v8, "initWithUUIDString:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    objc_initWeak(&location, self);
    v12 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v12, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v12, "setUserInitiatedRequest:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100008188;
    v18[3] = &unk_100048D68;
    v22 = v7;
    objc_copyWeak(&v23, &location);
    v19 = v6;
    v14 = v12;
    v20 = v14;
    v15 = v11;
    v21 = v15;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v13, v15, v14, v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  v16 = sub_10002E034();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10000C708();

  if (v7)
  {
    v25 = MSUserInfoErrorStringKey;
    v26 = CFSTR("Failed to fetch default media service, NIL HomeID and HomeUserID");
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, v10));
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSDFetchCKDataOptions *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  MSDFetchCKDataOptions *v20;
  _QWORD *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  MSDFetchCKDataOptions *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[16];
  uint64_t v34;
  const __CFString *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 1);
    v12 = objc_alloc((Class)MSServiceEvent);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceID"));
    v14 = objc_msgSend(v12, "initWithEventType:serviceID:", 1, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stopwatch"));
    objc_msgSend(v15, "start");

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100008B4C;
    v31[3] = &unk_100048B38;
    v32 = v14;
    v16 = v14;
    v17 = objc_retainBlock(v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100008BC0;
    v25[3] = &unk_100048E30;
    v29 = v17;
    v30 = v10;
    v25[4] = self;
    v26 = v9;
    v27 = v11;
    v28 = v8;
    v20 = v11;
    v21 = v17;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v18, v19, v20, v25);

LABEL_8:
    goto LABEL_9;
  }
  v22 = sub_10002E034();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to remove service, NIL HomeID and NIL HomeUserID", buf, 2u);
  }

  if (v10)
  {
    v24 = MSErrorDomain;
    v34 = MSUserInfoErrorStringKey;
    v35 = CFSTR("Failed to remove service, NIL HomeID and HomeUserID");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    v20 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, 1, v16));
    (*((void (**)(id, _QWORD, MSDFetchCKDataOptions *))v10 + 2))(v10, 0, v20);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_deleteRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  MSDFetchCKDataOptions *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    v15 = "-[CKDatabase(MediaService) _deleteRecord:completion:]";
    v16 = 2113;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Attempting to delete record %{private}@", buf, 0x16u);
  }

  v10 = objc_alloc_init(MSDFetchCKDataOptions);
  -[MSDFetchCKDataOptions setUserInitiatedRequest:](v10, "setUserInitiatedRequest:", 1);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000097F0;
  v12[3] = &unk_100048CA0;
  v13 = v7;
  v11 = v7;
  -[CKDatabase deleteRecord:withOptions:completion:](self, "deleteRecord:withOptions:completion:", v6, v10, v12);

}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MSDFetchCKDataOptions *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  CKDatabase *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v14 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v14, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v14, "setUserInitiatedRequest:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100009A50;
    v21[3] = &unk_100048EA8;
    v26 = v13;
    v22 = v10;
    v23 = self;
    v24 = v12;
    v25 = v11;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v15, v16, v14, v21);

    v17 = v26;
LABEL_8:

    goto LABEL_9;
  }
  v18 = sub_10002E034();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10000C7C8();

  if (v13)
  {
    v20 = MSErrorDomain;
    v27 = MSUserInfoErrorStringKey;
    v28 = CFSTR("Failed to updateProperty, NIL HomeID and HomeUserID");
    v14 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, 1, v14));
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v17);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000A1F4;
    v14[3] = &unk_100048F38;
    v14[4] = self;
    v15 = v8;
    v17 = v10;
    v16 = v9;
    objc_msgSend(v11, "setFetchRecordZonesCompletionBlock:", v14);
    objc_msgSend(v11, "setQualityOfService:", 25);
    -[CKDatabase addOperation:](self, "addOperation:", v11);

LABEL_6:
    goto LABEL_7;
  }
  if (v10)
  {
    v12 = MSErrorDomain;
    v18 = MSUserInfoErrorStringKey;
    v19 = CFSTR("Failed to fetch service config info, HomeUserIDS cannot be nil");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 1, v11));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)_serviceConfigInfoFor:(id)a3 homeUserIDS:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  dispatch_queue_global_t global_queue;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  void *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  _QWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  id v53;
  _BYTE v54[128];

  v31 = a3;
  v34 = a4;
  v10 = a5;
  v12 = a6;
  if (v12)
  {
    if (v10)
    {
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = sub_1000067E0;
      v50[4] = sub_1000067F0;
      v51 = 0;
      v13 = (void *)objc_opt_new(NSMutableDictionary, v11);
      v30 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v14));

      v15 = dispatch_group_create();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v31;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            v20 = objc_alloc((Class)CKRecordID);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
            v23 = objc_msgSend(v20, "initWithRecordName:zoneID:", v21, v22);

            v24 = sub_10002E034();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v23;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Fetching records for recordID: %@", buf, 0xCu);
            }

            dispatch_group_enter(v15);
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_10000A88C;
            v39[3] = &unk_100048F60;
            v40 = v34;
            v41 = v15;
            v42 = v10;
            v43 = v33;
            v44 = v13;
            v45 = v50;
            -[CKDatabase fetchRecordWithID:withOptions:completion:](self, "fetchRecordWithID:withOptions:completion:", v23, 0, v39);

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v16);
      }

      global_queue = dispatch_get_global_queue(33, 0);
      v27 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000AAAC;
      block[3] = &unk_100048F88;
      v36 = v13;
      v37 = v30;
      v38 = v50;
      v28 = v13;
      dispatch_group_notify(v15, v27, block);

      _Block_object_dispose(v50, 8);
      v12 = v30;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, 0));
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v29);

    }
  }

}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSDFetchCKDataOptions *v11;
  void *v12;
  void *v13;
  MSDFetchCKDataOptions *v14;
  void *v15;
  uint64_t v16;
  const __CFString **v17;
  uint64_t *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  CKDatabase *v30;
  MSDFetchCKDataOptions *v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (v9 && objc_msgSend(v9, "count"))
    {
      v11 = objc_alloc_init(MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000AD50;
      v28[3] = &unk_100048C78;
      v32 = v10;
      v29 = v8;
      v30 = self;
      v31 = v11;
      v14 = v11;
      -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v12, v13, v14, v28);

      v15 = v32;
LABEL_13:

      goto LABEL_14;
    }
    v19 = sub_10002E034();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10000C8B4(v20, v21, v22, v23, v24, v25, v26, v27);

    if (v10)
    {
      v16 = MSErrorDomain;
      v33 = MSUserInfoErrorStringKey;
      v34 = CFSTR("Failed to remove services, NIL identifiers passed");
      v17 = &v34;
      v18 = &v33;
      goto LABEL_12;
    }
  }
  else if (v10)
  {
    v16 = MSErrorDomain;
    v35 = MSUserInfoErrorStringKey;
    v36 = CFSTR("ServiceIDs specified is nil");
    v17 = &v36;
    v18 = &v35;
LABEL_12:
    v14 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 1, v14));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)updateAuthRenewalForMediaService:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  MSDFetchCKDataOptions *v15;
  void *v16;
  void *v17;
  MSDFetchCKDataOptions *v18;
  void *v19;
  uint64_t v20;
  const __CFString **v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  CKDatabase *v25;
  MSDFetchCKDataOptions *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    if (v8)
    {
      v11 = sub_10002E034();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authCredential"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authConfiguration"));
        *(_DWORD *)buf = 138478083;
        v29 = v13;
        v30 = 2113;
        v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating CloudKit with AuthCredential %{private}@, AuthConfig %{private}@", buf, 0x16u);

      }
      v15 = objc_alloc_init(MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v15, "setCreateNewZoneIfMissing:", 0);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v15, "setUserInitiatedRequest:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000B394;
      v23[3] = &unk_100048C78;
      v27 = v10;
      v24 = v8;
      v25 = self;
      v26 = v15;
      v18 = v15;
      -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:](self, "fetchRecordZoneFor:user:withOptions:completion:", v16, v17, v18, v23);

      v19 = v27;
      goto LABEL_10;
    }
    if (!v10)
      goto LABEL_11;
    v20 = MSErrorDomain;
    v32 = MSUserInfoErrorStringKey;
    v33 = CFSTR("Failed to updateAuthRenewalInfo, NIL MediaService");
    v21 = &v33;
    v22 = &v32;
LABEL_9:
    v18 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v22, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, 1, v18));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v19);
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {
    v20 = MSErrorDomain;
    v34 = MSUserInfoErrorStringKey;
    v35 = CFSTR("Failed to updateAuthRenewalInfo, NIL UserInfo");
    v21 = &v35;
    v22 = &v34;
    goto LABEL_9;
  }
LABEL_11:

}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11 && v12)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = sub_1000067E0;
    v31[4] = sub_1000067F0;
    v32 = 0;
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000BB2C;
    v27[3] = &unk_100049068;
    v30 = v31;
    v15 = v14;
    v28 = v15;
    v16 = v10;
    v29 = v16;
    +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:](MSAuthTokenProvider, "fetchAuthTokensForMediaService:networkActivity:completion:", v16, 0, v27);
    global_queue = dispatch_get_global_queue(33, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BC9C;
    block[3] = &unk_100049150;
    v26 = v31;
    v25 = v13;
    block[4] = self;
    v22 = v11;
    v23 = v12;
    v24 = v16;
    dispatch_group_notify(v15, v18, block);

    _Block_object_dispose(v31, 8);
  }
  else
  {
    v33 = NSLocalizedDescriptionKey;
    v34 = CFSTR("Failed to switch User Account Info, NIL attributes provided");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, v19));
    (*((void (**)(id, void *))v13 + 2))(v13, v20);

  }
}

- (void)refreshDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  __CFString *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;

  v6 = a4;
  v7 = a3;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 136315395;
    v36 = "-[CKDatabase(MSDCloudDatabase) refreshDatabase:completion:]";
    v37 = 2113;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s databaseScope %{private}@", buf, 0x16u);

  }
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v12 = CFSTR("sharedDatabaseChangesKey");
  else
    v12 = CFSTR("privateDatabaseChangesKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForDefaultWithCustomClass:", v12));

  v16 = (void *)objc_opt_new(NSMutableArray, v15);
  v18 = (void *)objc_opt_new(NSMutableArray, v17);
  v19 = objc_msgSend(objc_alloc((Class)CKFetchDatabaseChangesOperation), "initWithPreviousServerChangeToken:", v14);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100025C64;
  v30[3] = &unk_10004A1A8;
  v30[4] = self;
  v34 = v6;
  v20 = v16;
  v31 = v20;
  v21 = v18;
  v32 = v21;
  v33 = (__CFString *)v12;
  v22 = v6;
  objc_msgSend(v19, "setFetchDatabaseChangesCompletionBlock:", v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100025E80;
  v28[3] = &unk_10004A1D0;
  v29 = v20;
  v23 = v20;
  objc_msgSend(v19, "setRecordZoneWithIDChangedBlock:", v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100025E8C;
  v26[3] = &unk_10004A1D0;
  v27 = v21;
  v24 = v21;
  objc_msgSend(v19, "setRecordZoneWithIDWasDeletedBlock:", v26);
  LODWORD(v21) = objc_msgSend(v7, "userInitiatedRequest");

  if ((_DWORD)v21)
  {
    objc_msgSend(v19, "setQualityOfService:", 25);
  }
  else
  {
    objc_msgSend(v19, "setQualityOfService:", 17);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
    objc_msgSend(v19, "setConfiguration:", v25);

  }
  -[CKDatabase addOperation:](self, "addOperation:", v19);

}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  -[CKDatabase fetchRecordZoneFor:user:withOptions:withAttribution:completion:](self, "fetchRecordZoneFor:user:withOptions:withAttribution:completion:", a3, a4, a5, 0, a6);
}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 withAttribution:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(id, void *, _QWORD);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v35 = v13;
    v36 = 2113;
    v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetching Zone for HomeUserID: %{private}@, options: %{private}@", buf, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _checkIfRecordZonePresentForUser:](self, "_checkIfRecordZonePresentForUser:", v13));
  v20 = sub_10002E034();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneID"));
      *(_DWORD *)buf = 138478083;
      v35 = v23;
      v36 = 2113;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "RecordZone %{private}@ for user %{private}@", buf, 0x16u);

    }
    if (v16)
      v16[2](v16, v19, 0);
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Possibly missing cached value on device, checking with CloudKit", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
    MSDUpdateCKOperationForAttribution(v24, v15);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002620C;
    v27[3] = &unk_10004A2B8;
    v32 = v16;
    v27[4] = self;
    v28 = v13;
    objc_copyWeak(&v33, (id *)buf);
    v29 = v12;
    v25 = v14;
    v30 = v25;
    v31 = v15;
    objc_msgSend(v24, "setFetchRecordZonesCompletionBlock:", v27);
    if (objc_msgSend(v25, "userInitiatedRequest"))
    {
      objc_msgSend(v24, "setQualityOfService:", 25);
    }
    else
    {
      objc_msgSend(v24, "setQualityOfService:", 17);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      objc_msgSend(v24, "setConfiguration:", v26);

    }
    -[CKDatabase addOperation:](self, "addOperation:", v24);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

}

- (id)_checkIfRecordZonePresentForUser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForDefaultWithCustomClass:", CFSTR("kUserIDToRecordZoneIDMap")));

  if (v5 && (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3))) != 0)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateUserInfoToRecordZoneIDMap:(id)a3 userID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForDefaultWithCustomClass:", CFSTR("kUserIDToRecordZoneIDMap")));
  v8 = objc_msgSend(v7, "mutableCopy");

  if (!objc_msgSend(v8, "count"))
  {
    v10 = objc_opt_new(NSMutableDictionary, v9);

    v8 = (id)v10;
  }
  objc_msgSend(v8, "setObject:forKey:", v13, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v12 = objc_msgSend(v8, "copy");
  objc_msgSend(v11, "setObjectWithCustomClass:forDefault:", v12, CFSTR("kUserIDToRecordZoneIDMap"));

}

- (void)deleteRecordZone:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v18 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v13 = objc_msgSend(v11, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v12);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000275B8;
  v16[3] = &unk_100048988;
  v17 = v9;
  v14 = v9;
  objc_msgSend(v13, "setModifyRecordZonesCompletionBlock:", v16);
  LODWORD(v9) = objc_msgSend(v10, "userInitiatedRequest");

  if ((_DWORD)v9)
  {
    objc_msgSend(v13, "setQualityOfService:", 25);
  }
  else
  {
    objc_msgSend(v13, "setQualityOfService:", 17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
    objc_msgSend(v13, "setConfiguration:", v15);

  }
  -[CKDatabase addOperation:](self, "addOperation:", v13);

}

- (void)fetchRecordWithID:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v18 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000277DC;
    v15[3] = &unk_10004A2E0;
    v17 = v10;
    v16 = v8;
    -[CKDatabase fetchRecordWithIDS:withOptions:completion:](self, "fetchRecordWithIDS:withOptions:completion:", v11, v9, v15);

    v12 = v17;
LABEL_7:

    goto LABEL_8;
  }
  v13 = sub_10002E034();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_10002D6D4();

  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchRecordWithIDS:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)CKFetchRecordsOperation), "initWithRecordIDs:", v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000279F4;
    v15[3] = &unk_100049660;
    v16 = v10;
    objc_msgSend(v11, "setFetchRecordsCompletionBlock:", v15);
    if (objc_msgSend(v9, "userInitiatedRequest"))
    {
      objc_msgSend(v11, "setQualityOfService:", 25);
    }
    else
    {
      objc_msgSend(v11, "setQualityOfService:", 17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      objc_msgSend(v11, "setConfiguration:", v14);

    }
    -[CKDatabase addOperation:](self, "addOperation:", v11);

    goto LABEL_11;
  }
  v12 = sub_10002E034();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_10002D700();

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v11);
LABEL_11:

  }
}

- (void)fetchAllRecordsForRecordZoneID:(id)a3 userInfo:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[9];
  _QWORD v40[4];
  id v41;
  CKDatabase *v42;
  id v43;
  id v44;
  __CFString *v45;
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  void *v63;

  v10 = a3;
  v36 = a4;
  v35 = a5;
  v12 = a6;
  if (v10)
  {
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = sub_100026B50;
    v57[4] = sub_100026B60;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_100026B50;
    v55[4] = sub_100026B60;
    v56 = (id)objc_opt_new(NSMutableArray, v11);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_100026B50;
    v53[4] = sub_100026B60;
    v54 = (id)objc_opt_new(NSMutableArray, v13);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = sub_100026B50;
    v51[4] = sub_100026B60;
    v52 = 0;
    v14 = objc_msgSend(objc_alloc((Class)MSServiceEvent), "initWithEventType:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stopwatch"));
    objc_msgSend(v15, "start");

    if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
      v16 = CFSTR("sharedDatabaseData");
    else
      v16 = CFSTR("privateDatabaseData");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _fetchRefreshTokenForRecordZoneID:](self, "_fetchRefreshTokenForRecordZoneID:", v10));
    v17 = sub_10002E034();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v61 = "-[CKDatabase(MSDCloudDatabase) fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:]";
      v62 = 2113;
      v63 = v34;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Passing Config information %{private}@", buf, 0x16u);
    }

    v19 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
    v59 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
    v21 = objc_msgSend(v19, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v20, v34);

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100027F24;
    v40[3] = &unk_10004A3A8;
    v22 = v14;
    v47 = v57;
    v41 = v22;
    v42 = self;
    v43 = v10;
    v44 = v36;
    v45 = (__CFString *)v16;
    v46 = v12;
    v48 = v55;
    v49 = v53;
    v50 = v51;
    objc_msgSend(v21, "setFetchRecordZoneChangesCompletionBlock:", v40);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100028824;
    v39[3] = &unk_10004A3D0;
    v39[4] = self;
    v39[5] = v57;
    v39[6] = v55;
    v39[7] = v53;
    v39[8] = v51;
    objc_msgSend(v21, "setRecordZoneFetchCompletionBlock:", v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100028A9C;
    v38[3] = &unk_10004A3F8;
    v38[4] = self;
    v38[5] = v53;
    objc_msgSend(v21, "setRecordWithIDWasDeletedBlock:", v38);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100028BA8;
    v37[3] = &unk_10004A420;
    v37[4] = self;
    v37[5] = v55;
    objc_msgSend(v21, "setRecordWasChangedBlock:", v37);
    if (objc_msgSend(v35, "userInitiatedRequest"))
    {
      objc_msgSend(v21, "setQualityOfService:", 25);
    }
    else
    {
      objc_msgSend(v21, "setQualityOfService:", 17);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      objc_msgSend(v21, "setConfiguration:", v33);

    }
    -[CKDatabase addOperation:](self, "addOperation:", v21);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);

  }
  else
  {
    v23 = sub_10002E034();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10002D72C(v24, v25, v26, v27, v28, v29, v30, v31);

    if (v12)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v32);

    }
  }

}

- (id)_handleRecordZonesChanged:(id)a3 deletedRecordZones:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  void *v18;
  id obj;
  _QWORD v20[6];
  NSObject *v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
    -[CKDatabase _purgeDeletedZonesFromDefaults:](self, "_purgeDeletedZonesFromDefaults:", v7);
  v18 = v7;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100026B50;
  v31 = sub_100026B60;
  v32 = 0;
  v8 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    v11 = 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12);
        dispatch_group_enter(v8);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100028FA4;
        v20[3] = &unk_10004A448;
        v20[4] = v13;
        v20[5] = self;
        v22 = &v27;
        v14 = v8;
        v21 = v14;
        -[CKDatabase fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:](self, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", v13, 0, 0, v20, v18);
        v15 = dispatch_time(0, v11);
        dispatch_group_wait(v14, v15);

        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v9);
  }

  v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)_purgeDeletedZonesFromDefaults:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;

  v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v5 = CFSTR("sharedDatabaseData");
  else
    v5 = CFSTR("privateDatabaseData");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", &stru_10004A488));
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Purging recordZoneData with recordZoneNames %{private}@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForDefaultWithCustomClass:", v5));
  v11 = objc_msgSend(v10, "mutableCopy");

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100029530;
  v46[3] = &unk_100048A98;
  v12 = v6;
  v47 = v12;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_filter:", v46));
  objc_msgSend(v11, "removeObjectsInArray:");
  v13 = sub_10002E034();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412547;
    v49 = v16;
    v50 = 2113;
    v51 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Updating Data in defaults after recordZone deleted %{private}@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v17, "setObjectWithCustomClass:forDefault:", v11, v5);

  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v18 = CFSTR("sharedDatabaseKeyRefreshTokens");
  else
    v18 = CFSTR("privateDatabaseKeyRefreshTokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForDefaultWithCustomClass:", v18));
  v21 = objc_msgSend(v20, "mutableCopy");

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100029574;
  v44[3] = &unk_10004A4B0;
  v22 = v12;
  v45 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "na_map:", v44));
  objc_msgSend(v21, "removeObjectsForKeys:", v23);
  v24 = sub_10002E034();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138412547;
    v49 = v27;
    v50 = 2113;
    v51 = v21;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%@] Updating Server tokens in defaults after recordZone deleted %{private}@", buf, 0x16u);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v28, "setObjectWithCustomClass:forDefault:", v21, v18);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForDefaultWithCustomClass:", CFSTR("kUserIDToRecordZoneIDMap")));
  v31 = objc_msgSend(v30, "mutableCopy");

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000295C0;
  v41[3] = &unk_10004A500;
  v42 = v4;
  v33 = (id)objc_opt_new(NSMutableArray, v32);
  v43 = v33;
  v34 = v4;
  objc_msgSend(v31, "na_each:", v41);
  objc_msgSend(v31, "removeObjectsForKeys:", v33);
  v35 = sub_10002E034();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138412547;
    v49 = v38;
    v50 = 2113;
    v51 = v31;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%@] Updating the UserIDToRecordZoneID Map to %{private}@", buf, 0x16u);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v39, "setObjectWithCustomClass:forDefault:", v31, CFSTR("kUserIDToRecordZoneIDMap"));

}

- (void)_saveRecordZone:(id)a3 withAttribution:(id)a4 andOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = objc_alloc((Class)CKModifyRecordZonesOperation);
    v23 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v16 = objc_msgSend(v14, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v15, 0);

    MSDUpdateCKOperationForAttribution(v16, v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100029938;
    v20[3] = &unk_100048988;
    v21 = v13;
    objc_msgSend(v16, "setModifyRecordZonesCompletionBlock:", v20);
    if (objc_msgSend(v12, "userInitiatedRequest"))
    {
      objc_msgSend(v16, "setQualityOfService:", 25);
    }
    else
    {
      objc_msgSend(v16, "setQualityOfService:", 17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      objc_msgSend(v16, "setConfiguration:", v19);

    }
    -[CKDatabase addOperation:](self, "addOperation:", v16);

    goto LABEL_10;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to save recordZone - NIL CKRecordZone", buf, 2u);
  }

  if (v13)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v16);
LABEL_10:

  }
}

- (id)_handleChangedRecords:(id)a3 andDeletedRecordIDS:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v8 = CFSTR("sharedDatabaseData");
  else
    v8 = CFSTR("privateDatabaseData");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForDefaultWithCustomClass:", v8));

  if (v10 && objc_msgSend(v10, "count"))
    v12 = v10;
  else
    v12 = (id)objc_opt_new(NSArray, v11);
  v13 = v12;
  v14 = objc_msgSend(v7, "count");
  if (v10)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[CKDatabase _handleDeletedRecordIDS:withDataInLocalCopy:](self, "_handleDeletedRecordIDS:withDataInLocalCopy:", v7, v10));

    v13 = (void *)v16;
  }
  if (objc_msgSend(v6, "count"))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[CKDatabase _handleChangesInChangedRecords:withDataInLocalCopy:](self, "_handleChangesInChangedRecords:withDataInLocalCopy:", v6, v13));

    v13 = (void *)v17;
  }

  return v13;
}

- (id)_handleDeletedRecordIDS:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
    v23 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &stru_10004A540));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v14, v16));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
          LODWORD(v14) = objc_msgSend(v18, "containsObject:", v17);

          if ((_DWORD)v14)
          {
            v19 = sub_10002E034();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found match for %{private}@, removing obj from default", buf, 0xCu);
            }

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v17));
            objc_msgSend(v25, "removeObject:", v21);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v10);
    }

    v6 = v23;
    v5 = v24;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_handleChangesInChangedRecords:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id *v26;
  id v27;
  int v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  uint8_t v52;
  _BYTE v53[15];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  NSObject *v65;
  uint8_t v66[4];
  uint64_t v67;
  _BYTE v68[128];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v37 = v5;
    obj = v5;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v46)
    {
      v44 = MSHomeParticipantHomeIdentifier;
      v45 = *(_QWORD *)v55;
      v43 = MSHomeParticipantHomeUserIdentifier;
      v41 = MSDefaultServiceRecordType;
      v38 = v7;
      v39 = v6;
      while (2)
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v10 = objc_alloc((Class)NSUUID);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordFieldForKey:", v44));
          v12 = objc_msgSend(v10, "initWithUUIDString:", v11);

          v13 = objc_alloc((Class)NSUUID);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordFieldForKey:", v43));
          v15 = objc_msgSend(v13, "initWithUUIDString:", v14);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createMediaServiceObjectFromRecord"));
          if (v16)
          {
            v17 = objc_msgSend(objc_alloc((Class)MSDDefaultsInfo), "initWithService:homeID:homeUserID:", v16, v12, v15);
            if (v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordName"));
              -[NSObject setRecordName:](v17, "setRecordName:", v19);

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordType"));
              -[NSObject setRecordType:](v17, "setRecordType:", v20);

              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneName"));
              -[NSObject setRecordZoneName:](v17, "setRecordZoneName:", v23);

              v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v17, "recordType"));
              LODWORD(v22) = objc_msgSend(v24, "isEqualToString:", v41);

              if ((_DWORD)v22)
              {
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472;
                v49[2] = sub_10002A338;
                v49[3] = &unk_100048B10;
                v50 = v15;
                v51 = v17;
                v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v49));

                v26 = &v50;
              }
              else
              {
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472;
                v47[2] = sub_10002A400;
                v47[3] = &unk_100048A98;
                v48 = v17;
                v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v47));
                v26 = (id *)&v48;
              }

              if (v25)
              {
                v30 = sub_10002E034();
                v31 = objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordType](v25, "recordType"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject service](v25, "service"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "serviceID"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject homeUserID](v25, "homeUserID"));
                  *(_DWORD *)buf = 138478595;
                  v59 = v32;
                  v60 = 2113;
                  v61 = v33;
                  v62 = 2113;
                  v63 = v34;
                  v64 = 2113;
                  v65 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "A property on a known service changed (RecordType: %{private}@, ServiceID: %{private}@, homeUserID: %{private}@) | Updating cachedInfo with %{private}@", buf, 0x2Au);

                  v6 = v39;
                  v7 = v38;

                }
                objc_msgSend(v7, "removeObject:", v25);
              }
              objc_msgSend(v7, "na_safeAddObject:", v17);
              v28 = 0;
            }
            else
            {
              v29 = sub_10002E034();
              v25 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                sub_10002DB04(&v52, v53, v25);
              v28 = 1;
            }

          }
          else
          {
            v27 = sub_10002E034();
            v17 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_10002DA78(v66, v9, &v67, v17);
            v28 = 1;
          }

          if (v28)
          {

            v35 = 0;
            goto LABEL_29;
          }
        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v46)
          continue;
        break;
      }
    }

    v35 = objc_msgSend(v7, "copy");
LABEL_29:

    v5 = v37;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)saveRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  -[CKDatabase saveRecord:withAttribution:withOptions:completion:](self, "saveRecord:withAttribution:withOptions:completion:", a3, 0, a4, a5);
}

- (void)saveRecord:(id)a3 withAttribution:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v20 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002A748;
    v18[3] = &unk_100048988;
    v19 = v13;
    -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:](self, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:", v14, 0, 0, v11, v12, v18);

    v15 = v19;
LABEL_7:

    goto LABEL_8;
  }
  v16 = sub_10002E034();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10002DB40();

  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deleteRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  -[CKDatabase deleteRecordWithID:missingManateeIdentity:withOptions:completion:](self, "deleteRecordWithID:missingManateeIdentity:withOptions:completion:", a3, 0, a4, a5);
}

- (void)deleteRecordWithID:(id)a3 missingManateeIdentity:(BOOL)a4 withOptions:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];
  id v20;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v20 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A970;
    v17[3] = &unk_100048988;
    v18 = v12;
    -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:](self, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:", 0, v13, v8, 0, v11, v17);

    v14 = v18;
LABEL_7:

    goto LABEL_8;
  }
  v15 = sub_10002E034();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to delete record - NIL CKRecordID", buf, 2u);
  }

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)modifyCKRecordWithRecordsToSave:(id)a3 recordIDSToDelete:(id)a4 missingManateeIdentity:(BOOL)a5 withAttribution:(id)a6 withOptions:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    if (v11)
    {
      v19 = sub_10002E034();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating Modify Records Operation with markAsParticipantNeedsNewInvitationToken: YES", buf, 2u);
      }

    }
    v21 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v14, v15);
    MSDUpdateCKOperationForAttribution(v21, v16);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002ABC4;
    v25[3] = &unk_100048988;
    v26 = v18;
    objc_msgSend(v21, "setModifyRecordsCompletionBlock:", v25);
    if (objc_msgSend(v17, "userInitiatedRequest"))
    {
      objc_msgSend(v21, "setQualityOfService:", 25);
    }
    else
    {
      objc_msgSend(v21, "setQualityOfService:", 17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      objc_msgSend(v21, "setConfiguration:", v22);

    }
    objc_msgSend(v21, "setMarkAsParticipantNeedsNewInvitationToken:", v11);
    -[CKDatabase addOperation:](self, "addOperation:", v21);

    goto LABEL_11;
  }
  v23 = sub_10002E034();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    sub_10002DB6C();

  if (v18)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, _QWORD, id))v18 + 2))(v18, 0, 0, v21);
LABEL_11:

  }
}

- (id)_fetchPlaceholderRecordData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  NSObject *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100026B50;
  v26 = sub_100026B60;
  v27 = (id)objc_opt_new(NSMutableDictionary, v7);
  v8 = objc_alloc((Class)CKRecordID);
  v9 = objc_msgSend(v8, "initWithRecordName:zoneID:", MSPlaceholderRecordName, v6);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10002AEA0;
  v19 = &unk_10004A568;
  v21 = &v22;
  v10 = dispatch_semaphore_create(0);
  v20 = v10;
  -[CKDatabase fetchRecordWithID:withOptions:completion:](self, "fetchRecordWithID:withOptions:completion:", v9, 0, &v16);
  v11 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002DB98();

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSCloudKitErrorDomain, 10, 0, v16, v17, v18, v19));
  }
  v14 = objc_msgSend((id)v23[5], "copy", v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)_fetchRefreshTokenForRecordZoneID:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v5 = CFSTR("sharedDatabaseKeyRefreshTokens");
  else
    v5 = CFSTR("privateDatabaseKeyRefreshTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForDefaultWithCustomClass:", v5));

  if (v7)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] There exists an entry for Change token", buf, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForDefaultWithCustomClass:", v5));

    v15 = (void *)objc_opt_new(NSMutableDictionary, v14);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002B1D8;
    v21[3] = &unk_10004A590;
    v22 = v4;
    v16 = v15;
    v23 = v16;
    objc_msgSend(v13, "na_each:", v21);
    v17 = v23;
    v18 = v16;

  }
  else
  {
    v13 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    objc_msgSend(v13, "setPreviousServerChangeToken:", 0);
    v18 = (id)objc_opt_new(NSMutableDictionary, v19);
    objc_msgSend(v18, "na_safeSetObject:forKey:", v13, v4);
  }

  return v18;
}

- (void)_updateServerChangeTokenMap:(id)a3 serverChangeToken:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    v8 = CFSTR("sharedDatabaseKeyRefreshTokens");
  else
    v8 = CFSTR("privateDatabaseKeyRefreshTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForDefaultWithCustomClass:", v8));
  v11 = objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = (id)objc_opt_new(NSMutableDictionary, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
  objc_msgSend(v11, "na_safeSetObject:forKey:", v7, v13);

  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v20 = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] Updating Server Change Token Map %@", (uint8_t *)&v20, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v19 = objc_msgSend(v11, "copy");
  objc_msgSend(v18, "setObjectWithCustomClass:forDefault:", v19, v8);

}

- (void)_handleCKErrorChangeTokenExpired:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v23 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[CKDatabase _purgeDeletedZonesFromDefaults:](self, "_purgeDeletedZonesFromDefaults:", v8);

    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B578;
    block[3] = &unk_10004A128;
    block[4] = self;
    v21 = v6;
    v22 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002DC24(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserIDS:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MSDDataRefresh *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002DC94();
    goto LABEL_12;
  }
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") != (id)3)
  {
    if ((id)-[CKDatabase databaseScope](self, "databaseScope") != (id)2)
      goto LABEL_13;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForDefaultWithCustomClass:", CFSTR("privateDatabaseData")));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002B7B4;
    v17[3] = &unk_100048A98;
    v11 = v6;
    v18 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject na_firstObjectPassingTest:](v9, "na_firstObjectPassingTest:", v17));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeUserID"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
      -[CKDatabase _handleManateeLossOnPrivateDatabase:homeUserID:](self, "_handleManateeLossOnPrivateDatabase:homeUserID:", v11, v14);

      v15 = -[MSDDataRefresh initWithReason:withDelay:]([MSDDataRefresh alloc], "initWithReason:withDelay:", 7, 90.0);
      -[MSDDataRefresh performRefreshWithCompletion:](v15, "performRefreshWithCompletion:", 0);
    }
    else
    {
      v16 = sub_10002E034();
      v15 = (MSDDataRefresh *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
        sub_10002DCC0(v11, &v15->super);
    }

LABEL_12:
    goto LABEL_13;
  }
  -[CKDatabase _handleManateeLossOnSharedDatabase:completion:](self, "_handleManateeLossOnSharedDatabase:completion:", v6, &stru_10004A5B0);
LABEL_13:

}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  MSDDataRefresh *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v19 = 138412290;
      v20 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Manatee loss detected on Database scope: %@", (uint8_t *)&v19, 0xCu);

    }
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
      v19 = 138412546;
      v20 = (uint64_t)v15;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting to recover from Manatee loss for %@ and homeUserID %@", (uint8_t *)&v19, 0x16u);

    }
    if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    {
      -[CKDatabase _handleManateeLossOnSharedDatabase:completion:](self, "_handleManateeLossOnSharedDatabase:completion:", v6, &stru_10004A5D0);
    }
    else if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)2)
    {
      -[CKDatabase _handleManateeLossOnPrivateDatabase:homeUserID:](self, "_handleManateeLossOnPrivateDatabase:homeUserID:", v6, v7);
      v16 = sub_10002E034();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134217984;
        v20 = 90;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Scheduling PrivateDatabase refresh after %lu sec", (uint8_t *)&v19, 0xCu);
      }

      v18 = -[MSDDataRefresh initWithReason:withDelay:]([MSDDataRefresh alloc], "initWithReason:withDelay:", 7, 90.0);
      -[MSDDataRefresh performRefreshWithCompletion:](v18, "performRefreshWithCompletion:", 0);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002DC94();

  }
}

- (void)_handleManateeLossOnSharedDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)CKShare), "initWithRecordZoneID:", v7);

  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to delete shareID %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002BC54;
  v13[3] = &unk_100049A88;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  -[CKDatabase deleteRecordWithID:missingManateeIdentity:withOptions:completion:](self, "deleteRecordWithID:missingManateeIdentity:withOptions:completion:", v11, 1, 0, v13);

}

- (void)_handleManateeLossOnPrivateDatabase:(id)a3 homeUserID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002BE68;
    v9[3] = &unk_10004A620;
    v9[4] = self;
    v10 = v5;
    -[CKDatabase deleteRecordZone:withOptions:completion:](self, "deleteRecordZone:withOptions:completion:", v10, 0, v9);

  }
  else
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CKDatabase(MSDCloudDatabase) _handleManateeLossOnPrivateDatabase:homeUserID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to recover from Manatee Loss - NIL recordZoneID", buf, 0xCu);
    }

  }
}

- (void)_populateRecordZoneWithCachedInfo:(id)a3 cachedInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _UNKNOWN **v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  CKDatabase *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  id v69;
  _QWORD v70[4];
  NSObject *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  _QWORD v81[2];
  _QWORD v82[2];

  v6 = a3;
  v7 = a4;
  v9 = (void *)objc_opt_new(NSMutableArray, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_firstObjectPassingTest:", &stru_10004A660));
  v11 = v10;
  v64 = v6;
  if (v10)
  {
    v59 = self;
    v81[0] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeUserID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v82[0] = v13;
    v81[1] = kCKDatabaseAccessUserInfoHomeIDKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    v82[1] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 2));

    v17 = MSPlaceholderRecordName;
    v18 = MSPlaceholderRecordType;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecord createRecordWithName:recordType:recordZone:](CKRecord, "createRecordWithName:recordType:recordZone:", v17, v18, v19));

    v20 = sub_10002E034();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUserID"));
      *(_DWORD *)buf = 138412546;
      v78 = v22;
      v79 = 2112;
      v80 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Placeholder recordInfo HomeID: %@, HomeUserID: %@", buf, 0x16u);

    }
    v24 = MSHomeParticipantHomeIdentifier;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
    objc_msgSend(v62, "setRecordFieldForKey:value:", v24, v26);

    v27 = MSHomeParticipantHomeUserIdentifier;
    v60 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUserID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
    objc_msgSend(v62, "setRecordFieldForKey:value:", v27, v29);

    objc_msgSend(v9, "na_safeAddObject:", v62);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v61 = v7;
    obj = v7;
    v30 = v6;
    v31 = &APSEnvironmentProduction_ptr;
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v69)
    {
      v68 = *(_QWORD *)v73;
      v32 = MSDefaultServiceRecordType;
      v67 = MSServiceAccountRecordType;
      v65 = MSDefaultServiceRecordName;
      v63 = v16;
      do
      {
        for (i = 0; i != v69; i = (char *)i + 1)
        {
          v34 = v32;
          if (*(_QWORD *)v73 != v68)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
          v36 = sub_10002E034();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "service"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "serviceID"));
            *(_DWORD *)buf = 138412290;
            v78 = v39;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Repopulating info for %@", buf, 0xCu);

          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "recordType"));
          v32 = v34;
          v41 = objc_msgSend(v40, "isEqualToString:", v34);

          if (v41)
          {
            v42 = v31[79];
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneID"));
            v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "createRecordWithName:recordType:recordZone:", v65, v34, v43));
            v45 = v34;
            v46 = (void *)v44;
          }
          else
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "recordType"));
            v48 = objc_msgSend(v47, "isEqualToString:", v67);

            if (!v48)
              continue;
            v49 = v31[79];
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "service"));
            v50 = v9;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "serviceID"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "UUIDString"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneID"));
            v54 = v49;
            v45 = v67;
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "createRecordWithName:recordType:recordZone:", v52, v67, v53));

            v30 = v64;
            v31 = &APSEnvironmentProduction_ptr;

            v9 = v50;
            v16 = v63;
          }

          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "service"));
          objc_msgSend(v46, "populateCKRecordInfo:userInfo:recordType:", v55, v16, v45);

          objc_msgSend(v9, "na_safeAddObject:", v46);
          v32 = v34;
        }
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      }
      while (v69);
    }

    if (objc_msgSend(v9, "count"))
    {
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10002C940;
      v70[3] = &unk_10004A688;
      v71 = v9;
      -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:](v59, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:", v71, 0, 0, 0, 0, v70);
      v56 = v71;
    }
    else
    {
      v58 = sub_10002E034();
      v56 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_10002DEE8();
    }
    v11 = v60;
    v7 = v61;

  }
  else
  {
    v57 = sub_10002E034();
    v16 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There are no cached services configured on account", buf, 2u);
    }
  }

}

- (void)_checkShareStatusIfApplicable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentHome"));

    if (v6
      && (objc_msgSend(v6, "isCurrentUserHomeOwner") & 1) == 0
      && (objc_msgSend(v6, "isCurrentUserRestrictedGuest") & 1) == 0)
    {
      v7 = objc_opt_class(CKShare);
      v8 = v4;
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "participants"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_firstObjectPassingTest:", &stru_10004A6A8));

      v13 = sub_10002E034();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          v16 = CKStringFromParticipantInvitationTokenStatus(objc_msgSend(v12, "invitationTokenStatus"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          *(_DWORD *)buf = 138412290;
          v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "There exists a participant whose invitation token status : %@", buf, 0xCu);

        }
        objc_msgSend(v12, "setWantsNewInvitationToken:", 1);
        objc_msgSend(v10, "addParticipant:", v12);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10002CCAC;
        v18[3] = &unk_10004A710;
        v19 = v8;
        -[CKDatabase saveRecord:withOptions:completion:](self, "saveRecord:withOptions:completion:", v10, 0, v18);
        v14 = v19;
      }
      else if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No eligible participant on the share (NeedsNewToken - NO)", buf, 2u);
      }

    }
  }

}

- (id)operationConfiguration
{
  return (id)objc_opt_new(CKOperationConfiguration, a2);
}

- (void)_notifyObserversDataChanged:(id)a3 cachedData:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a4;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting notification a property changed on service object", v10, 2u);
  }

  notify_post((const char *)objc_msgSend(kMediaSetupServicesChanged, "UTF8String"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServicesUpdated servicesUpdated:cachedData:](MSDServicesUpdated, "servicesUpdated:cachedData:", v6, v5));

  objc_msgSend(v9, "processChangesInServices");
}

- (BOOL)_attemptToRecordServiceRequestLapse:(id)a3 fromRecords:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v30;
  uint8_t buf[8];
  _QWORD v32[4];
  id v33;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v8 = kMissedServiceRequestKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForDefault:", kMissedServiceRequestKey));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMissedServiceRequestServiceKey));
  v11 = v10;
  if (v10)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002D22C;
    v32[3] = &unk_100048A98;
    v12 = v10;
    v33 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v32));
    if (v13)
    {
      v14 = sub_10002E034();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Noticed a request for a missing service while adding it.", buf, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v16, "removeObjectForDefault:", v8);

      v30 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &stru_10004A730));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMissedServiceRequestDateLastRequestedKey));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "creationDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "components:fromDate:toDate:options:", 16, v18, v20, 0));

      v22 = (uint64_t)objc_msgSend(v21, "day");
      v23 = v22 < 2;
      if (v22 < 2)
      {
        v27 = objc_msgSend(objc_alloc((Class)MSServiceRequestLapseEvent), "initWithServiceID:", v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "creationDate"));
        -[NSObject setRecordCreationDate:](v27, "setRecordCreationDate:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMissedServiceRequestTimeLastRequestedKey));
        -[NSObject setTimeOfRequest:](v27, "setTimeOfRequest:", objc_msgSend(v25, "unsignedLongLongValue"));

        -[NSObject setDateOfRequest:](v27, "setDateOfRequest:", v18);
        -[NSObject setEndTime:](v27, "setEndTime:", mach_absolute_time());
        +[MSAnalytics sendServiceRequestLapseEvent:](MSAnalytics, "sendServiceRequestLapseEvent:", v27);
      }
      else
      {
        v26 = sub_10002E034();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Request for service over a day old. Skipping noting it as a lapse event.", buf, 2u);
        }
      }

      v6 = v30;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
