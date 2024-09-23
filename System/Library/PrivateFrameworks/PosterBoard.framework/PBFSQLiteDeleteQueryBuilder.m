@implementation PBFSQLiteDeleteQueryBuilder

- (PBFSQLiteDeleteQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteDeleteQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  PBFSQLiteDeleteQueryBuilder *result;
  void *v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteDeleteQueryBuilder;
    v6 = -[PBFSQLiteDeleteQueryBuilder init](&v11, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tableName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteDeleteQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (PBFSQLiteDeleteQueryBuilder *)_bs_set_crash_log_message();
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
  v5 = -[PBFSQLiteWhereClauseBuilder copy](self->_whereClauseBuilder, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

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

- (id)build
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DELETE FROM %@"), self->_tableName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFSQLiteWhereClauseBuilder build](self->_whereClauseBuilder, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PBFSQLiteWhereClauseBuilder build](self->_whereClauseBuilder, "build");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" WHERE %@"), v6);

  }
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(";"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteDeleteQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
