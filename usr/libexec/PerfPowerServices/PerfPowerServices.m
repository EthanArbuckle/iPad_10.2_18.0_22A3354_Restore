uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  unsigned __int8 v3;

  EnterSandbox("PerfPowerServices", "com.apple.PerfPowerServices");
  v0 = objc_autoreleasePoolPush();
  +[PowerlogCore setupCore](PowerlogCore, "setupCore");
  objc_autoreleasePoolPop(v0);
  do
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v3 = objc_msgSend(v1, "runMode:beforeDate:", NSDefaultRunLoopMode, v2);

  }
  while ((v3 & 1) != 0);
  return 0;
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_setupCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCore");
}
