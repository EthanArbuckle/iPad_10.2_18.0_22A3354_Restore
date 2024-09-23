@implementation NSTask

uint64_t __62__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputData_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a3, 0);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = result;
  if (a3)
    result = objc_msgSend(*(id *)(result + 32), "appendData:");
  if (a4)
    return objc_msgSend(*(id *)(v5 + 40), "appendData:", a4);
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  return result;
}

uint64_t __77__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFilePath_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __135__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  objc_msgSend(*(id *)(a1 + 40), "closeFile");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __79__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFileHandle_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a3, 0);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void *__117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *result;

  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "writeData:");
  result = *(void **)(a1 + 40);
  if (result)
    return (void *)objc_msgSend(result, "writeData:", a4);
  return result;
}

uint64_t __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  return result;
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke(uint64_t a1)
{
  void *v2;
  ssize_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[6];
  __int128 v7;
  _BYTE v8[4096];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    v4 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2;
    block[3] = &unk_24C23C0E8;
    v7 = *(_OWORD *)(a1 + 48);
    v5 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = a1[6];
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], 0);
  }
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_3(uint64_t a1)
{

  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  ssize_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[6];
  __int128 v7;
  _BYTE v8[4096];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    v4 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_5;
    block[3] = &unk_24C23C0E8;
    v7 = *(_OWORD *)(a1 + 48);
    v5 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = a1[6];
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], 0, a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_6(uint64_t a1)
{

  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[10];
  _QWORD block[5];
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v2 = *(NSObject **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_8;
  block[3] = &unk_24C23C160;
  block[4] = *(_QWORD *)(a1 + 96);
  dispatch_async(v2, block);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    v17 = *MEMORY[0x24BDD0FD8];
    v18[0] = CFSTR("W5TimeoutErr");
    v4 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1));
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "terminationStatus");
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD0FD8];
      v16 = CFSTR("terminationStatus");
      v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v4 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v5, v7);
    }
    else
    {
      v4 = 0;
    }
  }
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_40;
  v13[3] = &unk_24C23C1B0;
  v8 = *(_QWORD *)(a1 + 56);
  v13[4] = *(_QWORD *)(a1 + 48);
  v13[5] = v4;
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13[6] = v8;
  v13[7] = v11;
  v12 = *(_QWORD *)(a1 + 112);
  v13[8] = v9;
  v13[9] = v12;
  dispatch_async(v10, v13);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));

}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_8(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_40(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      v5 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    else
      v5 = &stru_24C23DB48;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    v11 = 136316674;
    v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    v13 = 2080;
    v14 = "W5TaskUtil.m";
    v15 = 1024;
    v16 = 451;
    v17 = 2114;
    v18 = v4;
    v19 = 2114;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    LODWORD(v10) = 68;
    v9 = &v11;
    _os_log_send_and_compose_impl();
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager", v9, v10), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_48(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  dispatch_time_t v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD block[5];
  int8x16_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(a1 + 32), "launch");
  v3 = *(NSObject **)(a1 + 64);
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_50;
  block[3] = &unk_24C23C1D8;
  v5 = *(_QWORD *)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v12 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  v6 = *(_QWORD *)(a1 + 88);
  v13 = v5;
  v14 = v6;
  dispatch_async(v3, block);
  v7 = *(double *)(a1 + 112);
  if (v7 > 0.0)
  {
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_51;
    v10[3] = &unk_24C23C200;
    v9 = *(_QWORD *)(a1 + 104);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v9;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);
  }
  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_49(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v9 = *MEMORY[0x24BDD0FD8];
    v10 = CFSTR("W5ResourceErr");
    v5 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(" "));
    v11 = 136316674;
    v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    v13 = 2080;
    v14 = "W5TaskUtil.m";
    v15 = 1024;
    v16 = 486;
    v17 = 2114;
    v18 = v4;
    v19 = 2114;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    _os_log_send_and_compose_impl();
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_autoreleasePoolPop(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_50(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;

  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    _os_log_send_and_compose_impl();
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

uint64_t __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_51(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return kill(objc_msgSend(*(id *)(a1 + 32), "processIdentifier"), 9);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2_52(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;

  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    _os_log_send_and_compose_impl();
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

intptr_t __115__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error___block_invoke(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __145__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error___block_invoke(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __127__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error___block_invoke(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
