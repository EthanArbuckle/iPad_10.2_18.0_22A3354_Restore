@implementation NSTask(WiFiVelocity)

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:reply:
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_reply___block_invoke;
  v6[3] = &unk_24C23C020;
  v6[4] = a5;
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, 0, v6, 10.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:reply:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, 0, 0, a5, a6, 0.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:reply:
{
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputData_reply___block_invoke;
  v7[3] = &unk_24C23C020;
  v7[4] = a6;
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, a5, 0, 0, v7, 10.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:reply:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a3, a4, a5, 0, a6, a7, 0.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:reply:
{
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[6];

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke;
  v11[3] = &unk_24C23C048;
  v11[4] = a8;
  v11[5] = a7;
  v9[4] = a8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_2;
  v10[3] = &unk_24C23C070;
  v10[4] = a5;
  v10[5] = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_3;
  v9[3] = &unk_24C23C098;
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", a3, a4, v11, v10, v9);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:reply:
{
  _QWORD v7[5];

  v7[1] = 3221225472;
  v7[2] = __77__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFilePath_reply___block_invoke;
  v7[3] = &unk_24C23C020;
  v7[4] = a6;
  v7[0] = MEMORY[0x24BDAC760];
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a3, a4, a5, 0, 0, 0, 10.0, v7);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:reply:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a3, a4, a5, 0, 0, a6, 0.0, a7);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:
{
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t result;
  NSObject *OSLog;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  int *v25;
  uint64_t v26;
  _QWORD v27[7];
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  int v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!(a6 | a7))
    return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a4, a5, 0, 0, a9, a10, a1);
  v16 = a6;
  if (!a6)
  {
LABEL_10:
    v18 = 0;
    if (!a7)
      goto LABEL_18;
    goto LABEL_11;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", a6, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createFileAtPath:contents:attributes:", v16, 0, 0);
  v17 = objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForUpdatingAtPath:", v16);
  if (!v17)
  {
    OSLog = W5GetOSLog();
    if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136316162;
      v33 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      v34 = 2080;
      v35 = "W5TaskUtil.m";
      v36 = 1024;
      v37 = 146;
      v38 = 2114;
      v39 = objc_msgSend(a4, "lastPathComponent");
      v40 = 2114;
      v41 = v16;
      LODWORD(v26) = 48;
      v25 = &v32;
      _os_log_send_and_compose_impl();
    }
    v30 = *MEMORY[0x24BDD0FD8];
    v31 = CFSTR("W5ResourceErr");
    v16 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v25, v26));
    goto LABEL_10;
  }
  v18 = (void *)v17;
  v16 = 0;
  if (!a7)
    goto LABEL_18;
LABEL_11:
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", a7, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createFileAtPath:contents:attributes:", a7, 0, 0);
  v21 = (void *)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForUpdatingAtPath:", a7);
  if (!v21)
  {
    v22 = W5GetOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(a4, "lastPathComponent");
      v32 = 136316162;
      v33 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      v34 = 2080;
      v35 = "W5TaskUtil.m";
      v36 = 1024;
      v37 = 160;
      v38 = 2114;
      v39 = v23;
      v40 = 2114;
      v41 = a7;
      LODWORD(v26) = 48;
      v25 = &v32;
      _os_log_send_and_compose_impl();
    }
    v28 = *MEMORY[0x24BDD0FD8];
    v29 = CFSTR("W5ResourceErr");
    v16 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, v25, v26));
LABEL_18:
    v21 = 0;
    if (!v16)
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!v16)
  {
LABEL_19:
    if (a8)
      v24 = v18;
    else
      v24 = v21;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __135__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply___block_invoke;
    v27[3] = &unk_24C23C0C0;
    v27[4] = v18;
    v27[5] = v21;
    v27[6] = a10;
    return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a4, a5, v18, v24, a9, v27, a1);
  }
