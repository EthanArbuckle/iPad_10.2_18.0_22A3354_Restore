uint64_t edt_supports_recoveryos(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char v11;

  if (edt_supports_recoveryos_onceToken != -1)
    dispatch_once(&edt_supports_recoveryos_onceToken, &__block_literal_global);
  v9 = edt_supports_recoveryos_supports;
  if ((edt_supports_recoveryos_supports & 1) == 0 && a1)
  {
    v9 = 1;
    logfunction((uint64_t)"", 1, CFSTR("supports-recoveryos is false, but returning true on internal\n"), a4, a5, a6, a7, a8, v11);
  }
  return v9;
}

void __edt_supports_recoveryos_block_invoke(id a1)
{
  io_registry_entry_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  io_object_t v7;
  const __CFData *CFProperty;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *v14;
  CFTypeID v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const UInt8 *BytePtr;
  int64_t Length;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;

  v1 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product");
  if (v1)
  {
    v7 = v1;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, CFSTR("supports-recoveryos"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v14 = CFProperty;
      v15 = CFGetTypeID(CFProperty);
      if (v15 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v14);
        Length = CFDataGetLength(v14);
        if (!Length || Length <= 4 && memcmp(BytePtr, &_block_invoke_kZeroBytes, Length))
          edt_supports_recoveryos_supports = 1;
        logfunction((uint64_t)"", 1, CFSTR("supports-recoveryos is %d in EDT\n"), v23, v24, v25, v26, v27, edt_supports_recoveryos_supports);
      }
      else
      {
        logfunction((uint64_t)"", 1, CFSTR("Expected supports-recoveryos to be of data type\n"), v16, v17, v18, v19, v20, v28);
      }
      CFRelease(v14);
    }
    else
    {
      logfunction((uint64_t)"", 1, CFSTR("Did not find supports-recoveryos property for product\n"), v9, v10, v11, v12, v13, v28);
    }
    IOObjectRelease(v7);
  }
  else
  {
    logfunction((uint64_t)"", 1, CFSTR("Failed to find product entry in EDT\n"), v2, v3, v4, v5, v6, v29);
  }
}

void logfunction(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v10;

  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a3, &a9);
  NSLog(CFSTR("%s: %@"), a1, v10);
  CFRelease(v10);
}

id nrdSharedLogger()
{
  if (nrdSharedLogger_pred != -1)
    dispatch_once(&nrdSharedLogger_pred, &__block_literal_global_0);
  return (id)nrdSharedLogger___instance;
}

void __nrdSharedLogger_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileSoftwareUpdate", "NRD");
  v2 = (void *)nrdSharedLogger___instance;
  nrdSharedLogger___instance = (uint64_t)v1;

}

