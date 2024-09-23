@implementation MCPasscodeManagerWriter

+ (id)sharedManager
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCPasscodeManagerWriter;
  v2 = objc_msgSendSuper2(&v4, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)_setPublicPasscodeDict:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser"));
  v13 = 0;
  objc_msgSend(v4, "setKeybagOpaqueDataForUser:withOpaqueData:withError:", v5, v3, &v13);
  v6 = v13;
  if (v6)
  {
    v7 = MCPasscodeErrorDomain;
    v8 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_OPAQUE_PASSCODE_DATA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 5023, v9, v6, MCErrorTypeFatal, 0));

    if (v10)
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set opaque passcode data: (%{public}@)", buf, 0xCu);
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setPrivatePasscodeDict:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, 0));
    if (v3)
    {
      LOBYTE(v4) = 0;
      v5 = v3;
      +[MCKeychain setData:forService:account:label:description:access:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:access:useSystemKeychain:outError:", v3, kMCServiceName, kMCPrivateAccountName, 0, 0, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, v4, 0);
      v3 = v5;
    }

  }
  else
  {
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", kMCServiceName, kMCPrivateAccountName, 0, 0, 0, 0);
  }
}

- (void)_sendPasscodeChangedNotification
{
  uint64_t v2;

  v2 = GSSendAppPreferencesChanged(MCSpringboardBundleIdentifier, CFSTR("DeviceLockPassword"));
  MCSendPasscodeChangedNotification(v2);
}

