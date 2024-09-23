@implementation CKFetchDatabaseChangesOperation

- (id)ic_loggingValues
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKFetchDatabaseChangesOperation;
  v3 = -[CKFetchDatabaseChangesOperation ic_loggingValues](&v11, "ic_loggingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchDatabaseChangesOperation previousServerChangeToken](self, "previousServerChangeToken"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchDatabaseChangesOperation previousServerChangeToken](self, "previousServerChangeToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));

  }
  else
  {
    v9 = CFSTR("(none)");
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("serverChangeToken"));

  return v5;
}

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchDatabaseChangesOperation;
  -[CKFetchDatabaseChangesOperation ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031](&v3, "ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031");
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](self, "setRecordZoneWithIDChangedBlock:", 0);
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:](self, "setRecordZoneWithIDWasDeletedBlock:", 0);
  -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:](self, "setFetchDatabaseChangesCompletionBlock:", 0);
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKFetchDatabaseChangesOperation;
}

@end
