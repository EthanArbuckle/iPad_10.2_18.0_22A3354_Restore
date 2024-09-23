@implementation UNCSectionInfo(DataProviders)

+ (void)defaultSectionInfoForSection:()DataProviders .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_2499A5000, v5, OS_LOG_TYPE_ERROR, "Encountered error obtaining application record for section %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
