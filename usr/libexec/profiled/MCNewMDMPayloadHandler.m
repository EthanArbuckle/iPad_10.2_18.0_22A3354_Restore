@implementation MCNewMDMPayloadHandler

+ (id)_exchangeSyncUUIDString
{
  void *v2;
  void *v3;
  signed int v4;
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _BYTE *v12;
  unsigned int v13;
  char v14;
  void *v15;
  _QWORD v17[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17[0] = 0;
  v17[1] = 0;
  objc_msgSend(v2, "getUUIDBytes:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 16));
  v4 = (8 * objc_msgSend(v3, "length")) | 4;
  v5 = (v4 / 5);
  v6 = objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v6, "appendBytes:length:", &unk_1000FD840, 4);
  v7 = objc_retainAutorelease(v6);
  v8 = (char *)objc_msgSend(v7, "bytes");
  v9 = malloc_type_calloc((int)v5 + 1, (int)v5, 0x857E69E5uLL);
  v10 = v9;
  if (v4 >= 5)
  {
    v11 = 0;
    v12 = v9;
    do
    {
      v13 = (16 * ((v8[v11 >> 3] >> (~(_BYTE)v11 & 7)) & 1)) | (8
                                                                            * ((v8[(unint64_t)(v11 + 1) >> 3] >> (~(v11 + 1) & 7)) & 1)) | (4 * ((v8[(unint64_t)(v11 + 2) >> 3] >> (~(v11 + 2) & 7)) & 1)) | (2 * ((v8[(unint64_t)(v11 + 3) >> 3] >> (~(v11 + 3) & 7)) & 1)) | (v8[(unint64_t)(v11 + 4) >> 3] >> (~(v11 + 4) & 7)) & 1;
      if (v13 >= 0xA)
        v14 = 55;
      else
        v14 = 48;
      *v12++ = v14 + v13;
      v11 += 5;
      --v5;
    }
    while (v5);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  free(v10);

  return v15;
}

- (id)_cannotCheckInErrorWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = MCMDMErrorDomain;
  v4 = MCErrorArray(CFSTR("MDM_ERROR_CANNOT_CHECK_IN_P_NAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 12002, v5, MCErrorTypeNeedsRetry, a3, 0));

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  id v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  os_log_t v40;
  _BOOL8 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *cf;
  CFTypeRef cfa;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint8_t buf[16];
  _QWORD v102[4];
  NSObject *v103;
  _BYTE *v104;
  _BYTE v105[24];
  char v106;

  v95 = a3;
  v10 = a4;
  v94 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = kMDMPasscodeKey;
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMDMPasscodeKey));
  if (v96)
  {
    v13 = objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v13, "removeObjectForKey:", v12);
    v14 = objc_msgSend(v13, "copy");

    v10 = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((v16 & 1) == 0)
  {
    *(_QWORD *)v105 = 0;
    *(_QWORD *)&v105[8] = v105;
    *(_QWORD *)&v105[16] = 0x2020000000;
    v106 = 0;
    v18 = dispatch_semaphore_create(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_10003E37C;
    v102[3] = &unk_1000E35C0;
    v104 = v105;
    v20 = v18;
    v103 = v20;
    objc_msgSend(v19, "touchWithCompletion:", v102);

    v21 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v20, v21);
    if (!*(_BYTE *)(*(_QWORD *)&v105[8] + 24))
    {
      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "mdmd didn't respond within 30 seconds, give up waiting.", buf, 2u);
      }
    }

    _Block_object_dispose(v105, 8);
  }
  v23 = MDMFilePath(v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_msgSend(v11, "fileExistsAtPath:", v24);

  if (v25)
  {
    v26 = MCErrorArray(CFSTR("MDM_ERROR_ALREADY_INSTALLED"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12001, v27, MCErrorTypeFatal, 0));
    v29 = objc_msgSend(v28, "MCCopyAsPrimaryError");
LABEL_12:
    v33 = v29;
LABEL_13:
    v34 = 0;
    goto LABEL_14;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v31 = objc_msgSend(v30, "effectiveRestrictedBoolForSetting:", MCFeatureMDMEnrollmentAllowed) == 2;

  if (v31)
  {
    v32 = MCErrorArray(CFSTR("MDM_ERROR_NOT_ALLOWED"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12088, v27, MCErrorTypeFatal, 0));
    v29 = objc_msgSend(v28, "MCCopyAsPrimaryError");
    goto LABEL_12;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identityUUID"));
  v100 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler persistentRefForUUID:outError:](self, "persistentRefForUUID:outError:", v50, &v100));
  v33 = v100;

  if (v33)
    goto LABEL_13;
  objc_msgSend(v27, "setIdentityPersistentID:", v28);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serverPinningUUIDs"));
  v99 = 0;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler persistentRefsForUUIDs:outError:](self, "persistentRefsForUUIDs:outError:", v51, &v99));
  v33 = v99;

  if (!v33)
  {
    objc_msgSend(v27, "setServerPinningPersistentRefs:", v93);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "checkInPinningUUIDs"));
    v98 = 0;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler persistentRefsForUUIDs:outError:](self, "persistentRefsForUUIDs:outError:", v52, &v98));
    v33 = v98;

    if (v33)
    {
LABEL_28:
      v34 = 0;
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(v27, "setCheckInPinningPersistentRefs:", v92);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](MCActivationUtilities, "sharedInstance"));
    v54 = objc_msgSend(v53, "isHRNMode");

    if (v54 == 2)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pollingIntervalMinutes"));
      v56 = v59;
      if (v59)
      {
        if ((uint64_t)objc_msgSend(v59, "integerValue") > 4)
        {
          v33 = 0;
LABEL_42:

          if (v33)
            goto LABEL_28;
LABEL_43:
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler _mdmDictWithInstaller:options:payload:](self, "_mdmDictWithInstaller:options:payload:", v95, v10, v27));
          v67 = MDMFilePath(v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          objc_msgSend(v66, "MCWriteToBinaryFile:", v68);

          v69 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
          objc_msgSend(v69, "refreshDetailsFromDisk");

          MDMSendManagingOrgInfoChangedNotification();
          +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:duringMigration:](MDMProvisioningProfileTrust, "didEnrollInMDMWithPasscode:duringMigration:", v96, 0);
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "checkInURLString"));
          if (objc_msgSend(v70, "length"))
            v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "checkInURLString"));
          else
            v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serverURLString"));
          v72 = (void *)v71;
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v71));

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "profile"));
          cfa = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v28, objc_msgSend(v74, "isInstalledForSystem"));

          if (cfa)
          {
            v88 = (void *)objc_opt_class(MCKeychain);
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "checkInPinningPersistentRefs"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "profile"));
            v89 = objc_msgSend(v88, "copyCertificatesWithPersistentIDs:useSystemKeychain:", v75, objc_msgSend(v77, "isInstalledForSystem"));

            v86 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
            v84 = objc_msgSend(v27, "pinningRevocationCheckRequired");
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topic"));
            v83 = objc_msgSend(v27, "useDevelopmentAPNS");
            LOBYTE(v77) = objc_msgSend(v27, "signMessage");
            LOBYTE(v75) = objc_msgSend(v27, "isUserEnrollment");
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "enrollmentID"));
            v97 = 0;
            BYTE1(v82) = (_BYTE)v75;
            LOBYTE(v82) = (_BYTE)v77;
            objc_msgSend(v86, "authenticateWithCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:useDevelopmentAPNS:signMessage:isUserEnrollment:enrollmentID:outError:", v87, cfa, v89, v84, v85, v83, v82, v78, &v97);
            v33 = v97;

            CFRelease(cfa);
            if (!v33)
            {
              -[MCNewMDMPayloadHandler _retainDependency](self, "_retainDependency");
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serverCapabilities"));
              v80 = objc_msgSend(v79, "containsObject:", kMDMUserChannelCapability);

              if (v80)
              {
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
                objc_msgSend(v81, "scheduleTokenUpdate");

              }
            }
          }
          else
          {
            v89 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "friendlyName"));
            v33 = (id)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler _cannotCheckInErrorWithName:](self, "_cannotCheckInErrorWithName:", v89));
          }

          v34 = 1;
          goto LABEL_52;
        }
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "friendlyName"));
        v60 = MCErrorArray(CFSTR("MDM_ERROR_INVALID_POLLING_INTERVAL_P_NAME"));
        cf = (void *)objc_claimAutoreleasedReturnValue(v60);
        v61 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12096, cf, MCErrorTypeFatal, v57, 0));
      }
      else
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "friendlyName"));
        v65 = MCErrorArray(CFSTR("MDM_ERROR_MISSING_POLLING_INTERVAL_P_NAME"));
        cf = (void *)objc_claimAutoreleasedReturnValue(v65);
        v61 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12097, cf, MCErrorTypeFatal, v57, 0));
      }
      v33 = (id)v61;

    }
    else
    {
      if (v54 == 1)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topic"));
        v63 = v62 == 0;

        if (!v63)
          goto LABEL_43;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "friendlyName"));
        v64 = MCErrorArray(CFSTR("MDM_ERROR_MISSING_TOPIC_P_NAME"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(v64);
        v58 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12098, v57, MCErrorTypeFatal, v56, 0));
      }
      else
      {
        if (v54)
          goto LABEL_43;
        v55 = MCErrorArray(CFSTR("MDM_ERROR_ACTIVATION_NOT_READY"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCMDMErrorDomain, 12099, v56, MCErrorTypeFatal, 0));
        v58 = objc_msgSend(v57, "MCCopyAsPrimaryError");
      }
      v33 = v58;
    }

    goto LABEL_42;
  }
  v34 = 0;
