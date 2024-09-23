@implementation MALog

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1)
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  return (id)getSharedInstance_sharedInstance;
}

void __26__MALog_getSharedInstance__block_invoke(id a1)
{
  MALog *v1;
  void *v2;

  v1 = objc_opt_new(MALog);
  v2 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = (uint64_t)v1;

}

- (MALog)init
{
  MALog *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  MALog *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MALog;
  v2 = -[MALog init](&v8, "init");
  if (v2
    && (v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v4 = dispatch_queue_create("com.apple.mobileactivationd.log", v3),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v4,
        queue,
        v3,
        !v2->_queue))
  {
    v6 = 0;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __16__MALog_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e8_32s_e5_v8__0l;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4.receiver = self;
  v4.super_class = (Class)MALog;
  -[MALog dealloc](&v4, "dealloc");
}

uint64_t __16__MALog_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return MOLogClose();
  return result;
}

- (void)deleteExpiredLogFiles
{
  OS_dispatch_queue *v3;
  _QWORD block[5];

  v3 = -[MALog queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __30__MALog_deleteExpiredLogFiles__block_invoke;
  block[3] = &__block_descriptor_40_e8_32s_e5_v8__0l;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);

}

void __30__MALog_deleteExpiredLogFiles__block_invoke(uint64_t a1)
{
  id v2;
  __int128 v3;
  id v4;
  id v5;
  uint64_t v6;
  NSURLResourceKey v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSInteger v13;
  uint64_t v14;
  _UNKNOWN **v15;
  NSObject *v16;
  id v17;
  NSFileManager *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  __int128 v24;
  id v25;
  NSArray *obj;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  _QWORD v37[2];
  uint8_t v38[4];
  int v39[3];
  _BYTE v40[128];

  if (objc_msgSend(*(id *)(a1 + 32), "logHandle"))
  {
    MOLogClose(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
    objc_msgSend(*(id *)(a1 + 32), "setLogHandle:", 0);
  }
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = copy_sorted_file_list(gPersistentLogFilePath[0]);
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (!v2)
  {
    v23 = 0;
    goto LABEL_24;
  }
  v4 = v2;
  v5 = 0;
  v27 = 0;
  v6 = *(_QWORD *)v31;
  v7 = NSURLContentModificationDateKey;
  v8 = &CCDigest_ptr;
  *(_QWORD *)&v3 = 138412546;
  v24 = v3;
  do
  {
    v9 = 0;
    v25 = v4;
    do
    {
      v10 = v5;
      if (*(_QWORD *)v31 != v6)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v9);
      v29 = 0;
      objc_msgSend(v11, "getResourceValue:forKey:error:", &v29, v7, 0, v24);
      v5 = v29;

      v12 = objc_msgSend(v8[68], "date");
      v13 = numberOfDaysBetweenDates(v5, v12);

      if (gPersistentLogTTL < 0)
      {
        v21 = copyLoggingHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          __30__MALog_deleteExpiredLogFiles__block_invoke_cold_1(v38, v39, v21);
      }
      else
      {
        if (v13 < gPersistentLogTTL)
          goto LABEL_20;
        v14 = v6;
        v15 = v8;
        v16 = copyLoggingHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v11, "path");
          *(_DWORD *)buf = 138412802;
          v35 = v17;
          v36 = 1024;
          LODWORD(v37[0]) = gPersistentLogTTL;
          WORD2(v37[0]) = 2048;
          *(_QWORD *)((char *)v37 + 6) = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Log file (%@) is greater than %d days old (%lld), deleting.", buf, 0x1Cu);

        }
        v18 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
        v28 = v27;
        v19 = -[NSFileManager removeItemAtURL:error:](v18, "removeItemAtURL:error:", v11, &v28);
        v20 = v28;

        if ((v19 & 1) != 0)
        {
          v27 = v20;
          v8 = v15;
          v6 = v14;
          v7 = NSURLContentModificationDateKey;
          v4 = v25;
          goto LABEL_20;
        }
        v21 = copyLoggingHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v22 = objc_msgSend(v11, "path");
          *(_DWORD *)buf = v24;
          v35 = v22;
          v36 = 2112;
          v37[0] = v20;
          _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Failed to delete %@: %@", buf, 0x16u);

        }
        v27 = v20;
        v8 = v15;
        v6 = v14;
        v7 = NSURLContentModificationDateKey;
        v4 = v25;
      }

LABEL_20:
      v9 = (char *)v9 + 1;
    }
    while (v4 != v9);
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  }
  while (v4);

  v23 = v27;
LABEL_24:

}

- (void)logMessage:(id)a3 toSyslog:(BOOL)a4
{
  id v6;
  OS_dispatch_queue *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = -[MALog queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __29__MALog_logMessage_toSyslog___block_invoke;
  block[3] = &__block_descriptor_49_e8_32s40s_e5_v8__0l;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async((dispatch_queue_t)v7, block);

}

void __29__MALog_logMessage_toSyslog___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t LogLevel;
  id v6;
  NSObject *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "logHandle"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "setLogHandle:", MOLogOpen(objc_msgSend(gPersistentLogLabel, "UTF8String"), 3));
  if (objc_msgSend(*(id *)(a1 + 32), "logHandle"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v3 = objc_retainAutorelease(-[__CFString stringByAppendingPathComponent:](gPersistentLogFilePath[0], "stringByAppendingPathComponent:", gPersistentLogFileName[0]));
    v4 = objc_msgSend(v3, "UTF8String");
    MOLogEnableDiskLogging(v2, v4, gPersistentLogMaxFiles, gPersistentLogSizeBytes);

LABEL_4:
    LogLevel = MOLogGetLogLevel(objc_msgSend(gPersistentLogLabel, "UTF8String"));
    if ((_DWORD)LogLevel == -1)
    {
      if (*(_BYTE *)(a1 + 48))
        LogLevel = 5;
      else
        LogLevel = 7;
    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "logHandle");
    MOLogWrite(v6, LogLevel, objc_msgSend(gPersistentLogLabel, "UTF8String"), CFSTR("%@"));
    return;
  }
  v7 = copyLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __29__MALog_logMessage_toSyslog___block_invoke_cold_1(v7);

}

- ($408BE20ABC6783163DDCA7AF1B52A3E6)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id *)a3
{
  self->_logHandle = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __30__MALog_deleteExpiredLogFiles__block_invoke_cold_1(uint8_t *buf, int *a2, os_log_t log)
{
  int v3;

  v3 = gPersistentLogTTL;
  *(_DWORD *)buf = 67109120;
  *a2 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Invalid TTL: %u", buf, 8u);
}

void __29__MALog_logMessage_toSyslog___block_invoke_cold_1(os_log_t log)
{
  int v1;
  __CFString *v2;

  v1 = 138412290;
  v2 = gPersistentLogLabel;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "MOLogOpen failed for %@.", (uint8_t *)&v1, 0xCu);
}

@end
