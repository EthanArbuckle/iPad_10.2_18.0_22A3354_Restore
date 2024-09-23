@implementation KTSMDataStoreActual

- (KTSMDataStoreActual)initWithPersistentContainer:(id)a3
{
  id v4;
  KTSMDataStoreActual *v5;
  KTSMDataStoreActual *v6;
  KTSMDataStoreActual *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTSMDataStoreActual;
  v5 = -[KTSMDataStoreActual init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[KTSMDataStoreActual setContainer:](v5, "setContainer:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)managedObjectContextWithMergePolicy
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual container](self, "container"));
  v3 = objc_msgSend(v2, "newBackgroundContext");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy](NSMergePolicy, "mergeByPropertyStoreTrumpMergePolicy"));
  objc_msgSend(v3, "setMergePolicy:", v4);

  return v3;
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  NSObject *v18;
  id obj;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint8_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, uint64_t))a4;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246A28);
  v8 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchSelfVerificationInfoForApplication:application:", buf, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@ AND unique = %@"), CFSTR("SelfVerificationInfo"), v6, &stru_1002508B8));
  objc_msgSend(v9, "setPredicate:", v10);

  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x3032000000;
  v42 = sub_1001268A4;
  v43 = sub_1001268B4;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1001268A4;
  v37 = sub_1001268B4;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1001268A4;
  v31 = sub_1001268B4;
  v32 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001268BC;
  v21[3] = &unk_100246A50;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v22 = v11;
  v12 = v9;
  v23 = v12;
  v24 = &v27;
  v25 = buf;
  v26 = &v33;
  objc_msgSend(v11, "performBlockAndWait:", v21);
  if (*((_QWORD *)v40 + 5))
  {
    v14 = objc_opt_class(KTSelfVerificationInfo, v13);
    v15 = *((_QWORD *)v40 + 5);
    v16 = (id *)(v28 + 5);
    obj = (id)v28[5];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v14, v15, &obj));
    objc_storeStrong(v16, obj);
    v7[2](v7, v17, v34[5], v28[5]);

  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246A70);
    v18 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "fetchSelfVerificationInfoForApplication: no data", v20, 2u);
    }
    v7[2](v7, 0, 0, v28[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeSelfVerificationInfo:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  BOOL v26;
  NSObject *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  __int128 *p_buf;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t v39[4];
  uint64_t v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a3;
  v9 = a4;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246A90);
  v10 = (void *)qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncedLoggableDatas"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: syncedLoggableDatas %@", (uint8_t *)&buf, 0xCu);

  }
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246AB0);
  v13 = (void *)qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uriToServerLoggableDatas"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: uriToServerLoggableDatas: %@", (uint8_t *)&buf, 0xCu);

  }
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246AD0);
  v16 = (void *)qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selfDeviceID"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: selfDeviceID: %@", (uint8_t *)&buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, a5));
  if (v19)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = sub_1001268A4;
    v44 = sub_1001268B4;
    v45 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual container](self, "container"));
    v21 = objc_msgSend(v20, "newBackgroundContext");

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100126F98;
    v29[3] = &unk_10023CE80;
    v30 = v9;
    v22 = v21;
    v31 = v22;
    p_buf = &buf;
    v32 = v19;
    v34 = &v35;
    objc_msgSend(v22, "performBlockAndWait:", v29);
    v23 = *((unsigned __int8 *)v36 + 24);
    if (a5 && !*((_BYTE *)v36 + 24))
    {
      if (qword_1002A7688 != -1)
        dispatch_once(&qword_1002A7688, &stru_100246B70);
      v24 = qword_1002A7690;
      if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v39 = 138412290;
        v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "storeSelfVerificationInfo: error %@", v39, 0xCu);
      }
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v23 = *((unsigned __int8 *)v36 + 24);
    }
    v26 = v23 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246AF0);
    v27 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "storeSelfVerificationInfo: archivedDataWithRootObject", (uint8_t *)&buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

- (void)deleteSelfVerificationInfoForApplication:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id *v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012742C;
  v8[3] = &unk_10023D2F0;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v11 = a4;
  v6 = v10;
  v7 = v9;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

