@implementation RDStoreControllerMigrator_RemoveOrphanedLists

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RDStoreControllerMigrator_RemoveUnparentedObjects")));
  v8 = objc_msgSend(v7, "integerValue");

  if ((uint64_t)v8 <= 0)
  {
    -[RDStoreControllerMigrator_RemoveOrphanedLists migrateStore:](self, "migrateStore:", v9);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1008044E8, CFSTR("RDStoreControllerMigrator_RemoveUnparentedObjects"));
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
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 *p_buf;
  uint8_t v16[4];
  id v17;
  __int16 v18;
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UnparentedObjectsMigration BEGIN {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  v5 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));
  objc_msgSend(v5, "setPersistentStoreCoordinator:", v6);

  objc_msgSend(v5, "setTransactionAuthor:", RDStoreControllerOrphanedListMigrationAuthor);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_10001CFFC;
  v23 = sub_10001D00C;
  v24 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D014;
  v12[3] = &unk_1007D7970;
  v7 = v3;
  v13 = v7;
  p_buf = &buf;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "result"));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412546;
    v17 = v7;
    v18 = 2048;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UnparentedObjectsMigration End {store: %@, countDeleted: %ld}", v16, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

@end
