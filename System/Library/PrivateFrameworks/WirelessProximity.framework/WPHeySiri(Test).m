@implementation WPHeySiri(Test)

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "HeySiri zero advertising data", v1, 2u);
}

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "advertisingData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEBUG, "HeySiri advertising data=%@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_7_0();
}

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("Non-test client calling test API.");
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a1, a3, "%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
