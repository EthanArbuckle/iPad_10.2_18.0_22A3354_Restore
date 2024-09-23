@implementation MCSharedDeviceConfigurationPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", a3, a4, a5));
  v9 = MCSharedDeviceConfigurationFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    -[MCSharedDeviceConfigurationPayloadHandler _saveSharedDeviceConfiguration](self, "_saveSharedDeviceConfiguration");
    goto LABEL_9;
  }
  v12 = MCSharedDeviceConfigurationErrorDomain;
  v13 = MCErrorArray(CFSTR("SHARED_DEVICE_CONFIGURATION_MULTIPLE_CONFIGURATIONS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = MCErrorTypeFatal;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v12, 46000, v14, MCErrorTypeFatal, 0));
  v17 = objc_msgSend(v16, "MCCopyAsPrimaryError");

  if (!v17)
  {
LABEL_9:
    v29 = 1;
    goto LABEL_10;
  }
  v18 = MCInstallationErrorDomain;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "friendlyName"));
  v21 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v18, 4001, v22, v17, v15, v20, 0));

  if (a6)
    *a6 = objc_retainAutorelease(v23);
  v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "friendlyName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v32 = v27;
    v33 = 2114;
    v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Cannot install shared device configuration “%{public}@”. Error: %{public}@", buf, 0x16u);

  }
  v29 = 0;
LABEL_10:

  return v29;
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCSharedDeviceConfigurationPayloadHandler _removeSharedDeviceConfiguration](self, "_removeSharedDeviceConfiguration");
}

- (void)setAside
{
  -[MCSharedDeviceConfigurationPayloadHandler _removeSharedDeviceConfiguration](self, "_removeSharedDeviceConfiguration");
}

- (void)_saveSharedDeviceConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v3 = MCSharedDeviceConfigurationFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "MCWriteToBinaryFile:", v4);

}

- (void)_removeSharedDeviceConfiguration
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v2 = MCSharedDeviceConfigurationFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

@end
