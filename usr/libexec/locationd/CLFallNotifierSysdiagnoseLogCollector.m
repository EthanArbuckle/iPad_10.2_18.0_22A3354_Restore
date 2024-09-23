@implementation CLFallNotifierSysdiagnoseLogCollector

+ (id)getSysdiagnoseOutputPath
{
  void **v2;
  NSString *v3;
  void *__p[2];
  char v6;

  sub_101225108((uint64_t)__p);
  if (v6 >= 0)
    v2 = __p;
  else
    v2 = (void **)__p[0];
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v2);
  if (v6 < 0)
    operator delete(__p[0]);
  return v3;
}

+ (id)getSysdiagnoseOutputFilename
{
  NSDate *v2;
  id v3;

  v2 = +[NSDate date](NSDate, "date");
  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyyMMdd_HH-mm-ss"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreMotionDebug_AnomalyData_%@.bin"), objc_msgSend(v3, "stringFromDate:", v2));
}

+ (void)writeAnomalyInfoToFileWithLastFallEvent:(ImpactEvent *)a3 writeMask:(unint64_t)a4 fallNotifierConfig:(Config *)a5 stateLogger:(id)a6 statsLogger:(id)a7 sensorsLogger:(id)a8 pressureLogger:(id)a9 heartRateLogger:(id)a10 wristStateLogger:(id)a11 odometerLogger:(id)a12 falsePositiveSuppressionFeaturesLogger:(id)a13 hgalLogger:(id)a14 logDirectory:(id)a15 logFilePrefix:(id)a16
{
  __int16 v19;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  char *v26;
  const char *v27;
  char *v28;
  uint64_t v29;
  unsigned __int8 v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  _BYTE buf[24];
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  BOOL var1;
  unint64_t var0;
  unsigned __int8 v46;
  BOOL v47;
  unsigned __int8 var3;
  BOOL v49;
  char v50;

  v19 = a4;
  v21 = -[CLFallLogger initToDirectory:prefix:rotation:]([CLFallLogger alloc], "initToDirectory:prefix:rotation:", a15, a16, 0);
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_102165C08);
  v22 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = objc_msgSend(a15, "UTF8String");
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = objc_msgSend(a16, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Logging anomaly info in file [%s] [%s]", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102165C08);
    v24 = qword_10229FD98;
    v32 = 136315394;
    v33 = objc_msgSend(a15, "UTF8String");
    v34 = 2080;
    v35 = objc_msgSend(a16, "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v24, 2, "Logging anomaly info in file [%s] [%s]", (const char *)&v32, 22);
    v26 = (char *)v25;
    sub_100512490("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:stateLogger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppressionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
  if ((v19 & 0x80) != 0)
  {
    *(_WORD *)&buf[16] = 0;
    *(_QWORD *)buf = off_102171DC8;
    *(_QWORD *)&buf[8] = 0;
    buf[18] = 2;
    sub_100197040();
    *(_DWORD *)&buf[20] = sub_1001AA9A8();
    v31 = 0;
    sub_1018BF25C((unsigned __int8 *)&v32, "FallStatsEnabled", &v31, 0);
    v37 = BYTE1(v32);
    v31 = 0;
    sub_1018BF25C((unsigned __int8 *)&v32, "FallStatsPressureEnabled", &v31, 0);
    v38 = BYTE1(v32);
    v31 = 0;
    sub_1018BF25C((unsigned __int8 *)&v32, "FallStatsSensorRecordingEnabled", &v31, 0);
    v39 = BYTE1(v32);
    v40 = sub_100A15448();
    v41 = sub_100A15534();
    v31 = 0;
    sub_1018BF25C((unsigned __int8 *)&v32, "AnomalyMotionInternalTest", &v31, 0);
    v42 = BYTE1(v32);
    v43 = 0;
    var1 = a5->var1;
    var0 = a5->var0.var0;
    v46 = a5->var0.var1;
    v47 = a5->var0.var2 != 0;
    var3 = a5->var0.var3;
    v49 = a5->var0.var5 != 0;
    v50 = 0;
    objc_msgSend(v21, "logData:", +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf));
  }
  if ((v19 & 2) != 0)
  {
    sub_100A37FC8((uint64_t)buf, (uint64_t)a3);
    objc_msgSend(v21, "logData:", +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", buf));
  }
  if ((v19 & 4) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a6, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("newtonState"), v21);
  if ((v19 & 8) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a7, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("newtonStats"), v21);
  if ((v19 & 0x10) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a8, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("newtonSensors"), v21);
  if ((v19 & 0x20) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a9, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("pressure"), v21);
  if ((v19 & 0x40) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a10, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("heartRate"), v21);
  if ((v19 & 0x100) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a11, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("wristState"), v21);
  if ((v19 & 0x400) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a12, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("odometer"), v21);
  if ((v19 & 0x200) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a13, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("falsePositiveSuppressionFeatures"), v21);
  if ((v19 & 0x800) != 0)
    +[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:](CLFallNotifierSysdiagnoseLogCollector, "writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:", a14, CFSTR("/var/root/Library/Caches/locationd/logs/newtonStats"), CFSTR("hgal"), v21);
  objc_msgSend(v21, "flushToFile");
  objc_msgSend(v21, "stopLogging");

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_102165C08);
  v23 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Logging anomaly info done packing file", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102165C08);
    LOWORD(v32) = 0;
    LODWORD(v29) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Logging anomaly info done packing file", &v32, v29);
    v28 = (char *)v27;
    sub_100512490("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeAnomalyInfoToFileWithLastFallEvent:writeMask:fallNotifierConfig:stateLogger:statsLogger:sensorsLogger:pressureLogger:heartRateLogger:wristStateLogger:odometerLogger:falsePositiveSuppressionFeaturesLogger:hgalLogger:logDirectory:logFilePrefix:]", "%s\n", v27);
    if (v28 != buf)
      free(v28);
  }
}

