@implementation MCDailyAnalyticsHelper

+ (void)addCloudConfigInfoWithEventPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isSupervised")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isSupervised"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isTeslaEnrolled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDEP"));

}

+ (void)addMDMConfigInfoWithEventPayload:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memberQueueManagingProfileIdentifier"));
  v6 = v5 != 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, CFSTR("isMDMEnrolled"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isUserEnrollment")));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("isUserEnrollment"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9 != 0));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("isDataSeparated"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentMode"));
  v12 = objc_msgSend(v11, "isEqualToString:", kMDMEnrollmentModeBYOD);
  if ((v12 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentMode"));
    v13 = (uint64_t)objc_msgSend(v3, "isEqualToString:", kMDMEnrollmentModeADDE);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("isAccountDrivenEnrollment"));

  if ((v12 & 1) == 0)
}

+ (void)addSharediPadInfoWithEventPayload:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isSharediPad"));

}

+ (void)addProfileAndPayloadInfoWithEventPayload:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  unsigned int v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v33 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v34 = objc_alloc_init((Class)MCProfileTrustEvaluator);
  v5 = objc_alloc((Class)NSSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", 2));
  v37 = objc_msgSend(v5, "initWithArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _payloadCountDictionary](MCDailyAnalyticsHelper, "_payloadCountDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allPayloadCountKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getCounterDictionaryFromKeySet:", v8));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v39 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allInstalledProfileIdentifiers"));
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v10 = 0;
  if (v40)
  {
    v36 = 0;
    v11 = 0;
    v12 = 0;
    v38 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "installedProfileWithIdentifier:", v14));
        if (v15)
        {
          v46 = v11;
          v47 = v10;
          v45 = v12;
          v44 = i;
          v42 = objc_msgSend(v37, "containsObject:", v14);
          if (objc_msgSend(v15, "isSigned"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "signerCertificates"));
            v17 = objc_msgSend(v34, "sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:", v16);

            v36 += v17;
          }
          v41 = objc_msgSend(v15, "isEncrypted");
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v43 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "payloads"));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(_QWORD *)v49 != v21)
                  objc_enumerationMutation(v18);
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1)
                                                                                   + 8 * (_QWORD)j), "type"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v23));

                if (v24)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));

                  if (v25)
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));
                    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v26, "unsignedIntValue") + 1));
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, v24);

                  }
                }

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v20);
          }
          v12 = (v45 + 1);
          v11 = v46 + v42;
          v10 = v47 + v41;

          v15 = v43;
          i = v44;
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v40);
  }
  else
  {
    v36 = 0;
    v11 = 0;
    v12 = 0;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v28, CFSTR("profile_count"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v29, CFSTR("profile_count_carrier"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, CFSTR("profile_count_encrypted"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v36));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, CFSTR("profile_count_signed"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v36));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("profile_count_signedByApple"));

  objc_msgSend(v33, "addEntriesFromDictionary:", v9);
}

+ (void)addRestrictionInfoWithEventPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "combinedProfileRestrictions"));

  v20 = (id)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _falseRestrictionsDictionary](MCDailyAnalyticsHelper, "_falseRestrictionsDictionary"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000408AC;
  v33[3] = &unk_1000E39E0;
  v6 = v5;
  v34 = v6;
  v7 = v3;
  v35 = v7;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _trueRestrictionsDictionary](MCDailyAnalyticsHelper, "_trueRestrictionsDictionary"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10004092C;
  v30[3] = &unk_1000E39E0;
  v9 = v6;
  v31 = v9;
  v10 = v7;
  v32 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _objectRestrictionsDictionary](MCDailyAnalyticsHelper, "_objectRestrictionsDictionary"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000409AC;
  v27[3] = &unk_1000E39E0;
  v12 = v9;
  v28 = v12;
  v13 = v10;
  v29 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _intersectionRestrictionsDictionary](MCDailyAnalyticsHelper, "_intersectionRestrictionsDictionary"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100040A40;
  v24[3] = &unk_1000E39E0;
  v15 = v12;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _valueRestrictionsDictionary](MCDailyAnalyticsHelper, "_valueRestrictionsDictionary"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100040AD4;
  v21[3] = &unk_1000E39E0;
  v22 = v15;
  v23 = v16;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v21);

}

+ (void)addSettingsInfoWithEventPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  uint64_t v19;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userSettings"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _falseSettingsDictionary](MCDailyAnalyticsHelper, "_falseSettingsDictionary"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _allFalseSettingsKeys](MCDailyAnalyticsHelper, "_allFalseSettingsKeys"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v10));
        if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v11, v5) == 2)v12 = &__kCFBooleanTrue;
        else
          v12 = &__kCFBooleanFalse;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _trueSettingsDictionary](MCDailyAnalyticsHelper, "_trueSettingsDictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCDailyAnalyticsHelper _allTrueSettingsKeys](MCDailyAnalyticsHelper, "_allTrueSettingsKeys"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v19));
        if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v20, v5) == 1)v21 = &__kCFBooleanTrue;
        else
          v21 = &__kCFBooleanFalse;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

}

+ (void)addPasscodeInfoWithEventPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  void *v13;
  id v14;

  v3 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v14, "isPasscodeSet")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("passcode_hasPasscode"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRestrictions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MCPasscodeManager restrictionsEnforcePasscodePolicy:](MCPasscodeManager, "restrictionsEnforcePasscodePolicy:", v6)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("passcode_hasPasscodePolicy"));

  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", MCKeybagMementoBlobExists());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("passcode_hasRecoveryPasscode"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "currentUnlockScreenType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("passcode_unlockScreenType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "currentUnlockSimplePasscodeType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("passcode_simpleType"));

  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", MCKeybagMementoSupported());
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("passcode_supportsPasscodeRecovery"));

}

+ (id)_allPayloadCountKeys
{
  if (qword_1000FD850 != -1)
    dispatch_once(&qword_1000FD850, &stru_1000E3A00);
  return (id)qword_1000FD848;
}

+ (id)_payloadCountDictionary
{
  if (qword_1000FD860 != -1)
    dispatch_once(&qword_1000FD860, &stru_1000E3A20);
  return (id)qword_1000FD858;
}

+ (id)_falseRestrictionsDictionary
{
  if (qword_1000FD870 != -1)
    dispatch_once(&qword_1000FD870, &stru_1000E3A40);
  return (id)qword_1000FD868;
}

+ (id)_trueRestrictionsDictionary
{
  if (qword_1000FD880 != -1)
    dispatch_once(&qword_1000FD880, &stru_1000E3A60);
  return (id)qword_1000FD878;
}

+ (id)_objectRestrictionsDictionary
{
  if (qword_1000FD890 != -1)
    dispatch_once(&qword_1000FD890, &stru_1000E3A80);
  return (id)qword_1000FD888;
}

+ (id)_intersectionRestrictionsDictionary
{
  if (qword_1000FD8A0 != -1)
    dispatch_once(&qword_1000FD8A0, &stru_1000E3AA0);
  return (id)qword_1000FD898;
}

+ (id)_valueRestrictionsDictionary
{
  if (qword_1000FD8B0 != -1)
    dispatch_once(&qword_1000FD8B0, &stru_1000E3AC0);
  return (id)qword_1000FD8A8;
}

+ (id)_allFalseSettingsKeys
{
  if (qword_1000FD8C0 != -1)
    dispatch_once(&qword_1000FD8C0, &stru_1000E3AE0);
  return (id)qword_1000FD8B8;
}

+ (id)_falseSettingsDictionary
{
  if (qword_1000FD8D0 != -1)
    dispatch_once(&qword_1000FD8D0, &stru_1000E3B00);
  return (id)qword_1000FD8C8;
}

+ (id)_allTrueSettingsKeys
{
  if (qword_1000FD8E0 != -1)
    dispatch_once(&qword_1000FD8E0, &stru_1000E3B20);
  return (id)qword_1000FD8D8;
}

+ (id)_trueSettingsDictionary
{
  if (qword_1000FD8F0 != -1)
    dispatch_once(&qword_1000FD8F0, &stru_1000E3B40);
  return (id)qword_1000FD8E8;
}

+ (id)_getCounterDictionaryFromKeySet:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1000ED190, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

@end
