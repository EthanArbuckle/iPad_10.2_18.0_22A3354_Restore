@implementation REMNSPersistentHistoryTransaction

- (id)initWithPersistentHistoryTransaction:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  REMNSPersistentHistoryTransaction *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  NSString *v33;
  NSObject *v34;
  Class v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  REMNSPersistentHistoryTransaction *v45;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  NSObject *v57;
  _BYTE v58[128];

  v4 = a3;
  if (!v4)
  {
    v45 = 0;
    goto LABEL_34;
  }
  v5 = objc_alloc_init((Class)_REMNSPersistentHistoryTransactionStorage);
  v6 = objc_alloc((Class)REMNSPersistentHistoryToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
  v8 = objc_msgSend(v6, "initWithPersistentHistoryToken:", v7);
  objc_msgSend(v5, "setToken:", v8);

  objc_msgSend(v5, "setChanges:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  objc_msgSend(v5, "setTimestamp:", v9);

  objc_msgSend(v5, "setTransactionNumber:", objc_msgSend(v4, "transactionNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
  objc_msgSend(v5, "setStoreID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  objc_msgSend(v5, "setBundleID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "processID"));
  objc_msgSend(v5, "setProcessID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextName"));
  objc_msgSend(v5, "setContextName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
  objc_msgSend(v5, "setAuthor:", v14);

  v16 = -[REMNSPersistentHistoryTransaction initWithStorage:](self, "initWithStorage:", v5);
  if (!v16)
    goto LABEL_30;
  v17 = +[REMChangeTracking entityNamesToIncludeFromTrackingWithOptionProvider:](REMChangeTracking, "entityNamesToIncludeFromTrackingWithOptionProvider:", objc_opt_class(RDStoreController, v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changes"));
  v20 = v19;
  if (!v19)
    goto LABEL_29;
  v48 = v5;
  v49 = v4;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v19, "count")));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = v20;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (!v22)
    goto LABEL_25;
  v23 = v22;
  v24 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(_QWORD *)v53 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "changedObjectID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "entity"));

      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
      if (v29
        && (v30 = (void *)v29,
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name")),
            v32 = objc_msgSend(v51, "containsObject:", v31),
            v31,
            v30,
            (v32 & 1) != 0))
      {
        v33 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "managedObjectClassName"));
        v34 = v33;
        if (v33)
          v35 = NSClassFromString(v33);
        else
          v35 = 0;
        if ((objc_opt_respondsToSelector(v35, "conformsToREMChangeTrackingIdentifiable") & 1) != 0
          && (((uint64_t (*)(Class, const char *))-[objc_class methodForSelector:](v35, "methodForSelector:", "conformsToREMChangeTrackingIdentifiable"))(v35, "conformsToREMChangeTrackingIdentifiable") & 1) != 0)
        {
          v37 = objc_msgSend(objc_alloc((Class)REMNSPersistentHistoryChange), "initWithPersistentHistoryChange:", v26);
          v36 = v37;
          if (v37)
          {
            -[NSObject setInternal_ChangeTransaction:](v37, "setInternal_ChangeTransaction:", v16);
            objc_msgSend(v50, "addObject:", v36);
          }
        }
        else
        {
          v36 = os_log_create("com.apple.reminderkit", "default");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
            *(_DWORD *)buf = 138543362;
            v57 = v38;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Changed object does not conform to REMChangeTrackingIdentifiable is excluded from change tracking (%{public}@)", buf, 0xCu);

          }
        }
      }
      else
      {
        v34 = os_log_create("com.apple.reminderkit", "default");
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
        *(_DWORD *)buf = 138543362;
        v57 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Not an REM change tracking allowlisted entity, excluding this entity from change tracking? (%{public}@)", buf, 0xCu);
      }

LABEL_23:
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  }
  while (v23);
LABEL_25:

  v39 = objc_msgSend(v50, "count");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[REMNSPersistentHistoryTransaction storage](v16, "storage"));
  v41 = v40;
  if (v39)
    v42 = v50;
  else
    v42 = 0;
  objc_msgSend(v40, "setChanges:", v42);

  v5 = v48;
  v4 = v49;
  v20 = v47;
LABEL_29:

LABEL_30:
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[REMNSPersistentHistoryTransaction storage](v16, "storage"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "changes"));

  if (!v44)
  {

    v16 = 0;
  }
  self = v16;

  v45 = self;
LABEL_34:

  return v45;
}

@end
