@implementation QLSqliteDatabase(SqliteHelpers)

- (void)beginTransaction
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_1D54AE000, v0, v1, "Begin transaction error: %s (%i)", v2, v3);
  OUTLINED_FUNCTION_5();
}

- (void)endTransaction
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_1D54AE000, v0, v1, "End transaction error: %s (%i)", v2, v3);
  OUTLINED_FUNCTION_5();
}

- (void)executeWithCallback:()SqliteHelpers context:rollbackOnError:sql:arguments:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1D54AE000, v0, (uint64_t)v0, "sqlite_exec %p %s", v1);
  OUTLINED_FUNCTION_5();
}

- (void)prepareStatement:()SqliteHelpers .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "prepare statement %p", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_5();
}

- (void)prepareStatement:()SqliteHelpers .cold.2()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_1D54AE000, v0, (uint64_t)v0, "sqlite3_prepare %p %s", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_cachedStatementForKey:()SqliteHelpers .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "found cached prepared statement %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.1(void *a1, int a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", sqlite3_errstr(a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1D54AE000, v4, OS_LOG_TYPE_ERROR, "sqliteCrappedOut about to be called for %p with retval %@", v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "stepStatement %p (YES)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)stepStatement:()SqliteHelpers didReturnData:.cold.4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v1, "stringWithUTF8String:", sqlite3_errstr(4));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1D54AE000, v4, v5, "stepStatement %p (NO) with retval %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)setSqliteCacheSize:()SqliteHelpers .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Database - Setting cache size to %ld pages.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
