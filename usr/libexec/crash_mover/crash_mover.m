void sub_100000C44(const char *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int *v10;
  char *v11;
  int *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  int v53;
  int v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  stat v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  uint8_t v82[32];
  __int128 v83;
  __int128 v84;
  stat buf;
  _BYTE v86[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!chdir(a1))
  {
    v54 = open(a1, 32);
    if (v54 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = __error();
      v11 = strerror(*v10);
      buf.st_dev = 136315394;
      *(_QWORD *)&buf.st_mode = a1;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open and lock %s: %s. Proceeding with copy anyway.", (uint8_t *)&buf, 0x16u);
    }
    memset(&v73, 0, sizeof(v73));
    if (stat("/Library/Logs/CrashReporter/Baseband", &v73))
    {
      v53 = -1;
    }
    else
    {
      v53 = open("/Library/Logs/CrashReporter/Baseband", 32);
      if (v53 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = __error();
        v13 = strerror(*v12);
        buf.st_dev = 136315394;
        *(_QWORD *)&buf.st_mode = "/Library/Logs/CrashReporter/Baseband";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open and lock %s: %s. Proceeding with copy anyway.", (uint8_t *)&buf, 0x16u);
      }
    }
    v57 = v7;
    v61 = v7;
    v56 = v8;
    v60 = v8;
    v55 = v9;
    v63 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringWithFileSystemRepresentation:length:", ".", 1));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringWithFileSystemRepresentation:length:", "/var/mobile/Library/Logs/CrashReporter", 38));
    v81 = 0;
    v67 = v14;
    v70 = (void *)v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subpathsOfDirectoryAtPath:error:", v15, &v81));
    v71 = v81;
    v64 = objc_alloc_init((Class)NSMutableArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 511));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v17, NSFilePosixPermissions, 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 438));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v18, NSFilePosixPermissions, 0));

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    v68 = v19;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v78;
      v23 = v61;
      v24 = v70;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v78 != v22)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)v25);
          memset(&buf, 0, sizeof(buf));
          v27 = objc_autoreleasePoolPush();
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", v26)));
          if (!lstat((const char *)objc_msgSend(v28, "fileSystemRepresentation"), &buf))
          {
            v29 = buf.st_mode & 0xF000;
            if (v29 == 0x4000)
            {
              objc_msgSend(v64, "addObject:", v28);
              goto LABEL_16;
            }
            if (v29 == 40960)
            {
              unlink((const char *)objc_msgSend(objc_retainAutorelease(v28), "fileSystemRepresentation"));
              goto LABEL_16;
            }
            if (v29 != 0x8000)
              goto LABEL_16;
            if (v23)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pathExtension"));
              v31 = objc_msgSend(v23, "containsObject:", v30);

              v19 = v68;
              if (!v31)
              {
                v24 = v70;
                goto LABEL_16;
              }
            }
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByDeletingLastPathComponent"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "stringByAppendingPathComponent:", v32));
            if (objc_msgSend(v63, "length"))
            {
              v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", v63));
              v35 = v33;
              v33 = (void *)v34;

            }
            v69 = v32;
            v36 = objc_msgSend(v67, "fileExistsAtPath:", v33);
            v37 = v33;
            v24 = v70;
            v72 = v37;
            if ((v36 & 1) != 0)
            {
LABEL_28:
              v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "stringByAppendingPathComponent:", v26));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stringByAppendingPathComponent:", v40));

              if (v60)
              {
                v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingPathExtension:"));

                v41 = (void *)v42;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(_QWORD *)&v82[4] = v39;
                *(_WORD *)&v82[12] = 2112;
                *(_QWORD *)&v82[14] = v41;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Moving '%@' -> '%@'", v82, 0x16u);
              }
              v75 = v71;
              v66 = (void *)v39;
              v43 = objc_msgSend(v67, "moveItemAtPath:toPath:error:", v39, v41, &v75);
              v38 = v75;

              if ((v43 & 1) != 0)
              {
                v74 = v38;
                objc_msgSend(v67, "setAttributes:ofItemAtPath:error:", v58, v41, &v74);
                v44 = v74;

                v38 = v44;
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412802;
                *(_QWORD *)&v82[4] = v66;
                *(_WORD *)&v82[12] = 2112;
                *(_QWORD *)&v82[14] = v41;
                *(_WORD *)&v82[22] = 2112;
                *(_QWORD *)&v82[24] = v38;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to move log file '%@' to '%@': %@", v82, 0x20u);
              }
              v23 = v61;
              v32 = v69;
              v24 = v70;

            }
            else
            {
              v76 = v71;
              v65 = objc_msgSend(v67, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
              v38 = v76;

              if ((v65 & 1) != 0)
              {
                v71 = v38;
                goto LABEL_28;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(_QWORD *)&v82[4] = v72;
                *(_WORD *)&v82[12] = 2112;
                *(_QWORD *)&v82[14] = v38;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create log directory '%@': %@", v82, 0x16u);
              }
            }

            v71 = v38;
            v19 = v68;
          }
