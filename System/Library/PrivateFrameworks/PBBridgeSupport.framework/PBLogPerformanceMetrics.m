@implementation PBLogPerformanceMetrics

void __PBLogPerformanceMetrics_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PBLogPerformanceMetrics___logPerformanceMetrics = 1;
  pbb_setupflow_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2113B6000, v0, OS_LOG_TYPE_DEFAULT, "PBLogPerformanceMetrics Enabled", v1, 2u);
  }

}

@end
