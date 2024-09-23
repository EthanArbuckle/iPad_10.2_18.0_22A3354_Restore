@implementation TransparencyManagedDataStore

- (id)createPeerState:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("PeerState"), v10));

  objc_msgSend(v11, "setUri:", v9);
  objc_msgSend(v11, "setApplication:", v8);

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(self, v12), "cleanseError:", a5);
    v13 = 0;
  }

  return v13;
}

- (id)fetchPeer:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PeerState")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uri = %@ && application = %@"), v9, v8));

  objc_msgSend(v10, "setPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v10, a5));

  objc_msgSend((id)objc_opt_class(self, v14), "cleanseError:", a5);
  if (v13 && objc_msgSend(v13, "count"))
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
  else
    v15 = 0;

  return v15;
}

- (BOOL)performAndWaitForPeer:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100013B80;
  v29 = sub_100013B90;
  v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013B98;
  v19[3] = &unk_10023B080;
  v19[4] = self;
  v13 = v10;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  v23 = &v25;
  v15 = v12;
  v22 = v15;
  v24 = &v31;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)resetPeersToPending:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v12[4];
  TransparencyManagedDataStore *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100013B80;
  v20 = sub_100013B90;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013E44;
  v12[3] = &unk_10023B0A8;
  v13 = self;
  v15 = &v16;
  v5 = a3;
  v14 = v5;
  -[TransparencyManagedDataStore performBlockAndWait:](v13, "performBlockAndWait:", v12);
  v6 = v17;
  if (a4)
  {
    v7 = (void *)v17[5];
    if (v7)
    {
      *a4 = objc_retainAutorelease(v7);
      v6 = v17;
    }
  }
  v8 = v6[5];
  if (v8)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B0C8);
    v9 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v10 = v17[5];
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to reset peer states to pending: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v16, 8);
  return v8 == 0;
}

- (void)peers:(id)a3
{
  id v3;
  _QWORD v4[4];
  TransparencyManagedDataStore *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100013B80;
  v8[4] = sub_100013B90;
  v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014180;
  v4[3] = &unk_10023B110;
  v5 = self;
  v7 = v8;
  v3 = a3;
  v6 = v3;
  -[TransparencyManagedDataStore performBlockAndWait:](v5, "performBlockAndWait:", v4);

  _Block_object_dispose(v8, 8);
}

- (BOOL)setSeenDate:(id)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  uint64_t v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100013B80;
  v31 = sub_100013B90;
  v32 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000145D0;
  v22[3] = &unk_10023B158;
  v22[4] = self;
  v26 = &v27;
  v13 = v11;
  v23 = v13;
  v14 = v12;
  v24 = v14;
  v15 = v10;
  v25 = v15;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v22);
  v16 = v28;
  if (a6)
  {
    v17 = (void *)v28[5];
    if (v17)
    {
      *a6 = objc_retainAutorelease(v17);
      v16 = v28;
    }
  }
  v18 = v16[5];
  if (v18)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B178);
    v19 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v20 = v28[5];
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to update seen date: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v27, 8);
  return v18 == 0;
}

- (void)updateIDSCacheWithResults:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  uint64_t String;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  __int128 v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[7];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];

  v4 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v44;
    *(_QWORD *)&v6 = 141558786;
    v34 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uri", v34));
        objc_msgSend(v36, "addObject:", v10);

        *(_QWORD *)v56 = 0;
        *(_QWORD *)&v56[8] = v56;
        *(_QWORD *)&v56[16] = 0x3032000000;
        v57 = sub_100013B80;
        v58 = sub_100013B90;
        v59 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uri"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "application"));
        v13 = (id *)(*(_QWORD *)&v56[8] + 40);
        v42 = *(id *)(*(_QWORD *)&v56[8] + 40);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100014DF0;
        v41[3] = &unk_10023B1A0;
        v41[4] = v9;
        v41[5] = self;
        v41[6] = v56;
        -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:](self, "performAndWaitForPeer:application:error:block:", v11, v12, &v42, v41);
        objc_storeStrong(v13, v42);

        if (*(_QWORD *)(*(_QWORD *)&v56[8] + 40))
        {
          if (qword_1002A4480 != -1)
            dispatch_once(&qword_1002A4480, &stru_10023B1C0);
          v14 = (id)qword_1002A4488;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uri"));
            String = KTUIStatusGetString(objc_msgSend(v9, "uiStatus"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(String);
            v18 = *(_QWORD *)(*(_QWORD *)&v56[8] + 40);
            *(_DWORD *)buf = v34;
            v49 = 1752392040;
            v50 = 2112;
            v51 = v15;
            v52 = 2114;
            v53 = v17;
            v54 = 2112;
            v55 = v18;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to update peer state for %{mask.hash}@ with %{public}@ sent to IDS: %@", buf, 0x2Au);

          }
        }
        _Block_object_dispose(v56, 8);

        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v5);
  }

  if (qword_1002A4480 != -1)
    dispatch_once(&qword_1002A4480, &stru_10023B1E0);
  v19 = (void *)qword_1002A4488;
  if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = objc_msgSend(v36, "count");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)v56 = 134218242;
    *(_QWORD *)&v56[4] = v21;
    *(_WORD *)&v56[12] = 2112;
    *(_QWORD *)&v56[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "calling IDS with %lu results for %@", v56, 0x16u);

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = obj;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v26);
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023B200);
        v28 = (void *)qword_1002A4488;
        if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = KTUIStatusGetString(objc_msgSend(v27, "uiStatus"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uri"));
          *(_DWORD *)v56 = 138543874;
          *(_QWORD *)&v56[4] = v31;
          *(_WORD *)&v56[12] = 2160;
          *(_QWORD *)&v56[14] = 1752392040;
          *(_WORD *)&v56[22] = 2112;
          v57 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "calling IDS with UIStatus %{public}@ for uri %{mask.hash}@", v56, 0x20u);

        }
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v24);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
  objc_msgSend(v33, "peerVerificationUpdated:", v23);

}

- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  char v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v6 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    v25 = 1;
    *(_QWORD *)&v9 = 141558274;
    v24 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uri", v24));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "application"));
        v16 = -[TransparencyManagedDataStore ignoreFailureForUri:application:status:error:](self, "ignoreFailureForUri:application:status:error:", v14, v15, objc_msgSend(v13, "uiStatus"), a4);

        if (v16)
        {
          if (qword_1002A4480 != -1)
            dispatch_once(&qword_1002A4480, &stru_10023B220);
          v17 = (void *)qword_1002A4488;
          if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_INFO))
          {
            v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uri"));
            *(_DWORD *)buf = v24;
            v32 = 1752392040;
            v33 = 2112;
            v34 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "ignoreFailure for %{mask.hash}@, will update IDS cache", buf, 0x16u);

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uri"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "application"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore verifierResultForPeer:application:](self, "verifierResultForPeer:application:", v20, v21));
          objc_msgSend(v26, "addObject:", v22);

        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(v13, "setSentToIDS:", 1);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v10);
  }
  else
  {
    v25 = 1;
  }

  -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v26);
  return v25 & 1;
}

- (BOOL)ignoreFailureForUri:(id)a3 application:(id)a4 status:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;

  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100013B80;
  v28 = sub_100013B90;
  v29 = 0;
  obj = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100015454;
  v18[3] = &unk_10023B268;
  v22 = a5;
  v18[4] = self;
  v11 = a4;
  v19 = v11;
  v12 = v10;
  v20 = v12;
  v21 = &v24;
  v13 = -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:](self, "performAndWaitForPeer:application:error:block:", v12, v11, &obj, v18);
  objc_storeStrong(&v29, obj);
  if (!v13)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B288);
    v14 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v15 = v25[5];
      *(_DWORD *)buf = 138544130;
      v31 = v11;
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "unable to ignore error for application=%{public}@ uri=%{mask.hash}@: %@", buf, 0x2Au);
    }
    if (a6)
    {
      v16 = (void *)v25[5];
      if (v16)
        *a6 = objc_retainAutorelease(v16);
    }
  }

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)getOptInStatus:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100013B80;
  v17 = sub_100013B90;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000157A8;
  v12[3] = &unk_10023B2B0;
  v12[4] = &v13;
  -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:](self, "performAndWaitForPeer:application:error:block:", v8, v9, a5, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)verifierResultForPeer:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  TransparencyManagedDataStore *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100013B80;
  v25 = sub_100013B90;
  v26 = 0;
  v26 = objc_msgSend(objc_alloc((Class)KTVerifierResult), "initWithUri:application:", v6, v7);
  v20 = 0;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000159AC;
  v16 = &unk_10023B2F8;
  v17 = self;
  v19 = &v21;
  v8 = v6;
  v18 = v8;
  v9 = -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:](self, "performAndWaitForPeer:application:error:block:", v8, v7, &v20, &v13);
  v10 = v20;
  if ((v9 & 1) == 0)
    objc_msgSend((id)v22[5], "setFailure:", v10, v13, v14, v15, v16, v17);
  v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)recalculateVerifierResultForPeer:(id)a3 application:(id)a4 after:(double)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v11 = objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100015D30;
  v14[3] = &unk_10023A868;
  objc_copyWeak(&v17, &location);
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_after(v10, v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)onMocSetPendingResultForVerification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uri"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v7 = objc_msgSend(objc_alloc((Class)KTVerifierResult), "initPendingForUri:application:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverLoggableDatas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loggableDatas"));
  objc_msgSend(v7, "setLoggableDatas:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountKey"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v11, 0));
    objc_msgSend(v7, "setPublicID:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore staticKeyStore](self, "staticKeyStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v13, "updateResultWithStaticKey:staticKeyStore:forDate:", v7, v14, v15);

  v16 = objc_msgSend(v7, "uiStatus");
  if (v16 != objc_msgSend(v13, "lastIDSCacheUIStatus"))
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B318);
    v17 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      *(_DWORD *)buf = 134218754;
      v24 = objc_msgSend(v13, "lastIDSCacheUIStatus");
      v25 = 2048;
      v26 = objc_msgSend(v7, "uiStatus");
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "verifierResultForPeer cached UI status changed %lld->%llu for %{mask.hash}@, will update IDS cache", buf, 0x2Au);

    }
    v22 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v19);

    objc_msgSend(v7, "setSentToIDS:", 1);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerOverridesStore](self, "peerOverridesStore"));
  objc_msgSend(v20, "applyPeerOverrides:peer:", v7, v13);

  -[TransparencyManagedDataStore persistAndRefaultObject:error:](self, "persistAndRefaultObject:error:", v13, 0);
  return v7;
}

- (void)clearPeerState:(id)a3 uris:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSPredicate *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B338);
    v11 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")));
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@ for %@", buf, 0x16u);

    }
    v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application = %@ && uri IN %@"), v8, v10);
  }
  else
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B358);
    v15 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@", buf, 0xCu);
    }
    v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application = %@"), v8, v17);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (-[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("PeerState"), v16, a5)&& -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("IDSKTVerification"), v16, a5))
  {
    -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCSingleQuery"), v16, a5);
  }

}

- (void)setCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000163E8;
  v13[3] = &unk_10023B380;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)removeFailuresOnOptIn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016498;
  v7[3] = &unk_10023B3A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)onQueueRemoveFailures:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[5];
  id v16;
  __int128 *p_buf;
  uint8_t v18[4];
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  if (qword_1002A4480 != -1)
    dispatch_once(&qword_1002A4480, &stru_10023B3C8);
  v7 = qword_1002A4488;
  if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removing all saved failures for %{public}@ following opt-in", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_100013B80;
  v23 = sub_100013B90;
  v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100016714;
  v15[3] = &unk_10023B0A8;
  v15[4] = self;
  p_buf = &buf;
  v8 = v6;
  v16 = v8;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  v9 = *((_QWORD *)&buf + 1);
  if (a4)
  {
    v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = *((_QWORD *)&buf + 1);
    }
  }
  v11 = *(_QWORD *)(v9 + 40);
  if (v11)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B3E8);
    v12 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to remove failures after opt-in: %@", v18, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v11 == 0;
}

