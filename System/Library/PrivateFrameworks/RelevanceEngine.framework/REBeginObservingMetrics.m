@implementation REBeginObservingMetrics

void __REBeginObservingMetrics_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  if ((REMetricsEnabled & 1) == 0)
  {
    RELogForDomain(18);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEFAULT, "begin observing metrics", v2, 2u);
    }

    dispatch_get_global_queue(17, 0);
    v1 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch("com.apple.coreanalytics.dailylogging", &_RECoreAnalyticsNotifyToken, v1, &__block_literal_global_17);

    REMetricsEnabled = 1;
    REClearMetrics();
  }
}

void __REBeginObservingMetrics_block_invoke_15()
{
  dispatch_metrics(&__block_literal_global_77_1);
}

@end
