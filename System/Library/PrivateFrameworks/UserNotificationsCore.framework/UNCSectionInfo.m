@implementation UNCSectionInfo

+ (id)defaultSectionInfoForType:(int64_t)a3
{
  return -[UNCSectionInfo initWithDefaultsForSectionType:]([UNCSectionInfo alloc], "initWithDefaultsForSectionType:", a3);
}

- (UNCSectionInfo)init
{
  return -[UNCSectionInfo initWithDefaultsForSectionType:](self, "initWithDefaultsForSectionType:", 0);
}

- (UNCSectionInfo)initWithDefaultsForSectionType:(int64_t)a3
{
  UNCSectionInfo *v4;
  UNCSectionInfoSettings *v5;
  UNCSectionInfoSettings *sectionInfoSettings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UNCSectionInfo;
  v4 = -[UNCSectionInfo init](&v8, sel_init);
  if (v4)
  {
    v5 = -[UNCSectionInfoSettings initWithDefaultsForSectionType:]([UNCSectionInfoSettings alloc], "initWithDefaultsForSectionType:", a3);
    sectionInfoSettings = v4->_sectionInfoSettings;
    v4->_sectionInfoSettings = v5;

    -[UNCSectionInfo _configureWithDefaultsForSectionType:](v4, "_configureWithDefaultsForSectionType:", a3);
  }
  return v4;
}

- (void)_configureWithDefaultsForSectionType:(int64_t)a3
{
  -[UNCSectionInfo setSectionType:](self, "setSectionType:");
  -[UNCSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", 0);
  if ((a3 | 2) == 2)
  {
    -[UNCSectionInfo setBulletinCount:](self, "setBulletinCount:", 5);
    if (a3 == 2)
      -[UNCSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", 8);
  }
}

- (void)_addSubsection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setParentSection:", self);
    v5 = (void *)MEMORY[0x24BDBCEB8];
    -[UNCSectionInfo subsections](self, "subsections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v4);
    -[UNCSectionInfo setSubsections:](self, "setSubsections:", v7);

  }
}

- (void)_replaceSubsection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  UNCSectionInfo *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = self;
  -[UNCSectionInfo subsections](self, "subsections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "subsectionID", v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v6);

          if (v15)
          {
            objc_msgSend(v13, "setParentSection:", 0);
            objc_msgSend(v4, "setParentSection:", v17);
            v13 = v4;
          }
          objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[UNCSectionInfo setSubsections:](v17, "setSubsections:", v7);
    v5 = v16;
  }

}

- (id)_subsectionForID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UNCSectionInfo subsections](self, "subsections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "subsectionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_associateDataProviderSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "sectionID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);
    -[UNCSectionInfo setDataProviderIDs:](self, "setDataProviderIDs:", v6);

  }
  -[UNCSectionInfo sectionID](self, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFactorySectionID:", v7);

}

- (void)_dissociateDataProviderSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "factorySectionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo sectionID](self, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v4 = v12;
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCEB8];
      -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "sectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v11);

      -[UNCSectionInfo setDataProviderIDs:](self, "setDataProviderIDs:", v10);
      objc_msgSend(v12, "setFactorySectionID:", 0);

      v4 = v12;
    }
  }

}

- (void)setParentSection:(id)a3
{
  UNCSectionInfo **p_parentSection;
  id v5;
  void *v6;
  id v7;

  p_parentSection = &self->_parentSection;
  v7 = a3;
  v5 = objc_storeWeak((id *)p_parentSection, v7);
  objc_msgSend(v7, "managedSectionInfoSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfo setManagedSectionInfoSettings:](self, "setManagedSectionInfoSettings:", v6);
}

- (BOOL)hasEnabledSettings
{
  char v3;
  int64_t v4;

  if (-[UNCSectionInfo allowsNotifications](self, "allowsNotifications"))
  {
    v3 = -[UNCSectionInfo pushSettings](self, "pushSettings");
    if ((v3 & 0x18) != 0
      || (v3 & 0x20) != 0 && -[UNCSectionInfo alertType](self, "alertType")
      || -[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting") == 2
      || -[UNCSectionInfo notificationCenterSetting](self, "notificationCenterSetting") == 2
      || -[UNCSectionInfo carPlaySetting](self, "carPlaySetting") == 2
      || -[UNCSectionInfo remoteNotificationsSetting](self, "remoteNotificationsSetting") == 2
      || -[UNCSectionInfo criticalAlertSetting](self, "criticalAlertSetting") == 2)
    {
      return 1;
    }
    v4 = -[UNCSectionInfo scheduledDeliverySetting](self, "scheduledDeliverySetting");
  }
  else
  {
    v4 = -[UNCSectionInfo criticalAlertSetting](self, "criticalAlertSetting");
  }
  return v4 == 2;
}

- (BOOL)_isDeliveredQuietly
{
  char v3;
  BOOL v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (!-[UNCSectionInfo allowsNotifications](self, "allowsNotifications"))
    return 0;
  if (-[UNCSectionInfo notificationCenterSetting](self, "notificationCenterSetting") != 2)
    return 0;
  v3 = -[UNCSectionInfo pushSettings](self, "pushSettings");
  if ((v3 & 0x18) != 0 || (v3 & 0x20) != 0 && -[UNCSectionInfo alertType](self, "alertType"))
    return 0;
  if (-[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting") == 2)
    return 0;
  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unc_isToneEnabledForSectionInfo:", self);

  if ((v7 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unc_isVibrationEnabledForSectionInfo:", self);

  if ((v9 & 1) != 0)
    return 0;
  if (-[UNCSectionInfo carPlaySetting](self, "carPlaySetting") != 2)
    goto LABEL_14;
  v10 = objc_alloc_init((Class)getCRPairedVehicleManagerClass());
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37__UNCSectionInfo__isDeliveredQuietly__block_invoke;
  v13[3] = &unk_251AE0110;
  v13[4] = &v14;
  objc_msgSend(v10, "syncFetchAllVehiclesWithCompletion:", v13);
  v11 = objc_msgSend((id)v15[5], "count");
  _Block_object_dispose(&v14, 8);

  if (v11)
    return 0;
LABEL_14:
  if (-[UNCSectionInfo announceSetting](self, "announceSetting") != 2
    && -[UNCSectionInfo announceSetting](self, "announceSetting") != 3)
  {
    return 1;
  }
  +[UNCBulletinDefaults standardDefaults](UNCBulletinDefaults, "standardDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v12, "isAnnounceSupportedForHeadphones") & 1) == 0
    && (!objc_msgSend(v12, "isAnnounceSupportedForCarPlay")
     || !objc_msgSend(v12, "hasPairedVehiclesForCarPlay"));

  return v4;
}

void __37__UNCSectionInfo__isDeliveredQuietly__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isDeliveredQuietly
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[UNCSectionInfo subsections](self, "subsections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[UNCSectionInfo allowsNotifications](self, "allowsNotifications");
    if (v5)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[UNCSectionInfo subsections](self, "subsections", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v7)
      {
LABEL_18:

LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "allowsNotifications")
            && objc_msgSend(v12, "notificationCenterSetting") == 2)
          {
            if (!objc_msgSend(v12, "_isDeliveredQuietly"))
              goto LABEL_18;
            v9 = 1;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);

      if ((v9 & 1) == 0)
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  else
  {
    v5 = -[UNCSectionInfo _isDeliveredQuietly](self, "_isDeliveredQuietly");
    if (v5)
LABEL_17:
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_deliverQuietly:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UNCSectionInfo pushSettings](self, "pushSettings");
  if (v3)
  {
    -[UNCSectionInfo setPushSettings:](self, "setPushSettings:", v5 & 0xFFFFFFFFFFFFFFC7);
    -[UNCSectionInfo setAlertType:](self, "setAlertType:", 0);
    if (-[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting"))
      -[UNCSectionInfo setLockScreenSetting:](self, "setLockScreenSetting:", 1);
    if (-[UNCSectionInfo carPlaySetting](self, "carPlaySetting"))
      -[UNCSectionInfo setCarPlaySetting:](self, "setCarPlaySetting:", 1);
    if (-[UNCSectionInfo remoteNotificationsSetting](self, "remoteNotificationsSetting"))
      -[UNCSectionInfo setRemoteNotificationsSetting:](self, "setRemoteNotificationsSetting:", 1);
    if (-[UNCSectionInfo announceSetting](self, "announceSetting"))
    {
      v6 = 1;
LABEL_20:
      -[UNCSectionInfo setAnnounceSetting:](self, "setAnnounceSetting:", v6);
    }
  }
  else
  {
    -[UNCSectionInfo setPushSettings:](self, "setPushSettings:", (8 * (v5 & 7)) | v5);
    -[UNCSectionInfo setAlertType:](self, "setAlertType:", 1);
    if (-[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting"))
      -[UNCSectionInfo setLockScreenSetting:](self, "setLockScreenSetting:", 2);
    if (-[UNCSectionInfo carPlaySetting](self, "carPlaySetting"))
      -[UNCSectionInfo setCarPlaySetting:](self, "setCarPlaySetting:", 2);
    if (-[UNCSectionInfo remoteNotificationsSetting](self, "remoteNotificationsSetting"))
      -[UNCSectionInfo setRemoteNotificationsSetting:](self, "setRemoteNotificationsSetting:", 2);
    if (-[UNCSectionInfo announceSetting](self, "announceSetting"))
    {
      if (-[UNCSectionInfo timeSensitiveSetting](self, "timeSensitiveSetting") == 2)
        v6 = 2;
      else
        v6 = 1;
      goto LABEL_20;
    }
  }
}

- (void)deliverQuietly:(BOOL)a3
{
  -[UNCSectionInfo deliverQuietly:changeAuthorizationStatus:](self, "deliverQuietly:changeAuthorizationStatus:", a3, 1);
}

- (void)deliverQuietly:(BOOL)a3 changeAuthorizationStatus:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v5 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BEB8CA0];
  -[UNCSectionInfo sectionID](self, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "unc_toneLibraryAlertTypeForSectionID:", v8);

  if (v9)
    objc_msgSend(MEMORY[0x24BEB8CA0], "_setCurrentOverridePolicy:forType:", v5, v9);
  -[UNCSectionInfo subsections](self, "subsections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UNCSectionInfo subsections](self, "subsections", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "_deliverQuietly:", v5);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    if (v4)
      goto LABEL_12;
  }
  else
  {
    -[UNCSectionInfo _deliverQuietly:](self, "_deliverQuietly:", v5);
    if (v4)
LABEL_12:
      -[UNCSectionInfo makeAuthorizationPermanent](self, "makeAuthorizationPermanent");
  }
  if (v5)
  {
    -[UNCSectionInfo muteAssertion](self, "muteAssertion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[UNCSectionInfo setMuteAssertion:](self, "setMuteAssertion:", 0);
  }
}

- (void)makeAuthorizationPermanent
{
  if (-[UNCSectionInfo authorizationStatus](self, "authorizationStatus") == 4
    || -[UNCSectionInfo authorizationStatus](self, "authorizationStatus") == 3)
  {
    -[UNCSectionInfo setAuthorizationStatus:](self, "setAuthorizationStatus:", 2);
  }
}

- (void)muteSectionUntilDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UNCSectionInfo _isDeliveredQuietly](self, "_isDeliveredQuietly"))
  {
    -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "muteSectionUntilDate:", v5);

  }
}

- (void)unmuteSection
{
  id v2;

  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unmuteSection");

}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[UNCSectionInfo _isDeliveredQuietly](self, "_isDeliveredQuietly"))
  {
    -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "muteThreadIdentifier:untilDate:", v8, v6);

  }
}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unmuteThreadIdentifier:", v4);

}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBulletinMutedForThreadIdentifier:", v4);

  return v6;
}