- (BOOL)onQueueSetCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t *v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;

  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  dispatch_assert_queue_V2(v12);

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_100013B80;
  v40 = sub_100013B90;
  v41 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100016C84;
  v31[3] = &unk_10023B430;
  v31[4] = self;
  v34 = &v36;
  v13 = v10;
  v32 = v13;
  v14 = v11;
  v33 = v14;
  v35 = a3;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v31);
  v15 = v37;
  if (a6)
  {
    v16 = (void *)v37[5];
    if (v16)
    {
      *a6 = objc_retainAutorelease(v16);
      v15 = v37;
    }
  }
  v17 = v15[5];
  if (v17)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B450);
    v18 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v19 = v37[5];
      *(_DWORD *)buf = 138412290;
      v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to update opt-in state: %@", buf, 0xCu);
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v13;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore verifierResultForPeer:application:](self, "verifierResultForPeer:application:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), v14, (_QWORD)v27));
          if (v25)
            objc_msgSend(v20, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
      }
      while (v22);
    }

    -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v20);
    -[TransparencyManagedDataStore disableCacheHitsForUris:application:error:](self, "disableCacheHitsForUris:application:error:", v21, v14, 0);
    -[TransparencyManagedDataStore deleteCompletedSingleQueryForUris:application:error:](self, "deleteCompletedSingleQueryForUris:application:error:", v21, v14, 0);

  }
  _Block_object_dispose(&v36, 8);

  return v17 == 0;
}

- (id)createMapHead
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTTreeHead"), v2));

  return v3;
}

- (id)createMapHead:(id)a3 application:(id)a4 logBeginTime:(unint64_t)a5 logHeadHash:(id)a6 logType:(int64_t)a7 revision:(unint64_t)a8 populating:(BOOL)a9 gossip:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;

  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createTreeHead](self, "createTreeHead"));
  objc_msgSend(v19, "setSth:", v18);

  objc_msgSend(v19, "setIsMapHead:", 1);
  objc_msgSend(v19, "setApplication:", v17);

  objc_msgSend(v19, "setUnsigned:value:", "logBeginTime", a5);
  objc_msgSend(v19, "setLogHeadHash:", v16);

  objc_msgSend(v19, "setLogType:", a7);
  objc_msgSend(v19, "setUnsigned:value:", "revision", a8);
  objc_msgSend(v19, "setPopulating:", a9);
  objc_msgSend(v19, "setGossip:", a10);
  objc_msgSend(v19, "setReceiptTime:", CFAbsoluteTimeGetCurrent());
  objc_msgSend(v19, "setInclusionVerified:", 2);
  objc_msgSend(v19, "setConsistencyVerified:", 1);
  return v19;
}

- (BOOL)fetchBooleanPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10010E094;
  v27 = sub_10010E0A4;
  v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010E0AC;
  v17[3] = &unk_100245BF0;
  v17[4] = self;
  v20 = &v23;
  v12 = v10;
  v18 = v12;
  v22 = a4;
  v13 = v11;
  v19 = v13;
  v21 = &v29;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a6)
  {
    v14 = (void *)v24[5];
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (id)fetchNumericPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10010E094;
  v33 = sub_10010E0A4;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10010E094;
  v27 = sub_10010E0A4;
  v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010E860;
  v17[3] = &unk_100245BF0;
  v17[4] = self;
  v20 = &v23;
  v12 = v10;
  v18 = v12;
  v22 = a4;
  v13 = v11;
  v19 = v13;
  v21 = &v29;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a6)
  {
    v14 = (void *)v24[5];
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
  v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)isMapStillPopulating:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  return -[TransparencyManagedDataStore fetchBooleanPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:](self, "fetchBooleanPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:", a3, a4, CFSTR("populating"), a5);
}

- (unint64_t)newestMapRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  id v12;

  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore fetchNumericPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:](self, "fetchNumericPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:", a3, a4, CFSTR("revision"), &v12));
  v7 = v12;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = objc_msgSend(v6, "unsignedLongLongValue");
  }
  else
  {
    v10 = 0;
    if (a5 && v7)
    {
      v10 = 0;
      *a5 = objc_retainAutorelease(v7);
    }
  }

  return (unint64_t)v10;
}

- (BOOL)performCheckWithNewestMap:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10010E094;
  v31 = sub_10010E0A4;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010F05C;
  v17[3] = &unk_100245CB8;
  v17[4] = self;
  v20 = &v27;
  v12 = v10;
  v21 = &v23;
  v22 = a4;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a5)
  {
    v14 = (void *)v28[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)garbageCollectSMHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanRevision:(unint64_t)a5 olderThanDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  unint64_t v20;

  v12 = a3;
  v13 = a6;
  if (qword_1002A74A0 != -1)
    dispatch_once(&qword_1002A74A0, &stru_100245CD8);
  v14 = qword_1002A74A8;
  if (os_log_type_enabled((os_log_t)qword_1002A74A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "garbage collecting map heads earlier than revision %llu", buf, 0xCu);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)"), v12, a5, v13, a4, a4, 2, 2, 2, a5));
  v18 = 0;
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTTreeHead"), v15, &v18);
  v16 = v18;
  v17 = v16;
  if (a7 && v16)
    *a7 = objc_retainAutorelease(v16);

}

- (BOOL)shouldGarbageCollectSMH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanRevision:(unint64_t)a6 olderThanDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (objc_msgSend(v11, "isMapHead"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)"), v12, a6, v13, a5, a5, 2, 2, 2, a6));
    v15 = objc_msgSend(v14, "evaluateWithObject:", v11);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)onMocSetMapHead:(id)a3 signatureResult:(unint64_t)a4 signatureError:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  objc_msgSend(v13, "setUnsigned:value:", "signatureVerified", a4);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    objc_msgSend(v9, "setErrorDomain:", v10);

    objc_msgSend(v9, "setSth:", v13);
    objc_msgSend(v9, "setVerificationType:", 0);

  }
  if (a4 == 1 && objc_msgSend(v13, "inclusionVerified") == (id)1 && objc_msgSend(v13, "mmdVerified") == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "application"));
    objc_msgSend(v11, "mapHeadUpdated:populating:", v12, objc_msgSend(v13, "populating"));

  }
}

- (void)onMocSetMapHead:(id)a3 mmdResult:(unint64_t)a4 mmdError:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  objc_msgSend(v14, "setUnsigned:value:", "mmdVerified", a4);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    objc_msgSend(v9, "setErrorDomain:", v10);

    objc_msgSend(v9, "setSth:", v14);
    objc_msgSend(v9, "setVerificationType:", 3);

  }
  if (objc_msgSend(v14, "signatureVerified") == (id)1)
  {
    v11 = objc_msgSend(v14, "inclusionVerified");
    if (a4 == 1 && v11 == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
      objc_msgSend(v12, "mapHeadUpdated:populating:", v13, objc_msgSend(v14, "populating"));

    }
  }

}

- (void)onMocSetMapHead:(id)a3 inclusionResult:(unint64_t)a4 inclusionError:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  objc_msgSend(v14, "setUnsigned:value:", "inclusionVerified", a4);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    objc_msgSend(v9, "setErrorDomain:", v10);

    objc_msgSend(v9, "setSth:", v14);
    objc_msgSend(v9, "setVerificationType:", 1);

  }
  v11 = objc_msgSend(v14, "signatureVerified");
  if (a4 == 1 && v11 == (id)1 && objc_msgSend(v14, "mmdVerified") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
    objc_msgSend(v12, "mapHeadUpdated:populating:", v13, objc_msgSend(v14, "populating"));

  }
}

- (void)createSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10011B9D8;
  v30 = sub_10011B9E8;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10011B9D8;
  v24 = sub_10011B9E8;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011B9F0;
  v15[3] = &unk_10023F050;
  v18 = &v26;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v19 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a5)
  {
    v12 = v21[5];
    if (v12)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:", kTransparencyErrorDatabase, -129, 1, v12, CFSTR("couldn't create self state")));
  }
  v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)fetchSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10011B9D8;
  v30 = sub_10011B9E8;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10011B9D8;
  v24 = sub_10011B9E8;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011BC7C;
  v15[3] = &unk_100246170;
  v15[4] = self;
  v18 = &v20;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a5)
  {
    v12 = v21[5];
    if (v12)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:", kTransparencyErrorDatabase, -128, 1, v12, CFSTR("couldn't fetch self state")));
  }
  v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)initSelfState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore fetchSelfValidationState:uri:error:](self, "fetchSelfValidationState:uri:error:", v8, v9, &v15));
  v11 = v15;
  if (!v10)
  {
    v14 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSelfValidationState:uri:error:](self, "createSelfValidationState:uri:error:", v8, v9, &v14));
    v12 = v14;

    v11 = v12;
  }
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

  return v10 != 0;
}

- (BOOL)performBlockWithSelfState:(id)a3 uri:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10011B9D8;
  v33 = sub_10011B9E8;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10011C0BC;
  v19[3] = &unk_100246198;
  v19[4] = self;
  v13 = v10;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  v23 = &v29;
  v24 = &v25;
  v15 = v12;
  v22 = v15;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    v16 = (void *)v30[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (BOOL)createFollowupTicket:(id)a3 uri:(id)a4 startTime:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v15[4];
  id v16;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011C2DC;
  v15[3] = &unk_1002461C0;
  v16 = a5;
  v10 = v16;
  v11 = a4;
  v12 = a3;
  v13 = objc_retainBlock(v15);
  LOBYTE(a6) = -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:](self, "performBlockWithSelfState:uri:error:block:", v12, v11, a6, v13);

  return (char)a6;
}

- (unint64_t)checkFollowupTicket:(id)a3 uri:(id)a4 checkTime:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  unsigned int v17;
  id v18;
  void *v19;
  unint64_t v20;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10011C4AC;
  v23[3] = &unk_1002461E8;
  v13 = v10;
  v24 = v13;
  v14 = v11;
  v25 = v14;
  v15 = v12;
  v26 = v15;
  v16 = objc_retainBlock(v23);
  v22 = 0;
  v17 = -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:](self, "performBlockWithSelfState:uri:error:block:", v13, v14, &v22, v16);
  v18 = v22;
  v19 = v18;
  if (v18)
  {
    v20 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v18);
  }
  else if (v17)
  {
    v20 = 2;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (BOOL)clearFollowupTicket:(id)a3 uri:(id)a4 error:(id *)a5
{
  return -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:](self, "performBlockWithSelfState:uri:error:block:", a3, a4, a5, &stru_100246228);
}

- (id)initializeServerRPC:(id)a3 application:(int)a4 backgroundOpId:(id)a5 request:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "setState:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v9, "setRequestTime:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v9, "setRpcId:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v14));
  objc_msgSend(v9, "setApplication:", v15);

  objc_msgSend(v9, "setRequest:", v10);
  objc_msgSend(v9, "setBackgroundOpId:", v11);

  return v9;
}

- (id)createBatchQuery
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("RPCBatchQuery"), v2));

  objc_msgSend(v3, "setRpcType:", 1);
  return v3;
}

- (id)createSingleQuery
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("RPCSingleQuery"), v2));

  objc_msgSend(v3, "setRpcType:", 0);
  return v3;
}

- (id)createBatchQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createBatchQuery](self, "createBatchQuery"));
  v11 = objc_msgSend(v9, "application");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
  v13 = -[TransparencyManagedDataStore initializeServerRPC:application:backgroundOpId:request:](self, "initializeServerRPC:application:backgroundOpId:request:", v10, v11, v8, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uriArray"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v14));
  objc_msgSend(v10, "setUris:", v15);

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rpcId"));
  else
    v16 = 0;
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);

  return v16;
}

- (id)createBatchQuery:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore createBatchQuery:backgroundOpId:error:](self, "createBatchQuery:backgroundOpId:error:", a3, 0, a4);
}

- (id)createSingleQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSingleQuery](self, "createSingleQuery"));
  v11 = objc_msgSend(v9, "application");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
  v13 = -[TransparencyManagedDataStore initializeServerRPC:application:backgroundOpId:request:](self, "initializeServerRPC:application:backgroundOpId:request:", v10, v11, v8, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uri"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v14));
  objc_msgSend(v10, "setUri:", v15);

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rpcId"));
  else
    v16 = 0;
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);

  return v16;
}

- (id)createSingleQuery:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore createSingleQuery:backgroundOpId:error:](self, "createSingleQuery:backgroundOpId:error:", a3, 0, a4);
}

