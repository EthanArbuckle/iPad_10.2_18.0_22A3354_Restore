@implementation WBSSQLiteStatementCache

- (id)statementForQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WBSSQLiteStatementCache cachedStatementForQuery:](self, "cachedStatementForQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[WBSSQLiteStatementCache _createStatementForQuery:error:](self, "_createStatementForQuery:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[WBSSQLiteStatementCache setCachedStatement:forQuery:](self, "setCachedStatement:forQuery:", v7, v6);
  }

  return v7;
}

- (id)cachedStatementForQuery:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_statements, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statements, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_createStatementForQuery:(id)a3 error:(id *)a4
{
  id v6;
  WBSSQLiteStatement *v7;
  WBSSQLiteStatement *v8;
  WBSSQLiteStatement *v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[WBSSQLiteStatement initWithDatabase:query:]([WBSSQLiteStatement alloc], "initWithDatabase:query:", self->_database, v6);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSSQLiteStatementCache _createStatementForQuery:error:]");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatementCache _createStatementForQuery:error:].cold.1((uint64_t)v6, v11, v13, v10);
    }

  }
  return v8;
}

- (WBSSQLiteStatementCache)initWithDatabase:(id)a3
{
  id v5;
  WBSSQLiteStatementCache *v6;
  WBSSQLiteStatementCache *v7;
  uint64_t v8;
  NSMutableDictionary *statements;
  WBSSQLiteStatementCache *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSQLiteStatementCache;
  v6 = -[WBSSQLiteStatementCache init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    statements = v7->_statements;
    v7->_statements = (NSMutableDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (WBSSQLiteStatementCache)init
{

  return 0;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_statements, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](self->_statements, "removeAllObjects");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSSQLiteStatementCache;
  -[WBSSQLiteStatementCache dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_createStatementForQuery:(uint8_t *)buf error:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to create statement '%@': %{public}@", buf, 0x16u);

}

@end