LABEL_53:

LABEL_14:
  if (v33)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "friendlyName"));
    v37 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCInstallationErrorDomain, 4001, v38, v33, MCErrorTypeFatal, v36, 0));

    if (a6)
      *a6 = objc_retainAutorelease(v39);
    v40 = _MCLogObjects[0];
    v41 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
    if (v41)
    {
      v42 = v40;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "friendlyName"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "MCVerboseDescription"));
      *(_DWORD *)v105 = 138543618;
      *(_QWORD *)&v105[4] = v44;
      *(_WORD *)&v105[12] = 2114;
      *(_QWORD *)&v105[14] = v45;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Cannot install MDM “%{public}@”. Error: %{public}@", v105, 0x16u);

    }
    if (v34)
    {
      v46 = MDMFilePath(v41);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      objc_msgSend(v11, "removeItemAtPath:error:", v47, 0);

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
      objc_msgSend(v48, "refreshDetailsFromDisk");

      MDMSendManagingOrgInfoChangedNotification();
    }

  }
  else
  {
    MDMSendDevicePostureChangedNotification();
  }

  return v33 == 0;
}

- (id)_mdmDictWithInstaller:(id)a3 options:(id)a4 payload:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v68;
  uint64_t v69;
  SEL v70;
  void *v71;
  MCNewMDMPayloadHandler *v72;
  void *v73;
  uint8_t buf[4];
  void *v75;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  objc_msgSend(v12, "setObject:forKey:", v14, kMDMManagingProfileIdentifierKey);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identityPersistentID"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v15, kMDMIdentityPersistentRefKey);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverPinningPersistentRefs"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v16, kMDMServerPinningCertPersistentRefsKey);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "checkInPinningPersistentRefs"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v17, kMDMCheckInPinningCertPersistentRefsKey);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "pinningRevocationCheckRequired")));
  objc_msgSend(v12, "setObject:forKey:", v18, kMDMPinningRevocationCheckRequiredKey);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topic"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v19, kMDMTopicKey);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pollingIntervalMinutes"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v20, kMDMPollingIntervalKey);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverURLString"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v21, kMDMServerURLKey);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "checkInURLString"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v22, kMDMCheckInURLKey);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverCapabilities"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v23, kMDMServerCapabilitiesKey);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "accessRights")));
  objc_msgSend(v12, "setObject:forKey:", v24, kMDMAccessRightsKey);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "useDevelopmentAPNS")));
  objc_msgSend(v12, "setObject:forKey:", v25, kMDMUseDevelopmentAPNSKey);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
  objc_msgSend(v12, "setObject:forKey:", v26, kMDMPushMagicKey);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "signMessage")));
  objc_msgSend(v12, "setObject:forKey:", v27, kMDMSignMessageKey);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enrollmentMode"));
  objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v28, kMDMEnrollmentModeKey);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsESSOEnrollment));
  LOBYTE(v14) = objc_msgSend(v29, "BOOLValue");

  if ((v14 & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionESSOAppITunesStoreID));
    objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v30, kMDMRequiredAppIDForMDMKey);
    objc_msgSend(v10, "setRequiredAppIDForMDM:", v30);
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requiredAppIDForMDM"));
    objc_msgSend(v12, "MCSetObjectIfNotNil:forKey:", v30, kMDMRequiredAppIDForMDMKey);
  }

  v31 = objc_claimAutoreleasedReturnValue(+[MCMDMOptionsUtilities defaultMDMOptions](MCMDMOptionsUtilities, "defaultMDMOptions"));
  if (v31)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, kMDMOptionsKey);
  v32 = objc_msgSend(v11, "setAsideDictionariesForPayloadHandlerClass:", objc_opt_class(self));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v73 = (void *)v31;
  if (objc_msgSend(v33, "count") == (id)1)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "anyObject"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", kMDMPersonaKey));

  }
  else
  {
    v35 = 0;
  }
  if (objc_msgSend(v10, "isUserEnrollment"))
  {
    v70 = a2;
    v71 = v33;
    v72 = self;
    if (objc_msgSend(v33, "count") == (id)1)
    {
      v68 = v35;
      v36 = v9;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "anyObject"));
      v38 = kMDMEnrollmentIDKey;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", kMDMEnrollmentIDKey));
      v40 = kMDMiCloudEnrollmentIDKey;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", kMDMiCloudEnrollmentIDKey));
      v42 = kMDMEASEnrollmentIDKey;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", kMDMEASEnrollmentIDKey));

      v9 = v36;
      v35 = v68;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "UUIDString"));

      v46 = objc_msgSend((id)objc_opt_class(self), "_exchangeSyncUUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v47 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v75 = v43;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Generated new EAS Enrollment ID: %{private}@", buf, 0xCu);
      }
      v38 = kMDMEnrollmentIDKey;
      v40 = kMDMiCloudEnrollmentIDKey;
      v42 = kMDMEASEnrollmentIDKey;
      v41 = (void *)v69;
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, v38);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v41, v40);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v43, v42);
    objc_msgSend(v10, "setEnrollmentID:", v39);
    objc_msgSend(v10, "setICloudEnrollmentID:", v41);
    objc_msgSend(v10, "setEasEnrollmentID:", v43);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMDMUserEnrollmentKey);
    if (v35)
    {
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
      if (v48)
      {
        v49 = (void *)v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
        v51 = objc_msgSend(v50, "isEqualToString:", v35);

        if ((v51 & 1) == 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
          objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v70, v72, CFSTR("MCNewMDMPayloadHandler.m"), 391, CFSTR("Persona ID from the new payload (%@) and the old payload (%@) doesn't match!!!"), v53, v35);

        }
      }
    }

    v33 = v71;
    self = v72;
  }
  v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
  v55 = (void *)v54;
  if (v54)
    v56 = (void *)v54;
  else
    v56 = v35;
  objc_msgSend(v10, "setPersonaID:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v57, kMDMPersonaKey);

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsCloudProfile));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v58, "BOOLValue")));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, kMDMIsADEProfileKey);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsCloudLocked));
  LODWORD(v58) = objc_msgSend(v60, "BOOLValue");

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "profile"));
  v63 = v58 | objc_msgSend(v62, "isLocked");

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v63));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v64, kMDMIsProfileLockedKey);

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionRMAccountIdentifier));
  if (v65)
  {
    v66 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v65, v66) & 1) != 0)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v65, kMDMRMAccountIDKey);
  }

  return v12;
}

