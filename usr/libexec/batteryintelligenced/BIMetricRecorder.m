@implementation BIMetricRecorder

+ (id)logger
{
  return os_log_create("com.apple.batteryintelligence", "metricrecorder");
}

+ (void)sendToPPS:(id)a3 forIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[BIMetricRecorder logger](BIMetricRecorder, "logger"));
  v8 = v7;
  if (v5)
  {
    v9 = PPSCreateTelemetryIdentifier(CFSTR("BatteryIntelligence"), v6);
    if (v9)
    {
      v10 = (void *)v9;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ppsId created", v25, 2u);
      }
      PPSSendTelemetry(v10, v5);
      free(v10);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_1000201E4((uint64_t)v6, v8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000201B4(v8, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100020184(v8, v11, v12, v13, v14, v15, v16, v17);
  }

}

+ (void)sendToCoreAnalytics:(id)a3 forEvent:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[BIMetricRecorder logger](BIMetricRecorder, "logger"));
  v8 = v7;
  if (v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000198C4;
    v16[3] = &unk_10002CBA8;
    v17 = v5;
    AnalyticsSendEventLazy(v6, v16);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100020258(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