- (BOOL)isPasscodeRecoveryRestricted
{
  void *v2;
  BOOL v3;

  if (!MCKeybagMementoSupported(self, a2))
    return 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v3 = (objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", MCFeaturePasscodeRecoveryAllowed) & 1) != 0
    || !+[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode")
    || objc_msgSend(v2, "effectiveRestrictedBoolForSetting:", MCFeatureLockdownModeAllowed) == 1;

  return v3;
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int HasSEP;
  int v27;
  id v28;
  void *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  int v32;
  id v33;
  void *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  MCPasscodeManagerWriter *v42;
  MCPasscodeManagerWriter *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSMutableDictionary *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _UNKNOWN **v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  NSMutableDictionary *v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  __CFDictionary *Mutable;
  __CFDictionary *v72;
  int v73;
  const void **v74;
  NSObject *v75;
  NSMutableDictionary *v76;
  void *v77;
  void *v78;
  NSDate *v79;
  void *v80;
  id v81;
  id v82;
  char v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  NSMutableDictionary *v88;
  void *v89;
  id v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  NSMutableDictionary *v98;
  void *v99;
  id v100;
  void *v101;
  NSObject *v102;
  uint64_t v103;
  __CFDictionary *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  NSObject *v108;
  uint64_t v110;
  int v111;
  unsigned int v112;
  int v113;
  _BOOL4 v114;
  int v115;
  id v116;
  void *v117;
  unsigned int v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  unsigned int v124;
  NSMutableDictionary *v125;
  id *v126;
  id *v127;
  NSMutableDictionary *v128;
  NSMutableDictionary *v129;
  NSMutableDictionary *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  NSMutableDictionary *v135;
  MCPasscodeManagerWriter *v136;
  id v137;
  id v138;
  id v139;
  uint8_t buf[4];
  __CFDictionary *v141;
  _QWORD v142[3];
  _QWORD v143[3];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if ((+[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode") & 1) != 0)
  {
    if ((+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked") & 1) != 0
      || (v15 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"))) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataUsingEncoding:", 4));
      v137 = objc_msgSend(v16, "length");
      if (!v137)
      {

        v16 = 0;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));
      v138 = objc_msgSend(v17, "length");
      if (!v138)
      {

        v17 = 0;
      }
      v139 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v139));
      v15 = v139;
      if (v15)
      {
LABEL_84:

        if (!a7)
          goto LABEL_87;
        goto LABEL_85;
      }
      v132 = v17;
      v133 = v18;
      v134 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
      v114 = v9;
      if (objc_msgSend(v19, "userMode") == 1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
        v21 = objc_msgSend(v20, "isSharedIPad");

      }
      else
      {
        v21 = 0;
      }

      HasSEP = MCGestaltHasSEP(v25);
      v27 = v21 ^ 1;
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
      v28 = objc_msgSend(v117, "MCMutableDeepCopy");
      v29 = v28;
      if (v28)
        v30 = (NSMutableDictionary *)v28;
      else
        v30 = objc_opt_new(NSMutableDictionary);
      v31 = v30;
      v136 = self;
      v32 = HasSEP & v27;

      v33 = objc_msgSend(v133, "MCMutableDeepCopy");
      v34 = v33;
      if (v33)
        v35 = (NSMutableDictionary *)v33;
      else
        v35 = objc_opt_new(NSMutableDictionary);
      v36 = v35;

      v122 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:](MCPasscodeManagerWriter, "characteristicsDictionaryFromPasscode:", v13));
      v118 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManagerWriter, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      v119 = v14;
      v135 = v36;
      v115 = v32;
      if (v32)
      {
        v37 = MCKeybagCurrentPasscodeGeneration();
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v121 = v38;
        if (v137 && v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringValue"));
          if (v31)
          {
            v40 = v31;
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v39));

            v42 = v136;
            if (v41)
            {
              v125 = v40;
            }
            else
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:](v136, "_fixUpPublicPasscodeDict:", v117));
              v48 = (NSMutableDictionary *)objc_msgSend(v47, "MCMutableDeepCopy");

              v125 = v48;
            }
          }
          else
          {
            v125 = 0;
            v42 = v136;
          }
          v49 = kMCPrivatePasscodeCharacteristicsKey;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v135, "objectForKeyedSubscript:", kMCPrivatePasscodeCharacteristicsKey));
          v51 = v50;
          if (v50)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v39));

            if (!v52)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPasscodeCharacteristics:](v42, "_fixUpPasscodeCharacteristics:", v51));
              v54 = objc_msgSend(v53, "MCMutableDeepCopy");

              -[NSMutableDictionary setObject:forKeyedSubscript:](v135, "setObject:forKeyedSubscript:", v54, v49);
              v14 = v119;
            }
          }

          v46 = v134;
          v36 = v135;
          v38 = v121;
        }
        else
        {
          v125 = v31;
          v46 = v134;
        }
        if (v138 && v38)
        {
          v45 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v38, "unsignedIntegerValue") + 1));
        }
        else
        {
          v55 = &off_1000ED268;
          if (v38)
            v55 = (_UNKNOWN **)v38;
          v45 = v55;
          if (!v138)
          {
            v31 = v125;
            v43 = v136;
            goto LABEL_46;
          }
        }
        -[MCPasscodeManagerWriter updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:](v136, "updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:", v12, v46, v36);
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v45, "stringValue"));
        v57 = kMCPrivatePasscodeCharacteristicsKey;
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", kMCPrivatePasscodeCharacteristicsKey));
        v59 = v58;
        if (v58)
          v60 = v58;
        else
          v60 = objc_opt_new(NSMutableDictionary);
        v61 = v60;
        v130 = v60;

        -[NSMutableDictionary setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v122, v56);
        v36 = v135;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v135, "setObject:forKeyedSubscript:", v61, v57);
        v43 = v136;
        -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](v136, "_setPrivatePasscodeDict:", v135);
        v142[0] = kMCPublicPasscodeKeyboardTypeKey;
        v123 = (void *)v56;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v118));
        v143[0] = v62;
        v142[1] = kMCPublicPasscodeSimpleTypeKey;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
        v143[1] = v63;
        v142[2] = kMCPublicPasscodeCreationDateKey;
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v143[2] = v64;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v143, v142, 3));

        v31 = v125;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v125, "setObject:forKeyedSubscript:", v65, v123);
        v66 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](v136, "_setPublicPasscodeDict:", v125);

        v14 = v119;
      }
      else
      {
        v43 = v136;
        v44 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](v136, "_setPublicPasscodeDict:", 0);
        v45 = (uint64_t)-[NSMutableDictionary mutableCopy](v36, "mutableCopy");
        objc_msgSend((id)v45, "setObject:forKeyedSubscript:", 0, kMCPrivatePasscodeCharacteristicsKey);
        -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](v136, "_setPrivatePasscodeDict:", v45);
        v121 = 0;
      }
      v46 = v134;
