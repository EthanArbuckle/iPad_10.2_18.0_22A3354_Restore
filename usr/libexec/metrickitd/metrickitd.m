uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;

  v0 = objc_autoreleasePoolPush();
  _set_user_dir_suffix(objc_msgSend(CFSTR("com.apple.metrickitd"), "UTF8String"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MXCore sharedCore](MXCore, "sharedCore"));
  if (v1)
  {
    do
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      v4 = objc_msgSend(v2, "runMode:beforeDate:", NSDefaultRunLoopMode, v3);

    }
    while ((v4 & 1) != 0);
    v5 = 0;
  }
  else
  {
    NSLog(CFSTR("Failed to start core"));
    v5 = 1;
  }

  objc_autoreleasePoolPop(v0);
  return v5;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
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

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCore");
}
