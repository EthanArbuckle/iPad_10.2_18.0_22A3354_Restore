@implementation NSTask

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 reply:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018EF8;
  v5[3] = &unk_1000D57E0;
  v5[4] = a5;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, 0, v5, 10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 reply:(id)a6
{
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, a5, a6, 0.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 reply:(id)a6
{
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018F90;
  v6[3] = &unk_1000D57E0;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, a5, 0, 0, v6, 10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, a5, 0, a6, a7, 0.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001905C;
  v11[3] = &unk_1000D5808;
  v11[4] = a9;
  v11[5] = a8;
  v9[4] = a9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001908C;
  v10[3] = &unk_1000D5830;
  v10[4] = a6;
  v10[5] = a7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000190D0;
  v9[3] = &unk_1000D5858;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", a3, a4, v11, v10, v9, a5);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 reply:(id)a6
{
  _QWORD v6[5];

  v6[1] = 3221225472;
  v6[2] = sub_100019154;
  v6[3] = &unk_1000D57E0;
  v6[4] = a6;
  v6[0] = _NSConcreteStackBlock;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a3, a4, a5, 0, 0, 0, 10.0, v6);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a3, a4, a5, 0, 0, a6, 0.0, a7);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 reply:(id)a10
{
  _BOOL4 v14;
  NSError *v16;
  NSFileHandle *v17;
  NSFileHandle *v18;
  NSObject *v19;
  NSFileHandle *v20;
  NSObject *v21;
  id v22;
  NSFileHandle *v23;
  uint64_t v24;
  _QWORD v25[7];
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  if (!((unint64_t)a6 | (unint64_t)a7))
  {
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, a9, a10, a5);
    return;
  }
  v14 = a8;
  v16 = (NSError *)a6;
  if (!a6)
  {
LABEL_10:
    v18 = 0;
    if (!a7)
      goto LABEL_18;
    goto LABEL_11;
  }
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a6, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", v16, 0, 0);
  v17 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v16);
  if (!v17)
  {
    v19 = sub_10008F56C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136316162;
      v31 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      v32 = 2080;
      v33 = "W5TaskUtil.m";
      v34 = 1024;
      v35 = 146;
      v36 = 2114;
      v37 = objc_msgSend(a3, "lastPathComponent");
      v38 = 2114;
      v39 = v16;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) <%{public}@> FAILED to create file handle for output path '%{public}@'", &v30, 48);
    }
    v28 = NSLocalizedFailureReasonErrorKey;
    v29 = CFSTR("W5ResourceErr");
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    goto LABEL_10;
  }
  v18 = v17;
  v16 = 0;
  if (!a7)
    goto LABEL_18;
LABEL_11:
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a7, 0);
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", a7, 0, 0);
  v20 = +[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", a7);
  if (!v20)
  {
    v21 = sub_10008F56C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(a3, "lastPathComponent");
      v30 = 136316162;
      v31 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      v32 = 2080;
      v33 = "W5TaskUtil.m";
      v34 = 1024;
      v35 = 160;
      v36 = 2114;
      v37 = v22;
      v38 = 2114;
      v39 = a7;
      LODWORD(v24) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) <%{public}@> FAILED to create file handle for error path '%{public}@'", &v30, v24);
    }
    v26 = NSLocalizedFailureReasonErrorKey;
    v27 = CFSTR("W5ResourceErr");
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
LABEL_18:
    v20 = 0;
    if (!v16)
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!v16)
  {
LABEL_19:
    if (v14)
      v23 = v18;
    else
      v23 = v20;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000195CC;
    v25[3] = &unk_1000D5880;
    v25[4] = v18;
    v25[5] = v20;
    v25[6] = a10;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, v18, v23, a9, v25, a5);
    return;
  }
