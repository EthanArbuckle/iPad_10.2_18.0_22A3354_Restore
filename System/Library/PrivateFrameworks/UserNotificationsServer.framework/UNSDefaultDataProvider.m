@implementation UNSDefaultDataProvider

- (id)defaultSectionInfo
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UNCNotificationSourceDescription isRestricted](self->_notificationSourceDescription, "isRestricted");
  v5 = -[UNCNotificationSourceDescription suppressUserAuthorizationPrompt](self->_notificationSourceDescription, "suppressUserAuthorizationPrompt");
  v6 = -[UNCNotificationSourceDescription automaticallyShowSettings](self->_notificationSourceDescription, "automaticallyShowSettings");
  v7 = -[UNCNotificationSourceDescription hideSettings](self->_notificationSourceDescription, "hideSettings");
  if ((_os_feature_enabled_impl() & 1) != 0)
    goto LABEL_2;
  -[UNCNotificationSourceDescription defaultTopics](self->_notificationSourceDescription, "defaultTopics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    -[UNCNotificationTopicRepository topicsForBundleIdentifier:](self->_topicRepository, "topicsForBundleIdentifier:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
LABEL_2:
      v8 = 0;
      goto LABEL_7;
    }
  }
  v8 = -1;
LABEL_7:
  objc_msgSend(MEMORY[0x24BE0FE80], "defaultSectionInfoForType:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSectionID:", v3);
  objc_msgSend(v12, "setIsRestricted:", v4);
  objc_msgSend(v12, "setIsAppClip:", -[UNCNotificationSourceDescription isAppClip](self->_notificationSourceDescription, "isAppClip"));
  if ((v5 & (v7 | v6)) != 0)
    v13 = 2;
  else
    v13 = 0;
  objc_msgSend(v12, "setAuthorizationStatus:", v13);
  objc_msgSend(v12, "setSuppressFromSettings:", v7);
  objc_msgSend(v12, "setSuppressedSettings:", v8);
  -[UNCNotificationSourceDescription customSettingsBundle](self->_notificationSourceDescription, "customSettingsBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSettingsBundle:", v14);

  -[UNCNotificationSourceDescription customSettingsDetailControllerClass](self->_notificationSourceDescription, "customSettingsDetailControllerClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSettingsDetailControllerClass:", v15);

  -[UNCNotificationSourceDescription defaultSettings](self->_notificationSourceDescription, "defaultSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UNCNotificationSourceDescription allowTimeSensitive](self->_notificationSourceDescription, "allowTimeSensitive"))v17 = 2;
  else
    v17 = 0;
  objc_msgSend(v12, "setTimeSensitiveSetting:", v17);
  if (-[UNCNotificationSourceDescription allowMessages](self->_notificationSourceDescription, "allowMessages"))v18 = 2;
  else
    v18 = 0;
  objc_msgSend(v12, "setDirectMessagesSetting:", v18);
  if (objc_msgSend(v12, "timeSensitiveSetting") || objc_msgSend(v12, "directMessagesSetting"))
    objc_msgSend(v12, "setAnnounceSetting:", 2);
  if (v16)
    objc_msgSend(v12, "uns_setPropertiesFromSourceSettingsDescription:", v16);

  return v12;
}

id __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BE0FE80];
  v4 = a2;
  objc_msgSend(v3, "defaultSectionInfoForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubsectionID:", v6);

  objc_msgSend(v5, "uns_setPropertiesFromTopicRecord:", v4);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.mobilemail"));

    if (v8)
      v9 = -8193;
    else
      v9 = -1;
    objc_msgSend(v5, "setSuppressedSettings:", v9);
  }
  return v5;
}

uint64_t __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)displayNameForSubsectionID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UNSDefaultDataProvider _topicForIdentifier:](self, "_topicForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cfBundle");

    objc_msgSend(v4, "displayNameLocalizationKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sectionParameters
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *categoryToParamSubType;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  id obj;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE0FE90]);
  objc_msgSend(v3, "setUsesVariableLayout:", 1);
  if (-[UNCNotificationSourceDescription allowUnlimitedContentBody](self->_notificationSourceDescription, "allowUnlimitedContentBody"))v4 = -1;
  else
    v4 = 4;
  objc_msgSend(v3, "setMessageNumberOfLines:", v4);
  v24 = v3;
  objc_msgSend(v3, "defaultSubtypeParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressesAlertsWhenAppIsActive:", 0);
  objc_msgSend(v5, "setSuppressesTitle:", 1);
  v22 = v5;
  objc_msgSend(v5, "setIPodOutAlertType:", 3);
  -[UNSDefaultDataProvider _allCategories](self, "_allCategories");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v28;
    v6 = 1;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          categoryToParamSubType = self->_categoryToParamSubType;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v6);
          -[NSMutableDictionary setObject:forKey:](categoryToParamSubType, "setObject:forKey:", v11, v9);

          objc_msgSend(v24, "parametersForSubtype:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "privateBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNSDefaultDataProvider bundle](self, "bundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNSDefaultDataProvider _localizeClientString:inBundle:](self, "_localizeClientString:inBundle:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setHiddenPreviewsBodyPlaceholder:", v15);
          objc_msgSend(v8, "summaryFormat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNSDefaultDataProvider bundle](self, "bundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNSDefaultDataProvider _localizeClientString:inBundle:](self, "_localizeClientString:inBundle:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setSubtypeSummaryFormat:", v18);
          if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
          {
            objc_msgSend(v12, "setAllowsAutomaticRemovalFromLockScreen:", objc_msgSend(v8, "preventAutomaticRemovalFromRecent") ^ 1);
            objc_msgSend(v12, "setRevealsAdditionalContentOnPresentation:", objc_msgSend(v8, "revealAdditionalContentWhenPresented"));
            objc_msgSend(v12, "setPlaysMediaWhenRaised:", objc_msgSend(v8, "playMediaWhenRaised"));
            objc_msgSend(v12, "setPreventLock:", objc_msgSend(v8, "preventAutomaticLock"));
            objc_msgSend(v12, "setShouldDismissBulletinWhenClosed:", objc_msgSend(v8, "preventDismissWhenClosed") ^ 1);
            objc_msgSend(v12, "setAllowsPersistentBannersInCarPlay:", objc_msgSend(v8, "shouldAllowPersistentBannersInCarPlay"));
            objc_msgSend(v12, "setAllowsSupplementaryActionsInCarPlay:", objc_msgSend(v8, "shouldAllowActionsInCarPlay"));
            objc_msgSend(v12, "setShowsUnreadIndicatorForNoticesFeed:", objc_msgSend(v8, "alwaysDisplayNotificationsIndicator"));
            objc_msgSend(v12, "setSuppressDelayForForwardedBulletins:", objc_msgSend(v8, "suppressDelayForForwardedNotifications"));
            objc_msgSend(v12, "setHideDismissActionInCarPlay:", objc_msgSend(v8, "suppressDismissActionInCarPlay"));
            objc_msgSend(v12, "setSuppressPresentationInAmbient:", objc_msgSend(v8, "suppressPresentationInAmbient"));
          }
          v19 = objc_msgSend(v8, "privacyOptionShowTitle");
          if (objc_msgSend(v8, "privacyOptionShowSubtitle"))
            v20 = v19 | 2;
          else
            v20 = v19;
          objc_msgSend(v12, "setPrivacySettings:", v20);
          ++v6;

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v26);
  }

  return v24;
}

- (BSCFBundle)bundle
{
  BSCFBundle *bundle;
  UNCLocalizationService *localizationService;
  void *v5;
  BSCFBundle *v6;
  BSCFBundle *v7;

  bundle = self->_bundle;
  if (!bundle)
  {
    bundle = self->_notificationSourceDescription;
    if (bundle)
    {
      localizationService = self->_localizationService;
      -[BSCFBundle bundleIdentifier](bundle, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCLocalizationService bundleWithIdentifier:](localizationService, "bundleWithIdentifier:", v5);
      v6 = (BSCFBundle *)objc_claimAutoreleasedReturnValue();
      v7 = self->_bundle;
      self->_bundle = v6;

      bundle = self->_bundle;
    }
  }
  return bundle;
}

- (id)_localizeClientString:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "un_localizedStringKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "un_localizedStringArguments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cfBundle");
    objc_msgSend(v5, "un_localizedStringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24D63B158, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)defaultSubsectionInfos
{
  id v3;
  void *v4;
  void *v5;
  UNCNotificationTopicRepository *topicRepository;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[UNCNotificationSourceDescription defaultTopics](self->_notificationSourceDescription, "defaultTopics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "bs_map:", &__block_literal_global_5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  topicRepository = self->_topicRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationTopicRepository topicsForBundleIdentifier:](topicRepository, "topicsForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties")&& objc_msgSend(v9, "count"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_3;
    v12[3] = &unk_24D63A368;
    v12[4] = self;
    objc_msgSend(v9, "bs_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  return v3;
}

- (id)_topicForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  UNCNotificationTopicRepository *topicRepository;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[UNCNotificationSourceDescription defaultTopics](self->_notificationSourceDescription, "defaultTopics");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v24 = v10;
            v16 = v5;
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          continue;
        break;
      }
    }

    topicRepository = self->_topicRepository;
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRepository topicsForBundleIdentifier:](topicRepository, "topicsForBundleIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v21, "identifier", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v4, "isEqual:", v22);

          if ((v23 & 1) != 0)
          {
            v24 = v21;

            goto LABEL_22;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v18)
          continue;
        break;
      }
    }

    v24 = 0;
LABEL_22:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_allCategories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UNSNotificationCategoryRepository *categoryRepository;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationSourceDescription defaultCategories](self->_notificationSourceDescription, "defaultCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  categoryRepository = self->_categoryRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationCategoryRepository categoriesForBundleIdentifier:](categoryRepository, "categoriesForBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
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
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), (_QWORD)v18);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  return v3;
}

- (id)universalSectionIdentifier
{
  return (id)-[UNCNotificationSourceDescription universalApplicationIdentifier](self->_notificationSourceDescription, "universalApplicationIdentifier");
}

