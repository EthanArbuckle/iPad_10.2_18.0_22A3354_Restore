@implementation PLBatteryUIResponseTypeChargingStateIntervals(Utilities)

- (void)constructIntervalTuplesFromBattEntries:()Utilities lastBattEntry:startOfRange:endOfRange:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEBUG, "Closing open charging interval", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)constructIntervalTuplesFromBattEntries:()Utilities lastBattEntry:startOfRange:endOfRange:.cold.4(void *a1, char a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 1024;
  v8 = a2 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "Iterating through %lu entries, interval open: %d", (uint8_t *)&v5, 0x12u);
}

- (void)constructIntervalTuplesFromBattEntries:()Utilities lastBattEntry:startOfRange:endOfRange:.cold.5(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "Last Entry isCharging: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

@end
