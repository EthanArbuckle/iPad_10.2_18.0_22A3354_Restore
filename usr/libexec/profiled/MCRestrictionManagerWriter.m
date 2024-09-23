@implementation MCRestrictionManagerWriter

- (void)setSenderPID:(int)a3
{
  self->_senderPID = a3;
}

+ (id)sharedManager
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCRestrictionManagerWriter;
  v2 = objc_msgSendSuper2(&v4, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)memberQueueSetParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  NSMutableDictionary *v33;
  BOOL v34;
  id v36;

  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (v12)
  {
    v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemUserSettings](self, "memberQueueSystemUserSettings"));
    if (v16)
    {
      v36 = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemNamespacedUserSettings](self, "memberQueueSystemNamespacedUserSettings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v16));
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = objc_opt_new(NSMutableDictionary);
      v26 = v24;

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:](self, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:", v36, v26));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v25, 1, v16, v19);
      v20 = v26;
      v15 = v36;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:](self, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:", v15, v20));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v25, 0, 0, v19);
    }

  }
  if (v11)
  {
    v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserUserSettings](self, "memberQueueUserUserSettings"));
    if (v16)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserNamespacedUserSettings](self, "memberQueueUserNamespacedUserSettings"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v16));
      v30 = v29;
      if (v29)
        v31 = v29;
      else
        v31 = objc_opt_new(NSMutableDictionary);
      v33 = v31;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:](self, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:", v15, v33));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v32, 3, v16, v19);
      v27 = v33;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter _memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:](self, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:", v15, v27));
      -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v32, 2, 0, v19);
    }

  }
  -[MCRestrictionManagerWriter memberQueueCommitUserSettingsToDisk](self, "memberQueueCommitUserSettingsToDisk");
  v34 = -[MCRestrictionManagerWriter memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:](self, "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", v17, v18);

  return v34;
}

- (id)_memberQueueNewUserSettingsWithParametersForSettingsByType:(id)a3 currentUserSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v6 = a4;
  v7 = objc_msgSend(a3, "MCMutableDeepCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  objc_msgSend(v8, "_applyImpliedSettingsToSettingsDictionary:currentSettings:restrictions:", v7, v6, v9);

  v36 = v6;
  v10 = objc_msgSend(v6, "MCMutableDeepCopy");
  objc_msgSend(v10, "MCDeepCopyEntriesFromDictionary:", v7);
  v11 = MCIntersectionKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", MCIntersectionKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v18));
        v20 = objc_msgSend(v19, "mutableCopy");
        v21 = objc_msgSend(v18, "copy");
        objc_msgSend(v12, "setObject:forKey:", v20, v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v15);
  }
  v22 = MCUnionKey;
  v34 = v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", MCUnionKey));
  v35 = v7;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v22));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v29));
        v31 = objc_msgSend(v30, "mutableCopy");
        v32 = objc_msgSend(v29, "copy");
        objc_msgSend(v23, "setObject:forKey:", v31, v32);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v26);
  }

  return v34;
}

