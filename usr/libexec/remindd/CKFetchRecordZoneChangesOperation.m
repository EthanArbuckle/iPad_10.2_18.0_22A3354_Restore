@implementation CKFetchRecordZoneChangesOperation

- (id)ic_loggingValues
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKFetchRecordZoneChangesOperation;
  v3 = -[CKFetchRecordZoneChangesOperation ic_loggingValues](&v11, "ic_loggingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation configurationsByRecordZoneID](self, "configurationsByRecordZoneID"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006FDD8;
  v9[3] = &unk_1007D9EC0;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (id)ic_shortLoggingDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation operationID](self, "operationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v6));

  return v7;
}

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesOperation;
  -[CKFetchRecordZoneChangesOperation ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031](&v3, "ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031");
  -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](self, "setRecordWasChangedBlock:", 0);
  -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](self, "setRecordWithIDWasDeletedBlock:", 0);
  -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:](self, "setFetchRecordZoneChangesCompletionBlock:", 0);
  -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:](self, "setRecordZoneFetchCompletionBlock:", 0);
  -[CKFetchRecordZoneChangesOperation setRecordZoneChangeTokensUpdatedBlock:](self, "setRecordZoneChangeTokensUpdatedBlock:", 0);
}

- (BOOL)ic_intersectsRecordZoneIDSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation recordZoneIDs](self, "recordZoneIDs"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation recordZoneIDs](self, "recordZoneIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  if (v4)
    v8 = v4;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v9 = v8;
  v10 = objc_msgSend(v7, "intersectsSet:", v8);

  return v10;
}

- (BOOL)ic_shouldDependOnCKFetchRecordZoneChangesOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountOverrideInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "container"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountOverrideInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountID"));

  if ((v9 == v14 || objc_msgSend(v9, "isEqual:", v14))
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation database](self, "database")),
        v16 = objc_msgSend(v15, "databaseScope"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database")),
        v18 = objc_msgSend(v17, "databaseScope"),
        v17,
        v15,
        v16 == v18))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordZoneIDs"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordZoneIDs"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    }

    v22 = -[CKFetchRecordZoneChangesOperation ic_intersectsRecordZoneIDSet:](self, "ic_intersectsRecordZoneIDSet:", v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKFetchRecordZoneChangesOperation;
}

@end