- (id)_suppressedSettingsList:(unint64_t)a3
{
  id v4;
  void *v5;
  const __CFString *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = v4;
  if (a3 == -1)
  {
    v6 = CFSTR("All");
LABEL_36:
    objc_msgSend(v5, "addObject:", v6);
    return v5;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("ShowsInNotificationCenter"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v5, "addObject:", CFSTR("ShowsInLockScreen"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v5, "addObject:", CFSTR("ShowsOnExternalDevices"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v5, "addObject:", CFSTR("NotificationCenterLimit"));
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v5, "addObject:", CFSTR("PushSettings"));
  if ((a3 & 0x20) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v5, "addObject:", CFSTR("AlertType"));
  if ((a3 & 0x40) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v5, "addObject:", CFSTR("ShowsMessagePreview"));
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v5, "addObject:", CFSTR("ShowsInCarPlay"));
  if ((a3 & 0x100) == 0)
  {
LABEL_11:
    if ((a3 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v5, "addObject:", CFSTR("CriticalAlert"));
  if ((a3 & 0x200) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v5, "addObject:", CFSTR("BulletinGrouping"));
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v5, "addObject:", CFSTR("SpokenNotifications"));
  objc_msgSend(v5, "addObject:", CFSTR("SpokenNotifications"));
  if ((a3 & 0x800) == 0)
  {
LABEL_14:
    if ((a3 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v5, "addObject:", CFSTR("TimeSensitive"));
  if ((a3 & 0x1000) == 0)
  {
LABEL_15:
    if ((a3 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v5, "addObject:", CFSTR("ScheduledDelivery"));
  if ((a3 & 0x2000) == 0)
  {
LABEL_16:
    if ((a3 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v5, "addObject:", CFSTR("Badge"));
  if ((a3 & 0x4000) == 0)
  {
LABEL_17:
    if ((a3 & 0x8000) == 0)
      return v5;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v5, "addObject:", CFSTR("Sound"));
  if ((a3 & 0x8000) != 0)
  {
LABEL_35:
    v6 = CFSTR("DirectMessages");
    goto LABEL_36;
  }
  return v5;
}

- (NSDictionary)stateCapture
{
  id v3;
  void *v4;
  UNCSectionInfoSettings *managedSectionInfoSettings;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[UNCSectionInfoSettings stateCapture](self->_sectionInfoSettings, "stateCapture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("SectionInfoSettings"));

  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (managedSectionInfoSettings)
  {
    -[UNCSectionInfoSettings stateCapture](managedSectionInfoSettings, "stateCapture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("ManagedSettings"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", CFSTR("Unmanaged"), CFSTR("ManagedSettings"));
  }
  -[UNCSectionInfo appName](self, "appName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UNCSectionInfo appName](self, "appName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("AppName"));

  }
  -[UNCSectionInfo displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UNCSectionInfo displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("DisplayName"));

  }
  -[UNCSectionInfo subsectionID](self, "subsectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UNCSectionInfo subsectionID](self, "subsectionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("SubSectionID"));

  }
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UNCSectionInfo factorySectionID](self, "factorySectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("FactorySectionID"));

  }
  if (-[UNCSectionInfo version](self, "version"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNCSectionInfo version](self, "version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("Version"));

  }
  UNCStringFromBool(self->_suppressFromSettings);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("HiddenFromSettings"));

  UNCStringFromBool(-[UNCSectionInfo hideWeeApp](self, "hideWeeApp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("HiddenWeeApp"));

  v18 = -[UNCSectionInfo suppressedSettings](self, "suppressedSettings");
  if (v18)
  {
    -[UNCSectionInfo _suppressedSettingsList:](self, "_suppressedSettingsList:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("SuppressedSettings"));

  }
  -[UNCSectionInfo subsections](self, "subsections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v27, "stateCapture", (_QWORD)v38);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "subsectionID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setValue:forKey:", v28, v29);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("SubSections"));
    goto LABEL_25;
  }
  -[UNCSectionInfo parentSection](self, "parentSection");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[UNCSectionInfo parentSection](self, "parentSection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sectionID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo sectionID](self, "sectionID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqualToString:", v35);

    if ((v36 & 1) == 0)
    {
      -[UNCSectionInfo parentSection](self, "parentSection");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sectionID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v37, CFSTR("ParentSectionID"));

LABEL_25:
    }
  }

  return (NSDictionary *)v3;
}

- (void)setEnabled:(BOOL)a3
{
  -[UNCSectionInfo setNotificationCenterSetting:](self, "setNotificationCenterSetting:", 2);
}

- (BOOL)enabled
{
  return -[UNCSectionInfo notificationCenterSetting](self, "notificationCenterSetting") == 2;
}

- (unint64_t)bulletinCount
{
  return 500;
}

- (NSData)iconData
{
  void *v2;
  void *v3;
  void *v4;

  -[UNCSectionInfo icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bestVariantForFormat:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (unint64_t)notificationCenterLimit
{
  return 500;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  objc_super v37;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" Section %@"), self->_sectionID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_sectionInfoSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isRestricted)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (restricted)"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (self->_managedSectionInfoSettings)
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@ (managed)"), self->_managedSectionInfoSettings);
  else
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(" (unmanaged)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfo appName](self, "appName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UNCSectionInfo appName](self, "appName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" '%@'"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  -[UNCSectionInfo displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UNCSectionInfo displayName](self, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" '%@'"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  -[UNCSectionInfo subsectionID](self, "subsectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UNCSectionInfo subsectionID](self, "subsectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" (%@)"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v15;
  }
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UNCSectionInfo factorySectionID](self, "factorySectionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" (factory: %@)"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v18;
  }
  if (-[UNCSectionInfo version](self, "version"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [v%ld]"), -[UNCSectionInfo version](self, "version"));
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v19;
  }
  if (self->_suppressFromSettings)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(", hidden from settings"));
    v20 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v20;
  }
  if (-[UNCSectionInfo hideWeeApp](self, "hideWeeApp"))
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(", hidden wee app"));
    v21 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v21;
  }
  v22 = -[UNCSectionInfo suppressedSettings](self, "suppressedSettings");
  if (v22)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", suppressed settings = %lX"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v23;
  }
  -[UNCSectionInfo subsections](self, "subsections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", subsections = %@"), v24);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_24:

    v6 = (void *)v25;
    goto LABEL_25;
  }
  -[UNCSectionInfo parentSection](self, "parentSection");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[UNCSectionInfo parentSection](self, "parentSection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sectionID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo sectionID](self, "sectionID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
    {
      -[UNCSectionInfo parentSection](self, "parentSection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sectionID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", parent section = %@"), v36);
      v25 = objc_claimAutoreleasedReturnValue();

      v6 = v35;
      goto LABEL_24;
    }
  }
LABEL_25:
  v37.receiver = self;
  v37.super_class = (Class)UNCSectionInfo;
  -[UNCSectionInfo description](&v37, sel_description);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingString:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  -[UNCSectionInfo sectionID](self, "sectionID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v42, "hash");
  -[UNCSectionInfo subsectionID](self, "subsectionID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v41, "hash") ^ v3;
  v5 = v4 ^ -[UNCSectionInfo sectionType](self, "sectionType");
  v6 = -[UNCSectionInfo isAppClip](self, "isAppClip");
  v7 = v5 ^ v6 ^ -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed");
  v8 = -[UNCSectionInfo isRestricted](self, "isRestricted");
  v9 = v8 ^ -[UNCSectionInfo sectionCategory](self, "sectionCategory");
  v10 = v7 ^ v9 ^ -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings");
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v40, "hash");
  -[UNCSectionInfo managedSectionInfoSettings](self, "managedSectionInfoSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v39, "hash");
  v13 = v12 ^ -[UNCSectionInfo suppressedSettings](self, "suppressedSettings");
  -[UNCSectionInfo subsections](self, "subsections");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 ^ objc_msgSend(v38, "hash");
  -[UNCSectionInfo parentSection](self, "parentSection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sectionID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v14 ^ objc_msgSend(v36, "hash");
  v16 = -[UNCSectionInfo subsectionPriority](self, "subsectionPriority");
  v17 = v16 ^ -[UNCSectionInfo version](self, "version");
  -[UNCSectionInfo appName](self, "appName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 ^ objc_msgSend(v35, "hash");
  -[UNCSectionInfo displayName](self, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[UNCSectionInfo icon](self, "icon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15 ^ v24 ^ objc_msgSend(v25, "hash");
  -[UNCSectionInfo customSettingsBundle](self, "customSettingsBundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash");
  -[UNCSectionInfo customSettingsDetailControllerClass](self, "customSettingsDetailControllerClass");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 ^ objc_msgSend(v29, "hash");
  -[UNCSectionInfo pathToWeeAppPluginBundle](self, "pathToWeeAppPluginBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30 ^ objc_msgSend(v31, "hash");
  v33 = v26 ^ v32 ^ -[UNCSectionInfo hideWeeApp](self, "hideWeeApp");

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  UNCSectionInfo *v4;
  UNCSectionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v4 = (UNCSectionInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[UNCSectionInfo sectionID](self, "sectionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCSectionInfo sectionID](v5, "sectionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {
        -[UNCSectionInfo subsectionID](self, "subsectionID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCSectionInfo subsectionID](v5, "subsectionID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualStrings()
          && (v10 = -[UNCSectionInfo sectionType](self, "sectionType"),
              v10 == -[UNCSectionInfo sectionType](v5, "sectionType"))
          && (v11 = -[UNCSectionInfo isAppClip](self, "isAppClip"), v11 == -[UNCSectionInfo isAppClip](v5, "isAppClip"))
          && (v12 = -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed"),
              v12 == -[UNCSectionInfo isModificationAllowed](v5, "isModificationAllowed"))
          && (v13 = -[UNCSectionInfo isRestricted](self, "isRestricted"),
              v13 == -[UNCSectionInfo isRestricted](v5, "isRestricted"))
          && (v14 = -[UNCSectionInfo sectionCategory](self, "sectionCategory"),
              v14 == -[UNCSectionInfo sectionCategory](v5, "sectionCategory"))
          && (v15 = -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings"),
              v15 == -[UNCSectionInfo suppressFromSettings](v5, "suppressFromSettings")))
        {
          -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCSectionInfo sectionInfoSettings](v5, "sectionInfoSettings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            -[UNCSectionInfo managedSectionInfoSettings](self, "managedSectionInfoSettings");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UNCSectionInfo managedSectionInfoSettings](v5, "managedSectionInfoSettings");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (BSEqualObjects())
            {
              v57 = v20;
              v21 = -[UNCSectionInfo suppressedSettings](self, "suppressedSettings");
              if (v21 == -[UNCSectionInfo suppressedSettings](v5, "suppressedSettings"))
              {
                -[UNCSectionInfo subsections](self, "subsections");
                v22 = objc_claimAutoreleasedReturnValue();
                -[UNCSectionInfo subsections](v5, "subsections");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = (void *)v22;
                if (BSEqualObjects())
                {
                  -[UNCSectionInfo parentSection](self, "parentSection");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "sectionID");
                  v23 = objc_claimAutoreleasedReturnValue();
                  -[UNCSectionInfo parentSection](v5, "parentSection");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "sectionID");
                  v53 = (void *)v23;
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  if (BSEqualStrings()
                    && (v24 = -[UNCSectionInfo subsectionPriority](self, "subsectionPriority"),
                        v24 == -[UNCSectionInfo subsectionPriority](v5, "subsectionPriority"))
                    && (v25 = -[UNCSectionInfo version](self, "version"), v25 == -[UNCSectionInfo version](v5, "version")))
                  {
                    -[UNCSectionInfo appName](self, "appName");
                    v26 = objc_claimAutoreleasedReturnValue();
                    -[UNCSectionInfo appName](v5, "appName");
                    v49 = (void *)v26;
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (BSEqualStrings())
                    {
                      -[UNCSectionInfo displayName](self, "displayName");
                      v27 = objc_claimAutoreleasedReturnValue();
                      -[UNCSectionInfo displayName](v5, "displayName");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = (void *)v27;
                      if (BSEqualStrings())
                      {
                        -[UNCSectionInfo icon](self, "icon");
                        v28 = objc_claimAutoreleasedReturnValue();
                        -[UNCSectionInfo icon](v5, "icon");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        v46 = (void *)v28;
                        if (BSEqualObjects())
                        {
                          -[UNCSectionInfo factorySectionID](self, "factorySectionID");
                          v29 = objc_claimAutoreleasedReturnValue();
                          -[UNCSectionInfo factorySectionID](v5, "factorySectionID");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = (void *)v29;
                          if (BSEqualStrings())
                          {
                            -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
                            v30 = objc_claimAutoreleasedReturnValue();
                            -[UNCSectionInfo dataProviderIDs](v5, "dataProviderIDs");
                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                            v42 = (void *)v30;
                            if (BSEqualObjects())
                            {
                              -[UNCSectionInfo customSettingsBundle](self, "customSettingsBundle");
                              v31 = objc_claimAutoreleasedReturnValue();
                              -[UNCSectionInfo customSettingsBundle](v5, "customSettingsBundle");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              v40 = (void *)v31;
                              if (BSEqualStrings())
                              {
                                -[UNCSectionInfo customSettingsDetailControllerClass](self, "customSettingsDetailControllerClass");
                                v32 = objc_claimAutoreleasedReturnValue();
                                -[UNCSectionInfo customSettingsDetailControllerClass](v5, "customSettingsDetailControllerClass");
                                v37 = (void *)objc_claimAutoreleasedReturnValue();
                                v38 = (void *)v32;
                                if (BSEqualStrings())
                                {
                                  -[UNCSectionInfo pathToWeeAppPluginBundle](self, "pathToWeeAppPluginBundle");
                                  v33 = objc_claimAutoreleasedReturnValue();
                                  -[UNCSectionInfo pathToWeeAppPluginBundle](v5, "pathToWeeAppPluginBundle");
                                  v36 = (void *)v33;
                                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (BSEqualStrings())
                                  {
                                    v35 = -[UNCSectionInfo hideWeeApp](self, "hideWeeApp", v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51);
                                    v16 = v35 ^ -[UNCSectionInfo hideWeeApp](v5, "hideWeeApp") ^ 1;
                                  }
                                  else
                                  {
                                    LOBYTE(v16) = 0;
                                  }

                                }
                                else
                                {
                                  LOBYTE(v16) = 0;
                                }

                              }
                              else
                              {
                                LOBYTE(v16) = 0;
                              }

                            }
                            else
                            {
                              LOBYTE(v16) = 0;
                            }

                          }
                          else
                          {
                            LOBYTE(v16) = 0;
                          }

                        }
                        else
                        {
                          LOBYTE(v16) = 0;
                        }

                      }
                      else
                      {
                        LOBYTE(v16) = 0;
                      }

                    }
                    else
                    {
                      LOBYTE(v16) = 0;
                    }

                  }
                  else
                  {
                    LOBYTE(v16) = 0;
                  }

                }
                else
                {
                  LOBYTE(v16) = 0;
                }

              }
              else
              {
                LOBYTE(v16) = 0;
              }
              v20 = v57;
            }
            else
            {
              LOBYTE(v16) = 0;
            }

          }
          else
          {
            LOBYTE(v16) = 0;
          }

        }
        else
        {
          LOBYTE(v16) = 0;
        }

      }
      else
      {
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UNCSectionInfo parentSection](self, "parentSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentSection:", v6);

  -[UNCSectionInfo sectionID](self, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionID:", v7);

  -[UNCSectionInfo subsectionID](self, "subsectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubsectionID:", v8);

  objc_msgSend(v5, "setSectionType:", -[UNCSectionInfo sectionType](self, "sectionType"));
  objc_msgSend(v5, "setIsAppClip:", -[UNCSectionInfo isAppClip](self, "isAppClip"));
  objc_msgSend(v5, "setIsModificationAllowed:", -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed"));
  objc_msgSend(v5, "setIsRestricted:", -[UNCSectionInfo isRestricted](self, "isRestricted"));
  objc_msgSend(v5, "setSectionCategory:", -[UNCSectionInfo sectionCategory](self, "sectionCategory"));
  objc_msgSend(v5, "setSuppressFromSettings:", -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings"));
  v9 = -[UNCSectionInfoSettings copyWithZone:](self->_sectionInfoSettings, "copyWithZone:", a3);
  objc_msgSend(v5, "setSectionInfoSettings:", v9);

  v10 = -[UNCSectionInfoSettings copyWithZone:](self->_managedSectionInfoSettings, "copyWithZone:", a3);
  objc_msgSend(v5, "setManagedSectionInfoSettings:", v10);

  -[UNCSectionInfo pathToWeeAppPluginBundle](self, "pathToWeeAppPluginBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPathToWeeAppPluginBundle:", v11);

  -[UNCSectionInfo appName](self, "appName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppName:", v12);

  -[UNCSectionInfo displayName](self, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v13);

  -[UNCSectionInfo icon](self, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v14);

  -[UNCSectionInfo customSettingsBundle](self, "customSettingsBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomSettingsBundle:", v15);

  -[UNCSectionInfo customSettingsDetailControllerClass](self, "customSettingsDetailControllerClass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomSettingsDetailControllerClass:", v16);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UNCSectionInfo subsections](self, "subsections", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "copyWithZone:", a3);
        objc_msgSend(v5, "_addSubsection:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  objc_msgSend(v5, "setSubsectionPriority:", -[UNCSectionInfo subsectionPriority](self, "subsectionPriority"));
  objc_msgSend(v5, "setSuppressedSettings:", -[UNCSectionInfo suppressedSettings](self, "suppressedSettings"));
  objc_msgSend(v5, "setHideWeeApp:", -[UNCSectionInfo hideWeeApp](self, "hideWeeApp"));
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFactorySectionID:", v23);

  -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataProviderIDs:", v24);

  objc_msgSend(v5, "setVersion:", -[UNCSectionInfo version](self, "version"));
  objc_msgSend(v5, "setIsRestricted:", -[UNCSectionInfo isRestricted](self, "isRestricted"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionInfo)initWithCoder:(id)a3
{
  id v4;
  UNCSectionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UNCSectionInfoSettings *sectionInfoSettings;
  UNCSectionInfoSettings *v31;
  UNCSectionInfoSettings *v32;
  uint64_t v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _QWORD v41[2];
  _BYTE v42[128];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)UNCSectionInfo;
  v5 = -[UNCSectionInfo init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setSectionID:](v5, "setSectionID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subsectionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setSubsectionID:](v5, "setSubsectionID:", v7);

    -[UNCSectionInfo setSectionType:](v5, "setSectionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sectionType")));
    -[UNCSectionInfo setIsAppClip:](v5, "setIsAppClip:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppClip")));
    -[UNCSectionInfo setIsModificationAllowed:](v5, "setIsModificationAllowed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isModificationAllowed")));
    -[UNCSectionInfo setIsRestricted:](v5, "setIsRestricted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestricted")));
    -[UNCSectionInfo setSectionCategory:](v5, "setSectionCategory:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sectionCategory")));
    -[UNCSectionInfo setSuppressFromSettings:](v5, "setSuppressFromSettings:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressFromSettings")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathToWeeAppPluginBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setPathToWeeAppPluginBundle:](v5, "setPathToWeeAppPluginBundle:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setAppName:](v5, "setAppName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setDisplayName:](v5, "setDisplayName:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setIcon:](v5, "setIcon:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("subsections"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNCSectionInfo setSubsections:](v5, "setSubsections:", v15);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v20++), "setParentSection:", v5, (_QWORD)v36);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v18);
    }

    -[UNCSectionInfo setSubsectionPriority:](v5, "setSubsectionPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subsectionPriority")));
    -[UNCSectionInfo setSuppressedSettings:](v5, "setSuppressedSettings:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("suppressedSettings")));
    -[UNCSectionInfo setHideWeeApp:](v5, "setHideWeeApp:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideWeeApp")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorySectionID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setFactorySectionID:](v5, "setFactorySectionID:", v21);

    v22 = (void *)MEMORY[0x24BDBCF20];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("dataProviderIDs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setDataProviderIDs:](v5, "setDataProviderIDs:", v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSettingsBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setCustomSettingsBundle:](v5, "setCustomSettingsBundle:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSettingsDetailControllerClass"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setCustomSettingsDetailControllerClass:](v5, "setCustomSettingsDetailControllerClass:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfo setVersion:](v5, "setVersion:", objc_msgSend(v28, "unsignedIntegerValue"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sectionInfoSettings")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionInfoSettings"));
      v29 = objc_claimAutoreleasedReturnValue();
      sectionInfoSettings = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = (UNCSectionInfoSettings *)v29;

    }
    else
    {
      v31 = -[UNCSectionInfoSettings initWithDefaultsForSectionType:]([UNCSectionInfoSettings alloc], "initWithDefaultsForSectionType:", -[UNCSectionInfo sectionType](v5, "sectionType"));
      v32 = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = v31;

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsNotifications")))
        v33 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNotifications"));
      else
        v33 = 1;
      -[UNCSectionInfoSettings setAllowsNotifications:](v5->_sectionInfoSettings, "setAllowsNotifications:", v33, (_QWORD)v36);
      -[UNCSectionInfoSettings setShowsInNotificationCenter:](v5->_sectionInfoSettings, "setShowsInNotificationCenter:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInNotificationCenter")));
      -[UNCSectionInfoSettings setShowsInLockScreen:](v5->_sectionInfoSettings, "setShowsInLockScreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInLockScreen")));
      -[UNCSectionInfoSettings setShowsCustomSettingsLink:](v5->_sectionInfoSettings, "setShowsCustomSettingsLink:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCustomSettingsLink")));
      -[UNCSectionInfoSettings setAlertType:](v5->_sectionInfoSettings, "setAlertType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alertType")));
      -[UNCSectionInfoSettings setPushSettings:](v5->_sectionInfoSettings, "setPushSettings:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pushSettings")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsOnExternalDevices")))
        -[UNCSectionInfoSettings setShowsOnExternalDevices:](v5->_sectionInfoSettings, "setShowsOnExternalDevices:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsOnExternalDevices")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsMessagePreview")))
        -[UNCSectionInfoSettings setShowsMessagePreview:](v5->_sectionInfoSettings, "setShowsMessagePreview:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsMessagePreview")));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bulletinGroupingSetting"), (_QWORD)v36))
      -[UNCSectionInfo setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bulletinGroupingSetting")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("managedSectionInfoSettings")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managedSectionInfoSettings"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCSectionInfo setManagedSectionInfoSettings:](v5, "setManagedSectionInfoSettings:", v34);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[UNCSectionInfo sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionID"));

  -[UNCSectionInfo subsectionID](self, "subsectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subsectionID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo sectionType](self, "sectionType"), CFSTR("sectionType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isAppClip](self, "isAppClip"), CFSTR("isAppClip"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed"), CFSTR("isModificationAllowed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isRestricted](self, "isRestricted"), CFSTR("isRestricted"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo sectionCategory](self, "sectionCategory"), CFSTR("sectionCategory"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings"), CFSTR("suppressFromSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionInfoSettings, CFSTR("sectionInfoSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_managedSectionInfoSettings, CFSTR("managedSectionInfoSettings"));
  -[UNCSectionInfo pathToWeeAppPluginBundle](self, "pathToWeeAppPluginBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pathToWeeAppPluginBundle"));

  -[UNCSectionInfo appName](self, "appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appName"));

  -[UNCSectionInfo displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("displayName"));

  -[UNCSectionInfo icon](self, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("icon"));

  -[UNCSectionInfo subsections](self, "subsections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("subsections"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo subsectionPriority](self, "subsectionPriority"), CFSTR("subsectionPriority"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo suppressedSettings](self, "suppressedSettings"), CFSTR("suppressedSettings"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo hideWeeApp](self, "hideWeeApp"), CFSTR("hideWeeApp"));
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("factorySectionID"));

  -[UNCSectionInfo dataProviderIDs](self, "dataProviderIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("dataProviderIDs"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNCSectionInfo version](self, "version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("version"));

  -[UNCSectionInfo customSettingsBundle](self, "customSettingsBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("customSettingsBundle"));

  -[UNCSectionInfo customSettingsDetailControllerClass](self, "customSettingsDetailControllerClass");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("customSettingsDetailControllerClass"));

}

