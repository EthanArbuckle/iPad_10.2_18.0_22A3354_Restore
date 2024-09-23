@implementation PSCalendarPolicyAuthorizationLevelController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
  -[PSListItemsController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PSCalendarPrivacyUpgradePromptCompletedNotification"), 0);

}

- (void)_handleUpgradePromptNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  dispatch_time_t v7;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PSCalendarPrivacyUpgradePromptAppIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_clientIdentifier);

  if (v6)
  {
    v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PSCalendarPolicyAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E4A654F0;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __81__PSCalendarPolicyAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceKey;
  NSString *v7;
  NSString *clientIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
  v4 = a3;
  -[PSListController setSpecifier:](&v9, sel_setSpecifier_, v4);
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  objc_msgSend(v4, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v7;

}

- (id)specifiers
{
  PSCalendarPolicyAuthorizationLevelController *v2;
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *specifiers;
  objc_super v9;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9.receiver = v2;
    v9.super_class = (Class)PSCalendarPolicyAuthorizationLevelController;
    -[PSListItemsController specifiers](&v9, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

    -[NSArray firstObject](v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSCalendarPolicyAuthorizationLevelController footerStringForSpecifiers:](v2, "footerStringForSpecifiers:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("footerText"));
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v3;

  }
  objc_sync_exit(v2);

  return v2->super.super._specifiers;
}

- (id)footerStringForSpecifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
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
  const __CFString *v23;
  PSCalendarPolicyAuthorizationLevelController *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v25 = self;
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "values");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", &unk_1E4A92E50);

        objc_msgSend(v9, "values");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", &unk_1E4A92E68);

        if ((v12 & 1) != 0 || v15)
        {

          v18 = (void *)MEMORY[0x1E0CA5870];
          -[PSCalendarPolicyAuthorizationLevelController serviceKey](v25, "serviceKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bundleRecordWithApplicationIdentifier:error:", v19, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSCalendarPolicyController loadPrivacySettingsBundle](PSCalendarPolicyController, "loadPrivacySettingsBundle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v20)
            v23 = CFSTR("CALENDARS_AUTH_EVENTKIT_FOOTER");
          else
            v23 = CFSTR("CALENDARS_AUTH_EVENTKIT_FOOTER_NO_APP_NAME");
          objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E4A69238, CFSTR("Privacy"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
  v17 = v4;
LABEL_15:

  return v16;
}

+ (int64_t)cellStyle
{
  return 1;
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
