@implementation BBSectionInfo(UserNotificationsServer)

- (void)uns_setPropertiesFromTopicRecord:()UserNotificationsServer
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend(a1, "setAllowsNotifications:", objc_msgSend(v14, "enablesAlerts"));
  if (objc_msgSend(v14, "supportsAlerts"))
  {
    if (objc_msgSend(v14, "enablesAlerts"))
    {
      if (objc_msgSend(v14, "modalAlertStyle"))
        v4 = 2;
      else
        v4 = 1;
      v5 = 36;
    }
    else
    {
      v4 = 0;
      v5 = 4;
    }
  }
  else
  {
    v5 = 0;
    v4 = 1;
  }
  if (objc_msgSend(v14, "supportsBadges"))
  {
    v6 = objc_msgSend(v14, "enablesBadges");
    v7 = 9;
    if (!v6)
      v7 = 1;
    v5 |= v7;
  }
  if (objc_msgSend(v14, "supportsSounds"))
  {
    v8 = objc_msgSend(v14, "enablesSounds");
    v9 = 2;
    if (v8)
      v9 = 18;
    v5 |= v9;
  }
  if (objc_msgSend(v14, "supportsLockScreen"))
  {
    if (objc_msgSend(v14, "enablesLockScreen"))
      v10 = 2;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v14, "supportsNotificationCenter"))
  {
    if (objc_msgSend(v14, "enablesNotificationCenter"))
      v11 = 2;
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v14, "supportsCarPlay"))
  {
    if (objc_msgSend(v14, "enablesCarPlay"))
      v12 = 2;
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v14, "supportsTimeSensitive"))
  {
    if (objc_msgSend(v14, "enablesTimeSensitive"))
      v13 = 2;
    else
      v13 = 1;
  }
  else
  {
    v13 = 1;
  }
  if (objc_msgSend(v14, "supportsSpoken"))
  {
    if (!objc_msgSend(v14, "enablesSpoken"))
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a1, "setPushSettings:", v5);
  objc_msgSend(a1, "setLockScreenSetting:", v10);
  objc_msgSend(a1, "setNotificationCenterSetting:", v11);
  objc_msgSend(a1, "setCarPlaySetting:", v12);
  objc_msgSend(a1, "setRemoteNotificationsSetting:", 2);
  objc_msgSend(a1, "setAnnounceSetting:", v13);
  objc_msgSend(a1, "setAlertType:", v4);
  objc_msgSend(a1, "setSubsectionPriority:", objc_msgSend(v14, "priority"));

}

- (uint64_t)uns_setPropertiesFromAuthorizationOptions:()UserNotificationsServer supportsProvisionalAlerts:
{
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v7 = objc_msgSend(a1, "pushSettings");
  v8 = objc_msgSend(a1, "authorizationStatus");
  v9 = objc_msgSend(a1, "carPlaySetting");
  v10 = v9;
  if ((a3 & 8) != 0 && !v9)
  {
    if (objc_msgSend(a1, "authorizationStatus") == 3)
      v11 = a4;
    else
      v11 = 1;
    if (v11)
      v10 = 2;
    else
      v10 = 1;
  }
  v12 = objc_msgSend(a1, "remoteNotificationsSetting");
  if (!v12)
  {
    if (objc_msgSend(a1, "authorizationStatus") == 3)
      v13 = a4;
    else
      v13 = 1;
    if (v13)
      v12 = 2;
    else
      v12 = 1;
  }
  v14 = objc_msgSend(a1, "criticalAlertSetting");
  v15 = objc_msgSend(a1, "timeSensitiveSetting");
  v16 = objc_msgSend(a1, "announceSetting");
  if (!v16)
  {
    if (v15 >= 2)
    {
      if (objc_msgSend(a1, "authorizationStatus") == 3)
        v17 = a4;
      else
        v17 = 1;
      if (v17)
        v16 = 2;
      else
        v16 = 1;
    }
    else
    {
      v16 = 1;
    }
  }
  if (v8 == 3)
    v18 = a4;
  else
    v18 = 1;
  if (v18)
    v19 = (v7 | (8 * ((v7 & 7 | a3) ^ v7))) & 0x38;
  else
    v19 = 0;
  v20 = v19 & 0xFFFFFFFFFFFFFFF8 | v7 & 7 | a3 & 7;
  v21 = (a3 >> 5) & 1 | objc_msgSend(a1, "showsCustomSettingsLink");
  if (((v14 == 0) & (a3 >> 4)) != 0)
    v22 = 2;
  else
    v22 = v14;
  objc_msgSend(a1, "setPushSettings:", v20);
  objc_msgSend(a1, "setCarPlaySetting:", v10);
  objc_msgSend(a1, "setRemoteNotificationsSetting:", v12);
  objc_msgSend(a1, "setAnnounceSetting:", v16);
  objc_msgSend(a1, "setCriticalAlertSetting:", v22);
  objc_msgSend(a1, "setTimeSensitiveSetting:", v15);
  return objc_msgSend(a1, "setShowsCustomSettingsLink:", v21);
}

