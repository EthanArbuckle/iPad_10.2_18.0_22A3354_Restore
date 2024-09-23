@implementation PBFSQLiteInsertQueryBuilder

- (PBFSQLiteInsertQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteInsertQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  uint64_t v9;
  NSMutableDictionary *insertDictionary;
  PBFSQLiteInsertQueryBuilder *result;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteInsertQueryBuilder;
    v6 = -[PBFSQLiteInsertQueryBuilder init](&v13, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      v9 = objc_opt_new();
      insertDictionary = v6->_insertDictionary;
      v6->_insertDictionary = (NSMutableDictionary *)v9;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tableName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteInsertQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (PBFSQLiteInsertQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_insertDictionary, 1);
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)appendInsertIntoColumnNamed:(id)a3 value:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  _NSStringFromPBFSQLiteObjectParameter(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_insertDictionary, "setObject:forKeyedSubscript:", v7, v6);

  return self;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *tableName;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_insertDictionary, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v10);
        -[NSMutableDictionary objectForKey:](self->_insertDictionary, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = (void *)MEMORY[0x1E0CB37A0];
  tableName = self->_tableName;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), tableName, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_insertDictionary, 0);
}

- (void)initWithTableName:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteInsertQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
