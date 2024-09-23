@implementation RDStoreControllerMigrator_AccountIdentifierMetadata

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RDStoreControllerAccountIdentifier")));

    if (!v9)
      -[RDStoreControllerMigrator_AccountIdentifierMetadata migrateStore:metadata:](self, "migrateStore:metadata:", v6, v7);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_10067902C((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)migrateStore:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  id v35;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount fetchRequest](REMCDAccount, "fetchRequest"));
  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(v7, "setPropertiesToFetch:", &off_100804BD0);
  v35 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  objc_msgSend(v7, "setAffectedStores:", v8);

  v9 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));
  objc_msgSend(v9, "setPersistentStoreCoordinator:", v10);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10001F034;
  v29 = sub_10001F044;
  v30 = 0;
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10001F04C;
  v20 = &unk_1007D7B20;
  v11 = v9;
  v21 = v11;
  v12 = v7;
  v22 = v12;
  v13 = v5;
  v23 = v13;
  v24 = &v25;
  objc_msgSend(v11, "performBlockAndWait:", &v17);
  if (v26[5])
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container", v17, v18, v19, v20, v21, v22));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v26[5], "UUIDString"));
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2114;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Populating RDStoreControllerAccountIdentifier {store: %{public}@, identifier: %{public}@}", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v26[5], "UUIDString"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("RDStoreControllerAccountIdentifier"));

  }
  _Block_object_dispose(&v25, 8);

}

@end
