@implementation PBFSQLiteDropTableQueryBuilder

- (PBFSQLiteDropTableQueryBuilder)initWithTableName:(id)a3
{
  id v4;
  void *v5;
  PBFSQLiteDropTableQueryBuilder *v6;
  uint64_t v7;
  NSString *tableName;
  PBFSQLiteDropTableQueryBuilder *result;
  void *v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PBFSQLiteDropTableQueryBuilder;
    v6 = -[PBFSQLiteDropTableQueryBuilder init](&v11, sel_init);
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
      -[PBFSQLiteDropTableQueryBuilder initWithTableName:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (PBFSQLiteDropTableQueryBuilder *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTableName:", self->_tableName);
  *((_BYTE *)result + 8) = self->_dropIfNotExists;
  return result;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DROP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PBFSQLiteDropTableQueryBuilder dropIfNotExists](self, "dropIfNotExists"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" IF EXISTS"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), self->_tableName);
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(";"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BOOL)dropIfNotExists
{
  return self->_dropIfNotExists;
}

- (void)setDropIfNotExists:(BOOL)a3
{
  self->_dropIfNotExists = a3;
}

- (void).cxx_destruct
{
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFSQLiteDropTableQueryBuilder initWithTableName:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_9_0();
}

@end