- (id)notificationRecords
{
  UNCNotificationRepository *notificationRepository;
  void *v3;
  void *v4;

  notificationRepository = self->_notificationRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository notificationRecordsForBundleIdentifier:](notificationRepository, "notificationRecordsForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v5, "publisherDestination") == 2)
  {
    v6 = objc_msgSend(v5, "maximumCount");
    objc_msgSend(v5, "sinceDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _allBulletinsWithMaxCount:sinceDate:](self, "_allBulletinsWithMaxCount:sinceDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)*MEMORY[0x24BDF89A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "count");
      objc_msgSend(v5, "sinceDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v11;
      v38 = 2048;
      v39 = v12;
      v40 = 2114;
      v41 = v13;
      v42 = 2048;
      v43 = objc_msgSend(v5, "maximumCount");
      _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning %ld bulletins since %{public}@ (max %ld)", buf, 0x2Au);

    }
    if (-[UNSDefaultDataProvider _isEligibleForPipeline](self, "_isEligibleForPipeline"))
    {
      v30 = v5;
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v15 = objc_alloc(MEMORY[0x24BEBF3E8]);
      -[UNSDefaultDataProvider bundle](self, "bundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithBundle:", v16);

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = v8;
      objc_msgSend(v8, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "categoryID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v14, "objectForKey:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                -[UNSDefaultDataProvider _categoryForIdentifier:](self, "_categoryForIdentifier:", v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  objc_msgSend(v17, "notificationCategoryForNotificationCategoryRecord:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "bs_setSafeObject:forKey:", v26, v23);

                }
              }
            }

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v20);
      }

      v8 = v29;
      objc_msgSend(v29, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[UNSNotificationPipelineAdapter addInitialBulletins:categories:sourceDescription:](UNSNotificationPipelineAdapter, "addInitialBulletins:categories:sourceDescription:", v27, v14, self->_notificationSourceDescription);

      v5 = v30;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sectionIdentifier
{
  return (id)-[UNCNotificationSourceDescription bundleIdentifier](self->_notificationSourceDescription, "bundleIdentifier");
}

- (id)_allBulletinsWithMaxCount:(unint64_t)a3 sinceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UNSDefaultDataProvider *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  UNSDefaultDataProvider *v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[UNSDefaultDataProvider notificationRecords](self, "notificationRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v8;
  v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v35;
    v30 = v11;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v32)
        objc_enumerationMutation(v11);
      v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "allowsNotificationCenterDestination", v30))
        goto LABEL_29;
      v14 = objc_msgSend(v13, "shouldHideDate");
      if (!v6 || (v14 & 1) != 0)
        break;
      objc_msgSend(v13, "contentDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v13, "date");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v15;
      v17 = objc_msgSend(v6, "isAfterDate:", v15);

      if ((v17 & 1) == 0)
        break;
LABEL_22:
      if (v33 == ++v12)
      {
        v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v33 = v28;
        if (v28)
          goto LABEL_3;
        goto LABEL_29;
      }
    }
    -[UNSDefaultDataProvider _queue_bulletinForNotification:](v9, "_queue_bulletinForNotification:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "message");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "length"))
    {
      objc_msgSend(v18, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "length"))
      {
        objc_msgSend(v18, "title");
        v22 = v6;
        v23 = v10;
        v24 = v9;
        v25 = a3;
        v26 = v7;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v27, "length");

        v7 = v26;
        a3 = v25;
        v9 = v24;
        v10 = v23;
        v6 = v22;
        v11 = v30;

        if (!v31)
        {
LABEL_19:
          if (a3 && objc_msgSend(v7, "count") == a3)
          {

            goto LABEL_29;
          }

          goto LABEL_22;
        }
LABEL_16:
        objc_msgSend(v18, "publisherBulletinID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsObject:", v21) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v18);
          objc_msgSend(v10, "addObject:", v21);
        }

        goto LABEL_19;
      }

    }
    goto LABEL_16;
  }
LABEL_29:

  return v7;
}

- (id)sectionIcon
{
  return self->_sectionIcon;
}

- (id)sectionDisplayName
{
  return (id)-[UNCNotificationSourceDescription displayName](self->_notificationSourceDescription, "displayName");
}

- (BOOL)syncsBulletinDismissal
{
  return -[UNCNotificationSourceDescription suppressDismissalSync](self->_notificationSourceDescription, "suppressDismissalSync") ^ 1;
}

- (void)setEffectiveSectionInfo:(id)a3
{
  id v5;
  BBSectionInfo *effectiveSectionInfo;
  BBSectionInfo **p_effectiveSectionInfo;
  char v8;
  UNSDaemonLauncher *daemonLauncher;
  void *v10;
  void *v11;
  UNCNotificationRepository *notificationRepository;
  void *v13;
  BBSectionInfo *v14;
  id v15;

  v5 = a3;
  p_effectiveSectionInfo = &self->_effectiveSectionInfo;
  effectiveSectionInfo = self->_effectiveSectionInfo;
  v15 = v5;
  if (!effectiveSectionInfo)
  {
    v14 = (BBSectionInfo *)v5;
    v13 = *p_effectiveSectionInfo;
    *p_effectiveSectionInfo = v14;
LABEL_7:

    goto LABEL_8;
  }
  v8 = -[BBSectionInfo isEqual:](effectiveSectionInfo, "isEqual:", v5);
  objc_storeStrong((id *)&self->_effectiveSectionInfo, a3);
  if ((v8 & 1) == 0)
  {
    if (-[UNCNotificationSourceDescription daemonShouldReceiveNotificationSettingsUpdates](self->_notificationSourceDescription, "daemonShouldReceiveNotificationSettingsUpdates"))
    {
      daemonLauncher = self->_daemonLauncher;
      -[BBSectionInfo uns_notificationSettings](self->_effectiveSectionInfo, "uns_notificationSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionInfo sectionID](self->_effectiveSectionInfo, "sectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSDaemonLauncher didChangeSettings:forBundleIdentifier:](daemonLauncher, "didChangeSettings:forBundleIdentifier:", v10, v11);

    }
    notificationRepository = self->_notificationRepository;
    -[BBSectionInfo sectionID](self->_effectiveSectionInfo, "sectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationRepository removeInvalidNotificationRecordsForBundleIdentifier:](notificationRepository, "removeInvalidNotificationRecordsForBundleIdentifier:", v13);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)sectionBundlePath
{
  void *v2;
  void *v3;

  -[UNCNotificationSourceDescription bundleURL](self->_notificationSourceDescription, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__UNSDefaultDataProvider_topicRepository_didChangeTopicsForBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "reloadDefaultSectionInfo");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidateBulletins");
}

- (void)topicRepository:(id)a3 didChangeTopicsForBundleIdentifier:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__UNSDefaultDataProvider_topicRepository_didChangeTopicsForBundleIdentifier___block_invoke;
  block[3] = &unk_24D63A270;
  block[4] = self;
  dispatch_async(queue, block);
}

- (UNSDefaultDataProvider)initWithNotificationSourceDescription:(id)a3 applicationLauncher:(id)a4 daemonLauncher:(id)a5 categoryRepository:(id)a6 notificationRepository:(id)a7 topicRepository:(id)a8 attachmentsService:(id)a9 localizationService:(id)a10 summaryService:(id)a11 queue:(id)a12
{
  UNSDefaultDataProvider *v18;
  UNSDefaultDataProvider *v19;
  uint64_t v20;
  NSMutableDictionary *categoryToParamSubType;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v26 = a11;
  v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)UNSDefaultDataProvider;
  v18 = -[UNSDefaultDataProvider init](&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a12);
    objc_storeStrong((id *)&v19->_appLauncher, a4);
    objc_storeStrong((id *)&v19->_daemonLauncher, a5);
    objc_storeStrong((id *)&v19->_categoryRepository, a6);
    objc_storeStrong((id *)&v19->_topicRepository, a8);
    objc_storeStrong((id *)&v19->_notificationRepository, a7);
    objc_storeStrong((id *)&v19->_attachmentsService, a9);
    objc_storeStrong((id *)&v19->_localizationService, a10);
    objc_storeStrong((id *)&v19->_summaryService, a11);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    categoryToParamSubType = v19->_categoryToParamSubType;
    v19->_categoryToParamSubType = (NSMutableDictionary *)v20;

    -[UNSDefaultDataProvider _setNotificationSourceDescription:](v19, "_setNotificationSourceDescription:", v34);
    v22 = -[UNSDefaultDataProvider sectionParameters](v19, "sectionParameters");
    objc_msgSend(v34, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationRepository addObserver:forBundleIdentifier:](v19->_notificationRepository, "addObserver:forBundleIdentifier:", v19, v23);
    -[UNSNotificationCategoryRepository addObserver:forBundleIdentifier:](v19->_categoryRepository, "addObserver:forBundleIdentifier:", v19, v23);
    -[UNCNotificationTopicRepository addObserver:forBundleIdentifier:](v19->_topicRepository, "addObserver:forBundleIdentifier:", v19, v23);
    -[UNSSummaryServiceAdapter addObserver:forBundleIdentifier:](v19->_summaryService, "addObserver:forBundleIdentifier:", v19, v23);

  }
  return v19;
}

- (void)_setNotificationSourceDescription:(id)a3
{
  UNCNotificationSourceDescription *v4;
  BBSectionIcon *v5;
  BBSectionIcon *sectionIcon;
  UNCNotificationSourceDescription *notificationSourceDescription;
  UNCNotificationSourceDescription *v8;

  v4 = (UNCNotificationSourceDescription *)a3;
  -[UNSDefaultDataProvider _sectionIconForNotificationSourceDescription:](self, "_sectionIconForNotificationSourceDescription:", v4);
  v5 = (BBSectionIcon *)objc_claimAutoreleasedReturnValue();
  sectionIcon = self->_sectionIcon;
  self->_sectionIcon = v5;

  notificationSourceDescription = self->_notificationSourceDescription;
  self->_notificationSourceDescription = v4;
  v8 = v4;

  LOBYTE(notificationSourceDescription) = -[UNCNotificationSourceDescription suppressUserAuthorizationPrompt](self->_notificationSourceDescription, "suppressUserAuthorizationPrompt");
  self->_suppressUserAuthorizationPrompt = (char)notificationSourceDescription;
}

- (void)unloadBundle
{
  UNCLocalizationService *localizationService;
  void *v4;
  BSCFBundle *bundle;

  localizationService = self->_localizationService;
  -[BSCFBundle bundleIdentifier](self->_bundle, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalizationService unloadBundleWithIdentifier:](localizationService, "unloadBundleWithIdentifier:", v4);

  bundle = self->_bundle;
  self->_bundle = 0;

}

- (void)setNotificationSourceDescription:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNSDefaultDataProvider unloadBundle](self, "unloadBundle");
  v5 = -[UNCNotificationSourceDescription isRestricted](self->_notificationSourceDescription, "isRestricted");
  v6 = -[UNCNotificationSourceDescription allowTimeSensitive](self->_notificationSourceDescription, "allowTimeSensitive");
  v7 = -[UNCNotificationSourceDescription allowMessages](self->_notificationSourceDescription, "allowMessages");
  -[UNSDefaultDataProvider _setNotificationSourceDescription:](self, "_setNotificationSourceDescription:", v4);
  v8 = objc_msgSend(v4, "isRestricted");
  v9 = objc_msgSend(v4, "allowTimeSensitive");
  v10 = objc_msgSend(v4, "allowMessages");

  if (v5 != v8 || ((v6 ^ v9) & 1) != 0 || v7 != v10)
  {
    v11 = (void *)*MEMORY[0x24BDF89A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v17 = v13;
      v18 = 1024;
      v19 = v5;
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v6;
      v24 = 1024;
      v25 = v9;
      v26 = 1024;
      v27 = v7;
      v28 = 1024;
      v29 = v10;
      _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] defaultSectionInfo changed [ isRestricted %{BOOL}d -> %{BOOL}d, allowTimeSensitive %{BOOL}d -> %{BOOL}d, allowMessages %{BOOL}d -> %{BOOL}d]", buf, 0x30u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__UNSDefaultDataProvider_setNotificationSourceDescription___block_invoke;
    block[3] = &unk_24D63A270;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __59__UNSDefaultDataProvider_setNotificationSourceDescription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "reloadDefaultSectionInfo");
}

- (void)dealloc
{
  objc_super v3;

  -[UNSDefaultDataProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UNSDefaultDataProvider;
  -[UNSDefaultDataProvider dealloc](&v3, sel_dealloc);
}

- (void)dataProviderDidLoad
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] data provider loaded", (uint8_t *)&v6, 0xCu);

  }
  -[UNSDefaultDataProvider unloadBundle](self, "unloadBundle");
}

- (void)uninstall
{
  UNCNotificationRepository *notificationRepository;
  id v4;

  -[UNSDefaultDataProvider invalidate](self, "invalidate");
  notificationRepository = self->_notificationRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeStoreForBundleIdentifier:](notificationRepository, "removeStoreForBundleIdentifier:", v4);

}