- (BOOL)deleteServerRpcById:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  TransparencyManagedDataStore *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100132C00;
  v22 = sub_100132C10;
  v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100132C18;
  v13[3] = &unk_100246F28;
  v14 = self;
  v6 = a3;
  v15 = v6;
  v16 = &v18;
  v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  if (*((_BYTE *)v25 + 24))
  {
    v7 = 1;
  }
  else
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("ServerRPC"), 1, -325, v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100132CF0;
    v10[3] = &unk_10023D540;
    v11 = v6;
    v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);
    if (a4)
    {
      v8 = (void *)v19[5];
      if (v8)
        *a4 = objc_retainAutorelease(v8);
    }

    v7 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (id)fetchServerRpcById:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("ServerRPC")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("rpcId = %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && objc_msgSend(v10, "count"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  else
    v11 = 0;

  return v11;
}

- (id)fetchLatestSingleQueryByUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("RPCSingleQuery")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application = %@ && uri = %@"), v8, v9));

  objc_msgSend(v10, "setPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("requestTime"), 0));
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v10, "setSortDescriptors:", v13);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeFetchRequest:error:", v10, a5));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);
  if (v15 && objc_msgSend(v15, "count"))
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
  else
    v16 = 0;

  return v16;
}

- (BOOL)performAndWaitForRpcId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100132C00;
  v24 = sub_100132C10;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100133214;
  v15[3] = &unk_100247288;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v18 = &v20;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)failRpcId:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id *v10;
  uint64_t *v11;
  void *v12;
  BOOL v13;
  id v15;
  _QWORD v16[4];
  id v17;
  TransparencyManagedDataStore *v18;
  uint64_t *v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100132C00;
  v25 = sub_100132C10;
  v26 = 0;
  obj = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100133570;
  v16[3] = &unk_1002472D0;
  v9 = a4;
  v17 = v9;
  v18 = self;
  v19 = &v21;
  -[TransparencyManagedDataStore performAndWaitForRpcId:error:block:](self, "performAndWaitForRpcId:error:block:", v8, &obj, v16);
  objc_storeStrong(&v26, obj);
  v10 = (id *)(v22 + 5);
  v15 = (id)v22[5];
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", &v15);
  objc_storeStrong(v10, v15);
  v11 = v22;
  if (a5)
  {
    v12 = (void *)v22[5];
    if (v12)
    {
      *a5 = objc_retainAutorelease(v12);
      v11 = v22;
    }
  }
  v13 = v11[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)setResponseForRpcId:(id)a3 response:(id)a4 responseStatus:(id)a5 usedReversePush:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  uint64_t *v22;
  void *v23;
  BOOL v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  TransparencyManagedDataStore *v31;
  uint64_t *v32;
  BOOL v33;
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100132C00;
  v39 = sub_100132C10;
  v40 = 0;
  obj = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001338BC;
  v27[3] = &unk_100247338;
  v18 = v15;
  v28 = v18;
  v19 = v16;
  v29 = v19;
  v33 = a6;
  v20 = v17;
  v30 = v20;
  v31 = self;
  v32 = &v35;
  -[TransparencyManagedDataStore performAndWaitForRpcId:error:block:](self, "performAndWaitForRpcId:error:block:", v14, &obj, v27);
  objc_storeStrong(&v40, obj);
  v21 = (id *)(v36 + 5);
  v26 = (id)v36[5];
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", &v26);
  objc_storeStrong(v21, v26);
  v22 = v36;
  if (a8)
  {
    v23 = (void *)v36[5];
    if (v23)
    {
      *a8 = objc_retainAutorelease(v23);
      v22 = v36;
    }
  }
  v24 = v22[5] == 0;

  _Block_object_dispose(&v35, 8);
  return v24;
}

- (id)getLatestSuccessfulSingleQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  TransparencyManagedDataStore *v23;
  uint64_t *v24;
  id *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100132C00;
  v30 = sub_100132C10;
  v31 = 0;
  if (qword_1002A76A8 != -1)
    dispatch_once(&qword_1002A76A8, &stru_100247358);
  v13 = qword_1002A76B0;
  if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558530;
    v33 = 1752392040;
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "getting successful ServerRPC for %{mask.hash}@ younger than %@", buf, 0x20u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100133DF0;
  v19[3] = &unk_100247380;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = self;
  v24 = &v26;
  v25 = a6;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (id)getLatestSuccessfulBatchQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  TransparencyManagedDataStore *v21;
  id v22;
  uint64_t *v23;
  id *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100132C00;
  v29 = sub_100132C10;
  v30 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100134100;
  v18[3] = &unk_100247380;
  v13 = v11;
  v19 = v13;
  v14 = v12;
  v20 = v14;
  v21 = self;
  v24 = a6;
  v15 = v10;
  v22 = v15;
  v23 = &v25;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (BOOL)hasPendingSingleQueryForUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100132C00;
  v30 = sub_100132C10;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001345C0;
  v17[3] = &unk_1002473A8;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v11 = v9;
  v19 = v11;
  v20 = &v22;
  v21 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (v27[5])
  {
    if (qword_1002A76A8 != -1)
      dispatch_once(&qword_1002A76A8, &stru_1002473C8);
    v12 = qword_1002A76B0;
    if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_ERROR))
    {
      v13 = v27[5];
      *(_DWORD *)buf = 141558530;
      v33 = 1752392040;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to count number of pending single queries for %{mask.hash}@: %@", buf, 0x20u);
    }
  }
  if (a5)
  {
    v14 = (void *)v27[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = v23[3] != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (void)garbageCollectServerRPCs:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (qword_1002A76A8 != -1)
    dispatch_once(&qword_1002A76A8, &stru_1002473E8);
  v5 = qword_1002A76B0;
  if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting pending server RPCs", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kTransparencyMaxmimumDownloadRecordLifetime));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state == %@ && requestTime < %@"), &off_10025BF50, v6));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCSingleQuery"), v7, a3);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCBatchQuery"), v7, a3);
  if (qword_1002A76A8 != -1)
    dispatch_once(&qword_1002A76A8, &stru_100247408);
  v8 = qword_1002A76B0;
  if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Garbage collecting completed server RPCs", v11, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumCompletedRequestLifetime));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state != %@ && responseTime < %@"), &off_10025BF50, v9));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCSingleQuery"), v10, a3);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCBatchQuery"), v10, a3);

}

- (BOOL)deleteServerRPCs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  uint8_t buf[16];

  v6 = a3;
  if (qword_1002A76A8 != -1)
    dispatch_once(&qword_1002A76A8, &stru_100247428);
  v7 = qword_1002A76B0;
  if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deleting cached server RPCs", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), v6));
  v9 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("ServerRPC"), v8, a4);

  return v9;
}

- (BOOL)deleteCompletedSingleQueryForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  if (qword_1002A76A8 != -1)
    dispatch_once(&qword_1002A76A8, &stru_100247448);
  v10 = (void *)qword_1002A76B0;
  if (os_log_type_enabled((os_log_t)qword_1002A76B0, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 141558274;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting cached server RPCs for %{mask.hash}@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uri IN %@ && application == %@ && state != %@"), v8, v9, &off_10025BF50));
  v14 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("RPCSingleQuery"), v13, a5);

  return v14;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 accountKey:(id)a5 idsResponseTime:(id)a6 serverLoggableDatas:(id)a7 optedIn:(unint64_t)a8 type:(unint64_t)a9 syncedLoggableDatas:(id)a10 verificationId:(id)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v24 = a11;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1001407F0;
  v57 = sub_100140800;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1001407F0;
  v51 = sub_100140800;
  v52 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100140808;
  v35[3] = &unk_1002479A8;
  v35[4] = self;
  v25 = v18;
  v36 = v25;
  v26 = v19;
  v37 = v26;
  v27 = v20;
  v38 = v27;
  v45 = a8;
  v28 = v21;
  v39 = v28;
  v29 = v22;
  v40 = v29;
  v46 = a9;
  v30 = v23;
  v41 = v30;
  v31 = v24;
  v42 = v31;
  v43 = &v47;
  v44 = &v53;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v35);
  if (a12)
  {
    v32 = (void *)v48[5];
    if (v32)
      *a12 = objc_retainAutorelease(v32);
  }
  v33 = (id)v54[5];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v33;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 type:(unint64_t)a6 syncedLoggableDatas:(id)a7 verificationId:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsResponseTime"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serverLoggableDatas"));
  v21 = objc_msgSend(v15, "optedIn");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createIDSKTVerification:application:accountKey:idsResponseTime:serverLoggableDatas:optedIn:type:syncedLoggableDatas:verificationId:error:](self, "createIDSKTVerification:application:accountKey:idsResponseTime:serverLoggableDatas:optedIn:type:syncedLoggableDatas:verificationId:error:", v17, v16, v18, v19, v20, v21, a6, v14, v13, a9));
  return v22;
}

- (id)createPeerIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 error:(id *)a6
{
  return -[TransparencyManagedDataStore createIDSKTVerification:application:verificationInfo:type:syncedLoggableDatas:verificationId:error:](self, "createIDSKTVerification:application:verificationInfo:type:syncedLoggableDatas:verificationId:error:", a3, a4, a5, 0, 0, 0, a6);
}

- (id)onMocFetchVerificationForVerificationId:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequestID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestId == %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", &off_10025C6E8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsKTVerification"));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)performAndWaitForVerificationId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1001407F0;
  v24 = sub_100140800;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014109C;
  v15[3] = &unk_100247288;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v18 = &v20;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)resetVerificationsToPending:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[4];
  TransparencyManagedDataStore *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1001407F0;
  v21 = sub_100140800;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100141328;
  v13[3] = &unk_10023B0A8;
  v14 = self;
  v16 = &v17;
  v6 = a3;
  v15 = v6;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  v7 = v18;
  if (a4)
  {
    v8 = (void *)v18[5];
    if (v8)
    {
      *a4 = objc_retainAutorelease(v8);
      v7 = v18;
    }
  }
  if (v7[5])
  {
    if (qword_1002A7740 != -1)
      dispatch_once(&qword_1002A7740, &stru_1002479E8);
    v9 = qword_1002A7748;
    if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_ERROR))
    {
      v10 = v18[5];
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to reset peer verifications to pending: %@", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    v11 = -[TransparencyManagedDataStore resetPeersToPending:error:](self, "resetPeersToPending:error:", v6, a4);
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)performForPendingVerfications:(id)a3 uri:(id)a4 responseOlderThan:(id)a5 error:(id *)a6 batchSize:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  uint64_t v46;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1001407F0;
  v39 = sub_100140800;
  v40 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001418D8;
  v27[3] = &unk_100247A10;
  v27[4] = self;
  v32 = &v35;
  v18 = v15;
  v28 = v18;
  v19 = v14;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  v34 = a7;
  v21 = v17;
  v31 = v21;
  v33 = &v41;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v27);
  if (a6)
  {
    v22 = (void *)v36[5];
    if (v22)
      *a6 = objc_retainAutorelease(v22);
  }
  if (*((_BYTE *)v42 + 24))
  {
    v23 = 1;
  }
  else
  {
    if (qword_1002A7740 != -1)
      dispatch_once(&qword_1002A7740, &stru_100247A30);
    v24 = qword_1002A7748;
    if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_ERROR))
    {
      v25 = v36[5];
      *(_DWORD *)buf = 138412290;
      v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to perform block for pending verifications: %@", buf, 0xCu);
    }
    v23 = *((_BYTE *)v42 + 24) != 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v23;
}

