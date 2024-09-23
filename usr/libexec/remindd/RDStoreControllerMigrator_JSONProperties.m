@implementation RDStoreControllerMigrator_JSONProperties

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RDStoreControllerMigrator_JSONProperties")));
  v8 = (uint64_t)objc_msgSend(v7, "integerValue");

  if (v8 <= 2)
  {
    -[RDStoreControllerMigrator_JSONProperties migrateStore:](self, "migrateStore:", v9);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1008047E8, CFSTR("RDStoreControllerMigrator_JSONProperties"));
  }

}

- (void)migrateStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  RDStoreControllerMigrator_JSONProperties *v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = (unint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "JSONPropertiesMigration BEGIN {store: %@}", buf, 0xCu);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));
  objc_msgSend(v6, "setPersistentStoreCoordinator:", v7);

  objc_msgSend(v6, "setTransactionAuthor:", RDStoreControllerJSONPropertiesMigrationAuthor);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006AD14;
  v15[3] = &unk_1007D7CE0;
  v8 = v4;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v18 = self;
  objc_msgSend(v9, "performBlockAndWait:", v15);
  v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[RDStoreControllerMigrator_JSONProperties totalMigratedCount](self, "totalMigratedCount");
    v12 = -[RDStoreControllerMigrator_JSONProperties totalListCount](self, "totalListCount");
    v13 = -[RDStoreControllerMigrator_JSONProperties migratedAccount](self, "migratedAccount");
    v14 = -[RDStoreControllerMigrator_JSONProperties migratedListsCount](self, "migratedListsCount");
    *(_DWORD *)buf = 134219010;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 2048;
    v26 = v14;
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "JSONPropertiesMigration END {totalMigratedCount: %ld, totalListCount: %ld, migratedAccount: %d. migratedListsCount: %ld, store: %@}", buf, 0x30u);
  }

}

- (void)migrateTokenResolutionMapInObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData")));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v2_JSON")));
    if (v5)
    {
      objc_msgSend(v7, "setResolutionTokenMap:", v5);
      objc_msgSend(v7, "willChangeValueForKey:", CFSTR("resolutionTokenMap_v2_JSON"));
      objc_msgSend(v7, "setPrimitiveValue:forKey:", 0, CFSTR("resolutionTokenMap_v2_JSON"));
      objc_msgSend(v7, "didChangeValueForKey:", CFSTR("resolutionTokenMap_v2_JSON"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primitiveValueForKey:", CFSTR("resolutionTokenMap")));
      if (v6)
      {
        objc_msgSend(v7, "setResolutionTokenMap:", v6);
        objc_msgSend(v7, "willChangeValueForKey:", CFSTR("resolutionTokenMap"));
        objc_msgSend(v7, "setPrimitiveValue:forKey:", 0, CFSTR("resolutionTokenMap"));
        objc_msgSend(v7, "didChangeValueForKey:", CFSTR("resolutionTokenMap"));
      }

    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)migrateCRDTsInObject:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = objc_autoreleasePoolPush();
  v6 = objc_opt_class(REMCDAccount, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    -[RDStoreControllerMigrator_JSONProperties migrateCRDTsInAccount:](self, "migrateCRDTsInAccount:", v9);
  v8 = objc_opt_class(REMCDList, v7);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    -[RDStoreControllerMigrator_JSONProperties migrateCRDTsInList:](self, "migrateCRDTsInList:", v9);
  objc_autoreleasePoolPop(v4);

}

- (void)migrateCRDTsInAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  RDStoreControllerMigrator_JSONProperties *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitiveValueForKey:", CFSTR("listIDsMergeableOrdering_v2")));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));
    v7 = objc_msgSend(objc_alloc((Class)REMReplicaIDSource), "initWithAccountID:objectID:property:", v6, v6, CFSTR("listIDsMergeableOrdering"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitiveValueForKey:", CFSTR("listIDsMergeableOrdering")));
    v39 = 0;
    v9 = objc_msgSend(objc_alloc((Class)REMCRMergeableOrderedSet), "initWithReplicaIDSource:serializedData:error:", v7, v8, &v39);
    v10 = v39;
    v11 = v10;
    if (v9)
    {
      v29 = self;
      v30 = v9;
      v31 = v10;
      v32 = v8;
      v33 = v6;
      v34 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "orderedSet"));
      v13 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v12, "count"));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v14 = v12;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (!v15)
        goto LABEL_17;
      v17 = v15;
      v18 = *(_QWORD *)v36;
      while (1)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v19);
          v21 = objc_opt_class(REMObjectID, v16);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v23, "UUIDString"));
            objc_msgSend(v13, "addObject:", v24);

          }
          else
          {
            v25 = objc_opt_class(NSString, v22);
            if ((objc_opt_isKindOfClass(v20, v25) & 1) != 0)
            {
              objc_msgSend(v13, "addObject:", v20);
              goto LABEL_15;
            }
            v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v20;
              _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to create NSUUID from item in legacyOrderedSet. Skipping {item: %@}", buf, 0xCu);
            }
          }

