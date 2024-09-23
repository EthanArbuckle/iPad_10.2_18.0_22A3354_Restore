@implementation MSDPublicDBManager

+ (id)shared
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000224CC;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_1000527C0 != -1)
    dispatch_once(&qword_1000527C0, block);
  return (id)qword_1000527B8;
}

- (MSDPublicDBManager)init
{
  MSDPublicDBManager *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *queuedPendingRequests;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notifyQueue;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;

  v13.receiver = self;
  v13.super_class = (Class)MSDPublicDBManager;
  v2 = -[MSDPublicDBManager init](&v13, "init");
  if (v2)
  {
    v3 = sub_10002E034();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MSDPublicDBManager init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v2->_retryCount = 0;
    v2->_isCurrentlySyncing = 0;
    v6 = objc_opt_new(NSMutableArray, v5);
    queuedPendingRequests = v2->_queuedPendingRequests;
    v2->_queuedPendingRequests = (NSMutableArray *)v6;

    v2->_syncLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.mediasetup.publicdb-notify-queue", v9);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)syncDataWithCloudKit:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022694;
  v5[3] = &unk_100049558;
  v6 = a3;
  v4 = v6;
  -[MSDPublicDBManager _syncDataWithCloudKitWithCompletion:](self, "_syncDataWithCloudKitWithCompletion:", v5);

}

+ (void)getPublicInfoForServiceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022748;
  v9[3] = &unk_100049F90;
  v11 = a4;
  v12 = a1;
  v10 = v6;
  v7 = v6;
  v8 = v11;
  objc_msgSend(a1, "_fetchData:", v9);

}

+ (void)getPublicInfoForServiceID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022898;
  v9[3] = &unk_100049F90;
  v11 = a4;
  v12 = a1;
  v10 = v6;
  v7 = v6;
  v8 = v11;
  objc_msgSend(a1, "_fetchData:", v9);

}

+ (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000229E8;
  v9[3] = &unk_100049F90;
  v11 = a4;
  v12 = a1;
  v10 = v6;
  v7 = v6;
  v8 = v11;
  objc_msgSend(a1, "_fetchData:", v9);

}

+ (id)getCachedPublicInfoForServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getMatchingObjectForServiceName:serviceName:", v6, v4));
  return v7;
}

+ (id)getCachedPublicInfoForServiceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getMatchingObjectForServiceID:serviceID:", v6, v4));
  return v7;
}

+ (id)getCachedPublicInfoForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getMatchingObjectForBundleID:bundleID:", v6, v4));
  return v7;
}

+ (id)getCachedPublicInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

  return v3;
}