LABEL_46:

      v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v31, 200, 0, 0));
      v67 = MCKeybagMementoBlobExists();
      v113 = v67;
      v69 = MCKeybagMementoSupported(v67, v68);
      v70 = -[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](v43, "isPasscodeRecoveryRestricted");
      LODWORD(v45) = v70;
      v112 = v69;
      if (v137 && v69)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v72 = Mutable;
        if (v138)
          v73 = v45 | v114;
        else
          v73 = 1;
        v74 = (const void **)&kCFBooleanTrue;
        if (v73)
          v74 = (const void **)&kCFBooleanFalse;
        CFDictionaryAddValue(Mutable, CFSTR("OverrideMemento"), *v74);
        v111 = v73 ^ 1;
        v75 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v72;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Changing passcode with options: %@", buf, 0xCu);
        }
        v124 = MKBKeyBagChangeSystemSecretOpts(v134, v132, v131, v72);
        v36 = v135;
        if (!v115)
        {
LABEL_56:
          if (v138)
          {
            v76 = v31;
            v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v118));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v77, kMCPublicPasscodeKeyboardTypeKey);

            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v78, kMCPublicPasscodeSimpleTypeKey);

            v79 = objc_opt_new(NSDate);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v79, kMCPublicPasscodeCreationDateKey);

            -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v122, kMCPrivatePasscodeCharacteristicsKey);
            v80 = 0;
            goto LABEL_70;
          }
          v80 = 0;
LABEL_68:
          if ((-[MCPasscodeManagerWriter isPasscodeSet](v136, "isPasscodeSet") & 1) != 0)
          {
LABEL_71:
            v102 = _MCLogObjects[0];
            v129 = v31;
            v120 = v80;
            if (v124)
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v141) = v124;
                _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Failed to set new passcode. Result: %d", buf, 8u);
              }
              v103 = MCPasscodeErrorDomain;
              v104 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v124));
              v105 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_P_CODE"));
              v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
              v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v103, 5014, v106, MCErrorTypeFatal, v104, 0));

              v18 = v133;
              v16 = v134;
              v17 = v132;
              v107 = v117;
            }
            else
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Passcode has been changed.", buf, 2u);
              }
              v107 = v117;
              v104 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:](v136, "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:", v121, v117, v80, v31, v138 != 0));
              if (v104)
              {
                v108 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v141 = v104;
                  _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Failed to process passcode change. Error: %{public}@", buf, 0xCu);
                }
              }
              BYTE1(v110) = v114;
              LOBYTE(v110) = v45;
              +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 0, v137 != 0, v138 == 0, v118, 0xFFFFFFFFLL, v112, v110, v14);
              if (((v111 | v113 ^ 1) & 1) == 0)
                +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 0);
              v15 = 0;
              v18 = v133;
              v16 = v134;
              v17 = v132;
            }

            goto LABEL_84;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", 0, kMCPrivatePasscodeCharacteristicsKey);
          v76 = 0;
LABEL_70:
          v100 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](v136, "_setPublicPasscodeDict:", v76);
          -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](v136, "_setPrivatePasscodeDict:", v36);
          v101 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
          objc_msgSend(v101, "clearAllPasscodeComplianceCaches");

          v31 = v76;
          v14 = v119;
          goto LABEL_71;
        }
      }
      else
      {
        v126 = a7;
        v81 = v13;
        v82 = v12;
        v83 = v70;
        v45 = (uint64_t)v31;
        v84 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Changing passcode with no options", buf, 2u);
        }
        v124 = MKBKeyBagChangeSystemSecret(v46, v132, v131);
        v111 = 0;
        v31 = (NSMutableDictionary *)v45;
        LOBYTE(v45) = v83;
        v12 = v82;
        v13 = v81;
        a7 = v126;
        if (!v115)
          goto LABEL_56;
      }
      v85 = MCKeybagCurrentPasscodeGeneration();
      v80 = (void *)objc_claimAutoreleasedReturnValue(v85);
      if (v138)
      {
        v86 = MCKeybagMementoPasscodeGeneration();
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        v76 = objc_opt_new(NSMutableDictionary);
        v88 = objc_opt_new(NSMutableDictionary);
        if (v80)
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "stringValue"));
          v127 = a7;
          v116 = v13;
          v90 = v12;
          v91 = v45;
          v45 = (uint64_t)v31;
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v89));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", v92, v89);

          v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v135, "objectForKeyedSubscript:", kMCPrivatePasscodeCharacteristicsKey));
          v94 = v80;
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", v89));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v95, v89);

          v80 = v94;
          v31 = (NSMutableDictionary *)v45;
          LOBYTE(v45) = v91;
          v12 = v90;
          v13 = v116;
          a7 = v127;

        }
        if (v87)
        {
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "stringValue"));
          v128 = v88;
          v97 = v45;
          v45 = (uint64_t)v80;
          v98 = v31;
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v96));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", v99, v96);

          v31 = v98;
          v80 = (void *)v45;
          LOBYTE(v45) = v97;
          v88 = v128;

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v135, "setObject:forKeyedSubscript:", v88, kMCPrivatePasscodeCharacteristicsKey);

        v36 = v135;
        goto LABEL_70;
      }
      goto LABEL_68;
    }
  }
  else
  {
    v22 = MCPasscodeErrorDomain;
    v23 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_MODIFY"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v22, 5014, v24, MCErrorTypeFatal, 0));

  }
  if (!a7)
    goto LABEL_87;
