@implementation MCProfileServiceProfileHandler

- (MCProfileServiceProfileHandler)initWithProfile:(id)a3
{
  id v4;
  MCProfileServiceProfileHandler *v5;
  uint64_t v6;
  NSData *persistentID;
  NSData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfileHandler;
  v5 = -[MCProfileHandler initWithProfile:](&v10, "initWithProfile:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentIdentityPersistentID"));
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSData *)v6;

    v8 = v5->_persistentID;
    if (v8)
      v5->_identity = (__SecIdentity *)+[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v8, objc_msgSend(v4, "isInstalledForSystem"));
  }

  return v5;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)MCProfileServiceProfileHandler;
  -[MCProfileServiceProfileHandler dealloc](&v4, "dealloc");
}

- (id)_badIdentityError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCOTAProfilesErrorDomain;
  v3 = MCErrorArray(CFSTR("OTA_SERVER_RETURNED_BAD_IDENTITY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 24002, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCHexString"));

  objc_msgSend(v12, "addDependent:ofParent:inDomain:reciprocalDomain:toSystem:user:", v9, v11, kMCDMCertificateToPayloadUUIDDependencyKey, kMCDMPayloadUUIDToCertificateDependencyKey, v7, v6);
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCHexString"));

  objc_msgSend(v12, "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:", v9, v11, kMCDMCertificateToPayloadUUIDDependencyKey, kMCDMPayloadUUIDToCertificateDependencyKey, v7, v6);
}