- (id)createPublicDBInfoObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceName));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceIdentifier));
  v6 = objc_msgSend(objc_alloc((Class)MSPublicDBInfo), "initWithServiceName:serviceID:", v4, v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
    objc_msgSend(v6, "setRecordName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceType));
    objc_msgSend(v6, "setServiceType:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceBundleIdentifier));
    objc_msgSend(v6, "setBundleIDS:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceIconPath));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
    objc_msgSend(v6, "setServiceIconPath:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceConfigurationPublicKey));
    objc_msgSend(v6, "setConfigurationPublicKey:", v13);

    v14 = v6;
  }
  else
  {
    v15 = sub_10002E034();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002552C();

  }
  return v6;
}

- (id)createPublicDBInfoObjectFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceName));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceIdentifier));
  v6 = objc_msgSend(objc_alloc((Class)MSPublicDBInfo), "initWithServiceName:serviceID:", v4, v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceType));
    objc_msgSend(v6, "setServiceType:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceBundleIdentifier));
    objc_msgSend(v6, "setBundleIDS:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceIconPath));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
    objc_msgSend(v6, "setServiceIconPath:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MediaServiceConfigurationPublicKey));
    objc_msgSend(v6, "setConfigurationPublicKey:", v11);

    v12 = v6;
  }
  else
  {
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to create MSPublicDBInfo object with serviceName %@ service ID: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  return v6;
}

- (void)_syncDataWithCloudKitWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[8];
  _QWORD v40[5];
  id v41;
  _QWORD *v42;
  __int128 *p_buf;
  id v44;
  id location;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[MSDPublicDBManager _syncDataWithCloudKitWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100023728;
  v54[3] = &unk_100049FB8;
  v54[4] = self;
  v56 = &v57;
  v7 = v4;
  v55 = v7;
  -[MSDPublicDBManager _withLock:](self, "_withLock:", v54);
  if (v7 && !*((_BYTE *)v58 + 24))
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A sync with the public db is already underway. Suspending request to sync with CloudKit until sync is complete.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_25;
  }
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting sync with public db", (uint8_t *)&buf, 2u);
  }

  v12 = objc_alloc((Class)CKRecordZoneID);
  v13 = objc_msgSend(v12, "initWithZoneName:ownerName:", MSPublicInfoRecordZoneName, CKCurrentUserDefaultName);
  v9 = v13;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject zoneName](v13, "zoneName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPublicDBManager _fetchPreviousChangeToken:](self, "_fetchPreviousChangeToken:", v14));

    v17 = (void *)objc_opt_new(CKFetchRecordZoneChangesConfiguration, v16);
    objc_msgSend(v17, "setPreviousServerChangeToken:", v15);
    v38 = v17;
    if (v17)
    {
      v67 = v9;
      v68 = v17;
      v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1, v17));
      v19 = sub_10002E034();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Public] Passing Configuration for recordZoneID %{private}@", (uint8_t *)&buf, 0xCu);
      }

      v21 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
      v66 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
      v23 = objc_msgSend(v21, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v22, v18);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x3032000000;
      v63 = sub_1000237B0;
      v64 = sub_1000237C0;
      v65 = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = sub_1000237B0;
      v52[4] = sub_1000237C0;
      v53 = (id)objc_opt_new(NSMutableArray, v24);
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = sub_1000237B0;
      v50[4] = sub_1000237C0;
      v51 = (id)objc_opt_new(NSMutableArray, v25);
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x3032000000;
      v48[3] = sub_1000237B0;
      v48[4] = sub_1000237C0;
      v49 = (id)objc_opt_new(NSMutableArray, v26);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000237C8;
      v47[3] = &unk_100049FE0;
      v47[4] = v50;
      objc_msgSend(v23, "setRecordWithIDWasDeletedBlock:", v47);
      v27 = (void *)v18;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100023890;
      v46[3] = &unk_10004A008;
      v46[4] = v52;
      objc_msgSend(v23, "setRecordWasChangedBlock:", v46);
      objc_initWeak(&location, self);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000239B8;
      v40[3] = &unk_10004A098;
      objc_copyWeak(&v44, &location);
      v40[4] = self;
      v42 = v48;
      p_buf = &buf;
      v41 = v7;
      objc_msgSend(v23, "setFetchRecordZoneChangesCompletionBlock:", v40);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100024020;
      v39[3] = &unk_10004A0C0;
      v39[6] = v52;
      v39[7] = v50;
      v39[4] = self;
      v39[5] = &buf;
      objc_msgSend(v23, "setRecordZoneFetchCompletionBlock:", v39);
      objc_msgSend(v23, "setQualityOfService:", 17);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDPublicCloudKitContainer](CKContainer, "MSDPublicCloudKitContainer"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "publicCloudDatabase"));
      objc_msgSend(v29, "addOperation:", v23);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      _Block_object_dispose(v48, 8);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v34 = sub_10002E034();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_1000255D0(v35, v36, v37);

      if (!v7)
        goto LABEL_23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0, 0));
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v27);
    }

LABEL_23:
    goto LABEL_24;
  }
  v30 = sub_10002E034();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_100025598(v31, v32, v33);

  if (v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);
LABEL_24:

  }
LABEL_25:

  _Block_object_dispose(&v57, 8);
}

- (id)_handleRecordsChanged:(id)a3 deletedRecordIDS:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPublicDBManager _handleDeletedRecordIDS:localCachedCopy:](self, "_handleDeletedRecordIDS:localCachedCopy:", v9, v11));
  if (!v12 || !objc_msgSend(v12, "count"))
  {
    v14 = objc_opt_new(NSMutableArray, v13);

    v12 = (void *)v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPublicDBManager _handleChangedRecords:localCachedCopy:error:](self, "_handleChangedRecords:localCachedCopy:error:", v8, v12, a5));

  return v15;
}

- (id)_handleDeletedRecordIDS:(id)a3 localCachedCopy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &stru_10004A100));
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v37 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Public] RecordIDS deleted on device: %{private}@", buf, 0xCu);
    }

    v29 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
          v19 = objc_msgSend(v17, "containsObject:", v18);

          if (v19)
          {
            v20 = sub_10002E034();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
              *(_DWORD *)buf = 138477827;
              v37 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Public] Found match for %{private}@, removing obj from local copy", buf, 0xCu);

            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v23));

            objc_msgSend(v10, "removeObject:", v24);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    v25 = objc_msgSend(v10, "copy");
    v6 = v29;
    v5 = v30;
  }
  else
  {
    v26 = sub_10002E034();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[Public] Deleted recordIDS or cachedData is nil, skipping update", buf, 2u);
    }

    v25 = v6;
  }

  return v25;
}

