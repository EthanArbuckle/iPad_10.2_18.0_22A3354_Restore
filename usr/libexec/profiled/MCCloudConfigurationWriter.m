@implementation MCCloudConfigurationWriter

+ (id)sharedInstance
{
  if (qword_1000FD9C0 != -1)
    dispatch_once(&qword_1000FD9C0, &stru_1000E4230);
  return (id)qword_1000FD9B8;
}

- (BOOL)_activationRecordIndicatesCloudConfigurationIsAvailable
{
  return CFPreferencesGetAppBooleanValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain, 0) != 0;
}

- (BOOL)_writeDetails:(id)a3 toFile:(id)a4
{
  return objc_msgSend(a3, "MCWriteToBinaryFile:", a4);
}

- (void)faceTimeSignInAttemptDidFinish
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "details"));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCCAttemptedFaceTimeSignInKey);
  -[MCCloudConfigurationWriter saveCloudConfigurationDetails:outError:](self, "saveCloudConfigurationDetails:outError:", v5, 0);

}

- (BOOL)_isCloudConfigurationActuallyAvailable
{
  return CFPreferencesGetAppBooleanValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain, 0) != 0;
}

- (BOOL)_isCloudConfigurationAvailableInDEP
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  char v7;
  uint8_t v9[8];
  _QWORD v10[5];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_opt_new(DEPClient);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007936C;
  v10[3] = &unk_1000E4258;
  v12 = &v13;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "fetchConfigurationWithCompletionBlock:", v10);
  if (dispatch_semaphore_wait(v5, 0x1BF08EB000uLL))
  {
    *((_BYTE *)v14 + 24) = 1;
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Activation indicates device must be configured using DEP.", v9, 2u);
    }
  }
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)_validateDetails:(id)a3 outReasonWhyInvalid:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100079BB4;
  v41 = sub_100079BC4;
  v42 = 0;
  if (v5)
  {
    v6 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100079BCC;
      v34[3] = &unk_1000E4280;
      v7 = v5;
      v35 = v7;
      v36 = &v37;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100079C8C;
      v32[3] = &unk_1000E42A8;
      v8 = objc_retainBlock(v34);
      v33 = v8;
      v20 = objc_retainBlock(v32);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100079CF0;
      v30[3] = &unk_1000E42A8;
      v9 = v8;
      v31 = v9;
      v10 = objc_retainBlock(v30);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100079D54;
      v28[3] = &unk_1000E42A8;
      v11 = v9;
      v29 = v11;
      v12 = objc_retainBlock(v28);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100079DB8;
      v25[3] = &unk_1000E4280;
      v26 = v7;
      v27 = &v37;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100079F88;
      v23[3] = &unk_1000E42A8;
      v13 = objc_retainBlock(v25);
      v24 = v13;
      v14 = objc_retainBlock(v23);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100079FEC;
      v21[3] = &unk_1000E42A8;
      v15 = v13;
      v22 = v15;
      v16 = objc_retainBlock(v21);
      if (((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationNameKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationShortNameKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationDepartmentKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationAddressKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationAddressLine1Key)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationAddressLine2Key)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationAddressLine3Key)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationCityKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationRegionKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationZipCodeKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationCountryKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationPhoneKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationMagicKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationEmailKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationSupportPhoneKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCOrganizationSupportEmailKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v10[2])(v10, kCCMDMProtocolVersionKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCIsSupervisedKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCAllowPairingKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCIsMandatoryKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCIsMDMUnremovable)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCAwaitDeviceConfiguredKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCDeviceConfiguredKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCCloudConfigurationUICompleteKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCCloudConfigurationWasAppliedKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCPostSetupProfileWasInstalledKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCAttemptedFaceTimeSignInKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v10[2])(v10, kCCConfigurationSourceKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v14[2])(v14, kCCAnchorCertificatesKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v14[2])(v14, kCCSupervisorHostCertificatesKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCConfigurationURLKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCConfigurationWebURLKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v16[2])(v16, kCCSkipSetupKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCIsMultiUserKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCAutoAdvanceSetup)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCMAIDUsernameKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v20[2])(v20, kCCMAIDHasCredentialKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCLanguageKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCRegionKey)
        && ((unsigned int (*)(_QWORD *, _QWORD))v12[2])(v12, kCCLanguageScriptKey))
      {
        ((void (*)(_QWORD *, _QWORD))v10[2])(v10, kCCProvisionalEnrollmentExpiryKey);
      }

      v17 = v35;
    }
    else
    {
      v17 = (void *)v38[5];
      v38[5] = (uint64_t)CFSTR("not a dictionary");
    }

  }
  v18 = (void *)v38[5];
  if (a4 && v18)
    *a4 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v37, 8);

  return v18 == 0;
}

