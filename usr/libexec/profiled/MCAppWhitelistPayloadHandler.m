@implementation MCAppWhitelistPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = objc_opt_class(MCSingleAppPayload);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0)
    return 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationBundleID"));
  v14 = objc_msgSend(v12, "allowedToRunAppWithBundleID:", v13);

  if (v14)
  {

    return 1;
  }
  v15 = MCAppWhitelistErrorDomain;
  v16 = MCErrorArray(CFSTR("APPWHITE_APP_IS_RESTRICTED"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = MCErrorTypeFatal;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 48000, v17, MCErrorTypeFatal, 0));
  v20 = objc_msgSend(v19, "MCCopyAsPrimaryError");

  if (!v20)
    return 1;
  v21 = MCInstallationErrorDomain;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "friendlyName"));
  v24 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v21, 4001, v25, v20, v18, v23, 0));

  if (a6)
    *a6 = objc_retainAutorelease(v26);
  v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "friendlyName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v34 = v30;
    v35 = 2114;
    v36 = v31;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot install app whitelist payload “%{public}@”. Error: %{public}@", buf, 0x16u);

  }
  return 0;
}

- (void)_postNotification
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending App Whitelist change notification", v3, 2u);
  }
  notify_post((const char *)objc_msgSend(MCAppWhitelistDidChangeNotification, "UTF8String"));
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  -[MCAppWhitelistPayloadHandler _postNotification](self, "_postNotification", a3, a4);
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  -[MCAppWhitelistPayloadHandler _postNotification](self, "_postNotification", a3, a4);
}

@end
