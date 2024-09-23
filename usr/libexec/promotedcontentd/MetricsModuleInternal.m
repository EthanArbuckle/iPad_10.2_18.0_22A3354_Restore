@implementation MetricsModuleInternal

+ (void)setSignalMonitor:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v4 = APLogForCategory(29);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding observability listener to MetricsModule", v8, 2u);
  }

  v6 = sub_100126390([APMetricsObservability alloc], v3);
  v7 = (void *)MetricsModule_observability;
  MetricsModule_observability = (uint64_t)v6;

}

@end