- (id)pendingVerificationURIs:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  TransparencyManagedDataStore *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1001407F0;
  v27 = sub_100140800;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1001407F0;
  v21 = sub_100140800;
  v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100141BC8;
  v11[3] = &unk_100247A58;
  v12 = self;
  v14 = &v17;
  v7 = a3;
  v15 = &v23;
  v16 = a4;
  v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    v8 = (void *)v18[5];
    if (v8)
      *a5 = objc_retainAutorelease(v8);
  }
  v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)peerVerificationIdForUri:(id)a3 application:(id)a4 verificationInfo:(id)a5 newerThan:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KTLoggableDataArray *v16;
  void *v17;
  KTLoggableDataArray *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  KTLoggableDataArray *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  TransparencyManagedDataStore *v32;
  KTLoggableDataArray *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_1001407F0;
  v46 = sub_100140800;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1001407F0;
  v40 = sub_100140800;
  v41 = 0;
  v16 = [KTLoggableDataArray alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serverLoggableDatas"));
  v18 = -[KTLoggableDataArray initWithLoggableDatas:](v16, "initWithLoggableDatas:", v17);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100142094;
  v27[3] = &unk_100247A80;
  v19 = v13;
  v28 = v19;
  v20 = v12;
  v29 = v20;
  v21 = v15;
  v30 = v21;
  v22 = v14;
  v31 = v22;
  v32 = self;
  v34 = &v36;
  v23 = v18;
  v33 = v23;
  v35 = &v42;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v27);
  if (a7)
  {
    v24 = (void *)v37[5];
    if (v24)
      *a7 = objc_retainAutorelease(v24);
  }
  v25 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)fetchOrCreateVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 fetchNow:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v8)
  {
    +[TransparencySettings defaultQueryCacheTimeout](TransparencySettings, "defaultQueryCacheTimeout");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v18));
    v20 = objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerVerificationIdForUri:application:verificationInfo:newerThan:error:](self, "peerVerificationIdForUri:application:verificationInfo:newerThan:error:", v12, v13, v14, v19, a7));
    if (v20)
    {
      v21 = (void *)v20;
      if (qword_1002A7740 != -1)
        dispatch_once(&qword_1002A7740, &stru_100247AE0);
      v22 = qword_1002A7748;
      if (!os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v25 = 138543874;
      v26 = v21;
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v12;
      v23 = "re-using verificationId %{public}@ for %{mask.hash}@";
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createPeerIDSKTVerification:application:verificationInfo:error:](self, "createPeerIDSKTVerification:application:verificationInfo:error:", v12, v13, v14, a7));
      if (qword_1002A7740 != -1)
        dispatch_once(&qword_1002A7740, &stru_100247AC0);
      v22 = qword_1002A7748;
      if (!os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v25 = 138543874;
      v26 = v21;
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v12;
      v23 = "created verificationId %{public}@ for %{mask.hash}@ none cached";
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0x20u);
LABEL_17:
    v17 = v21;

    goto LABEL_18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createPeerIDSKTVerification:application:verificationInfo:error:](self, "createPeerIDSKTVerification:application:verificationInfo:error:", v12, v13, v14, a7));
  if (qword_1002A7740 != -1)
    dispatch_once(&qword_1002A7740, &stru_100247AA0);
  v16 = qword_1002A7748;
  if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138543874;
    v26 = v15;
    v27 = 2160;
    v28 = 1752392040;
    v29 = 2112;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "created verificationId %{public}@ for %{mask.hash}@ because fetchNow", (uint8_t *)&v25, 0x20u);
  }
  v17 = v15;
LABEL_18:

  return v17;
}

- (void)garbageCollectVerifications:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  if (qword_1002A7740 != -1)
    dispatch_once(&qword_1002A7740, &stru_100247B00);
  v5 = qword_1002A7748;
  if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting IDSKTVerifications", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationTime < %@"), v6));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("IDSKTVerification"), v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil")));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("IDSKTVerification"), v8, a3);
}

- (void)deleteNonRecentVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil"), a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("IDSKTVerification"), v6, a4);

}

- (BOOL)disableCacheHitsForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  id v23;
  _BYTE *v24;
  uint8_t v25[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  if (qword_1002A7740 != -1)
    dispatch_once(&qword_1002A7740, &stru_100247B20);
  v10 = (void *)qword_1002A7748;
  if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 141558274;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Disabling future cache hits for %{mask.hash}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = sub_1001407F0;
  v33 = sub_100140800;
  v34 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100142B5C;
  v21[3] = &unk_10023F368;
  v21[4] = self;
  v24 = buf;
  v13 = v8;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v21);
  v15 = *(_QWORD *)&buf[8];
  if (a5)
  {
    v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v16)
    {
      *a5 = objc_retainAutorelease(v16);
      v15 = *(_QWORD *)&buf[8];
    }
  }
  v17 = *(_QWORD *)(v15 + 40);
  if (v17)
  {
    if (qword_1002A7740 != -1)
      dispatch_once(&qword_1002A7740, &stru_100247B60);
    v18 = qword_1002A7748;
    if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v25 = 141558530;
      v26 = 1752392040;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to disable cache hits for %{mask.hash}@: %@", v25, 0x20u);
    }
  }

  _Block_object_dispose(buf, 8);
  return v17 == 0;
}

- (unint64_t)countOutstandingVerificationsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("verificationResult == %d && application == %@"), 2, a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("IDSKTVerification"), v6, a4);

  return v7;
}

- (unint64_t)countTotalVerificationsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("IDSKTVerification"), v6, a4);

  return v7;
}

- (BOOL)onMocLogVerificationMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v23 = 0;
  v7 = -[TransparencyManagedDataStore countOutstandingVerificationsForApplication:error:](self, "countOutstandingVerificationsForApplication:error:", v6, &v23);
  v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002A7740 != -1)
      dispatch_once(&qword_1002A7740, &stru_100247B80);
    v9 = qword_1002A7748;
    if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding IDSKTVerifications for %@: %@", buf, 0x16u);
    }
    v10 = 0;
    if (!a4 || !v8)
    {
      v16 = v8;
      goto LABEL_20;
    }
    v11 = v8;
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("PendVer"), v6));
  objc_msgSend(v12, "logMetric:withName:", v13, v14);

  v22 = v8;
  v15 = -[TransparencyManagedDataStore countTotalVerificationsForApplication:error:](self, "countTotalVerificationsForApplication:error:", v6, &v22);
  v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("TotVer"), v6));
    objc_msgSend(v18, "logMetric:withName:", v19, v20);

    v10 = 1;
    goto LABEL_20;
  }
  if (qword_1002A7740 != -1)
    dispatch_once(&qword_1002A7740, &stru_100247BA0);
  v17 = qword_1002A7748;
  if (os_log_type_enabled((os_log_t)qword_1002A7748, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total IDSKTVerifications for %@: %@", buf, 0x16u);
  }
  v10 = 0;
  if (a4 && v16)
  {
    v11 = v16;
LABEL_17:
    v16 = objc_retainAutorelease(v11);
    v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (id)createRecordFromLoggableData:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTDeviceRecord"), v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
    objc_msgSend(v9, "setDeviceId:", v10);

    v14 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore serializeLoggableDatas:](TransparencyManagedDataStore, "serializeLoggableDatas:", v11));
    objc_msgSend(v9, "setLoggableData:", v12);

    objc_msgSend(v9, "setApplication:", v7);
  }

  return v9;
}

- (BOOL)performAndWaitForDeviceId:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  id v21;
  TransparencyManagedDataStore *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1001434E0;
  v30 = sub_1001434F0;
  v31 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001434F8;
  v19[3] = &unk_10023B080;
  v13 = v10;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  v22 = self;
  v24 = &v26;
  v15 = v12;
  v23 = v15;
  v25 = &v32;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    v16 = (void *)v27[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (id)createRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTRequest"), v2));

  return v3;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 type:(unint64_t)a7 error:(id *)a8
{
  return -[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:](self, "createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:", a3, a4, a5, a6, 0, 0, 0, a7, 0, a8);
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 error:(id *)a11
{
  return -[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:](self, "createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11);
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 clientId:(id)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v30;

  v18 = a11;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v30 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:idsResponseTime:queryRequest:queryResponse:responseDate:type:clientId:error:](self, "createRequestWithUri:application:accountKey:serverData:syncedData:idsResponseTime:queryRequest:queryResponse:responseDate:type:clientId:error:", v25, v24, v23, v22, v21, v26, v20, v19, v27, a10, v18, a12));

  return v30;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 idsResponseTime:(id)a8 queryRequest:(id)a9 queryResponse:(id)a10 responseDate:(id)a11 type:(unint64_t)a12 clientId:(id)a13 error:(id *)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v38;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a13;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = sub_100143DF4;
  v68 = sub_100143E04;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_100143DF4;
  v62 = sub_100143E04;
  v63 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100143E0C;
  v44[3] = &unk_100247C28;
  v44[4] = self;
  v55 = &v58;
  v26 = v19;
  v45 = v26;
  v38 = v20;
  v46 = v38;
  v27 = v21;
  v47 = v27;
  v28 = v25;
  v48 = v28;
  v29 = v22;
  v49 = v29;
  v30 = v23;
  v50 = v30;
  v31 = v24;
  v51 = v31;
  v32 = v40;
  v52 = v32;
  v33 = v41;
  v53 = v33;
  v34 = v42;
  v54 = v34;
  v56 = &v64;
  v57 = a12;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v44);
  v43 = v26;
  if (a14)
  {
    v35 = (void *)v59[5];
    if (v35)
      *a14 = objc_retainAutorelease(v35);
  }
  v36 = (id)v65[5];

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v36;
}

- (id)requests:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequest")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTRequest"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)requestCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequest")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)fetchRequestForUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequestID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestId == %@"), v6));
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", &off_10025C718);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  if (objc_msgSend(v10, "count") == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "request"));

  }
  else
  {
    v13 = objc_msgSend(v10, "count");
    if (a4 && (unint64_t)v13 >= 2)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDatabase, -57, *a4, CFSTR("Fetch returned too many requests for requestId = %@"), v6));
      *a4 = v14;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTRequestID"), 0, -57, v14);
      if (qword_1002A7760 != -1)
        dispatch_once(&qword_1002A7760, &stru_100247C48);
      v15 = qword_1002A7768;
      if (os_log_type_enabled((os_log_t)qword_1002A7768, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Fetch returned too many requests for requestId = %@", buf, 0xCu);
      }
    }
    v16 = objc_msgSend(v10, "count");
    v12 = 0;
    if (a4 && !v16)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDatabase, -58, *a4, CFSTR("Fetch returned no requests for requestId = %@"), v6));
      *a4 = v17;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:](self, "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:", CFSTR("KTRequestID"), 0, 0, -58, v17);
      if (qword_1002A7760 != -1)
        dispatch_once(&qword_1002A7760, &stru_100247C68);
      v18 = qword_1002A7768;
      if (os_log_type_enabled((os_log_t)qword_1002A7768, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Fetch returned no requests for requestId = %@", buf, 0xCu);
      }
      v12 = 0;
    }
  }

  return v12;
}

- (id)fetchRequestsForURI:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequest")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uri == %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  return v10;
}

- (id)fetchRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 youngerThan:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequest")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uri == %@ && application == %@ && accountKey == %@ && serverLoggableDatas == %@ && requestTime > %@"), v18, v17, v16, v15, v14));

  objc_msgSend(v19, "setPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("requestTime"), 0));
  v28 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  objc_msgSend(v19, "setSortDescriptors:", v22);

  objc_msgSend(v19, "setFetchLimit:", 1);
  objc_msgSend(v19, "setPropertiesToFetch:", &off_10025C730);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "executeFetchRequest:error:", v19, a8));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a8);
  if (v24 && objc_msgSend(v24, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "requestId"));

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)performForRequestsWithPendingResponses:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("verificationResult == %d && application == %@"), 2, a3));
  -[TransparencyManagedDataStore performOnRequestsForPredicate:enforceMax:error:block:](self, "performOnRequestsForPredicate:enforceMax:error:block:", v9, 1, a4, v8);

}

- (id)fetchCompletedRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v18;

  v8 = a3;
  v9 = a4;
  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequest")));
    objc_msgSend(v10, "setReturnsDistinctResults:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestTime < %@ && (verificationResult == %d || verificationResult == %d) && application == %@"), v9, 1, 0, v8));
    objc_msgSend(v10, "setPredicate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v10, a5));

  }
  else
  {
    v13 = 0;
  }
  if (qword_1002A7760 != -1)
    dispatch_once(&qword_1002A7760, &stru_100247C88);
  v14 = qword_1002A7768;
  if (os_log_type_enabled((os_log_t)qword_1002A7768, OS_LOG_TYPE_ERROR))
  {
    if (a5)
      v15 = *a5;
    else
      v15 = 0;
    *(_DWORD *)buf = 138412290;
    v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "unable to read completed requests: %@", buf, 0xCu);
  }
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);

  return v13;
}

- (BOOL)populateExistingRequestsToLookupTable:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestIDCache.@count == 0")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100144C28;
  v12[3] = &unk_100247CB0;
  v12[4] = self;
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTRequest"), v5, 0, a3, v12);
  if (a3 && *a3)
  {
    v6 = *a3;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTRequest"), 1, -200, v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100144D58;
    v10[3] = &unk_10023A390;
    v11 = v6;
    v7 = v6;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)garbageCollectRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestTime < %@ && (verificationResult == %d || verificationResult == %d || verificationResult == %d) && application == %@"), a4, 1, 0, 3, v8));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTRequest"), v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestTime < %@ && application == %@"), v10, v8));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTRequest"), v11, a5);
}