- (void)invalidate
{
  UNCNotificationRepository *notificationRepository;
  void *v4;
  UNSSummaryServiceAdapter *summaryService;
  void *v6;
  void *v7;
  BBDataProviderProxy *proxy;

  notificationRepository = self->_notificationRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeObserver:forBundleIdentifier:](notificationRepository, "removeObserver:forBundleIdentifier:", self, v4);

  summaryService = self->_summaryService;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSSummaryServiceAdapter removeObserver:forBundleIdentifier:](summaryService, "removeObserver:forBundleIdentifier:", self, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  proxy = self->_proxy;
  self->_proxy = 0;

}

id __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE0FE80];
  v3 = a2;
  objc_msgSend(v2, "defaultSectionInfoForType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubsectionID:", v5);

  objc_msgSend(v4, "uns_setPropertiesFromTopicRecord:", v3);
  if (_os_feature_enabled_impl())
    objc_msgSend(v4, "setSuppressedSettings:", -1);
  return v4;
}

- (id)_queue_bulletinForNotification:(id)a3
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
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  int v56;
  void *v57;
  unsigned int v58;
  void *v59;
  NSObject *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  UNSSummaryServiceAdapter *summaryService;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id *v103;
  NSObject *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  char v136;
  void *v137;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  char v149;
  unsigned int v150;
  unsigned int v151;
  void *v152;
  uint64_t v153;
  unsigned int v154;
  unsigned int v155;
  void *v156;
  unsigned int v157;
  void *v158;
  unsigned int v159;
  void *v160;
  unsigned int v161;
  void *v162;
  unsigned int v163;
  void *v164;
  uint64_t v165;
  BOOL v166;
  unsigned int v167;
  void *v168;
  uint64_t v169;
  void *v170;
  unsigned int v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  uint8_t v218[128];
  uint8_t buf[4];
  id v220;
  __int16 v221;
  void *v222;
  __int16 v223;
  id v224;
  uint64_t v225;

  v225 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
      v32 = (void *)*MEMORY[0x24BDF89A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_ERROR))
        -[UNSDefaultDataProvider _queue_bulletinForNotification:].cold.1(v32, self);
      v31 = 0;
      goto LABEL_163;
    }
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cfBundle");

    objc_msgSend(v4, "titleLocalizationKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleLocalizationArguments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v204 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "subtitleLocalizationKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleLocalizationArguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bodyLocalizationKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bodyLocalizationArguments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v207 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "attributedBody");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summaryArgument");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v4, "summaryArgumentCount");
    objc_msgSend(v4, "badge");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContentIdentifier");
    v173 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _defaultActionWithNotification:](self, "_defaultActionWithNotification:", v4);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = (void *)v17;
    -[UNSDefaultDataProvider _categoryForIdentifier:](self, "_categoryForIdentifier:", v17);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _dismissActionForCategory:](self, "_dismissActionForCategory:", v175);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _followActivityActionForCategory:](self, "_followActivityActionForCategory:", v175);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _silenceActionForCategory:](self, "_silenceActionForCategory:", v175);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _supplementaryActionsForForCategoryRecord:](self, "_supplementaryActionsForForCategoryRecord:", v175);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "intentIdentifiers");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchImageName");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_msgSend(v4, "realertCount");
    objc_msgSend(v4, "contentDate");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = -[UNSDefaultDataProvider _bulletinInterruptionLevelForInterruptionLevel:](self, "_bulletinInterruptionLevelForInterruptionLevel:", objc_msgSend(v4, "interruptionLevel"));
    objc_msgSend(v4, "relevanceScore");
    v21 = v20;
    objc_msgSend(v4, "filterCriteria");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend(v4, "screenCaptureProhibited");
    objc_msgSend(v4, "speechLanguage");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties");
    v212 = v18;
    if (!v22)
    {
      v187 = 0;
      v188 = 0;
      v33 = 0;
      v165 = 0;
      v179 = 0;
      v167 = 0;
      v151 = 0;
      v159 = 0;
      v157 = 0;
      v34 = 0;
      v213 = 0;
      v189 = 0;
      v190 = 0;
      v161 = 1;
      v154 = 0;
      v155 = 1;
      v205 = v18;
      goto LABEL_26;
    }
    objc_msgSend(v4, "headerLocalizationKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerLocalizationArguments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "header");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "footerLocalizationKey");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footerLocalizationArguments");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v189 = (void *)objc_claimAutoreleasedReturnValue();

    v167 = objc_msgSend(v175, "presentFullScreenAlertOverList");
    objc_msgSend(v175, "backgroundStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BEBF548]);

    if ((v26 & 1) != 0)
    {
      v30 = 1;
    }
    else
    {
      objc_msgSend(v175, "backgroundStyle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x24BEBF540]);

      v30 = v36;
    }
    v165 = v30;
    objc_msgSend(v175, "listPriority");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BEBF550]);

    v18 = v212;
    if ((v38 & 1) != 0)
    {
      v33 = 1;
    }
    else
    {
      objc_msgSend(v175, "listPriority");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEBF558]);

      if (v40)
        v33 = 2;
      else
        v33 = 0;
    }
    if ((objc_msgSend(v4, "shouldHideDate") & 1) != 0)
    {
      v205 = 0;
    }
    else
    {
      v205 = v212;
      if (!v208)
      {
LABEL_22:
        if (objc_msgSend(v4, "shouldUseRequestIdentifierForDismissalSync"))
          v188 = v5;
        else
          v188 = 0;
        objc_msgSend(v4, "expirationDate");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "topicIdentifiers");
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = objc_msgSend(v4, "shouldSuppressScreenLightUp") ^ 1;
        v34 = objc_msgSend(v4, "shouldIgnoreDoNotDisturb");
        v157 = objc_msgSend(v4, "shouldIgnoreDowntime");
        v159 = objc_msgSend(v4, "shouldSuppressSyncDismissalWhenRemoved");
        v151 = objc_msgSend(v4, "shouldHideTime");
        v179 = objc_msgSend(v4, "shouldPreemptPresentedNotification");
        v154 = objc_msgSend(v4, "shouldDisplayActionsInline");
        v161 = objc_msgSend(v175, "preventClearFromList") ^ 1;
LABEL_26:
        if (objc_msgSend(v4, "hasCriticalAlertSound"))
          v41 = -[UNSDefaultDataProvider _queue_supportsCriticalAlertsForSubsectionIDs:](self, "_queue_supportsCriticalAlertsForSubsectionIDs:", v213);
        else
          v41 = 0;
        v150 = objc_msgSend(v4, "shouldShowSubordinateIcon");
        if (v33 == 0 && v41)
          v42 = 1;
        else
          v42 = v33;
        v153 = v42;
        v43 = 3;
        if (!v41 || v19 == 3)
          v43 = v19;
        v148 = v43;
        objc_msgSend(v4, "threadIdentifier");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v211, "length") && v41)
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "UUIDString");
          v45 = objc_claimAutoreleasedReturnValue();

          v211 = (void *)v45;
        }
        objc_msgSend(v4, "contentType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:](self, "_bbContentTypeFromUNContentType:toneAlertType:", v46, objc_msgSend(v4, "toneAlertType"));
        v210 = (void *)objc_claimAutoreleasedReturnValue();

        v174 = (void *)v16;
        v171 = v34;
        if (!objc_msgSend(v4, "hasSound") || !objc_msgSend(v4, "shouldPlaySound"))
        {
          v48 = 0;
          v182 = 0;
          goto LABEL_89;
        }
        v145 = v5;
        v47 = v210 == (void *)*MEMORY[0x24BE0FDA8] && objc_msgSend(v4, "toneAlertType") == 1;
        if ((v22 | v47) == 1)
          v49 = objc_msgSend(v4, "toneAlertType");
        else
          v49 = 17;
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", v49);
        v51 = v50;
        if (v41)
          objc_msgSend(v50, "setTopic:", *MEMORY[0x24BEB8CF8]);
        objc_msgSend(v4, "toneFileName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          -[UNSDefaultDataProvider _pathForSoundName:](self, "_pathForSoundName:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v53, "length"))
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v53);
            v54 = v53;
            v55 = v47;
            v56 = v22;
            v57 = v52;
            v58 = v34;
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setExternalToneFileURL:", v59);

            v34 = v58;
            v52 = v57;
            v22 = v56;
            v47 = v55;
            v53 = v54;
          }
          else
          {
            v60 = (id)*MEMORY[0x24BDF89A8];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
              v142 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "un_logDigest");
              v186 = v52;
              v143 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v220 = v142;
              v221 = 2114;
              v222 = v186;
              v223 = 2114;
              v224 = v143;
              _os_log_error_impl(&dword_216DCB000, v60, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to find sound \"%{public}@\" for notification %{public}@", buf, 0x20u);

              v52 = v186;
              v34 = v171;
            }

          }
          v18 = v212;

        }
        if (v47)
        {
          objc_msgSend(v4, "soundMaximumDuration");
          v62 = v61;
          v63 = 30.0;
          if (v62 != 0.0)
          {
            objc_msgSend(v4, "soundMaximumDuration", 30.0);
            if (v63 > 30.0)
              v63 = 30.0;
          }
          objc_msgSend(v51, "setMaximumDuration:", v63);
          objc_msgSend(v51, "setTopic:", *MEMORY[0x24BEB8D10]);
          v5 = v145;
          if (!v22)
            goto LABEL_83;
        }
        else
        {
          v5 = v145;
          if (!v22)
          {
LABEL_83:
            objc_msgSend(v4, "audioVolume");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v72;
            if (v22 | v41)
            {
              if (v72)
              {
                objc_msgSend(v72, "floatValue");
                objc_msgSend(v51, "setAudioVolume:");
              }
              if (objc_msgSend(v4, "shouldIgnoreRingerSwitch") | v41)
                objc_msgSend(v51, "setShouldIgnoreRingerSwitch:", 1);
            }
            v182 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FEA0]), "initWithToneAlertConfiguration:", v51);

LABEL_89:
            v185 = v48;
            if (!-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
            {
              v181 = 0;
              goto LABEL_100;
            }
            objc_msgSend(v4, "iconApplicationIdentifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "iconName");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "iconPath");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "iconSystemImageName");
            v76 = objc_claimAutoreleasedReturnValue();
            v77 = (void *)v76;
            if (v73)
            {
              objc_msgSend(MEMORY[0x24BE0FE78], "variantWithFormat:applicationIdentifier:", 0, v73);
              v78 = objc_claimAutoreleasedReturnValue();
            }
            else if (v75)
            {
              objc_msgSend(MEMORY[0x24BE0FE78], "variantWithFormat:imagePath:", 0, v75);
              v78 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v74)
              {
                v139 = (void *)MEMORY[0x24BE0FE78];
                -[UNSDefaultDataProvider bundle](self, "bundle");
                v147 = v5;
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "bundlePath");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "variantWithFormat:imageName:inBundleAtPath:", 0, v74, v141);
                v79 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = v171;
                v5 = v147;
                goto LABEL_96;
              }
              if (!v76)
              {
                v79 = 0;
                goto LABEL_96;
              }
              objc_msgSend(MEMORY[0x24BE0FE78], "variantWithFormat:systemImageName:", 0, v76);
              v78 = objc_claimAutoreleasedReturnValue();
            }
            v79 = (void *)v78;
LABEL_96:
            objc_msgSend(v79, "setPrecomposed:", objc_msgSend(v4, "iconShouldSuppressMask"));
            if (v79)
            {
              v181 = objc_alloc_init(MEMORY[0x24BE0FE70]);
              objc_msgSend(v181, "addVariant:", v79);
            }
            else
            {
              v181 = 0;
            }

            v18 = v212;