- (void)fetchIDMSDeviceList:(id)a3
{
  void (**v4)(id, void *, _QWORD, uint64_t);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint8_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t v45[4];
  uint64_t v46;
  _QWORD v47[2];

  v4 = (void (**)(id, void *, _QWORD, uint64_t))a3;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246B90);
  v5 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetchIDMSDeviceList", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@ AND unique = %@"), CFSTR("IDMSDeviceList"), CFSTR("global"), &stru_1002508B8));
  objc_msgSend(v6, "setPredicate:", v7);

  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x3032000000;
  v42 = sub_1001268A4;
  v43 = sub_1001268B4;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1001268A4;
  v37 = sub_1001268B4;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1001268A4;
  v31 = sub_1001268B4;
  v32 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001279CC;
  v21[3] = &unk_100246A50;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v22 = v8;
  v9 = v6;
  v23 = v9;
  v24 = &v27;
  v25 = buf;
  v26 = &v33;
  objc_msgSend(v8, "performBlockAndWait:", v21);
  if (*((_QWORD *)v40 + 5))
  {
    v47[0] = objc_opt_class(KTIDMSDevice, v10);
    v47[1] = objc_opt_class(NSArray, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
    v14 = *((_QWORD *)v40 + 5);
    v15 = (id *)(v28 + 5);
    obj = (id)v28[5];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v14, &obj));
    objc_storeStrong(v15, obj);

    if (v28[5])
    {
      if (qword_1002A7688 != -1)
        dispatch_once(&qword_1002A7688, &stru_100246BD0);
      v17 = qword_1002A7690;
      if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
      {
        v18 = v28[5];
        *(_DWORD *)v45 = 138412290;
        v46 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "fetchIDMSDeviceList: unarchivedObjectOfClasses %@", v45, 0xCu);
      }
      v19 = v28[5];
    }
    else
    {
      v19 = 0;
    }
    v4[2](v4, v16, v34[5], v19);

  }
  else
  {
    v4[2](v4, 0, 0, v28[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeIDMSDeviceList:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 *p_buf;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t v25[4];
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246BF0);
  v7 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "storeIDMSDeviceList: %@", (uint8_t *)&buf, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4));
  if (v8)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = sub_1001268A4;
    v30 = sub_1001268B4;
    v31 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100127FC0;
    v16[3] = &unk_100246C98;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
    v17 = v9;
    p_buf = &buf;
    v18 = v8;
    v20 = &v21;
    objc_msgSend(v9, "performBlockAndWait:", v16);
    v10 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      if (qword_1002A7688 != -1)
        dispatch_once(&qword_1002A7688, &stru_100246CB8);
      v11 = qword_1002A7690;
      if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v25 = 138412290;
        v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "storeIDMSDeviceList: error %@", v25, 0xCu);
      }
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v10 = *((unsigned __int8 *)v22 + 24);
    }
    v13 = v10 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246C10);
    v14 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "storeIDMSDeviceList: archivedDataWithRootObject", (uint8_t *)&buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)fetchKTInfoForApplication:(id)a3 uri:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246CD8);
  v11 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetchKTInfoForApplication:uri:", buf, 2u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@ AND unique = %@"), CFSTR("QueryResponse"), v8, v9));
  objc_msgSend(v12, "setPredicate:", v13);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10012857C;
  v17[3] = &unk_10023D6C0;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v19 = v12;
  v20 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v18;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

- (BOOL)storeQueryRequest:(id)a3 queryResponse:(id)a4 serverHint:(id)a5 uri:(id)a6 application:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  KTQueryInfo *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  BOOL v27;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 *p_buf;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t v43[4];
  uint64_t v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v30 = a7;
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246D38);
  v18 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "storeQueryResponse %@", (uint8_t *)&buf, 0xCu);
  }
  v19 = objc_alloc_init(KTQueryInfo);
  -[KTQueryInfo setQueryRequest:](v19, "setQueryRequest:", v14);
  -[KTQueryInfo setQueryResponse:](v19, "setQueryResponse:", v15);
  -[KTQueryInfo setServerHint:](v19, "setServerHint:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v19, "data"));
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = sub_1001268A4;
  v48 = sub_1001268B4;
  v49 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100128C4C;
  v32[3] = &unk_100246DC0;
  v31 = v30;
  v33 = v31;
  v29 = v17;
  v34 = v29;
  v22 = v21;
  v35 = v22;
  p_buf = &buf;
  v23 = v20;
  v36 = v23;
  v38 = &v39;
  objc_msgSend(v22, "performBlockAndWait:", v32);
  v24 = *((unsigned __int8 *)v40 + 24);
  if (a8 && !*((_BYTE *)v40 + 24))
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246DE0);
    v25 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v43 = 138412290;
      v44 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "storeQueryResponse: error %@", v43, 0xCu);
    }
    *a8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v24 = *((unsigned __int8 *)v40 + 24);
  }
  v27 = v24 != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v39, 8);

  return v27;
}

