@implementation MTIPCUTunnelParser

- (MTIPCUTunnelParser)init
{
  MTIPCUTunnelParser *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTIPCUTunnelParser;
  result = -[MTIPCUTunnelParser init](&v3, "init");
  if (result)
  {
    result->_downloadAndApplyCloudConfigurationCommandRetryCount = 0;
    result->_setCloudConfigurationCommandRetryCount = 0;
  }
  return result;
}

- (id)_commandFlush:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  v3 = *(NSObject **)DMCLogObjects(self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Flushing command queue.", v5, 2u);
  }
  +[MDMMCInterface flush](MDMMCInterface, "flush");
  return (id)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
}

- (id)_commandHello:(id)a3
{
  return +[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged);
}

- (id)_commandGetEncryptionKey:(id)a3
{
  os_log_t *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __SecCertificate *v9;
  double v10;
  double v11;
  uint64_t v12;
  double Current;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  CFDataRef v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  uint8_t v26[8];
  _QWORD v27[2];
  _QWORD v28[2];

  v4 = (os_log_t *)DMCLogObjects(self);
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    sub_10000B68C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (!v5)
    goto LABEL_19;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "personaID"));
  v9 = (__SecCertificate *)DMCHCUCopyCertificateFromKeychainForMappedLabel(v6, v8 != 0);

  if (v9)
  {
    v10 = SecCertificateNotValidAfter(v9);
    v11 = SecCertificateNotValidBefore(v9);
    Current = CFAbsoluteTimeGetCurrent();
    if (v11 < Current && v10 > Current)
    {
      v20 = SecCertificateCopyData(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData DMCDataWithCFData:](NSData, "DMCDataWithCFData:", v20));
      CFRelease(v9);
      v22 = CFSTR("PublicKey");
      goto LABEL_15;
    }
    v15 = *(NSObject **)DMCLogObjects(v12);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "iPCU client certificate is no longer valid. Requesting a new one.", v26, 2u);
    }
    CFRelease(v9);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (!v16)
    goto LABEL_17;
  v18 = objc_alloc_init((Class)NSMutableDictionary);
  -[MTIPCUTunnelParser setCSR:](self, "setCSR:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR"));
  v20 = (CFDataRef)DMCHCUCreateCSR();

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData DMCDataWithCFData:](NSData, "DMCDataWithCFData:", v20));
  v22 = CFSTR("CSR");
LABEL_15:
  CFRelease(v20);
  if (!v21)
  {
LABEL_17:
    v24 = *(NSObject **)DMCLogObjects(v17);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Cannot retrieve the device certificate for the connected host.", v26, 2u);
    }
LABEL_19:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
    return v23;
  }
  v27[0] = kMCTPStatusKey;
  v27[1] = v22;
  v28[0] = kMCTPStatusAcknowledged;
  v28[1] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

  return v23;
}

- (id)_commandGetProfileList:(id)a3
{
  os_log_t *v3;

  v3 = (os_log_t *)DMCLogObjects(self);
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
    sub_10000B70C();
  return (id)objc_claimAutoreleasedReturnValue(+[MDMMCInterface ipcuProfileList](MDMMCInterface, "ipcuProfileList"));
}

- (id)_commandRemoveProfile:(id)a3
{
  id v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;

  v3 = a3;
  v4 = (os_log_t *)DMCLogObjects(v3);
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    sub_10000B78C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMCTPProfileIdentifier));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface ipcuRemoveProfileWithIdentifier:](MDMMCInterface, "ipcuRemoveProfileWithIdentifier:", v5));
  if (v6)
  {
    v8 = *(NSObject **)DMCLogObjects(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "DMCVerboseDescription"));
      v14 = 138543362;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v6));
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  }
  v12 = (void *)v11;

  return v12;
}