- (BOOL)resetRequestsForApplication:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore resetPendingRequests:error:](self, "resetPendingRequests:error:", a3, a4);
}

- (BOOL)resetRequestsForTLTReset:(id *)a3
{
  return -[TransparencyManagedDataStore resetPendingRequests:](self, "resetPendingRequests:", a3);
}

- (BOOL)resetPendingRequests:(id)a3 error:(id *)a4
{
  id v6;
  NSPredicate *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  _QWORD v12[5];

  v6 = a3;
  if (v6)
    v7 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ AND verificationResult == %d"), v6, 2);
  else
    v7 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("verificationResult == %d"), 2, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100145038;
  v12[3] = &unk_100247CB0;
  v12[4] = self;
  -[TransparencyManagedDataStore performOnRequestsForPredicate:enforceMax:error:block:](self, "performOnRequestsForPredicate:enforceMax:error:block:", v8, 0, a4, v12);
  v9 = !a4 || !*a4;

  return v9;
}

- (BOOL)resetPendingRequests:(id *)a3
{
  return -[TransparencyManagedDataStore resetPendingRequests:error:](self, "resetPendingRequests:error:", 0, a3);
}

- (unint64_t)countOutstandingRequestsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("verificationResult == %d && application == %@"), 2, a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTRequest"), v6, a4);

  return v7;
}

- (unint64_t)countTotalRequestsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTRequest"), v6, a4);

  return v7;
}

- (BOOL)logRequestMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v23 = 0;
  v7 = -[TransparencyManagedDataStore countOutstandingRequestsForApplication:error:](self, "countOutstandingRequestsForApplication:error:", v6, &v23);
  v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002A7760 != -1)
      dispatch_once(&qword_1002A7760, &stru_100247CF0);
    v9 = qword_1002A7768;
    if (os_log_type_enabled((os_log_t)qword_1002A7768, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding requests for %@: %@", buf, 0x16u);
    }
    v10 = 0;
    if (!a4 || !v8)
    {
      v16 = v8;
      goto LABEL_20;
    }
    v11 = v8;
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("OutstandingRequests"), v6));
  objc_msgSend(v12, "logMetric:withName:", v13, v14);

  v22 = v8;
  v15 = -[TransparencyManagedDataStore countTotalRequestsForApplication:error:](self, "countTotalRequestsForApplication:error:", v6, &v22);
  v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("TotalRequests"), v6));
    objc_msgSend(v18, "logMetric:withName:", v19, v20);

    v10 = 1;
    goto LABEL_20;
  }
  if (qword_1002A7760 != -1)
    dispatch_once(&qword_1002A7760, &stru_100247D10);
  v17 = qword_1002A7768;
  if (os_log_type_enabled((os_log_t)qword_1002A7768, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total requests for %@: %@", buf, 0x16u);
  }
  v10 = 0;
  if (a4 && v16)
  {
    v11 = v16;
LABEL_17:
    v16 = objc_retainAutorelease(v11);
    v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (void)performOnRequestsForPredicate:(id)a3 enforceMax:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTRequest"), a3, a4, a5, a6);
}

- (BOOL)performAndWaitForRequestId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100143DF4;
  v24 = sub_100143E04;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001457C4;
  v15[3] = &unk_100247288;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v18 = &v20;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)performAndWaitForLatestSelfRequest:(id)a3 accountKey:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  TransparencyManagedDataStore *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100145940;
  v11[3] = &unk_100247D38;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);

}

- (id)createRequestFailure
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTRequestFailure"), v2));

  return v3;
}

- (id)requestFailures:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequestFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTRequestFailure"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)requestFailureCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequestFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (void)createKTRequestID:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTRequestID"), v8));

  objc_msgSend(v9, "setRequestId:", v7);
  objc_msgSend(v9, "setRequest:", v6);

}

- (void)createIDSVerificationID:(id)a3 verification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTRequestID"), v8));

  objc_msgSend(v9, "setRequestId:", v7);
  objc_msgSend(v9, "setIdsKTVerification:", v6);

}

- (id)requestIds:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTRequestID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTRequestID"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)createMutation:(id)a3 application:(id)a4 uri:(id)a5 mutationMs:(unint64_t)a6 spkiHash:(id)a7 receiptTime:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTMutation"), v19));

  if (v20)
  {
    objc_msgSend(v20, "setSmt:", v14);
    objc_msgSend(v20, "setUnsigned:value:", "mutationMs", a6);
    objc_msgSend(v20, "setReceiptTime:", v18);
    objc_msgSend(v20, "setApplication:", v15);
    objc_msgSend(v20, "setUri:", v16);
    objc_msgSend(v20, "setSpkiHash:", v17);
  }

  return v20;
}

- (id)signedMutationTimestamps:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation fetchRequest](KTMutation, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTMutation"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedMutationTimestampCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation fetchRequest](KTMutation, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (void)performForSMTsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("signatureResult == %d && mergeResult == %d && application == %@"), 2, 2, a3));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTMutation"), v9, 0, a4, v8);

}

- (unint64_t)countOutstandingSMTsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(signatureResult == %d || mergeResult == %d) && application == %@"), 2, 2, a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTMutation"), v6, a4);

  return v7;
}

- (unint64_t)countTotalSMTsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTMutation"), v6, a4);

  return v7;
}

- (BOOL)logSMTMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v23 = 0;
  v7 = -[TransparencyManagedDataStore countOutstandingSMTsForApplication:error:](self, "countOutstandingSMTsForApplication:error:", v6, &v23);
  v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002A7770 != -1)
      dispatch_once(&qword_1002A7770, &stru_100247D58);
    v9 = qword_1002A7778;
    if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding SMTs for %@: %@", buf, 0x16u);
    }
    v10 = 0;
    if (!a4 || !v8)
    {
      v16 = v8;
      goto LABEL_20;
    }
    v11 = v8;
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("OutstandingSMTs"), v6));
  objc_msgSend(v12, "logMetric:withName:", v13, v14);

  v22 = v8;
  v15 = -[TransparencyManagedDataStore countTotalSMTsForApplication:error:](self, "countTotalSMTsForApplication:error:", v6, &v22);
  v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("TotalSMTs"), v6));
    objc_msgSend(v18, "logMetric:withName:", v19, v20);

    v10 = 1;
    goto LABEL_20;
  }
  if (qword_1002A7770 != -1)
    dispatch_once(&qword_1002A7770, &stru_100247D78);
  v17 = qword_1002A7778;
  if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total SMTs for %@: %@", buf, 0x16u);
  }
  v10 = 0;
  if (a4 && v16)
  {
    v11 = v16;
LABEL_17:
    v16 = objc_retainAutorelease(v11);
    v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (void)garbageCollectSMTs:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (qword_1002A7770 != -1)
    dispatch_once(&qword_1002A7770, &stru_100247D98);
  v5 = qword_1002A7778;
  if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting SMTs", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("receiptTime < %@"), v6));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTMutation"), v7, a3);
  if (qword_1002A7770 != -1)
    dispatch_once(&qword_1002A7770, &stru_100247DB8);
  v8 = qword_1002A7778;
  if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Garbage collecting successfully verified SMTs", v11, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumCompletedRequestLifetime));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("receiptTime < %@ && signatureResult == %d && mergeResult == %d"), v9, 1, 1));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTMutation"), v10, a3);
}

- (BOOL)performForPendingSMTs:(id)a3 uri:(id)a4 error:(id *)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  uint64_t v41;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100146A64;
  v34 = sub_100146A74;
  v35 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100146A7C;
  v23[3] = &unk_100247DE0;
  v23[4] = self;
  v27 = &v30;
  v15 = v13;
  v24 = v15;
  v16 = v12;
  v25 = v16;
  v29 = a6;
  v17 = v14;
  v26 = v17;
  v28 = &v36;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v23);
  if (a5)
  {
    v18 = (void *)v31[5];
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
  if (*((_BYTE *)v37 + 24))
  {
    v19 = 1;
  }
  else
  {
    if (qword_1002A7770 != -1)
      dispatch_once(&qword_1002A7770, &stru_100247E00);
    v20 = qword_1002A7778;
    if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_ERROR))
    {
      v21 = v31[5];
      *(_DWORD *)buf = 138412290;
      v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to perform block for pending SMTs: %@", buf, 0xCu);
    }
    v19 = *((_BYTE *)v37 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (id)getPendingSmtUris:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  TransparencyManagedDataStore *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100146A64;
  v27 = sub_100146A74;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100146A64;
  v21 = sub_100146A74;
  v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100146DE8;
  v11[3] = &unk_100247A58;
  v12 = self;
  v14 = &v17;
  v7 = a3;
  v15 = &v23;
  v16 = a4;
  v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    v8 = (void *)v18[5];
    if (v8)
      *a5 = objc_retainAutorelease(v8);
  }
  v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (BOOL)deleteSMTsWithSPKINotIn:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  id v15;

  v8 = a3;
  v9 = a4;
  if (qword_1002A7770 != -1)
    dispatch_once(&qword_1002A7770, &stru_100247E20);
  v10 = qword_1002A7778;
  if (os_log_type_enabled((os_log_t)qword_1002A7778, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deleting %@ SMTs with old SPKI hashes", buf, 0xCu);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && (NOT spkiHash IN %@ || spkiHash == nil)"), v9, v8));
  v12 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTMutation"), v11, a5);

  return v12;
}

- (id)createSignedMutationTimestampsFailure
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTSMTFailure"), v2));

  return v3;
}

- (id)signedMutationTimestampsFailures:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTSMTFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTSMTFailure"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedMutationTimestampsFailureCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTSMTFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

+ (id)serializeNSError:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v9;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v9 = v3;
  v5 = v3;
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", &v9);
  v6 = v9;

  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));

  return v7;
}

+ (id)deserializeNSError:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v5, a4);

  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v6, "_enableStrictSecureDecodingMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v9, CFSTR("error")));

  return v10;
}

- (id)createFailureEvent:(id)a3 application:(id)a4 optInServer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "getAggregateOptInState:", &v19));
  v11 = v19;
  if (!v10)
  {
    if (qword_1002A7A08 != -1)
      dispatch_once(&qword_1002A7A08, &stru_10024A6E8);
    v17 = qword_1002A7A10;
    if (os_log_type_enabled((os_log_t)qword_1002A7A10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "createFailureEvent: failed getting optin state: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "state") != (id)1)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTFailureEvent"), v12));

  if (v13)
  {
    objc_msgSend(v13, "setApplication:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    objc_msgSend(v13, "setEventId:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v13, "setFailureTime:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyManagedDataStore serializeNSError:](TransparencyManagedDataStore, "serializeNSError:", v8));
    objc_msgSend(v13, "setEncodedError:", v16);

  }
LABEL_10:

  return v13;
}

- (id)fetchRecentFailureEvents:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  TransparencyManagedDataStore *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10017A9CC;
  v27 = sub_10017A9DC;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10017A9CC;
  v21 = sub_10017A9DC;
  v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017A9E4;
  v11[3] = &unk_100247A58;
  v12 = self;
  v14 = &v17;
  v7 = a3;
  v15 = &v23;
  v16 = a4;
  v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    v8 = (void *)v18[5];
    if (v8)
      *a5 = objc_retainAutorelease(v8);
  }
  v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017AE5C;
  v8[3] = &unk_10024A790;
  v9 = a3;
  v10 = a4;
  v8[4] = self;
  v6 = v9;
  v7 = v10;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);

}

- (BOOL)performAndWaitForFailedEventId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  id v16;
  TransparencyManagedDataStore *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10017A9CC;
  v25 = sub_10017A9DC;
  v26 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10017B568;
  v15[3] = &unk_100247288;
  v10 = v8;
  v16 = v10;
  v17 = self;
  v19 = &v21;
  v11 = v9;
  v18 = v11;
  v20 = &v27;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v22[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)clearAllFailureEvents:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTFailureEvent"), v6, a4);
  if (a4 && *a4)
  {
    v7 = *a4;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTFailureEvent"), 1, -171, v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10017B8D8;
    v11[3] = &unk_10023A390;
    v12 = v7;
    v8 = v7;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);

    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)clearFailureEvents:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017BA78;
  v8[3] = &unk_10024A790;
  v9 = a3;
  v10 = a4;
  v8[4] = self;
  v6 = v9;
  v7 = v10;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);

}