- (id)effectiveSectionInfoWithDefaultContentPreviewSetting:(int64_t)a3 globalAnnounceSetting:(int64_t)a4 globalScheduledDeliverySetting:(int64_t)a5 hasPairedVehiclesForCarPlay:(BOOL)a6 hasDestinationForRemoteNotifications:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  UNCSectionInfo *v11;
  void *v12;
  UNCSectionInfo *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  UNCSectionInfo *v38;
  uint64_t v39;
  UNCSectionInfo *v40;
  UNCSectionInfo *v41;
  void *v42;
  uint64_t v43;
  UNCSectionInfo *v44;
  UNCSectionInfo *v45;
  UNCSectionInfo *v47;
  BOOL v48;
  int64_t v49;
  UNCSectionInfo *v50;
  unint64_t v51;
  int v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v7 = a7;
  v8 = a6;
  v11 = self;
  v73 = *MEMORY[0x24BDAC8D0];
  -[UNCSectionInfo parentSection](self, "parentSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[UNCSectionInfo subsections](v11, "subsections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
      goto LABEL_46;
    v47 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v50 = v11;
    -[UNCSectionInfo subsections](v11, "subsections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v68 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", a3, a4, a5, v8, v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v21);
    }

    v25 = -[UNCSectionInfo suppressedSettings](v47, "suppressedSettings");
    v26 = v25;
    if ((v25 & 2) != 0)
    {
      v61 = 0;
      if ((v25 & 4) != 0)
        goto LABEL_35;
    }
    else
    {
      v61 = -[UNCSectionInfo lockScreenSetting](v47, "lockScreenSetting");
      if ((v26 & 4) != 0)
      {
LABEL_35:
        v52 = 0;
        if ((v26 & 1) == 0)
          goto LABEL_36;
        goto LABEL_63;
      }
    }
    v52 = -[UNCSectionInfo showsOnExternalDevices](v47, "showsOnExternalDevices");
    if ((v26 & 1) == 0)
    {
LABEL_36:
      v60 = -[UNCSectionInfo notificationCenterSetting](v47, "notificationCenterSetting");
      if ((v26 & 0x40) == 0)
        goto LABEL_37;
      goto LABEL_64;
    }