- (id)_commandSetCertificate:(id)a3
{
  id v4;
  os_log_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[3];
  _QWORD v22[3];

  v4 = a3;
  v5 = (os_log_t *)DMCLogObjects(v4);
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    sub_10000B80C();
  v6 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR")),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CertificateData")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personaID"));
    v14 = DMCHCUSetCertificateDataForMappedLabel(v9, v10, v11, v13 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = *(NSObject **)DMCLogObjects(-[MTIPCUTunnelParser setCSR:](self, "setCSR:", 0));
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Created new iPCU client identity.", v20, 2u);
      }
      v17 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not create new iPCU client identity.", v20, 2u);
      }
      v21[0] = CFSTR("Error");
      v21[1] = kMCTPStatusKey;
      v22[0] = CFSTR("Could not create identity with certificate");
      v22[1] = kMCTPStatusError;
      v21[2] = CFSTR("Goodbye");
      v22[2] = &__kCFBooleanTrue;
      v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
    }
    v18 = (void *)v17;

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
  }

  return v18;
}

- (id)_commandInstallProfile:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;

  v4 = a3;
  v5 = (os_log_t *)DMCLogObjects(v4);
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    sub_10000B88C();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kMCTPPayloadKey));

  if (!v6)
    return (id)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusErrorPayloadEmpty));
  v7 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 100, 0, 0));

    v6 = (void *)v8;
  }
  v9 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    v22 = DMCTunnelErrorDomain;
    v23 = DMCErrorArray(CFSTR("TUNNEL_ERROR_INVALID_FIELD_P_FIELD_%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v22, 14000, v10, DMCErrorTypeFatal));
    v13 = objc_msgSend(v17, "DMCCopyAsPrimaryError");
    goto LABEL_18;
  }
  v10 = (void *)objc_opt_new(DMFInstallProfileRequest);
  objc_msgSend(v10, "setProfileData:", v6);
  objc_msgSend(v10, "setStyle:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMFConnection systemConnection](DMFConnection, "systemConnection"));
  v30 = 0;
  v12 = objc_msgSend(v11, "performRequest:error:", v10, &v30);
  v13 = v30;

  if (v13)
  {
    if (objc_msgSend(v13, "code") == (id)2000)
    {
      v14 = -[MTIPCUTunnelParser _isLockdownModeEnabled](self, "_isLockdownModeEnabled");
      v15 = DMCInstallationErrorDomain;
      if (v14)
      {
        v16 = DMCErrorArray(CFSTR("ERROR_PROFILE_INSTALL_PREVENTED_BY_LOCKDOWN"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = DMCErrorTypeFatal;
        v19 = v15;
        v20 = 4021;
      }
      else
      {
        v26 = DMCErrorArray(CFSTR("ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v18 = DMCErrorTypeFatal;
        v19 = v15;
        v20 = 4020;
      }
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, v20, v17, v18));
      goto LABEL_17;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    if (v17)
    {
      v25 = v17;
      v17 = v25;
LABEL_17:
      v27 = v25;

      v13 = v27;
    }
LABEL_18:

  }
  if (v13)
    v28 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v13));
  else
    v28 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  v29 = (void *)v28;

  return v29;
}

- (BOOL)_isLockdownModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isLockdownModeEnabled");

  return v3;
}

- (id)_commandStoreProfile:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  id v15;
  char v16;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)DMCLogObjects(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Storing profile", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ProfileData")));
  if (v5)
  {
    v6 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v16 = 0;
      v15 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:](MDMMCInterface, "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:", v5, 1, 0, 0, &v16, &v15));
      v8 = v15;
      if (!v7)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v8));
        goto LABEL_17;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Purpose")));
      if (v9
        && (v10 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("PostSetupInstallation")) & 1) != 0)
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("PostSetupInstallation")) && !v16)
        {
          v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v8));
LABEL_15:
          v12 = (void *)v11;

LABEL_17:
          goto LABEL_18;
        }
        +[MDMMCInterface storeProfileData:completion:](MDMMCInterface, "storeProfileData:completion:", v5, &stru_100010930);
        v13 = &kMCTPStatusAcknowledged;
      }
      else
      {
        v13 = &kMCTPStatusCommandFormatError;
      }
      v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", *v13));
      goto LABEL_15;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
LABEL_18:

  return v12;
}