LABEL_16:

          objc_autoreleasePoolPop(v27);
          v25 = (char *)v25 + 1;
        }
        while (v21 != v25);
        v45 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        v21 = v45;
      }
      while (v45);
    }

    v46 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("length"), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v46));
    objc_msgSend(v64, "sortUsingDescriptors:", v47);

    v83 = 0u;
    v84 = 0u;
    memset(v82, 0, sizeof(v82));
    v48 = v64;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v82, &buf, 16);
    if (v49)
    {
      v50 = v49;
      v51 = **(_QWORD **)&v82[16];
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (**(_QWORD **)&v82[16] != v51)
            objc_enumerationMutation(v48);
          rmdir((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)&v82[8] + 8 * (_QWORD)i)), "fileSystemRepresentation"));
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v82, &buf, 16);
      }
      while (v50);
    }

    if ((v53 & 0x80000000) == 0)
      close(v53);
    close(v54);
    v8 = v56;
    v7 = v57;
    v9 = v55;
  }

}

BOOL sub_1000014E4(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  intptr_t v5;
  _BOOL4 v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  if (qword_100008120 != -1)
    dispatch_once(&qword_100008120, &stru_100004358);
  v5 = dispatch_semaphore_wait(v4, 0);
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Another instance of PLMovePowerlogsToCR() is in progress. Skipping", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Calling PLMovePowerlogsToCR()", buf, 2u);
    }
    v7 = qword_100008118;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001698;
    v9[3] = &unk_100004380;
    v10 = v3;
    v11 = v4;
    dispatch_async(v7, v9);

  }
  return v5 == 0;
}

void sub_100001644(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.osanalytics.crash_mover.powerlog_mover", v4);
  v3 = (void *)qword_100008118;
  qword_100008118 = (uint64_t)v2;

}

intptr_t sub_100001698(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  int v6;
  double v7;

  PLMovePowerlogsToCR();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PLMovePowerlogsToCR() took %f seconds", (uint8_t *)&v6, 0xCu);
  }
  ADClientPushValueForDistributionKey(CFSTR("com.apple.osanalytics.crash_mover.powerlog_movement_time"), v4);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000177C(uint64_t a1, objc_class *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_alloc_init(a2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "requesting files from paired device on behalf of AppleCare profile", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000018B8;
  v8[3] = &unk_1000043A8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "request:transferGroupWithOptions:onComplete:", 0, &off_1000045F8, v8);
  v7 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v6, v7) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "OSASyncProxy timed out", buf, 2u);
  }

}

void sub_1000018B8(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("complete");
    if (v4)
      v5 = v4;
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "log transfer %@", (uint8_t *)&v6, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100001978(void *a1, objc_class *a2)
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  objc_class *Class;
  const char *v13;
  __int16 v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t *v17;
  void *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  v3 = dlsym(a1, "kNSSAboutBatteryCurrentCapacityKey");
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = [a2 alloc];
    v7 = &_dispatch_main_q;
    v8 = objc_msgSend(v6, "initWithQueue:", &_dispatch_main_q);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100001C44;
    v15[3] = &unk_1000043D0;
    v17 = buf;
    v18 = v4;
    v9 = v5;
    v16 = v9;
    objc_msgSend(v8, "getAboutInfo:", v15);
    v10 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v9, v10) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NanoSystemSettings timed out, no charging status available", (uint8_t *)&v14, 2u);
    }
    if (v20[24])
    {
      v11 = dlopen("/System/Library/PrivateFrameworks/OSASyncProxyClient.framework/OSASyncProxyClient", 4);
      if (v11)
      {
        Class = objc_getClass("OSASyncProxyClient");
        if (Class)
        {
          sub_10000177C((uint64_t)Class, Class, v9);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link OSASyncProxyClient from OSASyncProxyClient", (uint8_t *)&v14, 2u);
        }
        dlclose(v11);
        goto LABEL_19;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v13 = "Unable to dynamically load OSASyncProxyClient framework";
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v13 = "No log transfer due to low-power status";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 2u);
    }