LABEL_13:
  -[NSFileHandle closeFile](v18, "closeFile");
  -[NSFileHandle closeFile](v20, "closeFile");
  if (a10)
    (*((void (**)(id, NSError *, _QWORD))a10 + 2))(a10, v16, 0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 reply:(id)a6
{
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019690;
  v6[3] = &unk_1000D57E0;
  v6[4] = a6;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, a5, 0, 0, v6, 10.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 reply:(id)a7
{
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, a5, 0, a6, a7, 0.0);
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 reply:(id)a9
{
  _QWORD v16[5];
  _QWORD v17[6];
  _QWORD v18[6];

  if ((unint64_t)a6 | (unint64_t)a7)
  {
    objc_msgSend(a6, "seekToEndOfFile");
    objc_msgSend(a7, "seekToEndOfFile");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000197FC;
    v18[3] = &unk_1000D5808;
    v18[4] = a9;
    v18[5] = a8;
    v16[4] = a9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001982C;
    v17[3] = &unk_1000D5830;
    v17[4] = a6;
    v17[5] = a7;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100019A30;
    v16[3] = &unk_1000D5858;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", a3, a4, v18, v17, v16, a5);
  }
  else
  {
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, a8, a9, a5);
  }
}

+ (void)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 startBlock:(id)a6 updateBlock:(id)a7 endBlock:(id)a8
{
  NSString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t (*__ptr32 *v14)();
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uintptr_t v28;
  NSObject *global_queue;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  NSDictionary *v36;
  NSError *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  id v46;
  id v47;
  NSObject *identifier;
  _QWORD v51[10];
  _QWORD block[15];
  _QWORD v53[15];
  _QWORD v54[7];
  _QWORD v55[8];
  int v56;
  _QWORD v57[7];
  _QWORD handler[8];
  int v59;
  uintptr_t handle;
  int v61[2];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  uint64_t v67;
  _QWORD v68[3];
  char v69;
  _QWORD v70[3];
  char v71;
  _QWORD v72[5];
  uint64_t v73;
  NSErrorUserInfoKey v74;
  const __CFString *v75;
  NSErrorUserInfoKey v76;
  const __CFString *v77;
  NSErrorUserInfoKey v78;
  const __CFString *v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  NSErrorUserInfoKey v88;
  const __CFString *v89;
  termios v90;
  NSErrorUserInfoKey v91;
  const __CFString *v92;
  NSErrorUserInfoKey v93;
  const __CFString *v94;
  NSErrorUserInfoKey v95;
  const __CFString *v96;

  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.wifivelocity.task.%@"), objc_msgSend(a3, "lastPathComponent"));
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3052000000;
  v72[3] = sub_10001A57C;
  v72[4] = sub_10001A58C;
  v73 = 0;
  v12 = os_transaction_create(-[NSString UTF8String](v11, "UTF8String"));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", -[NSString UTF8String](v11, "UTF8String"), v12);
  v47 = a6;
  v73 = v12;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3052000000;
  v65 = sub_10001A57C;
  v66 = sub_10001A58C;
  v67 = 0;
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = &off_1000A8000;
  identifier = dispatch_queue_create(0, v13);
  if (!identifier)
  {
    v95 = NSLocalizedFailureReasonErrorKey;
    v96 = CFSTR("W5NoMemErr");
    v15 = a4;
    v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v35 = 2;
LABEL_32:
    v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), v35, v36);
    v27 = 0;
    v46 = 0;
    v24 = 0;
    v22 = 0;
    v31 = 0;
    v18 = 0;
    goto LABEL_33;
  }
  v15 = a4;
  v16 = a7;
  v17 = a3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("/bin/sh")))
    v17 = objc_msgSend(a4, "firstObject");
  if (((objc_msgSend(v17, "hasPrefix:", CFSTR("/usr/local/")) & 1) != 0
     || objc_msgSend(v17, "hasPrefix:", CFSTR("/AppleInternal/")))
    && (os_variant_allows_internal_security_policies("com.apple.wifivelocity") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v44 = (const char *)objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v81 = v44;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' not allowed on non-internal install variants, will not run task", buf, 0xCu);
      v15 = a4;
    }
    v93 = NSLocalizedFailureReasonErrorKey;
    v94 = CFSTR("W5NotPermittedErr");
    v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v35 = 5;
    goto LABEL_32;
  }
  if (!a3
    || !-[NSFileManager isExecutableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isExecutableFileAtPath:", a3))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v43 = (const char *)objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v81 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' does not exist, will not run task", buf, 0xCu);
      v15 = a4;
    }
    v91 = NSLocalizedFailureReasonErrorKey;
    v92 = CFSTR("W5ParamErr");
    v35 = 1;
    v36 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    goto LABEL_32;
  }
  v18 = objc_alloc_init((Class)NSTask);
  objc_msgSend(v18, "setLaunchPath:", a3);
  if (a4)
    objc_msgSend(v18, "setArguments:", a4);
  *(_QWORD *)v61 = 0;
  handle = 0;
  memset(&v90, 0, sizeof(v90));
  v19 = openpty(&v61[1], v61, 0, &v90, 0);
  if (v19)
  {
    v88 = NSLocalizedFailureReasonErrorKey;
    v89 = CFSTR("err");
    v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v19, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
    v38 = sub_10008F56C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *__error();
      *(_DWORD *)buf = 136315906;
      v81 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      v82 = 2080;
      v83 = "W5TaskUtil.m";
      v84 = 1024;
      v85 = 335;
      v86 = 1024;
      v87 = v39;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v38, 0, "[wifivelocity] %s (%s:%u) Failed to open pseduo-terminal for stdout, returned error %d", buf, 34);
    }
    goto LABEL_25;
  }
  memset(&v90, 0, sizeof(v90));
  v20 = openpty((int *)&handle + 1, (int *)&handle, 0, &v90, 0);
  if (v20)
  {
    v78 = NSLocalizedFailureReasonErrorKey;
    v79 = CFSTR("err");
    v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
    v40 = sub_10008F56C();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *__error();
      *(_DWORD *)buf = 136315906;
      v81 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      v82 = 2080;
      v83 = "W5TaskUtil.m";
      v84 = 1024;
      v85 = 339;
      v86 = 1024;
      v87 = v41;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v40, 0, "[wifivelocity] %s (%s:%u) Failed to open pseduo-terminal for stderr, returned error %d", buf, 34);
    }