LABEL_100:
            v80 = v41 | v34;
            v81 = v41 | v179;
            if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
            {
              objc_msgSend(v4, "accessoryImageName");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              if (v82)
              {
                objc_msgSend(MEMORY[0x24BE0FE50], "imageWithName:inBundlePath:", v82, 0);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v180 = 0;
              }

            }
            else
            {
              v180 = 0;
            }
            v83 = objc_alloc(MEMORY[0x24BEBF400]);
            -[UNSDefaultDataProvider bundle](self, "bundle");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = (void *)objc_msgSend(v83, "initWithBundle:categoryRepository:", v84, self->_categoryRepository);

            v152 = v85;
            objc_msgSend(v85, "notificationForNotificationRecord:", v4);
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v85) = -[UNSDefaultDataProvider _queue_supportsCriticalAlertsForSubsectionIDs:](self, "_queue_supportsCriticalAlertsForSubsectionIDs:", v213);
            v86 = -[UNSDefaultDataProvider _queue_supportsTimeSensitiveAlertsforSubsectionIDs:](self, "_queue_supportsTimeSensitiveAlertsforSubsectionIDs:", v213);
            v87 = 2;
            if ((_DWORD)v85)
              v87 = 3;
            if (v148 != 3)
              v87 = v148;
            v88 = 1;
            if (v86)
              v88 = 2;
            if (v87 == 2)
              v89 = v88;
            else
              v89 = v87;
            v149 = objc_msgSend(v210, "isEqualToString:", *MEMORY[0x24BE0FDA0]);
            v90 = objc_alloc_init(MEMORY[0x24BE0FE30]);
            objc_msgSend(v90, "setContentType:", v210);
            objc_msgSend(v90, "setDefaultAction:", v199);
            objc_msgSend(v90, "setDismissAction:", v198);
            objc_msgSend(v90, "setFollowActivityAction:", v197);
            objc_msgSend(v90, "setDate:", v205);
            objc_msgSend(v90, "setInterruptionLevel:", v89);
            *(float *)&v91 = v21;
            objc_msgSend(v90, "setRelevanceScore:", v91);
            objc_msgSend(v90, "setFilterCriteria:", v192);
            objc_msgSend(v90, "setScreenCaptureProhibited:", v163);
            objc_msgSend(v90, "setSpeechLanguage:", v191);
            objc_msgSend(v90, "setDateIsAllDay:", v151);
            objc_msgSend(v90, "setExpirationDate:", v187);
            objc_msgSend(v90, "setHeader:", v190);
            objc_msgSend(v90, "setFooter:", v189);
            objc_msgSend(v90, "setMessage:", v207);
            if (v209)
            {
              -[UNSDefaultDataProvider _safeAttributedMessageWithAttributedMessage:contentType:](self, "_safeAttributedMessageWithAttributedMessage:contentType:", v209, v210);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              if (v92)
              {
                objc_msgSend(v90, "setAttributedMessage:", v92);
              }
              else if (!v207)
              {
                objc_msgSend(v209, "string");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setMessage:", v93);

                v18 = v212;
              }

            }
            objc_msgSend(v90, "setSection:", v206);
            objc_msgSend(v90, "setSubtitle:", v203);
            objc_msgSend(v90, "setTitle:", v204);
            objc_msgSend(v90, "setSummaryArgument:", v202);
            objc_msgSend(v90, "setSummaryArgumentCount:", v176);
            objc_msgSend(v90, "setSound:", v182);
            objc_msgSend(v90, "setIcon:", v181);
            objc_msgSend(v90, "setHasSubordinateIcon:", v150);
            objc_msgSend(v90, "setAccessoryImage:", v180);
            objc_msgSend(v90, "setHasCriticalIcon:", v41);
            objc_msgSend(v90, "setTurnsOnDisplay:", v155);
            objc_msgSend(v90, "setIgnoresQuietMode:", v80);
            objc_msgSend(v90, "setIgnoresDowntime:", v157);
            objc_msgSend(v90, "setPreemptsPresentedAlert:", v81);
            objc_msgSend(v90, "setDisplaysActionsInline:", v154);
            objc_msgSend(v90, "setUsesExternalSync:", v159);
            objc_msgSend(v90, "setPublisherBulletinID:", v5);
            objc_msgSend(v90, "setRecordID:", v5);
            objc_msgSend(v90, "setDismissalID:", v188);
            objc_msgSend(v90, "setCategoryID:", v200);
            -[NSMutableDictionary objectForKey:](self->_categoryToParamSubType, "objectForKey:", v200);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setSectionSubtype:", objc_msgSend(v94, "integerValue"));

            objc_msgSend(v90, "setSilenceAction:", v196);
            objc_msgSend(v90, "setThreadID:", v211);
            objc_msgSend(v90, "setIntentIDs:", v194);
            objc_msgSend(v90, "setSubsectionIDs:", v213);
            objc_msgSend(v90, "setDateFormatStyle:", 1);
            objc_msgSend(v90, "setSupplementaryActions:", v195);
            objc_msgSend(v90, "setWantsFullscreenPresentation:", v167);
            objc_msgSend(v90, "setPreventAutomaticRemovalFromLockScreen:", v41);
            objc_msgSend(v90, "setLockScreenPriority:", v153);
            objc_msgSend(v90, "setBackgroundStyle:", v165);
            objc_msgSend(v90, "setClearable:", v161);
            if (objc_msgSend(v4, "pipelineState"))
            {
              objc_msgSend(v90, "setIsHighlight:", objc_msgSend(v4, "isHighlight"));
              objc_msgSend(v4, "summary");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "setSummary:", v95);

              objc_msgSend(v4, "eventBehavior");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "setEventBehavior:", v96);

            }
            summaryService = self->_summaryService;
            objc_msgSend(v4, "identifier");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            -[UNSSummaryServiceAdapter groupSummariesForNotificationIdentifier:bundleIdentifier:](summaryService, "groupSummariesForNotificationIdentifier:bundleIdentifier:", v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v100, "threadSummary");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setThreadSummary:", v101);

            v177 = v100;
            objc_msgSend(v100, "spotlightIdentifier");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setSpotlightIdentifier:", v102);

            v103 = (id *)MEMORY[0x24BDF89E0];
            v104 = (id)*MEMORY[0x24BDF89E0];
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v100, "spotlightIdentifier");
              v105 = (id)objc_claimAutoreleasedReturnValue();
              v106 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v100, "threadSummary");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "numberWithInt:", objc_msgSend(v107, "length") != 0);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v220 = v105;
              v221 = 2112;
              v222 = v108;
              _os_log_impl(&dword_216DCB000, v104, OS_LOG_TYPE_DEFAULT, "group summaries request for record with spotlightIdentifier: %@ hasThreadSummary: %@", buf, 0x16u);

              v18 = v212;
            }

            v109 = *v103;
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
              -[UNSDefaultDataProvider _queue_bulletinForNotification:].cold.3(v100, v90, v109);

            v110 = v174;
            if (v185)
              objc_msgSend(v90, "setContextValue:forKey:", v185, CFSTR("audioVolume"));
            if (v174)
              objc_msgSend(v90, "setContextValue:forKey:", v174, CFSTR("badge"));
            if (v208)
              objc_msgSend(v90, "setContextValue:forKey:", v208, CFSTR("contentDate"));
            objc_msgSend(v90, "setContextValue:forKey:", v193, *MEMORY[0x24BE0FEE0]);
            if (v18)
              objc_msgSend(v90, "setContextValue:forKey:", v18, CFSTR("recordDate"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v171);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setContextValue:forKey:", v111, CFSTR("shouldIgnoreDoNotDisturb"));

            v112 = (void *)v173;
            if (v173)
              objc_msgSend(v90, "setContextValue:forKey:", v173, CFSTR("targetContentIdentifier"));
            if (v201)
              objc_msgSend(v90, "setContextValue:forKey:", v201, CFSTR("userInfo"));
            objc_msgSend(v90, "setRealertCount:", v169);
            objc_msgSend(v178, "request");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "content");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "attachments");
            v115 = objc_claimAutoreleasedReturnValue();

            if (v115)
              -[UNSDefaultDataProvider _addAttachments:toBulletinRequest:](self, "_addAttachments:toBulletinRequest:", v115, v90);
            v172 = (void *)v115;
            objc_msgSend(v178, "request");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "trigger");
            v117 = objc_claimAutoreleasedReturnValue();

            if (v117)
            {
              objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v117, 1, 0);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "setContextValue:forKey:", v118, CFSTR("notificationTriggerData"));

            }
            v170 = (void *)v117;
            objc_msgSend(v178, "request");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "content");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "communicationContext");
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            v122 = v212;
            v123 = v172;
            if (v121)
            {
              if ((v149 & 1) != 0)
              {
                v124 = (id)*MEMORY[0x24BDF8990];
                if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
                  -[UNSDefaultDataProvider _queue_bulletinForNotification:].cold.2();
              }
              else
              {
                v146 = v5;
                v124 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v214 = 0u;
                v215 = 0u;
                v216 = 0u;
                v217 = 0u;
                objc_msgSend(v121, "recipients");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v214, v218, 16);
                if (v126)
                {
                  v127 = v126;
                  v128 = *(_QWORD *)v215;
                  do
                  {
                    for (i = 0; i != v127; ++i)
                    {
                      if (*(_QWORD *)v215 != v128)
                        objc_enumerationMutation(v125);
                      -[UNSDefaultDataProvider _bbContactFromUNContact:](self, "_bbContactFromUNContact:", *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * i));
                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject addObject:](v124, "addObject:", v130);

                    }
                    v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v214, v218, 16);
                  }
                  while (v127);
                }

                objc_msgSend(v121, "sender");
                v131 = (void *)objc_claimAutoreleasedReturnValue();

                if (v131)
                {
                  objc_msgSend(v121, "sender");
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UNSDefaultDataProvider _bbContactFromUNContact:](self, "_bbContactFromUNContact:", v132);
                  v168 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v168 = 0;
                }
                if (objc_msgSend(v121, "notifyRecipientAnyway"))
                  v166 = -[UNSDefaultDataProvider _isTCCUserAvailabilityGrantedForBundleId:](self, "_isTCCUserAvailabilityGrantedForBundleId:", v206);
                else
                  v166 = 0;
                v164 = (void *)MEMORY[0x24BE0FE60];
                objc_msgSend(v121, "identifier");
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "bundleIdentifier");
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "associatedObjectUri");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "displayName");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "contentURL");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "imageName");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = objc_msgSend(v121, "isSystemImage");
                v136 = objc_msgSend(v121, "mentionsCurrentUser");
                BYTE3(v144) = objc_msgSend(v121, "isReplyToCurrentUser");
                BYTE2(v144) = v166;
                BYTE1(v144) = v136;
                LOBYTE(v144) = v135;
                objc_msgSend(v164, "communicationContextWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:", v162, v160, v158, v133, v168, v124, v156, v134, v144, objc_msgSend(v121, "recipientCount"));
                v137 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v137, "setCapabilities:", objc_msgSend(v121, "capabilities") & 1);
                objc_msgSend(v137, "setBusinessCorrespondence:", objc_msgSend(v121, "isBusinessCorrespondence"));
                objc_msgSend(v90, "setCommunicationContext:", v137);

                v5 = v146;
                v112 = (void *)v173;
                v110 = v174;
                v122 = v212;
                v123 = v172;
              }

            }
            v31 = v90;