LABEL_85:
  if (v15)
    *a7 = objc_retainAutorelease(v15);
LABEL_87:

  return v15 == 0;
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSMutableDictionary *v39;
  void *v40;
  id v41;
  void *v42;
  NSMutableDictionary *v43;
  _UNKNOWN **v44;
  _UNKNOWN **v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  __CFDictionary *Mutable;
  int v53;
  CFBooleanRef v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSDate *v59;
  NSMutableDictionary *v60;
  void *v61;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  unsigned __int8 v75;
  id v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  NSObject *v82;
  id v83;
  void *v84;
  NSMutableDictionary *v85;
  NSMutableDictionary *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSMutableDictionary *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  void *v96;
  unsigned int v97;
  NSMutableDictionary *v98;
  void *v99;
  int v100;
  unsigned int v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  _UNKNOWN **v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  NSMutableDictionary *v114;
  NSMutableDictionary *v115;
  NSMutableDictionary *v116;
  id v117;
  id v118;
  unsigned int v119;
  void *v120;
  void *v121;
  uint8_t buf[4];
  void *v123;
  _QWORD v124[3];
  _QWORD v125[3];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if ((MCKeybagMementoSupported(v14, v15) & 1) != 0)
  {
    if ((+[MCRestrictionManager mayChangePasscode](MCRestrictionManager, "mayChangePasscode") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataUsingEncoding:", 4));
      if (-[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](self, "isPasscodeRecoveryRestricted")
        || !MCKeybagMementoBlobExists()
        || !objc_msgSend(v16, "length"))
      {
        v28 = MCPasscodeErrorDomain;
        v29 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_PASSCODE_WITH_RECOVERY"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v28, 5014, v30, MCErrorTypeFatal, 0));
        goto LABEL_15;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));
      v111 = objc_msgSend(v17, "length");
      if (!v111)
      {

        v17 = 0;
      }
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
      v18 = objc_msgSend(v107, "MCMutableDeepCopy");
      v19 = v18;
      v113 = v16;
      if (v18)
        v20 = (NSMutableDictionary *)v18;
      else
        v20 = objc_opt_new(NSMutableDictionary);
      v114 = v20;

      v119 = -1;
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:](MCPasscodeManagerWriter, "characteristicsDictionaryFromPasscode:", v13));
      v101 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManagerWriter, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
      v112 = v17;
      if (objc_msgSend(v32, "userMode") == 1)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
        v34 = objc_msgSend(v33, "isSharedIPad");

      }
      else
      {
        v34 = 0;
      }

      v105 = MCGestaltHasSEP(v35) & (v34 ^ 1);
      if (v105 != 1)
      {
        v41 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", 0);
        v106 = 0;
        v39 = v114;
        goto LABEL_38;
      }
      v36 = MCKeybagCurrentPasscodeGeneration();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringValue"));
      v39 = v114;
      v102 = (void *)v38;
      if (v114 && v38)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v114, "objectForKeyedSubscript:", v38));

        if (v40)
        {
          v39 = v114;
        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:](self, "_fixUpPublicPasscodeDict:", v107));
          v43 = (NSMutableDictionary *)objc_msgSend(v42, "MCMutableDeepCopy");

          v39 = v43;
        }
      }
      v106 = v37;
      if (v111 && v37)
      {
        v44 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v37, "unsignedIntegerValue") + 1));
      }
      else
      {
        v45 = &off_1000ED268;
        if (v37)
          v45 = (_UNKNOWN **)v37;
        v44 = v45;
        if (!v111)
          goto LABEL_37;
      }
      v108 = v44;
      v115 = v39;
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringValue"));
      v124[0] = kMCPublicPasscodeKeyboardTypeKey;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v101));
      v125[0] = v46;
      v124[1] = kMCPublicPasscodeSimpleTypeKey;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v119));
      v125[1] = v47;
      v124[2] = kMCPublicPasscodeCreationDateKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v125[2] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 3));

      v39 = v115;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v115, "setObject:forKeyedSubscript:", v49, v99);
      v50 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v115);

      v44 = v108;
LABEL_37:

