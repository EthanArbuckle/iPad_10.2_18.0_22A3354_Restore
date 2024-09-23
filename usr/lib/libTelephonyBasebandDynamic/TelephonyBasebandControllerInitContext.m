@implementation TelephonyBasebandControllerInitContext

dispatch_queue_t __TelephonyBasebandControllerInitContext_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.libTelephonyUtil", 0);
  qword_253D92508 = (uint64_t)result;
  qword_253D92520 = 0;
  qword_253D92530 = 0;
  qword_253D92528 = (uint64_t)&qword_253D92520;
  qword_253D92538 = (uint64_t)&qword_253D92530;
  qword_253D92540 = 0;
  qword_253D92548 = (uint64_t)&qword_253D92540;
  return result;
}

void __TelephonyBasebandControllerInitContext_block_invoke_2(uint64_t a1)
{
  mach_port_t v2;
  uint64_t v3;
  IONotificationPort *v4;
  CFRunLoopSourceRef RunLoopSource;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  char v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(IONotificationPort **)(v3 + 24);
  if (v4)
  {
    *(_DWORD *)(v3 + 56) = 0;
    *(_QWORD *)(v3 + 64) = 0;
    *(_DWORD *)(v3 + 4) = 0;
    *(_DWORD *)(v3 + 32) = 0;
    RunLoopSource = IONotificationPortGetRunLoopSource(v4);
    *(_QWORD *)(v3 + 40) = RunLoopSource;
    if (RunLoopSource)
    {
      v6 = IOServiceMatching("AppleBaseband");
      MatchingService = IOServiceGetMatchingService(v2, v6);
      *(_DWORD *)(v3 + 4) = MatchingService;
      if (MatchingService)
      {
        v8 = 1;
LABEL_11:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
        return;
      }
      _TelephonyUtilDebugPrintError();
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v8 = 0;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315394;
      v13 = "TelephonyBasebandController";
      v14 = 2080;
      v15 = "AppleBaseband";
      v9 = MEMORY[0x24BDACB70];
      v10 = "%s: Failed to find %s service, registering for matching notification";
      v11 = 22;
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136315138;
      v13 = "TelephonyBasebandController";
      v9 = MEMORY[0x24BDACB70];
      v10 = "%s: Could not create run loop source";
      v11 = 12;
    }
    _os_log_error_impl(&dword_20E5DE000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
    goto LABEL_10;
  }
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "TelephonyBasebandController";
    _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Could not create notification port", buf, 0xCu);
  }
}

void __TelephonyBasebandControllerInitContext_block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  IONotificationPort *v3;
  NSObject *v4;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  kern_return_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "TelephonyBasebandController";
    _os_log_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: AppleBaseband IOService is not found. Finding it via matching service", buf, 0xCu);
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(IONotificationPort **)(v2 + 24);
  if (!v3)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v14 = "TelephonyBasebandController";
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s: Invalid notification port";
LABEL_15:
    v11 = 12;
    goto LABEL_16;
  }
  v4 = *(NSObject **)(v2 + 72);
  if (!v4)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v14 = "TelephonyBasebandController";
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s: Invalid queue";
    goto LABEL_15;
  }
  IONotificationPortSetDispatchQueue(v3, v4);
  v5 = *(IONotificationPort **)(v2 + 24);
  v6 = IOServiceMatching("AppleBaseband");
  v7 = IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)_TelephonyBasebandControllerServiceNotifyCallback, (void *)v2, (io_iterator_t *)(v2 + 8));
  if (!v7)
  {
    _TelephonyBasebandControllerServiceNotifyCallback(v2, *(_DWORD *)(v2 + 8));
    v12 = 1;
    goto LABEL_12;
  }
  v8 = v7;
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "TelephonyBasebandController";
    v15 = 1024;
    v16 = v8;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s: Failed to add IOService notification, err: 0x%x";
    v11 = 18;
LABEL_16:
    _os_log_error_impl(&dword_20E5DE000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
  }
LABEL_11:
  v12 = 0;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
}

void __TelephonyBasebandControllerInitContext_block_invoke_10(uint64_t a1)
{
  io_connect_t *v2;
  char v3;
  kern_return_t v4;
  kern_return_t v5;
  __int128 v6;
  const char *v7;
  uint8_t buf[16];
  _BYTE __str[32];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = &qword_253D92520;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = &qword_253D92530;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = &qword_253D92540;
  v2 = *(io_connect_t **)(a1 + 40);
  if (*v2)
  {
LABEL_2:
    v3 = 1;
    goto LABEL_7;
  }
  v4 = IOServiceOpen(v2[1], *MEMORY[0x24BDAEC58], 0, v2);
  if (!v4)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v10 = v6;
    v11 = v6;
    *(_OWORD *)__str = v6;
    *(_OWORD *)&__str[16] = v6;
    v7 = getprogname();
    snprintf(__str, 0x40uLL, "%s: TelephonyBaseband", v7);
    if (IOConnectCallMethod(*v2, 0xFu, 0, 0, __str, 0x40uLL, 0, 0, 0, 0))
    {
      _TelephonyUtilDebugPrintError();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to self-identify with AppleBaseband", buf, 2u);
      }
    }
    goto LABEL_2;
  }
  v5 = v4;
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__str = 136315394;
    *(_QWORD *)&__str[4] = "TelephonyBasebandController";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = v5;
    _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: could not open service, ret = 0x%08x", __str, 0x12u);
  }
  v3 = 0;
LABEL_7:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

@end