- (id)_handleChangedRecords:(id)a3 localCachedCopy:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  id v31;
  uint64_t v32;
  id obj;
  _QWORD v35[4];
  id v36;
  uint8_t v37;
  _BYTE v38[15];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v7;
    obj = v7;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    v11 = v8;
    v31 = v9;
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v40;
      v32 = MSErrorDomain;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(obj);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPublicDBManager createPublicDBInfoObject:](self, "createPublicDBInfoObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), v30));
          v16 = v15;
          if (v15)
          {
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100024A44;
            v35[3] = &unk_100048B60;
            v17 = v15;
            v36 = v17;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_firstObjectPassingTest:", v35));
            if (v18)
            {
              v19 = v13;
              v20 = sub_10002E034();
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = v11;
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serviceID"));
                *(_DWORD *)buf = 138477827;
                v44 = v23;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "A property on a known service (%{private}@) changed", buf, 0xCu);

                v11 = v22;
                v9 = v31;
              }

              objc_msgSend(v9, "removeObject:", v18);
              v13 = v19;
            }
            objc_msgSend(v9, "na_safeAddObject:", v17);

          }
          else
          {
            v24 = sub_10002E034();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              sub_1000257F4(&v37, v38, v25);

            if (a5)
              *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v32, 1, 0));
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v12);
    }

    v26 = v11;
    v7 = v30;
  }
  else
  {
    v26 = v8;
    v27 = sub_10002E034();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Public] Changed records is nil, skipping update", buf, 2u);
    }

    v31 = v26;
  }

  return v31;
}

- (void)_clearAllDefaultsData
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v2, "clearObjectForDefault:", CFSTR("publicDBData"));

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v3, "clearObjectForDefault:", CFSTR("publicDBChangeTokenMap"));

}

- (void)_updateLastRefreshTS
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forDefault:", v3, CFSTR("publicDBLastRefreshTS"));

}

- (BOOL)shouldUseCloudKit
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForDefault:", CFSTR("publicDBLastRefreshTS")));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", MSPublicDatabaseRefreshIntervalInSecs));
  v9 = objc_msgSend(v7, "compare:", v8) != (id)-1;

  return v9;
}

- (id)_fetchPreviousChangeToken:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForDefaultWithCustomClass:", CFSTR("publicDBChangeTokenMap")));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));
  else
    v6 = 0;

  return v6;
}

- (void)_updateDefaultsWithChangeToken:(id)a3 serverChangeToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForDefaultWithCustomClass:", CFSTR("publicDBChangeTokenMap")));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = (id)objc_opt_new(NSMutableDictionary, v10);
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, v5);
  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138477827;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Public] Updating value of serverChangeToken %{private}@", (uint8_t *)&v15, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v14 = objc_msgSend(v9, "copy");
  objc_msgSend(v13, "setObjectWithCustomClass:forDefault:", v14, CFSTR("publicDBChangeTokenMap"));

}

+ (void)_fetchData:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
  v5 = objc_msgSend(v4, "shouldUseCloudKit");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100024F74;
    v11[3] = &unk_100049558;
    v12 = v3;
    objc_msgSend(v6, "syncDataWithCloudKit:", v11);

    v7 = v12;
LABEL_7:

    goto LABEL_8;
  }
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Public] Returning data from cached copy, last refresh was less than 24 hours back", buf, 2u);
  }

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));
    (*((void (**)(id, void *, _QWORD))v3 + 2))(v3, v10, 0);

    goto LABEL_7;
  }
LABEL_8:

}

+ (id)_getMatchingObjectForServiceID:(id)a3 serviceID:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025084;
  v8[3] = &unk_100048B60;
  v9 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)_getMatchingObjectForBundleID:(id)a3 bundleID:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025148;
  v8[3] = &unk_100048B60;
  v9 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)_getMatchingObjectForServiceName:(id)a3 serviceName:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002520C;
  v8[3] = &unk_100048B60;
  v9 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

- (void)executePendingRequests:(id)a3 forPublicDBInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *notifyQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025314;
  block[3] = &unk_10004A128;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(notifyQueue, block);

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_syncLock;
  void (**v4)(_QWORD);

  p_syncLock = &self->_syncLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_syncLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_syncLock);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)isCurrentlySyncing
{
  return self->_isCurrentlySyncing;
}

- (void)setIsCurrentlySyncing:(BOOL)a3
{
  self->_isCurrentlySyncing = a3;
}

- (NSMutableArray)queuedPendingRequests
{
  return self->_queuedPendingRequests;
}

- (void)setQueuedPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_queuedPendingRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedPendingRequests, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end
