@implementation SDLogArchiveContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withTargetArchive:(id)a6 withDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = objc_msgSend(objc_alloc((Class)a1), "initWithName:andDestination:withDelegate:", v15, v12, v14);

  if (v16)
  {
    objc_msgSend(v16, "setTimeout:", a5);
    objc_msgSend(v16, "setDestination:", v12);
    objc_msgSend(v16, "setArchive:", v13);
    v17 = objc_opt_new(NSMutableDictionary);
    objc_msgSend(v16, "setDurationMetrics:", v17);

  }
  return v16;
}

- (BOOL)setLogArchiveUnit:(id)a3
{
  -[SDLogArchiveContainer setUnit:](self, "setUnit:", a3);
  return 1;
}

+ (id)getWallTimeFromMetadata:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("OldestTimeRef")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("WallTime")));

  return v4;
}

- (void)addMetricsFromInfoPlist:(id)a3 forBook:(id)a4 withCurrentTime:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("Metadata")));
  v11 = (void *)objc_opt_class(self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getWallTimeFromMetadata:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5 - (unint64_t)objc_msgSend(v13, "unsignedLongLongValue") / 0x3B9ACA00));
  v15 = v8;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Persist")) & 1) != 0)
  {
    v16 = (id *)&metricPersistLookback;
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Special")) & 1) != 0)
  {
    v16 = (id *)&metricSpecialLookback;
  }
  else
  {
    v17 = v15;
    if (!objc_msgSend(v15, "isEqualToString:", CFSTR("Signpost")))
      goto LABEL_9;
    v16 = (id *)&metricSignpostLookback;
  }
  v17 = *v16;

  if (!v17)
    goto LABEL_10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer durationMetrics](self, "durationMetrics"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v17);

LABEL_9:
LABEL_10:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("SizeLimit")));
  v20 = v15;
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Persist")) & 1) != 0)
  {
    v21 = (id *)&metricPersistSize;
  }
  else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Special")) & 1) != 0)
  {
    v21 = (id *)&metricSpecialSize;
  }
  else
  {
    v22 = v20;
    if (!objc_msgSend(v20, "isEqualToString:", CFSTR("Signpost")))
    {
LABEL_18:

      goto LABEL_19;
    }
    v21 = (id *)&metricSignpostSize;
  }
  v22 = *v21;

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v19));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer durationMetrics](self, "durationMetrics"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v22);

    goto LABEL_18;
  }
LABEL_19:

}

- (void)extractMetricsFromInfoPlist:(int)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  void *v27;
  double v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;

  v4 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", *(_QWORD *)&a3);
  v5 = v4;
  if (v4)
  {
    v36 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDataUpToLength:error:", 0x400000, &v36));
    v7 = v36;
    if (v7)
    {
      v8 = v7;
      v9 = sub_100026C34();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000601F8();

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v11, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Could not read the log archive Info plist: %@"), v8);

      sub_1000304DC(v5);
    }
    else
    {
      v35 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, &v35));
      v22 = v35;
      v8 = v22;
      if (v21)
        v24 = v22 == 0;
      else
        v24 = 0;
      if (v24 && (v25 = objc_opt_class(NSDictionary, v23), (objc_opt_isKindOfClass(v21, v25) & 1) != 0))
      {
        v26 = v21;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        objc_msgSend(v27, "timeIntervalSince1970");
        v29 = (unint64_t)v28;

        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:](self, "addMetricsFromInfoPlist:forBook:withCurrentTime:", v26, CFSTR("Persist"), v29);
        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:](self, "addMetricsFromInfoPlist:forBook:withCurrentTime:", v26, CFSTR("Special"), v29);
        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:](self, "addMetricsFromInfoPlist:forBook:withCurrentTime:", v26, CFSTR("Signpost"), v29);
        v30 = sub_100026C34();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_1000600B8(self, v31);

        sub_1000304DC(v5);
      }
      else
      {
        v32 = sub_100026C34();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_100060058();

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v34, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Could not create a plist object from the file: %@"), v8);

        sub_1000304DC(v5);
      }

    }
  }
  else
  {
    v12 = sub_100026C34();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100060024(v13, v14, v15, v16, v17, v18, v19, v20);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Could not intialize a file handle from Info plist fd."));
  }

}

