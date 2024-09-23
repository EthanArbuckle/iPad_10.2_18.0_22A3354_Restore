@implementation QLSqliteDatabase(SqliteHelpers_Internal)

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D54AE000, v3, v4, "Database - While finalizing statement, error when statement last was executed : (%ld) %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D54AE000, v3, v4, "QLSqliteDatabase: While finalizing statement, error when statement last was executed  : (%ld) %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_finalizeStatement:()SqliteHelpers_Internal .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "finalize %p", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_databaseCorrupted
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "corrupted database", a5, a6, a7, a8, 0);
}

@end