- (BOOL)memberQueueRecomputeEffectiveUserSettingsPasscode:(id)a3 credentialSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL8 v39;
  uint64_t v40;
  void *v41;
  _BOOL8 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  _BOOL4 v61;
  _BOOL4 v62;
  unsigned __int8 v63;
  id v64;
  char v65;
  uint8_t buf[8];
  _QWORD v67[4];
  _QWORD v68[4];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemUserSettings](self, "memberQueueSystemUserSettings"));
  v9 = objc_msgSend(v8, "MCMutableDeepCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserUserSettings](self, "memberQueueUserUserSettings"));
  objc_msgSend(v9, "MCDeepCopyEntriesFromDictionary:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v12 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:toSettings:](MCRestrictionManager, "newEffectiveSettingsByApplyingRestrictions:toSettings:", v11, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v13, "_applyHeuristicsToEffectiveUserSettings:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v14, "_applyMandatorySettingsToEffectiveUserSettings:", v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v16 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:restrictionsDictionary:](MCRestrictionManager, "appWhitelistStateWithSettingsDictionary:restrictionsDictionary:", v12, v15);

  if (v16 <= 5 && ((1 << v16) & 0x34) != 0)
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Applying additional restrictions because we are enforcing shared app whitelist behavior.", buf, 2u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter enforcedAppWhitelistRestrictions](MCRestrictionManagerWriter, "enforcedAppWhitelistRestrictions"));
    v19 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:toSettings:](MCRestrictionManager, "newEffectiveSettingsByApplyingRestrictions:toSettings:", v18, v12);

    v12 = v19;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
  objc_msgSend(v20, "applyEffectiveSettings:toOtherSubsystemsPasscode:credentialSet:", v12, v7, v6);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
  v22 = objc_msgSend(v21, "isEqualToDictionary:", v12);

  if ((v22 & 1) == 0)
  {
    v63 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v24 = objc_msgSend(v23, "copy");

    -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v12, 4, 0, CFSTR("MCRestrictionManagerWriter.RecomputeEffectiveUserSettings"));
    -[MCRestrictionManagerWriter memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:](self, "memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:", v24);
    if ((+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockBundleIDs, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockMultipleAppsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockAccessWithoutPasscodeAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
                          "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                          MCFeatureAppLockGrantSupervisorAccessForced,
                          v24,
                          v12) & 1) != 0
      || +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockLogoutAllowed, v24, v12))
    {
      buf[0] = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
      objc_msgSend(v25, "recomputeAppOptionsEffectiveUserSettings:outEffectiveChangeDetected:", v26, buf);

      if (buf[0])
      {
        MCSendAppWhitelistChangedNotification();
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
        objc_msgSend(v27, "retryNotNowResponse");

      }
    }
    v64 = v9;
    v28 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v24);
    v29 = v28 ^ +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:](MCRestrictionManager, "isWebContentFilterUIActiveWithRestrictionDictionary:", v12);
    if ((v29 & 1) != 0
      || (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterAutoPermittedURLs, v24, v12) & 1) != 0|| (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterWhitelistedURLs, v24, v12) & 1) != 0|| (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterBlacklistedURLs, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
                         "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                         MCFeatureWebContentFilterAutoForced,
                         v24,
                         v12))
    {
      buf[0] = 0;
      v65 = 0;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](MCServerSideHacks, "sharedHacks"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
      objc_msgSend(v30, "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:", v31, buf, &v65);

      if (v65)
        v32 = MCSendWebContentFilterTypeChangedNotification();
      if (buf[0])
        v32 = MCSendWebContentFilterChangedNotification(v32);
      if (v29)
        MCSendWebContentFilterUIActiveChangedNotification(v32);
    }
    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeaturePredictiveKeyboardAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureKeyboardShortcutsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureSpellCheckAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
                          "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                          MCFeatureAutoCorrectionAllowed,
                          v24,
                          v12) & 1) != 0
      || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureSmartPunctuationAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureDictationAllowed, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureContinuousPathKeyboardAllowed, v24, v12))
    {
      MCSendKeyboardSettingsChangedNotification();
    }
    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureNewsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureNewsTodayAllowed, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureSpotlightNewsAllowed, v24, v12))
    {
      MCSendNewsSettingsChangedNotification();
    }
    if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeaturePasscodeModificationAllowed, v24, v12))MCSendAllowPasscodeModificationChangedNotification();
    if (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureRemovedSystemAppBundleIDs, v24, v12))MCSendRemovedSystemAppsChangedNotification();
    if (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureHealthDataSubmissionAllowed, v24, v12))MCSendAllowHealthDataSubmissionChangedNotification();
    v33 = MCFeatureBookstoreEroticaAllowed;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v62 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v33, v34) != 2;

    v35 = MCFeatureExplicitContentAllowed;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v61 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v35, v36) != 2;

    v37 = MCFeatureSpellCheckAllowed;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v39 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v37, v38) != 2;

    v40 = MCFeatureAutoCorrectionAllowed;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v42 = +[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", v40, v41) != 2;

    v43 = MCFeatureMaximumAppsRating;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v43, v44));

    v46 = MCFeatureMaximumMoviesRating;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v46, v47));

    v49 = MCFeatureMaximumTVShowsRating;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "valueSettingForFeature:withUserSettingDictionary:", v49, v50));

    v67[0] = MCExplicitBooksAllowedThirdPartyQuery;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v62));
    v68[0] = v52;
    v67[1] = MCExplicitMusicPodcastsAllowedThirdPartyQuery;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v61));
    v68[1] = v53;
    v67[2] = MCSpellCheckAllowedThirdPartyQuery;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v39));
    v68[2] = v54;
    v67[3] = MCAutoCorrectionAllowedThirdPartyQuery;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v42));
    v68[3] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 4));

    v57 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v56);
    v58 = objc_alloc_init((Class)NSMutableArray);
    v59 = v58;
    if (v45)
      objc_msgSend(v57, "setObject:forKey:", v45, MCMaximumAppsRatingThirdPartyQuery);
    else
      objc_msgSend(v58, "addObject:", MCMaximumAppsRatingThirdPartyQuery);
    if (v48)
      objc_msgSend(v57, "setObject:forKey:", v48, MCMaximumMoviesRatingThirdPartyQuery);
    else
      objc_msgSend(v59, "addObject:", MCMaximumMoviesRatingThirdPartyQuery);
    if (v51)
      objc_msgSend(v57, "setObject:forKey:", v51, MCMaximumTVShowsRatingThirdPartyQuery);
    else
      objc_msgSend(v59, "addObject:", MCMaximumTVShowsRatingThirdPartyQuery);
    +[MCManagedPreferencesManager updateGlobalManagedPreferencesByAddingPreferences:removingPreferences:](MCManagedPreferencesManager, "updateGlobalManagedPreferencesByAddingPreferences:removingPreferences:", v57, v59);

    v9 = v64;
    v22 = v63;
  }

  return v22 ^ 1;
}