LABEL_25:
    v27 = 0;
    v46 = 0;
    v24 = 0;
    v22 = 0;
LABEL_27:
    v31 = 0;
    goto LABEL_33;
  }
  v21 = objc_alloc((Class)NSFileHandle);
  v22 = objc_msgSend(v21, "initWithFileDescriptor:closeOnDealloc:", v61[1], 1);
  v23 = objc_alloc((Class)NSFileHandle);
  v24 = objc_msgSend(v23, "initWithFileDescriptor:closeOnDealloc:", v61[0], 1);
  v25 = objc_alloc((Class)NSFileHandle);
  v46 = objc_msgSend(v25, "initWithFileDescriptor:closeOnDealloc:", HIDWORD(handle), 1);
  v26 = objc_alloc((Class)NSFileHandle);
  v27 = objc_msgSend(v26, "initWithFileDescriptor:closeOnDealloc:", handle, 1);
  objc_msgSend(v18, "setStandardOutput:", v24);
  objc_msgSend(v18, "setStandardError:", v27);
  objc_msgSend(v18, "setStandardInput:", 0);
  fcntl(v61[1], 4, 4);
  fcntl(SHIDWORD(handle), 4, 4);
  v28 = v61[1];
  global_queue = dispatch_get_global_queue(0, 0);
  v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v28, 0, global_queue);
  if (!v30)
  {
    v76 = NSLocalizedFailureReasonErrorKey;
    v77 = CFSTR("W5NoMemErr");
    v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
    goto LABEL_27;
  }
  v31 = v30;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001A598;
  handler[3] = &unk_1000D58D0;
  v59 = v61[1];
  handler[7] = v68;
  handler[6] = v16;
  handler[4] = identifier;
  handler[5] = v18;
  dispatch_source_set_event_handler(v30, handler);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10001A6CC;
  v57[3] = &unk_1000D58F8;
  v57[4] = v24;
  v57[5] = v22;
  v57[6] = v31;
  dispatch_source_set_cancel_handler(v31, v57);
  dispatch_resume(v31);
  v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, SHIDWORD(handle), 0, global_queue);
  if (v32)
  {
    v33 = v32;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10001A6FC;
    v55[3] = &unk_1000D58D0;
    v56 = HIDWORD(handle);
    v55[6] = v16;
    v55[7] = v68;
    v55[4] = identifier;
    v55[5] = v18;
    dispatch_source_set_event_handler(v32, v55);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10001A830;
    v54[3] = &unk_1000D58F8;
    v54[4] = v27;
    v54[5] = v46;
    v54[6] = v33;
    dispatch_source_set_cancel_handler(v33, v54);
    dispatch_resume(v33);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10001A860;
    v53[3] = &unk_1000D5920;
    v53[12] = v68;
    v53[13] = v70;
    v53[4] = identifier;
    v53[5] = v18;
    v53[6] = a3;
    v53[7] = a4;
    v53[11] = &v62;
    v53[9] = v31;
    v53[10] = a8;
    v53[14] = v72;
    v53[8] = v33;
    v34 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserverForName:object:queue:usingBlock:", NSTaskDidTerminateNotification, v18, +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), v53);
    v63[5] = (uint64_t)v34;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AD3C;
    block[3] = &unk_1000D59C0;
    block[4] = v18;
    block[5] = a3;
    block[6] = v33;
    block[7] = v31;
    block[8] = identifier;
    block[9] = a4;
    block[10] = 0;
    block[11] = v47;
    *(double *)&block[14] = a5;
    block[12] = v72;
    block[13] = v70;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_16;
  }
  v74 = NSLocalizedFailureReasonErrorKey;
  v75 = CFSTR("W5NoMemErr");
  v15 = a4;
  v14 = &off_1000A8000;
  v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