LABEL_13:
  objc_msgSend(v18, "closeFile");
  result = objc_msgSend(v21, "closeFile");
  if (a10)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a10 + 16))(a10, v16, 0);
  return result;
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:reply:
{
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFileHandle_reply___block_invoke;
  v7[3] = &unk_24C23C020;
  v7[4] = a6;
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, a5, 0, 0, v7, 10.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:reply:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a3, a4, a5, 0, a6, a7, 0.0);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:
{
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[6];

  if (!(a6 | a7))
    return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a4, a5, 0, 0, a8, a9, a1);
  objc_msgSend((id)a6, "seekToEndOfFile");
  objc_msgSend((id)a7, "seekToEndOfFile");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke;
  v19[3] = &unk_24C23C048;
  v19[4] = a9;
  v19[5] = a8;
  v17[4] = a9;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_2;
  v18[3] = &unk_24C23C070;
  v18[4] = a6;
  v18[5] = a7;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_12;
  v17[3] = &unk_24C23C098;
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", a4, a5, v19, v18, v17, a1);
}

+ (void)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:startBlock:updateBlock:endBlock:
{
  void *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  uint64_t v15;
  uint64_t (*__ptr32 *v16)();
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uintptr_t v30;
  NSObject *global_queue;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *OSLog;
  int v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void *v59;
  uint64_t v60;
  NSObject *identifier;
  _QWORD v64[10];
  _QWORD block[15];
  _QWORD v66[15];
  _QWORD v67[7];
  _QWORD v68[8];
  int v69;
  _QWORD v70[7];
  _QWORD handler[8];
  int v72;
  uintptr_t handle;
  int v74[2];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  _QWORD v81[3];
  char v82;
  _QWORD v83[3];
  char v84;
  _QWORD v85[5];
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  const __CFString *v92;
  uint8_t buf[4];
  const char *v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  uint64_t v101;
  const __CFString *v102;
  termios v103;
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  const __CFString *v107;
  uint64_t v108;
  _QWORD v109[4];

  v109[1] = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.wifivelocity.task.%@"), objc_msgSend(a4, "lastPathComponent"));
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3052000000;
  v85[3] = __Block_byref_object_copy_;
  v85[4] = __Block_byref_object_dispose_;
  v86 = 0;
  objc_msgSend(v11, "UTF8String");
  v12 = os_transaction_create();
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", objc_msgSend(v11, "UTF8String"), v12);
  v60 = a6;
  v86 = v12;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3052000000;
  v78 = __Block_byref_object_copy_;
  v79 = __Block_byref_object_dispose_;
  v80 = 0;
  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = dispatch_queue_create(0, v13);
  v15 = MEMORY[0x24BDAC760];
  v16 = &off_209C6A000;
  identifier = v14;
  if (!v14)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v108 = *MEMORY[0x24BDD0FD8];
    v109[0] = CFSTR("W5NoMemErr");
    v17 = a5;
    v43 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, &v108, 1);
    v42 = 2;
LABEL_33:
    v46 = objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), v42, v43);
    v29 = 0;
    v59 = 0;
    v26 = 0;
    v24 = 0;
    v33 = 0;
    v20 = 0;
    goto LABEL_34;
  }
  v17 = a5;
  v18 = a7;
  v19 = a4;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("/bin/sh")))
    v19 = (void *)objc_msgSend(a5, "firstObject");
  if (((objc_msgSend(v19, "hasPrefix:", CFSTR("/usr/local/")) & 1) != 0
     || objc_msgSend(v19, "hasPrefix:", CFSTR("/AppleInternal/")))
    && (os_variant_allows_internal_security_policies() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v94 = (const char *)v57;
      _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' not allowed on non-internal install variants, will not run task", buf, 0xCu);
      v17 = a5;
    }
    v41 = (void *)MEMORY[0x24BDD1540];
    v106 = *MEMORY[0x24BDD0FD8];
    v107 = CFSTR("W5NotPermittedErr");
    v43 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v42 = 5;
    goto LABEL_33;
  }
  if (!a4
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "isExecutableFileAtPath:", a4) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v56 = objc_msgSend(a4, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v94 = (const char *)v56;
      _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' does not exist, will not run task", buf, 0xCu);
      v17 = a5;
    }
    v41 = (void *)MEMORY[0x24BDD1540];
    v104 = *MEMORY[0x24BDD0FD8];
    v105 = CFSTR("W5ParamErr");
    v42 = 1;
    v43 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
    goto LABEL_33;
  }
  v20 = objc_alloc_init(MEMORY[0x24BDD17D8]);
  objc_msgSend(v20, "setLaunchPath:", a4);
  if (a5)
    objc_msgSend(v20, "setArguments:", a5);
  *(_QWORD *)v74 = 0;
  handle = 0;
  memset(&v103, 0, sizeof(v103));
  v21 = openpty(&v74[1], v74, 0, &v103, 0);
  if (v21)
  {
    v44 = (void *)MEMORY[0x24BDD1540];
    v101 = *MEMORY[0x24BDD0FD8];
    v102 = CFSTR("err");
    v45 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v46 = objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v21, v45);
    OSLog = W5GetOSLog();
    if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *__error();
      *(_DWORD *)buf = 136315906;
      v94 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      v95 = 2080;
      v96 = "W5TaskUtil.m";
      v97 = 1024;
      v98 = 335;
      v99 = 1024;
      v100 = v48;
