@implementation SPLocalBeaconManager(KeyGeneration)

- (void)bucketWithBaseTime:()KeyGeneration date:.cold.1()
{
  __assert_rtn("-[SPLocalBeaconManager(KeyGeneration) bucketWithBaseTime:date:]", "SPLocalBeaconManager.m", 915, "bucketNumber > 0");
}

- (void)dateIntervalForIndex:()KeyGeneration baseDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "Caller attempted to calculate dateInterval for bucket 0!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)generateBeaconingKeysOfType:()KeyGeneration now:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AEA79000, v0, v1, "baseIndex (%llu) > currentIndex (%llu)!", v2, v3);
  OUTLINED_FUNCTION_3();
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA79000, a2, a3, "No configuration for reason: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "Can't honor SPShutdownReasonUserAction reason because BA_Power_Off feature is off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "Can't honor SPShutdownReasonBattery reason because BA_PLEM feature is off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