- (BOOL)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  char *v14;
  char *v15;
  int v16;
  const char *v17;
  int v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  dispatch_block_t v28;
  dispatch_queue_global_t global_queue;
  NSObject *v30;
  double v31;
  dispatch_time_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  NSObject *v43;
  _QWORD *v45;
  id v46;
  FILE *v47;
  _QWORD *v48;
  int v49;
  _QWORD v50[5];
  _QWORD block[4];
  id v52;
  id v53;
  _QWORD *v54;
  id v55;
  __int128 *p_buf;
  _QWORD v57[4];
  id v58;
  SDLogArchiveContainer *v59;
  __CFString *v60;
  id v61;
  _QWORD *v62;
  int v63;
  int v64;
  int v65;
  _QWORD v66[3];
  char v67;
  _QWORD v68[5];
  uint8_t v69[4];
  uint64_t v70;
  __int128 buf;
  uint64_t v72;
  int v73;

  -[SDContainer updateContainerWithOverride](self, "updateContainerWithOverride");
  if (!-[SDContainer evaluateCollectionFlags](self, "evaluateCollectionFlags"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "archive_arguments"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("filename")));
    if (v5)
      v6 = (__CFString *)v5;
    else
      v6 = CFSTR("system_logs.logarchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("oslog_archive_error.log")));

    v11 = objc_retainAutorelease(v8);
    if (mkdir((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0x1FFu))
    {
      v12 = 0;
    }
    else
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_100030C08;
      v68[3] = &unk_100099AF8;
      v47 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), "wx");
      v68[4] = v47;
      v48 = objc_retainBlock(v68);
      v13 = objc_retainAutorelease(v11);
      v49 = sub_100053A74((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0);
      if (v49 == -1)
      {
        v19 = *__error();
        v20 = sub_100026C34();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1000602C0((uint64_t)v13, v19, v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v22, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to open log archive %@: %s"), v13, strerror(v19));

        v12 = 0;
      }
      else
      {
        v14 = getenv("SUDO_UID");
        v15 = getenv("SUDO_GID");
        v16 = 0;
        if (v14)
        {
          v17 = v15;
          v18 = 0;
          if (v15)
          {
            v16 = strtoul(v14, 0, 10);
            v18 = strtoul(v17, 0, 10);
          }
        }
        else
        {
          v18 = 0;
        }
        v66[0] = 0;
        v66[1] = v66;
        v66[2] = 0x2020000000;
        v67 = 0;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100030CBC;
        v57[3] = &unk_100099B48;
        v58 = v13;
        v62 = v66;
        v23 = v48;
        v63 = v49;
        v64 = v16;
        v65 = v18;
        v61 = v23;
        v59 = self;
        v60 = v6;
        v24 = objc_retainBlock(v57);
        v25 = sub_100026C34();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v4;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Trigger logarchive with following parameters: %@", (uint8_t *)&buf, 0xCu);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v27, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Trigger logarchive with following parameters: %@"), v4);

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v72 = 0x2020000000;
        v73 = -1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000314C4;
        block[3] = &unk_100099B70;
        v46 = (id)os_transaction_create("Generate OSLOG archive");
        v52 = v46;
        p_buf = &buf;
        v53 = v4;
        v54 = v23;
        v45 = v24;
        v55 = v45;
        v28 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        global_queue = dispatch_get_global_queue(0, 0);
        v30 = objc_claimAutoreleasedReturnValue(global_queue);
        dispatch_async(v30, v28);

        -[SDLogArchiveContainer timeout](self, "timeout");
        v32 = dispatch_time(0, (uint64_t)(v31 * 1000000000.0));
        if (dispatch_block_wait(v28, v32))
        {
          v33 = sub_100026C34();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            -[SDLogArchiveContainer timeout](self, "timeout");
            *(_DWORD *)v69 = 134217984;
            v70 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "OSLogCreateArchive did not return in %f seconds", v69, 0xCu);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          -[SDLogArchiveContainer timeout](self, "timeout");
          objc_msgSend(v36, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("OSLogCreateArchive did not return in %f seconds"), v37);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "tarQueue"));
            v41 = v40 == 0;

            if (!v41)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
              v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "tarQueue"));
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_1000314F8;
              v50[3] = &unk_100099758;
              v50[4] = v66;
              dispatch_sync(v43, v50);

            }
          }
          dispatch_block_cancel(v28);
          if (v47)
            fputs("OSLogCreateArchive timed out\n", v47);
        }
        fclose(v47);
        close(v49);
        v12 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) == 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(v66, 8);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)applyContainerOverride:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout")));
    v9 = objc_opt_class(NSNumber, v8);
    isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout")));
      v12 = sub_100026C34();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "doubleValue");
        *(_DWORD *)buf = 134217984;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Logarchive timeout set to %fl seconds", buf, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v11, "doubleValue");
      objc_msgSend(v15, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Logarchive timeout set to %fl seconds"), v16);

      objc_msgSend(v11, "doubleValue");
      -[SDLogArchiveContainer setTimeout:](self, "setTimeout:");

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));

  if (v4 && v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));
    objc_msgSend(v18, "logArchiveOverride:", v4);

  }
}

- (SDLogArchiveUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (SDArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
  objc_storeStrong((id *)&self->_archive, a3);
}

- (NSMutableDictionary)durationMetrics
{
  return self->_durationMetrics;
}

- (void)setDurationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_durationMetrics, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationMetrics, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