LABEL_33:

  if (v31)
  {
    dispatch_source_cancel(v31);
  }
  else
  {

  }
  v42 = identifier;
  if (!identifier)
    v42 = dispatch_get_global_queue(0, 0);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = *((_QWORD *)v14 + 139);
  v51[2] = sub_10001B38C;
  v51[3] = &unk_1000D5948;
  v51[4] = a3;
  v51[5] = v37;
  v51[6] = v15;
  v51[7] = v18;
  v51[8] = v47;
  v51[9] = v72;
  dispatch_async(v42, v51);
  if (identifier)
    dispatch_release(identifier);

LABEL_16:
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, 0, 0, 0, 0, 0.0, a5);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 launchHandler:(id)a5 didLaunch:(BOOL *)a6 error:(id *)a7
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, 0, 0, a5, a6, 0.0, a7);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputData:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, a5, 0, a6, a7, 0.0, a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputData:(id)a6 errorData:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  uint64_t *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = sub_10001A57C;
  v33 = sub_10001A58C;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = dispatch_semaphore_create(0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001B854;
  v24[3] = &unk_1000D59E8;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, a6, a7, a8, v24, a5);
  v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v36 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v19 = (id)v30[5];
  if (a9)
    *a9 = *((_BYTE *)v26 + 24);
  v20 = v30;
  if (a10)
  {
    v21 = (void *)v30[5];
    if (v21)
      *a10 = v21;
  }
  v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, 0, a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFilePath:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, a6, 0.0, a7, a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFilePath:(id)a6 errorFilePath:(id)a7 redirectErrorToOutput:(BOOL)a8 launchHandler:(id)a9 didLaunch:(BOOL *)a10 error:(id *)a11
{
  _BOOL8 v12;
  NSObject *v18;
  dispatch_time_t v19;
  id v20;
  uint64_t *v21;
  void *v22;
  BOOL v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;

  v12 = a8;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = sub_10001A57C;
  v34 = sub_10001A58C;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = dispatch_semaphore_create(0);
  v25[1] = 3221225472;
  v25[2] = sub_10001BB4C;
  v25[3] = &unk_1000D59E8;
  v25[5] = &v30;
  v25[6] = &v26;
  v25[4] = v18;
  v25[0] = _NSConcreteStackBlock;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a3, a4, a6, a7, v12, a9, a5, v25);
  v19 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v18, v19) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v37 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v20 = (id)v31[5];
  if (a10)
    *a10 = *((_BYTE *)v27 + 24);
  v21 = v31;
  if (a11)
  {
    v22 = (void *)v31[5];
    if (v22)
      *a11 = v22;
  }
  v23 = v21[5] == 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v23;
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 error:(id *)a6
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, a6);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 outputFileHandle:(id)a5 launchHandler:(id)a6 didLaunch:(BOOL *)a7 error:(id *)a8
{
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a3, a4, a5, 0, a6, a7, 0.0, a8);
}

+ (BOOL)runTaskWithLaunchPath:(id)a3 arguments:(id)a4 timeout:(double)a5 outputFileHandle:(id)a6 errorFileHandle:(id)a7 launchHandler:(id)a8 didLaunch:(BOOL *)a9 error:(id *)a10
{
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  uint64_t *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = sub_10001A57C;
  v33 = sub_10001A58C;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = dispatch_semaphore_create(0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001BE44;
  v24[3] = &unk_1000D59E8;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, a6, a7, a8, v24, a5);
  v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v36 = 0x4082C00000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v19 = (id)v30[5];
  if (a9)
    *a9 = *((_BYTE *)v26 + 24);
  v20 = v30;
  if (a10)
  {
    v21 = (void *)v30[5];
    if (v21)
      *a10 = v21;
  }
  v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

@end
