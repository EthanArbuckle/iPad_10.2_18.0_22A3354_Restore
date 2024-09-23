@implementation PBFSQLiteCreateTableQueryBuilder

- (PBFSQLiteCreateTableQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteCreateTableQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  uint64_t v9;
  NSMutableArray *columns;
  PBFSQLiteCreateTableQueryBuilder *result;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PBFSQLiteCreateTableQueryBuilder;
    v6 = -[PBFSQLiteCreateTableQueryBuilder init](&v13, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      tableName = v6->_tableName;
      v6->_tableName = (NSString *)v7;

      v9 = objc_opt_new();
      columns = v6->_columns;
      v6->_columns = (NSMutableArray *)v9;

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("tableName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteCreateTableQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (PBFSQLiteCreateTableQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_columns, 1);
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(_BYTE *)(v4 + 18) = self->_isTemporary;
  *(_BYTE *)(v4 + 17) = self->_createIfNotExists;
  *(_BYTE *)(v4 + 16) = self->_isTypeCheckingStrict;
  return (id)v4;
}

- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4
{
  return -[PBFSQLiteCreateTableQueryBuilder appendColumnNamed:type:constraints:](self, "appendColumnNamed:type:constraints:", a3, a4, 0);
}

- (id)appendColumnNamed:(id)a3 type:(unint64_t)a4 constraints:(unint64_t)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v9 = v8;
  if (a4 <= 4)
    objc_msgSend(v8, "appendFormat:", off_1E86F6EB8[a4]);
  if (!a5)
    goto LABEL_8;
  if ((a5 & 4) == 0)
  {
    if ((a5 & 2) == 0)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(v9, "appendFormat:", CFSTR(" NOT NULL"));
    if ((a5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v9, "appendFormat:", CFSTR(" PRIMARY KEY"));
  if ((a5 & 2) != 0)
    goto LABEL_10;
LABEL_6:
  if ((a5 & 1) != 0)
LABEL_7:
    objc_msgSend(v9, "appendFormat:", CFSTR(" UNIQUE"));
LABEL_8:
  -[NSMutableArray addObject:](self->_columns, "addObject:", v9);

  return self;
}

- (id)build
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSString *tableName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[PBFSQLiteCreateTableQueryBuilder isTemporary](self, "isTemporary"))
  {
    objc_msgSend(CFSTR("CREATE"), "stringByAppendingString:", CFSTR(" TEMPORARY"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("CREATE");
  }
  if (-[PBFSQLiteCreateTableQueryBuilder createIfNotExists](self, "createIfNotExists"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR(" IF NOT EXISTS"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v4;
  }
  v5 = (void *)MEMORY[0x1E0CB37A0];
  tableName = self->_tableName;
  -[NSMutableArray componentsJoinedByString:](self->_columns, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ TABLE %@(%@)"), v3, tableName, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PBFSQLiteCreateTableQueryBuilder isTypeCheckingStrict](self, "isTypeCheckingStrict"))
    objc_msgSend(v8, "appendString:", CFSTR(" STRICT"));
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "stringByAppendingString:", CFSTR(";"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BOOL)isTypeCheckingStrict
{
  return self->_isTypeCheckingStrict;
}

- (void)setIsTypeCheckingStrict:(BOOL)a3
{
  self->_isTypeCheckingStrict = a3;
}

- (BOOL)createIfNotExists
{
  return self->_createIfNotExists;
}

- (void)setCreateIfNotExists:(BOOL)a3
{
  self->_createIfNotExists = a3;
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (void)setIsTemporary:(BOOL)a3
{
  self->_isTemporary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columns, 0);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteCreateTableQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
