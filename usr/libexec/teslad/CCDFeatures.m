@implementation CCDFeatures

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui("com.apple.DeviceManagementClient", a2);
}

+ (id)stringForDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "isAppleInternal"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)sentinelExistsAtPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(a1, "isAppleInternal"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)depConfigurationEnrollmentURLStringWithURLString:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = kCCURLUserDefaultsKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForDefaultsKey:", v4));
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

+ (id)depDeviceSerialNumberWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("MCTeslaDeviceSerialNumber")));
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)depProvisionalEnrollmentURLStringWithURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("MCTeslaProvisionalEnrollmentURL")));
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)depRemoveEnrollmentURLStringWithURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("MCTeslaUnenrollURL")));
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)deviceRegisterURLStringWithURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("MCTeslaDeviceRegisterURL")));
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)depResponseContentTypeFromContentType:(id)a3
{
  id v4;
  __CFString *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "sentinelExistsAtPath:", kCCFakeDEPJSONResponsePath) & 1) != 0)
    v5 = CFSTR("application/json");
  else
    v5 = (__CFString *)v4;

  return v5;
}

+ (id)depResponseDataFromData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;

  v4 = a3;
  v5 = kCCFakeDEPJSONResponsePath;
  v6 = objc_msgSend(a1, "sentinelExistsAtPath:", kCCFakeDEPJSONResponsePath);
  if ((_DWORD)v6)
  {
    v9 = *(NSObject **)(DEPLogObjects(v6, v7, v8) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding cloud config with file at path: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v5));

    v4 = (id)v10;
  }
  return v4;
}

@end
