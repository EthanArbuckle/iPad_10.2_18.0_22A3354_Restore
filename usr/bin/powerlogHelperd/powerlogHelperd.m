uint64_t start()
{
  void *v0;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v0 = objc_autoreleasePoolPush();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** start powerlogHelperd ***"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100003D08, CFSTR("com.apple.powerlogHelperd.state_changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"));
  objc_msgSend(v2, "startCore");

  objc_autoreleasePoolPop(v0);
  do
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v5 = objc_msgSend(v3, "runMode:beforeDate:", NSDefaultRunLoopMode, v4);

  }
  while ((v5 & 1) != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"));
  objc_msgSend(v6, "stopCore");

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** stop powerlogHelperd ***"));
  return 0;
}

void sub_100003D08()
{
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    NSLog(CFSTR("*** PLStateChanged ***"));
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_debugEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugEnabled");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCore");
}

id objc_msgSend_startCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCore");
}

id objc_msgSend_stopCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCore");
}
