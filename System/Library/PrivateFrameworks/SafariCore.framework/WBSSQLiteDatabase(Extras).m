@implementation WBSSQLiteDatabase(Extras)

- (void)tryToPerformTransactionInBlock:()Extras .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Failed to commit transaction: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

- (void)tryToPerformTransactionInBlock:()Extras .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Failed to rollback transaction: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

- (void)tryToPerformTransactionInBlock:()Extras .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Failed to begin transaction: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkIntegrity
{
  uint64_t v5;

  v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed database integrity check on %@: %@", buf, 0x16u);

  OUTLINED_FUNCTION_0_3();
}

@end
