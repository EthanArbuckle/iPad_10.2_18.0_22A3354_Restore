@implementation MCHomeScreenLayoutPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationType));

  LODWORD(v8) = objc_msgSend(v10, "intValue");
  if ((_DWORD)v8 == 2)
    v11 = MCUserHomeScreenLayoutFilePath();
  else
    v11 = MCSystemHomeScreenLayoutFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v13, "fileExistsAtPath:", v12) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layout"));
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "writeToFile:atomically:", v12, 1);

    goto LABEL_14;
  }
  v14 = MCHomeScreenLayoutErrorDomain;
  v15 = MCErrorArray(CFSTR("HOME_SCREEN_LAYOUT_MULTIPLE_LAYOUTS"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = MCErrorTypeFatal;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 43000, v16, MCErrorTypeFatal, 0));
  v19 = objc_msgSend(v18, "MCCopyAsPrimaryError");

  if (!v19)
  {
LABEL_14:
    MCSendHomeScreenLayoutChangedNotification();
    v31 = 1;
    goto LABEL_15;
  }
  v20 = MCInstallationErrorDomain;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v22 = a6;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "friendlyName"));
  v24 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v20, 4001, v25, v19, v17, v23, 0));

  if (v22)
    *v22 = objc_retainAutorelease(v26);
  v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "friendlyName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot install home screen layout “%{public}@”. Error: %{public}@", buf, 0x16u);

  }
  v31 = 0;
LABEL_15:

  return v31;
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCHomeScreenLayoutPayloadHandler homeScreenLayoutFilePath](self, "homeScreenLayoutFilePath"));
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

    MCSendHomeScreenLayoutChangedNotification();
  }
}

- (void)setAside
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCHomeScreenLayoutPayloadHandler homeScreenLayoutFilePath](self, "homeScreenLayoutFilePath"));
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (void)unsetAside
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCHomeScreenLayoutPayloadHandler homeScreenLayoutFilePath](self, "homeScreenLayoutFilePath"));
    objc_msgSend(v3, "writeToFile:atomically:", v4, 1);

  }
}

- (id)homeScreenLayoutFilePath
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "profile"));
  v4 = objc_msgSend(v3, "installType");

  if (v4 == (id)2)
    v5 = MCUserHomeScreenLayoutFilePath();
  else
    v5 = MCSystemHomeScreenLayoutFilePath();
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

@end
