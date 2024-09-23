uint64_t start()
{
  void *v0;
  ServiceDelegate *v1;
  id v2;

  stru_100008688.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000030AC;
  *(_QWORD *)&stru_100008688.sa_mask = 0;
  sigaction(15, &stru_100008688, 0);
  v0 = objc_autoreleasePoolPush();
  v1 = objc_opt_new(ServiceDelegate);
  v2 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.DataDetectorsSourceAccess"));
  objc_msgSend(v2, "setDelegate:", v1);
  objc_msgSend(v2, "resume");
  CFRunLoopRun();

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_1000030AC(int a1)
{
  __CFRunLoop *Current;

  if (a1 == 15)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserIdentifier");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuditToken:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
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

id objc_msgSend_setProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessIdentifier:");
}

id objc_msgSend_setUserIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserIdentifier:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}
