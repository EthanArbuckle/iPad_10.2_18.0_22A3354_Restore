@implementation MSDDataRefresh

- (MSDDataRefresh)initWithReason:(unint64_t)a3
{
  MSDDataRefresh *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDDataRefresh;
  result = -[MSDDataRefresh init](&v5, "init");
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = 0.0;
  }
  return result;
}

- (MSDDataRefresh)initWithReason:(unint64_t)a3 withDelay:(double)a4
{
  MSDDataRefresh *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDDataRefresh;
  result = -[MSDDataRefresh init](&v7, "init");
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = a4;
  }
  return result;
}

- (void)performRefreshWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const __CFString *refreshed;
  void *v8;
  double delay;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    refreshed = MSDDataRefreshReasonToString(self->_refreshReason);
    v8 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    delay = self->_delay;
    *(_DWORD *)buf = 136315650;
    v16 = "-[MSDDataRefresh performRefreshWithCompletion:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = delay;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s reason: %@ delay: %f", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCloudManager sharedManager](MSDCloudManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001940C;
  v12[3] = &unk_1000498A0;
  v11 = v4;
  v12[4] = self;
  v13 = v11;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v10, "isCloudKitAccessAvailable:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)_performDataRefresh:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;
  const __CFString *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allHomes"));

  if (v6 && objc_msgSend(v6, "count"))
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Homes user is part of %{private}@", buf, 0xCu);
    }

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hmf_objectsPassingTest:", &stru_1000498E0));
    v10 = objc_msgSend(v9, "count");
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138477827;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performing update on the following homes: %{private}@", buf, 0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100019920;
      v18[3] = &unk_100049958;
      v20 = v4;
      v18[4] = self;
      v9 = v9;
      v19 = v9;
      -[MSDDataRefresh _checkZoneAndDefaultRecordInEachHome:completion:](self, "_checkZoneAndDefaultRecordInEachHome:completion:", v9, v18);

      v14 = v20;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit refresh. Homes do not contain valid accessories for media setup.", buf, 2u);
      }

      if (!v4)
        goto LABEL_12;
      v16 = MSErrorDomain;
      v21 = MSUserInfoErrorStringKey;
      v22 = CFSTR("Failed to perform refresh. No valid accessories in home to setup.");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 3, v14));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);

    }
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if (v4)
  {
    v15 = MSErrorDomain;
    v25 = MSUserInfoErrorStringKey;
    v26 = CFSTR("Failed to perform refresh. No homes available.");
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 3, v9));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);
    goto LABEL_11;
  }
LABEL_13:

}

- (void)_checkZoneAndDefaultRecordInEachHome:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  char v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v6 = a3;
  v22 = a4;
  v7 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v13 = sub_10002E034();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting refresh for Home : %{private}@", buf, 0xCu);
        }

        if (objc_msgSend(v12, "isCurrentUserRestrictedGuest"))
        {
          v15 = sub_10002E034();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUser"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueIdentifier"));
            *(_DWORD *)buf = 138477827;
            v36 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Determined user (%{private}@) to be a restricted guest. Skipping setting up media in the home", buf, 0xCu);

          }
        }
        else
        {
          dispatch_group_enter(v7);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10001A028;
          v26[3] = &unk_100049068;
          v28 = v33;
          v26[4] = v12;
          v27 = v7;
          -[MSDDataRefresh _initializeCKAndServiceInfoForHome:completion:](self, "_initializeCKAndServiceInfoForHome:completion:", v12, v26);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v9);
  }

  global_queue = dispatch_get_global_queue(2, 0);
  v20 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A130;
  block[3] = &unk_100049980;
  v24 = v22;
  v25 = v33;
  v21 = v22;
  dispatch_group_notify(v7, v20, block);

  _Block_object_dispose(v33, 8);
}