LABEL_25:
      _os_log_send_and_compose_impl();
    }
LABEL_26:
    v29 = 0;
    v59 = 0;
    v26 = 0;
    v24 = 0;
LABEL_28:
    v33 = 0;
    goto LABEL_34;
  }
  memset(&v103, 0, sizeof(v103));
  v22 = openpty((int *)&handle + 1, (int *)&handle, 0, &v103, 0);
  if (v22)
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    v91 = *MEMORY[0x24BDD0FD8];
    v92 = CFSTR("err");
    v50 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    v46 = objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v22, v50);
    v51 = W5GetOSLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *__error();
      *(_DWORD *)buf = 136315906;
      v94 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      v95 = 2080;
      v96 = "W5TaskUtil.m";
      v97 = 1024;
      v98 = 339;
      v99 = 1024;
      v100 = v52;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v23 = objc_alloc(MEMORY[0x24BDD1578]);
  v24 = (void *)objc_msgSend(v23, "initWithFileDescriptor:closeOnDealloc:", v74[1], 1);
  v25 = objc_alloc(MEMORY[0x24BDD1578]);
  v26 = (void *)objc_msgSend(v25, "initWithFileDescriptor:closeOnDealloc:", v74[0], 1);
  v27 = objc_alloc(MEMORY[0x24BDD1578]);
  v59 = (void *)objc_msgSend(v27, "initWithFileDescriptor:closeOnDealloc:", HIDWORD(handle), 1);
  v28 = objc_alloc(MEMORY[0x24BDD1578]);
  v29 = (void *)objc_msgSend(v28, "initWithFileDescriptor:closeOnDealloc:", handle, 1);
  objc_msgSend(v20, "setStandardOutput:", v26);
  objc_msgSend(v20, "setStandardError:", v29);
  objc_msgSend(v20, "setStandardInput:", 0);
  fcntl(v74[1], 4, 4);
  fcntl(SHIDWORD(handle), 4, 4);
  v30 = v74[1];
  global_queue = dispatch_get_global_queue(0, 0);
  v32 = dispatch_source_create(MEMORY[0x24BDACA00], v30, 0, global_queue);
  if (!v32)
  {
    v89 = *MEMORY[0x24BDD0FD8];
    v90 = CFSTR("W5NoMemErr");
    v46 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
    goto LABEL_28;
  }
  v33 = v32;
  handler[0] = v15;
  handler[1] = 3221225472;
  handler[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke;
  handler[3] = &unk_24C23C110;
  v72 = v74[1];
  handler[7] = v81;
  handler[6] = v18;
  handler[4] = identifier;
  handler[5] = v20;
  dispatch_source_set_event_handler(v32, handler);
  v70[0] = v15;
  v70[1] = 3221225472;
  v70[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_3;
  v70[3] = &unk_24C23C138;
  v70[4] = v26;
  v70[5] = v24;
  v70[6] = v33;
  dispatch_source_set_cancel_handler(v33, v70);
  dispatch_resume(v33);
  v34 = dispatch_source_create(MEMORY[0x24BDACA00], SHIDWORD(handle), 0, global_queue);
  if (v34)
  {
    v35 = v34;
    v36 = MEMORY[0x24BDAC760];
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_4;
    v68[3] = &unk_24C23C110;
    v69 = HIDWORD(handle);
    v68[6] = v18;
    v68[7] = v81;
    v68[4] = identifier;
    v68[5] = v20;
    dispatch_source_set_event_handler(v34, v68);
    v67[0] = v36;
    v67[1] = 3221225472;
    v67[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_6;
    v67[3] = &unk_24C23C138;
    v67[4] = v29;
    v67[5] = v59;
    v67[6] = v35;
    dispatch_source_set_cancel_handler(v35, v67);
    dispatch_resume(v35);
    v37 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v39 = *MEMORY[0x24BDD1278];
    v66[0] = v36;
    v66[1] = 3221225472;
    v66[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_7;
    v66[3] = &unk_24C23C188;
    v66[12] = v81;
    v66[13] = v83;
    v66[4] = identifier;
    v66[5] = v20;
    v66[6] = a4;
    v66[7] = a5;
    v66[11] = &v75;
    v66[9] = v33;
    v66[10] = a8;
    v66[14] = v85;
    v66[8] = v35;
    v40 = objc_msgSend(v37, "addObserverForName:object:queue:usingBlock:", v39, v20, v38, v66);
    v76[5] = v40;
    block[0] = v36;
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_48;
    block[3] = &unk_24C23C228;
    block[4] = v20;
    block[5] = a4;
    block[6] = v35;
    block[7] = v33;
    block[8] = identifier;
    block[9] = a5;
    block[10] = 0;
    block[11] = v60;
    *(double *)&block[14] = a1;
    block[12] = v85;
    block[13] = v83;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    goto LABEL_16;
  }
  v53 = (void *)MEMORY[0x24BDD1540];
  v87 = *MEMORY[0x24BDD0FD8];
  v88 = CFSTR("W5NoMemErr");
  v54 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v17 = a5;
  v15 = MEMORY[0x24BDAC760];
  v16 = &off_209C6A000;
  v46 = objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 2, v54);
LABEL_34:

  if (v33)
  {
    dispatch_source_cancel(v33);
  }
  else
  {

  }
  v55 = identifier;
  if (!identifier)
    v55 = dispatch_get_global_queue(0, 0);
  v64[0] = v15;
  v64[1] = *((_QWORD *)v16 + 64);
  v64[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2_52;
  v64[3] = &unk_24C23C1B0;
  v64[4] = a4;
  v64[5] = v46;
  v64[6] = v17;
  v64[7] = v20;
  v64[8] = v60;
  v64[9] = v85;
  dispatch_async(v55, v64);
  if (identifier)
    dispatch_release(identifier);

LABEL_16:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v85, 8);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, 0, 0, 0, 0, 0.0, a5);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:didLaunch:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, 0, 0, a5, a6, 0.0, a7);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, a6);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:didLaunch:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:", a3, a4, a5, 0, a6, a7, 0.0, a8);
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:
{
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  _BOOL8 v22;
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
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __115__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error___block_invoke;
  v24[3] = &unk_24C23C250;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a4, a5, a6, a7, a8, v24, a1);
  v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v36 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v19 = (id)v30[5];
  if (a9)
    *a9 = *((_BYTE *)v26 + 24);
  v20 = v30;
  if (a10)
  {
    v21 = v30[5];
    if (v21)
      *a10 = v21;
  }
  v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, 0, a6);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:didLaunch:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, a6, 0.0, a7, a8);
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:
{
  NSObject *v18;
  dispatch_time_t v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  _BOOL8 v23;
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
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = dispatch_semaphore_create(0);
  v25[1] = 3221225472;
  v25[2] = __145__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error___block_invoke;
  v25[3] = &unk_24C23C250;
  v25[5] = &v30;
  v25[6] = &v26;
  v25[4] = v18;
  v25[0] = MEMORY[0x24BDAC760];
  objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:", a4, a5, a6, a7, a8, a9, a1, v25);
  v19 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v18, v19) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v37 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v20 = (id)v31[5];
  if (a10)
    *a10 = *((_BYTE *)v27 + 24);
  v21 = v31;
  if (a11)
  {
    v22 = v31[5];
    if (v22)
      *a11 = v22;
  }
  v23 = v21[5] == 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v23;
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a3, a4, a5, 0, 0, 0, 0.0, a6);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:didLaunch:error:
{
  return objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:", a3, a4, a5, 0, a6, a7, 0.0, a8);
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:
{
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  _BOOL8 v22;
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
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __127__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error___block_invoke;
  v24[3] = &unk_24C23C250;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  objc_msgSend(MEMORY[0x24BDD17D8], "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:", a4, a5, a6, a7, a8, v24, a1);
  v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v36 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v19 = (id)v30[5];
  if (a9)
    *a9 = *((_BYTE *)v26 + 24);
  v20 = v30;
  if (a10)
  {
    v21 = v30[5];
    if (v21)
      *a10 = v21;
  }
  v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

@end