- (id)persistentRefForUUID:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIDForCertificateUUID:", v6));

  if (v8)
  {
    v9 = v8;
  }
  else if (a4)
  {
    v10 = MCMDMErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friendlyName"));
    v13 = MCErrorArray(CFSTR("MDM_ERROR_CERT_NOT_FOUND_P_NAME"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v10, 12005, v14, MCErrorTypeFatal, v12, 0));

  }
  return v8;
}

- (id)persistentRefsForUUIDs:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler persistentRefForUUID:outError:](self, "persistentRefForUUID:outError:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), a4, (_QWORD)v17));
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_11:

  return v15;
}

- (void)_retainDependency
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identityPersistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverPinningPersistentRefs"));
  if (v5)
    objc_msgSend(v4, "addObjectsFromArray:", v5);
  v16 = (void *)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "checkInPinningPersistentRefs"));
  if (v6)
    objc_msgSend(v4, "addObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "MCHexString"));
        objc_msgSend(v7, "addDependent:ofParent:inDomain:", v8, v15, v13);

        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)_releaseDependency
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identityPersistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverPinningPersistentRefs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverPinningPersistentRefs"));

  if (v6)
    objc_msgSend(v4, "addObjectsFromArray:", v5);
  v18 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "checkInPinningPersistentRefs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "checkInPinningPersistentRefs"));

  if (v8)
    objc_msgSend(v4, "addObjectsFromArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](MCDependencyManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    v15 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "MCHexString"));
        objc_msgSend(v9, "removeDependent:fromParent:inDomain:", v10, v17, v15);

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

}

