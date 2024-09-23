uint64_t start()
{
  NSObject *v0;
  void *v2;
  id v3;
  char *errorbuf;
  uint8_t buf[4];
  char *v6;

  -[NSProcessInfo arguments](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "arguments");
  _NSCoreDataLog(4, CFSTR("coredatad launched with argc: %d argv: %@"));
  errorbuf = 0;
  if (sandbox_init("com.apple.coredatad", 1uLL, &errorbuf))
  {
    _NSCoreDataLog(17, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Failed to enter sandbox: %s"));
    v0 = qword_100008130;
    if (os_log_type_enabled((os_log_t)qword_100008130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = errorbuf;
      _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "CoreData: Failed to enter sandbox: %s", buf, 0xCu);
    }
    return 1;
  }
  else
  {
    v2 = objc_autoreleasePoolPush();
    _NSCoreDataLog(4, CFSTR("Bringing up cloudkit server: %@ / %@"));
    v3 = +[NSCloudKitMirroringDelegate createCloudKitServerWithMachServiceName:andStorageDirectoryPath:](NSCloudKitMirroringDelegate, "createCloudKitServerWithMachServiceName:andStorageDirectoryPath:", 0, 0);
    objc_msgSend(v3, "setUp");
    objc_autoreleasePoolPop(v2);
    -[NSRunLoop run](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "run");
    _NSCoreDataLog(4, CFSTR("Tearing down coredatad."));
    _NSCoreDataLog(4, CFSTR("Tearing down cloudkit server: %@"));
    objc_msgSend(v3, "tearDown");

    return 0;
  }
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_createCloudKitServerWithMachServiceName_andStorageDirectoryPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCloudKitServerWithMachServiceName:andStorageDirectoryPath:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_pflogFaultLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pflogFaultLog");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUp");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDown");
}