LABEL_163:
            goto LABEL_164;
          }
          objc_msgSend(v4, "soundMaximumDuration");
          if (v64 != 0.0)
            objc_msgSend(v51, "setMaximumDuration:");
        }
        objc_msgSend(v4, "audioCategory");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "length"))
          objc_msgSend(v51, "setAudioCategory:", v65);
        v66 = objc_msgSend(v4, "toneMediaLibraryItemIdentifier");
        if (v66)
          objc_msgSend(v51, "setExternalToneMediaLibraryItemIdentifier:", v66);
        objc_msgSend(v4, "vibrationPatternFileURL");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
          objc_msgSend(v51, "setExternalVibrationPatternFileURL:", v67);
        if (objc_msgSend(v4, "shouldSoundRepeat"))
          objc_msgSend(v51, "setShouldRepeat:", 1);
        v184 = v52;
        objc_msgSend(v4, "toneAlertTopic");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v68, "length"))
          objc_msgSend(v51, "setTopic:", v68);
        objc_msgSend(v4, "toneIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v69, "length"))
          objc_msgSend(v51, "setToneIdentifier:", v69);
        v183 = v65;
        objc_msgSend(v4, "toneFileURL");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
          objc_msgSend(v51, "setExternalToneFileURL:", v70);
        objc_msgSend(v4, "vibrationIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "length"))
          objc_msgSend(v51, "setVibrationIdentifier:", v71);
        if (objc_msgSend(v4, "shouldIgnoreAccessibilityDisabledVibrationSetting"))
          objc_msgSend(v51, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", 1);

        v5 = v145;
        v18 = v212;
        v34 = v171;
        v52 = v184;
        goto LABEL_83;
      }
      v205 = v208;
    }

    goto LABEL_22;
  }
  v31 = 0;
LABEL_164:

  return v31;
}

- (id)_bbContentTypeFromUNContentType:(id)a3 toneAlertType:(int64_t)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  id *v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (id)*MEMORY[0x24BE0FDA0];
  v8 = -[UNCNotificationSourceDescription allowCalls](self->_notificationSourceDescription, "allowCalls");
  v9 = -[UNCNotificationSourceDescription allowMessages](self->_notificationSourceDescription, "allowMessages");
  v10 = -[UNCNotificationSourceDescription allowIntercom](self->_notificationSourceDescription, "allowIntercom");
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B08]))
  {
    if (v9)
    {
      v11 = (id *)MEMORY[0x24BE0FDB8];
LABEL_39:
      v18 = *v11;

      v7 = v18;
      goto LABEL_40;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
LABEL_8:
      -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:].cold.1();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B10]))
  {
    if (v9)
    {
      v11 = (id *)MEMORY[0x24BE0FDC0];
      goto LABEL_39;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B00]))
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B18]))
      {
        if (v8)
        {
          v11 = (id *)MEMORY[0x24BE0FDC8];
          goto LABEL_39;
        }
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
          goto LABEL_40;
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8AF8]))
      {
        v12 = v8 ^ 1;
        if (a4 == 1)
          v13 = v8 ^ 1;
        else
          v13 = 1;
        if ((v13 & 1) == 0)
        {
          v11 = (id *)MEMORY[0x24BE0FDA8];
          goto LABEL_39;
        }
        if (a4 == 1)
          v12 = 1;
        if ((v12 & 1) == 0)
        {
          v14 = (id)*MEMORY[0x24BE0FD98];

          v15 = (void *)*MEMORY[0x24BDF8990];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543362;
            v21 = v17;
            _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] _UNNotificationContentType is '_UNNotificationContentTypeIncomingCall' but the tone alert type is NOT  'TLAlertTypeIncomingCall'. Tone alert type must be 'TLAlertTypeIncomingCall' for notification to be treated as an incoming call. Assigning 'BBBulletinContentTypeCallOther' to notification.", (uint8_t *)&v20, 0xCu);

          }
          v7 = v14;
          goto LABEL_40;
        }
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
          goto LABEL_40;
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B20]))
      {
        if (v8)
        {
          v11 = (id *)MEMORY[0x24BE0FDD0];
          goto LABEL_39;
        }
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
          goto LABEL_40;
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8AE8]))
          goto LABEL_40;
        if (v8)
        {
          v11 = (id *)MEMORY[0x24BE0FD98];
          goto LABEL_39;
        }
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
          goto LABEL_40;
      }
      -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:].cold.4();
      goto LABEL_40;
    }
    if (v10)
    {
      v11 = (id *)MEMORY[0x24BE0FDB0];
      goto LABEL_39;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_ERROR))
      -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:].cold.3();
  }
LABEL_40:

  return v7;
}

- (id)_bbContactFromUNContact:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v4 = objc_msgSend(v3, "handleType");
  v5 = 2 * (v4 == 2);
  if (v4 == 1)
    v5 = 1;
  v18 = v5;
  v6 = (void *)MEMORY[0x24BE0FE40];
  objc_msgSend(v3, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isDisplayNameSuggested");
  objc_msgSend(v3, "customIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactFullname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "isCNContactIdentifierSuggested");

  LOBYTE(v17) = v14;
  objc_msgSend(v6, "contactWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v7, v18, v8, v9, v10, v11, v12, v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_safeAttributedMessageWithAttributedMessage:(id)a3 contentType:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE0FDB8]) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE0FDC0]))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_queue_supportsCriticalAlertsForSubsectionIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[UNSDefaultDataProvider _queue_applicableSectionInfosForSubsectionIDs:](self, "_queue_applicableSectionInfosForSubsectionIDs:", a3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "criticalAlertSetting", (_QWORD)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_queue_supportsTimeSensitiveAlertsforSubsectionIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[UNSDefaultDataProvider _queue_applicableSectionInfosForSubsectionIDs:](self, "_queue_applicableSectionInfosForSubsectionIDs:", a3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "timeSensitiveSetting", (_QWORD)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_queue_applicableSectionInfosForSubsectionIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BBSectionInfo subsections](self->_effectiveSectionInfo, "subsections", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "subsectionID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count") && self->_effectiveSectionInfo)
    objc_msgSend(v5, "addObject:");

  return v5;
}

- (id)_soundsDirectoryPathForContainerBasePath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Sounds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_pathForSoundName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCNotificationSourceDescription dataContainerURL](self->_notificationSourceDescription, "dataContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider _soundsDirectoryPathForContainerBasePath:](self, "_soundsDirectoryPathForContainerBasePath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByStandardizingPath");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (-[UNSDefaultDataProvider _isResourceValidForPath:withContainerPath:](self, "_isResourceValidForPath:withContainerPath:", v10, v8))
    {

      if (v10)
        goto LABEL_19;
    }
    else
    {

    }
  }
  -[UNCNotificationSourceDescription groupContainerURLS](self->_notificationSourceDescription, "groupContainerURLS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
LABEL_8:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "path", (_QWORD)v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByStandardizingPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSDefaultDataProvider _soundsDirectoryPathForContainerBasePath:](self, "_soundsDirectoryPathForContainerBasePath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "stringByAppendingPathComponent:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByStandardizingPath");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (-[UNSDefaultDataProvider _isResourceValidForPath:withContainerPath:](self, "_isResourceValidForPath:withContainerPath:", v10, v20))
      {
        break;
      }

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          goto LABEL_8;
        goto LABEL_14;
      }
    }

    if (v10)
      goto LABEL_19;
  }
  else
  {
LABEL_14:

  }
  -[UNSDefaultDataProvider bundle](self, "bundle", (_QWORD)v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bundlePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByStandardizingPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNSDefaultDataProvider bundle](self, "bundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pathForResource:ofType:", v4, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByStandardizingPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (-[UNSDefaultDataProvider _isResourceValidForPath:withContainerPath:](self, "_isResourceValidForPath:withContainerPath:", v27, v24))
  {
    v10 = v27;
  }

LABEL_19:
  return v10;
}