LABEL_63:
    v60 = 0;
    if ((v26 & 0x40) == 0)
    {
LABEL_37:
      v59 = -[UNCSectionInfo contentPreviewSetting](v47, "contentPreviewSetting");
      if ((v26 & 0x2000) != 0)
        goto LABEL_38;
      goto LABEL_65;
    }
LABEL_64:
    v59 = 0;
    if ((v26 & 0x2000) != 0)
    {
LABEL_38:
      v27 = 0;
      if ((v26 & 0x4000) != 0)
        goto LABEL_39;
      goto LABEL_66;
    }
LABEL_65:
    v27 = -[UNCSectionInfo pushSettings](v47, "pushSettings") & 9;
    if ((v26 & 0x4000) != 0)
    {
LABEL_39:
      v28 = 0;
      if ((v26 & 0x20) != 0)
        goto LABEL_40;
      goto LABEL_67;
    }
LABEL_66:
    v28 = -[UNCSectionInfo pushSettings](v47, "pushSettings") & 0x12;
    if ((v26 & 0x20) != 0)
    {
LABEL_40:
      v51 = 0;
      v29 = v28 | v27;
      if ((v26 & 0x80) == 0)
        goto LABEL_41;
      goto LABEL_68;
    }
LABEL_67:
    v29 = v27 | v28 | -[UNCSectionInfo pushSettings](v47, "pushSettings") & 0x24;
    v51 = -[UNCSectionInfo alertType](v47, "alertType");
    if ((v26 & 0x80) == 0)
    {
LABEL_41:
      v58 = -[UNCSectionInfo carPlaySetting](v47, "carPlaySetting");
      if ((v26 & 0x10000) == 0)
        goto LABEL_42;
      goto LABEL_69;
    }