uint64_t load_trust_cache_at_path(const char *a1, NSError **a2)
{
  char v3;
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  NSError *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFBoolean *v24;
  void *v26;
  void *v27;
  const __CFDictionary *v28;
  io_service_t MatchingService;
  io_object_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char outputStruct;
  char outputStructb;
  char outputStructa;
  size_t v64;
  io_connect_t connect;
  stat v66;
  NSErrorUserInfoKey v67;
  NSString *v68;
  NSErrorUserInfoKey v69;
  NSString *v70;
  NSErrorUserInfoKey v71;
  const __CFString *v72;
  NSErrorUserInfoKey v73;
  NSString *v74;
  NSErrorUserInfoKey v75;
  NSString *v76;
  char __s1[1024];
  NSErrorUserInfoKey v78;
  NSString *v79;

  v3 = (char)a1;
  memset(&v66, 0, sizeof(v66));
  connect = 0;
  v4 = open(a1, 0);
  if (v4 < 0)
  {
    v16 = *__error();
    v78 = NSDebugDescriptionErrorKey;
    v17 = __error();
    v79 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("open() failed: %s"), strerror(*v17));
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v16, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
    v18 = __error();
    strerror(*v18);
    logfunction((uint64_t)"", 1, CFSTR("Could not open trust cache at path %s: %s.\n"), v19, v20, v21, v22, v23, v3);
    v24 = (const __CFBoolean *)MGCopyAnswer(CFSTR("SigningFuse"), 0);
    if (v24 == kCFBooleanFalse
      && (bzero(__s1, 0x400uLL), v64 = 1024, !sysctlbyname("kern.bootargs", __s1, &v64, 0, 0))
      && strstr(__s1, "msu_eng_brain=1"))
    {
      v15 = 1;
      logfunction((uint64_t)"", 1, CFSTR("System policy for update brain is in effect.\n"), v53, v54, v55, v56, v57, outputStructa);
      v8 = 0;
    }
    else
    {
      v15 = 0;
    }
    CFRelease(v24);
    goto LABEL_9;
  }
  v5 = v4;
  if (fstat(v4, &v66))
  {
    v6 = *__error();
    v75 = NSDebugDescriptionErrorKey;
    v7 = __error();
    v76 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fstat() failed: %s"), strerror(*v7));
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
    v9 = __error();
    outputStructb = strerror(*v9);
    logfunction((uint64_t)"", 1, CFSTR("Could not fstat trust cache: %s\n"), v10, v11, v12, v13, v14, outputStructb);
LABEL_4:
    close(v5);
    v15 = 0;
    goto LABEL_9;
  }
  v26 = mmap(0, v66.st_size, 1, 1026, v5, 0);
  if (v26 == (void *)-1)
  {
    v39 = *__error();
    v73 = NSDebugDescriptionErrorKey;
    v40 = __error();
    v74 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mmap() failed: %s"), strerror(*v40));
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    v41 = __error();
    strerror(*v41);
    logfunction((uint64_t)"", 1, CFSTR("Could not map file %s: %s\n"), v42, v43, v44, v45, v46, v3);
    goto LABEL_4;
  }
  v27 = v26;
  v28 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v28);
  v30 = MatchingService;
  if (!MatchingService)
  {
    v71 = NSDebugDescriptionErrorKey;
    v72 = CFSTR("Could not find AppleMobileFileIntegrity service");
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
    v52 = CFSTR("Could not find AppleMobileFileIntegrity service\n");
LABEL_22:
    logfunction((uint64_t)"", 1, v52, v47, v48, v49, v50, v51, outputStruct);
    goto LABEL_23;
  }
  v31 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  if (!(_DWORD)v31)
  {
    v58 = IOConnectCallMethod(connect, 2u, 0, 0, v27, v66.st_size, 0, 0, 0, 0);
    if (!(_DWORD)v58)
    {
      v8 = 0;
      v15 = 1;
      goto LABEL_24;
    }
    v59 = v58;
    v60 = (int)v58;
    v67 = NSDebugDescriptionErrorKey;
    v68 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOConnectCallMethod() failed: 0x%x"), v58);
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("IOKitErrorDomain"), v60, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
    outputStruct = v59;
    v52 = CFSTR("Unable to load trust cache: 0x%x\n");
    goto LABEL_22;
  }
  v32 = v31;
  v33 = (int)v31;
  v69 = NSDebugDescriptionErrorKey;
  v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOServiceOpen() failed: 0x%x"), v31);
  v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("IOKitErrorDomain"), v33, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
  logfunction((uint64_t)"", 1, CFSTR("Unable to open user client: 0x%x\n"), v34, v35, v36, v37, v38, v32);
LABEL_23:
  v15 = 0;
LABEL_24:
  close(v5);
  munmap(v27, v66.st_size);
  if (connect)
    IOServiceClose(connect);
  if (v30)
    IOObjectRelease(v30);
LABEL_9:
  if (a2)
    *a2 = v8;
  return v15;
}

void sub_100001EA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, id a13)
{
  uint64_t v13;
  id v14;

  if (a2 == 1)
  {
    v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = CFSTR("ExceptionDescription");
    a12 = CFSTR("Exception invoking NRDUpdateBrain");
    a13 = objc_msgSend(v14, "description");
    (*(void (**)(uint64_t, NSError *))(v13 + 16))(v13, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 113, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &a12, &a10, 2)));
    objc_end_catch();
    JUMPOUT(0x100001E78);
  }
  _Unwind_Resume(exception_object);
}

void sub_100001FC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10000249C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100002F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000465C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000062E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100009004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  id v3;
  NSObject *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _DWORD v15[4];
  _BYTE buf[24];
  void *v17;
  int v18;

  v3 = nrdSharedLogger();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "Aug  3 2024";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "11:23:29";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting NRDUpdated built %s %s", buf, 0x16u);
  }

  global_queue = dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __setupSignalHandlers_block_invoke;
  v17 = &__block_descriptor_36_e5_v8__0l;
  v18 = 15;
  dispatch_source_set_event_handler(v7, buf);
  dispatch_resume(v7);
  v8 = (void *)setupSignalHandlers_signalSources_0;
  setupSignalHandlers_signalSources_0 = (uint64_t)v7;

  signal(15, (void (__cdecl *)(int))1);
  v9 = nrdSharedLogger();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = 15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] signal handler has been registered for signal: %d", (uint8_t *)v15, 8u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NRDUpdateDaemonServerImpl sharedInstance](NRDUpdateDaemonServerImpl, "sharedInstance"));
  objc_msgSend(v11, "runUntilExit");

  v12 = nrdSharedLogger();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exiting NRDUpdated", buf, 2u);
  }

  return 0;
}