+ (void)writeOtherFallLoggerData:(id)a3 otherLoggerDirectory:(id)a4 otherLoggerFilePrefix:(id)a5 destinationLogger:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSData *v17;
  NSData *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint8_t *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint8_t buf[4];
  const char *v35;
  _QWORD v36[2];
  _BYTE v37[128];

  objc_msgSend(a3, "flushToFile");
  objc_msgSend(a3, "stopLogging");
  v31 = 0;
  v9 = -[NSArray mutableCopy](-[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", a4, &v31), "mutableCopy");
  if (!v31)
  {
    v10 = v9;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v14);
          if (!objc_msgSend(v15, "rangeOfString:", a5))
          {
            v36[0] = a4;
            v36[1] = v15;
            v16 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
            v17 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v16);
            if (v17)
            {
              v18 = v17;
              if (qword_10229FD90 != -1)
                dispatch_once(&qword_10229FD90, &stru_102165C08);
              v19 = qword_10229FD98;
              if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
              {
                v20 = -[NSString UTF8String](v16, "UTF8String");
                *(_DWORD *)buf = 136315138;
                v35 = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Dumping [%s]", buf, 0xCu);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FD90 != -1)
                  dispatch_once(&qword_10229FD90, &stru_102165C08);
                v21 = qword_10229FD98;
                v22 = -[NSString UTF8String](v16, "UTF8String");
                v32 = 136315138;
                v33 = v22;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v21, 2, "Dumping [%s]", (const char *)&v32);
                v24 = (uint8_t *)v23;
                sub_100512490("Generic", 1, 0, 2, "+[CLFallNotifierSysdiagnoseLogCollector writeOtherFallLoggerData:otherLoggerDirectory:otherLoggerFilePrefix:destinationLogger:]", "%s\n", v23);
                if (v24 != buf)
                  free(v24);
              }
              objc_msgSend(a6, "logData:", v18);
            }
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        v12 = v25;
      }
      while (v25);
    }
  }
}

@end