LABEL_19:

    _Block_object_dispose(buf, 8);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically load NanoSystemSettings framework keys", buf, 2u);
  }
}

void sub_100001C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001C44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  signed int v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NanoSystemSettings cannot determine charging status, error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", **(_QWORD **)(a1 + 48)));
    v8 = objc_msgSend(v7, "intValue");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Watch battery capacity is %d%%", (uint8_t *)&v9, 8u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8 > 9;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100001DA0(uint64_t a1, void *a2)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  objc_class *Class;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];
  uint8_t v11[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sharedInstance"));
  v3 = objc_msgSend(v2, "isPaired");

  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    v9 = 0;
    v7 = "device is not paired";
    v8 = (uint8_t *)&v9;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return;
  }
  v4 = dlopen("/System/Library/PrivateFrameworks/NanoSystemSettings.framework/NanoSystemSettings", 4);
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v7 = "Unable to dynamically load NanoSystemSettings framework";
    v8 = buf;
    goto LABEL_9;
  }
  v5 = v4;
  Class = objc_getClass("NSSManager");
  if (Class)
  {
    sub_100001978(v5, Class);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NSSManager from NanoSystemSettings", v11, 2u);
  }
  dlclose(v5);
}

void sub_100001ED8()
{
  const char *v0;
  uint8_t *v1;
  os_log_type_t v2;
  void *v3;
  void *v4;
  Class Class;
  __int16 v6;
  __int16 v7;
  uint8_t buf[16];

  if ((MGGetBoolAnswer(CFSTR("InternalBuild")) & 1) != 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      return;
    v6 = 0;
    v0 = "<rdar://problem/27120466> On Internal builds, transfer watch logs only on Bridge button press, NOT on Host Sync";
    v1 = (uint8_t *)&v6;
    v2 = OS_LOG_TYPE_INFO;
    goto LABEL_4;
  }
  if (MGGetBoolAnswer(CFSTR("watch-companion")))
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 4);
    if (v3)
    {
      v4 = v3;
      Class = objc_getClass("NRPairedDeviceRegistry");
      if (Class)
      {
        sub_100001DA0((uint64_t)Class, Class);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NRPairedDeviceRegistry from NanoRegistry", buf, 2u);
      }
      dlclose(v4);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v0 = "Unable to dynamically load NanoRegistry framework";
      v1 = (uint8_t *)&v7;
      v2 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v2, v0, v1, 2u);
    }
  }
}

void sub_100002014(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  CFIndex AppIntegerValue;
  void *v8;
  double v9;
  double v10;
  NSObject *v12;
  dispatch_time_t v13;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  CFIndex v16;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (qword_100008130 != -1)
    dispatch_once(&qword_100008130, &stru_1000043F0);
  if (objc_msgSend(v3, "containsObject:", CFSTR("powerlog")))
    v6 = sub_1000014E4(v5, (void *)qword_100008128);
  else
    v6 = 0;
  sub_100000C44("/Library/Logs/CrashReporter", v4, 0, 0);
  sub_100000C44("/var/wireless/Library/Logs/CrashReporter/CrashTracer", v4, 0, 0);
  sub_100000C44("/var/wireless/Library/Logs/CrashReporter", v4, 0, 0);
  sub_100000C44("/var/wireless/awdd/metriclogs", v4, 0, 0);
  sub_100000C44("/var/wireless/awdd/anonlogs", v4, CFSTR("anon"), 0);
  sub_100000C44("/var/networkd/Library/Logs/CrashReporter", v4, 0, 0);

  if (objc_msgSend(v3, "containsObject:", CFSTR("lockdown")))
    sub_100001ED8();
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("powerlogWaitDurationSecs"), CFSTR("com.apple.crash_mover"), &keyExistsAndHasValidFormat);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "timeIntervalSinceDate:", v5);
  v10 = (double)AppIntegerValue - v9;

  if (v10 > 0.0 && v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = AppIntegerValue;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "waiting max %ld secs for PLMovePowerlogsToCR() to complete", buf, 0xCu);
    }
    v12 = qword_100008128;
    v13 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v12, v13))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = AppIntegerValue;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PLMovePowerlogsToCR() timed out after %ld secs", buf, 0xCu);
      }
    }
    else
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_100008128);
    }
  }

}

