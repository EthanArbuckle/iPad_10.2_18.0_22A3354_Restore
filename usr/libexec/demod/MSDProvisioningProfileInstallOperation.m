@implementation MSDProvisioningProfileInstallOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_installProvisioningProfiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_installProvisioningProfiles
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint8_t v14[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = objc_opt_class(MSDContentFilesContext, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
    return -[MSDProvisioningProfileInstallOperation _installProvisioningProfilesInBackup](self, "_installProvisioningProfilesInBackup");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = objc_opt_class(MSDInstallableFileContext, v8);
  v10 = objc_opt_isKindOfClass(v7, v9);

  if ((v10 & 1) != 0)
    return -[MSDProvisioningProfileInstallOperation _installStandaloneProvisioningProfile](self, "_installStandaloneProvisioningProfile");
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unrecognized operation context.", v14, 2u);
  }

  return 0;
}

- (BOOL)_installProvisioningProfilesInBackup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  BOOL v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  NSObject *v46;
  _BYTE v47[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secondaryStagingRootPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/var/MobileDevice/ProvisioningProfiles")));
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Provisioning profile directory: %{public}@", buf, 0xCu);
  }

  v42 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v5, &v42));
  v9 = v42;
  v10 = v9;
  if (v8)
  {
    v31 = v9;
    v32 = v8;
    v33 = v4;
    v34 = v3;
    v35 = v2;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      v36 = 1;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v15, "hasPrefix:", CFSTR(".")) & 1) == 0)
          {
            v16 = v5;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v15));
            v18 = sub_1000604F0();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v44 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Installing provisioning profile: %{public}@", buf, 0xCu);
            }

            v20 = MISProfileCreateWithFile(kCFAllocatorDefault, v17);
            if (v20)
            {
              v21 = (const void *)v20;
              v22 = MISInstallProvisioningProfile();
              if ((_DWORD)v22)
              {
                v23 = MISCopyErrorStringForErrorCode(v22);
                v24 = sub_1000604F0();
                v25 = objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v44 = v17;
                  v45 = 2114;
                  v46 = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to install %{public}@ with error %{public}@", buf, 0x16u);
                }

                v36 = 0;
              }
              else
              {
                v26 = sub_1000604F0();
                v23 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v44 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Install success for %{public}@", buf, 0xCu);
                }
              }

              CFRelease(v21);
            }

            v5 = v16;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v12);
    }
    else
    {
      v36 = 1;
    }

    v29 = v36 & 1;
    v3 = v34;
    v2 = v35;
    v8 = v32;
    v4 = v33;
    v10 = v31;
  }
  else
  {
    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000C63F8(v10);

    v29 = 1;
  }

  return v29;
}

- (BOOL)_installStandaloneProvisioningProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stagingRootPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fileHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "INFO - Installing provisioning profile: %{public}@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v11 = objc_msgSend(v10, "copyFileIfPresentInCache:toLocation:verifyHash:", v5, v6, objc_msgSend(v2, "verifyFileHash"));

  if ((v11 & 1) != 0)
  {
    v12 = +[MSDProvisioningProfileUtils installProvisioningProfile:](MSDProvisioningProfileUtils, "installProvisioningProfile:", v6);
  }
  else
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000C64F0((uint64_t)v5, v19);

    v12 = 0;
  }
  if (objc_msgSend(v3, "fileExistsAtPath:", v6))
  {
    v20 = 0;
    v13 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v20);
    v14 = v20;
    if ((v13 & 1) == 0)
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000C6474(v14);

    }
  }

  return v12;
}

@end
