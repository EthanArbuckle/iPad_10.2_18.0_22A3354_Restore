@implementation USUsageQuerying(Biome)

+ (void)_completion:()Biome options:.cold.1(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to query Biome for usage reports with options %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_7();
}

@end
