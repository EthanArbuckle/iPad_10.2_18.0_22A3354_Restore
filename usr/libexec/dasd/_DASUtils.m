@implementation _DASUtils

+ (id)processNameFromPID:(int)a3
{
  void *v3;
  NSObject *v4;
  __int128 v6;
  char v7;
  __int128 buffer;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  buffer = 0u;
  v9 = 0u;
  if (proc_pidinfo(a3, 13, 1uLL, &buffer, 64) != 64
    || (v6 = v9,
        v7 = 0,
        (v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v6))) == 0))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dasUtils")));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000EB9A4(v4);

    v3 = 0;
  }
  return v3;
}

@end
