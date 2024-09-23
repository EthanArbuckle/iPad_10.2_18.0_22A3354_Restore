@implementation WFCoherenceDatabaseResult

- (WFCoherenceDatabaseResult)initWithDatabase:(id)a3 libraryQuery:(id)a4
{
  id v6;
  id v7;
  WFCoherenceDatabaseResult *v8;
  WFCoherenceDatabaseResult *v9;
  WFCoherenceDatabaseResult *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFCoherenceDatabaseResult;
  v8 = -[WFDatabaseResult _init](&v12, sel__init);
  v9 = v8;
  if (v8)
  {
    -[WFDatabaseResult setDatabase:](v8, "setDatabase:", v6);
    objc_storeStrong((id *)&v9->_libraryQuery, a4);
    objc_msgSend(v6, "startObservingChangesForResult:", v9);
    v10 = v9;
  }

  return v9;
}

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[WFCoherenceDatabaseResult libraryQuery](self, "libraryQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    -[WFCoherenceDatabaseResult libraryQuery](self, "libraryQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabaseResult database](self, "database");
    v14 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v14;
    if (v14)
      v15 = *(void **)(v14 + 120);
    else
      v15 = 0;
    v11 = v15;
    -[WFDatabaseResult database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performReturningShortcutsIn:database:error:", v11, v12, a3);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v16 = 0;
      return v16;
    }
    -[WFCoherenceDatabaseResult libraryQuery](self, "libraryQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabaseResult database](self, "database");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 120);
    else
      v10 = 0;
    v11 = v10;
    -[WFDatabaseResult database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performReturningCollectionsIn:database:error:", v11, v12, a3);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v13;

  return v16;
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
  -[WFCoherenceDatabaseResult libraryQuery](self, "libraryQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, query: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFLibraryQuery)libraryQuery
{
  return self->_libraryQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryQuery, 0);
}

@end
