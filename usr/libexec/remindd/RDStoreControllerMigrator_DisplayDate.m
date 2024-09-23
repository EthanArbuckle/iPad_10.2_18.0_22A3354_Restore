@implementation RDStoreControllerMigrator_DisplayDate

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RDStoreControllerMigrator_DisplayDate")));
  v8 = objc_msgSend(v7, "integerValue");

  if ((uint64_t)v8 <= 0)
  {
    -[RDStoreControllerMigrator_DisplayDate migrateStore:](self, "migrateStore:", v9);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_100804878, CFSTR("RDStoreControllerMigrator_DisplayDate"));
  }

}

- (void)migrateStore:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DisplayDateMigration BEGIN {store: %@}", (uint8_t *)&v6, 0xCu);
  }

  +[RDDisplayDateUpdater updateDisplayDatesIn:](_TtC7remindd20RDDisplayDateUpdater, "updateDisplayDatesIn:", v3);
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DisplayDateMigration END {store: %@}", (uint8_t *)&v6, 0xCu);
  }

}

@end