- (uint64_t)uns_notificationSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = objc_msgSend(a1, "alertType");
  v3 = objc_msgSend(a1, "pushSettings");
  v4 = objc_msgSend(a1, "authorizationStatus");
  if ((unint64_t)(v4 - 1) >= 3)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(a1, "sectionInfoSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAuthorizedTemporarily");

  if (v7)
    v8 = 4;
  else
    v8 = v5;
  v9 = v3 << 61;
  v10 = 2 * (v2 == 2);
  if (v2 == 1)
    v10 = 1;
  v32 = v10 & (v9 >> 63);
  v33 = v8;
  v31 = UNShowPreviewsSettingFromBBContentPreviewSetting(objc_msgSend(a1, "contentPreviewSetting"));
  v11 = UNNotificationGroupingSettingFromBBBulletinGroupingSetting(objc_msgSend(a1, "bulletinGroupingSetting"));
  if ((v3 & 0x10) != 0)
    v12 = 2;
  else
    v12 = 1;
  v13 = v12 & (v3 << 62 >> 63);
  if ((v3 & 8) != 0)
    v14 = 2;
  else
    v14 = 1;
  v29 = (v3 << 63 >> 63) & v14;
  v30 = v13;
  if (v2)
    v15 = 2;
  else
    v15 = 1;
  v27 = v11;
  v28 = v15 & (v9 >> 63);
  v16 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "notificationCenterSetting"));
  v17 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "lockScreenSetting"));
  v18 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "carPlaySetting"));
  v19 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "remoteNotificationsSetting"));
  v20 = objc_msgSend(a1, "uns_notificationSettingForBBSectionAnnounceSetting:", objc_msgSend(a1, "announceSetting"));
  v21 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "criticalAlertSetting"));
  v22 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "timeSensitiveSetting"));
  v23 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "scheduledDeliverySetting"));
  v24 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "directMessagesSetting"));
  LOBYTE(v26) = objc_msgSend(a1, "showsCustomSettingsLink");
  return objc_msgSend(MEMORY[0x24BDF8868], "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v33, v30, v29, v28, v16, v17, v18, v19, v20, v21, v22, v23, v24, v32,
           v31,
           v27,
           v26);
}

- (uint64_t)uns_notificationSettingForBBSectionInfoSetting:()UserNotificationsServer
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (uint64_t)uns_notificationSettingForBBSectionAnnounceSetting:()UserNotificationsServer
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_216E052F8[a3 - 1];
}