LABEL_68:
    v58 = 0;
    if ((v26 & 0x10000) == 0)
    {
LABEL_42:
      v57 = -[UNCSectionInfo remoteNotificationsSetting](v47, "remoteNotificationsSetting");
      if ((v26 & 0x100) == 0)
        goto LABEL_43;
      goto LABEL_70;
    }
LABEL_69:
    v57 = 0;
    if ((v26 & 0x100) == 0)
    {
LABEL_43:
      v56 = -[UNCSectionInfo criticalAlertSetting](v47, "criticalAlertSetting");
      if ((v26 & 0x400) == 0)
        goto LABEL_44;
      goto LABEL_71;
    }
LABEL_70:
    v56 = 0;
    if ((v26 & 0x400) == 0)
    {
LABEL_44:
      v30 = -[UNCSectionInfo announceSetting](v47, "announceSetting");
      if ((v26 & 0x800) == 0)
      {
LABEL_45:
        v55 = -[UNCSectionInfo timeSensitiveSetting](v47, "timeSensitiveSetting");
        goto LABEL_73;
      }
LABEL_72:
      v55 = 0;
LABEL_73:
      v48 = v7;
      if ((v26 & 0x1000) != 0)
        v54 = 0;
      else
        v54 = -[UNCSectionInfo scheduledDeliverySetting](v47, "scheduledDeliverySetting");
      if ((v26 & 0x8000) != 0)
        v31 = 0;
      else
        v31 = -[UNCSectionInfo directMessagesSetting](v47, "directMessagesSetting");
      v49 = a3;
      -[UNCSectionInfo setSubsections:](v47, "setSubsections:", 0);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v18;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (!v32)
      {
LABEL_128:

        v13 = v47;
        -[UNCSectionInfo setLockScreenSetting:](v47, "setLockScreenSetting:", v61);
        -[UNCSectionInfo setShowsOnExternalDevices:](v47, "setShowsOnExternalDevices:", v52 & 1);
        -[UNCSectionInfo setNotificationCenterSetting:](v47, "setNotificationCenterSetting:", v60);
        -[UNCSectionInfo setPushSettings:](v47, "setPushSettings:", v29);
        -[UNCSectionInfo setAlertType:](v47, "setAlertType:", v51);
        -[UNCSectionInfo setContentPreviewSetting:](v47, "setContentPreviewSetting:", v59);
        -[UNCSectionInfo setAnnounceSetting:](v47, "setAnnounceSetting:", v30);
        -[UNCSectionInfo setCarPlaySetting:](v47, "setCarPlaySetting:", v58);
        -[UNCSectionInfo setRemoteNotificationsSetting:](v47, "setRemoteNotificationsSetting:", v57);
        -[UNCSectionInfo setCriticalAlertSetting:](v47, "setCriticalAlertSetting:", v56);
        -[UNCSectionInfo setTimeSensitiveSetting:](v47, "setTimeSensitiveSetting:", v55);
        -[UNCSectionInfo setScheduledDeliverySetting:](v47, "setScheduledDeliverySetting:", v54);
        -[UNCSectionInfo setDirectMessagesSetting:](v47, "setDirectMessagesSetting:", v31);

        v11 = v50;
        v12 = 0;
        a3 = v49;
        LOBYTE(v7) = v48;
        goto LABEL_129;
      }
      v33 = v32;
      v34 = *(_QWORD *)v64;
LABEL_81:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v64 != v34)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v35);
        -[UNCSectionInfo _addSubsection:](v47, "_addSubsection:", v36);
        if (objc_msgSend(v36, "sectionType") != 2)
          goto LABEL_126;
        if ((v26 & 0x2000) != 0)
        {
          v29 |= objc_msgSend(v36, "pushSettings") & 9;
          if ((v26 & 0x4000) == 0)
          {
LABEL_87:
            if ((v26 & 0x20) != 0)
              goto LABEL_91;
            goto LABEL_93;
          }
        }
        else if ((v26 & 0x4000) == 0)
        {
          goto LABEL_87;
        }
        v29 |= objc_msgSend(v36, "pushSettings") & 0x12;
        if ((v26 & 0x20) != 0)
        {
LABEL_91:
          v29 |= objc_msgSend(v36, "pushSettings") & 0x24;
          if (objc_msgSend(v36, "alertType") > v51)
            v51 = objc_msgSend(v36, "alertType");
        }
LABEL_93:
        if ((v26 & 2) != 0 && v61 != 2)
          v61 = objc_msgSend(v36, "lockScreenSetting");
        if ((v26 & 4) != 0)
          v52 |= objc_msgSend(v36, "showsOnExternalDevices");
        if ((v26 & 1) != 0 && v60 != 2)
          v60 = objc_msgSend(v36, "notificationCenterSetting");
        if ((v26 & 0x40) != 0 && v59 != 1)
          v59 = objc_msgSend(v36, "contentPreviewSetting");
        if ((v26 & 0x80) != 0 && v58 != 2)
          v58 = objc_msgSend(v36, "carPlaySetting");
        if ((v26 & 0x10000) != 0 && v57 != 2)
          v57 = objc_msgSend(v36, "remoteNotificationsSetting");
        if ((v26 & 0x400) != 0 && v30 != 2 && v30 != 3)
          v30 = objc_msgSend(v36, "announceSetting");
        if ((v26 & 0x100) != 0 && v56 != 2)
          v56 = objc_msgSend(v36, "criticalAlertSetting");
        if ((v26 & 0x800) != 0 && v55 != 2)
          v55 = objc_msgSend(v36, "timeSensitiveSetting");
        if ((v26 & 0x1000) != 0 && v54 != 2)
          v54 = objc_msgSend(v36, "scheduledDeliverySetting");
        if ((v26 & 0x8000) != 0 && v31 != 2)
          v31 = objc_msgSend(v36, "directMessagesSetting");
LABEL_126:
        if (v33 == ++v35)
        {
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          if (!v33)
            goto LABEL_128;
          goto LABEL_81;
        }
      }
    }