- (void)setAside
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *setAsideDictionary;
  NSString *v8;
  NSString *setAsideEscrowSecret;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v3 = MDMFilePath(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4));
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v5, 0, 0, 0));
  setAsideDictionary = self->_setAsideDictionary;
  self->_setAsideDictionary = v6;

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[MCKeychain stringFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:useSystemKeychain:outError:", kMDMServiceKey, kMDMEscrowSecretAccountKey, 0, 0, 0, 0));
  setAsideEscrowSecret = self->_setAsideEscrowSecret;
  self->_setAsideEscrowSecret = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = MDMFilePath(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v19 = 0;
  objc_msgSend(v10, "removeItemAtPath:error:", v12, &v19);
  v13 = v19;

  if (v13)
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = MDMFilePath(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 136315650;
      v21 = "-[MCNewMDMPayloadHandler setAside]";
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to remove item at path: %@ with error: %@", buf, 0x20u);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  objc_msgSend(v18, "refreshDetailsFromDisk");

  MDMSendManagingOrgInfoChangedNotification();
  self->_setAside = 1;
  -[MCNewMDMPayloadHandler _releaseDependency](self, "_releaseDependency");

}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCNewMDMPayloadHandler;
  -[MCNewPayloadHandler setAsideWithInstaller:](&v12, "setAsideWithInstaller:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = objc_opt_new(NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enrollmentID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kMDMEnrollmentIDKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iCloudEnrollmentID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, kMDMiCloudEnrollmentIDKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "easEnrollmentID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, kMDMEASEnrollmentIDKey);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, kMDMPersonaKey);

  if (-[NSMutableDictionary count](v6, "count"))
  {
    v11 = -[NSMutableDictionary copy](v6, "copy");
    objc_msgSend(v4, "addSetAsideDictionary:forPayloadHandlerClass:", v11, objc_opt_class(self));

  }
}

