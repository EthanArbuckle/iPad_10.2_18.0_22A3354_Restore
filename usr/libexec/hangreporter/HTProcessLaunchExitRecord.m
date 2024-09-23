@implementation HTProcessLaunchExitRecord

- (HTProcessLaunchExitRecord)initWithInfo:(id)a3 pid:(int)a4 spawnTimestamp:(unint64_t)a5 exitTimestamp:(unint64_t)a6 exitReasonCode:(unint64_t)a7 exitReasonNamespace:(unsigned __int8)a8 jetsam_priority:(unsigned __int16)a9
{
  id v16;
  HTProcessLaunchExitRecord *v17;
  HTProcessLaunchExitRecord *v18;
  objc_super v20;

  v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HTProcessLaunchExitRecord;
  v17 = -[HTProcessLaunchExitRecord init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processName, a3);
    v18->_pid = a4;
    v18->_spawnTimestamp = a5;
    v18->_exitTimestamp = a6;
    v18->_exitReasonCode = a7;
    v18->_exitReasonNamespace = a8;
    v18->_jetsam_priority = a9;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *processName;
  id v5;

  processName = self->_processName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processName, CFSTR("processName"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_spawnTimestamp, CFSTR("spawnTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_exitTimestamp, CFSTR("exitTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_exitReasonCode, CFSTR("exitReasonCode"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_exitReasonNamespace, CFSTR("exitReasonNamespace"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_jetsam_priority, CFSTR("jetsamPriority"));

}

- (HTProcessLaunchExitRecord)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int16 v12;
  HTProcessLaunchExitRecord *v13;
  uint64_t v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("processName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pid"));
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("spawnTimestamp"));
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("exitTimestamp"));
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("exitReasonCode"));
  v11 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("exitReasonNamespace"));
  v12 = (unsigned __int16)objc_msgSend(v4, "decodeIntForKey:", CFSTR("jetsamPriority"));

  LOWORD(v15) = v12;
  v13 = -[HTProcessLaunchExitRecord initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:](self, "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:", v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

+ (void)fetchProcessRecords
{
  int v2;
  id v3;
  NSObject *v4;
  char *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  NSString *v11;
  void *v12;
  double v13;
  double v14;
  HTProcessLaunchExitRecord *v15;
  HTProcessLaunchExitRecord *v16;
  uint64_t v17;
  unint64_t i;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  double v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_time_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  _BYTE v38[18];
  __int16 v39;
  void *v40;

  if (qword_1000801D8 != -1)
    dispatch_once(&qword_1000801D8, &stru_100075CC0);
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v2 = _launch_service_stats_copy_impl("com.apple.hangtracerd", 128, &v34, 5);
  if (v2)
  {
    v3 = sub_10001D38C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = strerror(v2);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v2;
      *(_WORD *)&v38[4] = 2080;
      *(_QWORD *)&v38[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to fetch launch_service_stats(%d):%s", buf, 0x12u);
    }
  }
  else
  {
    v6 = sub_10001D38C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v38 = v36;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "launch_service_stats_copy() returned %u records", buf, 8u);
    }

    if ((_DWORD)v36)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = (char *)v35;
        v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", xpc_array_get_string(v34, *(unsigned int *)((char *)v35 + v8)), 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = sub_10000658C(*(_QWORD *)&v10[v8 + 4]);
        v14 = sub_10000658C(*(_QWORD *)&v10[v8 + 12]);
        v15 = [HTProcessLaunchExitRecord alloc];
        LOWORD(v33) = *(_WORD *)&v10[v8 + 49];
        v16 = -[HTProcessLaunchExitRecord initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:](v15, "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:", v12, *(unsigned int *)&v10[v8 + 20], (unint64_t)v13, (unint64_t)v14, *(_QWORD *)&v10[v8 + 29], v10[v8 + 28], v33);
        objc_msgSend((id)qword_1000801E0, "insert:", v16);

        ++v9;
        v8 += 51;
      }
      while (v9 < v36);
    }
    if (v35)
      free(v35);
    v17 = mach_absolute_time();
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    for (i = 0; i < (unint64_t)objc_msgSend((id)qword_1000801E0, "count"); ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "objectAtIndex:", i));
      v20 = objc_msgSend(v19, "exitTimestamp");

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v22 = v17 - (_QWORD)v20;
      LODWORD(v20) = sub_10000658C((unint64_t)objc_msgSend(v21, "runloopHangTimeoutDurationMSec") + 30000) < (double)(v17 - (unint64_t)v20);

      if ((_DWORD)v20)
      {
        v23 = sub_10001D38C();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v25 = sub_1000064D8(v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          v27 = (char *)objc_msgSend(v26, "runloopHangTimeoutDurationMSec");
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "getDescription:", i));
          *(_DWORD *)buf = 134218498;
          *(double *)v38 = v25;
          *(_WORD *)&v38[8] = 2048;
          *(_QWORD *)&v38[10] = v27 + 30000;
          v39 = 2112;
          v40 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "discarding stale record, time since exit %.0fms, HT_STALE_RECORD_THRESHOLD_IN_MSEC %llums, %@", buf, 0x20u);

        }
        -[NSObject addIndex:](v4, "addIndex:", i);
      }
    }
    objc_msgSend((id)qword_1000801E0, "removeObjectsAtIndexes:", v4);
    v29 = (void *)os_transaction_create("com.apple.hangreporter.launch-exit-records");
    objc_msgSend((id)qword_1000801E0, "setTransaction:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v31 = dispatch_time(0, 1000000 * (_QWORD)objc_msgSend(v30, "runloopHangTimeoutDurationMSec") + 30000000000);

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "timer"));
    dispatch_source_set_timer(v32, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);

  }
}