LABEL_71:
    v30 = 0;
    if ((v26 & 0x800) == 0)
      goto LABEL_45;
    goto LABEL_72;
  }
  if (-[UNCSectionInfo sectionType](v11, "sectionType") != 2)
  {
LABEL_46:
    v13 = 0;
    goto LABEL_129;
  }
  v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
  if ((objc_msgSend(v12, "allowsNotifications") & 1) == 0)
    -[UNCSectionInfo setAuthorizationStatus:](v13, "setAuthorizationStatus:", objc_msgSend(v12, "authorizationStatus"));
  if ((objc_msgSend(v12, "suppressedSettings") & 0x2000) == 0
    && (objc_msgSend(v12, "pushSettings") & 1) != 0
    && (objc_msgSend(v12, "pushSettings") & 8) == 0
    && (-[UNCSectionInfo pushSettings](v13, "pushSettings") & 1) != 0)
  {
    -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFF7);
  }
  v14 = -[UNCSectionInfo suppressedSettings](v13, "suppressedSettings");
  v15 = v14;
  if ((v14 & 1) != 0)
  {
    -[UNCSectionInfo setNotificationCenterSetting:](v13, "setNotificationCenterSetting:", objc_msgSend(v12, "notificationCenterSetting"));
    if ((v15 & 2) == 0)
    {
LABEL_12:
      if ((v15 & 4) == 0)
        goto LABEL_13;
      goto LABEL_49;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_12;
  }
  -[UNCSectionInfo setLockScreenSetting:](v13, "setLockScreenSetting:", objc_msgSend(v12, "lockScreenSetting"));
  if ((v15 & 4) == 0)
  {
LABEL_13:
    if ((v15 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  -[UNCSectionInfo setShowsOnExternalDevices:](v13, "setShowsOnExternalDevices:", objc_msgSend(v12, "showsOnExternalDevices"));
  if ((v15 & 0x2000) == 0)
  {
LABEL_14:
    if ((v15 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", objc_msgSend(v12, "pushSettings") & 9 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFF6);
  if ((v15 & 0x4000) == 0)
  {
LABEL_15:
    if ((v15 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", objc_msgSend(v12, "pushSettings") & 0x12 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFEDLL);
  if ((v15 & 0x20) == 0)
  {
LABEL_16:
    if ((v15 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", objc_msgSend(v12, "pushSettings") & 0x24 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFDBLL);
  -[UNCSectionInfo setAlertType:](v13, "setAlertType:", objc_msgSend(v12, "alertType"));
  if ((v15 & 0x40) == 0)
  {
LABEL_17:
    if ((v15 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  -[UNCSectionInfo setContentPreviewSetting:](v13, "setContentPreviewSetting:", objc_msgSend(v12, "contentPreviewSetting"));
  if ((v15 & 0x400) == 0)
  {
LABEL_18:
    if ((v15 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  -[UNCSectionInfo setAnnounceSetting:](v13, "setAnnounceSetting:", objc_msgSend(v12, "announceSetting"));
  if ((v15 & 0x80) == 0)
  {
LABEL_19:
    if ((v15 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  -[UNCSectionInfo setCarPlaySetting:](v13, "setCarPlaySetting:", objc_msgSend(v12, "carPlaySetting"));
  if ((v15 & 0x10000) == 0)
  {
LABEL_20:
    if ((v15 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  -[UNCSectionInfo setRemoteNotificationsSetting:](v13, "setRemoteNotificationsSetting:", objc_msgSend(v12, "remoteNotificationsSetting"));
  if ((v15 & 0x100) == 0)
  {
LABEL_21:
    if ((v15 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  -[UNCSectionInfo setCriticalAlertSetting:](v13, "setCriticalAlertSetting:", objc_msgSend(v12, "criticalAlertSetting"));
  if ((v15 & 0x800) == 0)
  {
LABEL_22:
    if ((v15 & 0x1000) == 0)
      goto LABEL_23;
LABEL_59:
    -[UNCSectionInfo setScheduledDeliverySetting:](v13, "setScheduledDeliverySetting:", objc_msgSend(v12, "scheduledDeliverySetting"));
    if ((v15 & 0x8000) == 0)
      goto LABEL_129;
    goto LABEL_60;
  }
LABEL_58:
  -[UNCSectionInfo setTimeSensitiveSetting:](v13, "setTimeSensitiveSetting:", objc_msgSend(v12, "timeSensitiveSetting"));
  if ((v15 & 0x1000) != 0)
    goto LABEL_59;
LABEL_23:
  if ((v15 & 0x8000) != 0)
LABEL_60:
    -[UNCSectionInfo setDirectMessagesSetting:](v13, "setDirectMessagesSetting:", objc_msgSend(v12, "directMessagesSetting"));
LABEL_129:
  if (-[UNCSectionInfo isRestricted](v11, "isRestricted"))
  {
    if (!v13)
      v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    -[UNCSectionInfo setAuthorizationStatus:](v13, "setAuthorizationStatus:", 1);
  }
  if (!-[UNCSectionInfo allowsNotifications](v11, "allowsNotifications"))
  {
    if (!v13)
      v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
LABEL_139:
    if (!objc_msgSend(v12, "allowsNotifications")
      || (objc_msgSend(v12, "pushSettings") & 1) == 0
      || (objc_msgSend(v12, "suppressedSettings") & 0x2000) != 0
      || (-[UNCSectionInfo suppressedSettings](v11, "suppressedSettings") & 0x2000) != 0)
    {
      v37 = -57;
    }
    else
    {
      v37 = -49;
    }
    -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", -[UNCSectionInfo pushSettings](v11, "pushSettings") & v37);
    -[UNCSectionInfo setAlertType:](v13, "setAlertType:", 0);
    -[UNCSectionInfo setNotificationCenterSetting:](v13, "setNotificationCenterSetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo notificationCenterSetting](v11, "notificationCenterSetting")));
    -[UNCSectionInfo setLockScreenSetting:](v13, "setLockScreenSetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo lockScreenSetting](v11, "lockScreenSetting")));
    -[UNCSectionInfo setShowsOnExternalDevices:](v13, "setShowsOnExternalDevices:", 0);
    -[UNCSectionInfo setShowsCustomSettingsLink:](v13, "setShowsCustomSettingsLink:", 0);
    -[UNCSectionInfo setContentPreviewSetting:](v13, "setContentPreviewSetting:", 0);
    -[UNCSectionInfo setAnnounceSetting:](v13, "setAnnounceSetting:", 1);
    -[UNCSectionInfo setCarPlaySetting:](v13, "setCarPlaySetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo carPlaySetting](v11, "carPlaySetting")));
    -[UNCSectionInfo setRemoteNotificationsSetting:](v13, "setRemoteNotificationsSetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo remoteNotificationsSetting](v11, "remoteNotificationsSetting")));
    -[UNCSectionInfo setDirectMessagesSetting:](v13, "setDirectMessagesSetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo directMessagesSetting](v11, "directMessagesSetting")));
    -[UNCSectionInfo setScheduledDeliverySetting:](v13, "setScheduledDeliverySetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo scheduledDeliverySetting](v11, "scheduledDeliverySetting")));
    -[UNCSectionInfo setTimeSensitiveSetting:](v13, "setTimeSensitiveSetting:", -[UNCSectionInfo disabledSettingForSetting:](v11, "disabledSettingForSetting:", -[UNCSectionInfo timeSensitiveSetting](v11, "timeSensitiveSetting")));
LABEL_146:
    if (a4 != -1)
    {
      if ((unint64_t)a4 >= 2)
        goto LABEL_159;
      if (v13)
        goto LABEL_155;
      goto LABEL_154;
    }
    if (v13)
    {
LABEL_157:
      v38 = v13;
      v39 = 0;
      goto LABEL_158;
    }
LABEL_156:
    v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    goto LABEL_157;
  }
  if (v13)
  {
    if (-[UNCSectionInfo allowsNotifications](v13, "allowsNotifications"))
      goto LABEL_146;
    goto LABEL_139;
  }
  if (a4 == -1)
    goto LABEL_156;
  if ((unint64_t)a4 < 2)
  {
LABEL_154:
    v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
LABEL_155:
    v38 = v13;
    v39 = 1;
LABEL_158:
    -[UNCSectionInfo setAnnounceSetting:](v38, "setAnnounceSetting:", v39);
LABEL_159:
    if ((unint64_t)(a5 + 1) < 3)
    {
      if (v13)
        goto LABEL_162;
      goto LABEL_161;
    }
    if (v13)
    {
      if (!v8)
        goto LABEL_170;
      goto LABEL_166;
    }
LABEL_169:
    v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    if (!v8)
      goto LABEL_170;
LABEL_166:
    if (v7)
      goto LABEL_176;
    goto LABEL_173;
  }
  if ((unint64_t)(a5 + 1) >= 3)
    goto LABEL_169;
LABEL_161:
  v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
LABEL_162:
  -[UNCSectionInfo setScheduledDeliverySetting:](v13, "setScheduledDeliverySetting:", 1);
  if (v8)
    goto LABEL_166;
LABEL_170:
  if (!v13)
    v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
  -[UNCSectionInfo setCarPlaySetting:](v13, "setCarPlaySetting:", 0);
  if (!v7)
  {
LABEL_173:
    if (!v13)
      v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    -[UNCSectionInfo setRemoteNotificationsSetting:](v13, "setRemoteNotificationsSetting:", 0);
  }
LABEL_176:
  if (v13)
    v40 = v13;
  else
    v40 = v11;
  v41 = v40;
  if (!-[UNCSectionInfo contentPreviewSetting](v41, "contentPreviewSetting"))
  {
    if (!v13)
      v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    -[UNCSectionInfo setContentPreviewSetting:](v13, "setContentPreviewSetting:", a3);
  }
  if (-[UNCSectionInfo authorizationStatus](v41, "authorizationStatus") == 4)
  {
    if (!v13)
      v13 = -[UNCSectionInfo copyFromManagedSettings](v11, "copyFromManagedSettings");
    -[UNCSectionInfo sectionInfoSettings](v11, "sectionInfoSettings");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isAuthorizedTemporarily"))
      v43 = 2;
    else
      v43 = 0;

    -[UNCSectionInfo setAuthorizationStatus:](v13, "setAuthorizationStatus:", v43);
  }
  if (v13)
    v44 = v13;
  else
    v44 = v11;
  v45 = v44;

  return v45;
}

- (int64_t)disabledSettingForSetting:(int64_t)a3
{
  return a3 != 0;
}

- (id)effectiveSectionInfoWithFactoryInfo:(id)a3 defaultContentPreviewSetting:(int64_t)a4 globalAnnounceSetting:(int64_t)a5 globalScheduledDeliverySetting:(int64_t)a6 hasPairedVehiclesForCarPlay:(BOOL)a7 hasDestinationForRemoteNotifications:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  UNCSectionInfo *v23;
  int64_t v25;
  int64_t v26;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  if (!v14)
    goto LABEL_9;
  -[UNCSectionInfo factorySectionID](self, "factorySectionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v14, "dataProviderIDs");
  v25 = a6;
  v26 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo sectionID](self, "sectionID");
  v18 = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "containsObject:", v19);

  if ((v20 & 1) == 0)
  {
LABEL_9:
    v23 = self;
    goto LABEL_10;
  }
  v21 = (void *)-[UNCSectionInfo copy](self, "copy");
  if (objc_msgSend(v21, "suppressFromSettings") && (objc_msgSend(v14, "suppressFromSettings") & 1) == 0)
  {
    objc_msgSend(v21, "setNotificationCenterSetting:", objc_msgSend(v14, "notificationCenterSetting"));
    objc_msgSend(v21, "setLockScreenSetting:", objc_msgSend(v14, "lockScreenSetting"));
    if (objc_msgSend(v21, "showsOnExternalDevices"))
      v22 = objc_msgSend(v14, "showsOnExternalDevices");
    else
      v22 = 0;
    objc_msgSend(v21, "setShowsOnExternalDevices:", v22);
    objc_msgSend(v21, "setContentPreviewSetting:", objc_msgSend(v14, "contentPreviewSetting"));
    objc_msgSend(v21, "setPushSettings:", objc_msgSend(v14, "pushSettings"));
    objc_msgSend(v21, "setAlertType:", objc_msgSend(v14, "alertType"));
    objc_msgSend(v21, "setAuthorizationStatus:", objc_msgSend(v14, "authorizationStatus"));
    objc_msgSend(v21, "setCarPlaySetting:", objc_msgSend(v14, "carPlaySetting"));
    objc_msgSend(v21, "setRemoteNotificationsSetting:", objc_msgSend(v14, "remoteNotificationsSetting"));
    objc_msgSend(v21, "setAnnounceSetting:", objc_msgSend(v14, "announceSetting"));
    objc_msgSend(v21, "setCriticalAlertSetting:", objc_msgSend(v14, "criticalAlertSetting"));
    objc_msgSend(v21, "setTimeSensitiveSetting:", objc_msgSend(v14, "timeSensitiveSetting"));
    objc_msgSend(v21, "setScheduledDeliverySetting:", objc_msgSend(v14, "scheduledDeliverySetting"));
    objc_msgSend(v21, "setDirectMessagesSetting:", objc_msgSend(v14, "directMessagesSetting"));
  }
  objc_msgSend(v21, "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", a4, v26, v25, v9, v18);
  v23 = (UNCSectionInfo *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v23;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subsectionID
{
  return self->_subsectionID;
}

- (void)setSubsectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isModificationAllowed
{
  return self->_isModificationAllowed;
}

- (void)setIsModificationAllowed:(BOOL)a3
{
  self->_isModificationAllowed = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (int64_t)sectionCategory
{
  return self->_sectionCategory;
}

- (void)setSectionCategory:(int64_t)a3
{
  self->_sectionCategory = a3;
}

- (BOOL)suppressFromSettings
{
  return self->_suppressFromSettings;
}

- (void)setSuppressFromSettings:(BOOL)a3
{
  self->_suppressFromSettings = a3;
}

- (UNCSectionInfoSettings)sectionInfoSettings
{
  return self->_sectionInfoSettings;
}

- (void)setSectionInfoSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)pathToWeeAppPluginBundle
{
  return self->_pathToWeeAppPluginBundle;
}

- (void)setPathToWeeAppPluginBundle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UNCSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UNCSectionInfo)parentSection
{
  return (UNCSectionInfo *)objc_loadWeakRetained((id *)&self->_parentSection);
}

- (int64_t)subsectionPriority
{
  return self->_subsectionPriority;
}

- (void)setSubsectionPriority:(int64_t)a3
{
  self->_subsectionPriority = a3;
}

- (unint64_t)suppressedSettings
{
  return self->_suppressedSettings;
}

- (void)setSuppressedSettings:(unint64_t)a3
{
  self->_suppressedSettings = a3;
}

- (BOOL)hideWeeApp
{
  return self->_hideWeeApp;
}

- (void)setHideWeeApp:(BOOL)a3
{
  self->_hideWeeApp = a3;
}

- (NSString)factorySectionID
{
  return self->_factorySectionID;
}

- (void)setFactorySectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)dataProviderIDs
{
  return self->_dataProviderIDs;
}

- (void)setDataProviderIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)customSettingsBundle
{
  return self->_customSettingsBundle;
}

- (void)setCustomSettingsBundle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)customSettingsDetailControllerClass
{
  return self->_customSettingsDetailControllerClass;
}

- (void)setCustomSettingsDetailControllerClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSettingsDetailControllerClass, 0);
  objc_storeStrong((id *)&self->_customSettingsBundle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_dataProviderIDs, 0);
  objc_storeStrong((id *)&self->_factorySectionID, 0);
  objc_destroyWeak((id *)&self->_parentSection);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pathToWeeAppPluginBundle, 0);
  objc_storeStrong((id *)&self->_managedSectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_sectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_subsectionID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

+ (id)defaultSectionInfoForSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "defaultSectionInfo"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[UNCSectionInfo defaultSectionInfoForType:](UNCSectionInfo, "defaultSectionInfoForType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionID:", v5);
  v12 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v12);
  v7 = v12;
  if (v6)
  {
    objc_msgSend(v6, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppName:", v8);

    objc_msgSend(v6, "applicationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsRestricted:", objc_msgSend(v9, "isRestricted"));

  }
  else
  {
    v10 = (void *)*MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      +[UNCSectionInfo(DataProviders) defaultSectionInfoForSection:].cold.1((uint64_t)v5, v10, v7);
  }

  return v4;
}

- (void)updateWithDefaultSectionInfo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[UNCSectionInfo alertType](self, "alertType");
  v6 = -[UNCSectionInfo pushSettings](self, "pushSettings");
  v7 = objc_msgSend(v4, "pushSettings");
  v8 = v7;
  if ((v6 & 4) == 0 && (v7 & 4) != 0)
  {
    v5 = objc_msgSend(v4, "alertType");
    v6 |= 0x24uLL;
  }
  if (v6 & 1 | ((v8 & 1) == 0))
    v9 = v6;
  else
    v9 = v6 | 9;
  v10 = (v9 >> 1) & 1;
  if ((v8 & 2) == 0)
    LODWORD(v10) = 1;
  if ((_DWORD)v10)
    v11 = v9;
  else
    v11 = v9 | 0x12;
  v12 = -[UNCSectionInfo suppressedSettings](self, "suppressedSettings");
  v13 = objc_msgSend(v4, "suppressedSettings");
  v14 = v13;
  if ((v12 & 0x2000) == 0 || (v13 & 0x2000) != 0)
  {
LABEL_26:
    if ((v12 & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_27;
  }
  if ((v8 & 1) != 0)
  {
    v11 |= 9uLL;
    goto LABEL_26;
  }
  -[UNCSectionInfo subsections](self, "subsections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
    goto LABEL_26;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[UNCSectionInfo subsections](self, "subsections", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "pushSettings") & 8) != 0)
        {
          v11 |= 9uLL;
          goto LABEL_81;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_81:

  if ((v12 & 0x20) != 0)
  {
LABEL_27:
    if ((v14 & 0x20) == 0)
    {
      v5 = objc_msgSend(v4, "alertType");
      v11 |= 0x24uLL;
    }
  }
LABEL_29:
  -[UNCSectionInfo setAlertType:](self, "setAlertType:", v5);
  -[UNCSectionInfo setPushSettings:](self, "setPushSettings:", v11);
  v22 = -[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting");
  v23 = objc_msgSend(v4, "lockScreenSetting");
  if (v22)
    v25 = ((v14 & 2) == 0) & (v12 >> 1);
  else
    v25 = 1;
  if (v25 == 1)
  {
    v24 = v23;
    if (v23)
      -[UNCSectionInfo setLockScreenSetting:](self, "setLockScreenSetting:", v23);
  }
  v26 = -[UNCSectionInfo notificationCenterSetting](self, "notificationCenterSetting", v24);
  v27 = objc_msgSend(v4, "notificationCenterSetting");
  if (v26)
    v29 = v12 & ((v14 & 1) == 0);
  else
    v29 = 1;
  if (v29 == 1)
  {
    v28 = v27;
    if (v27)
      -[UNCSectionInfo setNotificationCenterSetting:](self, "setNotificationCenterSetting:", v27);
  }
  v30 = -[UNCSectionInfo carPlaySetting](self, "carPlaySetting", v28);
  v31 = objc_msgSend(v4, "carPlaySetting");
  if (v30)
    v33 = ((v14 & 0x80) == 0) & (v12 >> 7);
  else
    v33 = 1;
  if (v33 == 1)
  {
    v32 = v31;
    if (v31)
      -[UNCSectionInfo setCarPlaySetting:](self, "setCarPlaySetting:", v31);
  }
  v34 = -[UNCSectionInfo remoteNotificationsSetting](self, "remoteNotificationsSetting", v32);
  v35 = objc_msgSend(v4, "remoteNotificationsSetting");
  if (v34)
    v37 = ((*(_QWORD *)&v14 & 0x10000) == 0) & HIWORD(v12);
  else
    v37 = 1;
  if (v37 == 1)
  {
    v36 = v35;
    if (v35)
      -[UNCSectionInfo setRemoteNotificationsSetting:](self, "setRemoteNotificationsSetting:", v35);
  }
  v38 = -[UNCSectionInfo announceSetting](self, "announceSetting", v36);
  v39 = objc_msgSend(v4, "announceSetting");
  if (!v38)
  {
    v40 = v39;
    if (v39)
      -[UNCSectionInfo setAnnounceSetting:](self, "setAnnounceSetting:", v39);
  }
  v41 = -[UNCSectionInfo criticalAlertSetting](self, "criticalAlertSetting", v40);
  v42 = objc_msgSend(v4, "criticalAlertSetting");
  if (!v41)
  {
    v43 = v42;
    if (v42)
      -[UNCSectionInfo setCriticalAlertSetting:](self, "setCriticalAlertSetting:", v42);
  }
  v44 = -[UNCSectionInfo timeSensitiveSetting](self, "timeSensitiveSetting", v43);
  v45 = objc_msgSend(v4, "timeSensitiveSetting");
  if (!v44)
  {
    v46 = v45;
    if (v45)
      -[UNCSectionInfo setTimeSensitiveSetting:](self, "setTimeSensitiveSetting:", v45);
  }
  v47 = -[UNCSectionInfo directMessagesSetting](self, "directMessagesSetting", v46);
  v48 = objc_msgSend(v4, "directMessagesSetting");
  if (!v47)
  {
    v49 = v48;
    if (v48)
      -[UNCSectionInfo setDirectMessagesSetting:](self, "setDirectMessagesSetting:", v48);
  }
  if (!-[UNCSectionInfo showsCustomSettingsLink](self, "showsCustomSettingsLink", v49))
    -[UNCSectionInfo setShowsCustomSettingsLink:](self, "setShowsCustomSettingsLink:", objc_msgSend(v4, "showsCustomSettingsLink"));
  -[UNCSectionInfo parentSection](self, "parentSection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50 || (v12 & 0x23) != 0)
  {

  }
  else
  {

    if ((v14 & 0x23) != 0)
    {
      if (-[UNCSectionInfo allowsNotifications](self, "allowsNotifications"))
      {
        if (-[UNCSectionInfo lockScreenSetting](self, "lockScreenSetting") != 2
          && -[UNCSectionInfo notificationCenterSetting](self, "notificationCenterSetting") != 2
          && !-[UNCSectionInfo alertType](self, "alertType"))
        {
          -[UNCSectionInfo setAllowsNotifications:](self, "setAllowsNotifications:", 0);
        }
      }
      else if ((-[UNCSectionInfo suppressedSettings](self, "suppressedSettings") & 0x2000) == 0
             && (-[UNCSectionInfo pushSettings](self, "pushSettings") & 1) != 0)
      {
        -[UNCSectionInfo setPushSettings:](self, "setPushSettings:", -[UNCSectionInfo pushSettings](self, "pushSettings") & 0xFFFFFFFFFFFFFFF7);
      }
    }
  }
  -[UNCSectionInfo setSuppressFromSettings:](self, "setSuppressFromSettings:", objc_msgSend(v4, "suppressFromSettings"));
  -[UNCSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", objc_msgSend(v4, "suppressedSettings"));
  -[UNCSectionInfo setSectionType:](self, "setSectionType:", objc_msgSend(v4, "sectionType"));
  -[UNCSectionInfo setIsAppClip:](self, "setIsAppClip:", objc_msgSend(v4, "isAppClip"));
  -[UNCSectionInfo setSectionCategory:](self, "setSectionCategory:", objc_msgSend(v4, "sectionCategory"));
  -[UNCSectionInfo setSubsectionPriority:](self, "setSubsectionPriority:", objc_msgSend(v4, "subsectionPriority"));
  -[UNCSectionInfo setVersion:](self, "setVersion:", objc_msgSend(v4, "version"));
  objc_msgSend(v4, "appName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo setAppName:](self, "setAppName:", v51);

  objc_msgSend(v4, "displayName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo setDisplayName:](self, "setDisplayName:", v52);

  objc_msgSend(v4, "icon");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo setIcon:](self, "setIcon:", v53);

  -[UNCSectionInfo setIsRestricted:](self, "setIsRestricted:", objc_msgSend(v4, "isRestricted"));
  objc_msgSend(v4, "customSettingsBundle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo setCustomSettingsBundle:](self, "setCustomSettingsBundle:", v54);

  objc_msgSend(v4, "customSettingsDetailControllerClass");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo setCustomSettingsDetailControllerClass:](self, "setCustomSettingsDetailControllerClass:", v55);

}

- (void)queryAndUseManagedSettings
{
  id v3;

  -[UNCSectionInfo sectionID](self, "sectionID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfo queryAndUseManagedSettingsForSectionID:](self, "queryAndUseManagedSettingsForSectionID:", v3);

}

- (void)queryAndUseManagedSettingsForSectionID:(id)a3
{
  id v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[UNCSectionInfoSettings sectionInfoSettingsForManagedBundleID:](UNCSectionInfoSettings, "sectionInfoSettingsForManagedBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x24BDF89F8];
  if (v5)
  {
    v7 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Managed settings found for section %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  -[UNCSectionInfo setManagedSectionInfoSettings:](self, "setManagedSectionInfoSettings:", v5);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNotificationsModificationAllowedForBundleID:", v4);

  if ((v9 & 1) == 0)
  {
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "Modification not allowed for section %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  -[UNCSectionInfo setIsModificationAllowed:](self, "setIsModificationAllowed:", v9 ^ 1u);

}

- (UNCSectionInfoSettings)managedSectionInfoSettings
{
  return self->_managedSectionInfoSettings;
}

- (void)setManagedSectionInfoSettings:(id)a3
{
  id v4;
  UNCSectionInfoSettings *v5;
  UNCSectionInfoSettings *managedSectionInfoSettings;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (UNCSectionInfoSettings *)objc_msgSend(v4, "copy");
  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  self->_managedSectionInfoSettings = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_subsections;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setManagedSectionInfoSettings:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)usesManagedSettings
{
  return self->_managedSectionInfoSettings != 0;
}

- (UNCSectionInfoSettings)readableSettings
{
  UNCSectionInfoSettings *managedSectionInfoSettings;

  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (!managedSectionInfoSettings)
    managedSectionInfoSettings = self->_sectionInfoSettings;
  return managedSectionInfoSettings;
}

- (UNCSectionInfoSettings)writableSettings
{
  if (self->_managedSectionInfoSettings)
    return (UNCSectionInfoSettings *)0;
  else
    return self->_sectionInfoSettings;
}

- (id)copyFromManagedSettings
{
  void *v2;
  void *v3;

  v2 = (void *)-[UNCSectionInfo copy](self, "copy");
  if (objc_msgSend(v2, "usesManagedSettings"))
  {
    objc_msgSend(v2, "managedSectionInfoSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSectionInfoSettings:", v3);

    objc_msgSend(v2, "setManagedSectionInfoSettings:", 0);
  }
  return v2;
}

- (BOOL)allowsNotifications
{
  void *v2;
  char v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsNotifications");

  return v3;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsNotifications:", v3);

}

- (NSDate)authorizationExpirationDate
{
  void *v2;
  void *v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthorizationExpirationDate:", v4);

}

- (int64_t)authorizationStatus
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  return v3;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthorizationStatus:", a3);

}

- (NSDate)lastUserGrantedAuthorizationDate
{
  void *v2;
  void *v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUserGrantedAuthorizationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUserGrantedAuthorizationDate:", v4);

}

- (UNCMuteAssertion)muteAssertion
{
  void *v2;
  void *v3;

  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "muteAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNCMuteAssertion *)v3;
}

- (void)setMuteAssertion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMuteAssertion:", v4);

}

- (int64_t)notificationCenterSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationCenterSetting");

  return v3;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationCenterSetting:", a3);

}

- (BOOL)showsInNotificationCenter
{
  void *v2;
  char v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsInNotificationCenter");

  return v3;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsInNotificationCenter:", v3);

}

- (int64_t)lockScreenSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockScreenSetting");

  return v3;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockScreenSetting:", a3);

}

- (BOOL)showsInLockScreen
{
  void *v2;
  char v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsInLockScreen");

  return v3;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsInLockScreen:", v3);

}

- (unint64_t)alertType
{
  void *v2;
  unint64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alertType");

  return v3;
}

- (void)setAlertType:(unint64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlertType:", a3);

}

- (unint64_t)pushSettings
{
  void *v2;
  unint64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pushSettings");

  return v3;
}

- (void)setPushSettings:(unint64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPushSettings:", a3);

}

- (int64_t)carPlaySetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "carPlaySetting");

  return v3;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCarPlaySetting:", a3);

}

- (int64_t)remoteNotificationsSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "remoteNotificationsSetting");

  return v3;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteNotificationsSetting:", a3);

}

- (int64_t)spokenNotificationSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spokenNotificationSetting");

  return v3;
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationSetting:", a3);

}

- (int64_t)criticalAlertSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "criticalAlertSetting");

  return v3;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCriticalAlertSetting:", a3);

}

- (int64_t)timeSensitiveSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeSensitiveSetting");

  return v3;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeSensitiveSetting:", a3);

}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  void *v2;
  char v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUserConfiguredTimeSensitiveSetting");

  return v3;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserConfiguredTimeSensitiveSetting:", v3);

}

- (int64_t)bulletinGroupingSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bulletinGroupingSetting");

  return v3;
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBulletinGroupingSetting:", a3);

}

- (int64_t)announceSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "announceSetting");

  return v3;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceSetting:", a3);

}

- (int64_t)scheduledDeliverySetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduledDeliverySetting");

  return v3;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScheduledDeliverySetting:", a3);

}

- (int64_t)directMessagesSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "directMessagesSetting");

  return v3;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDirectMessagesSetting:", a3);

}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  void *v2;
  char v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUserConfiguredDirectMessagesSetting");

  return v3;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserConfiguredDirectMessagesSetting:", v3);

}

- (BOOL)showsOnExternalDevices
{
  void *v2;
  char v3;

  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsOnExternalDevices");

  return v3;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsOnExternalDevices:", v3);

}

- (int64_t)contentPreviewSetting
{
  void *v2;
  int64_t v3;

  -[UNCSectionInfo readableSettings](self, "readableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentPreviewSetting");

  return v3;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  id v4;

  -[UNCSectionInfo writableSettings](self, "writableSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentPreviewSetting:", a3);

}

- (BOOL)showsMessagePreview
{
  void *v2;
  char v3;

  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsMessagePreview");

  return v3;
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsMessagePreview:", v3);

}

- (BOOL)showsCustomSettingsLink
{
  void *v2;
  char v3;

  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsCustomSettingsLink");

  return v3;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UNCSectionInfo sectionInfoSettings](self, "sectionInfoSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsCustomSettingsLink:", v3);

}

@end