- (id)fetchFinalProfileWithClient:(id)a3 outProfileData:(id *)a4 outError:(id *)a5
{
  void *v7;
  void *v8;
  void **p_vtable;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __SecIdentity *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  int v33;
  id *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  os_log_t v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  os_log_t v60;
  NSObject *v61;
  __CFString *v62;
  uint64_t v64;
  __SecIdentity *v65;
  NSObject *v66;
  _BOOL8 v67;
  void *v68;
  NSData *v69;
  NSData *persistentID;
  void *v71;
  NSData *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __SecIdentity *identity;
  NSData *v77;
  _BOOL4 v78;
  id v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id *v85;
  id v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t buf[4];
  CFStringRef v95;

  v87 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLString"));
  v88 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));

  p_vtable = &OBJC_METACLASS___MCExtensibleSingleSignOnPayloadHandler.vtable;
  if (self->_identity)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Enrolling in OTA Profile service...", buf, 2u);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "challenge"));
    v93 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCMachineInfo machineInfoWithKeys:challenge:identity:additionalInfo:outError:](MCMachineInfo, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:", v22, v23, 0, 0, &v93));
    v10 = v93;

    if (v10)
    {
      v11 = 0;
      v19 = 0;
      v12 = 0;
      v25 = a5;
      v26 = (id)v88;
      goto LABEL_33;
    }
    v85 = a4;
    v30 = objc_msgSend(objc_alloc((Class)DMCHTTPTransaction), "initWithURL:method:", v88, CFSTR("POST"));
    objc_msgSend(v30, "setTimeout:", 45.0);
    objc_msgSend(v30, "setUserAgent:", kMCProfileUserAgent);
    objc_msgSend(v30, "setContentType:", CFSTR("application/pkcs7-signature"));
    objc_msgSend(v30, "setData:", v24);
    objc_msgSend(v30, "performSynchronously");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "responseData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "permanentlyRedirectedURL"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "error"));
    if (v32)
    {
      v10 = (id)v32;
      v11 = 0;
      v33 = 2;
    }
    else
    {
      v92 = 0;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v31, &v92));
      v37 = v92;
      v83 = v36;
      if (v37)
      {
        v10 = v37;
        v11 = 0;
        v33 = 2;
      }
      else
      {
        v82 = v31;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "payloads"));
        v46 = objc_msgSend(v45, "count");

        if (v46 == (id)1)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "payloads"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndex:", 0));

          v49 = objc_opt_class(MCCertificatePayload);
          if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0 && (objc_msgSend(v48, "isIdentity") & 1) != 0)
            v50 = 0;
          else
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceProfileHandler _badIdentityError](self, "_badIdentityError"));
          v81 = v48;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "handlerWithProfileHandler:", self));
          v91 = v50;
          v65 = (__SecIdentity *)objc_msgSend(v11, "copyIdentityImmediatelyWithInteractionClient:outError:", v87, &v91);
          v10 = v91;

          self->_identity = v65;
          if (v10)
          {
            v33 = 2;
          }
          else
          {
            v79 = objc_msgSend(v7, "installType");
            v66 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v95 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Temporarily storing identity for profile service profile, storing with accessibility %@", buf, 0xCu);
            }
            v67 = v79 != (id)2;
            v78 = v79 != (id)2;
            v80 = v79 == (id)2;
            identity = self->_identity;
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
            v69 = (NSData *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", identity, v68, kMCAppleIdentitiesKeychainGroup, v67, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly));
            persistentID = self->_persistentID;
            self->_persistentID = v69;

            v77 = self->_persistentID;
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
            -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:", v77, v71, v67, v80);

            v72 = self->_persistentID;
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
            -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:", v72, v73, v78, v80);

            v33 = 0;
          }

        }
        else
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceProfileHandler _badIdentityError](self, "_badIdentityError"));
          v11 = 0;
          v33 = 2;
        }
        v31 = v82;
      }

    }
    if (v33)
    {
      v19 = 0;
      v20 = (void *)v88;
      goto LABEL_30;
    }
    a4 = v85;
    p_vtable = (void **)(&OBJC_METACLASS___MCExtensibleSingleSignOnPayloadHandler + 24);
  }
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retrieving profile from OTA Profile service...", buf, 2u);
  }
  v14 = p_vtable + 27;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceAttributes"));
  v16 = self->_identity;
  v90 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:", v15, 0, v16, 0, &v90));
  v18 = v90;

  if (!v18)
  {
    v20 = (void *)v88;
    v27 = objc_msgSend(objc_alloc((Class)DMCHTTPTransaction), "initWithURL:method:", v88, CFSTR("POST"));
    objc_msgSend(v27, "setTimeout:", 45.0);
    objc_msgSend(v27, "setUserAgent:", kMCProfileUserAgent);
    objc_msgSend(v27, "setContentType:", CFSTR("application/pkcs7-signature"));
    objc_msgSend(v27, "setData:", v17);
    objc_msgSend(v27, "performSynchronously");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseData"));
    v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "permanentlyRedirectedURL"));

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "error"));
    if (v29)
    {
      v10 = (id)v29;
      v19 = 0;
LABEL_28:

      v12 = (void *)v84;
      goto LABEL_29;
    }
    v34 = a4;
    v89 = 0;
    v19 = (id)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v28, &v89));
    v35 = v89;
    if (v35)
    {
LABEL_16:
      v10 = v35;
      goto LABEL_28;
    }
    v38 = objc_opt_class(MCConfigurationProfile);
    if ((objc_opt_isKindOfClass(v19, v38) & 1) != 0)
    {
      if (!objc_msgSend(v19, "isUserEnrollmentProfile"))
      {
        if (v87)
        {
          if (+[DMCMobileGestalt isVisionDevice](DMCMobileGestalt, "isVisionDevice")
            && objc_msgSend(v19, "isMDMProfile")
            && (+[DMCFeatureFlags isVisionProfileEnrollEnabled](DMCFeatureFlags, "isVisionProfileEnrollEnabled") & 1) == 0)
          {
            v74 = MCOTAProfilesErrorDomain;
            v75 = MCErrorArrayByDevice(CFSTR("ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED"), v64);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v75);
            v42 = MCErrorTypeFatal;
            v43 = v74;
            v44 = 24006;
            goto LABEL_27;
          }
          v35 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceProfileHandler _sdpErrorForFinalProfile:](self, "_sdpErrorForFinalProfile:", v19));
          if (v35)
            goto LABEL_16;
        }
        v10 = 0;
        if (v34)
          *v34 = objc_retainAutorelease(v28);
        goto LABEL_28;
      }
      v39 = MCOTAProfilesErrorDomain;
      v40 = MCErrorArray(CFSTR("OTA_SERVER_RETURNED_FORBIDDEN_PROFILE"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = MCErrorTypeFatal;
      v43 = v39;
      v44 = 24004;
    }
    else
    {
      v51 = MCOTAProfilesErrorDomain;
      v52 = MCErrorArray(CFSTR("OTA_SERVER_RETURNED_BAD_PROFILE"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v42 = MCErrorTypeFatal;
      v43 = v51;
      v44 = 24003;
    }
LABEL_27:
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v43, v44, v41, v42, 0));

    goto LABEL_28;
  }
  v19 = 0;
  v10 = v18;
  v20 = (void *)v88;
LABEL_29:

