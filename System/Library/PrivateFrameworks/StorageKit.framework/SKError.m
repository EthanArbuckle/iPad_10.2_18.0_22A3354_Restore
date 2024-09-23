@implementation SKError

+ (NSBundle)frameworkBundle
{
  if (frameworkBundle_onceToken != -1)
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_9);
  return (NSBundle *)(id)frameworkBundle__bundle;
}

void __26__SKError_frameworkBundle__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/StorageKit.framework"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)frameworkBundle__bundle;
  frameworkBundle__bundle = v2;

  if (!frameworkBundle__bundle)
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_20);

    SKGetOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "+[SKError frameworkBundle]_block_invoke";
      _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_FAULT, "%s: FATAL ERROR: Failed to get the NSBundle of StorageKit framework", (uint8_t *)&v6, 0xCu);
    }

  }
}

id __26__SKError_frameworkBundle__block_invoke_2()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKError.m", 55);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)localizedDescriptionForCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("SKError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if ((objc_msgSend(v6, "isEqualToString:", v4) & 1) == 0)
    v7 = v6;

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", a3, 0, a4);
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD0BA0];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", a3, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDD0BA0];
  v13[0] = a4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", a3, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v10);
  return v10;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD1398];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0FC8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (v8)
    {
      SKGetOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "localizedDescriptionForCode:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_ERROR, "%s: %@ : %@", buf, 0x20u);

      }
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "localizedDescriptionForCode:", a3);
      v17 = objc_claimAutoreleasedReturnValue();
      commaSeparatedDiskListFromArray(v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ : %@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "localizedDescriptionForCode:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0BA0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      SKGetOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v23)
      {
        if (v24)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v27 = "+[SKError errorWithCode:disks:userInfo:]";
          v28 = 2112;
          v29 = v19;
          v30 = 2112;
          v31 = v25;
          _os_log_impl(&dword_22FE50000, v17, OS_LOG_TYPE_ERROR, "%s: %@ [%@]", buf, 0x20u);

        }
      }
      else if (v24)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_22FE50000, v17, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

    if (v19)
      objc_msgSend(v11, "setObject:forKey:", v19, v12);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.StorageKit"), a3, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)nilWithError:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SKGetOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22FE50000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

+ (BOOL)failWithError:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SKGetOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22FE50000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD1128];
  v8 = a3;
  userInfoWithDebugDescription(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v10);
  return v10;
}

+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "errorWithPOSIXCode:debugDescription:error:", *(_QWORD *)&a3, 0, a4);
}

+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDD1540];
  if ((a3 - 49152) > 0x6A)
  {
    v10 = *MEMORY[0x24BDD1100];
    v11 = a3;
  }
  else
  {
    v10 = *MEMORY[0x24BDD1128];
    v11 = a3 & 0xFFFF3FFF;
  }
  userInfoWithDebugDescription(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v13;
}

+ (id)errorWithOSStatus:(int)a3 error:(id *)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "errorWithOSStatus:debugDescription:error:", *(_QWORD *)&a3, 0, a4);
}

+ (id)nilWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[SKError errorWithPOSIXCode:error:](SKError, "errorWithPOSIXCode:error:", *(_QWORD *)&a3, a4);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[SKError errorWithPOSIXCode:debugDescription:error:](SKError, "errorWithPOSIXCode:debugDescription:error:", *(_QWORD *)&a3, a4, a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[SKError errorWithOSStatus:debugDescription:error:](SKError, "errorWithOSStatus:debugDescription:error:", *(_QWORD *)&a3, a4, a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[SKError errorWithOSStatus:error:](SKError, "errorWithOSStatus:error:", *(_QWORD *)&a3, a4);
  return 0;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;

  userInfoWithDebugDescription(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithError:error:](SKError, "nilWithError:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithError:error:](SKError, "nilWithError:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)failWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[SKError errorWithPOSIXCode:debugDescription:error:](SKError, "errorWithPOSIXCode:debugDescription:error:", *(_QWORD *)&a3, a4, a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[SKError errorWithPOSIXCode:error:](SKError, "errorWithPOSIXCode:error:", *(_QWORD *)&a3, a4);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[SKError errorWithOSStatus:debugDescription:error:](SKError, "errorWithOSStatus:debugDescription:error:", *(_QWORD *)&a3, a4, a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[SKError errorWithOSStatus:error:](SKError, "errorWithOSStatus:error:", *(_QWORD *)&a3, a4);
  return 0;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  userInfoWithDebugDescription(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[SKError failWithError:error:](SKError, "failWithError:error:", v8, a5);

  return (char)a5;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  void *v5;

  +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[SKError failWithError:error:](SKError, "failWithError:error:", v5, a4);

  return (char)a4;
}

@end