- (BOOL)_isResourceValidForPath:(id)a3 withContainerPath:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", a4) && (BSIsSymbolicLinkAtPath() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "fileExistsAtPath:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_defaultActionWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "hasDefaultAction") & 1) != 0
    || (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties") & 1) == 0)
  {
    objc_msgSend(v4, "defaultActionTitleLocalizationKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cfBundle");
    objc_msgSend(v4, "defaultActionTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FE18], "actionWithIdentifier:title:", *MEMORY[0x24BDF8A60], v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
    {
      objc_msgSend(v4, "defaultActionURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLaunchURL:", v10);

      objc_msgSend(v4, "defaultActionBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLaunchBundleID:", v11);

      objc_msgSend(v5, "setShouldDismissBulletin:", objc_msgSend(v4, "shouldPreventNotificationDismissalAfterDefaultAction") ^ 1);
      objc_msgSend(v5, "setActivationMode:", objc_msgSend(v4, "shouldBackgroundDefaultAction"));
      objc_msgSend(v5, "setAuthenticationRequired:", objc_msgSend(v4, "shouldAuthenticateDefaultAction"));
    }
    else
    {
      objc_msgSend(v5, "setActivationMode:", 0);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_dismissActionForCategory:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "hasCustomDismissAction"))
  {
    objc_msgSend(MEMORY[0x24BE0FE18], "actionWithIdentifier:", *MEMORY[0x24BDF8A70]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActivationMode:", 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_followActivityActionForCategory:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "hasFollowActivityAction")
    && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
  {
    v3 = (void *)MEMORY[0x24BE0FE18];
    v4 = *MEMORY[0x24BDF8A78];
    UNSLocalizedStringForKey(CFSTR("FOLLOW_ACTIVITY_ACTION_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionWithIdentifier:title:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setActivationMode:", 1);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_silenceActionForCategory:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "hasCustomSilenceAction")
    && -[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
  {
    objc_msgSend(MEMORY[0x24BE0FE18], "actionWithIdentifier:", *MEMORY[0x24BDF8A90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivationMode:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_supplementaryActionsForForCategoryRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_first:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNSDefaultDataProvider _actionsFromActionRecords:](self, "_actionsFromActionRecords:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_categoryForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  UNSNotificationCategoryRepository *categoryRepository;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[UNCNotificationSourceDescription defaultCategories](self->_notificationSourceDescription, "defaultCategories");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v24 = v10;
            v16 = v5;
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          continue;
        break;
      }
    }

    categoryRepository = self->_categoryRepository;
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationCategoryRepository categoriesForBundleIdentifier:](categoryRepository, "categoriesForBundleIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v21, "identifier", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v4, "isEqual:", v22);

          if ((v23 & 1) != 0)
          {
            v24 = v21;

            goto LABEL_22;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v18)
          continue;
        break;
      }
    }

    v24 = 0;
LABEL_22:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_actionsFromActionRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[UNSDefaultDataProvider _actionFromActionRecord:](self, "_actionFromActionRecord:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bs_safeAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_actionFromActionRecord:(id)a3
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
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLocalizationArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cfBundle");
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UNFormatLocalizedStringInBundleWithDefaultValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0FE18], "actionWithIdentifier:title:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActivationMode:", objc_msgSend(v4, "isForeground") ^ 1);
  objc_msgSend(v11, "setAuthenticationRequired:", objc_msgSend(v4, "isAuthenticationRequired"));
  if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
  {
    objc_msgSend(v4, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLaunchURL:", v12);

    objc_msgSend(v11, "setShouldDismissBulletin:", objc_msgSend(v4, "shouldPreventNotificationDismiss") ^ 1);
  }
  if (objc_msgSend(v4, "isDestructive"))
  {
    objc_msgSend(v11, "appearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStyle:", 1);

  }
  objc_msgSend(v4, "actionType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEBF530]);

  if (v15)
  {
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cfBundle");

    objc_msgSend(v4, "textInputButtonTitleLocalizationKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputButtonTitleLocalizationArguments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputButtonTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "textInputPlaceholderLocalizationKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputPlaceholderLocalizationArguments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputPlaceholder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    UNFormatLocalizedStringInBundleWithDefaultValue();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v20, *MEMORY[0x24BDF8A20]);
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v24, *MEMORY[0x24BDF8A28]);
    objc_msgSend(v11, "setBehaviorParameters:", v25);
    objc_msgSend(v11, "setBehavior:", 1);

  }
  else
  {
    objc_msgSend(v11, "setBehavior:", 0);
  }
  objc_msgSend(v4, "iconImageName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    objc_msgSend(v4, "iconImageName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if ((objc_msgSend(v4, "hasSystemIcon") & 1) != 0)
      {
        v29 = 0;
      }
      else
      {
        -[UNSDefaultDataProvider bundle](self, "bundle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bundlePath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BE0FE50], "imageWithName:inBundlePath:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v11, "appearance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setImage:", v30);

  return v11;
}

- (BOOL)_isAppProtectionActive
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x24BE042F8];
  -[BBSectionInfo sectionID](self->_effectiveSectionInfo, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isLocked");

  return v5;
}

- (BOOL)_isEligibleForPipeline
{
  void *v3;
  int v4;
  int v5;
  BOOL result;

  -[BBSectionInfo uns_notificationSettings](self->_effectiveSectionInfo, "uns_notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEligibleForIndexing");

  v5 = UNCUsePipeline();
  result = 0;
  if (v5)
  {
    if (v4)
      return !-[UNSDefaultDataProvider _isAppProtectionActive](self, "_isAppProtectionActive");
  }
  return result;
}

- (id)clearedInfoAndBulletinsForClearingAllBulletinsWithLimit:(unint64_t)a3 lastClearedInfo:(id)a4
{
  void *v6;
  UNCNotificationRepository *notificationRepository;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNSDefaultDataProvider _allBulletinsWithMaxCount:sinceDate:](self, "_allBulletinsWithMaxCount:sinceDate:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  notificationRepository = self->_notificationRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeAllNotificationRecordsForBundleIdentifier:](notificationRepository, "removeAllNotificationRecordsForBundleIdentifier:", v8);

  v12[0] = *MEMORY[0x24BE0FDE0];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = *MEMORY[0x24BE0FDD8];
  v13[0] = v9;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UNCNotificationRepository *notificationRepository;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2048;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear %ld bulletins", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "publisherBulletinID", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  notificationRepository = self->_notificationRepository;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeNotificationRecordsForIdentifiers:bundleIdentifier:](notificationRepository, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v9, v17);

  return 0;
}

- (id)sortDescriptors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  UNCNotificationRepository *notificationRepository;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (os_log_t *)MEMORY[0x24BDF89A8];
  v9 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bulletinPublisherID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v11;
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v14;
    v33 = 2048;
    v34 = objc_msgSend(v6, "actionType");
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received response to %{public}@ for action %{public}@ (%ld)  ", (uint8_t *)&v27, 0x2Au);

  }
  v15 = objc_msgSend(v6, "actionType");
  if (v15 > 0xB)
    goto LABEL_15;
  if (((1 << v15) & 0xD82) != 0)
  {
    -[UNSDefaultDataProvider _handleBulletinActionResponse:withCompletion:](self, "_handleBulletinActionResponse:withCompletion:", v6, v7);
    goto LABEL_6;
  }
  if (v15 == 5)
  {
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bulletinPublisherID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "un_logDigest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "actionType");
      v27 = 138544130;
      v28 = v18;
      v29 = 2114;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      v33 = 2048;
      v34 = v22;
      _os_log_impl(&dword_216DCB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing record with identifier %{public}@ from notification repository for action %{public}@ (%ld)  ", (uint8_t *)&v27, 0x2Au);

    }
    objc_msgSend(v6, "bulletinPublisherID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      notificationRepository = self->_notificationRepository;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCNotificationRepository removeNotificationRecordsForIdentifiers:bundleIdentifier:](notificationRepository, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v25, v26);

    }
    if (v7)
      v7[2](v7, 1);

  }
  else
  {
LABEL_15:
    if (v7)
      v7[2](v7, 0);
  }
LABEL_6:

}

- (void)_handleBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  UNCNotificationRepository *notificationRepository;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void (**v22)(id, _QWORD);
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UNSApplicationLauncher *appLauncher;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(id, _QWORD);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *loga;
  os_log_t log;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  NSObject *v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  NSObject *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionID");
  v9 = objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v6, "actionType");
  objc_msgSend(v6, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", *MEMORY[0x24BE0FEE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v6, "actionActivationMode");
  objc_msgSend(v6, "originID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endpoint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  notificationRepository = self->_notificationRepository;
  objc_msgSend(v6, "bulletinPublisherID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository notificationRecordForIdentifier:bundleIdentifier:](notificationRepository, "notificationRecordForIdentifier:bundleIdentifier:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v10;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDF8B28]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  objc_msgSend(v13, "defaultActionBundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (NSObject **)MEMORY[0x24BDF89A8];
  v17 = v14;
  if (v15)
  {
    if (-[UNCNotificationSourceDescription allowAlternateLaunchBundleIdentifiers](self->_notificationSourceDescription, "allowAlternateLaunchBundleIdentifiers"))
    {
      v17 = v15;

      v18 = *v16;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        loga = v18;
        -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bulletinPublisherID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v40;
        v59 = 2114;
        v60 = v19;
        v61 = 2114;
        v62 = v17;
        _os_log_error_impl(&dword_216DCB000, loga, OS_LOG_TYPE_ERROR, "[%{public}@] Launching action response '%{public}@' with alternate bundle identifier '%{public}@'", buf, 0x20u);

      }
    }
    else
    {
      v20 = *v16;
      v17 = v14;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v37 = v20;
        -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bulletinPublisherID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v38;
        v59 = 2114;
        v60 = v39;
        v61 = 2114;
        v62 = v15;
        _os_log_error_impl(&dword_216DCB000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Permission denied to launch action response '%{public}@' with alternate bundle identifier '%{public}@'", buf, 0x20u);

        v17 = v14;
      }
    }
  }
  log = v15;
  if (v13)
  {
    v21 = objc_alloc(MEMORY[0x24BEBF400]);
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v21, "initWithBundle:categoryRepository:", v23, self->_categoryRepository);

    v7 = v22;
    objc_msgSend(v24, "notificationForNotificationRecord:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v9;
  }
  else
  {
    v26 = (void *)v9;
    if (!v50)
    {
LABEL_18:
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_ERROR))
      {
        -[UNSDefaultDataProvider _handleBulletinActionResponse:withCompletion:].cold.1();
        if (!v7)
          goto LABEL_36;
      }
      else if (!v7)
      {
        goto LABEL_36;
      }
      v7[2](v7, 0);
      goto LABEL_36;
    }
    -[UNSDefaultDataProvider _unarchiveNotificationFromData:](self, "_unarchiveNotificationFromData:", v50);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v28;
    if (v28)
    {
      v41 = v7;
      objc_msgSend(v28, "sourceIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[NSObject isEqualToString:](v14, "isEqualToString:", v29);

      if (v30)
      {
        v24 = v24;
        v25 = v24;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_FAULT))
          -[UNSDefaultDataProvider _handleBulletinActionResponse:withCompletion:].cold.2();
        v25 = 0;
      }
      v7 = v41;
    }
    else
    {
      v25 = 0;
    }
  }

  if (!v25)
    goto LABEL_18;
  switch(v43)
  {
    case 1:
      v27 = (id *)MEMORY[0x24BDF8A60];
      goto LABEL_23;
    case 10:
      v27 = (id *)MEMORY[0x24BDF8A90];
      goto LABEL_23;
    case 8:
      v27 = (id *)MEMORY[0x24BDF8A70];
LABEL_23:
      v31 = *v27;

      v26 = v31;
      break;
  }
  if (objc_msgSend(v6, "actionBehavior") == 1)
  {
    objc_msgSend(v49, "objectForKey:", *MEMORY[0x24BE0FEF0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF88A8], "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:userText:", v25, v26, v52, v51, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8860], "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:", v25, v26, v52, v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v44)
  {
    if (-[UNCNotificationSourceDescription daemonShouldReceiveBackgroundResponses](self->_notificationSourceDescription, "daemonShouldReceiveBackgroundResponses"))-[UNSDaemonLauncher didReceiveNotificationResponse:forBundleIdentifier:withCompletionHandler:](self->_daemonLauncher, "didReceiveNotificationResponse:forBundleIdentifier:withCompletionHandler:", v33, v17, v7);
    else
      -[UNSApplicationLauncher backgroundLaunchApplication:withResponse:completionHandler:](self->_appLauncher, "backgroundLaunchApplication:withResponse:completionHandler:", v17, v33, v7);
  }
  else if (objc_msgSend(v6, "didOpenApplication"))
  {
    if (-[UNCNotificationSourceDescription daemonShouldReceiveApplicationEvents](self->_notificationSourceDescription, "daemonShouldReceiveApplicationEvents"))-[UNSDaemonLauncher didOpenApplicationForResponse:forBundleIdentifier:](self->_daemonLauncher, "didOpenApplicationForResponse:forBundleIdentifier:", v33, v17);
  }
  else
  {
    objc_msgSend(v25, "request");
    v42 = v7;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "content");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "launchImageName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    appLauncher = self->_appLauncher;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __71__UNSDefaultDataProvider__handleBulletinActionResponse_withCompletion___block_invoke;
    v53[3] = &unk_24D63A390;
    v53[4] = self;
    v54 = v33;
    v55 = v17;
    v56 = v42;
    v7 = (void (**)(id, _QWORD))v42;
    -[UNSApplicationLauncher foregroundLaunchApplication:withResponse:launchImageName:origin:endpoint:completionHandler:](appLauncher, "foregroundLaunchApplication:withResponse:launchImageName:origin:endpoint:completionHandler:", v55, v54, v45, v52, v51, v53);

  }
LABEL_36:

}

uint64_t __71__UNSDefaultDataProvider__handleBulletinActionResponse_withCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2 && objc_msgSend(*(id *)(a1[4] + 32), "daemonShouldReceiveApplicationEvents"))
    objc_msgSend(*(id *)(a1[4] + 48), "didOpenApplicationForResponse:forBundleIdentifier:", a1[5], a1[6]);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)_unarchiveNotificationFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x219A03098]();
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, 0);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDecoding");

  }
  else
  {
    v6 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v6;
}

- (void)notificationRepository:(id)a3 didDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__UNSDefaultDataProvider_notificationRepository_didDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke;
  block[3] = &unk_24D63A270;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __100__UNSDefaultDataProvider_notificationRepository_didDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidateBulletins");
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__UNSDefaultDataProvider_notificationRepository_didPerformUpdates_forBundleIdentifier___block_invoke;
  v9[3] = &unk_24D639C20;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

uint64_t __87__UNSDefaultDataProvider_notificationRepository_didPerformUpdates_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRepositoryDidPerformUpdates:", *(_QWORD *)(a1 + 40));
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__UNSDefaultDataProvider_categoryRepository_didChangeCategoriesForBundleIdentifier___block_invoke;
  block[3] = &unk_24D63A270;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __84__UNSDefaultDataProvider_categoryRepository_didChangeCategoriesForBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "reloadSectionParameters");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidateBulletins");
}