LABEL_38:
      v116 = v39;
      v51 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v39, 200, 0, 0));
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, CFSTR("UseMementoBlob"), kCFBooleanTrue);
      if (v111)
        v53 = v9;
      else
        v53 = 1;
      v100 = v53;
      if (v53)
        v54 = kCFBooleanFalse;
      else
        v54 = kCFBooleanTrue;
      CFDictionaryAddValue(Mutable, CFSTR("OverrideMemento"), v54);
      v103 = (void *)v51;
      v55 = MKBKeyBagChangeSystemSecretOpts(v113, v112, v51, Mutable);
      if (v105)
      {
        v56 = MCKeybagCurrentPasscodeGeneration();
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        if (v111)
        {
          v58 = MCKeybagMementoPasscodeGeneration();
          v59 = (NSDate *)objc_claimAutoreleasedReturnValue(v58);
          v60 = objc_opt_new(NSMutableDictionary);
          v109 = v57;
          v97 = v55;
          if (v57)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringValue"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v116, "objectForKeyedSubscript:", v61));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v62, v61);

            v57 = v109;
            v55 = v97;
          }
          v63 = v116;
          if (v59)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate stringValue](v59, "stringValue"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v116, "objectForKeyedSubscript:", v64));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v65, v64);

            v57 = v109;
            v63 = v116;
            v55 = v97;
          }

          goto LABEL_56;
        }
      }
      else
      {
        if (v111)
        {
          v66 = v55;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v101));
          v60 = v116;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v116, "setObject:forKeyedSubscript:", v67, kMCPublicPasscodeKeyboardTypeKey);

          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v119));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v116, "setObject:forKeyedSubscript:", v68, kMCPublicPasscodeSimpleTypeKey);

          v55 = v66;
          v59 = objc_opt_new(NSDate);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v116, "setObject:forKeyedSubscript:", v59, kMCPublicPasscodeCreationDateKey);
          v57 = 0;
          goto LABEL_56;
        }
        v57 = 0;
      }
      v59 = (NSDate *)v116;
      if ((-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet") & 1) != 0)
        goto LABEL_57;
      v60 = 0;
LABEL_56:

      v69 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v60);
      v116 = v60;
LABEL_57:
      v70 = _MCLogObjects[0];
      v110 = v57;
      if ((_DWORD)v55)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v123) = v55;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Failed to set new passcode with recovery passcode. Result: %d", buf, 8u);
        }
        v71 = MCPasscodeErrorDomain;
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v55));
        v73 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_P_CODE"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v71, 5014, v74, MCErrorTypeFatal, v72, 0));

        goto LABEL_96;
      }
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Passcode has been changed.", buf, 2u);
      }
      v118 = 0;
      v75 = -[MCPasscodeManagerWriter unlockDeviceWithPasscode:outError:](self, "unlockDeviceWithPasscode:outError:", v13, &v118);
      v76 = v118;
      v72 = v76;
      if ((v75 & 1) == 0)
      {
        v78 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v123 = v72;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Failed to unlock device with new passcode. Error: %{public}@", buf, 0xCu);
        }
        goto LABEL_95;
      }
      if (v76)
      {
LABEL_95:
        v25 = 0;
LABEL_96:
        v30 = v112;
        v16 = v113;

LABEL_15:
        if (!a7)
          goto LABEL_18;
        goto LABEL_16;
      }
      if ((+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
      {
        v77 = objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"));
        if (v77)
        {
          v72 = (void *)v77;
          goto LABEL_95;
        }
      }
      v117 = 0;
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v117));
      v80 = v117;
      if (v80)
      {
        v72 = v80;
        v81 = v79;
        v82 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v123 = v72;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "Failed to retrieve private passcode data. Error: %{public}@", buf, 0xCu);
        }
        v79 = v81;
        goto LABEL_94;
      }
      if ((+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"));
        if (v72)
        {
LABEL_94:

          goto LABEL_95;
        }
      }
      v96 = v79;
      v83 = objc_msgSend(v79, "MCMutableDeepCopy");
      v84 = v83;
      if (v83)
        v85 = (NSMutableDictionary *)v83;
      else
        v85 = objc_opt_new(NSMutableDictionary);
      v86 = v85;

      v98 = v86;
      if (v111)
      {
        v87 = v106;
        if (v105)
        {
          if (v110)
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "stringValue"));
            v120 = v88;
            v121 = v104;
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v89, kMCPrivatePasscodeCharacteristicsKey);

            v87 = v106;
            v86 = v98;
          }
          goto LABEL_87;
        }
        v90 = kMCPrivatePasscodeCharacteristicsKey;
        v91 = v86;
        v92 = v104;
      }
      else
      {
        v87 = v106;
        if ((-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet") & 1) != 0)
          goto LABEL_88;
        v90 = kMCPrivatePasscodeCharacteristicsKey;
        v91 = v86;
        v92 = 0;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v92, v90);
LABEL_87:
      -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v86);
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      objc_msgSend(v93, "clearAllPasscodeComplianceCaches");

LABEL_88:
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:](self, "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:", v87, v107, v110, v116, v111 != 0));
      if (v72)
      {
        v94 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v123 = v72;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Failed to process passcode change. Error: %{public}@", buf, 0xCu);
        }
      }
      BYTE1(v95) = v9;
      LOBYTE(v95) = 0;
      +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 1, 1, v111 == 0, v101, v119, 1, v95, v14);
      if (v100)
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 1);

      v79 = v96;
      goto LABEL_94;
    }
    v26 = MCPasscodeErrorDomain;
    v27 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_MODIFY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 5014, v23, MCErrorTypeFatal, 0));
  }
  else
  {
    v21 = MCPasscodeErrorDomain;
    v22 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_SET_PASSCODE_WITH_RECOVERY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v21, 5014, v23, v24, MCErrorTypeFatal));

  }
  if (!a7)
    goto LABEL_18;