- (void)_deleteZombieRecordZonesIfAnyInHomes:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  MSDDataRefresh *v21;
  void (**v22)(id, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if ((+[MSDeviceInfo isDeviceAppleTV](MSDeviceInfo, "isDeviceAppleTV") & 1) != 0
    || +[MSDeviceInfo isDeviceAudioAccessory](MSDeviceInfo, "isDeviceAudioAccessory"))
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "** Deletion of recordZones will be handled by the iOS device **", buf, 2u);
    }

    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_map:", &stru_1000499C0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabase"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001A370;
    v17[3] = &unk_100049A60;
    v22 = v7;
    v18 = v12;
    v19 = v10;
    v20 = v6;
    v21 = self;
    v14 = v10;
    v15 = v12;
    objc_msgSend(v13, "setFetchRecordZonesCompletionBlock:", v17);
    objc_msgSend(v13, "setQualityOfService:", 17);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "operationConfiguration"));
    objc_msgSend(v13, "setConfiguration:", v16);

    objc_msgSend(v15, "addOperation:", v13);
  }

}

- (void)_deleteRecordZone:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "privateCloudDatabase"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001ADB0;
  v11[3] = &unk_100049A88;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "deleteRecordZone:withOptions:completion:", v10, 0, v11);

}

- (void)_refreshDatabases:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;
  _QWORD v21[5];
  id v22;

  v3 = a3;
  v4 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10001A890;
  v21[4] = sub_10001A8A0;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  dispatch_group_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "privateCloudDatabase"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001B06C;
  v15[3] = &unk_100049AB0;
  v17 = v21;
  v18 = v19;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v6, "refreshDatabase:completion:", 0, v15);

  global_queue = dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B104;
  v11[3] = &unk_100049AD8;
  v12 = v3;
  v13 = v19;
  v14 = v21;
  v10 = v3;
  dispatch_group_notify(v7, v9, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

+ (void)clearLastRefreshTSForHomes
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = sub_10002E034();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10001DE9C(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v11, "removeObjectForDefault:", CFSTR("lastDataRefresh"));

}

+ (void)cacheLastRefreshforHomes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forDefault:", v6, CFSTR("lastDataRefresh"));

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100049AF8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v7, "setObject:forDefault:", v8, CFSTR("homesRefreshed"));

}

- (void)refreshDataAfterDelay
{
  id v3;
  NSObject *v4;
  double delay;
  const __CFString *refreshed;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  void *v15;

  objc_initWeak(&location, self);
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    delay = self->_delay;
    refreshed = MSDDataRefreshReasonToString(self->_refreshReason);
    v7 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    *(_DWORD *)buf = 134218242;
    v13 = delay;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling Refresh task after %f with reason: %@", buf, 0x16u);

  }
  v8 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B640;
  v9[3] = &unk_1000489C0;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_initializeCKAndServiceInfoForHome:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MSDFetchCKDataOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MSDFetchCKDataOptions);
  -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v8, "setCreateNewZoneIfMissing:", 1);
  -[MSDFetchCKDataOptions setUserInitiatedRequest:](v8, "setUserInitiatedRequest:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateCloudDatabase"));

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001B968;
  v18[3] = &unk_100049B70;
  v16 = v7;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  v17 = v6;
  v19 = v17;
  objc_msgSend(v10, "fetchRecordZoneFor:user:withOptions:completion:", v12, v15, v8, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_checkDataSanity:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  _QWORD v43[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc((Class)CKRecordID);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v17 = objc_msgSend(v14, "initWithRecordName:zoneID:", v15, v16);

  v18 = objc_alloc((Class)CKRecordID);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v20 = objc_msgSend(v18, "initWithRecordName:zoneID:", MSDefaultServiceRecordName, v19);

  if (v17 && v20)
  {
    objc_initWeak(&location, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "privateCloudDatabase"));

    v43[0] = v17;
    v43[1] = v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001BE70;
    v34[3] = &unk_100049BC0;
    objc_copyWeak(&v41, &location);
    v40 = v13;
    v35 = v17;
    v36 = v20;
    v37 = v12;
    v38 = v10;
    v39 = v11;
    objc_msgSend(v22, "fetchRecordWithIDS:withOptions:completion:", v23, 0, v34);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v24 = sub_10002E034();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10001E040(v25, v26, v27, v28, v29, v30, v31, v32);

    if (v13)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
      (*((void (**)(id, void *))v13 + 2))(v13, v33);

    }
  }

}