- (void)_commandGetStoredProfile:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  v7 = *(NSObject **)DMCLogObjects(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Retrieving stored profile", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Purpose")));

  if (v8)
  {
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("PostSetupInstallation")) & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100008BA8;
      v11[3] = &unk_100010958;
      v12 = v5;
      +[MDMMCInterface storedProfileDataWithCompletion:](MDMMCInterface, "storedProfileDataWithCompletion:", v11);
      v10 = v12;
LABEL_9:

      goto LABEL_10;
    }
  }
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
    (*((void (**)(id, void *))v5 + 2))(v5, v10);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_commandGetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](MDMMCInterface, "cloudConfigurationDetails"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("CloudConfiguration"));
  if (v7)
    v7[2](v7, v6);

}

- (void)_commandSetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](MDMMCInterface, "cloudConfigurationDetails"));
  if (v8)
  {
    v9 = DMCTunnelErrorDomain;
    v10 = DMCErrorArray(CFSTR("TUNNEL_ERROR_CLOUD_CONFIG_EXISTS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 14002, v11, DMCErrorTypeFatal, 0));

    if (v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v12));
      v7[2](v7, v13);

    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CloudConfiguration")));
    v15 = objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_100011418, kCCConfigurationSourceKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kCCConfigurationURLKey));
    if (v16)
    {

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kCCConfigurationWebURLKey));

      if (!v17)
      {
        objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCCloudConfigurationUICompleteKey);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCCloudConfigurationWasAppliedKey);
      }
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCIsMandatoryKey);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kCCIsMDMUnremovable);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100008F28;
    v18[3] = &unk_100010980;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    +[MDMMCInterface storeCloudConfigurationDetails:completion:](MDMMCInterface, "storeCloudConfigurationDetails:completion:", v15, v18);

  }
}

- (id)_underlyingCloudConfigErrorFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain")),
        v8 = objc_msgSend(v7, "isEqualToString:", DEPCloudConfigErrorDomain),
        v7,
        (v8 & 1) == 0))
  {

LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (id)_configuratorProvisionalEnrollmentErrorWithDetails:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _underlyingCloudConfigErrorFromError:](self, "_underlyingCloudConfigErrorFromError:", v5));
  v7 = v6;
  v8 = v5;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == (id)33014)
      v8 = v7;
    else
      v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (id)_configuratorCloudConfigurationErrorWithCloudConfigDetails:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _underlyingCloudConfigErrorFromError:](self, "_underlyingCloudConfigErrorFromError:", v5));
  v7 = v6;
  v8 = v5;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == (id)33005)
      v8 = v7;
    else
      v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (BOOL)_isXPCInterruptionError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", NSCocoaErrorDomain))
    v5 = objc_msgSend(v3, "code") == (id)4097 || objc_msgSend(v3, "code") == (id)4099;
  else
    v5 = 0;

  return v5;
}

- (void)_commandDownloadAndApplyCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)DMCLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Download and apply cloud configuration", buf, 2u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000093FC;
  v18[3] = &unk_1000109D0;
  v18[4] = self;
  v9 = v6;
  v19 = v9;
  v10 = v7;
  v20 = v10;
  v11 = objc_retainBlock(v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface mdmProfileIdentifier](MDMMCInterface, "mdmProfileIdentifier"));

  if (v12)
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "responseWithStatus:", kMCTPStatusAcknowledged);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(_QWORD *, void *))v11[2])(v11, v14);

  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009570;
    v15[3] = &unk_100010AF8;
    v15[4] = self;
    v17 = v11;
    v16 = v9;
    +[MDMMCInterface retrieveCloudConfigurationDetailsCompletion:](MDMMCInterface, "retrieveCloudConfigurationDetailsCompletion:", v15);

  }
}

- (void)_commandPollMDMIfNetworkTetheredRequest:(id)a3 completionBlock:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009EAC;
  v7[3] = &unk_100010B20;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "simulatePushIfNetworkTetheredWithCompletion:", v7);

}