void __setupSignalHandlers_block_invoke(uint64_t a1)
{
  int v1;
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v5[2];

  v1 = *(_DWORD *)(a1 + 32);
  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v1 == 15)
  {
    if (v4)
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] received SIGTERM, exiting", (uint8_t *)v5, 2u);
    }

    exit(1);
  }
  if (v4)
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SIGNAL_HANDLER] unhandled signal: %d (ignored)", (uint8_t *)v5, 8u);
  }

}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__connectToServerIfNecessary_nolock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToServerIfNecessary_nolock");
}

id objc_msgSend__infoClassForAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_infoClassForAction:");
}

id objc_msgSend__invalidateConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateConnection");
}

id objc_msgSend__invalidateConnection_nolock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateConnection_nolock");
}

id objc_msgSend__isAppRefresh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAppRefresh");
}

id objc_msgSend__isBrainRelaunchRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBrainRelaunchRequired:");
}

id objc_msgSend__minimumInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_minimumInterval:");
}

id objc_msgSend__remoteInterfaceWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteInterfaceWithErrorHandler:");
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_run");
}

id objc_msgSend__setAdditionalXPCActivityProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAdditionalXPCActivityProperties:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_actionBeginBrainScan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionBeginBrainScan:");
}

id objc_msgSend_actionCheckDeviceUnlockConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionCheckDeviceUnlockConstraint:");
}

id objc_msgSend_actionDownloadBrainUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionDownloadBrainUpdate:");
}

id objc_msgSend_actionLoadBrain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionLoadBrain:");
}

id objc_msgSend_actionLoadPersisted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionLoadPersisted:");
}

id objc_msgSend_actionPeriodicScan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionPeriodicScan:");
}

id objc_msgSend_actionRunBrain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionRunBrain:");
}

id objc_msgSend_actionScheduleRetry_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionScheduleRetry:error:");
}

id objc_msgSend_actionUnknownAction_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionUnknownAction:error:");
}

id objc_msgSend_actionWaitForUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWaitForUnlock:");
}

id objc_msgSend_activateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateMachine");
}

id objc_msgSend_allowBackgroundActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowBackgroundActivity");
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetId");
}

id objc_msgSend_assetProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetProperty:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brain");
}

id objc_msgSend_brainAtPath_delegate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brainAtPath:delegate:error:");
}

id objc_msgSend_brainLoadRequiresUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brainLoadRequiresUnlock");
}

id objc_msgSend_calculateCurrentRequiredSpace_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateCurrentRequiredSpace:callback:");
}

id objc_msgSend_cancelNeRDUpdate_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelNeRDUpdate:callback:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cleanBeforeScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanBeforeScan");
}

id objc_msgSend_cleanReScanScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanReScanScheduler");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedWithError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedWithError");
}

id objc_msgSend_connectToServerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToServerIfNecessary");
}

id objc_msgSend_connectionInterrupted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInterrupted");
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInvalidated");
}

id objc_msgSend_constructSoftwareUpdateMAAssetQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constructSoftwareUpdateMAAssetQuery");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_core(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "core");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delay");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadNeRDUpdate_options_progress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadNeRDUpdate:options:progress:completion:");
}

id objc_msgSend_downloadPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadPolicy");
}

id objc_msgSend_downloadPreflightPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadPreflightPolicy");
}

id objc_msgSend_downloadSoftwareUpdateAssetWithPolicy_withUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadSoftwareUpdateAssetWithPolicy:withUUID:");
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTransactions");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_findLocalBrainAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findLocalBrainAsset");
}

id objc_msgSend_finishNeRDUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishNeRDUpdate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_forceBrainUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceBrainUpdate");
}

id objc_msgSend_getListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getListenerEndpoint:");
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalUrl");
}

id objc_msgSend_getSchedulerQOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSchedulerQOS");
}

id objc_msgSend_handleConnectionError_method_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnectionError:method:handler:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initMachine_withTable_startingIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initMachine:withTable:startingIn:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_forAsset_updateUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:forAsset:updateUUID:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithProgressBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressBlock:");
}

id objc_msgSend_initWithServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:options:");
}

id objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:");
}

id objc_msgSend_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:");
}

id objc_msgSend_initWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:");
}

id objc_msgSend_installNeRDUpdate_options_progress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installNeRDUpdate:options:progress:completion:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interval");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBrainLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBrainLoaded");
}

id objc_msgSend_isConnectionEntitled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnectionEntitled:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeLocked");
}

id objc_msgSend_isPreregistered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPreregistered");
}

id objc_msgSend_keyBagQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyBagQueue");
}

id objc_msgSend_keyBagStateChangedNotifyToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyBagStateChangedNotifyToken");
}

id objc_msgSend_loadBrainAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBrainAsset");
}

id objc_msgSend_loadBrainPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBrainPolicy");
}

id objc_msgSend_localBrainAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localBrainAsset");
}