- (BOOL)_shouldProceedWithExecution:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "CKErrorHasErrorCode:", 11);
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown item error, Okay to continue, we will create new record", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001E0B0();
  }

  return v4;
}

- (void)_createAndSaveAppleMusicRecord:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
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
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating AppleMusic Service record with PublicDB Info : %{private}@", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecord createRecordWithName:recordType:recordZone:](CKRecord, "createRecordWithName:recordType:recordZone:", v16, MSServiceAccountRecordType, v10));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUser"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));

  v23 = sub_10002E034();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v33 = v19;
    v34 = 2113;
    v35 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Adding Home Entries HomeID : %{private}@ HomeUserID : %{private}@", buf, 0x16u);
  }

  objc_msgSend(v17, "setRecordFieldForKey:value:", MSHomeParticipantHomeIdentifier, v19);
  objc_msgSend(v17, "setRecordFieldForKey:value:", MSHomeParticipantHomeUserIdentifier, v22);
  objc_initWeak((id *)buf, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceID"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001C5EC;
  v28[3] = &unk_100049BE8;
  v26 = v13;
  v30 = v26;
  objc_copyWeak(&v31, (id *)buf);
  v27 = v12;
  v29 = v27;
  -[MSDDataRefresh _saveMediaServiceConfigInfo:record:completion:](self, "_saveMediaServiceConfigInfo:record:completion:", v25, v17, v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

- (void)_shareThisRecordIfApplicable:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  NSObject *v12;
  unsigned int v13;
  const __CFString *v14;
  id v15;
  NSObject *v16;
  char *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, _QWORD);
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v9, "isCurrentUserHomeOwner");
    v14 = CFSTR("NO");
    v22 = "-[MSDDataRefresh _shareThisRecordIfApplicable:home:completion:]";
    *(_DWORD *)buf = 136315651;
    if (v13)
      v14 = CFSTR("YES");
    v23 = 2113;
    v24 = v9;
    v25 = 2112;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %{private}@ CurrentUserOwner: %@", buf, 0x20u);
  }

  if (objc_msgSend(v9, "isCurrentUserHomeOwner")
    || objc_msgSend(v9, "isCurrentUserRestrictedGuest"))
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    v15 = sub_10002E034();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
      *(_DWORD *)buf = 138477827;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting up share for participant with recordID %{private}@", buf, 0xCu);

    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001CA90;
    v18[3] = &unk_100049C10;
    v19 = v9;
    v20 = v10;
    -[MSDDataRefresh _setupShareForParticipant:home:completion:](self, "_setupShareForParticipant:home:completion:", v8, v19, v18);

  }
}

- (void)_updateDefaultService:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v7 = a5;
  v8 = MSDefaultServiceRecordName;
  v9 = MSDefaultServiceRecordType;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecord createRecordWithName:recordType:recordZone:](CKRecord, "createRecordWithName:recordType:recordZone:", v8, v9, v13));

  v15 = MediaServiceIdentifier;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordFieldForKey:", MediaServiceIdentifier));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));

  v20 = sub_10002E034();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v28 = v16;
    v29 = 2113;
    v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setting default service identifier %{private}@ and homeUserID %{private}@", buf, 0x16u);
  }

  objc_msgSend(v14, "setRecordFieldForKey:value:", v15, v16);
  objc_msgSend(v14, "setRecordFieldForKey:value:", MSHomeParticipantHomeUserIdentifier, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "privateCloudDatabase"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001CE40;
  v25[3] = &unk_100049C38;
  v26 = v7;
  v24 = v7;
  objc_msgSend(v23, "saveRecord:completionHandler:", v14, v25);

}

