@implementation NCNotificationSectionSettings(Bulletin)

- (uint64_t)showsInLockScreen
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("ShowsInLockScreen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)isScheduledDeliveryEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("ScheduledDeliveryEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)notificationSectionSettingsForBBSectionInfo:()Bulletin
{
  id v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DC5FE0]);
  objc_msgSend(v3, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionIdentifier:", v5);

  objc_msgSend(v3, "subsectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubSectionIdentifier:", v6);

  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "setDisplayName:", v7);
  }
  else
  {
    objc_msgSend(v3, "appName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v8);

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "allowsNotifications"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("NotificationsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "criticalAlertSetting") == 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("CriticalAlertsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "notificationCenterSetting") == 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("ShowsInNotificationCenter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "lockScreenSetting") == 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("ShowsInLockScreen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "contentPreviewSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("ContentPreviewSetting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "subsectionPriority"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("SubSectionPriorty"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "bulletinGroupingSetting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("GroupingSetting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "timeSensitiveSetting") == 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("TimeSensitiveEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasUserConfiguredTimeSensitiveSetting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("UserConfiguredTimeSensitiveSetting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "scheduledDeliverySetting") == 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("ScheduledDeliveryEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "directMessagesSetting") == 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("DirectMessagesEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasUserConfiguredDirectMessagesSetting"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("UserConfiguredDirectMessagesSetting"));

  objc_msgSend(v4, "setSettings:", v9);
  v22 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v3, "subsections", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(MEMORY[0x1E0DC6018], "notificationSectionSettingsForBBSectionInfo:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v25);
  }

  objc_msgSend(v4, "setSubSectionSettings:", v22);
  if ((objc_msgSend(v3, "suppressFromSettings") & 1) != 0)
    v29 = 0;
  else
    v29 = objc_msgSend(v3, "isModificationAllowed") ^ 1;
  objc_msgSend(v4, "setUserConfigurable:", v29);
  objc_msgSend(v3, "icon");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    objc_msgSend(v30, "nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:", 17, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "setSettingsIcon:", v32);

    }
  }
  objc_msgSend(v4, "setShowsCustomSettingsLink:", objc_msgSend(v3, "showsCustomSettingsLink"));
  objc_msgSend(v4, "setHasProvisionalAuthorization:", objc_msgSend(v3, "authorizationStatus") == 3);
  objc_msgSend(v4, "setIsDeliveredQuietly:", objc_msgSend(v3, "isDeliveredQuietly"));
  objc_msgSend(v4, "setIsAppClip:", objc_msgSend(v3, "isAppClip"));
  objc_msgSend(v3, "muteAssertion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v3, "muteAssertion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC6010], "sectionMuteAssertion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0DC6028];
      objc_msgSend(v34, "threadIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "threadsMuteAssertionWithMutedThreadIDs:", v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "setMuteAssertion:", v35);

  }
  return v4;
}

- (uint64_t)showsInNotificationCenter
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("ShowsInNotificationCenter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)notificationsEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NotificationsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)groupingSetting
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("GroupingSetting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return objc_msgSend(a1, "_groupingSettingFromBBGroupingSetting:", v4);
}

- (uint64_t)_groupingSettingFromBBGroupingSetting:()Bulletin
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (uint64_t)criticalAlertsEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CriticalAlertsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)subSectionPriority
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SubSectionPriorty"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (uint64_t)contentPreviewSetting
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ContentPreviewSetting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return objc_msgSend(a1, "_contentPreviewSettingFromBBContentPreviewSetting:", v4);
}

- (id)_notificationSectionSettingsForSubSectionWithIdentifier:()Bulletin
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  objc_msgSend(a1, "subSectionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__NCNotificationSectionSettings_Bulletin___notificationSectionSettingsForSubSectionWithIdentifier___block_invoke;
  v9[3] = &unk_1E8D1CEE0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (uint64_t)contentPreviewSettingForRequestWithSubSectionIdentifiers:()Bulletin
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "_notificationSectionSettingsForSubSectionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            if (!v9 || (v14 = objc_msgSend(v12, "subSectionPriority"), v14 > objc_msgSend(v9, "subSectionPriority")))
            {
              v15 = v13;

              v9 = v15;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v16 = objc_msgSend(v9, "contentPreviewSetting");
  }
  else
  {
    v16 = objc_msgSend(a1, "contentPreviewSetting");
  }

  return v16;
}

- (uint64_t)isTimeSensitiveEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("TimeSensitiveEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)hasUserConfiguredTimeSensitiveSetting
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UserConfiguredTimeSensitiveSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)isDirectMessagesEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("DirectMessagesEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)hasUserConfiguredDirectMessagesSetting
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UserConfiguredDirectMessagesSetting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_contentPreviewSettingFromBBContentPreviewSetting:()Bulletin
{
  uint64_t result;
  void *v6;

  result = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_ERROR))
      -[NCNotificationSectionSettings(Bulletin) _contentPreviewSettingFromBBContentPreviewSetting:].cold.1(v6, a1, a3);
    return 0;
  }
  return result;
}

- (void)_contentPreviewSettingFromBBContentPreviewSetting:()Bulletin .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a3;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Invalid content preview setting (%li) set on Notification Section Setting for section %@", (uint8_t *)&v7, 0x16u);

}

@end
