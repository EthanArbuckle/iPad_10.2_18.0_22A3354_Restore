@implementation TRISQLiteCKDatabaseFailureInjectionDelegate

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithErrorForAllOperations:(id)a3
{
  id v5;
  TRISQLiteCKDatabaseFailureInjectionDelegate *v6;
  uint64_t v7;
  NSMutableArray *queryErrors;
  uint64_t v9;
  NSMutableArray *fetchErrors;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabaseFailureInjectionDelegate.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRISQLiteCKDatabaseFailureInjectionDelegate;
  v6 = -[TRISQLiteCKDatabaseFailureInjectionDelegate init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    queryErrors = v6->_queryErrors;
    v6->_queryErrors = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    fetchErrors = v6->_fetchErrors;
    v6->_fetchErrors = (NSMutableArray *)v9;

  }
  return v6;
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithQueryErrors:(id)a3 fetchErrors:(id)a4
{
  id v6;
  id v7;
  TRISQLiteCKDatabaseFailureInjectionDelegate *v8;
  uint64_t v9;
  NSMutableArray *queryErrors;
  uint64_t v11;
  NSMutableArray *fetchErrors;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRISQLiteCKDatabaseFailureInjectionDelegate;
  v8 = -[TRISQLiteCKDatabaseFailureInjectionDelegate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    queryErrors = v8->_queryErrors;
    v8->_queryErrors = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "mutableCopy");
    fetchErrors = v8->_fetchErrors;
    v8->_fetchErrors = (NSMutableArray *)v11;

  }
  return v8;
}

- (BOOL)shouldProcessQueryOperation:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[TRISQLiteCKDatabaseFailureInjectionDelegate queryErrors](self, "queryErrors");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[TRISQLiteCKDatabaseFailureInjectionDelegate queryErrors](self, "queryErrors"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    -[TRISQLiteCKDatabaseFailureInjectionDelegate queryErrors](self, "queryErrors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRISQLiteCKDatabaseFailureInjectionDelegate queryErrors](self, "queryErrors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    TRILogCategory_XCTest();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Query operation %@ being rejected with error %@", buf, 0x16u);
    }

    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabaseFailureInjectionDelegate.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    }
    v16 = *a4;
    *a4 = v13;

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)shouldProcessFetchOperation:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[TRISQLiteCKDatabaseFailureInjectionDelegate fetchErrors](self, "fetchErrors");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[TRISQLiteCKDatabaseFailureInjectionDelegate fetchErrors](self, "fetchErrors"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    -[TRISQLiteCKDatabaseFailureInjectionDelegate fetchErrors](self, "fetchErrors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRISQLiteCKDatabaseFailureInjectionDelegate fetchErrors](self, "fetchErrors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    TRILogCategory_XCTest();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Fetch operation %@ being rejected with error %@", buf, 0x16u);
    }

    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabaseFailureInjectionDelegate.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    }
    v16 = *a4;
    *a4 = v13;

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  TRISQLiteCKDatabaseFailureInjectionDelegate *v10;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("queryErrors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("fetchErrors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TRISQLiteCKDatabaseFailureInjectionDelegate initWithQueryErrors:fetchErrors:](self, "initWithQueryErrors:fetchErrors:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TRISQLiteCKDatabaseFailureInjectionDelegate queryErrors](self, "queryErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queryErrors"));

  -[TRISQLiteCKDatabaseFailureInjectionDelegate fetchErrors](self, "fetchErrors");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fetchErrors"));

}

- (NSMutableArray)queryErrors
{
  return self->_queryErrors;
}

- (void)setQueryErrors:(id)a3
{
  objc_storeStrong((id *)&self->_queryErrors, a3);
}

- (NSMutableArray)fetchErrors
{
  return self->_fetchErrors;
}

- (void)setFetchErrors:(id)a3
{
  objc_storeStrong((id *)&self->_fetchErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchErrors, 0);
  objc_storeStrong((id *)&self->_queryErrors, 0);
}

@end
