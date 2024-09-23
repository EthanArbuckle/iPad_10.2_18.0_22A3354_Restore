@implementation BRCPackageItem(FPFSAdditions)

- (void)_initWithURL:()FPFSAdditions inPackage:forItem:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_230455000, v1, (os_log_type_t)0x90u, "[ERROR] Failed to get canonical path for pkg item in %@%@", v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