- (BOOL)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v20 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100006FF4;
  v28[3] = &unk_1000E41C8;
  v33 = v19;
  v34 = &v37;
  v28[4] = self;
  v29 = v15;
  v35 = a5;
  v36 = a6;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v28);
  dispatch_sync(v20, v26);

  LOBYTE(v20) = *((_BYTE *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  return (char)v20;
}

- (void)memberQueueCommitUserSettingsToDisk
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing user settings.", v19, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemUserSettings](self, "memberQueueSystemUserSettings"));
  v5 = MCSystemUserSettingsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "MCWriteToBinaryFile:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemNamespacedUserSettings](self, "memberQueueSystemNamespacedUserSettings"));
  v8 = MCSystemNamespacedUserSettingsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "MCWriteToBinaryFile:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserUserSettings](self, "memberQueueUserUserSettings"));
  v11 = MCUserUserSettingsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "MCWriteToBinaryFile:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserNamespacedUserSettings](self, "memberQueueUserNamespacedUserSettings"));
  v14 = MCUserNamespacedUserSettingsFilePath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "MCWriteToBinaryFile:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  v17 = MCSettingsEventsFilePath();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "MCWriteToBinaryFile:", v18);

  MCSendSettingsChangedNotification();
}

+ (id)enforcedAppWhitelistRestrictions
{
  if (qword_1000FD978 != -1)
    dispatch_once(&qword_1000FD978, &stru_1000E40E0);
  return (id)qword_1000FD970;
}

- (id)_init
{
  MCRestrictionManagerWriter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCRestrictionManagerWriter;
  v2 = -[MCRestrictionManagerWriter init](&v4, "init");
  if (v2)
    v2->_senderPID = getpid();
  return v2;
}

- (void)memberQueueCommitRestrictionsToDisk
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing restrictions.", v10, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v5 = MCRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "MCWriteToBinaryFile:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  v8 = MCSettingsEventsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "MCWriteToBinaryFile:", v9);

}

- (BOOL)setSystemProfileRestrictions:(id)a3 userProfileRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outAppWhitelistSettingsChanged:(BOOL *)a8 outRecomputedNag:(BOOL *)a9 outError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  int v24;
  BOOL v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  MCRestrictionManagerWriter *v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  BOOL *v37;
  BOOL *v38;
  BOOL *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100073CF0;
  v44 = sub_100073D00;
  v45 = 0;
  v19 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_100073D08;
  v30 = &unk_1000E4108;
  v31 = self;
  v20 = v16;
  v32 = v20;
  v21 = v17;
  v33 = v21;
  v22 = v18;
  v38 = a6;
  v39 = a7;
  v34 = v22;
  v35 = &v46;
  v36 = &v40;
  v37 = a8;
  dispatch_sync(v19, &v27);

  v23 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata", v27, v28, v29, v30, v31);
  if (a9)
    *a9 = v23;
  v24 = *((unsigned __int8 *)v47 + 24);
  if (a10 && !*((_BYTE *)v47 + 24))
  {
    *a10 = objc_retainAutorelease((id)v41[5]);
    v24 = *((unsigned __int8 *)v47 + 24);
  }
  v25 = v24 != 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

- (void)memberQueueCommitClientRestrictionsToDisk
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing client restrictions.", v13, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemClientRestrictions](self, "memberQueueSystemClientRestrictions"));
  v5 = MCSystemClientRestrictionsFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "MCWriteToBinaryFile:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserClientRestrictions](self, "memberQueueUserClientRestrictions"));
  v8 = MCUserClientRestrictionsFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "MCWriteToBinaryFile:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  v11 = MCSettingsEventsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "MCWriteToBinaryFile:", v12);

}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4
{
  -[MCRestrictionManagerWriter setUserInfo:forClientUUID:sender:](self, "setUserInfo:forClientUUID:sender:", a3, a4, 0);
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Setting user info %{public}@ for client uuid %{public}@", buf, 0x16u);
  }
  if (v9)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000744B8;
    v13[3] = &unk_1000E4130;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v16 = v10;
    dispatch_sync(v12, v13);

  }
}

- (BOOL)memberQueueSetAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outError:(id *)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserClientRestrictions](self, "memberQueueUserClientRestrictions"));
  LOBYTE(a7) = -[MCRestrictionManagerWriter memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:](self, "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:", v13, v14, v12, a5, a6, a7);

  return (char)a7;
}