- (void)unsetAside
{
  NSMutableDictionary *setAsideDictionary;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSString *setAsideEscrowSecret;
  NSString *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (self->_setAside)
  {
    setAsideDictionary = self->_setAsideDictionary;
    v4 = MDMFilePath(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSMutableDictionary MCWriteToBinaryFile:](setAsideDictionary, "MCWriteToBinaryFile:", v5);

    v6 = self->_setAsideDictionary;
    self->_setAsideDictionary = 0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
    objc_msgSend(v7, "refreshDetailsFromDisk");

    setAsideEscrowSecret = self->_setAsideEscrowSecret;
    if (setAsideEscrowSecret)
    {
      LOWORD(v11) = 256;
      +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", setAsideEscrowSecret, kMDMServiceKey, kMDMEscrowSecretAccountKey, 0, 0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0, v11, 0);
      v9 = self->_setAsideEscrowSecret;
      self->_setAsideEscrowSecret = 0;

    }
    -[MCNewMDMPayloadHandler _retainDependency](self, "_retainDependency");
    self->_setAside = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
    objc_msgSend(v10, "notifyNewConfiguration");

    if (+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession"))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
      objc_msgSend(v12, "notifyNewConfiguration");

    }
  }
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  NSMutableDictionary *setAsideDictionary;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rmAccountID"));

  if (!self->_setAside)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
    if (objc_msgSend(v9, "checkOutWhenRemoved"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identityPersistentID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "profile"));
      v14 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v11, objc_msgSend(v13, "isInstalledForSystem"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topic"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "checkInURLString"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));

        if (v17)
        {
          v18 = (void *)objc_opt_class(MCKeychain);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "checkInPinningPersistentRefs"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v45 = v15;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profile"));
          v44 = objc_msgSend(v18, "copyCertificatesWithPersistentIDs:useSystemKeychain:", v19, objc_msgSend(v21, "isInstalledForSystem"));

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
          objc_msgSend(v9, "pinningRevocationCheckRequired");
          objc_msgSend(v9, "signMessage");
          LOBYTE(v18) = objc_msgSend(v9, "isUserEnrollment");
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enrollmentID"));
          v24 = v17;
          v25 = (void *)v23;
          v47 = 0;
          LOBYTE(v43) = (_BYTE)v18;
          v46 = v24;
          objc_msgSend(v22, "checkOutCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:signMessage:isUserEnrollment:enrollmentID:outError:", v43, v23, &v47);
          v26 = v47;

          if (v26)
          {
            v27 = _MCLogObjects[1];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "MCVerboseDescription"));
              *(_DWORD *)buf = 138543362;
              v49 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot check out. Error: %{public}@", buf, 0xCu);

            }
          }

          v15 = v45;
          v17 = v46;
        }
        else
        {
          v31 = _MCLogObjects[1];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Cannot check out because the Check-In URL is invalid.", buf, 2u);
          }
        }
        CFRelease(v14);

        v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
      }
      else
      {
        v30 = _MCLogObjects[1];
        v10 = &MDMPostSetupAutoInstallSetAsideProfilePath_ptr;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot check out because the MDM identity cannot be retrieved.", buf, 2u);
        }
      }
    }
    +[MDMProvisioningProfileTrust didUnenrollFromMDM](MDMProvisioningProfileTrust, "didUnenrollFromMDM");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[176], "sharedClient"));
    objc_msgSend(v32, "uprootMDM");

    v33 = _MCLogObjects[1];
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Preserving unlock token (if any) because we removed the MDM profile through migration", buf, 2u);
      }
    }
    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Deleting unlock token (if any) because we removed the MDM profile", buf, 2u);
      }
      v35 = MCKeybagDeleteMDMEscrowSecret();
      MCKeybagDeleteMDMEscrowData(v35);
    }
    -[MCNewMDMPayloadHandler _releaseDependency](self, "_releaseDependency");
    setAsideDictionary = self->_setAsideDictionary;
    self->_setAsideDictionary = 0;

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaID"));
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaID"));
      +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:](DMCPersonaHelper, "removePersonaAndAccountsWithPersonaID:", v38);
    }
    else
    {
      if (!v8)
      {
LABEL_27:

        goto LABEL_28;
      }
      v39 = (void *)objc_opt_new(DMCAccountUtilities);
      objc_msgSend(v39, "signOutAllPrimaryAccounts");

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dmc_remoteManagementAccountForIdentifier:", v8));
      v41 = v40;
      if (v40)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dmc_altDSID"));
        objc_msgSend(v38, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v42, 0);

      }
    }

    goto LABEL_27;
  }
LABEL_28:

}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient", a3, a4));
  objc_msgSend(v4, "notifyNewConfiguration");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
  objc_msgSend(v5, "scheduleTokenUpdate");

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
    objc_msgSend(v6, "notifyNewConfiguration");

  }
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient", a3, a4));
  objc_msgSend(v4, "notifyNewConfiguration");

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](MDMUserClient, "sharedClient"));
    objc_msgSend(v5, "notifyNewConfiguration");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideEscrowSecret, 0);
  objc_storeStrong((id *)&self->_setAsideDictionary, 0);
}

@end