void sub_1000022D8(id a1)
{
  dispatch_semaphore_t v1;
  void *v2;

  v1 = dispatch_semaphore_create(1);
  v2 = (void *)qword_100008128;
  qword_100008128 = (uint64_t)v1;

}

void sub_1000022FC(void *a1)
{
  xpc_object_t value;
  void *v2;
  void *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  void *v8;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v10;
  xpc_object_t reply;
  void *v12;
  xpc_object_t xdict;

  xdict = a1;
  value = xpc_dictionary_get_value(xdict, "Extensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue(value);
  v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_array)
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  else
    v4 = 0;
  v5 = xpc_dictionary_get_value(xdict, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  else
    v8 = 0;
  sub_100002014(v4, v8);
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  reply = xpc_dictionary_create_reply(xdict);
  v12 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "Success", 1);
    xpc_connection_send_message(v10, v12);
  }

}

void sub_100002420(void *a1)
{
  _xpc_connection_s *connection;

  connection = a1;
  xpc_connection_set_event_handler(connection, &stru_100004430);
  xpc_connection_resume(connection);

}

void sub_100002458(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_type_t type;
  int v6;
  void *v7;
  int v8;
  int out_token;
  uint8_t buf[16];
  CFTypeRef cf;
  uint64_t v12;
  CFTypeRef v13;

  v2 = a2;
  v3 = objc_autoreleasePoolPush();
  type = xpc_get_type(v2);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid || type != (xpc_type_t)&_xpc_type_error)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000028B4(v2);
LABEL_20:
    exit(1);
  }
  cf = 0;
  v6 = lockdown_copy_checkin_info(v2, &cf);
  if (v6 != 8)
  {
    if (v6)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is handling host-side invocation", buf, 2u);
    }
    *(_QWORD *)buf = 0;
    v12 = kLockdownCheckinConnectionInfoKey;
    v13 = cf;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v8 = secure_lockdown_checkin(buf, v7, 0);
    if (cf)
      CFRelease(cf);
    if (!v8)
    {
      out_token = 0;
      notify_register_check("com.apple.crash_mover", &out_token);
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.crash_mover");
      sub_100002014(0, &off_100004620);
      notify_set_state(out_token, 0);
      notify_post("com.apple.crash_mover");
      notify_cancel(out_token);
      lockdown_send(*(_QWORD *)buf, aPing, 5);
      lockdown_disconnect(*(_QWORD *)buf);
      *(_QWORD *)buf = 0;

      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100002870();
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is handling device-side invocation", buf, 2u);
  }
  sub_1000022FC(v2);
LABEL_6:
  objc_autoreleasePoolPop(v3);

}

void start()
{
  void *v0;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v2;
  void *v3;
  int v4;
  const char *v5;

  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is launching", (uint8_t *)&v4, 2u);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "com.apple.crash_mover";
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create the listenerConnection for %s", (uint8_t *)&v4, 0xCu);
    }
    exit(1);
  }
  v2 = mach_service;
  xpc_connection_set_event_handler(mach_service, &stru_100004450);
  xpc_connection_resume(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v3, "run");

  __assert_rtn("main", "crash_mover.m", 459, "false");
}

void sub_1000027EC(id a1, OS_xpc_object *a2)
{
  xpc_type_t type;
  OS_xpc_object *v3;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100002420(v3);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100002934(v3);
    exit(1);
  }

}

void sub_100002860(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002870()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Could not checkin with lockdown.", v0, 2u);
}

void sub_1000028B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_100002860((void *)&_mh_execute_header, &_os_log_default, v1, "Recieved XPC error event: %s", v2, v3, v4, v5, 2u);
}

void sub_100002934(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_100002860((void *)&_mh_execute_header, &_os_log_default, v1, "Got XPC error on listener connection: %s", v2, v3, v4, v5, 2u);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_getAboutInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAboutInfo:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_request_transferGroupWithOptions_onComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request:transferGroupWithOptions:onComplete:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_subpathsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subpathsOfDirectoryAtPath:error:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}
