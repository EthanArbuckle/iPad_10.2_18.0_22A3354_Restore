@implementation NSPersistentHistoryTransaction

- (id)bc_changeTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_28D2C0[a3];
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unexpected NSPersistentHistoryChangeType."));
  return 0;
}

- (void)bc_getManagedObjectsWith:(id)a3 entityName:(id)a4 inserted:(id *)a5 updated:(id *)a6 tombstones:(id *)a7
{
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSPersistentHistoryTransaction *v15;
  id v16;
  __int128 v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSPersistentHistoryTransaction *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  __int128 v42;
  NSPersistentHistoryTransaction *v43;
  id obj;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t v58[128];
  uint8_t buf[4];
  NSPersistentHistoryTransaction *v60;
  __int16 v61;
  int64_t v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;

  v9 = a3;
  v51 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changes](self, "changes"));
  v11 = objc_msgSend(v10, "count");
  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v50 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = BCRemoteManagedObjectIDMonitorLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction timestamp](self, "timestamp"));
    v15 = (NSPersistentHistoryTransaction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
    *(_DWORD *)buf = 138544130;
    v60 = v15;
    v61 = 2048;
    v62 = -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber");
    v63 = 2048;
    v64 = v11;
    v65 = 2112;
    v66 = v51;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "bc_getManagedObjectsWith %{public}@ Processing transaction#:(%lld) changeCount:%lu entityName:%@", buf, 0x2Au);

  }
  v43 = self;
  -[NSPersistentHistoryTransaction bc_logChanges](self, "bc_logChanges");
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v10;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v53;
    *(_QWORD *)&v17 = 138412290;
    v42 = v17;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(obj);
        v21 = *(NSPersistentHistoryTransaction **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v20);
        v22 = objc_autoreleasePoolPush();
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changedObjectID](v21, "changedObjectID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "entity"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
        v26 = objc_msgSend(v25, "isEqualToString:", v51);

        if (!v26)
        {
          v33 = BCRemoteManagedObjectIDMonitorLog();
          v28 = objc_claimAutoreleasedReturnValue(v33);
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          v34 = objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changedObjectID](v21, "changedObjectID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changedObjectID](v21, "changedObjectID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entity"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
          *(_DWORD *)buf = 138412802;
          v60 = v43;
          v61 = 2112;
          v62 = (int64_t)v34;
          v63 = 2112;
          v64 = v37;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%@ Skipping history transaction id:%@ with entity (%@)", buf, 0x20u);

          goto LABEL_16;
        }
        if (-[NSPersistentHistoryTransaction changeType](v21, "changeType")
          && -[NSPersistentHistoryTransaction changeType](v21, "changeType") != (char *)&dword_0 + 1)
        {
          v28 = objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction tombstone](v21, "tombstone"));
          if (!v28)
          {
            v40 = BCRemoteManagedObjectIDMonitorLog();
            v34 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              v60 = v21;
              _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "bc_getManagedObjectsWith Change contains deletion but no tombstone. Change: %@", buf, 0xCu);
            }
LABEL_16:

            goto LABEL_25;
          }
          objc_msgSend(v49, "addObject:", v28);
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changedObjectID](v21, "changedObjectID", v42));
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "existingObjectWithID:error:", v27, 0));

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject entity](v28, "entity"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
          v31 = objc_msgSend(v30, "isEqualToString:", v51);

          if (v31)
          {
            if (-[NSPersistentHistoryTransaction changeType](v21, "changeType"))
              v32 = v50;
            else
              v32 = v48;
            objc_msgSend(v32, "addObject:", v28);
          }
          else
          {
            v38 = BCRemoteManagedObjectIDMonitorLog();
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              sub_1B45EC(v56, v21, &v57, v39);

          }
          objc_msgSend(v9, "refreshObject:mergeChanges:", v28, 0);
        }
LABEL_25:

        objc_msgSend(v9, "processPendingChanges");
        objc_autoreleasePoolPop(v22);
        *a6 = objc_retainAutorelease(v50);
        *a5 = objc_retainAutorelease(v48);
        *a7 = objc_retainAutorelease(v49);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v18 = v41;
    }
    while (v41);
  }

}

- (void)bc_logChanges
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction changes](self, "changes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentHistoryTransaction bc_changeTypeToString:](self, "bc_changeTypeToString:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "changeType")));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = BCRemoteManagedObjectIDMonitorLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1B4660(self);

}

@end
