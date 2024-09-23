@implementation PBFSQLiteSelectQueryBuilder

- (PBFSQLiteSelectQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteSelectQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  uint64_t v9;
  NSMutableArray *columnsToSelect;
  uint64_t v11;
  NSMutableArray *orderByColumns;
  PBFSQLiteSelectQueryBuilder *result;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)PBFSQLiteSelectQueryBuilder;
    v6 = -[PBFSQLiteSelectQueryBuilder init](&v15, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      v9 = objc_opt_new();
      columnsToSelect = v6->_columnsToSelect;
      v6->_columnsToSelect = (NSMutableArray *)v9;

      v11 = objc_opt_new();
      orderByColumns = v6->_orderByColumns;
      v6->_orderByColumns = (NSMutableArray *)v11;

      v6->_selectAllColumns = 1;
    }

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tableName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteSelectQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (PBFSQLiteSelectQueryBuilder *)_bs_set_crash_log_message();
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
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_columnsToSelect, 1);
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_orderByColumns, 1);
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[PBFSQLiteWhereClauseBuilder copy](self->_whereClauseBuilder, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (id)selectColumnNamed:(id)a3
{
  self->_selectAllColumns = 0;
  -[NSMutableArray addObject:](self->_columnsToSelect, "addObject:", a3);
  return self;
}

- (id)selectColumnNamed:(id)a3 as:(id)a4
{
  NSMutableArray *columnsToSelect;
  void *v6;

  self->_selectAllColumns = 0;
  columnsToSelect = self->_columnsToSelect;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ as '%@'"), a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](columnsToSelect, "addObject:", v6);

  return self;
}

- (id)selectAllColumns
{
  self->_selectAllColumns = 1;
  -[NSMutableArray removeAllObjects](self->_columnsToSelect, "removeAllObjects");
  return self;
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

- (id)appendOrderBy:(id)a3 comparison:(int64_t)a4
{
  NSMutableArray *orderByColumns;
  const __CFString *v6;
  void *v7;

  if (a4)
  {
    orderByColumns = self->_orderByColumns;
    v6 = CFSTR("DESC");
    if (a4 == -1)
      v6 = CFSTR("ASC");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](orderByColumns, "addObject:", v7);

  }
  return self;
}

- (id)build
{
  void *v3;
  _BOOL4 selectAllColumns;
  __CFString *v5;
  void *v6;
  PBFSQLiteWhereClauseBuilder *whereClauseBuilder;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  selectAllColumns = self->_selectAllColumns;
  if (self->_selectAllColumns)
  {
    v5 = CFSTR("*");
  }
  else
  {
    -[NSMutableArray componentsJoinedByString:](self->_columnsToSelect, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v5, self->_tableName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!selectAllColumns)

  whereClauseBuilder = self->_whereClauseBuilder;
  if (whereClauseBuilder)
  {
    -[PBFSQLiteWhereClauseBuilder build](whereClauseBuilder, "build");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (-[NSMutableArray count](self->_orderByColumns, "count"))
  {
    -[NSMutableArray componentsJoinedByString:](self->_orderByColumns, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" ORDER BY %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(";"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whereClauseBuilder, 0);
  objc_storeStrong((id *)&self->_orderByColumns, 0);
  objc_storeStrong((id *)&self->_columnsToSelect, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteSelectQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