LABEL_16:
  if (v25)
    *a7 = objc_retainAutorelease(v25);
LABEL_18:

  return v25 == 0;
}

- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  int v36;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = MCKeybagMementoBlobExists();
  v14 = MKBKeyBagChangeSystemSecretWithEscrow(v12, v11, 0, 1, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v16 = 0;
  if ((-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet") & 1) == 0)
  {
    v34 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v34));
    v16 = v34;
    v18 = objc_msgSend(v17, "MCMutableDeepCopy");
    v19 = v18;
    if (v18)
      v20 = (NSMutableDictionary *)v18;
    else
      v20 = objc_opt_new(NSMutableDictionary);
    v21 = v20;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", 0, kMCPrivatePasscodeCharacteristicsKey);
    v22 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", 0);
    -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v21);
    objc_msgSend(v15, "clearAllPasscodeComplianceCaches");

  }
  v23 = _MCLogObjects[0];
  if ((_DWORD)v14)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to clear passcode. Result: %d", buf, 8u);
    }
    v24 = MCPasscodeErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    v26 = MCErrorArray(CFSTR("PASSCODE_ERROR_CANNOT_CLEAR_PASSCODE_P_CODE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 5013, v27, MCErrorTypeFatal, v25, 0));

    v16 = (id)v28;
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Passcode cleared.", buf, 2u);
    }
    objc_msgSend(v15, "recomputeEffectiveUserSettingsPasscode:", 0);
    objc_msgSend(v15, "recomputeNagMetadata");
    objc_msgSend(v15, "notifyClientsToRecomputeCompliance");
    v29 = -[MCPasscodeManagerWriter performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_sendPasscodeChangedNotification", 0, 0);
    v31 = MCKeybagMementoSupported(v29, v30);
    LOWORD(v33) = -[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](self, "isPasscodeRecoveryRestricted");
    +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:](MCPasscodeAnalytics, "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:", 2, 1, 1, 2, 0xFFFFFFFFLL, v31, v33, v10);
    if (v13)
      +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 2);
  }

  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);

  return v16 == 0;
}

+ (BOOL)didPasscodePolicyChangeWithOldRestrictions:(id)a3 newRestrictions:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = a4;
  if ((+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureSimplePasscodeAllowed, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeRequired, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureAlphanumericPasscodeRequired, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager,
                        "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",
                        MCFeatureMinimumPasscodeLength,
                        v5,
                        v6) & 1) != 0
    || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeHistoryCount, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureMaximumFailedPasscodeAttempts, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeMinimumComplexChars, v5, v6) & 1) != 0|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager,
                        "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",
                        MCFeatureMaximumPasscodeAgeDays,
                        v5,
                        v6) & 1) != 0
    || (v7 = +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:", v5), v7 != +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:", v6))|| (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeatureAutoLockTime, v5, v6) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = +[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:](MCRestrictionManager, "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:", MCFeaturePasscodeLockGraceTime, v5, v6);
  }

  return v8;
}

+ (void)setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:(int)a3 simplePasscodeType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v7 = objc_msgSend(v6, "userMode");

  if (v7 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    if (objc_msgSend(v8, "isSharedIPad"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
      objc_msgSend(v9, "refetchUser");
      v10 = objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v10, "setPasscodeType:", +[UMUser mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:](UMUser, "mc_userPasscodeTypeWithUnlockScreenType:simplePasscodeType:", v5, v4));
      v13 = 0;
      objc_msgSend(v10, "commitChangesWithError:", &v13);
      v11 = v13;
      if (v11)
      {
        v12 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to update user with error %{public}@.", buf, 0xCu);
        }
      }

    }
  }
}