- (BOOL)saveCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  NSObject *v56;
  os_log_t v57;
  _BOOL8 v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  unsigned __int8 v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  unsigned __int8 v68;
  _BOOL8 v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  char v73;
  NSObject *v74;
  void *v75;
  void *v76;
  unsigned int v77;
  void *v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint8_t buf[4];
  id v89;

  v6 = a3;
  if (-[MCCloudConfigurationWriter _isActivated](self, "_isActivated"))
  {
    v87 = 0;
    v7 = -[MCCloudConfigurationWriter _validateDetails:outReasonWhyInvalid:](self, "_validateDetails:outReasonWhyInvalid:", v6, &v87);
    v8 = v87;
    if ((v7 & 1) == 0)
    {
      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Cannot store cloud configuration because it is invalid: %@", buf, 0xCu);
      }
      v23 = MCCloudConfigErrorDomain;
      v24 = MCErrorArray(CFSTR("CLOUD_CONFIG_INVALID_PROFILE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v14 = MCErrorTypeFatal;
      v15 = v23;
      v16 = 33002;
      goto LABEL_14;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCCConfigurationSourceKey));
    v10 = objc_msgSend(v9, "intValue");

    if (v10 != 1
      && -[MCCloudConfigurationWriter _activationRecordIndicatesCloudConfigurationIsAvailable](self, "_activationRecordIndicatesCloudConfigurationIsAvailable")&& -[MCCloudConfigurationWriter _isCloudConfigurationAvailableInDEP](self, "_isCloudConfigurationAvailableInDEP"))
    {
      v11 = MCCloudConfigErrorDomain;
      v12 = MCErrorArray(CFSTR("CLOUD_CONFIG_DEP_ONLY"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = MCErrorTypeFatal;
      v15 = v11;
      v16 = 33004;
LABEL_14:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, v16, v13, v14, 0));

      if (a4)
        *a4 = objc_retainAutorelease(v25);

LABEL_17:
      v21 = 0;
      goto LABEL_18;
    }
    v27 = kCCAllowPairingKey;
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCCAllowPairingKey));
    if (v28
      && (v29 = (void *)v28,
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v27)),
          v31 = objc_msgSend(v30, "BOOLValue"),
          v30,
          v29,
          (v31 & 1) == 0))
    {
      if ((MCLockdownDeletePairingRecords() & 1) == 0)
      {
        v49 = MCCloudConfigErrorDomain;
        v50 = MCErrorArray(CFSTR("CLOUD_CONFIG_SET_INTERNAL_ERROR"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v50);
        v14 = MCErrorTypeFatal;
        v15 = v49;
        v16 = 33015;
        goto LABEL_14;
      }
      v32 = 0;
    }
    else
    {
      v32 = 1;
    }
    if (!objc_msgSend(v6, "count"))
    {
      v38 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Removing cloud configuration.", buf, 2u);
      }
      v33 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v39 = MCCloudConfigurationDetailsFilePath(v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      objc_msgSend(v33, "removeItemAtPath:error:", v40, 0);

LABEL_60:
      MCSendCloudConfigurationDetailsChangedNotification();
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v75, "setBoolValue:forSetting:sender:", v32, MCFeatureHostPairingAllowed, CFSTR("MCCloudConfigurationWriter.SaveCloudConfiguration"));

      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCCSkipSetupKey));
      v77 = objc_msgSend(v76, "containsObject:", kMCCCSkipSetupDiagnostics);

      if (v77)
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
        v79 = MCFeatureDiagnosticsSubmissionAllowed;
        if (!objc_msgSend(v78, "BOOLSettingForFeature:", MCFeatureDiagnosticsSubmissionAllowed))
          objc_msgSend(v78, "setBoolValue:forSetting:sender:", 0, v79, CFSTR("MCCloudConfigurationWriter.SaveCloudConfiguration"));

      }
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCCIsSupervisedKey));
      v81 = objc_msgSend(v80, "BOOLValue");

      if (v81)
      {
        v82 = +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded](MCCrypto, "createAndStoreNewActivationLockBypassCodeAndHashIfNeeded");
        +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:](MCCloudConfigurationWriter, "setAMFISupervisionFromCloudConfiguration:", v6);
      }
      v21 = 1;
      goto LABEL_18;
    }
    v33 = objc_msgSend(v6, "mutableCopy");
    v34 = kCCIsMDMUnremovable;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCIsMDMUnremovable));
    if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCIsSupervisedKey));
      v37 = objc_msgSend(v36, "BOOLValue");

      if ((v37 & 1) == 0)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v34);
    }
    else
    {

    }
    v41 = kCCAwaitDeviceConfiguredKey;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCAwaitDeviceConfiguredKey));
    if ((objc_msgSend(v42, "BOOLValue") & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCIsSupervisedKey));
      v44 = objc_msgSend(v43, "BOOLValue");

      if ((v44 & 1) == 0)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v41);
    }
    else
    {

    }
    v45 = kCCIsMultiUserKey;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCIsMultiUserKey));
    if (!objc_msgSend(v46, "BOOLValue"))
    {

      goto LABEL_44;
    }
    if ((MCGestaltSupportsMultiUser() & 1) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kCCIsSupervisedKey));
      v48 = objc_msgSend(v47, "BOOLValue");

      if ((v48 & 1) != 0)
      {
LABEL_44:
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](MCActivationUtilities, "sharedInstance"));
        v52 = objc_msgSend(v51, "isHRNMode");

        if ((v52 | 2) == 2)
        {
          v53 = kMCCCIsMultiUserKey;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", kMCCCIsMultiUserKey));
          v55 = objc_msgSend(v54, "BOOLValue");

          if (v55)
          {
            v56 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Cannot configure device for Shared iPad mode when in HRN mode. Ignoring Shared iPad flag.", buf, 2u);
            }
            objc_msgSend(v33, "removeObjectForKey:", v53);
          }
        }
        v57 = _MCLogObjects[0];
        v58 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
        if (v58)
        {
          v59 = kCCIsSupervisedKey;
          v60 = v57;
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v59));
          *(_DWORD *)buf = 138543362;
          v89 = v61;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Storing cloud configuration. (supervised: %{public}@)", buf, 0xCu);

        }
        v62 = MCCloudConfigurationDetailsFilePath(v58);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v64 = -[MCCloudConfigurationWriter _writeDetails:toFile:](self, "_writeDetails:toFile:", v33, v63);

        v65 = _MCLogObjects[0];
        if ((v64 & 1) == 0)
        {
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Could not store cloud configuration.", buf, 2u);
          }
          v83 = MCCloudConfigErrorDomain;
          v84 = MCErrorArray(CFSTR("CLOUD_CONFIG_SAVE_ERROR"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v83, 33023, v85, MCErrorTypeFatal, 0));

          if (a4)
            *a4 = objc_retainAutorelease(v86);

          goto LABEL_17;
        }
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Updating CloudConfigUIComplete and CloudConfigWasApplied keys for set aside details.", buf, 2u);
        }
        objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kCCCloudConfigurationUICompleteKey);
        v66 = MCCloudConfigurationSetAsideDetailsFilePath(objc_msgSend(v33, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kCCCloudConfigurationWasAppliedKey));
        v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v68 = -[MCCloudConfigurationWriter _writeDetails:toFile:](self, "_writeDetails:toFile:", v33, v67);

        if ((v68 & 1) == 0)
        {
          v70 = _MCLogObjects[0];
          v69 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
          if (v69)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Could not store set aside details.", buf, 2u);
          }
        }
        v71 = MCCloudConfigurationSetAsideDetailsFilePath(v69);
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        v73 = MCSetSkipBackupAttributeToItemAtPath(v72, 1);

        v32 = v32;
        if ((v73 & 1) == 0)
        {
          v74 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Could not mark set aside cloud configuration to be excluded from backup.", buf, 2u);
          }
        }
        goto LABEL_60;
      }
    }
    else
    {

    }
    objc_msgSend(v33, "removeObjectForKey:", v45);
    goto LABEL_44;
  }
  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot store cloud configuration because this device is not activated.", buf, 2u);
  }
  v18 = MCCloudConfigErrorDomain;
  v19 = MCErrorArray(CFSTR("CLOUD_CONFIG_NOT_ACTIVATED"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v18, 33003, v20, MCErrorTypeFatal, 0));

  if (!a4)
    goto LABEL_17;
  v8 = objc_retainAutorelease(v8);
  v21 = 0;
  *a4 = v8;