- (BOOL)clearSelfFailureRelatedData:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("request.uri == %@ AND application == %@ AND request.type == %lld"), v8, a3, 1));
  if (!-[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTFailureEvent"), v9, a5))
  {
    if (!a5)
      goto LABEL_19;
    if (*a5)
    {
      v10 = *a5;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTFailureEvent"), 1, -310, v10);
      if (qword_1002A7A08 != -1)
        dispatch_once(&qword_1002A7A08, &stru_10024A830);
      v11 = qword_1002A7A10;
      if (!os_log_type_enabled((os_log_t)qword_1002A7A10, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      v12 = "failed to clear self-validation failure events for uri %@: %@";
      goto LABEL_16;
    }
LABEL_18:
    LOBYTE(a5) = 0;
    goto LABEL_19;
  }
  if (!-[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTDeviceRecord"), v9, a5))
  {
    if (!a5)
      goto LABEL_19;
    if (*a5)
    {
      v10 = *a5;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTDeviceRecord"), 1, -310, v10);
      if (qword_1002A7A08 != -1)
        dispatch_once(&qword_1002A7A08, &stru_10024A850);
      v11 = qword_1002A7A10;
      if (!os_log_type_enabled((os_log_t)qword_1002A7A10, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      v12 = "failed to clear outdated device records for uri %@: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  LOBYTE(a5) = 1;
LABEL_19:

  return (char)a5;
}

- (BOOL)clearSelfValidationFollowups:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id obj;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;

  v27 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore followup](self, "followup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getPendingFollowups"));

  if (objc_msgSend(v9, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventId in %@ AND application == %@ AND request.type == %lld AND request.uri == %@"), v9, v27, 1, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTFailureEvent fetchRequest](KTFailureEvent, "fetchRequest"));
    objc_msgSend(v10, "setPredicate:", v26);
    objc_msgSend(v10, "setPropertiesToFetch:", &off_10025C7A8);
    objc_msgSend(v10, "setReturnsDistinctResults:", 1);
    objc_msgSend(v10, "setResultType:", 2);
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_10017A9CC;
    v47 = sub_10017A9DC;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = sub_10017A9CC;
    v41 = sub_10017A9DC;
    v42 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10017C4FC;
    v33[3] = &unk_10024A878;
    v35 = &v43;
    v33[4] = self;
    v11 = v10;
    v34 = v11;
    v36 = &v37;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v33);
    if (v38[5])
    {
      if (qword_1002A7A08 != -1)
        dispatch_once(&qword_1002A7A08, &stru_10024A898);
      v12 = qword_1002A7A10;
      if (os_log_type_enabled((os_log_t)qword_1002A7A10, OS_LOG_TYPE_ERROR))
      {
        v13 = v38[5];
        *(_DWORD *)buf = 138543618;
        v51 = v9;
        v52 = 2112;
        v53 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to fetch self-request eventIds: %{public}@ : %@", buf, 0x16u);
      }
      v14 = (id *)(v38 + 5);
      obj = (id)v38[5];
      +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", &obj);
      objc_storeStrong(v14, obj);
    }
    v15 = (void *)v44[5];
    if (v15 && objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend((id)v44[5], "count")));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v44[5], "reverseObjectEnumerator"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("eventId")));
            objc_msgSend(v16, "addObject:", v21);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
        }
        while (v18);
      }

    }
    else
    {
      v16 = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFollowup instance](TransparencyFollowup, "instance"));
    v23 = objc_msgSend(v22, "clearFollowups:error:", v16, a5);

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (id)createTreeHead
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTTreeHead"), v2));

  return v3;
}

- (id)createTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logHeadHash:(id)a7 logType:(int64_t)a8 revision:(unint64_t)a9 gossip:(BOOL)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  unint64_t v35;

  v13 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createTreeHead](self, "createTreeHead"));
  objc_msgSend(v19, "setSth:", v18);

  objc_msgSend(v19, "setIsMapHead:", v13);
  objc_msgSend(v19, "setApplication:", v16);
  objc_msgSend(v19, "setUnsigned:value:", "logBeginTime", a6);
  objc_msgSend(v19, "setLogHeadHash:", v17);
  objc_msgSend(v19, "setLogType:", a8);
  objc_msgSend(v19, "setUnsigned:value:", "revision", a9);
  objc_msgSend(v19, "setGossip:", a10);
  objc_msgSend(v19, "setReceiptTime:", CFAbsoluteTimeGetCurrent());
  if (a8 != 3 || v13)
    objc_msgSend(v19, "setInclusionVerified:", 2);
  if (v13)
    objc_msgSend(v19, "setConsistencyVerified:", 1);
  if (qword_1002A7A28 != -1)
    dispatch_once(&qword_1002A7A28, &stru_10024AC48);
  v20 = (void *)qword_1002A7A30;
  if (os_log_type_enabled((os_log_t)qword_1002A7A30, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
    v24 = 138413570;
    v25 = v22;
    v26 = 2112;
    v27 = v16;
    v28 = 1024;
    v29 = v13;
    v30 = 2048;
    v31 = a6;
    v32 = 2048;
    v33 = a8;
    v34 = 2048;
    v35 = a9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Add new tree head: %@[%@] %d %llu %lld %lld", (uint8_t *)&v24, 0x3Au);

  }
  return v19;
}

- (BOOL)haveTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 gossip:(BOOL)a9 error:(id *)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v25;

  v13 = a4;
  v16 = a5;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu"), v19, v17, v16, a6, a7, a8));

  objc_msgSend(v18, "setPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v25 = 0;
  v22 = objc_msgSend(v21, "countForFetchRequest:error:", v18, &v25);
  v23 = v25;

  if (a10 && v23)
    *a10 = objc_retainAutorelease(v23);
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a10);

  return v22 != 0;
}

- (id)treeHeads:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, &v10));
  v8 = v10;

  if (v8)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTTreeHead"), 0, -128, v8);
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)treeHeadsForApplication:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v13 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, &v13));
  v11 = v13;

  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);

  return v10;
}

- (unint64_t)treeHeadCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)fetchTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  _BOOL8 v13;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  void *i;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  unsigned int v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id obj;
  NSObject *log;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  int v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  int64_t v71;
  __int16 v72;
  unint64_t v73;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  v50 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %lld && logType == %lld && revision == %lld"), v18, v15, v16, a6, a7, a8));
  objc_msgSend(v17, "setPredicate:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v60 = 0;
  v51 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "executeFetchRequest:error:", v17, &v60));
  v22 = v60;

  if (objc_msgSend(v21, "count"))
  {
    v47 = v15;
    if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v48 = v21;
      obj = v21;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v57;
        v26 = &unk_1002A7000;
        v27 = &unk_1002A7000;
        v52 = *(_QWORD *)v57;
        v53 = v22;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
            if (v26[325] != -1)
              dispatch_once(&qword_1002A7A28, &stru_10024AC88);
            v30 = *((_QWORD *)v27 + 326);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              log = v30;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "logHeadHash"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_hexString"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "application"));
              v34 = v24;
              v35 = v27;
              v36 = objc_msgSend(v29, "isMapHead");
              v37 = objc_msgSend(v29, "logBeginTime");
              v38 = objc_msgSend(v29, "logType");
              v39 = objc_msgSend(v29, "revision");
              *(_DWORD *)buf = 138413570;
              v63 = v32;
              v64 = 2112;
              v65 = v33;
              v66 = 1024;
              v67 = v36;
              v27 = v35;
              v24 = v34;
              v68 = 2048;
              v69 = (unint64_t)v37;
              v70 = 2048;
              v71 = (int64_t)v38;
              v72 = 2048;
              v73 = (unint64_t)v39;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetch returned too dup head: %@[%@] %d %llu %lld %lld", buf, 0x3Au);

              v26 = (_QWORD *)&unk_1002A7000;
              v22 = v53;

              v25 = v52;
            }
          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        }
        while (v24);
      }

      v21 = v48;
    }
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a9);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
    v15 = v47;
    v41 = v50;
  }
  else
  {
    v49 = v21;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
    v43 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDatabase, -185, v22, CFSTR("Fetch returned no tree heads for hash: %@"), v42));
    v44 = v22;
    v22 = (id)v43;

    -[TransparencyManagedDataStore reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:](self, "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:", CFSTR("KTTreeHead"), 0, 0, -185, v22);
    if (qword_1002A7A28 != -1)
      dispatch_once(&qword_1002A7A28, &stru_10024AC68);
    v41 = v16;
    v45 = qword_1002A7A30;
    if (os_log_type_enabled((os_log_t)qword_1002A7A30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413570;
      v63 = v42;
      v64 = 2112;
      v65 = v16;
      v66 = 1024;
      v67 = v13;
      v68 = 2048;
      v69 = a6;
      v70 = 2048;
      v71 = a7;
      v72 = 2048;
      v73 = a8;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Fetch returned no tree heads for hash: %@[%@] %d %llu %lld %lld", buf, 0x3Au);
    }
    if (a9 && v22)
      *a9 = objc_retainAutorelease(v22);

    v40 = 0;
    v21 = v49;
  }

  return v40;
}

- (id)fetchTreeHeadsWithoutHash:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a4;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTTreeHead")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == %@ && logHeadHash != %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu"), v18, v16, v15, a6, a7, a8));

  objc_msgSend(v17, "setPredicate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "executeFetchRequest:error:", v17, a9));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a9);
  return v21;
}

- (id)latestConsistencyVerifiedTreeHeadRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TransparencyManagedDataStore *v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100180354;
  v28 = sub_100180364;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100180354;
  v22 = sub_100180364;
  v23 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10018036C;
  v12[3] = &unk_10024ACF0;
  v8 = a3;
  v16 = &v24;
  v17 = a4;
  v13 = v8;
  v14 = self;
  v15 = &v18;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);
  if (a5)
  {
    v9 = (void *)v19[5];
    if (v9)
      *a5 = objc_retainAutorelease(v9);
  }
  v10 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (id)latestConsistencyVerifiedTreeHeadSTH:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  TransparencyManagedDataStore *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100180354;
  v28 = sub_100180364;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100180354;
  v22 = sub_100180364;
  v23 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001809AC;
  v11[3] = &unk_10024AD78;
  v12 = self;
  v14 = &v18;
  v7 = a3;
  v13 = v7;
  v15 = &v24;
  v16 = a4;
  v17 = a5;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    v8 = (void *)v19[5];
    if (v8)
      *a5 = objc_retainAutorelease(v8);
  }
  v9 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

- (id)unverifiedRevisions:(id)a3 isMapHead:(BOOL)a4 inclusion:(BOOL)a5 logBeginMs:(unint64_t)a6 error:(id *)a7
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  TransparencyManagedDataStore *v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100180354;
  v32 = sub_100180364;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100180354;
  v26 = sub_100180364;
  v27 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001810BC;
  v14[3] = &unk_10024ADA0;
  v20 = a5;
  v21 = a4;
  v10 = a3;
  v18 = &v28;
  v19 = a6;
  v15 = v10;
  v16 = self;
  v17 = &v22;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v14);
  if (a7)
  {
    v11 = (void *)v23[5];
    if (v11)
      *a7 = objc_retainAutorelease(v11);
  }
  v12 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)populateMissingLogHeadHashes:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == NO && logHeadHash == nil")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100181510;
  v12[3] = &unk_100247CB0;
  v12[4] = self;
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTTreeHead"), v5, 0, a3, v12);
  if (a3 && *a3)
  {
    v6 = *a3;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTTreeHead"), 1, -194, v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10018175C;
    v10[3] = &unk_10023A390;
    v11 = v6;
    v7 = v6;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)performForPendingSTHs:(id)a3 olderThan:(id)a4 type:(unint64_t)a5 error:(id *)a6 block:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v12 = a4;
  v13 = a7;
  if (a5 > 3)
    v14 = 0;
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", *(&off_10024AFB8 + a5), v15, v12, 2));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTTreeHead"), v14, 0, a6, v13);

}

- (void)performForSTHsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && signatureVerified == %d"), a3, 2));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTTreeHead"), v9, 0, a4, v8);

}

- (void)performForSMHsWithUnverifiedMMD:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead = %@ && application == %@ && mmdVerified == %d"), &__kCFBooleanTrue, a3, 2));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTTreeHead"), v9, 0, a4, v8);

}

- (void)performForSTHs:(id)a3 isMapHead:(BOOL)a4 revision:(id)a5 error:(id *)a6 block:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == %@ && application == %@ && revision == %@"), v15, v14, v13));

  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:](self, "performOnBatchesOfEntity:predicate:enforceMax:error:block:", CFSTR("KTTreeHead"), v16, 0, a6, v12);
}