- (BOOL)memberQueueSetSystemClientRestrictions:(id)a3 userClientRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outError:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id *v36;
  _BOOL4 v37;
  void *v38;
  id v41;
  id v42;
  BOOL v43;

  v42 = a3;
  v12 = a4;
  v13 = a5;
  v43 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v15 = objc_msgSend(v14, "copy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemClientRestrictions](self, "memberQueueSystemClientRestrictions"));
  v41 = objc_msgSend(v16, "copy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter defaultRestrictions](self, "defaultRestrictions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemProfileRestrictions](self, "memberQueueSystemProfileRestrictions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueUserProfileRestrictions](self, "memberQueueUserProfileRestrictions"));
  v36 = a8;
  v21 = v12;
  v22 = v42;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:](MCRestrictionManagerWriter, "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:", v17, v18, v19, v20, v42, v12, &v43, v36));

  if (v23)
  {
    v24 = -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v42, 8, 0, v13);
    v38 = v21;
    v25 = -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v21, 9, 0, v13);
    -[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](self, "applyConfiguration:toDomain:inNamespace:fromSender:", v23, 5, 0, v13);
    -[MCRestrictionManagerWriter memberQueueCommitClientRestrictionsToDisk](self, "memberQueueCommitClientRestrictionsToDisk");
    -[MCRestrictionManagerWriter memberQueueCommitRestrictionsToDisk](self, "memberQueueCommitRestrictionsToDisk");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    v27 = objc_msgSend(v26, "MCDeepCopy");

    v37 = -[MCRestrictionManagerWriter memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:](self, "memberQueueRecomputeEffectiveUserSettingsPasscode:credentialSet:", 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
    objc_msgSend(v28, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:", v15, v23, v27, v29);

    if ((v24 & 1) != 0 || v25)
      v30 = MCSendClientTruthChangedNotification(-[MCRestrictionManagerWriter memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:](self, "memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:", v41, v42));
    if (v43)
    {
      MCSendRestrictionChangedNotification(v30);
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:](MCPasscodeManagerWriter, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:", v15, v23))
      {
        -[MCRestrictionManagerWriter memberQueueClearPasscodeHistoryIfNecessary](self, "memberQueueClearPasscodeHistoryIfNecessary");
        MCSendPasscodePolicyChangedNotification(-[MCRestrictionManagerWriter memberQueueClearRestrictionPasscodeComplianceCache](self, "memberQueueClearRestrictionPasscodeComplianceCache"));
      }
      v31 = MCFeatureNotificationRestrictedApps;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureNotificationRestrictedApps, v15));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", v31, v23));
      v34 = objc_msgSend(v32, "isEqualToArray:", v33);

      if ((v34 & 1) == 0)
        MCSendUserNotificationsSettingsChangedNotification();
    }
    if (a6)
      *a6 = v43;
    v22 = v42;
    if (v37)
      MCSendEffectiveSettingsChangedNotification(self->_senderPID);
    if (a7)
      *a7 = v37;

    v21 = v38;
  }

  return v23 != 0;
}

- (BOOL)setAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outRecomputedNag:(BOOL *)a7 outError:(id *)a8
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  BOOL v19;
  int v20;
  BOOL v21;
  void **v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  MCRestrictionManagerWriter *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  BOOL *v32;
  BOOL *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v14 = a3;
  v15 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_100073CF0;
  v38 = sub_100073D00;
  v39 = 0;
  v16 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_100074B94;
  v26 = &unk_1000E4158;
  v30 = &v40;
  v27 = self;
  v17 = v14;
  v28 = v17;
  v18 = v15;
  v32 = a5;
  v33 = a6;
  v29 = v18;
  v31 = &v34;
  dispatch_sync(v16, &v23);

  v19 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata", v23, v24, v25, v26, v27);
  if (a7)
    *a7 = v19;
  v20 = *((unsigned __int8 *)v41 + 24);
  if (a8 && !*((_BYTE *)v41 + 24))
  {
    *a8 = objc_retainAutorelease((id)v35[5]);
    v20 = *((unsigned __int8 *)v41 + 24);
  }
  v21 = v20 != 0;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v21;
}

- (BOOL)setClientRestrictions:(id)a3 clientType:(id)a4 clientUUID:(id)a5 sender:(id)a6 localizedClientDescription:(id)a7 localizedWarning:(id)a8 outRestrictionsChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outRecomputedNag:(BOOL *)a11 outError:(id *)a12
{
  uint64_t v13;

  LOBYTE(v13) = 1;
  return -[MCRestrictionManagerWriter setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:](self, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", a3, 0, 0, 1, a4, a5, a6, a7, a8, v13, a9, a10, a11, a12);
}

- (BOOL)setClientRestrictions:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 system:(BOOL)a6 clientType:(id)a7 clientUUID:(id)a8 sender:(id)a9 localizedClientDescription:(id)a10 localizedWarning:(id)a11 shouldRecomputeNag:(BOOL)a12 outRestrictionsChanged:(BOOL *)a13 outEffectiveSettingsChanged:(BOOL *)a14 outRecomputedNag:(BOOL *)a15 outError:(id *)a16
{
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_block_t v28;
  BOOL v29;
  int v30;
  BOOL v31;
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  MCRestrictionManagerWriter *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  _BYTE *v46;
  BOOL *v47;
  BOOL *v48;
  BOOL v49;
  BOOL v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v35 = a3;
  v33 = a5;
  v34 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Setting client truth %{public}@ for client %{public}@", buf, 0x16u);
  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = sub_100073CF0;
  v57 = sub_100073D00;
  v58 = 0;
  if (v22)
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074F84;
    block[3] = &unk_1000E4180;
    v49 = a4;
    v37 = v34;
    v38 = self;
    v39 = v22;
    v40 = v35;
    v41 = v24;
    v45 = &v51;
    v50 = a6;
    v42 = v25;
    v43 = v33;
    v47 = a13;
    v48 = a14;
    v44 = v23;
    v46 = buf;
    v28 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    dispatch_sync(v27, v28);

    if (a12)
    {
      v29 = -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata");
      if (a15)
        *a15 = v29;
    }

    v30 = *((unsigned __int8 *)v52 + 24);
  }
  else
  {
    v30 = 0;
  }
  if (a16 && !v30)
  {
    *a16 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v30 = *((unsigned __int8 *)v52 + 24);
  }
  v31 = v30 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v51, 8);
  return v31;
}

- (id)orphanCheckExemptClientTypes
{
  if (qword_1000FD9B0 != -1)
    dispatch_once(&qword_1000FD9B0, &stru_1000E4210);
  return (id)qword_1000FD988;
}