- (void)uns_setPropertiesFromNotificationSettings:()UserNotificationsServer systemSettings:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_msgSend(v23, "authorizationStatus");
  if ((unint64_t)(v7 - 1) >= 4)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(a1, "setAuthorizationStatus:", v8);
  v9 = objc_msgSend(v23, "soundSetting");
  v10 = 2;
  if (v9 == 2)
    v10 = 18;
  if (v9)
    v11 = v10;
  else
    v11 = 0;
  v12 = objc_msgSend(v23, "alertSetting");
  v13 = 4;
  if (v12 == 2)
    v13 = 36;
  if (!v12)
    v13 = 0;
  v14 = v13 | v11;
  v15 = objc_msgSend(v23, "badgeSetting");
  v16 = 9;
  if (v15 != 2)
    v16 = 1;
  if (!v15)
    v16 = 0;
  objc_msgSend(a1, "setPushSettings:", v14 | v16);
  v17 = objc_msgSend(v23, "alertStyle");
  v18 = 1;
  if (v17 == 2)
    v18 = 2;
  if (v17)
    v19 = v18;
  else
    v19 = 0;
  objc_msgSend(a1, "setAlertType:", v19);
  v20 = BBContentPreviewSettingFromUNShowPreviewsSetting(objc_msgSend(v23, "showPreviewsSetting"));
  v21 = objc_msgSend(v6, "showPreviewsSetting");

  if (v20 == BBContentPreviewSettingFromUNShowPreviewsSetting(v21))
    v22 = 0;
  else
    v22 = v20;
  objc_msgSend(a1, "setContentPreviewSetting:", v22);
  objc_msgSend(a1, "setBulletinGroupingSetting:", BBBulletinGroupingSettingFromUNNotificationGroupingSetting(objc_msgSend(v23, "groupingSetting")));
  objc_msgSend(a1, "setNotificationCenterSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "notificationCenterSetting")));
  objc_msgSend(a1, "setLockScreenSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "lockScreenSetting")));
  objc_msgSend(a1, "setCarPlaySetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "carPlaySetting")));
  objc_msgSend(a1, "setRemoteNotificationsSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "remoteNotificationsSetting")));
  objc_msgSend(a1, "setCriticalAlertSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "criticalAlertSetting")));
  objc_msgSend(a1, "setShowsCustomSettingsLink:", objc_msgSend(v23, "providesAppNotificationSettings"));
  if (objc_msgSend(v23, "announcementSetting"))
    objc_msgSend(a1, "setAnnounceSetting:", objc_msgSend(a1, "uns_BBSectionAnnounceSettingForUNNotificationSetting:", objc_msgSend(v23, "announcementSetting")));
  if (objc_msgSend(v23, "scheduledDeliverySetting"))
    objc_msgSend(a1, "setScheduledDeliverySetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "scheduledDeliverySetting")));

}

- (uint64_t)uns_BBSectionInfoSettingForUNNotificationSetting:()UserNotificationsServer
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (uint64_t)uns_BBSectionAnnounceSettingForUNNotificationSetting:()UserNotificationsServer
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 2)
    return a3 == 1;
  if (objc_msgSend(a1, "timeSensitiveSetting", v3, v4) == 2)
    return 2;
  return 3;
}

- (void)uns_setPropertiesFromSourceSettingsDescription:()UserNotificationsServer
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  if (objc_msgSend(v18, "supportsAlerts"))
  {
    if (objc_msgSend(v18, "modalAlertStyle"))
      v4 = 2;
    else
      v4 = 1;
    v5 = 36;
  }
  else
  {
    v5 = 0;
    v4 = 1;
  }
  if (objc_msgSend(v18, "supportsBadges"))
    v5 |= 9uLL;
  if (objc_msgSend(v18, "supportsSounds"))
    v6 = v5 | 0x12;
  else
    v6 = v5;
  if (objc_msgSend(v18, "supportsLockScreen"))
    v7 = 2;
  else
    v7 = 0;
  if (objc_msgSend(v18, "supportsNotificationCenter"))
    v8 = 2;
  else
    v8 = 0;
  if (objc_msgSend(v18, "supportsCarPlay"))
    v9 = 2;
  else
    v9 = 0;
  v10 = objc_msgSend(v18, "supportsTimeSensitive");
  v11 = objc_msgSend(v18, "supportsSpoken");
  v12 = v10 == 0;
  if (v10)
    v13 = 2;
  else
    v13 = 0;
  v14 = 1;
  if (!v12)
    v14 = 2;
  if (v11)
    v15 = v14;
  else
    v15 = 0;
  v16 = objc_msgSend(v18, "alwaysShowPreviews");
  v17 = objc_msgSend(v18, "providesAppNotificationSettings");
  objc_msgSend(a1, "setPushSettings:", v6);
  objc_msgSend(a1, "setLockScreenSetting:", v7);
  objc_msgSend(a1, "setNotificationCenterSetting:", v8);
  objc_msgSend(a1, "setCarPlaySetting:", v9);
  objc_msgSend(a1, "setRemoteNotificationsSetting:", 2);
  objc_msgSend(a1, "setAnnounceSetting:", v15);
  objc_msgSend(a1, "setAlertType:", v4);
  objc_msgSend(a1, "setContentPreviewSetting:", v16);
  objc_msgSend(a1, "setShowsCustomSettingsLink:", v17);
  objc_msgSend(a1, "setTimeSensitiveSetting:", v13);

}

- (id)uns_notificationSource
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "uns_notificationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uns_topicSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBF9D8]);
  objc_msgSend(a1, "_uns_muteAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithNotificationSettings:topicSettings:muteAssertion:isRestricted:", v2, v3, v5, *(_QWORD *)&a1[*MEMORY[0x24BE0FED0]] != 0);

  objc_msgSend(a1, "uns_settingsIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(a1, "displayName");
  else
    objc_msgSend(a1, "appName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BEBF9C8]);
  objc_msgSend(a1, "sectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "suppressFromSettings");
  objc_msgSend(a1, "uns_bundlePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithIdentifier:isHidden:displayName:icon:settings:bundlePath:", v11, v12, v9, v7, v6, v13);

  return v14;
}

- (id)uns_settingsIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bestVariantForFormat:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDF8850];
    objc_msgSend(a1, "iconData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconWithData:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "bundlePath");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          objc_msgSend(v3, "imageName"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      v13 = (void *)MEMORY[0x24BDF8850];
      objc_msgSend(v3, "imageName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iconNamed:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "imagePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v8 = 0;
        goto LABEL_4;
      }
      v15 = (void *)MEMORY[0x24BDF8850];
      objc_msgSend(v3, "imagePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "iconAtPath:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

LABEL_4:
  return v8;
}

- (id)uns_bundlePath
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "icon");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_bestVariantForFormat:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uns_topicSettings
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + (int)*MEMORY[0x24BE0FED8]);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x24BDF8878];
        objc_msgSend(v7, "subsectionID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topicWithIdentifier:displayName:priority:sortIdentifier:", v9, v10, objc_msgSend(v7, "subsectionPriority"), &stru_24D63B158);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "uns_notificationSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_uns_muteAssertion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF9F0]), "initWithTopic:settings:muteAssertion:", v11, v12, v13);
        objc_msgSend(v2, "addObject:", v14);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)_uns_muteAssertion
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "muteAssertion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x24BEBF9E8];
      objc_msgSend(v1, "expirationDateByThreadID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "threadsMuteAssertionWithExpirationDateByThreadID:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v2 = (void *)MEMORY[0x24BEBF9D0];
  objc_msgSend(v1, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceMuteAssertionUntilDate:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v4;

LABEL_8:
  return v6;
}

@end
