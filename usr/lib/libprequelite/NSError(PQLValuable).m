@implementation NSError(PQLValuable)

- (void)sqliteBind:()PQLValuable index:
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D825FB2C]();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v9)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v10 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D4668000, v10, OS_LOG_TYPE_DEFAULT, "warning: failed to archive error object %@", buf, 0xCu);
    }
  }
  v11 = objc_retainAutorelease(v8);
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v7);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (sqlite3_column_type(a3, iCol) != 4)
    return 0;
  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = sqlite3_column_blob(a3, iCol);
  objc_msgSend(v6, "dataWithBytes:length:", v7, sqlite3_column_bytes(a3, iCol));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v11 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1D4668000, v11, OS_LOG_TYPE_DEFAULT, "warning: failed to unarchive error object %@", buf, 0xCu);
    }
  }

  return v9;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  void *v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (sqlite3_value_type(a3) != 4)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = sqlite3_value_blob(a3);
  objc_msgSend(v4, "dataWithBytes:length:", v5, sqlite3_value_bytes(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v9 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1D4668000, v9, OS_LOG_TYPE_DEFAULT, "warning: failed to unarchive error object %@", buf, 0xCu);
    }
  }

  return v7;
}

@end