- (id)orphanCheckUnexemptClientTypes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (qword_1000FD9B0 != -1)
    dispatch_once(&qword_1000FD9B0, &stru_1000E4210);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000FD980, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v2));
  v4 = v3;
  if (qword_1000FD988)
    objc_msgSend(v3, "minusSet:");
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (id)_liveClientUUIDsForClientType:(id)a3 outLoaderMissing:(BOOL *)a4
{
  id v5;
  void *Value;
  const void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  id v14;

  v5 = a3;
  if (qword_1000FD9B0 != -1)
    dispatch_once(&qword_1000FD9B0, &stru_1000E4210);
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1000FD990, v5);
  v7 = CFDictionaryGetValue((CFDictionaryRef)qword_1000FD998, v5);
  if (Value)
  {
    v8 = ((uint64_t (*)(void *, const void *, id))objc_msgSend(Value, "methodForSelector:", v7))(Value, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Called plugin to get UUIDs", (uint8_t *)&v13, 2u);
    }
    if (a4)
LABEL_7:
      *a4 = Value == 0;
  }
  else
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No loader was found for client type %{public}@", (uint8_t *)&v13, 0xCu);
    }
    v9 = 0;
    if (a4)
      goto LABEL_7;
  }

  return v9;
}

- (void)notifyClientsToRecomputeCompliance
{
  NSDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  const void *v8;
  void *Value;
  const void *v10;
  BOOL v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (qword_1000FD9B0 != -1)
    dispatch_once(&qword_1000FD9B0, &stru_1000E4210);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_clientTypeLoaders;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(const void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1000FD990, v8);
        v10 = CFDictionaryGetValue((CFDictionaryRef)qword_1000FD9A0, v8);
        if (Value)
          v11 = v10 == 0;
        else
          v11 = 1;
        if (!v11)
        {
          ((void (*)(void *, const void *, const void *))objc_msgSend(Value, "methodForSelector:", v10))(Value, v10, v8);
          v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Called plugin to recompute compliance", v13, 2u);
          }
        }
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (id)orphanedClientUUIDsForClientRestrictionDictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *k;
  uint64_t v37;
  __int128 v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = a3;
  if (qword_1000FD9B0 != -1)
    dispatch_once(&qword_1000FD9B0, &stru_1000E4210);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    v9 = kMCClientRestrictionsType;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9));

        if (v13)
        {
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v13));
          if (!v14)
          {
            v14 = objc_alloc_init((Class)NSMutableSet);
            objc_msgSend(v4, "setObject:forKey:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v7);
  }

  v15 = objc_alloc_init((Class)NSMutableSet);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v47;
    *(_QWORD *)&v18 = 138412290;
    v39 = v18;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend((id)qword_1000FD988, "containsObject:", v22, v39))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
          objc_msgSend(v15, "addObjectsFromArray:", v24);

          continue;
        }
        v45 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter _liveClientUUIDsForClientType:outLoaderMissing:](self, "_liveClientUUIDsForClientType:outLoaderMissing:", v22, &v45));
        v26 = v25;
        if (v45)
        {
          v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Loader for client type %{public}@ missing. All client restrictions will be removed.", buf, 0xCu);
          }
          goto LABEL_31;
        }
        if (v25)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
          objc_msgSend(v15, "addObjectsFromArray:", v28);
LABEL_30:

          goto LABEL_31;
        }
        if (objc_msgSend((id)qword_1000FD9A8, "containsObject:", v22))
        {
          v29 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v39;
            v56 = v22;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Loader for client type %@ didn't return an answer. Preserving its client restrictions.", buf, 0xCu);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));
          objc_msgSend(v15, "addObjectsFromArray:", v30);

          goto LABEL_30;
        }
LABEL_31:

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v19);
  }

  v31 = objc_alloc_init((Class)NSMutableSet);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v5;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v15, "containsObject:", v37) & 1) == 0)
          objc_msgSend(v31, "addObject:", v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v34);
  }

  return v31;
}

- (BOOL)removeOrphanedClientRestrictions
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075DC0;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_sync(v3, block);

  return -[MCRestrictionManagerWriter recomputeNagMetadata](self, "recomputeNagMetadata");
}

- (BOOL)recomputeNagMetadata
{
  return -[MCRestrictionManagerWriter recomputeNagMetadata:](self, "recomputeNagMetadata:", 0);
}

