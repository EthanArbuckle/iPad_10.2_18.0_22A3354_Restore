@implementation CKDatabaseOperation

- (id)ic_loggingValues
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDatabaseOperation;
  v3 = -[CKDatabaseOperation ic_loggingValues](&v10, "ic_loggingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabaseOperation database](self, "database"));
  v7 = CKDatabaseScopeString(objc_msgSend(v6, "databaseScope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("databaseScope"));

  return v5;
}

@end