+ (id)getProcessExitsAndLaunchesDuringHang:(unint64_t)a3 endTime:(unint64_t)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  NSDate *v9;
  NSDate *v10;
  id v11;
  id v12;
  unint64_t v13;
  const __CFString *v14;
  NSString *v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  const __CFString *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[10];
  _QWORD v54[10];
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;

  v38 = objc_alloc_init((Class)NSMutableArray);
  v36 = objc_alloc_init((Class)NSMutableArray);
  v37 = objc_alloc_init((Class)NSMutableArray);
  v4 = sub_10001D38C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v56 = sub_1000064D8(a3);
    v57 = 2048;
    v58 = sub_1000064D8(a4);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "getProcessExitsAndLaunchesDuringHang: called with windown [%.0f - %.0f]ms", buf, 0x16u);
  }

  +[HTProcessLaunchExitRecord fetchProcessRecords](HTProcessLaunchExitRecord, "fetchProcessRecords");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v39 = mach_absolute_time();
  if (objc_msgSend((id)qword_1000801E0, "count"))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "objectAtIndex:", v6));
      v53[0] = CFSTR("processName");
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processName"));
      v54[0] = v50;
      v53[1] = CFSTR("processID");
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "pid")));
      v54[1] = v49;
      v53[2] = CFSTR("spawnTimestamp");
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "dateFormatter"));
      v9 = sub_1000063F4((uint64_t)objc_msgSend(v8, "spawnTimestamp"), v41, v39);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringFromDate:", v47));
      v54[2] = v46;
      v53[3] = CFSTR("exitTimestamp");
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000801E0, "dateFormatter"));
      v10 = sub_1000063F4((uint64_t)objc_msgSend(v8, "exitTimestamp"), v41, v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringFromDate:", v44));
      v54[3] = v43;
      v53[4] = CFSTR("relativeSpawnTimeToHangStart");
      v11 = objc_msgSend(v8, "spawnTimestamp");
      v12 = objc_msgSend(v8, "spawnTimestamp");
      if ((unint64_t)v11 <= a3)
        v13 = a3 - (_QWORD)v12;
      else
        v13 = (unint64_t)v12 - a3;
      if ((unint64_t)v11 <= a3)
        v14 = CFSTR("-%.3lfs");
      else
        v14 = CFSTR("%.3lfs");
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, sub_10000652C(v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v54[4] = v16;
      v53[5] = CFSTR("relativeExitTimeToHangStart");
      v17 = objc_msgSend(v8, "exitTimestamp");
      v18 = objc_msgSend(v8, "exitTimestamp");
      if ((unint64_t)v17 <= a3)
        v19 = a3 - (_QWORD)v18;
      else
        v19 = (unint64_t)v18 - a3;
      if ((unint64_t)v17 <= a3)
        v20 = CFSTR("-%.3lfs");
      else
        v20 = CFSTR("%.3lfs");
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, sub_10000652C(v19));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v54[5] = v22;
      v53[6] = CFSTR("processUptime");
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.3lfs"), sub_10000652C((_BYTE *)objc_msgSend(v8, "exitTimestamp") - (_BYTE *)objc_msgSend(v8, "spawnTimestamp")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v54[6] = v24;
      v53[7] = CFSTR("exitReasonCode");
      v25 = sub_1000179B4((int)objc_msgSend(v8, "exitReasonNamespace"), (uint64_t)objc_msgSend(v8, "exitReasonCode"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v54[7] = v26;
      v53[8] = CFSTR("exitReasonNamespace");
      v27 = sub_10001708C(objc_msgSend(v8, "exitReasonNamespace"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v54[8] = v28;
      v53[9] = CFSTR("jetsamPriority");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v8, "jetsam_priority")));
      v54[9] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 10));

      if ((unint64_t)objc_msgSend(v8, "exitTimestamp") < a3
        || (v31 = objc_msgSend(v8, "exitTimestamp"), v32 = v36, (unint64_t)v31 >= a4))
      {
        if ((unint64_t)objc_msgSend(v8, "exitTimestamp") >= a4)
          v32 = v37;
        else
          v32 = v38;
      }
      objc_msgSend(v32, "addObject:", v30);

      v6 = v7;
    }
    while ((unint64_t)objc_msgSend((id)qword_1000801E0, "count") > v7++);
  }
  v51[0] = CFSTR("exitedDuringHang");
  v51[1] = CFSTR("exitedBeforeHang");
  v52[0] = v36;
  v52[1] = v38;
  v51[2] = CFSTR("exitedAfterHang");
  v52[2] = v37;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 3));

  return v34;
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  return sub_1000064D8(a3 - self->_requestedToRenderTimestamp) < 200.0;
}

- (BOOL)isTimedOut
{
  return 0;
}

- (unint64_t)compareValue
{
  return self->_exitTimestamp;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)spawnTimestamp
{
  return self->_spawnTimestamp;
}

- (unint64_t)exitTimestamp
{
  return self->_exitTimestamp;
}

- (unint64_t)requestedToRenderTimestamp
{
  return self->_requestedToRenderTimestamp;
}

- (void)setRequestedToRenderTimestamp:(unint64_t)a3
{
  self->_requestedToRenderTimestamp = a3;
}

- (unint64_t)exitReasonCode
{
  return self->_exitReasonCode;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)exitReasonNamespace
{
  return self->_exitReasonNamespace;
}

- (NSString)exitReasonNamespaceString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)jetsam_priority
{
  return self->_jetsam_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonNamespaceString, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