- (void)_commandEraseDevice:(id)a3 completionBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  dispatch_semaphore_t v21;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PreserveDataPlan")));
  if (v7)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
      v6[2](v6, v10);
      goto LABEL_12;
    }
    v9 = objc_msgSend(v7, "BOOLValue") ^ 1;
  }
  else
  {
    v9 = 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DisallowProximitySetup")));
  if (v10)
  {
    v11 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
      v6[2](v6, v19);

      goto LABEL_12;
    }
    v12 = objc_msgSend(v10, "BOOLValue");
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  v6[2](v6, v13);

  v14 = dispatch_semaphore_create(0);
  v15 = objc_alloc_init((Class)DDRResetOptions);
  objc_msgSend(v15, "setHideProgress:", 1);
  objc_msgSend(v15, "setEraseDataPlan:", v9);
  objc_msgSend(v15, "setDisallowProximitySetup:", v12);
  v16 = objc_msgSend(objc_alloc((Class)DDRResetRequest), "initWithMode:options:reason:", 4, v15, CFSTR("mc_mobile_tunnel erase device command"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[DDRResetService sharedInstance](DDRResetService, "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000A274;
  v20[3] = &unk_100010B48;
  v21 = v14;
  v18 = v14;
  objc_msgSend(v17, "resetWithRequest:completion:", v16, v20);

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
LABEL_12:

}

- (void)_commandEscalate:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SupervisorCertificate")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](MDMMCInterface, "cloudConfigurationDetails"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCCSupervisorHostCertificatesKey));

  if (objc_msgSend(v9, "containsObject:", v7))
  {
    -[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", v7);
    arc4random_buf(&v13, 8uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v13, 8));
    -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challenge](self, "challenge"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Challenge"));

    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", CFSTR("CertificateRejected")));
  if (v6)
LABEL_5:
    v6[2](v6, v11);
LABEL_6:

}

- (void)_commandEscalateResponse:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  SecPolicyRef BasicX509;
  SecPolicyRef v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CFDataRef v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void (**v24)(void);
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint8_t v28[16];
  id v29;
  void *v30;
  uint8_t buf[16];

  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SignedRequest")));
  BasicX509 = SecPolicyCreateBasicX509();
  if (!BasicX509)
    goto LABEL_18;
  v9 = BasicX509;
  v30 = 0;
  *(_QWORD *)buf = 0;
  v29 = 0;
  if (!SecCMSVerifyCopyDataAndAttributes(v7, 0, BasicX509, buf, &v30, &v29))
  {
    v11 = v29;
    v10 = v30;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kSecCMSAllCerts));
    if (!objc_msgSend(v12, "count"))
    {
LABEL_16:

      goto LABEL_17;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));

    v14 = SecCertificateCopyData((SecCertificateRef)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challengeCertificate](self, "challengeCertificate"));
    v16 = -[__CFData isEqualToData:](v14, "isEqualToData:", v15);

    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challenge](self, "challenge"));
      v19 = objc_msgSend(v10, "isEqualToData:", v18);

      if ((v19 & 1) != 0)
      {

        CFRelease(v9);
        -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", 0);
        v21 = *(NSObject **)DMCLogObjects(-[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", 0));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Escalation accepted.", buf, 2u);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser escalationBlock](self, "escalationBlock"));

        if (v23)
        {
          v24 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser escalationBlock](self, "escalationBlock"));
          v24[2]();

        }
        goto LABEL_21;
      }
      v25 = *(NSObject **)DMCLogObjects(v20);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_WORD *)v28 = 0;
      v26 = "Escalation response does not contain the expected challenge.";
    }
    else
    {
      v25 = *(NSObject **)DMCLogObjects(v17);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_WORD *)v28 = 0;
      v26 = "Escalation response was signed using a different certificate.";
    }
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, v28, 2u);
    goto LABEL_15;
  }
LABEL_17:
  CFRelease(v9);
LABEL_18:
  -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", 0, *(_QWORD *)v28);
  v27 = *(NSObject **)DMCLogObjects(-[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", 0));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Escalation rejected.", buf, 2u);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", CFSTR("SignedRequestRejected")));
LABEL_21:
  if (v6)
    v6[2](v6, v22);

}

