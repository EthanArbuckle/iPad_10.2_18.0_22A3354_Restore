@implementation WebBookmark(Internal)

- (void)initWithSQLiteStatement:()Internal deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "wb_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v5, v6, "Error reading bookmark local attributes: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)initWithSQLiteStatement:()Internal deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:.cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "wb_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v5, v6, "Error reading bookmark extra attributes: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_setID:()Internal .cold.1(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_211022000, a2, OS_LOG_TYPE_ERROR, "Setting bookmark identifier to its parent identifier %ld", (uint8_t *)&v2, 0xCu);
}

@end
