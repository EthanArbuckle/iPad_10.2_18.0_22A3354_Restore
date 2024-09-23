@implementation MetricDelegate

- (void)metricMonitor:(id)a3 didEndWithError:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[MetricDelegate metricMonitor:didEndWithError:].cold.1(a4);
}

- (void)metricMonitor:(id)a3 didUpdateWithMetrics:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[MetricDelegate metricMonitor:didUpdateWithMetrics:].cold.1(a4);
}

- (void)metricMonitorInterruptionDidBegin:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "\nInterrupted; attempting to resume...",
      v3,
      2u);
  }
}

- (void)metricMonitorInterruptionDidEnd:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "\nInterruption ended!", v3, 2u);
  }
}

- (void)metricMonitor:(void *)a1 didEndWithError:.cold.1(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0_1(&dword_19EA99000, MEMORY[0x1E0C81028], v2, "\nError: %s\n", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)metricMonitor:(void *)a1 didUpdateWithMetrics:.cold.1(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "description");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0_1(&dword_19EA99000, MEMORY[0x1E0C81028], v2, "metric collect \n %s \n", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_8();
}

@end