- (void)resetPasscodeMetadata
{
  -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", 0);
}

- (void)updatePasscodeHistoryWithOldPasscode:(id)a3 oldPasscodeData:(id)a4 newPrivateDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  NSObject *v16;
  NSMutableArray *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  NSObject *v31;
  uint64_t v32;
  uint8_t buf[8];
  _QWORD v34[4];
  _QWORD v35[4];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForFeature:", MCFeaturePasscodeHistoryCount));

  if (objc_msgSend(v11, "unsignedIntValue"))
  {
    if (objc_msgSend(v8, "length"))
    {
      v32 = kMCPrivatePasscodeHistoryKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:"));
      v13 = objc_msgSend(v12, "mutableCopy");
      v14 = v13;
      if (v13)
        v15 = (NSMutableArray *)v13;
      else
        v15 = objc_opt_new(NSMutableArray);
      v17 = v15;

      v18 = CCCalibratePBKDF(2u, (size_t)objc_msgSend(v8, "length"), 4uLL, 3u, 0x20uLL, 0x64u);
      v19 = kMCPrivatePasscodeHistoryMaxIterationsKey;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCPrivatePasscodeHistoryMaxIterationsKey));
      v21 = objc_msgSend(v20, "unsignedIntValue");

      if (v18 <= v21)
        v22 = v21;
      else
        v22 = v18;
      if (v22 <= 0x2710)
        v23 = 10000;
      else
        v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v23));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, v19);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter generateSalt](MCPasscodeManagerWriter, "generateSalt"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter hashForPasscode:usingMethod:salt:customIterations:](MCPasscodeManagerWriter, "hashForPasscode:usingMethod:salt:customIterations:", v7, 3, v25, v23));
      v34[0] = kMCPrivatePasscodeHistoryHashKey;
      v34[1] = kMCPrivatePasscodeHistorySaltKey;
      v35[0] = v26;
      v35[1] = v25;
      v35[2] = &off_1000ED280;
      v34[2] = kMCPrivatePasscodeHistoryHashMethodKey;
      v34[3] = kMCPrivatePasscodeHistoryIterationsKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v23));
      v35[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4));

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v17, "firstObject"));
      v30 = objc_msgSend(v29, "isEqualToDictionary:", v28);

      if ((v30 & 1) == 0)
        -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v28, 0);
      if ((unint64_t)-[NSMutableArray count](v17, "count") >= 0x65)
        -[NSMutableArray removeObjectsInRange:](v17, "removeObjectsInRange:", 100, (char *)-[NSMutableArray count](v17, "count") - 100);
      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Old passcode added to history", buf, 2u);
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v32);

    }
  }
  else
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Passcode history removed", buf, 2u);
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, kMCPrivatePasscodeHistoryKey);
  }

}

- (void)clearPasscodeHistory
{
  void *v3;
  id v4;
  id v5;
  os_log_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableDictionary *v15;
  os_log_t v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  if ((+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"));
    if (v3)
    {
LABEL_5:
      v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v3;
        v7 = "Unable to clear passcode history. Error: %{public}@";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v19));
  v4 = v19;
  if (v4)
  {
    v5 = v4;

    v3 = v5;
    goto LABEL_5;
  }
  v11 = kMCPrivatePasscodeHistoryKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMCPrivatePasscodeHistoryKey));

  if (!v12)
  {
    v16 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v7 = "Passcode history already cleared";
    v8 = v16;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 2;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v3, "MCMutableDeepCopy");
  v14 = v13;
  if (v13)
    v15 = (NSMutableDictionary *)v13;
  else
    v15 = objc_opt_new(NSMutableDictionary);
  v17 = v15;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0, v11);
  -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v17);
  v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Passcode history cleared", buf, 2u);
  }

LABEL_17:
}

- (id)clearRecoveryPasscode
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;

  v8 = 0;
  -[MCPasscodeManagerWriter clearRecoveryPasscodeOpaqueDataWithOutError:](self, "clearRecoveryPasscodeOpaqueDataWithOutError:", &v8);
  v2 = v8;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = MCKeybagClearMementoBlob();
    v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = v4;

  return v6;
}

