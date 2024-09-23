@implementation MSDDataController

- (MSDDataController)initWithCloudDataManager:(id)a3 homeManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MSDDataController *v10;
  MSDDataController *v11;
  MSDDataController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSDDataController;
    v11 = -[MSDDataController init](&v14, "init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_cloudManager, a3);
      objc_storeStrong((id *)&v12->_homeManager, a4);
      v12->_isPerformingRefresh = 0;
      v12->_refreshLock._os_unfair_lock_opaque = 0;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001D14;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052710 != -1)
    dispatch_once(&qword_100052710, block);
  return (id)qword_100052708;
}

- (void)refreshDataForReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  MSDDataRefresh *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location[3];

  v6 = a4;
  os_unfair_lock_lock(&self->_refreshLock);
  if (self->_isPerformingRefresh)
  {
    os_unfair_lock_unlock(&self->_refreshLock);
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 9)
        v9 = CFSTR("Unknown");
      else
        v9 = off_100048908[a3];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping request (reason: %@) to perform refresh. One underway", (uint8_t *)location, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    self->_isPerformingRefresh = 1;
    os_unfair_lock_unlock(&self->_refreshLock);
    v10 = -[MSDDataRefresh initWithReason:]([MSDDataRefresh alloc], "initWithReason:", a3);
    objc_initWeak(location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100001F84;
    v11[3] = &unk_1000488E8;
    objc_copyWeak(&v13, location);
    v12 = v6;
    -[MSDDataRefresh performRefreshWithCompletion:](v10, "performRefreshWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);

  }
}

- (void)invalidateRefreshTimestamps
{
  +[MSDDataRefresh clearLastRefreshTSForHomes](MSDDataRefresh, "clearLastRefreshTSForHomes");
}

- (MSDCloudManager)cloudManager
{
  return self->_cloudManager;
}

- (MSDHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)isPerformingRefresh
{
  return self->_isPerformingRefresh;
}

- (void)setIsPerformingRefresh:(BOOL)a3
{
  self->_isPerformingRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_cloudManager, 0);
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateCloudDatabase"));
  objc_msgSend(v13, "addMediaService:usingSetupBundles:transaction:completion:", v12, v11, v10, v9);

}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateCloudDatabase"));
  objc_msgSend(v7, "getAvailableServices:completion:", v6, v5);

}

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabase"));
  objc_msgSend(v10, "updateDefaultMediaService:withUserInfo:completion:", v9, v8, v7);

}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateCloudDatabase"));
  objc_msgSend(v7, "getDefaultMediaService:completion:", v6, v5);

}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateCloudDatabase"));
  objc_msgSend(v13, "updateProperty:propertyInfo:withUserInfo:completion:", v12, v11, v10, v9);

}

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabase"));
  objc_msgSend(v10, "removeMediaService:withUserInfo:completion:", v9, v8, v7);

}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString **v13;
  uint64_t *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    if (!v9)
      goto LABEL_13;
    v12 = MSErrorDomain;
    v21 = MSUserInfoErrorStringKey;
    v22 = CFSTR("ServiceIDs specified is nil");
    v13 = &v22;
    v14 = &v21;
LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 1, v17));
    v9[2](v9, 0, v18);

    goto LABEL_13;
  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privateCloudDatabase"));
    objc_msgSend(v11, "removeMediaServices:withUserInfo:completion:", v7, v8, v9);

    goto LABEL_13;
  }
  v15 = sub_10002E034();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100019140(v16);

  if (v9)
  {
    v12 = MSErrorDomain;
    v19 = MSUserInfoErrorStringKey;
    v20 = CFSTR("Failed to remove services, NIL identifiers passed");
    v13 = &v20;
    v14 = &v19;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabase"));
  objc_msgSend(v10, "getServiceConfigurationInfo:serviceID:completion:", v9, v8, v7);

}

- (void)getCachedAvailableServices:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  uint64_t v11;
  const __CFString **v12;
  NSErrorUserInfoKey *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        -[MSDDataController _findServicesForUser:homeID:completion:](self, "_findServicesForUser:homeID:completion:", v8, v9, v10);
        goto LABEL_8;
      }
      v11 = MSErrorDomain;
      v16 = NSLocalizedDescriptionKey;
      v17 = CFSTR("HomeID Passed is Nil");
      v12 = &v17;
      v13 = &v16;
    }
    else
    {
      v11 = MSErrorDomain;
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("HomeUserID Passed is Nil");
      v12 = &v19;
      v13 = &v18;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, 1, v14));
    v10[2](v10, 0, v15);

  }
LABEL_8:

}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateCloudDatabase"));
  objc_msgSend(v13, "switchUserAccountInfo:homeID:homeUserID:completion:", v12, v11, v10, v9);

}

- (void)_findServicesForUser:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeWithIdentifier:", v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUser"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
  v15 = objc_msgSend(v10, "isEqual:", v14);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018B04;
  v17[3] = &unk_100049558;
  v18 = v8;
  v16 = v8;
  -[MSDDataController _servicesForUser:homeID:publicInfo:currentUser:completion:](self, "_servicesForUser:homeID:publicInfo:currentUser:completion:", v10, v9, 0, v15, v17);

}

- (void)_servicesForUser:(id)a3 homeID:(id)a4 publicInfo:(id)a5 currentUser:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  __CFString **v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  NSErrorUserInfoKey v34;
  void *v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;

  v8 = a6;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *, _QWORD))a7;
  v13 = kPrivateDatabaseKeyData;
  if (!v8)
    v13 = kSharedDatabaseKeyData;
  v14 = *v13;
  v15 = sub_10002E034();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("is NOT");
    if (v8)
      v17 = CFSTR("is");
    v18 = CFSTR("Shared");
    if (v8)
      v18 = CFSTR("Private");
    *(_DWORD *)buf = 138412546;
    v39 = v17;
    v40 = 2112;
    v41 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "The user %@ the currentUser, querying %@ database", buf, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForDefaultWithCustomClass:", v14));

  if (objc_msgSend(v20, "count"))
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100019048;
    v31[3] = &unk_100048B10;
    v21 = v10;
    v32 = v21;
    v33 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "na_filter:", v31));
    v23 = v22;
    if (v22 && objc_msgSend(v22, "count"))
    {
      v12[2](v12, v23, 0);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to locate services for homeUserID %@"), v21));
      v25 = MSErrorDomain;
      v34 = NSLocalizedDescriptionKey;
      v35 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, 5, v26));
      ((void (**)(id, void *, void *))v12)[2](v12, 0, v27);

    }
    v28 = v32;
  }
  else
  {
    v29 = MSErrorDomain;
    v36 = NSLocalizedDescriptionKey;
    v37 = CFSTR("No service configured in home");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v29, 2, v28));
    ((void (**)(id, void *, void *))v12)[2](v12, 0, v30);

  }
}

@end