- (void)summaryServiceAdapter:(id)a3 didReceiveGroupSummariesForNotificationIdentifiers:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  UNSDefaultDataProvider *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __99__UNSDefaultDataProvider_summaryServiceAdapter_didReceiveGroupSummariesForNotificationIdentifiers___block_invoke;
  v8[3] = &unk_24D639C20;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __99__UNSDefaultDataProvider_summaryServiceAdapter_didReceiveGroupSummariesForNotificationIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v24;
    v7 = (os_log_t *)MEMORY[0x24BDF89A8];
    *(_QWORD *)&v4 = 138543618;
    v22 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(void **)(a1 + 40);
          v12 = v10;
          objc_msgSend(v11, "sectionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v28 = v13;
          v29 = 2114;
          v30 = v9;
          _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating group summary for notification %{public}@", buf, 0x16u);

        }
        v14 = *(_QWORD **)(a1 + 40);
        v15 = (void *)v14[7];
        objc_msgSend(v14, "sectionIdentifier", v22, (_QWORD)v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "notificationRecordForIdentifier:bundleIdentifier:", v9, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 40), "_queue_fetchBulletinForNotification:", v17);
        }
        else
        {
          v18 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            v19 = *(void **)(a1 + 40);
            v20 = v18;
            objc_msgSend(v19, "sectionIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v28 = v21;
            v29 = 2114;
            v30 = v9;
            _os_log_error_impl(&dword_216DCB000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] notification %{public}@ record not found; Can't update group summary.",
              buf,
              0x16u);

          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v5);
  }

}

- (void)_queue_notificationRepositoryDidPerformUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v10, "notificationRecord", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v10, "shouldRepost") & 1) == 0
          && -[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
        {
          -[UNSDefaultDataProvider _queue_modifyBulletinForNotification:](self, "_queue_modifyBulletinForNotification:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = objc_msgSend(v10, "shouldRepost");
            else
              v12 = 1;
            -[UNSDefaultDataProvider _queue_addBulletinForNotification:shouldRepost:](self, "_queue_addBulletinForNotification:shouldRepost:", v11, v12);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[UNSDefaultDataProvider _queue_withdrawBulletinForNotification:shouldSync:](self, "_queue_withdrawBulletinForNotification:shouldSync:", v11, objc_msgSend(v10, "shouldSync"));
          }
        }

        ++v9;
      }
      while (v7 != v9);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v13;
    }
    while (v13);
  }

}

- (void)_queue_fetchBulletinForNotification:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UNSDefaultDataProvider _destinationsForNotification:](self, "_destinationsForNotification:", v4);
    v7 = (void *)*MEMORY[0x24BDF89A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      BBPublisherDestinationStrings();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2048;
      v20 = v6;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching notification %{public}@ destinations %ld: %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    -[UNSDefaultDataProvider _queue_bulletinForNotification:](self, "_queue_bulletinForNotification:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBDataProviderProxy modifyBulletin:](self->_proxy, "modifyBulletin:", v13);

  }
  else
  {
    v14 = (void *)*MEMORY[0x24BDF89A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_ERROR))
      -[UNSDefaultDataProvider _queue_fetchBulletinForNotification:].cold.1(v14, self);
  }

}

- (void)_queue_modifyBulletinForNotification:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  UNCNotificationSourceDescription *notificationSourceDescription;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!objc_msgSend(v4, "pipelineState"))
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UNSDefaultDataProvider _categoryForNotification:](self, "_categoryForNotification:", v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UNSDefaultDataProvider _destinationsForNotification:](self, "_destinationsForNotification:", v4);
      v7 = (os_log_t *)MEMORY[0x24BDF89A8];
      v8 = (void *)*MEMORY[0x24BDF89A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "un_logDigest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        BBPublisherDestinationStrings();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v10;
        v31 = 2114;
        v32 = v12;
        v33 = 2048;
        v34 = v6;
        v35 = 2114;
        v36 = v13;
        _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Modifying notification %{public}@ destinations %ld: %{public}@", buf, 0x2Au);

      }
      -[UNSDefaultDataProvider _queue_bulletinForNotification:](self, "_queue_bulletinForNotification:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UNSDefaultDataProvider _isEligibleForPipeline](self, "_isEligibleForPipeline"))
      {
        v15 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "un_logDigest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v17;
          v31 = 2114;
          v32 = v19;
          _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting modify notification pipeline for %{public}@", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v20 = objc_alloc_init(MEMORY[0x24BEBF3F8]);
        notificationSourceDescription = self->_notificationSourceDescription;
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke;
        v25[3] = &unk_24D63A3E0;
        v25[4] = self;
        v26 = v4;
        objc_copyWeak(&v28, (id *)buf);
        v22 = v20;
        v27 = v22;
        +[UNSNotificationPipelineAdapter updateBulletin:category:destinations:sourceDescription:completion:](UNSNotificationPipelineAdapter, "updateBulletin:category:destinations:sourceDescription:completion:", v14, v24, v6, notificationSourceDescription, v25);

        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[UNSDefaultDataProvider _queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:](self, "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", v4, 0, 0, 0);
        -[BBDataProviderProxy modifyBulletin:](self->_proxy, "modifyBulletin:", v14);
      }

    }
    else
    {
      v23 = (void *)*MEMORY[0x24BDF89A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_ERROR))
        -[UNSDefaultDataProvider _queue_modifyBulletinForNotification:].cold.1(v23, self);
    }

  }
}

void __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject **WeakRetained;
  NSObject **v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "un_logDigest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed modify notification pipeline for %{public}@", buf, 0x16u);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    v15 = WeakRetained[14];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke_76;
    block[3] = &unk_24D63A3B8;
    block[4] = WeakRetained;
    v17 = *(id *)(a1 + 40);
    v20 = a4;
    v18 = v6;
    v19 = *(id *)(a1 + 48);
    dispatch_async(v15, block);

  }
}

uint64_t __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke_76(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "modifyBulletin:", *(_QWORD *)(a1 + 48));
  return objc_opt_class();
}

- (void)_queue_addBulletinForNotification:(id)a3 shouldRepost:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  UNCNotificationSourceDescription *notificationSourceDescription;
  id v24;
  void *v25;
  NSObject *log;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  unint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  BOOL v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v4 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!objc_msgSend(v6, "pipelineState"))
  {
    v29 = v4;
    -[UNSDefaultDataProvider _categoryForNotification:](self, "_categoryForNotification:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[UNSDefaultDataProvider _destinationsForNotification:](self, "_destinationsForNotification:", v6);
    v7 = (void *)*MEMORY[0x24BDF89A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
    {
      log = v7;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "un_logDigest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "hasAlertContent");
      v9 = objc_msgSend(v6, "shouldPresentAlert");
      v10 = objc_msgSend(v6, "hasSound");
      v11 = objc_msgSend(v6, "shouldPlaySound");
      v12 = objc_msgSend(v6, "interruptionLevel");
      BBPublisherDestinationStrings();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "un_logString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545666;
      v38 = v27;
      v39 = 2114;
      v40 = v25;
      v41 = 1024;
      v42 = v8;
      v43 = 1024;
      v44 = v9;
      v45 = 1024;
      v46 = v10;
      v47 = 1024;
      v48 = v11;
      v49 = 2048;
      v50 = v12;
      v51 = 2048;
      v52 = v31;
      v53 = 2114;
      v54 = v13;
      v55 = 2114;
      v56 = v15;
      _os_log_impl(&dword_216DCB000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification %{public}@ [ hasAlertContent: %d, shouldPresentAlert: %d hasSound: %d shouldPlaySound: %d ]; interruption-level: %lu; destinations %ld: %{public}@; contentDate: %{public}@",
        buf,
        0x56u);

    }
    if (v31)
    {
      -[UNSDefaultDataProvider _queue_bulletinForNotification:](self, "_queue_bulletinForNotification:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UNSDefaultDataProvider _isEligibleForPipeline](self, "_isEligibleForPipeline"))
      {
        v17 = (void *)*MEMORY[0x24BDF89A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "un_logDigest");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v19;
          v39 = 2114;
          v40 = v21;
          _os_log_impl(&dword_216DCB000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting add notification pipeline for %{public}@", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v22 = objc_alloc_init(MEMORY[0x24BEBF3F8]);
        notificationSourceDescription = self->_notificationSourceDescription;
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke;
        v32[3] = &unk_24D63A430;
        v32[4] = self;
        v33 = v6;
        objc_copyWeak(&v35, (id *)buf);
        v36 = v29;
        v24 = v22;
        v34 = v24;
        +[UNSNotificationPipelineAdapter createBulletin:category:destinations:sourceDescription:completion:](UNSNotificationPipelineAdapter, "createBulletin:category:destinations:sourceDescription:completion:", v16, v30, v31, notificationSourceDescription, v32);

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[UNSDefaultDataProvider _queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:](self, "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", v6, v29, 0, 0);
        -[BBDataProviderProxy addBulletin:forDestinations:](self->_proxy, "addBulletin:forDestinations:", v16, v31);
      }

    }
  }

}

void __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject **WeakRetained;
  NSObject **v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed add notification pipeline for %{public}@", buf, 0x16u);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    v16 = WeakRetained[14];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke_78;
    v17[3] = &unk_24D63A408;
    v17[4] = WeakRetained;
    v18 = *(id *)(a1 + 40);
    v22 = *(_BYTE *)(a1 + 64);
    v23 = a4;
    v19 = v7;
    v21 = a3;
    v20 = *(id *)(a1 + 48);
    dispatch_async(v16, v17);

  }
}

uint64_t __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke_78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addBulletin:forDestinations:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  return objc_opt_class();
}

- (void)_queue_withdrawBulletinForNotification:(id)a3 shouldSync:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  UNCNotificationSourceDescription *notificationSourceDescription;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x24BDF89A8];
  v9 = (void *)*MEMORY[0x24BDF89A8];
  v10 = *MEMORY[0x24BDF89A8];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v9;
      -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Withdrawing notification %{public}@", buf, 0x16u);

    }
    -[UNSDefaultDataProvider _queue_bulletinForNotification:](self, "_queue_bulletinForNotification:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UNSDefaultDataProvider _isEligibleForPipeline](self, "_isEligibleForPipeline"))
    {
      v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        -[UNSDefaultDataProvider sectionIdentifier](self, "sectionIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting delete notification pipeline for %{public}@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v20 = objc_alloc_init(MEMORY[0x24BEBF3F8]);
      notificationSourceDescription = self->_notificationSourceDescription;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke;
      v23[3] = &unk_24D63A480;
      v23[4] = self;
      v24 = v6;
      objc_copyWeak(&v27, (id *)buf);
      v25 = v7;
      v28 = v4;
      v22 = v20;
      v26 = v22;
      +[UNSNotificationPipelineAdapter deleteBulletin:sourceDescription:completion:](UNSNotificationPipelineAdapter, "deleteBulletin:sourceDescription:completion:", v14, notificationSourceDescription, v23);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[BBDataProviderProxy withdrawBulletinWithPublisherBulletinID:shouldSync:](self->_proxy, "withdrawBulletinWithPublisherBulletinID:shouldSync:", v7, v4);
    }

  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[UNSDefaultDataProvider _queue_withdrawBulletinForNotification:shouldSync:].cold.1(v9, self);
  }

}

void __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "un_logDigest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed delete notification pipeline for %{public}@", buf, 0x16u);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[14];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke_79;
    v11[3] = &unk_24D63A458;
    v11[4] = WeakRetained;
    v12 = *(id *)(a1 + 48);
    v14 = *(_BYTE *)(a1 + 72);
    v13 = *(id *)(a1 + 56);
    dispatch_async(v10, v11);

  }
}

uint64_t __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "withdrawBulletinWithPublisherBulletinID:shouldSync:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return objc_opt_class();
}