id objc_msgSend_locateAvailableUpdateWithPolicy_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locateAvailableUpdateWithPolicy:completion:");
}

id objc_msgSend_maControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maControl");
}

id objc_msgSend_needsRelaunchError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsRelaunchError");
}

id objc_msgSend_newBrain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBrain:");
}

id objc_msgSend_noteConnectionDropped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteConnectionDropped");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUpdate:");
}

id objc_msgSend_periodicScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodicScheduler");
}

id objc_msgSend_ping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ping:");
}

id objc_msgSend_ping_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ping:reply:");
}

id objc_msgSend_postEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEvent:");
}

id objc_msgSend_postEvent_withInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEvent:withInfo:");
}

id objc_msgSend_purgeNeRDUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeNeRDUpdate:");
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeSync");
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "qualityOfService");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMetaDataSync");
}

id objc_msgSend_queryNeRDUpdate_build_options_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryNeRDUpdate:build:options:callback:");
}

id objc_msgSend_registerAction_ForEvent_inState_usingDelegate_withInfoClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAction:ForEvent:inState:usingDelegate:withInfoClass:");
}

id objc_msgSend_registerUpdatedFSMhandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUpdatedFSMhandlers");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllAssetsOfType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllAssetsOfType:completion:");
}

id objc_msgSend_repeats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repeats");
}

id objc_msgSend_requestExit_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestExit:reason:");
}

id objc_msgSend_requestExit_reason_relaunchError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestExit:reason:relaunchError:");
}

id objc_msgSend_rescanScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescanScheduler");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_run_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run:callback:");
}

id objc_msgSend_run_options_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run:options:callback:");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_runUntilExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilExit");
}

id objc_msgSend_runningBrain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningBrain");
}

id objc_msgSend_scanPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanPolicy");
}

id objc_msgSend_scheduleNRDUpdateBrainPeriodicScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNRDUpdateBrainPeriodicScan");
}

id objc_msgSend_scheduleNRDUpdateBrainReScan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNRDUpdateBrainReScan:");
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleWithBlock:");
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduler");
}

id objc_msgSend_setAllowSameVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowSameVersion:");
}

id objc_msgSend_setAllowsCellular_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellular:");
}

id objc_msgSend_setBrain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrain:");
}

id objc_msgSend_setCheckInHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckInHandler:");
}

id objc_msgSend_setCompatibilityVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompatibilityVersion:");
}

id objc_msgSend_setCompletedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedWithError:");
}

id objc_msgSend_setCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCore:");
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableUI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableUI:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockOnNetworkStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockOnNetworkStatus:");
}

id objc_msgSend_setDownloadPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadPolicy:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setForceBrainUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceBrainUpdate:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyBagQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyBagQueue:");
}

id objc_msgSend_setKeyBagStateChangedNotifyToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyBagStateChangedNotifyToken:");
}

id objc_msgSend_setLoadBrainAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadBrainAsset:");
}

id objc_msgSend_setLocalBrainAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalBrainAsset:");
}

id objc_msgSend_setMaControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaControl:");
}

id objc_msgSend_setNeedsRelaunchError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsRelaunchError:");
}

id objc_msgSend_setPeriodicScheduler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeriodicScheduler:");
}

id objc_msgSend_setPreregistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreregistered:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setReleaseType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReleaseType:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepeats:");
}

id objc_msgSend_setRescanScheduler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRescanScheduler:");
}

id objc_msgSend_setRestrictToFull_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictToFull:");
}

id objc_msgSend_setRunningBrain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningBrain:");
}

id objc_msgSend_setScanPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanPolicy:");
}

id objc_msgSend_setScanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanner:");
}

id objc_msgSend_setStateTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateTable:");
}

id objc_msgSend_setTolerance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTolerance:");
}

id objc_msgSend_setUpdateBrainAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateBrainAsset:");
}

id objc_msgSend_setUpdateOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateOptions:");
}

id objc_msgSend_setUpdateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateQueue:");
}

id objc_msgSend_setUpdatedFSM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedFSM:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_set_appRefresh_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_appRefresh:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDefer");
}

id objc_msgSend_softwareUpdateDownloadPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "softwareUpdateDownloadPolicy");
}

id objc_msgSend_softwareUpdateScanPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "softwareUpdateScanPolicy");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stateTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateTable");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_tolerance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tolerance");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_update_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update:");
}

id objc_msgSend_updateAttempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAttempt");
}

id objc_msgSend_updateBrainAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBrainAsset");
}

id objc_msgSend_updateCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCompleted:");
}

id objc_msgSend_updateHelper_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHelper:callback:");
}

id objc_msgSend_updateOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOptions");
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateQueue");
}

id objc_msgSend_updatedFSM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedFSM");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
