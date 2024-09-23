@implementation SDSeedProgramMigrator

+ (BOOL)fixupSeedProgramSettings
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[SDSeedingLogging migrateHandle](SDSeedingLogging, "migrateHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[SDSeedProgramMigrator fixupSeedProgramSettings].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

+ (BOOL)_enrollInSeedProgramFromCookie
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[SDSeedingLogging migrateHandle](SDSeedingLogging, "migrateHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[SDSeedProgramMigrator _enrollInSeedProgramFromCookie].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

+ (BOOL)_enrollInSeedProgram:(int64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  +[SDSeedingLogging migrateHandle](SDSeedingLogging, "migrateHandle", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[SDSeedProgramMigrator _enrollInSeedProgram:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

+ (void)fixupSeedProgramSettings
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "fixup is unsupported on this platform.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_enrollInSeedProgramFromCookie
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "cookie enrollment is unsupported on this platform.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_enrollInSeedProgram:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "named enrollment not supported on this platform.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

@end
