void sub_100001A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v9;
  const __CFString *v10;
  CFIndex Length;
  CFIndex v12;
  char *v13;

  v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("libMobileGestalt %s:%d: %@"), a1, a2, a3, 0);
  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v9, &a9);
  Length = CFStringGetLength(v10);
  v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v13 = (char *)malloc_type_calloc(1uLL, v12, 0xBF105376uLL);
  if (v13)
  {
    if (CFStringGetCString(v10, v13, v12, 0x8000100u) == 1 && off_100008788 != 0)
      off_100008788(v13);
  }
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  free(v13);
}

uint64_t start()
{
  void *v0;
  id v1;
  MobileGestaltHelperListener *v2;
  uint64_t v3;
  void *v4;
  dispatch_time_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  MobileGestaltHelperListener *v10;
  id v11;
  _QWORD v13[4];
  MobileGestaltHelperListener *v14;
  id v15;

  v0 = objc_autoreleasePoolPush();
  _MGSetServer();
  +[NSXPCListener enableTransactions](NSXPCListener, "enableTransactions");
  v1 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.mobilegestalt.xpc"));
  v2 = objc_alloc_init(MobileGestaltHelperListener);
  v3 = os_transaction_create("com.apple.mobilegestalt.xpc.wakeup");
  v4 = (void *)qword_100008790;
  qword_100008790 = v3;

  v5 = dispatch_time(0, 5000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v5, v7, &stru_100004298);

  objc_msgSend(v1, "setDelegate:", v2);
  objc_msgSend(v1, "resume");
  v8 = (void *)os_transaction_create("Write MGCache");
  v9 = dispatch_time(0, 1000000000);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000027B0;
  v13[3] = &unk_1000042C0;
  v10 = v2;
  v14 = v10;
  v15 = v8;
  v11 = v8;
  dispatch_after(v9, v7, v13);

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();

  return 0;
}

void sub_100002788(id a1)
{
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
}

id sub_1000027B0(uint64_t a1)
{
  char v2;
  id result;
  uint8_t v4[16];
  uint8_t buf[16];

  v2 = _MGCacheValid();
  result = objc_msgSend(*(id *)(a1 + 32), "needsNewCachePostBoot");
  if ((v2 & 1) != 0)
  {
    if ((_DWORD)result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Rebuild MGCache on boot was requested. Rebuilding cache.", v4, 2u);
      }
      return (id)_MGRebuildCache();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MGCache was not valid. Writing new cache.", buf, 2u);
    }
    return (id)_MGWriteCache();
  }
  return result;
}

void sub_100002878(id a1)
{
  void *v1;

  v1 = (void *)qword_100008790;
  qword_100008790 = 0;

}

void sub_100002894(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000028A4(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "processNameForConnection:", a2));
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "asked question: p = %@, q = AppleTVMode, a = %@", (uint8_t *)&v5, 0x16u);

  sub_100002888();
}

void sub_100002944()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to query boot uuid", v0, 2u);
}

void sub_100002988(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = a2;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to write %@ to %@ with error %@", (uint8_t *)&v6, 0x20u);

}

void sub_100002A44(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100002894((void *)&_mh_execute_header, &_os_log_default, v2, "File exists, but couldnt be read. Error: %@", v3, v4, v5, v6, 2u);

  sub_100002888();
}

void sub_100002AC4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100002894((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to remove sentinel %@", v3, v4, v5, v6, 2u);

  sub_100002888();
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentMode");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTransactions");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_getSentinelPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSentinelPath");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "height");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_needsNewCachePostBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsNewCachePostBoot");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_processNameForConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processNameForConnection:");
}

id objc_msgSend_queryBootUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryBootUUID");
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionCode");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setCacheSentinel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCacheSentinel");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "width");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
