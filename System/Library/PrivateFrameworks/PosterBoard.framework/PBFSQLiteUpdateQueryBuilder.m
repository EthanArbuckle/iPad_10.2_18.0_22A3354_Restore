@implementation PBFSQLiteUpdateQueryBuilder

- (PBFSQLiteUpdateQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteUpdateQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  uint64_t v9;
  NSMutableArray *updateColumns;
  PBFSQLiteUpdateQueryBuilder *result;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteUpdateQueryBuilder;
    v6 = -[PBFSQLiteUpdateQueryBuilder init](&v13, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      v9 = objc_opt_new();
      updateColumns = v6->_updateColumns;
      v6->_updateColumns = (NSMutableArray *)v9;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tableName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteUpdateQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (PBFSQLiteUpdateQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_updateColumns, 1);
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[PBFSQLiteWhereClauseBuilder copy](self->_whereClauseBuilder, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)setWhereClause:(id)a3
{
  PBFSQLiteWhereClauseBuilder *v4;
  PBFSQLiteWhereClauseBuilder *whereClauseBuilder;

  v4 = (PBFSQLiteWhereClauseBuilder *)objc_msgSend(a3, "copy");
  whereClauseBuilder = self->_whereClauseBuilder;
  self->_whereClauseBuilder = v4;

  return self;
}

- (id)appendUpdateColumnName:(id)a3 toValue:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *updateColumns;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteQueryBuilder.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName"));

  }
  updateColumns = self->_updateColumns;
  v10 = (void *)MEMORY[0x1E0CB3940];
  _NSStringFromPBFSQLiteObjectParameter(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](updateColumns, "addObject:", v12);

  return self;
}

- (id)build
{
  void *v3;
  NSString *tableName;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  tableName = self->_tableName;
  -[NSMutableArray componentsJoinedByString:](self->_updateColumns, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UPDATE %@ SET(%@)"), tableName, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFSQLiteWhereClauseBuilder build](self->_whereClauseBuilder, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[PBFSQLiteWhereClauseBuilder build](self->_whereClauseBuilder, "build");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" WHERE %@"), v9);

  }
  v10 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v10, "stringByAppendingString:", CFSTR(";"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
  objc_storeStrong((id *)&self->_updateColumns, 0);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteUpdateQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