- (void)_commandEstablishProvisionalEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)DMCLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Establish Provisional Enrollment", buf, 2u);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000AA48;
  v20[3] = &unk_100010B70;
  v9 = v7;
  v21 = v9;
  v10 = objc_retainBlock(v20);
  v11 = DMCIsSetupBuddyDone();
  if ((_DWORD)v11)
  {
    v12 = *(NSObject **)DMCLogObjects(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Provisional Enrollment rejected because device is not still in Buddy", buf, 2u);
    }
    v13 = objc_msgSend((id)objc_opt_class(self), "responseWithStatus:", CFSTR("ProvisionalEnrollmentRejected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(_QWORD *, void *))v10[2])(v10, v14);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Nonce")));
    if (v14)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000AB08;
      v18[3] = &unk_100010B98;
      v18[4] = self;
      v19 = v10;
      +[MDMMCInterface enrollProvisionallyWithNonce:completion:](MDMMCInterface, "enrollProvisionallyWithNonce:completion:", v14, v18);

    }
    else
    {
      v15 = *(NSObject **)DMCLogObjects(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Nonce token not received.", buf, 2u);
      }
      v16 = objc_msgSend((id)objc_opt_class(self), "responseWithStatus:", CFSTR("NonceNotReceived"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (*)(_QWORD *, void *))v10[2])(v10, v17);

    }
  }

}

