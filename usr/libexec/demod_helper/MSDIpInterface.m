@implementation MSDIpInterface

+ (id)getIpv4Interfaces
{
  NSMutableArray *v2;
  ifaddrs *v3;
  id v4;
  NSObject *v5;
  sockaddr *ifa_addr;
  const char *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  int sa_family;
  NSMutableArray *v21;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  ifaddrs *v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  char v38[16];

  v31 = 0;
  v2 = objc_opt_new(NSMutableArray);
  if (getifaddrs(&v31))
  {
    v30 = sub_100024A40();
    v24 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10002FBB4();
    goto LABEL_24;
  }
  v3 = v31;
  if (!v31)
    goto LABEL_20;
  do
  {
    v4 = sub_100024A40();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sa_family = v3->ifa_addr->sa_family;
      *(_DWORD *)buf = 136315394;
      v35 = "+[MSDIpInterface getIpv4Interfaces]";
      v36 = 1024;
      LODWORD(v37) = sa_family;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s - Address family:  %d", buf, 0x12u);
    }

    ifa_addr = v3->ifa_addr;
    if (ifa_addr->sa_family == 2)
    {
      v7 = inet_ntop(2, &ifa_addr->sa_data[2], v38, 0x10u);
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
        v9 = sub_100024A40();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v35 = "+[MSDIpInterface getIpv4Interfaces]";
          v36 = 2114;
          v37 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s - Address:  %{public}@", buf, 0x16u);
        }

        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("127.0.0.1")) & 1) != 0)
          goto LABEL_16;
        v11 = inet_ntop(2, &v3->ifa_netmask->sa_data[2], v38, 0x10u);
        if (v11)
        {
          v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
          v13 = inet_ntop(2, &v3->ifa_dstaddr->sa_data[2], v38, 0x10u);
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
            v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3->ifa_name));
            v16 = (void *)v15;
            if (v15)
            {
              v32[0] = CFSTR("name");
              v32[1] = CFSTR("address");
              v33[0] = v15;
              v33[1] = v8;
              v32[2] = CFSTR("netMask");
              v32[3] = CFSTR("broadcastAddr");
              v33[2] = v12;
              v33[3] = v14;
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
              v18 = sub_100024A40();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "+[MSDIpInterface getIpv4Interfaces]";
                v36 = 2114;
                v37 = v17;
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s - interface:  %{public}@", buf, 0x16u);
              }

              -[NSMutableArray addObject:](v2, "addObject:", v17);
LABEL_16:

              goto LABEL_17;
            }
            v28 = sub_100024A40();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              sub_10002FB78(buf, &buf[1], v29);

          }
          else
          {
            v26 = sub_100024A40();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              sub_10002FB0C();

          }
        }
        else
        {
          v25 = sub_100024A40();
          v12 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_10002FAA0();
        }

        goto LABEL_34;
      }
      v23 = sub_100024A40();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10002FA34();
LABEL_24:

LABEL_34:
      if (v31)
        freeifaddrs(v31);
      v21 = 0;
      goto LABEL_21;
    }
LABEL_17:
    v3 = v3->ifa_next;
  }
  while (v3);
  if (v31)
    freeifaddrs(v31);
LABEL_20:
  v21 = v2;
LABEL_21:

  return v21;
}

@end
