@implementation PMLTrackerAWDAdapter

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = a3;
    _os_log_debug_impl(&dword_2159BB000, v6, OS_LOG_TYPE_DEBUG, "Sending %@ (%d) to AWD.", (uint8_t *)&v7, 0x12u);
  }

  AWDPostMetric();
}

@end