- (BOOL)clearRecoveryPasscodeOpaqueDataWithOutError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
  if (v5)
  {
    v6 = MCKeybagMementoPasscodeGeneration();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _filterPublicPasscodeDict:forGeneration:](self, "_filterPublicPasscodeDict:forGeneration:", v5, v7));
      if (v8)
      {
        v9 = objc_msgSend(v5, "MCMutableDeepCopy");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v9));
        v12 = v11;
        v13 = v11 == 0;
        if (a3 && v11)
          *a3 = objc_retainAutorelease(v11);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)processPasscodeChangeWithOldPascodeGeneration:(id)a3 oldPublicDict:(id)a4 newPasscodeGeneration:(id)a5 newPublicDict:(id)a6 newPasscodeWasSet:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  int HasSEP;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v43;
  uint64_t v44;
  MCPasscodeManagerWriter *v45;
  void *v46;
  _QWORD block[5];

  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  objc_msgSend(v15, "recomputeNagMetadata");
  objc_msgSend(v15, "notifyClientsToRecomputeCompliance");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086578;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v45 = self;
  if (objc_msgSend(v16, "userMode") == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v18 = objc_msgSend(v17, "isSharedIPad");

  }
  else
  {
    v18 = 0;
  }

  HasSEP = MCGestaltHasSEP(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
  v46 = v11;
  if (!HasSEP || v18)
  {
    v38 = kMCPublicPasscodeKeyboardTypeKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCPublicPasscodeKeyboardTypeKey));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v38));
    v39 = kMCPublicPasscodeSimpleTypeKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMCPublicPasscodeSimpleTypeKey));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v39));
    if (v18)
      +[MCPasscodeManagerWriter setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:](MCPasscodeManagerWriter, "setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:", -[MCPasscodeManagerWriter unlockScreenTypeWithPublicPasscodeDict:isRecovery:](v45, "unlockScreenTypeWithPublicPasscodeDict:isRecovery:", v12, 0, v43), -[MCPasscodeManagerWriter unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:](v45, "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:", v12, 0));
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v21));
    v24 = kMCPublicPasscodeKeyboardTypeKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", kMCPublicPasscodeKeyboardTypeKey));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v22));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v24));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v21));
    v28 = kMCPublicPasscodeSimpleTypeKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", kMCPublicPasscodeSimpleTypeKey));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v22));
    v31 = v12;
    v32 = v22;
    v33 = v15;
    v34 = v21;
    v35 = v30;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v28));

    v21 = v34;
    v15 = v33;
    v22 = v32;
    v12 = v31;
    v37 = (void *)v44;
  }
  if (!v25
    || (v40 = objc_msgSend(v25, "intValue"), v40 != objc_msgSend(v37, "intValue"))
    || !v29
    || (v41 = objc_msgSend(v29, "intValue"), v41 != objc_msgSend(v36, "intValue")))
  {
    MCSendUnlockScreenTypeDidChangeNotification();
  }

  return 0;
}

- (void)migratePasscodeMetadata
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;

  if (-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet"))
  {
    v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating passcode metadata...", buf, 2u);
    }
    if ((+[MCPasscodeManager isDeviceUnlocked](MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](MCPasscodeManager, "deviceLockedError"));
      if (v4)
        goto LABEL_28;
    }
    v22 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:](self, "_privatePasscodeDictWithOutError:", &v22));
    v4 = v22;
    if (!v4 && v5)
    {
      v6 = kMCPrivatePasscodeCharacteristicsKey;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kMCPrivatePasscodeCharacteristicsKey));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
        if (v8)
        {
          v9 = MCKeybagCurrentPasscodeGeneration();
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          v11 = v10;
          if (v10)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v12));

            if (v13)
              goto LABEL_12;
            v19 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Migrating public data...", buf, 2u);
            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:](self, "_fixUpPublicPasscodeDict:", v8));
            v4 = (id)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v20));

            if (!v4)
            {
LABEL_12:
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));

              if (!v14)
              {
                v15 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrating private data...", buf, 2u);
                }
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPasscodeCharacteristics:](self, "_fixUpPasscodeCharacteristics:", v7));
                v17 = objc_msgSend(v5, "MCMutableDeepCopy");
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);
                -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
                objc_msgSend(v18, "clearAllPasscodeComplianceCaches");
                objc_msgSend(v18, "recomputeNagMetadata");

              }
              v4 = 0;
            }

          }
          else
          {
            v4 = 0;
          }

        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
    if (v4)
    {
LABEL_28:
      v21 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to migrate passcode metadata. Error: %{public}@", buf, 0xCu);
      }

    }
  }
}

@end