LABEL_15:
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (!v17)
        {
LABEL_17:

          v26 = objc_msgSend(objc_alloc((Class)REMCRMergeableOrderedSet), "initWithReplicaIDSource:orderedSet:", v7, v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "serializedData"));
          if (v27)
          {
            v4 = v34;
            objc_msgSend(v34, "willChangeValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
            objc_msgSend(v34, "setPrimitiveValue:forKey:", v27, CFSTR("listIDsMergeableOrdering_v2"));
            objc_msgSend(v34, "didChangeValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
            objc_msgSend(v34, "willChangeValueForKey:", CFSTR("listIDsMergeableOrdering"));
            objc_msgSend(v34, "setPrimitiveValue:forKey:", 0, CFSTR("listIDsMergeableOrdering"));
            objc_msgSend(v34, "didChangeValueForKey:", CFSTR("listIDsMergeableOrdering"));
            -[RDStoreControllerMigrator_JSONProperties setMigratedAccount:](v29, "setMigratedAccount:", 1);
            v6 = v33;
            v5 = 0;
            v11 = v31;
          }
          else
          {
            v28 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            v4 = v34;
            v6 = v33;
            v11 = v31;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              sub_10068141C();

            v5 = 0;
          }

          v8 = v32;
          v9 = v30;
          goto LABEL_25;
        }
      }
    }
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1006813BC();
LABEL_25:

  }
}

- (void)migrateCRDTsInList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  RDStoreControllerMigrator_JSONProperties *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  _BYTE v51[128];

  v4 = a3;
  -[RDStoreControllerMigrator_JSONProperties setTotalListCount:](self, "setTotalListCount:", (char *)-[RDStoreControllerMigrator_JSONProperties totalListCount](self, "totalListCount") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitiveValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON")));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remObjectID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerMigrator_JSONProperties reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:listID:](self, "reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:listID:", v8, v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitiveValueForKey:", CFSTR("reminderIDsMergeableOrdering")));
      v48 = 0;
      v12 = objc_msgSend(objc_alloc((Class)REMCRMergeableOrderedSet), "initWithReplicaIDSource:serializedData:error:", v10, v11, &v48);
      v13 = v48;
      v14 = v13;
      if (v12)
      {
        v37 = self;
        v38 = v13;
        v40 = v11;
        v41 = v10;
        v42 = v7;
        v39 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "orderedSet"));
        v16 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v15, "count"));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v17 = v15;
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        if (v18)
        {
          v20 = v18;
          v21 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v45 != v21)
                objc_enumerationMutation(v17);
              v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
              v24 = objc_opt_class(REMObjectID, v19);
              if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
              {
                objc_msgSend(v16, "addObject:", v23);
              }
              else
              {
                v26 = objc_opt_class(NSString, v25);
                if ((objc_opt_isKindOfClass(v23, v26) & 1) != 0)
                {
                  v27 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v23);
                  if (v27)
                  {
                    v28 = objc_claimAutoreleasedReturnValue(+[REMReminder objectIDWithUUID:](REMReminder, "objectIDWithUUID:", v27));
                    objc_msgSend(v16, "addObject:", v28);
                  }
                  else
                  {
                    v28 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v50 = v23;
                      _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Failed to create NSUUID from item in legacyOrderedSet. Skipping {item: %@}", buf, 0xCu);
                    }
                  }

                }
              }
            }
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
          }
          while (v20);
        }

        v43 = v38;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[REMListStorage reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:](REMListStorage, "reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:", v16, &v43));
        v14 = v43;

        if (v29)
        {
          objc_msgSend(v4, "willChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
          objc_msgSend(v4, "setPrimitiveValue:forKey:", v29, CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
          objc_msgSend(v4, "didChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering_v2_JSON"));
          objc_msgSend(v4, "willChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering"));
          objc_msgSend(v4, "setPrimitiveValue:forKey:", 0, CFSTR("reminderIDsMergeableOrdering"));
          objc_msgSend(v4, "didChangeValueForKey:", CFSTR("reminderIDsMergeableOrdering"));
          -[RDStoreControllerMigrator_JSONProperties setMigratedListsCount:](v37, "setMigratedListsCount:", (char *)-[RDStoreControllerMigrator_JSONProperties migratedListsCount](v37, "migratedListsCount") + 1);
        }
        else
        {
          v36 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_100681540();

        }
        v7 = v42;
        v5 = 0;

        v11 = v40;
        v10 = v41;
        v12 = v39;
      }
      else
      {
        v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1006814E0();
      }

    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10068147C((uint64_t)v4, v14, v30, v31, v32, v33, v34, v35);
    }

  }
}

- (id)reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3 listID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)REMReplicaIDSource), "initWithAccountID:objectID:property:", v6, v5, CFSTR("reminderIDsMergeableOrdering"));

  return v7;
}

- (unint64_t)totalMigratedCount
{
  return self->_totalMigratedCount;
}

- (void)setTotalMigratedCount:(unint64_t)a3
{
  self->_totalMigratedCount = a3;
}

- (unint64_t)totalListCount
{
  return self->_totalListCount;
}

- (void)setTotalListCount:(unint64_t)a3
{
  self->_totalListCount = a3;
}

- (BOOL)migratedAccount
{
  return self->_migratedAccount;
}

- (void)setMigratedAccount:(BOOL)a3
{
  self->_migratedAccount = a3;
}

- (unint64_t)migratedListsCount
{
  return self->_migratedListsCount;
}

- (void)setMigratedListsCount:(unint64_t)a3
{
  self->_migratedListsCount = a3;
}

@end
