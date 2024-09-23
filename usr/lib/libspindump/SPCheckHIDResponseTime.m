@implementation SPCheckHIDResponseTime

uint64_t __SPCheckHIDResponseTime_block_invoke()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;

  do
    v0 = __ldxr(&gNumHIDEvents);
  while (__stxr(0, &gNumHIDEvents));
  do
    v1 = __ldxr(&gDurationHandlingHIDEvents_MachAbs);
  while (__stxr(0, &gDurationHandlingHIDEvents_MachAbs));
  v2 = MachToNano(v1);
  if (libspindump_log_onceToken != -1)
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
  v3 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
    __SPCheckHIDResponseTime_block_invoke_cold_1(v2, v0, v3);
  return analytics_send_event_lazy();
}

void __SPCheckHIDResponseTime_block_invoke_cold_1(unint64_t a1, unint64_t a2, os_log_t log)
{
  int v3;
  unint64_t v4;
  __int16 v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 134218496;
  v4 = a1 / 0xF4240;
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a1 / 0xF4240 / a2;
  _os_log_debug_impl(&dword_20AE33000, log, OS_LOG_TYPE_DEBUG, "HID statistics: %llums to handle %llu events (%llums/event)", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_8();
}

@end
