@implementation MSDProvisioningProfileUtils

+ (BOOL)installProvisioningProfile:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  int v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:](MSDProvisioningProfileUtils, "loadProvisioningProfileFromFile:", v3);
  if (v4)
  {
    v5 = v4;
    v6 = MISInstallProvisioningProfile();
    v7 = v6 == 0;
    if (v6)
    {
      v8 = (void *)MISCopyErrorStringForErrorCode();
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543618;
        v13 = v3;
        v14 = 2114;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to install provisioning profile:  %{public}@) with error %{public}@", (uint8_t *)&v12, 0x16u);
      }

    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)uninstallProvisioningProfileByUUID:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = a3;
  v4 = MISRemoveProvisioningProfile();
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = (void *)MISCopyErrorStringForErrorCode(v4);
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to uninstall provisioning profile with UUID:  %{public}@ - Error:  %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  return v5 == 0;
}

+ (BOOL)uninstallProvisioningProfileByFileName:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  uint64_t UUID;
  void *v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = +[MSDProvisioningProfileUtils loadProvisioningProfileFromFile:](MSDProvisioningProfileUtils, "loadProvisioningProfileFromFile:", v3);
  if (v4)
  {
    v5 = v4;
    UUID = MISProvisioningProfileGetUUID();
    v7 = (void *)objc_claimAutoreleasedReturnValue(UUID);
    if (v7)
    {
      v8 = +[MSDProvisioningProfileUtils uninstallProvisioningProfileByUUID:](MSDProvisioningProfileUtils, "uninstallProvisioningProfileByUUID:", v7);
    }
    else
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000B8734((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);

      v8 = 0;
    }
    CFRelease(v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isProvisioningProfileInstalled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProvisioningProfileUtils getUUIDsOfInstalledProvisioningProfiles](MSDProvisioningProfileUtils, "getUUIDsOfInstalledProvisioningProfiles"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsObject:", v3);
  else
    v6 = 0;

  return v6;
}

+ (id)getUUIDsOfInstalledProvisioningProfiles
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100011160;
  v16 = sub_100011170;
  v17 = 0;
  v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)v13[5];
  v13[5] = v2;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011178;
  v11[3] = &unk_10013DC60;
  v11[4] = &v12;
  v4 = MISEnumerateInstalledProvisioningProfiles(0, v11);
  if ((_DWORD)v4)
  {
    v5 = (void *)v13[5];
    v13[5] = 0;

    v6 = (void *)MISCopyErrorStringForErrorCode(v4);
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to collect UUIDs of installed provisioning profiles - Error:  %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v6 = 0;
  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (void)loadProvisioningProfileFromFile:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000B87FC((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_8;
  }
  v6 = (void *)MISProfileCreateWithFile(kCFAllocatorDefault, v3);
  if (!v6)
  {
    v16 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000B8798((uint64_t)v3, v9, v17, v18, v19, v20, v21, v22);
LABEL_8:

    v6 = 0;
  }

  return v6;
}

+ (id)getUUIDFromProvisioningProfileRef:(void *)a3
{
  void *Value;

  Value = (void *)MISProfileGetValue(a3, CFSTR("UUID"));
  if (Value)
    Value = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", Value));
  return Value;
}

@end