- (void)garbageCollectSTHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a5;
  v11 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:](self, "latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:", v11, a4, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu"), v10, 1, 0, 3, v11, objc_msgSend(v13, "unsignedLongLongValue")));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTTreeHead"), v12, a6);
}

- (BOOL)shouldGarbageCollectSTH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(v10, "isMapHead") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:](self, "latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:", v11, a5, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu"), v12, 1, 0, 3, v11, objc_msgSend(v14, "unsignedLongLongValue")));
    v13 = objc_msgSend(v15, "evaluateWithObject:", v10);

  }
  return v13;
}

- (unint64_t)countOutstandingSTHsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && isMapHead == NO && (signatureVerified == %d || consistencyVerified == %d || inclusionVerified == %d)"), a3, 2, 2, 2));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTTreeHead"), v6, a4);

  return v7;
}

- (unint64_t)countTotalSTHsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@"), a3));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTTreeHead"), v6, a4);

  return v7;
}

- (unint64_t)countOutstandingSMHsForApplication:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && isMapHead == YES && (signatureVerified == %d || mmdVerified == %d || inclusionVerified == %d)"), a3, 2, 2, 2));
  v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:](self, "onMocCountEntity:predicate:error:", CFSTR("KTTreeHead"), v6, a4);

  return v7;
}

- (BOOL)logSTHMetricsForApplication:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  TransparencyManagedDataStore *v8;
  id v9;
  uint64_t *v10;
  id *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100181F24;
  v7[3] = &unk_10024AE48;
  v8 = self;
  v5 = a3;
  v10 = &v12;
  v11 = a4;
  v9 = v5;
  -[TransparencyManagedDataStore performBlockAndWait:](v8, "performBlockAndWait:", v7);
  LOBYTE(a4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a4;
}

- (BOOL)deleteSTHs:(id)a3 logBeginMsLessThan:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application == %@ && logBeginTime < %llu"), a3, a4));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTTreeHead"), v7, a5);
  if (a5 && *a5)
  {
    v8 = *a5;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTTreeHead"), 1, -171, v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001824C0;
    v12[3] = &unk_10023A390;
    v13 = v8;
    v9 = v8;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);

    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)reportFailedRevisions:(id)a3 failure:(id)a4 downloadType:(unint64_t)a5 application:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (a5 - 1 <= 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", *(&off_10024AFD8 + a5 - 1), v11));
    v18[0] = v9;
    v17[0] = CFSTR("requestedRevisions");
    v17[1] = CFSTR("errorCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
    v18[1] = v13;
    v17[2] = CFSTR("errorDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v18[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v16, "logHardFailureForEventNamed:withAttributes:", v12, v15);

  }
}

- (void)failHeadDownloadRecord:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  TransparencyManagedDataStore *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;

  v8 = a3;
  v37 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "revisions"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 0, a5));
    if (v11 && (v12 = objc_opt_class(NSArray, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      if (os_variant_allows_internal_security_policies("com.apple.Transparency"))
      {
        v13 = objc_msgSend(v8, "downloadType");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
        -[TransparencyManagedDataStore reportFailedRevisions:failure:downloadType:application:](self, "reportFailedRevisions:failure:downloadType:application:", v11, v37, v13, v14);

      }
      v15 = objc_msgSend(v8, "downloadType");
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v16 = v11;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v17)
      {
        v19 = v17;
        v36 = a5;
        v34 = v11;
        v35 = v9;
        v20 = *(_QWORD *)v44;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v21);
            v23 = objc_opt_class(NSNumber, v18);
            if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472;
              v38[2] = sub_100182C40;
              v38[3] = &unk_10024AF30;
              v42 = v15;
              v39 = v8;
              v40 = self;
              v41 = v37;
              -[TransparencyManagedDataStore performForSTHs:isMapHead:revision:error:block:](self, "performForSTHs:isMapHead:revision:error:block:", v24, v15 == (id)1, v22, v36, v38);

            }
            else
            {
              if (qword_1002A7A28 != -1)
                dispatch_once(&qword_1002A7A28, &stru_10024AEC8);
              v25 = (void *)qword_1002A7A30;
              if (os_log_type_enabled((os_log_t)qword_1002A7A30, OS_LOG_TYPE_ERROR))
              {
                v26 = v25;
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadId"));
                *(_DWORD *)buf = 138543618;
                v49 = (uint64_t)v27;
                v50 = 2112;
                v51 = v22;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "invalid revision type serialized from downloadId %{public}@: %@", buf, 0x16u);

              }
            }
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v19);
        v11 = v34;
        v9 = v35;
      }
    }
    else
    {
      if (qword_1002A7A28 != -1)
        dispatch_once(&qword_1002A7A28, &stru_10024AEA8);
      v16 = (id)qword_1002A7A30;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadId"));
        v29 = (void *)v28;
        if (a5)
          v30 = *a5;
        else
          v30 = 0;
        *(_DWORD *)buf = 138543618;
        v49 = v28;
        v50 = 2112;
        v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to deserialize revisions for downloadId %{public}@: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    if (qword_1002A7A28 != -1)
      dispatch_once(&qword_1002A7A28, &stru_10024AE88);
    v31 = (void *)qword_1002A7A30;
    if (os_log_type_enabled((os_log_t)qword_1002A7A30, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadId"));
      *(_DWORD *)buf = 138543362;
      v49 = (uint64_t)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "STH download record type missing revisions for downloadId %{public}@", buf, 0xCu);

    }
  }

}

- (void)failHeadDownload:(id)a3 failure:(id)a4 logClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  TransparencyManagedDataStore *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1002A7A28 != -1)
    dispatch_once(&qword_1002A7A28, &stru_10024AF50);
  v11 = qword_1002A7A30;
  if (os_log_type_enabled((os_log_t)qword_1002A7A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failing STH downloadId %{public}@", buf, 0xCu);
  }
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100183134;
  v16 = &unk_10024AF98;
  v17 = self;
  v18 = v9;
  v12 = v9;
  -[TransparencyManagedDataStore performAndWaitForDownloadId:error:block:](self, "performAndWaitForDownloadId:error:block:", v8, 0, &v13);
  objc_msgSend(v10, "deleteDownloadId:", v8, v13, v14, v15, v16, v17);

}

- (id)failedHeadSignaturesWithRevisions:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  TransparencyManagedDataStore *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100180354;
  v20 = sub_100180364;
  v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001833A8;
  v11[3] = &unk_100246E80;
  v7 = a4;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v15 = &v16;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)createSignedTreeHeadFailure
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KTSTHFailure"), v2));

  return v3;
}

- (id)signedTreeHeadFailures:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTSTHFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("KTSTHFailure"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedTreeHeadFailureCount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTSTHFailure")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v5, a3);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)createDownloadRecord:(unint64_t)a3 moc:(id)a4 application:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("DownloadRecord"), a4));
  objc_msgSend(v8, "setUnsigned:value:", "downloadType", a3);
  objc_msgSend(v8, "setApplication:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v8, "setDownloadId:", v9);

  objc_msgSend(v8, "setRequestTime:", CFAbsoluteTimeGetCurrent());
  return v8;
}

- (id)downloadRecords:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DownloadRecord")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v5, a3));

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("DownloadRecord"), 0, -128);
    +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)fetchDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DownloadRecord")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("downloadType == %d && application = %@"), a3, v8));

  objc_msgSend(v9, "setPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v9, a5));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);
  if (v12 && objc_msgSend(v12, "count"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
  else
    v13 = 0;

  return v13;
}

- (id)fetchDownloadRecordById:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DownloadRecord")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("downloadId = %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && objc_msgSend(v10, "count"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  else
    v11 = 0;

  return v11;
}

- (BOOL)hasPendingDownloadForUUID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  _QWORD v9[4];
  TransparencyManagedDataStore *v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100183C10;
  v18 = sub_100183C20;
  v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100183C28;
  v9[3] = &unk_100246F28;
  v10 = self;
  v5 = a3;
  v11 = v5;
  v12 = &v14;
  v13 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](v10, "performBlockAndWait:", v9);
  if (a4)
  {
    v6 = (void *)v15[5];
    if (v6)
      *a4 = objc_retainAutorelease(v6);
  }
  v7 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (BOOL)setResponse:(id)a3 downloadId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[4];
  id v15;
  TransparencyManagedDataStore *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100183C10;
  v24 = sub_100183C20;
  v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100183E4C;
  v14[3] = &unk_10023CE80;
  v9 = a4;
  v15 = v9;
  v16 = self;
  v18 = &v20;
  v10 = v8;
  v17 = v10;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v14);
  if (a5)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)deleteDownloadRecordById:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  TransparencyManagedDataStore *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100183C10;
  v22 = sub_100183C20;
  v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001842C4;
  v13[3] = &unk_100246F28;
  v14 = self;
  v6 = a3;
  v15 = v6;
  v16 = &v18;
  v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  if (*((_BYTE *)v25 + 24))
  {
    v7 = 1;
  }
  else
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("DownloadRecord"), 1, -190, v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10018439C;
    v10[3] = &unk_10023D540;
    v11 = v6;
    v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);
    if (a4)
    {
      v8 = (void *)v19[5];
      if (v8)
        *a4 = objc_retainAutorelease(v8);
    }

    v7 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (BOOL)deleteDownloadRecords:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  TransparencyManagedDataStore *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100183C10;
  v22 = sub_100183C20;
  v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018465C;
  v13[3] = &unk_100246F28;
  v6 = a3;
  v14 = v6;
  v15 = self;
  v16 = &v18;
  v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v13);
  if (!*((_BYTE *)v25 + 24))
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("DownloadRecord"), 1, -190, v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100184798;
    v10[3] = &unk_10023D540;
    v11 = v6;
    v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);

  }
  if (a4)
  {
    v7 = (void *)v19[5];
    if (v7)
      *a4 = objc_retainAutorelease(v7);
  }
  v8 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)deleteDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  TransparencyManagedDataStore *v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100183C10;
  v24 = sub_100183C20;
  v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100184A64;
  v14[3] = &unk_10024ACF0;
  v15 = self;
  v19 = a3;
  v7 = a4;
  v16 = v7;
  v17 = &v20;
  v18 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](v15, "performBlockAndWait:", v14);
  if (!*((_BYTE *)v27 + 24))
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", CFSTR("DownloadRecord"), 1, -190, v21[5]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100184B3C;
    v11[3] = &unk_10023D540;
    v12 = v7;
    v13 = &v20;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);

  }
  if (a5)
  {
    v8 = (void *)v21[5];
    if (v8)
      *a5 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v9;
}

- (BOOL)performAndWaitForDownloadId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100183C10;
  v24 = sub_100183C20;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100184DBC;
  v15[3] = &unk_100247288;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v18 = &v20;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)createFetchRecord
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("FetchRecord"), v2));

  return v3;
}

- (id)createFetchRecordForRequestData:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createFetchRecord](self, "createFetchRecord"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  objc_msgSend(v10, "setFetchId:", v11);

  objc_msgSend(v10, "setRequestData:", v9);
  objc_msgSend(v10, "setRequest:", v8);

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchId"));
  else
    v12 = 0;
  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);

  return v12;
}

- (id)fetchFetchRecordById:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("FetchRecord")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("fetchId = %@"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v7, a4));

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && objc_msgSend(v10, "count"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  else
    v11 = 0;

  return v11;
}

- (BOOL)performAndWaitForFetchId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100185238;
  v24 = sub_100185248;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100185250;
  v15[3] = &unk_100247288;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v18 = &v20;
  v11 = v9;
  v17 = v11;
  v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (TransparencyManagedDataStore)initWithController:(id)a3 followup:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  TransparencyManagedDataStore *v11;
  TransparencyManagedDataStore *v12;
  dispatch_queue_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TransparencyManagedDataStore;
  v11 = -[TransparencyManagedDataStore init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[TransparencyManagedDataStore setController:](v11, "setController:", v8);
    -[TransparencyManagedDataStore setLogger:](v12, "setLogger:", v10);
    v13 = dispatch_queue_create("TransparencyManagedDataStore peerQueue", 0);
    -[TransparencyManagedDataStore setPeerQueue:](v12, "setPeerQueue:", v13);

    -[TransparencyManagedDataStore setContextRefCount:](v12, "setContextRefCount:", 0);
    -[TransparencyManagedDataStore setFollowup:](v12, "setFollowup:", v9);
    -[TransparencyManagedDataStore setServerRPCTimeoutSeconds:](v12, "setServerRPCTimeoutSeconds:", (double)kTransparencyMaxmimumServerRPCWaitTime);
  }

  return v12;
}

