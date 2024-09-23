@implementation WFCoreDataDatabaseResult

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v9;

  -[WFDatabaseResult database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "descriptorsForCoreDataResult:state:error:", self, &v9, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  -[WFDatabaseResult setState:](self, "setState:", v7);
  return v6;
}

- (WFCoreDataDatabaseResultFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4 relationshipKeysAffectingDescriptors:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFCoreDataDatabaseResultFetchRequestOperation *v11;
  WFCoreDataDatabaseResult *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WFCoreDataDatabaseResultFetchRequestOperation initWithFetchRequest:relationshipKeysAffectingDescriptors:]([WFCoreDataDatabaseResultFetchRequestOperation alloc], "initWithFetchRequest:relationshipKeysAffectingDescriptors:", v9, v8);

  v12 = -[WFCoreDataDatabaseResult initWithDatabase:fetchOperation:](self, "initWithDatabase:fetchOperation:", v10, v11);
  return v12;
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchOperation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFCoreDataDatabaseResult *v10;
  WFCoreDataDatabaseResult *v11;
  WFCoreDataDatabaseResult *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchOperation"));

LABEL_3:
  v10 = -[WFDatabaseResult _init](self, "_init");
  v11 = v10;
  if (v10)
  {
    WFDatabaseResultCommonInit(v10);
    -[WFDatabaseResult setDatabase:](v11, "setDatabase:", v7);
    -[WFCoreDataDatabaseResult setFetchOperation:](v11, "setFetchOperation:", v9);
    objc_msgSend(v7, "startObservingChangesForResult:", v11);
    v12 = v11;
  }

  return v11;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperation, 0);
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  WFCoreDataDatabaseResultFetchRequestOperation *v8;
  void *v9;
  WFCoreDataDatabaseResultFetchRequestOperation *v10;
  WFCoreDataDatabaseResult *v11;

  v6 = a4;
  v7 = a3;
  v8 = [WFCoreDataDatabaseResultFetchRequestOperation alloc];
  v9 = (void *)objc_opt_new();
  v10 = -[WFCoreDataDatabaseResultFetchRequestOperation initWithFetchRequest:relationshipKeysAffectingDescriptors:](v8, "initWithFetchRequest:relationshipKeysAffectingDescriptors:", v6, v9);

  v11 = -[WFCoreDataDatabaseResult initWithDatabase:fetchOperation:](self, "initWithDatabase:fetchOperation:", v7, v10);
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataDatabaseResult fetchOperation](self, "fetchOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, operation: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