- (void)_saveMediaServiceConfigInfo:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to save record for Apple Music with service info : %{private}@", buf, 0xCu);
  }

  objc_msgSend(v9, "setRecordFieldForKey:value:", MediaServiceIdentifier, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "privateCloudDatabase"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D084;
  v15[3] = &unk_100049C38;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v13, "saveRecord:withOptions:completion:", v9, 0, v15);

}

- (void)_setupShareForParticipant:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeCloudShareCreate cloudShareForHome:](MSDHomeCloudShareCreate, "cloudShareForHome:", v8));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D22C;
  v14[3] = &unk_100049C60;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "setupShareForHomeParticipant:completion:", v10, v14);

}

- (BOOL)_shouldPreformRefresh:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForDefault:", CFSTR("lastDataRefresh")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", MSPrivateDatabaseRefreshIntervalInSecs));
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 == (id)-1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForDefault:", CFSTR("homesRefreshed")));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100049C80));
    v16 = (void *)v15;
    LOBYTE(v12) = 1;
    if (v14 && v15)
    {
      v17 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v14);
      v18 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v16);
      v12 = objc_msgSend(v17, "isEqualToSet:", v18) ^ 1;

    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)_handleCKShareError:(id)a3 home:(id)a4
{
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  id v18;
  NSObject *v19;
  MSDBackgroundActivityTask *v20;
  MSDBackgroundActivityTask *v21;
  char *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  MSDBackgroundActivityTask *v27;
  uint8_t buf[4];
  char *v29;
  __int16 v30;
  void *v31;

  v5 = (char *)a3;
  v6 = a4;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Encountered error when trying to share recordZone with owner %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v9, "isEqualToString:", HMErrorDomain))
    goto LABEL_15;
  v10 = objc_msgSend(v5, "code");

  if (v10 == (id)8)
  {
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "HomeOwner device did not respond in time, hit HomeKit timeout error", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CKShareErrorRetryCount"), v14));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForDefault:", v9));
    v17 = (char *)objc_msgSend(v16, "integerValue");

    if (v17 == (char *)MSCKShareTimeoutErrorMaxRetryCount)
    {
      v18 = sub_10002E034();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Hit max retry count, aborting..", buf, 2u);
      }

      v20 = [MSDBackgroundActivityTask alloc];
      v21 = -[MSDBackgroundActivityTask initWithIdentifier:](v20, "initWithIdentifier:", kBackgroundActivityUserShareRetryTaskIdentifier);
      -[MSDBackgroundActivityTask invalidate](v21, "invalidate");
    }
    else
    {
      v22 = v17 + 1;
      v23 = sub_10002E034();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349315;
        v29 = v22;
        v30 = 2113;
        v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating value of retry count %{public}lu for %{private}@", buf, 0x16u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22));
      objc_msgSend(v25, "setObject:forDefault:", v26, v9);

      v27 = [MSDBackgroundActivityTask alloc];
      v21 = -[MSDBackgroundActivityTask initWithIdentifier:](v27, "initWithIdentifier:", kBackgroundActivityUserShareRetryTaskIdentifier);
      -[MSDBackgroundActivityTask invalidate](v21, "invalidate");
      -[MSDBackgroundActivityTask setAllowBattery:](v21, "setAllowBattery:", 1);
      -[MSDBackgroundActivityTask setRepeats:](v21, "setRepeats:", 0);
      -[MSDBackgroundActivityTask setRequireNetworkConnection:](v21, "setRequireNetworkConnection:", 1);
      -[MSDBackgroundActivityTask setInterval:](v21, "setInterval:", MSCKShareTimeoutRetryIntervalInSecs);
      -[MSDBackgroundActivityTask setRequireInexpensiveNetworkConnection:](v21, "setRequireInexpensiveNetworkConnection:", 1);
      -[MSDBackgroundActivityTask setActivityBlock:](v21, "setActivityBlock:", &stru_100049CC0);
      -[MSDBackgroundActivityTask schedule](v21, "schedule");
    }

LABEL_15:
  }

}

- (unint64_t)refreshReason
{
  return self->_refreshReason;
}

- (double)delay
{
  return self->_delay;
}

@end