- (BOOL)recomputeNagMetadata:(BOOL *)a3
{
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  _QWORD v9[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v6 = objc_msgSend(v5, "isDeviceLocked");
  if ((v6 & 1) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000760E0;
    v9[3] = &unk_1000E3338;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v7, v9);

  }
  return v6 ^ 1;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithCurrentRestrictions
{
  void *v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithRestrictions](self, "memberQueuePasscodeCompliesWithRestrictions"));

  if (v3)
  {
    v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using cached passcode compliance with restrictions", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithRestrictions](self, "memberQueuePasscodeCompliesWithRestrictions"));
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = 0;
    if ((v6 & 1) != 0)
    {
LABEL_5:
      v8 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
    v16 = 0;
    v11 = objc_msgSend(v9, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v10, &v16);
    v7 = v16;

    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Caching passcode compliance with restrictions", buf, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:](self, "setMemberQueuePasscodeCompliesWithRestrictions:", v13);

    if ((v11 & 1) != 0)
      goto LABEL_5;
  }
  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current passcode does not comply with restrictions. Error: %{public}@", buf, 0xCu);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithProfileRestrictions
{
  void *v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithProfileRestrictions](self, "memberQueuePasscodeCompliesWithProfileRestrictions"));

  if (v3)
  {
    v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using cached passcode compliance with profile restrictions", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueuePasscodeCompliesWithProfileRestrictions](self, "memberQueuePasscodeCompliesWithProfileRestrictions"));
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = 0;
    if ((v6 & 1) != 0)
    {
LABEL_5:
      v8 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueCombinedSystemProfileRestrictions](self, "memberQueueCombinedSystemProfileRestrictions"));
    v16 = 0;
    v11 = objc_msgSend(v9, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v10, &v16);
    v7 = v16;

    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Caching passcode compliance with profile restrictions", buf, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:](self, "setMemberQueuePasscodeCompliesWithProfileRestrictions:", v13);

    if ((v11 & 1) != 0)
      goto LABEL_5;
  }
  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current passcode does not comply with profile restrictions, so making change mandatory. Error: %{public}@", buf, 0xCu);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:(id *)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  void *v32;
  id *v33;
  uint64_t v34;
  MCRestrictionManagerWriter *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  __CFString *v44;
  _BYTE v45[128];

  if (!-[MCRestrictionManagerWriter memberQueueCheckPasscodeCompliesWithProfileRestrictions](self, "memberQueueCheckPasscodeCompliesWithProfileRestrictions"))return 1;
  v33 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = self;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemClientRestrictions](self, "memberQueueSystemClientRestrictions"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    v9 = kMCClientRestrictionsType;
    v10 = kMCClientRestrictionsCompliant;
    v34 = kMCClientRestrictionsTruth;
    v37 = kMCClientRestrictionsLocalizedClientDescription;
    v36 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v12));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v9));
        if (v14)
          v15 = (__CFString *)v14;
        else
          v15 = CFSTR("Unknown");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));
        if (!v16)
        {
          v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v44 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Client restriction passcode compliance for client of type “%{public}@” was not cached when it should be. Recalculating.", buf, 0xCu);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](v35, "memberQueueRecomputePasscodeComplianceForClientUUID"));
          objc_msgSend(v18, "addObject:", v12);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v34));
          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
            v21 = (uint64_t)objc_msgSend(v20, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v19, 0);

            v8 = v36;
          }
          else
          {
            v21 = 1;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21));

        }
        if ((objc_msgSend(v16, "BOOLValue") & 1) == 0)
        {
          v22 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v44 = v15;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Current passcode not compliant with client of type “%{public}@”", buf, 0xCu);
          }
          if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("com.apple.eas.account")))
          {

            v29 = 1;
            v28 = v5;
            v26 = v38;
            goto LABEL_35;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v37));
          if (v23)
          {
            objc_msgSend(v38, "addObject:", v23);
          }
          else
          {
            v24 = MCLocalizedString(CFSTR("NAG_UI_ACCOUNT_UNKNOWN"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            objc_msgSend(v38, "addObject:", v25);

            v8 = v36;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v7)
        continue;
      break;
    }
  }

  v26 = v38;
  if (objc_msgSend(v38, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 0));
    v27 = MCLocalizedFormatByDevice(CFSTR("NAG_UI_ACCOUNT_WARNING"));
    v28 = (id)objc_claimAutoreleasedReturnValue(v27);

  }
  else
  {
    v30 = MCLocalizedStringByDevice(CFSTR("NAG_UI_GENERIC_WARNING"));
    v28 = (id)objc_claimAutoreleasedReturnValue(v30);
  }
  if (v33)
  {
    v28 = objc_retainAutorelease(v28);
    v29 = 0;
    *v33 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_35:

  return v29;
}

- (void)memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:(id)a3 newSystemClientRestrictions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  MCRestrictionManagerWriter *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  __CFString *v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking if we need to clear client restriction passcode compliance caches", buf, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID"));

  if (v9)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v31 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      v36 = kMCClientRestrictionsType;
      v33 = kMCClientRestrictionsCompliant;
      v34 = kMCClientRestrictionsTruth;
      v35 = self;
      v37 = *(_QWORD *)v40;
      v38 = v10;
      v32 = v6;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID", v31));
          v17 = objc_msgSend(v16, "containsObject:", v15);

          if ((v17 & 1) == 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v36));
            if (v19)
              v20 = (__CFString *)v19;
            else
              v20 = CFSTR("Unknown");
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v15));
            v22 = v21;
            if (v21)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v33));
              if (v23)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v34));
                if (v24 || !objc_msgSend(v23, "BOOLValue"))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v34));
                  if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:](MCPasscodeManagerWriter, "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:", v27, v24))
                  {
                    v28 = _MCLogObjects[0];
                    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v44 = v20;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Passcode policy changed for client of type “%{public}@”. Clearing passcode compliance cache.", buf, 0xCu);
                    }
                    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](v35, "memberQueueRecomputePasscodeComplianceForClientUUID"));
                    objc_msgSend(v29, "addObject:", v15);

                    v6 = v32;
                  }

                }
                else
                {
                  v25 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v44 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” has no restrictions and was previously compliant. No need to clear passcode compliance cache.", buf, 0xCu);
                  }
                }
              }
              else
              {
                v30 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v44 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” has no previous cached compliance; marking it to recalculate compliance.",
                    buf,
                    0xCu);
                }
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID"));
                objc_msgSend(v24, "addObject:", v15);
              }

              self = v35;
            }
            else
            {
              v26 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v44 = v20;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” is a new client; marking it to calculate compliance.",
                  buf,
                  0xCu);
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID"));
              objc_msgSend(v23, "addObject:", v15);
            }

            v13 = v37;
            v10 = v38;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v12);
    }

    v7 = v31;
  }

}

