@implementation MCNotificationSettingsPayloadHandler

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
  id *v21;
  void *v22;
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
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionInstallationType));

  LODWORD(v8) = objc_msgSend(v10, "intValue");
  if ((_DWORD)v8 == 2)
    v11 = MCUserNotificationSettingsFilePath();
  else
    v11 = MCSystemNotificationSettingsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v13, "fileExistsAtPath:", v12) & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notificationSettings"));
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "writeToFile:atomically:", v12, 1);

    goto LABEL_14;
  }
  v14 = MCNotificationSettingsErrorDomain;
  v15 = MCErrorArray(CFSTR("NOTIFICATION_SETTINGS_MULTIPLE_SETTINGS"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = MCErrorTypeFatal;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 44000, v16, MCErrorTypeFatal, 0));
  v19 = objc_msgSend(v18, "MCCopyAsPrimaryError");

  if (!v19)
  {
LABEL_14:
    MCSendUserNotificationsSettingsChangedNotification();
    v31 = 1;
    goto LABEL_15;
  }
  v35 = v9;
  v20 = MCInstallationErrorDomain;
  v21 = a6;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "friendlyName"));
  v24 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v20, 4001, v25, v19, v17, v23, 0));

  if (v21)
    *v21 = objc_retainAutorelease(v26);
  v27 = _MCLogObjects[0];
  v9 = v35;
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "friendlyName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    v38 = 2114;
    v39 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot install notification settings “%{public}@”. Error: %{public}@", buf, 0x16u);

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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNotificationSettingsPayloadHandler notificationSettingsFilePath](self, "notificationSettingsFilePath"));
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

    MCSendUserNotificationsSettingsChangedNotification();
  }
}

- (void)setAside
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNotificationSettingsPayloadHandler notificationSettingsFilePath](self, "notificationSettingsFilePath"));
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (void)unsetAside
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationSettings"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNotificationSettingsPayloadHandler notificationSettingsFilePath](self, "notificationSettingsFilePath"));
    objc_msgSend(v3, "writeToFile:atomically:", v4, 1);

  }
}

- (id)notificationSettingsFilePath
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "profile"));
  v4 = objc_msgSend(v3, "installType");

  if (v4 == (id)2)
    v5 = MCUserNotificationSettingsFilePath();
  else
    v5 = MCSystemNotificationSettingsFilePath();
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

@end