- (id)jsonifyError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  KTSMDataStoreActual *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19[0] = CFSTR("code");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
    v19[1] = CFSTR("domain");
    v20[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    v20[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    v9 = objc_msgSend(v8, "mutableCopy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001291D4;
      v16[3] = &unk_100246E08;
      v17 = v12;
      v18 = self;
      v14 = v12;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("userinfo"));
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)errorFromData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 0, 0));
    v6 = objc_opt_class(NSDictionary, v5);
    v7 = 0;
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual errorFromJson:](self, "errorFromJson:", v4));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)errorFromJson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  KTSMDataStoreActual *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userinfo")));

  v9 = objc_opt_class(NSNumber, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0
    || (v11 = objc_opt_class(NSString, v10), (objc_opt_isKindOfClass(v6, v11) & 1) != 0))
  {
    v12 = objc_opt_class(NSDictionary, v10);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0 && objc_msgSend(v7, "count"))
    {
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_1001294B8;
      v19 = &unk_100246E30;
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v20 = v13;
      v21 = self;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v16);

    }
    else
    {
      v13 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, objc_msgSend(v5, "longValue", v16, v17, v18, v19), v13));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)pushTokenForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1001268A4;
  v20 = sub_1001268B4;
  v21 = 0;
  v22 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1001296D8;
  v13 = &unk_100246E58;
  v15 = &v16;
  v6 = v4;
  v14 = v6;
  -[KTSMDataStoreActual fetchDeviceSignature:complete:](self, "fetchDeviceSignature:complete:", v5, &v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17[5], "objectForKeyedSubscript:", v6, v10, v11, v12, v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pushToken"));

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)fetchDeviceSignature:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  KTSMDataStoreActual *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1001268A4;
  v25 = sub_1001268B4;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001268A4;
  v19 = sub_1001268B4;
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100129884;
  v10[3] = &unk_10023E9D8;
  v9 = v6;
  v13 = &v15;
  v14 = &v21;
  v11 = v9;
  v12 = self;
  objc_msgSend(v8, "performBlockAndWait:", v10);
  v7[2](v7, v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)storeDeviceSignature:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  KTSMDataStoreActual *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11), "tbsKTIDSRegistrationData"));
        v13 = v12 == 0;

        if (v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -324, 0, CFSTR("missing tbs data")));
          v7[2](v7, v16);

          v15 = v8;
          goto LABEL_11;
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1001268A4;
  v26 = sub_1001268B4;
  v27 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100129E94;
  v17[3] = &unk_100246E80;
  v18 = v8;
  v15 = v14;
  v19 = v15;
  v20 = self;
  v21 = &v22;
  objc_msgSend(v15, "performBlockAndWait:", v17);
  v7[2](v7, (void *)v23[5]);

  _Block_object_dispose(&v22, 8);
LABEL_11:

}

- (void)uploadedDeviceSignature:(id)a3 tbs:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1001268A4;
  v24 = sub_1001268B4;
  v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10012A3D0;
  v15[3] = &unk_10023E000;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v19 = &v20;
  v14 = v11;
  v18 = v14;
  objc_msgSend(v14, "performBlockAndWait:", v15);
  v10[2](v10, v21[5]);

  _Block_object_dispose(&v20, 8);
}

- (void)delete:(id)a3 onMOC:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v6);

  objc_msgSend(v7, "setResultType:", 1);
  v11 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeRequest:error:", v7, &v11));

  v9 = v11;
  if (!v8)
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246EA0);
    v10 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "bulk delete failed: %@", buf, 0xCu);
    }
  }

}

- (void)_onQueueClearDeviceSignatureSignatures
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceSignature fetchRequest](DeviceSignature, "fetchRequest"));
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "execute:", &v16));
  v4 = v16;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "setSignedAt:", 0, (_QWORD)v12);
          objc_msgSend(v10, "setUploadedAt:", 0);
          objc_msgSend(v10, "setSignature:", 0);
          objc_msgSend(v10, "setPublicKey:", 0);
          objc_msgSend(v10, "setState:", CFSTR("tbs"));
          objc_msgSend(v10, "setCurrentItemPointerModificationTime:", 0);
          objc_msgSend(v10, "setAltDSID:", 0);
          objc_msgSend(v10, "setError:", 0);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246EC0);
    v11 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "deleting DeviceSignatures failes: %@", buf, 0xCu);
    }
  }

}

