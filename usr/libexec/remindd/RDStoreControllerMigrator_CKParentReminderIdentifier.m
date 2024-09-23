@implementation RDStoreControllerMigrator_CKParentReminderIdentifier

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RDStoreControllerMigrator_CKParentReminderIdentifier")));
  v8 = objc_msgSend(v7, "integerValue");

  if ((uint64_t)v8 <= 0)
  {
    -[RDStoreControllerMigrator_CKParentReminderIdentifier migrateStore:](self, "migrateStore:", v9);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_100804860, CFSTR("RDStoreControllerMigrator_CKParentReminderIdentifier"));
  }

}

- (void)migrateStore:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 *p_buf;
  uint8_t v15[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  __int128 buf;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKParentReminderIdentifierMigration BEGIN {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));
  objc_msgSend(v5, "setPersistentStoreCoordinator:", v6);

  objc_msgSend(v5, "setTransactionAuthor:", RDStoreControllerCKParentReminderIdentifierMigrationAuthor);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100096B48;
  v11[3] = &unk_1007D7FB0;
  v7 = v3;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  p_buf = &buf;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v15 = 138412546;
    v16 = v7;
    v17 = 2048;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CKParentReminderIdentifierMigration END {store: %@, updated.count: %ld}", v15, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

@end