- (id)_commandSetWiFiPower:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  CFRunLoopRef Current;
  uint64_t Power;
  CFRunLoopRef v14;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  CFRunLoopRef v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PowerState")));
  v4 = objc_msgSend(v3, "BOOLValue");

  v6 = *(NSObject **)DMCLogObjects(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = DMCStringForBool(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting WiFi power: %{public}@", buf, 0xCu);

  }
  v10 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  if (v10)
  {
    v11 = (const void *)v10;
    Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop(v11, Current, kCFRunLoopDefaultMode);
    if (WiFiManagerClientGetPower(v11) == (_DWORD)v4
      || (WiFiManagerClientSetPower(v11, v4), Power = WiFiManagerClientGetPower(v11), (_DWORD)Power == (_DWORD)v4))
    {
      v14 = CFRunLoopGetCurrent();
      WiFiManagerClientUnscheduleFromRunLoop(v11, v14, kCFRunLoopDefaultMode);
      CFRelease(v11);
      return (id)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    }
    v23 = *(NSObject **)DMCLogObjects(Power);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to set WiFi power.", buf, 2u);
    }
    v24 = CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop(v11, v24, kCFRunLoopDefaultMode);
    CFRelease(v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("TUNNEL_ERROR_COULD_NOT_SET_WIFI_POWER"), "DMCAppendGreenteaSuffix"));
    v26 = DMCUnformattedErrorArray(v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v20 = DMCTunnelErrorDomain;
    v21 = DMCErrorTypeFatal;
    v22 = 14005;
  }
  else
  {
    v16 = *(NSObject **)DMCLogObjects(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to create WiFi manager client.", buf, 2u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("TUNNEL_ERROR_COULD_NOT_CREATE_WIFI_MANAGER_CLIENT"), "DMCAppendGreenteaSuffix"));
    v18 = DMCUnformattedErrorArray(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = DMCTunnelErrorDomain;
    v21 = DMCErrorTypeFatal;
    v22 = 14004;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, v22, v19, v21));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](MTIPCUTunnelParser, "responseWithError:", v27));

  return v28;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("IPCUIdentifier")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("IPCUIdentifier")));
    v13 = objc_msgSend(v12, "copy");
    -[MTIPCUTunnelParser setHostIdentifier:](self, "setHostIdentifier:", v13);

    v15 = *(NSObject **)DMCLogObjects(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Got iPCU Identifier: %{public}@", buf, 0xCu);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("HostCertificateData")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (v19 && v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "personaID"));
    v23 = (const void *)DMCHCUCopyHostCertificateForMappedLabel(v20, v22 != 0);

    if (v23)
    {
      CFRelease(v23);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
      +[MDMMCInterface storeCertificateData:forHostIdentifier:](MDMMCInterface, "storeCertificateData:forHostIdentifier:", v18, v24);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kMCTPRequestTypeKey));
  v26 = *(NSObject **)(DMCLogObjects(v25) + 8);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Attempting to perform Unsupervised request: %{public}@", buf, 0xCu);
  }
  if (!v25)
  {
    v27 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](MTIPCUTunnelParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("GetEncryptionKey")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandGetEncryptionKey:](self, "_commandGetEncryptionKey:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("SetCertificate")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandSetCertificate:](self, "_commandSetCertificate:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("HelloHostIdentifier")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandHello:](self, "_commandHello:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("Flush")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandFlush:](self, "_commandFlush:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("GetProfileList")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandGetProfileList:](self, "_commandGetProfileList:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("InstallProfile")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandInstallProfile:](self, "_commandInstallProfile:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("RemoveProfile")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandRemoveProfile:](self, "_commandRemoveProfile:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("StoreProfile")))
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandStoreProfile:](self, "_commandStoreProfile:", v8));
    goto LABEL_29;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("GetStoredProfile")))
  {
    -[MTIPCUTunnelParser _commandGetStoredProfile:completionBlock:](self, "_commandGetStoredProfile:completionBlock:", v8, v10);
LABEL_53:
    v28 = 0;
    goto LABEL_31;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("GetCloudConfiguration")))
  {
    -[MTIPCUTunnelParser _commandGetCloudConfiguration:completionBlock:](self, "_commandGetCloudConfiguration:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("SetCloudConfiguration")))
  {
    -[MTIPCUTunnelParser _commandSetCloudConfiguration:completionBlock:](self, "_commandSetCloudConfiguration:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("DownloadAndApplyCloudConfiguration")))
  {
    -[MTIPCUTunnelParser _commandDownloadAndApplyCloudConfiguration:completionBlock:](self, "_commandDownloadAndApplyCloudConfiguration:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("PollMDMIfNetworkTethered")))
  {
    -[MTIPCUTunnelParser _commandPollMDMIfNetworkTetheredRequest:completionBlock:](self, "_commandPollMDMIfNetworkTetheredRequest:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("Escalate")))
  {
    -[MTIPCUTunnelParser _commandEscalate:completionBlock:](self, "_commandEscalate:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("EscalateResponse")))
  {
    -[MTIPCUTunnelParser _commandEscalateResponse:completionBlock:](self, "_commandEscalateResponse:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("EstablishProvisionalEnrollment")))
  {
    -[MTIPCUTunnelParser _commandEstablishProvisionalEnrollmentRequest:completionBlock:](self, "_commandEstablishProvisionalEnrollmentRequest:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("EraseDevice")))
  {
    -[MTIPCUTunnelParser _commandEraseDevice:completionBlock:](self, "_commandEraseDevice:completionBlock:", v8, v10);
    goto LABEL_53;
  }
  if (!objc_msgSend(v25, "isEqualToString:", CFSTR("SetWiFiPowerState")))
  {
    v29.receiver = self;
    v29.super_class = (Class)MTIPCUTunnelParser;
    -[MTIPCUTunnelParser processRequest:assertion:completionBlock:](&v29, "processRequest:assertion:completionBlock:", v8, v9, v10);
    goto LABEL_53;
  }
  v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandSetWiFiPower:](self, "_commandSetWiFiPower:", v8));
LABEL_29:
  v28 = (void *)v27;
  if (v10)
    v10[2](v10, v27);
LABEL_31:

}

- (id)escalationBlock
{
  return self->_escalationBlock;
}

- (void)setEscalationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)CSR
{
  return self->_CSR;
}

- (void)setCSR:(id)a3
{
  objc_storeStrong((id *)&self->_CSR, a3);
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostIdentifier, a3);
}

- (NSData)challengeCertificate
{
  return self->_challengeCertificate;
}

- (void)setChallengeCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_challengeCertificate, a3);
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (int64_t)downloadAndApplyCloudConfigurationCommandRetryCount
{
  return self->_downloadAndApplyCloudConfigurationCommandRetryCount;
}

- (void)setDownloadAndApplyCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_downloadAndApplyCloudConfigurationCommandRetryCount = a3;
}

- (int64_t)setCloudConfigurationCommandRetryCount
{
  return self->_setCloudConfigurationCommandRetryCount;
}

- (void)setSetCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_setCloudConfigurationCommandRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_challengeCertificate, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_CSR, 0);
  objc_storeStrong(&self->_escalationBlock, 0);
}

@end