LABEL_30:
  if (!v10)
  {
    objc_msgSend(v7, "setEnrollmentIdentityPersistentID:", self->_persistentID);
    objc_msgSend(v19, "setOTAProfile:", v7);
    v60 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      *(_DWORD *)buf = 138543362;
      v95 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Received final profile: %{public}@", buf, 0xCu);

    }
    v19 = v19;
    v10 = 0;
    v59 = v19;
    goto LABEL_42;
  }
  if (!v12)
  {
    v25 = a5;
    if (!a5)
      goto LABEL_35;
    goto LABEL_34;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v26 = objc_msgSend(v53, "mutableCopy");

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
  objc_msgSend(v26, "setObject:forKey:", v54, MCErrorPermanentlyRedirectedURLString);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v55 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, objc_msgSend(v10, "code"), v26));

  v10 = (id)v55;
  v25 = a5;
LABEL_33:

  if (v25)
LABEL_34:
    *v25 = objc_msgSend(v10, "MCCopyAsPrimaryError");
LABEL_35:
  v56 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v57 = v56;
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v95 = v58;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failure occurred while retrieving profile during OTA Profile Enrollment: %{public}@", buf, 0xCu);

  }
  if (!v11)
  {
    v59 = 0;
    goto LABEL_44;
  }
  objc_msgSend(v11, "remove");
  v59 = 0;
LABEL_42:

LABEL_44:
  return v59;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  id v25;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v24.receiver = self;
  v24.super_class = (Class)MCProfileServiceProfileHandler;
  v25 = 0;
  -[MCProfileHandler installWithInstaller:options:interactionClient:outError:](&v24, "installWithInstaller:options:interactionClient:outError:", v12, v11, v10, &v25);

  v14 = v25;
  v15 = v14;
  if (v14)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }
  else
  {
    v16 = objc_msgSend(v13, "installType");
    v17 = v16 != (id)2;
    v18 = v16 == (id)2;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "enrollmentIdentityPersistentID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
    -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:", v19, v20, v17, v18);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](MCInstaller, "sharedInstaller"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    objc_msgSend(v21, "purgePurgatoryProfileWithIdentifier:targetDevice:", v22, +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"));

  }
  return v15 == 0;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "OTA Profile installed", buf, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if (objc_msgSend(v9, "confirmInstallation"))
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending installation confirmation to OTA Profile service. No error check is performed.", v16, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", &off_1000ED2F0, 100, 0, 0));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
      if (!SecCMSSignDataAndAttributes(self->_identity, v11, 0, v14, 0))
      {
        v15 = objc_msgSend(objc_alloc((Class)DMCHTTPTransaction), "initWithURL:method:", v13, CFSTR("POST"));
        objc_msgSend(v15, "setTimeout:", 45.0);
        objc_msgSend(v15, "setUserAgent:", kMCProfileUserAgent);
        objc_msgSend(v15, "setContentType:", CFSTR("application/pkcs7-signature"));
        objc_msgSend(v15, "setData:", v14);
        objc_msgSend(v15, "performSynchronously");

      }
    }

  }
}

- (void)setAsideWithInstaller:(id)a3
{
  void *v4;
  id v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfileHandler;
  -[MCProfileHandler setAsideWithInstaller:](&v10, "setAsideWithInstaller:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v5 = objc_msgSend(v4, "installType");
  v6 = v5 != (id)2;
  v7 = v5 == (id)2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentIdentityPersistentID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:", v8, v9, v6, v7);

}

- (void)unsetAside
{
  void *v3;
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCProfileServiceProfileHandler;
  -[MCProfileHandler unsetAside](&v9, "unsetAside");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v4 = objc_msgSend(v3, "installType");
  v5 = v4 != (id)2;
  v6 = v4 == (id)2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enrollmentIdentityPersistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:", v7, v8, v5, v6);

}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCProfileServiceProfileHandler;
  -[MCProfileHandler removeWithInstaller:options:](&v11, "removeWithInstaller:options:", a3, a4);
  if (!-[MCProfileHandler isSetAside](self, "isSetAside"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v6 = objc_msgSend(v5, "installType");
    v7 = v6 != (id)2;
    v8 = v6 == (id)2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enrollmentIdentityPersistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:](self, "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:", v9, v10, v7, v8);

  }
}

- (id)_sdpErrorForFinalProfile:(id)a3
{
  id v3;
  id v4;
  id v5;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10007C8A8;
  v17 = sub_10007C8B8;
  v18 = 0;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007C8C0;
  v10 = &unk_1000E4340;
  v12 = &v13;
  v4 = (id)objc_opt_new(DMCSynchronous);
  v11 = v4;
  +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:completion:](MCInstaller, "isInteractiveProfileInstallationAllowedBySDP:completion:", v3, &v7);
  objc_msgSend(v4, "waitForCompletion", v7, v8, v9, v10);
  v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
