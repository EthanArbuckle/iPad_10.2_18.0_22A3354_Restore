@implementation FMDNVRAMUtil

+ (id)sharedInstance
{
  if (qword_100306528 != -1)
    dispatch_once(&qword_100306528, &stru_1002C2CC0);
  return (id)qword_100306520;
}

- (void)setStringPropertyWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
    -[FMDNVRAMUtil setDataPropertyWithKey:value:](self, "setDataPropertyWithKey:value:", v6, v9);

  }
  else
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#nvram - Cannot save NULL to NVRAM key %@ value %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (id)stringValueForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNVRAMUtil dataValueForKey:](self, "dataValueForKey:", v4));
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412546;
        v11 = v6;
        v12 = 2112;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nvram - retrieved string value %@ for key %@", (uint8_t *)&v10, 0x16u);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)clearPropertyWithKey:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    v3 = (__CFString *)a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v5 = sub_10003F1B0(v3, v4);

    if ((_DWORD)v5)
    {
      v6 = sub_1000031B8();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100227B88(v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
}

- (void)setDataPropertyWithKey:(id)a3 value:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    v10 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#nvram - Cannot save data since data or key is nil", v11, 2u);
    }
    goto LABEL_8;
  }
  if (sub_10003F1B0(v5, v6))
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100227BF0((uint64_t)v5, v7, v9);
LABEL_8:

  }
}

- (id)dataValueForKey:(id)a3
{
  const __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFDataRef v15;
  id v16;
  NSObject *v17;
  id v18;
  const __CFString *v19;
  id v20;
  CFDataRef v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;

  v3 = (const __CFString *)a3;
  v4 = (__CFString *)v3;
  if (v3)
  {
    v22 = 0;
    v5 = sub_10003F2D4(v3, &v22);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100227C8C(v6, v8, v9, v10, v11, v12, v13, v14);
      v15 = 0;
    }
    else
    {
      v15 = v22;
      v18 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (v15)
          v19 = CFSTR("(not-nil)");
        else
          v19 = CFSTR("(nil)");
        v20 = -[__CFData length](v15, "length");
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        v25 = 2048;
        v26 = v20;
        v27 = 2112;
        v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nvram - read data value %@ of length %lu for key %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#nvram - nil key provided to retrieve data from nvram", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

@end
