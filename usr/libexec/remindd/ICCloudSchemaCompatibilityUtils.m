@implementation ICCloudSchemaCompatibilityUtils

+ (BOOL)isCloudSchemaCatchUpSyncNeededForAccountIdentifier:(id)a3 context:(id)a4 outPersistenceCloudSchemaVersion:(int64_t *)a5
{
  id v8;
  int64_t v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  uint64_t v17;

  v8 = a3;
  v9 = (int64_t)objc_msgSend(a1, "persistenceCloudSchemaVersionWithAccountIdentifier:context:", v8, a4);
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138543874;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    v16 = 2048;
    v17 = 20240715;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ICCSCU: isCloudSchemaCatchUpSyncNeeded? {accountIdentifier: %{public}@, persistence: %lld, runtime: %lld}", (uint8_t *)&v12, 0x20u);
  }

  if (a5)
    *a5 = v9;

  return v9 < 20240715;
}

+ (BOOL)cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE *v18;
  uint8_t v19[4];
  id v20;
  _BYTE buf[24];
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = (uint64_t)objc_msgSend(a1, "persistenceCloudSchemaVersionWithAccountIdentifier:context:", v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v10 = v9;
  if (v8 >= 20240715)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10067FA30((uint64_t)v6, v8, v10);

    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      v22 = 20240715;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ICCSCU: cloudSchemaCatchUpSyncDidComplete: Will update account.persistenceCloudSchemaVersion {accountIdentifier: %{public}@, persistence: %lld, runtime: %lld}", buf, 0x20u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v22) = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000608B8;
    v15[3] = &unk_1007D7FB0;
    v11 = v6;
    v16 = v11;
    v17 = v7;
    v18 = buf;
    objc_msgSend(v17, "performBlockAndWait:", v15);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 138543362;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCSCU: cloudSchemaCatchUpSyncDidComplete: ckAccount.persistenceCloudSchemaVersion updated SUCCESS {accountID: %{public}@}", v19, 0xCu);
      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10067F9BC((uint64_t)v11, v12);
    }

    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

+ (BOOL)isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4
{
  return objc_msgSend(a1, "_isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:outIncompatiblePropertyKeys:", a3, a4, 0);
}

+ (id)incompatiblePropertyKeysForCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v10 = v7;
  objc_msgSend(a1, "_isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:outIncompatiblePropertyKeys:", v6, a4, &v10);

  v8 = v10;
  return v8;
}

+ (BOOL)_isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4 outIncompatiblePropertyKeys:(id *)a5
{
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  int64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;

  v10 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100060CA0;
  v37 = sub_100060CB0;
  if (a5)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  else
    v11 = 0;
  v38 = v11;
  v12 = objc_msgSend((id)objc_opt_class(v10, v9), "cdEntityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    v14 = cloudKitSchemaVersionIncompatibilityInfoMap();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100060CB8;
    v26[3] = &unk_1007D9A98;
    v31 = a4;
    v27 = v13;
    v28 = v10;
    v29 = &v39;
    v32 = a5 != 0;
    v30 = &v33;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v26);
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v34[5]));
    v16 = *((unsigned __int8 *)v40 + 24);

  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v20 = (objc_class *)objc_opt_class(a1, v18);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v22, v24));
      *(_DWORD *)buf = 138543618;
      v44 = v25;
      v45 = 2080;
      v46 = "existingCloudObjectEntityName";
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "[%{public}@] Passing in nil '%s'", buf, 0x16u);

    }
    NSLog(CFSTR("'%s' is unexpectedly nil"), "existingCloudObjectEntityName");
    v16 = *((unsigned __int8 *)v40 + 24);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v16 != 0;
}

+ (int64_t)persistenceCloudSchemaVersionWithAccountIdentifier:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100060F40;
  v11[3] = &unk_1007D7FB0;
  v7 = v5;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

@end
