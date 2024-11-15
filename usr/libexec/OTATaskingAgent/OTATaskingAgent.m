uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (getuid())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100002BD0();
  }
  else if (a1 == 2 && !strcmp("server-init", *(const char **)(a2 + 8)))
  {
    v4 = objc_autoreleasePoolPush();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting OTATaskingAgent", v9, 2u);
    }
    v5 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.OTATaskingAgent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[OTATaskingAgent sharedListenerDelegate](OTATaskingAgent, "sharedListenerDelegate"));
    objc_msgSend(v5, "setDelegate:", v6);
    objc_msgSend(v5, "resume");
    objc_autoreleasePoolPop(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v7, "run");

  }
  return 1;
}

void sub_100001D00(id a1)
{
  OTATaskingAgent *v1;
  void *v2;

  v1 = objc_alloc_init(OTATaskingAgent);
  v2 = (void *)qword_100008780;
  qword_100008780 = (uint64_t)v1;

}

uint64_t sub_10000212C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint8_t v4[16];

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "valueForEntitlement:", CFSTR("com.apple.osanalytics.otatasking-service-access")));
  if ((objc_opt_respondsToSelector(v1, "BOOLValue") & 1) != 0 && (objc_msgSend(v1, "BOOLValue") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The connection doesn't have the right entitlement. Sending back error response.", v4, 2u);
      v2 = 0;
    }
  }

  return v2;
}

void sub_100002BD0()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "OTATaskingAgent should be run as root", v0, 2u);
}

void sub_100002C14(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "The unique string is %@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_checkForExistenceAndCreateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForExistenceAndCreateKey:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_hexStringForSHA1Digest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hexStringForSHA1Digest:");
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

id objc_msgSend_legacyCrashreporterKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyCrashreporterKey");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_randomHashWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "randomHashWithKey:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
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

id objc_msgSend_sharedListenerDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedListenerDelegate");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             v7 = "Requested to generate crashreporterKey on an upgrade install from < iOS 10.0 Returning the legacy value - %@";
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent randomHashWithKey:](self, "randomHashWithKey:", v4));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v4;
      v7 = "Created value %@ for key %@";
      v8 = OS_LOG_TYPE_INFO;
      v9 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v8, v7, (uint8_t *)&v13, v9);
    }
  }
  CFPreferencesSetAppValue(v4, v6, CFSTR("com.apple.osanalytics.OTATaskingAgent"));
  if (CFPreferencesAppSynchronize(CFSTR("com.apple.osanalytics.OTATaskingAgent")))
  {
    v5 = v6;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't save %@ to %@", (uint8_t *)&v13, 0x16u);
    }
    v5 = 0;
  }

LABEL_18:
  if (v5)
    v10 = v5;
  else
    v10 = CFSTR("0000000000000000000000000000000000000000");
  v11 = v10;

  return v11;
}

- (id)legacyCrashreporterKey
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  void *CFProperty;
  __CFString *v7;
  const char *v8;
  uint8_t *v9;
  __CFString *v10;
  __CFString *v11;
  __int16 v13;
  uint8_t buf[2];
  uint8_t v15[16];

  v3 = IOServiceMatching("IOAESAccelerator");
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v8 = "Can't create matching dict";
      v9 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_10:
    v7 = 0;
    goto LABEL_15;
  }
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Can't get service matching dict";
      v9 = buf;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v5 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("CrashReporter-ID"), kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
  if (objc_msgSend(CFProperty, "length") == (id)20)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent hexStringForSHA1Digest:](self, "hexStringForSHA1Digest:", objc_msgSend(objc_retainAutorelease(CFProperty), "bytes")));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Value returned for kCrashReporterPropertyID is not the expected length", v15, 2u);
    }
    v7 = 0;
  }

LABEL_15:
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("0000000000000000000000000000000000000000");
  v11 = v10;

  return v11;
}

- (id)hexStringForSHA1Digest:(const char *)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"), *(unsigned __int8 *)a3, *((unsigned __int8 *)a3 + 1), *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 3), *((unsigned __int8 *)a3 + 4), *((unsigned __int8 *)a3 + 5), *((unsigned __int8 *)a3 + 6), *((unsigned __int8 *)a3 + 7), *((unsigned __int8 *)a3 + 8), *((unsigned __int8 *)a3 + 9), *((unsigned __int8 *)a3 + 10), *((unsigned __int8 *)a3 + 11), *((unsigned __int8 *)a3 + 12), *((unsigned __int8 *)a3 + 13), *((unsigned __int8 *)a3 + 14), *((unsigned __int8 *)a3 + 15),
           *((unsigned __int8 *)a3 + 16),
           *((unsigned __int8 *)a3 + 17),
           *((unsigned __int8 *)a3 + 18),
           *((unsigned __int8 *)a3 + 19));
}

- (id)randomHashWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 md[20];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent legacyCrashreporterKey](self, "legacyCrashreporterKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@"), v6, v7, v4, v8));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100002C14((uint64_t)v9);
  v10 = objc_retainAutorelease(v9);
  CC_SHA1(objc_msgSend(v10, "UTF8String"), (CC_LONG)objc_msgSend(v10, "length"), md);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent hexStringForSHA1Digest:](self, "hexStringForSHA1Digest:", md));

  return v11;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSerialQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