- (void)_queue_saveResultNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 isFailure:(BOOL)a5 resultBulletin:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  UNCNotificationRepository *notificationRepository;
  void *v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v17 = a3;
  v10 = a6;
  if (v7)
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v17, "setPipelineState:", v11);
  if (v10)
  {
    objc_msgSend(v17, "setIsHighlight:", objc_msgSend(v10, "isHighlight"));
    objc_msgSend(v10, "summary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSummary:", v12);

    objc_msgSend(v10, "eventBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEventBehavior:", v13);

  }
  -[UNCNotificationSourceDescription bundleIdentifier](self->_notificationSourceDescription, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  notificationRepository = self->_notificationRepository;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "revisionNumber"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:](notificationRepository, "saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:", v17, v16, v8, v14, &__block_literal_global_81);

}

- (id)_categoryForNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "categoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _categoryForIdentifier:](self, "_categoryForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEBF3E8]);
    -[UNSDefaultDataProvider bundle](self, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithBundle:", v7);

    objc_msgSend(v8, "notificationCategoryForNotificationCategoryRecord:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_destinationsForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;

  v4 = a3;
  objc_msgSend(v4, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _categoryForIdentifier:](self, "_categoryForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "presentationOptions");
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceClass");

  v10 = v9 != 4;
  if (!objc_msgSend(v4, "shouldPresentAlert") || !objc_msgSend(v4, "hasAlertContent"))
  {
    if (objc_msgSend(v4, "shouldPlaySound"))
      v20 = objc_msgSend(v4, "hasSound");
    else
      v20 = 0;
    goto LABEL_21;
  }
  v11 = v7 & 0x14;
  v12 = v10 & (v7 >> 3) | (v7 >> 2) & 1;
  v13 = v7 & 0xC;
  if (!-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
  {
    if (v12)
      v26 = (8 * (v11 != 0)) | 4;
    else
      v26 = 8 * (v11 != 0);
    if (v13)
      v19 = v26 | 2;
    else
      v19 = v26;
    v20 = v19 | 0x80;
    if (!objc_msgSend(v6, "shouldAllowInCarPlay"))
      goto LABEL_21;
    goto LABEL_37;
  }
  v14 = v11 != 0;
  if (objc_msgSend(v4, "allowsAlertDestination"))
    v15 = 8 * v14;
  else
    v15 = 0;
  if ((objc_msgSend(v4, "allowsLockScreenDestination") & v12) != 0)
    v16 = v15 | 4;
  else
    v16 = v15;
  v17 = objc_msgSend(v4, "allowsNotificationCenterDestination");
  v18 = v16 | 2;
  if (!v13)
    v18 = v16;
  if (v17)
    v19 = v18;
  else
    v19 = v16;
  v20 = v19 | 0x80;
  if (objc_msgSend(v6, "shouldAllowInCarPlay")
    && objc_msgSend(v4, "allowsCarPlayDestination"))
  {
LABEL_37:
    if (!-[UNSDefaultDataProvider _isAppProtectionActive](self, "_isAppProtectionActive"))
      v20 = v19 | 0xC0;
  }
LABEL_21:
  if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties"))
  {
    objc_msgSend(v4, "topicIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(v4, "hasCriticalAlertSound"))
  {
    v22 = -[UNSDefaultDataProvider _queue_supportsCriticalAlertsForSubsectionIDs:](self, "_queue_supportsCriticalAlertsForSubsectionIDs:", v21);
    v23 = 256;
    if (v22)
      v23 = 66304;
  }
  else
  {
    v23 = 256;
  }
  v24 = v23 | v20;

  return v24;
}

- (void)_addAttachments:(id)a3 toBulletinRequest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "family") - 1;
        if (v12 > 2)
          v13 = 0;
        else
          v13 = qword_216E05348[v12];
        objc_msgSend(v11, "options");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "displayLocation");

        objc_msgSend(v11, "options");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "displayLocation") == 1;

        v18 = objc_alloc_init(MEMORY[0x24BE0FE58]);
        objc_msgSend(v18, "setType:", v13);
        objc_msgSend(v11, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setURL:", v19);

        objc_msgSend(v11, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setIdentifier:", v20);

        objc_msgSend(v11, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUniformType:", v21);

        objc_msgSend(v11, "options");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "thumbnailGeneratorUserInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setThumbnailGeneratorUserInfo:", v23);

        objc_msgSend(v18, "setThumbnailHidden:", v15 == 2);
        objc_msgSend(v18, "setHiddenFromDefaultExpandedView:", v17);
        objc_msgSend(v6, "primaryAttachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 || v15 == 2)
        {
          objc_msgSend(v6, "additionalAttachments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            v27 = v25;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE30], "array");
            v27 = (id)objc_claimAutoreleasedReturnValue();
          }
          v28 = v27;

          objc_msgSend(v28, "arrayByAddingObject:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "setAdditionalAttachments:", v29);
        }
        else
        {
          objc_msgSend(v6, "setPrimaryAttachment:", v18);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

}

- (id)_sectionIconVariantForImageName:(id)a3 bundlePath:(id)a4 format:(int64_t)a5 precomposed:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BE0FE78], "variantWithFormat:imageName:inBundleAtPath:", a5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrecomposed:", v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_sectionIconForNotificationSourceDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = a3;
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "suppressIconMask");
  objc_msgSend(v4, "defaultIconFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v8, v6, 0, v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subordinateIconFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v9, v6, 26, v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "carPlayIconFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v10, v6, 14, v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "settingsIconFile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v11, v6, 1, v7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "settingsSheetIconFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v12, v6, 17, v7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLookSmallIconFile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v13, v6, 2, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLookLargeIconFile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v15, v6, 4, v7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchListSmallIconFile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v16, v6, 10, v7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchListLargeIconFile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v17, v6, 12, v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLook394hIconFile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v18, v6, 4, v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLook448hIconFile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v19, v6, 15, v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchList394hIconFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v20, v6, 12, v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchList448hIconFile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v21, v6, 18, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLook430hIconFile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v23, v6, 4, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchQuickLook484hIconFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v25, v6, 20, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchList430hIconFile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v27, v6, 12, v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "watchList484hIconFile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNSDefaultDataProvider _sectionIconVariantForImageName:bundlePath:format:precomposed:](self, "_sectionIconVariantForImageName:bundlePath:format:precomposed:", v29, v6, 20, v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    || v41
    || v34
    || v35
    || v44
    || v43
    || v42
    || v40
    || v39
    || v38
    || v22
    || v24
    || v26
    || v28
    || (v31 = 0, v30))
  {
    v32 = objc_alloc_init(MEMORY[0x24BE0FE70]);
    v31 = v32;
    if (v35)
      objc_msgSend(v32, "addVariant:", v35);
    if (v34)
      objc_msgSend(v31, "addVariant:", v34);
    if (v44)
      objc_msgSend(v31, "addVariant:");
    if (v43)
      objc_msgSend(v31, "addVariant:");
    if (v42)
      objc_msgSend(v31, "addVariant:");
    if (v14)
      objc_msgSend(v31, "addVariant:");
    if (v41)
      objc_msgSend(v31, "addVariant:", v41);
    if (v40)
      objc_msgSend(v31, "addVariant:");
    if (v39)
      objc_msgSend(v31, "addVariant:");
    if (v37)
      objc_msgSend(v31, "addVariant:", v37);
    if (v36)
      objc_msgSend(v31, "addVariant:");
    if (v38)
      objc_msgSend(v31, "addVariant:");
    if (v22)
      objc_msgSend(v31, "addVariant:", v22);
    if (v24)
      objc_msgSend(v31, "addVariant:", v24);
    if (v26)
      objc_msgSend(v31, "addVariant:", v26);
    if (v28)
      objc_msgSend(v31, "addVariant:", v28);
    if (v30)
      objc_msgSend(v31, "addVariant:", v30);
  }

  return v31;
}

- (unint64_t)_bulletinInterruptionLevelForInterruptionLevel:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return a3;
}

- (BOOL)_isTCCUserAvailabilityGrantedForBundleId:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF8990];
  v6 = *MEMORY[0x24BDF8990];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "Looking up User Availability permission for bundleId: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if (objc_msgSend(v4, "length"))
  {
    -[UNSDefaultDataProvider _userAvailabilityTCCApprovedBundleIds](self, "_userAvailabilityTCCApprovedBundleIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

  }
  else
  {
    v9 = *v5;
    v8 = 0;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "Empty bundleId passed to isTCCUserAvailabilityGrantedForBundleId", (uint8_t *)&v11, 2u);
      v8 = 0;
    }
  }

  return v8;
}

- (id)_userAvailabilityTCCApprovedBundleIds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BBDataProviderProxy)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_categoryToParamSubType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_notificationSourceDescription, 0);
  objc_storeStrong((id *)&self->_effectiveSectionInfo, 0);
  objc_storeStrong((id *)&self->_sectionIcon, 0);
}

- (void)_queue_bulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(a2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_216DCB000, v3, v5, "[%{public}@] Notification record has no identifier", v6);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_bulletinForNotification:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5_0();
  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "sectionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v1;
  OUTLINED_FUNCTION_1_2(&dword_216DCB000, v0, v4, "[%{public}@] Communication context is not nil but contentType is '%{public}@'. Abandoning communication API features.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_3();
}

- (void)_queue_bulletinForNotification:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "spotlightIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "subtitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadSummary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 138413059;
  v11 = v6;
  v12 = 2117;
  v13 = v7;
  v14 = 2117;
  v15 = v8;
  v16 = 2117;
  v17 = v9;
  _os_log_debug_impl(&dword_216DCB000, a3, OS_LOG_TYPE_DEBUG, "group summaries request for record with spotlightIdentifier: %@ title: %{sensitive}@ subtitle: %{sensitive}@ threadSummary: %{sensitive}@", (uint8_t *)&v10, 0x2Au);

}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_216DCB000, v3, v4, "[%{public}@] _UNNotificationContentType is '%{public}@' but messaging notifications are  not allowed. Abandoning communication API features for all messaging notifications. Perhaps app isn't allowed to donate messaging intents or is missing the communication entitlement.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_216DCB000, v3, v4, "[%{public}@] _UNNotificationContentType is '%{public}@' but intercom-type notifications are  not allowed. Abandoning communication API features for all intercom notifications. Perhaps app isn't allowed to donate read announcement intents or is missing the communication entitlement.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_216DCB000, v3, v4, "[%{public}@] _UNNotificationContentType is '%{public}@' but call-type notifications are  not allowed. Abandoning communication API features for all call-related notifications. Perhaps app isn't allowed to donate start call intents or is missing the communication entitlement.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_handleBulletinActionResponse:withCompletion:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(v2);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bulletinPublisherID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_216DCB000, v4, v5, "[%{public}@] Unable to fetch or unarchive notification to handle action response for: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_3();
}

- (void)_handleBulletinActionResponse:withCompletion:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "sourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  _os_log_fault_impl(&dword_216DCB000, v0, OS_LOG_TYPE_FAULT, "Received unexpected notification response for section %{public}@ in data provider for section %{public}@", v3, 0x16u);

  OUTLINED_FUNCTION_1_3();
}

- (void)_unarchiveNotificationFromData:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_2(&dword_216DCB000, a4, a3, "[%{public}@] Ignoring keyed archive data contains that invalid classes: %{public}@", (uint8_t *)a3);

}

- (void)_queue_fetchBulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(a2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_216DCB000, v3, v5, "[%{public}@] Cannot fetch notification becuase identifier is nil", v6);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_modifyBulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(a2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_216DCB000, v3, v5, "[%{public}@] Cannot modify notification becuase identifier is nil", v6);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_withdrawBulletinForNotification:(void *)a1 shouldSync:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_0(a1);
  objc_msgSend(a2, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_216DCB000, v3, v5, "[%{public}@] Cannot withdraw notification becuase identifier is nil", v6);

  OUTLINED_FUNCTION_7();
}

@end
