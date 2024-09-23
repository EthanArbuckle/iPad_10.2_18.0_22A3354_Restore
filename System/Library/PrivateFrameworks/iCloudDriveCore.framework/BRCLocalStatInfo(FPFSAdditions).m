@implementation BRCLocalStatInfo(FPFSAdditions)

- (void)_updateStatAliasMeta:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: aliasItem.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: nobody should import an item from a fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: nobody should import an item from a BR Alias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithImportObject:()FPFSAdditions error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Unexpected import object %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)_finderTagsFromImportObject:()FPFSAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v6, "[DEBUG] read tags: [%@]%@", (uint8_t *)&v7);

}

+ (void)_finderTagsFromImportObject:()FPFSAdditions .cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] failed to fetch tags: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_updateStatMetaFromServer:()FPFSAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_aliasTarget || [_aliasTarget isEqualToString:st.aliasTarget]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateFromImportObject:()FPFSAdditions onlyContentDependentProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] dropping tags%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)clearBouncedName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Clear bounced name because there is no item at the unbounced location%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