- (BOOL)clearDeviceSignatures:(id *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  uint64_t v28;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001268A4;
  v19 = sub_1001268B4;
  v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012AB78;
  v11[3] = &unk_100246C98;
  v11[4] = self;
  v13 = &v21;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v12 = v4;
  v14 = &v15;
  objc_msgSend(v4, "performBlockAndWait:", v11);
  if (a3)
  {
    v5 = (void *)v16[5];
    if (v5)
      *a3 = objc_retainAutorelease(v5);
  }
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246EE0);
  v6 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((unsigned __int8 *)v22 + 24);
    v8 = v16[5];
    *(_DWORD *)buf = 67109378;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "done clearing signatures %d: %@", buf, 0x12u);
  }
  v9 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

- (BOOL)clearDataStore:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t v27[4];
  int v28;
  __int16 v29;
  uint64_t v30;

  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246F00);
  v5 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting KTSMDataStore", buf, 2u);
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = sub_1001268A4;
  v21 = sub_1001268B4;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012AEBC;
  v13[3] = &unk_100246F28;
  v13[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v14 = v6;
  v15 = &v23;
  v16 = buf;
  objc_msgSend(v6, "performBlockAndWait:", v13);
  if (a3)
  {
    v7 = (void *)*((_QWORD *)v18 + 5);
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  if (qword_1002A7688 != -1)
    dispatch_once(&qword_1002A7688, &stru_100246F48);
  v8 = qword_1002A7690;
  if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *((unsigned __int8 *)v24 + 24);
    v10 = *((_QWORD *)v18 + 5);
    *(_DWORD *)v27 = 67109378;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "done deleting KTSMDataStore %d: %@", v27, 0x12u);
  }
  v11 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

- (void)storeFixup:(id)a3
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
  v7[2] = sub_10012B020;
  v7[3] = &unk_10023B3A8;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)deleteFixup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("FixUps"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  -[KTSMDataStoreActual delete:onMOC:](self, "delete:onMOC:", v5, v7);

}

- (BOOL)haveDoneFixup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("FixUps"), v4));
  objc_msgSend(v6, "setPredicate:", v7);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012B3C4;
  v11[3] = &unk_10023CDE8;
  v14 = &v15;
  v8 = v5;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  LOBYTE(v7) = v16[3] != 0;

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

- (void)setSettingsDate:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v18));
  v9 = v18;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012B6F4;
    v13[3] = &unk_10023CD98;
    v14 = v6;
    v15 = v7;
    v16 = v10;
    v17 = v8;
    v11 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100246FA8);
    v12 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "setSettingsDate: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }

}

- (id)getSettingsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001268A4;
  v19 = sub_1001268B4;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("SettingsDate"), v4));
  objc_msgSend(v5, "setPredicate:", v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012BB68;
  v11[3] = &unk_100247010;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSettingsData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012BDC0;
  v9[3] = &unk_10023D398;
  v10 = a3;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v6 = v12;
  v7 = v11;
  v8 = v10;
  objc_msgSend(v6, "performBlockAndWait:", v9);

}

- (id)getSettingsData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001268A4;
  v19 = sub_1001268B4;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("SettingsData"), v4));
  objc_msgSend(v5, "setPredicate:", v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C234;
  v11[3] = &unk_100247010;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSettingsNumber:(id)a3 number:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v18));
  v9 = v18;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012C56C;
    v13[3] = &unk_10023CD98;
    v14 = v6;
    v15 = v7;
    v16 = v10;
    v17 = v8;
    v11 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v13);

  }
  else
  {
    if (qword_1002A7688 != -1)
      dispatch_once(&qword_1002A7688, &stru_100247070);
    v12 = qword_1002A7690;
    if (os_log_type_enabled((os_log_t)qword_1002A7690, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "setSettingsNumber: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }

}

- (id)getSettingsNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1001268A4;
  v19 = sub_1001268B4;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](CachedData, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("key = %@ AND application = %@"), CFSTR("SettingsNumber"), v4));
  objc_msgSend(v5, "setPredicate:", v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012C9E0;
  v11[3] = &unk_100247010;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