- (void)memberQueueCacheClientRestrictionPasscodeCompliance
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  NSMutableSet *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  os_log_t v26;
  void *v27;
  void *v28;
  MCRestrictionManagerWriter *v29;
  void *v30;
  id v31;
  void *v32;
  MCRestrictionManagerWriter *v33;
  uint64_t v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  __CFString *v45;

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSystemClientRestrictions](self, "memberQueueSystemClientRestrictions"));
  v4 = objc_msgSend(v3, "MCMutableDeepCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID"));
  v33 = self;
  if (!v5)
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recomputing passcode compliance for all client restrictions", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", self));
    v9 = objc_opt_new(NSMutableSet);
    -[MCRestrictionManagerWriter setMemberQueueRecomputePasscodeComplianceForClientUUID:](self, "setMemberQueueRecomputePasscodeComplianceForClientUUID:", v9);
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](self, "memberQueueRecomputePasscodeComplianceForClientUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134217984;
    v45 = (__CFString *)objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, &v9->super.super, OS_LOG_TYPE_DEFAULT, "Recomputing passcode compliance for %lu clients", buf, 0xCu);
LABEL_7:

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v11)
    goto LABEL_31;
  v12 = v11;
  v13 = *(_QWORD *)v40;
  v38 = kMCClientRestrictionsType;
  v37 = kMCClientRestrictionsTruth;
  v14 = kMCClientRestrictionsCompliant;
  v34 = kMCClientRestrictionsUserInfo;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(obj);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1)
                                                                                                  + 8 * (_QWORD)i), v33));
      v17 = v16;
      if (v16)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v38));
        if (v18)
          v19 = (__CFString *)v18;
        else
          v19 = CFSTR("Unknown");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v37));
        if (v20)
        {
          v21 = objc_msgSend(v35, "currentPasscodeCompliesWithPolicyFromRestrictions:outError:", v20, 0);
          v22 = _MCLogObjects[0];
          v23 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 138543362;
              v45 = v19;
              v24 = v22;
              v25 = "Passcode complies with client restrictions from client of type “%{public}@”";
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (v23)
          {
            *(_DWORD *)buf = 138543362;
            v45 = v19;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Passcode does not comply with client restrictions from client of type “%{public}@”", buf, 0xCu);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
          objc_msgSend(v17, "setObject:forKey:", v28, v14);

          objc_msgSend(v17, "removeObjectForKey:", v34);
        }
        else
        {
          v26 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v19;
            v24 = v26;
            v25 = "Client of type “%{public}@” has no client restrictions. Marking as compliant.";
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }
LABEL_24:
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
          objc_msgSend(v17, "setObject:forKey:", v27, v14);

        }
      }

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v12);
LABEL_31:

  v29 = v33;
  if (-[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:](v33, "applyConfiguration:toDomain:inNamespace:fromSender:", v4, 8, 0, CFSTR("MCRestrictionManagerWriter.memberQueueCacheClientRestrictionPasscodeCompliance")))MCSendClientTruthChangedNotification(-[MCRestrictionManagerWriter memberQueueCommitClientRestrictionsToDisk](v33, "memberQueueCommitClientRestrictionsToDisk"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](v33, "memberQueueRecomputePasscodeComplianceForClientUUID", v33));
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID](v29, "memberQueueRecomputePasscodeComplianceForClientUUID"));
    objc_msgSend(v32, "removeAllObjects");

  }
}

- (void)memberQueueClearRestrictionPasscodeComplianceCache
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing restriction passcode compliance cache.", v4, 2u);
  }
  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:](self, "setMemberQueuePasscodeCompliesWithRestrictions:", 0);
}

- (void)memberQueueClearProfileRestrictionPasscodeComplianceCache
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing profile restriction passcode compliance cache.", v4, 2u);
  }
  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:](self, "setMemberQueuePasscodeCompliesWithProfileRestrictions:", 0);
}

- (void)memberQueueClearAllPasscodeComplianceCaches
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all passcode compliance caches", v4, 2u);
  }
  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithRestrictions:](self, "setMemberQueuePasscodeCompliesWithRestrictions:", 0);
  -[MCRestrictionManagerWriter setMemberQueuePasscodeCompliesWithProfileRestrictions:](self, "setMemberQueuePasscodeCompliesWithProfileRestrictions:", 0);
  -[MCRestrictionManagerWriter setMemberQueueRecomputePasscodeComplianceForClientUUID:](self, "setMemberQueueRecomputePasscodeComplianceForClientUUID:", 0);
}

