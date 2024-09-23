@implementation MSDConfigurationProfileInstallOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_installConfigurationProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_installConfigurationProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDConfigurationProfile *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  NSObject *v19;
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stagingRootPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fileHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "profileIdentifier"));
  v8 = -[MSDConfigurationProfile initWithFile:andIdentifier:]([MSDConfigurationProfile alloc], "initWithFile:andIdentifier:", v6, v7);
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Installing standalone configuration profile: %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v13 = objc_msgSend(v12, "copyFileIfPresentInCache:toLocation:verifyHash:", v5, v6, objc_msgSend(v2, "verifyFileHash"));

  if ((v13 & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MSDConfigurationProfileManager sharedInstance](MSDConfigurationProfileManager, "sharedInstance"));
    v15 = -[NSObject installConfigurationProfile:](v14, "installConfigurationProfile:", v8);
  }
  else
  {
    v21 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000B79C8((uint64_t)v5, v14, v22);
    v15 = 0;
  }

  if (objc_msgSend(v3, "fileExistsAtPath:", v6))
  {
    v23 = 0;
    v16 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v23);
    v17 = v23;
    if ((v16 & 1) == 0)
    {
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000B793C(v17, v19);

    }
  }

  return v15;
}

@end
