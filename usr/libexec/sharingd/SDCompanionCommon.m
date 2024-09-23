@implementation SDCompanionCommon

+ (id)myIPAddress
{
  int v2;
  void *v3;
  ifaddrs *v4;
  void *v5;
  unsigned int v6;
  in_addr v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  ifaddrs *v14;

  v14 = 0;
  v2 = getifaddrs(&v14);
  v3 = 0;
  v4 = v14;
  if (!v2 && v14)
  {
    v3 = 0;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4->ifa_name));
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("en0"));

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", inet_ntoa(v7));
          v9 = objc_claimAutoreleasedReturnValue(v8);

          v3 = (void *)v9;
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v14;
  }
  freeifaddrs(v4);
  v11 = daemon_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1000B8710((uint64_t)v3, v12);

  return v3;
}

@end