LABEL_18:

  return v21;
}

- (BOOL)finalizeCloudConfigurationOutError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = MCCloudConfigurationSetAsideDetailsFilePath(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11 = 0;
  v7 = objc_msgSend(v4, "removeItemAtPath:error:", v6, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
  {
    v9 = _MCLogObjects[8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud configuration. Error: %{public}@", buf, 0xCu);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v7;
}

+ (void)setAMFISupervisionFromCloudConfiguration:(id)a3
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kCCConfigurationSourceKey));
  v4 = objc_msgSend(v3, "intValue");

  switch(v4)
  {
    case 5u:
      v5 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AMFI/SEP setting internal supervision to mimic configurator supervision", (uint8_t *)v7, 2u);
      }
      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator](MDMProvisioningProfileTrust, "didSuperviseThroughConfigurator");
      break;
    case 2u:
      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator](MDMProvisioningProfileTrust, "didSuperviseThroughConfigurator");
      break;
    case 1u:
      +[MDMProvisioningProfileTrust didSuperviseThroughADE](MDMProvisioningProfileTrust, "didSuperviseThroughADE");
      break;
    default:
      v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AMFI/SEP ignoring supervision source: %{public}d", (uint8_t *)v7, 8u);
      }
      break;
  }
}

@end