+ (void)cleanseError:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", *a3));
}

- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  objc_msgSend(v12, "reportCoreDataEventForEntity:write:code:underlyingError:", v11, v7, a5, v10);

}

- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  objc_msgSend(v14, "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:", v13, v9, v8, a6, v12);

}

- (void)reportCoreDataPersistEventForLocation:(id)a3 underlyingError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v6));

  v11[0] = CFSTR("entityType");
  v11[1] = CFSTR("write");
  v12[0] = CFSTR("Persistence");
  v12[1] = &__kCFBooleanTrue;
  v11[2] = CFSTR("location");
  v12[2] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  objc_msgSend(v8, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("ktCoreDataEvent"), 1, v9, v10);
}

+ (id)serializeLoggableDatas:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("loggableDatas"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
  return v5;
}

+ (BOOL)isStrictSecureDecodingEnabled
{
  return _os_feature_enabled_impl("Transparency", "KTStrictDecoding");
}

+ (id)deserializeLoggableDatas:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v6 = a3;
  v17 = 0;
  v7 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v6, &v17);

  v8 = v17;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedClassTypes"));
  v16 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", v9, CFSTR("loggableDatas"), &v16));
  v11 = v16;

  if (!v10 && objc_msgSend(v11, "code") == (id)4864)
  {
    if (qword_1002A7C18 != -1)
      dispatch_once(&qword_1002A7C18, &stru_10024CCB0);
    v12 = (void *)qword_1002A7C20;
    if (os_log_type_enabled((os_log_t)qword_1002A7C20, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to decode loggable data. Error: %@", buf, 0xCu);

    }
  }
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return v10;
}

+ (id)supportedClassTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class(NSArray, a2);
  v4 = objc_opt_class(NSMutableArray, v3);
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v4, objc_opt_class(KTLoggableData, v5), 0);
}

- (void)deleteObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)deleteObjectSet:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[TransparencyManagedDataStore deleteObject:](self, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)clearState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  _UNKNOWN **v14;
  TransparencyManagedDataStore *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1001A4F3C;
  v26 = sub_1001A4F4C;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectModel"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A4F54;
  v12[3] = &unk_1002473A8;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entities"));
  v13 = v8;
  v14 = &off_10025C820;
  v15 = self;
  v16 = &v22;
  v17 = &v18;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);
  if (a3)
  {
    v9 = (void *)v23[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)garbageCollectEntityBatchDelete:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  TransparencyManagedDataStore *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1001A4F3C;
  v30 = sub_1001A4F4C;
  v31 = 0;
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1001A5410;
  v21 = &unk_10024CD38;
  v10 = v8;
  v22 = v10;
  v11 = v9;
  v23 = v11;
  v24 = self;
  v25 = &v26;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", &v18);
  v12 = v27;
  if (a5)
  {
    v13 = (void *)v27[5];
    if (v13)
    {
      *a5 = objc_retainAutorelease(v13);
      v12 = v27;
    }
  }
  v14 = v12[5];
  if (v14)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", v10, 1, -122, v12[5], v18, v19, v20, v21, v22);
    if (qword_1002A7C18 != -1)
      dispatch_once(&qword_1002A7C18, &stru_10024CD58);
    v15 = qword_1002A7C20;
    if (os_log_type_enabled((os_log_t)qword_1002A7C20, OS_LOG_TYPE_ERROR))
    {
      v16 = v27[5];
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2112;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14 == 0;
}

- (BOOL)garbageCollectEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  TransparencyManagedDataStore *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1001A4F3C;
  v31 = sub_1001A4F4C;
  v32 = 0;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1001A5934;
  v22 = &unk_10024CD80;
  v10 = v8;
  v23 = v10;
  v11 = v9;
  v25 = self;
  v26 = &v27;
  v24 = v11;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", &v19);
  v12 = v28[5];
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v28[5], v19, v20, v21, v22, v23));
    v14 = (void *)v28[5];
    v28[5] = v13;

    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", v10, 1, -122, v28[5]);
    if (qword_1002A7C18 != -1)
      dispatch_once(&qword_1002A7C18, &stru_10024CDA0);
    v15 = qword_1002A7C20;
    if (os_log_type_enabled((os_log_t)qword_1002A7C20, OS_LOG_TYPE_ERROR))
    {
      v16 = v28[5];
      *(_DWORD *)buf = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }
    if (a5)
    {
      v17 = (void *)v28[5];
      if (v17)
        *a5 = objc_retainAutorelease(v17);
    }
  }

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (void)storeTTR:(id)a3 withType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v6 = a4;
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13));
  v8 = v13;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A5D50;
    v10[3] = &unk_10024CE08;
    v11 = v6;
    v12 = v7;
    -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v10);

  }
  else
  {
    if (qword_1002A7C18 != -1)
      dispatch_once(&qword_1002A7C18, &stru_10024CDC0);
    v9 = qword_1002A7C20;
    if (os_log_type_enabled((os_log_t)qword_1002A7C20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "storeTTR: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }

}

- (id)getTapToRadarDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1001A4F3C;
  v17 = sub_1001A4F4C;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("TapToRadarDate"), v4));
  objc_msgSend(v5, "setPredicate:", v6);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A60EC;
  v10[3] = &unk_10024CE50;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (unint64_t)onMocCountEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", a3));
  objc_msgSend(v9, "setPredicate:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v11 = objc_msgSend(v10, "countForFetchRequest:error:", v9, a5);

  +[TransparencyManagedDataStore cleanseError:](TransparencyManagedDataStore, "cleanseError:", a5);
  return (unint64_t)v11;
}

- (BOOL)logMetricsForApplication:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  _QWORD v9[4];
  TransparencyManagedDataStore *v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1001A4F3C;
  v18 = sub_1001A4F4C;
  v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A6460;
  v9[3] = &unk_100246F28;
  v10 = self;
  v5 = a3;
  v11 = v5;
  v12 = &v14;
  v13 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](v10, "performBlockAndWait:", v9);
  if (a4)
  {
    v6 = (void *)v15[5];
    if (v6)
      *a4 = objc_retainAutorelease(v6);
  }
  v7 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (void)refaultObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  objc_msgSend(v5, "refreshObject:mergeChanges:", v4, 0);

}

- (void)saveAndRefaultObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  objc_msgSend(v5, "refreshObject:mergeChanges:", v4, 1);

}

- (void)refaultObjects:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
        objc_msgSend(v10, "refreshObject:mergeChanges:", v9, 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)persistWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  LOBYTE(a3) = objc_msgSend(v5, "saveContext:error:", v6, a3);

  return (char)a3;
}

- (BOOL)persistAndRefaultObject:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a3;
  v7 = -[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a4);
  if (v7)
    -[TransparencyManagedDataStore refaultObject:](self, "refaultObject:", v6);

  return v7;
}

- (BOOL)persistAndRefaultObjects:(id)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;

  v5 = -[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
    objc_msgSend(v6, "refreshAllObjects");

  }
  return v5;
}

- (BOOL)clearStateForApplication:(id)a3 error:(id *)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("application = %@"), a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTRequest"), v6, a4);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTTreeHead"), v6, a4);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:](self, "garbageCollectEntity:predicate:error:", CFSTR("KTMutation"), v6, a4);

  return 1;
}

- (id)copyStatistics:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001A4F3C;
  v19 = sub_1001A4F4C;
  v20 = 0;
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1001A4F3C;
  v13 = sub_1001A4F4C;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A6A28;
  v8[3] = &unk_10024CEA8;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5)
      *a3 = objc_retainAutorelease(v5);
  }
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)performOnBatchesOfEntity:(id)a3 predicate:(id)a4 enforceMax:(BOOL)a5 error:(id *)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1001A4F3C;
  v41 = sub_1001A4F4C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1001A4F3C;
  v35 = sub_1001A4F4C;
  v36 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001A6F18;
  v24[3] = &unk_10024CEF0;
  v24[4] = self;
  v28 = &v31;
  v15 = v12;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  v30 = a5;
  v17 = v14;
  v27 = v17;
  v29 = &v37;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v24);
  if (v32[5])
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", v15, 0, -211);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001A7254;
    v20[3] = &unk_100247010;
    v21 = v15;
    v22 = v16;
    v23 = &v31;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v20);
    if (a6)
    {
      v18 = (void *)v32[5];
      if (v18)
        *a6 = objc_retainAutorelease(v18);
    }

  }
  else if (a6)
  {
    v19 = (void *)v38[5];
    if (v19)
      *a6 = objc_retainAutorelease(v19);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

}

- (id)retainContext
{
  TransparencyManagedDataStore *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](v2, "context"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](v2, "controller"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundContext"));
    -[TransparencyManagedDataStore setContext:](v2, "setContext:", v5);

  }
  -[TransparencyManagedDataStore setContextRefCount:](v2, "setContextRefCount:", (char *)-[TransparencyManagedDataStore contextRefCount](v2, "contextRefCount") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](v2, "context"));
  objc_sync_exit(v2);

  return v6;
}

- (void)releaseContext
{
  TransparencyManagedDataStore *obj;

  obj = self;
  objc_sync_enter(obj);
  -[TransparencyManagedDataStore setContextRefCount:](obj, "setContextRefCount:", (char *)-[TransparencyManagedDataStore contextRefCount](obj, "contextRefCount") - 1);
  if (-[TransparencyManagedDataStore contextRefCount](obj, "contextRefCount") <= 0)
  {
    -[TransparencyManagedDataStore setContext:](obj, "setContext:", 0);
    -[TransparencyManagedDataStore setContextRefCount:](obj, "setContextRefCount:", 0);
  }
  objc_sync_exit(obj);

}

- (BOOL)drainDataStore
{
  unint64_t v3;
  TransparencyManagedDataStore *v4;
  uint64_t v5;

  v3 = 120;
  do
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = -[TransparencyManagedDataStore contextRefCount](v4, "contextRefCount");
    objc_sync_exit(v4);

    sleep(1u);
    if (v3 < 2)
      break;
    --v3;
  }
  while (v5 >= 1);
  return v5 < 1;
}

- (void)performBlockAndWaitWithMoc:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A75E0;
  v7[3] = &unk_10023FC30;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore retainContext](self, "retainContext"));
  v9 = v4;
  v5 = v8;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  -[TransparencyManagedDataStore releaseContext](self, "releaseContext");

}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A7668;
  v5[3] = &unk_10024CF38;
  v6 = a3;
  v4 = v6;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v5);

}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1001A4F3C;
  v10[4] = sub_1001A4F4C;
  v11 = 0;
  v11 = (id)os_transaction_create("com.apple.transparencyd.DBWrite");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore retainContext](self, "retainContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A7778;
  v7[3] = &unk_10024CF60;
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  v9 = v10;
  objc_msgSend(v5, "performBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (TransparencyManagedDataStoreController)controller
{
  return (TransparencyManagedDataStoreController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TransparencyManagedDataStoreProtocol)updateDelegate
{
  return (TransparencyManagedDataStoreProtocol *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFollowup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)serverRPCTimeoutSeconds
{
  return self->_serverRPCTimeoutSeconds;
}

- (void)setServerRPCTimeoutSeconds:(double)a3
{
  self->_serverRPCTimeoutSeconds = a3;
}

- (OS_dispatch_queue)peerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_loadWeakRetained((id *)&self->_staticKeyStore);
}

- (void)setStaticKeyStore:(id)a3
{
  objc_storeWeak((id *)&self->_staticKeyStore, a3);
}

- (TransparencyPeerOverrides)peerOverridesStore
{
  return (TransparencyPeerOverrides *)objc_loadWeakRetained((id *)&self->_peerOverridesStore);
}

- (void)setPeerOverridesStore:(id)a3
{
  objc_storeWeak((id *)&self->_peerOverridesStore, a3);
}

- (int64_t)contextRefCount
{
  return self->_contextRefCount;
}

- (void)setContextRefCount:(int64_t)a3
{
  self->_contextRefCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peerOverridesStore);
  objc_destroyWeak((id *)&self->_staticKeyStore);
  objc_storeStrong((id *)&self->_peerQueue, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