- (void)clearAllPasscodeComplianceCaches
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077720;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)memberQueueClearPasscodeHistoryIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", MCRestrictedValueKey));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", MCFeaturePasscodeHistoryCount));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MCRestrictedValueValueKey));

  if (!objc_msgSend(v6, "unsignedIntValue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    objc_msgSend(v5, "clearPasscodeHistory");

  }
}

- (void)setShowNagMessage
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  dispatch_sync(v2, &stru_1000E41A0);

}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077928;
  block[3] = &unk_1000E2C50;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Committing effective user settings.", v20, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
  v7 = MCEffectiveUserSettingsFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "MCWriteToBinaryFile:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter filterUserSettingsForPublicUse:](MCRestrictionManagerWriter, "filterUserSettingsForPublicUse:", v9));

  v11 = MCPublicEffectiveUserSettingsFilePath();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "MCWriteToBinaryFile:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueSettingsEvents](self, "memberQueueSettingsEvents"));
  v14 = MCSettingsEventsFilePath();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "MCWriteToBinaryFile:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueRestrictions](self, "memberQueueRestrictions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueueEffectiveUserSettings](self, "memberQueueEffectiveUserSettings"));
  objc_msgSend(v16, "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:", v17, v18, v4, v19);

  MCSendEffectiveSettingsChangedNotification(self->_senderPID);
}

- (BOOL)setParametersForSettingsByType:(id)a3 sender:(id)a4
{
  return -[MCRestrictionManagerWriter setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:", a3, 0, 1, 0, 0, 0, a4);
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 sender:(id)a5
{
  -[MCRestrictionManagerWriter setBoolValue:ask:forSetting:sender:](self, "setBoolValue:ask:forSetting:sender:", a3, 0, a4, a5);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 sender:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, MCSettingParameterValueKey);

  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, MCSettingParameterAskKey);

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, MCSettingParameterAskKey);
  }
  v18 = v12;
  v19 = MCRestrictedBoolKey;
  v17 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v20 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:](self, "setParametersForSettingsByType:sender:", v16, v11);
}

- (void)setValue:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v18 = MCRestrictedValueKey;
  v15 = a3;
  v16 = a4;
  v14 = MCRestrictedValueValueKey;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:](self, "setParametersForSettingsByType:sender:", v13, v8);
}

- (void)setIntersectionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;

  if (a3)
  {
    v24 = MCIntersectionKey;
    v22 = a4;
    v20 = MCSettingParameterValuesKey;
    v9 = a5;
    v10 = a4;
    v11 = objc_msgSend(a3, "copy");
    v21 = v11;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v23 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v25 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  }
  else
  {
    v18 = MCIntersectionKey;
    v16 = a4;
    v17 = &__NSDictionary0__struct;
    v15 = a5;
    v12 = a4;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v19 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  }

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:](self, "setParametersForSettingsByType:sender:", v14, a5);
}

- (void)setUnionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;

  if (a3)
  {
    v24 = MCUnionKey;
    v22 = a4;
    v20 = MCSettingParameterValuesKey;
    v9 = a5;
    v10 = a4;
    v11 = objc_msgSend(a3, "copy");
    v21 = v11;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v23 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v25 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  }
  else
  {
    v18 = MCUnionKey;
    v16 = a4;
    v17 = &__NSDictionary0__struct;
    v15 = a5;
    v12 = a4;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v19 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  }

  -[MCRestrictionManagerWriter setParametersForSettingsByType:sender:](self, "setParametersForSettingsByType:sender:", v14, a5);
}

- (void)removeBoolSetting:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000782A0;
  block[3] = &unk_1000E41F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeValueSetting:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078428;
  block[3] = &unk_1000E41F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)resetAllSettingsToDefaultsSender:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007858C;
  v7[3] = &unk_1000E2D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)recomputeEffectiveUserSettingsPasscode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007868C;
  v7[3] = &unk_1000E2D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)recomputeUserRestrictionsAndEffectiveUserSettings
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MCRestrictionManagerWriter memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078708;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_sync(v3, block);

}

+ (BOOL)restrictionsAlreadyInstalledFromPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v9;

  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "restrictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRestrictions"));
  v7 = objc_msgSend(a1, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v4, v6, &v9, 0);

  return v9 == 0;
}

- (int)senderPID
{
  return self->_senderPID;
}

- (NSDictionary)clientTypeLoaders
{
  return self->_clientTypeLoaders;
}

- (NSNumber)memberQueuePasscodeCompliesWithRestrictions
{
  return self->_memberQueuePasscodeCompliesWithRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithRestrictions, a3);
}

- (NSNumber)memberQueuePasscodeCompliesWithProfileRestrictions
{
  return self->_memberQueuePasscodeCompliesWithProfileRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithProfileRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithProfileRestrictions, a3);
}

- (NSMutableSet)memberQueueRecomputePasscodeComplianceForClientUUID
{
  return self->_memberQueueRecomputePasscodeComplianceForClientUUID;
}

- (void)setMemberQueueRecomputePasscodeComplianceForClientUUID:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueRecomputePasscodeComplianceForClientUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueRecomputePasscodeComplianceForClientUUID, 0);
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithRestrictions, 0);
  objc_storeStrong((id *)&self->_clientTypeLoaders, 0);
}

@end
