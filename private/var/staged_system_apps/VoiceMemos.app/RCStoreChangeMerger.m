@implementation RCStoreChangeMerger

- (RCStoreChangeMerger)initWithPersistentStore:(id)a3 transactionAuthorToIgnore:(id)a4 startingToken:(id)a5 viewContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RCStoreChangeMerger *v14;
  RCStoreChangeMerger *v15;
  NSMutableArray *v16;
  NSMutableArray *transactionsBuffer;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSEntityDescription *cloudRecordingEntity;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RCStoreChangeMerger;
  v14 = -[RCStoreChangeMerger init](&v24, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transactionAuthorToIgnore, a4);
    objc_storeStrong((id *)&v15->_currentHistoryToken, a5);
    objc_storeStrong((id *)&v15->_latestHistoryToken, a5);
    v16 = objc_opt_new(NSMutableArray);
    transactionsBuffer = v15->_transactionsBuffer;
    v15->_transactionsBuffer = v16;

    objc_storeStrong((id *)&v15->_viewContext, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentStoreCoordinator"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entitiesByName"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", RCCloudRecording_EntityName));
    cloudRecordingEntity = v15->_cloudRecordingEntity;
    v15->_cloudRecordingEntity = (NSEntityDescription *)v21;

  }
  return v15;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isRelevantTransactionAuthor:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "author"));
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_transactionAuthorToIgnore) ^ 1;

  return (char)self;
}

- (BOOL)_isBackgroundContextTransaction:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contextName"));
  v4 = objc_msgSend(v3, "isEqualToString:", kRCBackgroundContextName);

  return v4;
}

- (void)handleChange:(id)a3
{
  id v4;
  NSPersistentHistoryToken *v5;
  NSPersistentHistoryToken *latestHistoryToken;
  NSManagedObjectContext *v7;
  NSManagedObjectContext *v8;
  _QWORD *v9;
  NSManagedObjectContext *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  NSManagedObjectContext *v19;
  id v20;
  _QWORD v21[5];
  NSManagedObjectContext *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  id (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  if (-[NSPersistentHistoryToken compareToken:error:](self->_latestHistoryToken, "compareToken:error:", v4, 0) == (id)2)
  {
    v5 = (NSPersistentHistoryToken *)objc_msgSend(v4, "copy");
    latestHistoryToken = self->_latestHistoryToken;
    self->_latestHistoryToken = v5;

    if (!self->_changeNotificationDate)
    {
      v7 = self->_viewContext;
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = sub_10004A824;
      v28 = sub_10004A84C;
      v29 = 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10004A854;
      v21[3] = &unk_1001AC248;
      v21[4] = self;
      v8 = v7;
      v22 = v8;
      v23 = &v24;
      v9 = objc_retainBlock(v21);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10004AAC4;
      v18[3] = &unk_1001AC270;
      v18[4] = self;
      v10 = v8;
      v19 = v10;
      v11 = v9;
      v20 = v11;
      v12 = objc_retainBlock(v18);
      v13 = (void *)v25[5];
      v25[5] = (uint64_t)v12;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25[5] + 16))(v25[5], v14, v15, v16, v17);
      _Block_object_dispose(&v24, 8);

    }
  }

}

- (void)_mergeChangeIntoRelevantContexts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  NSManagedObjectContext *viewContext;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectIDNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  if (-[RCStoreChangeMerger _isRelevantTransactionAuthor:](self, "_isRelevantTransactionAuthor:", v4))
  {
    viewContext = self->_viewContext;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &viewContext, 1));
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v6, v7);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCStoreChangeMerger delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundContexts"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10004AD30;
          v15[3] = &unk_1001AB6E8;
          v16 = v6;
          v17 = v14;
          objc_msgSend(v14, "performBlock:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    goto LABEL_12;
  }
  if (-[RCStoreChangeMerger _isBackgroundContextTransaction:](self, "_isBackgroundContextTransaction:", v4))
  {
    viewContext = self->_viewContext;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &viewContext, 1));
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v6, v9);
LABEL_12:

  }
}

- (id)_nextTransactionAfterToken:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  NSMutableArray *transactionsBuffer;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  RCStoreChangeMerger *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;

  v8 = a3;
  v9 = a4;
  if (!-[NSMutableArray count](self->_transactionsBuffer, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", v8));
    objc_msgSend(v10, "setFetchBatchSize:", kDefaultFetchBatchSize);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeRequest:error:", v10, a5));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));
      v15 = objc_opt_class(NSArray, v14);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      {
        v36 = v12;
        v37 = v10;
        v38 = v9;
        v39 = v8;
        v40 = self;
        v35 = v13;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        obj = v13;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v43;
          v19 = kVMLogCategoryDefault;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v43 != v18)
                objc_enumerationMutation(obj);
              v21 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "token"));

              if (v22)
              {
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "changes"));
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
                if (v24)
                {
                  v25 = v24;
                  v26 = *(_QWORD *)v47;
                  while (2)
                  {
                    for (j = 0; j != v25; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v47 != v26)
                        objc_enumerationMutation(v23);
                      v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                      if (objc_msgSend(v28, "changeType") != (id)2)
                      {
                        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "changedObjectID"));

                        if (!v29)
                        {

                          goto LABEL_21;
                        }
                      }
                    }
                    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
                    if (v25)
                      continue;
                    break;
                  }
                }

                transactionsBuffer = v40->_transactionsBuffer;
                v31 = objc_msgSend(v21, "copy");
                -[NSMutableArray addObject:](transactionsBuffer, "addObject:", v31);
              }
              else
              {
LABEL_21:

                v32 = OSLogForCategory(v19);
                v31 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v52 = "-[RCStoreChangeMerger _nextTransactionAfterToken:context:error:]";
                  v53 = 2112;
                  v54 = v21;
                  _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s -- ERROR:  transaction is malformed:  %@", buf, 0x16u);
                }
              }

            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v17);
        }

        v9 = v38;
        v8 = v39;
        self = v40;
        v12 = v36;
        v10 = v37;
        v13 = v35;
      }

    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_transactionsBuffer, "firstObject"));
  if (v33)
    -[NSMutableArray removeObjectAtIndex:](self->_transactionsBuffer, "removeObjectAtIndex:", 0);

  return v33;
}

- (RCStoreChangeMergerDelegate)delegate
{
  return (RCStoreChangeMergerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudRecordingEntity, 0);
  objc_storeStrong((id *)&self->_changeNotificationDate, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_transactionsBuffer, 0);
  objc_storeStrong((id *)&self->_latestHistoryToken, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong((id *)&self->_transactionAuthorToIgnore, 0);
}

@end
