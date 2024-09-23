@implementation PUIContactsAuthorizationLevelController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIContactsAuthorizationLevelController;
  -[PSListItemsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleContactStoreDidChangeNotification_, *MEMORY[0x1E0C96870], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PUIContactsPrivacyUpgradePromptCompletedNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PUIContactsPrivacyUpgradePromptCompletedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C96870], 0);

  v5.receiver = self;
  v5.super_class = (Class)PUIContactsAuthorizationLevelController;
  -[PSListItemsController dealloc](&v5, sel_dealloc);
}

- (void)_handleUpgradePromptNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  dispatch_time_t v8;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIContactsPrivacyUpgradePromptAppIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PUIContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1EA26B358;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __76__PUIContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  id v4;

  -[PUIContactsAuthorizationLevelController fullAccessSpecifier](self, "fullAccessSpecifier", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v4, 2);
  -[PUIContactsAuthorizationLevelController reloadSpecifier:](self, "reloadSpecifier:", v4);

}

- (unint64_t)_currentTCCAuthorizationRight
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (_currentTCCAuthorizationRight_onceToken != -1)
    dispatch_once(&_currentTCCAuthorizationRight_onceToken, &__block_literal_global_7);
  -[NSString cStringUsingEncoding:](self->_serviceKey, "cStringUsingEncoding:", 4);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5 = (id)tcc_identity_create();
  tcc_server_message_get_authorization_records_by_identity();
  v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_currentTCCAuthorizationRight_tccServer;
  _currentTCCAuthorizationRight_tccServer = v0;

}

void __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    tcc_authorization_record_get_service();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", tcc_service_get_name(), 4);
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("kTCCServiceAddressBook")))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = tcc_authorization_record_get_authorization_right();

  }
  else
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting Contacts authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (id)_parentTCCSpecifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t i;
  char *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t j;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  void *v24;
  void *v26;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PUIContactsAuthorizationLevelController;
  -[PSListItemsController specifiers](&v38, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  v6 = (int *)MEMORY[0x1E0D805B0];
  if (v5)
  {
    v7 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = *(char **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (*(_QWORD *)&v9[*v6] == 3)
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "intValue");

          if (v11 == 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    v28 = *MEMORY[0x1E0D80780];
    v16 = v5 ^ 1;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v18 = *(char **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        v21 = *(_QWORD *)&v18[*v6];
        if (v21 != 3 || (_DWORD)v20 != 4)
        {
          if (v21 == 3)
            v23 = v16;
          else
            v23 = 1;
          if ((v23 & 1) != 0 || (_DWORD)v20)
          {
            if (v21 == 3 && (v20 - 1) <= 1)
            {
              objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), v28);
              -[PUIContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v18, v20);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setIdentifier:", v24);

          }
          objc_msgSend(v3, "addObject:", v18);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v14);
  }

  v26 = (void *)objc_msgSend(v3, "copy");
  return v26;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serviceKey;
  NSString *v7;
  NSString *displayName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUIContactsAuthorizationLevelController;
  v4 = a3;
  -[PUIContactsAuthorizationLevelController setSpecifier:](&v9, sel_setSpecifier_, v4);
  objc_msgSend(v4, "identifier", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  objc_msgSend(v4, "propertyForKey:", CFSTR("appLocalizedDisplayName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  displayName = self->_displayName;
  self->_displayName = v7;

}

- (id)specifiers
{
  PUIContactsAuthorizationLevelController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3))
  {
    v4 = -[PUIContactsAuthorizationLevelController _currentTCCAuthorizationRight](v2, "_currentTCCAuthorizationRight");
    -[PUIContactsAuthorizationLevelController specifier](v2, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyForKey:", CFSTR("hasPickerInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    if (v4 == 2)
      v8 = 0;
    else
      v8 = v7;

    -[PUIContactsAuthorizationLevelController specifier](v2, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("hasTCCOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v11)
    {
      -[PUIContactsAuthorizationLevelController _parentTCCSpecifiers](v2, "_parentTCCSpecifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v13);
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIContactsAuthorizationLevelController footerStringForSpecifiers:](v2, "footerStringForSpecifiers:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "setProperty:forKey:", v15, *MEMORY[0x1E0D80848]);
      -[PUIContactsAuthorizationLevelController _limitedAccessSectionSpecifiers](v2, "_limitedAccessSectionSpecifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v16);

    }
    -[PUIContactsAuthorizationLevelController _pickerUsageSectionSpecifiers](v2, "_pickerUsageSectionSpecifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v8)
    {
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v17, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_AUTH_HEADER"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v20);

      }
      objc_msgSend(v12, "addObjectsFromArray:", v18);
    }
    v21 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v12;

  }
  objc_sync_exit(v2);

  return *(id *)((char *)&v2->super.super.super.super.super.super.isa + v3);
}

- (id)_pickerUsageSectionSpecifiers
{
  void *v3;
  NSArray *pickerUsageSectionSpecifiers;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  bundleIdentifiersWithPickerAccess();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", self->_serviceKey))
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    if (!pickerUsageSectionSpecifiers)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *MEMORY[0x1E0D80868];
      objc_msgSend(v5, "setProperty:forKey:", CFSTR("CONTACTS_PICKER_INFO_GROUP"), *MEMORY[0x1E0D80868]);
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", CFSTR("CONTACTS_PICKER_INFO_CELL"), v6);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC53D8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80938]);

      objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
      v13[0] = v5;
      v13[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_pickerUsageSectionSpecifiers;
      self->_pickerUsageSectionSpecifiers = v9;

      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    }
    v11 = pickerUsageSectionSpecifiers;
  }
  else
  {
    v11 = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)_limitedAccessSectionSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *limitedAccessSectionSpecifiers;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!self->_limitedAccessSectionSpecifiers)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D80868];
    objc_msgSend(v3, "setProperty:forKey:", CFSTR("CONTACTS_MANUAL_SELECTION_GROUP"), *MEMORY[0x1E0D80868]);
    v5 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_MANUAL_SELECTION_BUTTON"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80808]);

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("CONTACTS_MANUAL_SELECTION_BUTTON"), v4);
    objc_msgSend(v7, "setButtonAction:", sel__presentContactsPickerForModifyingSelection);
    v12[0] = v3;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    self->_limitedAccessSectionSpecifiers = v9;

  }
  if (-[PUIContactsAuthorizationLevelController _currentTCCAuthorizationRight](self, "_currentTCCAuthorizationRight") == 3)
    return self->_limitedAccessSectionSpecifiers;
  else
    return MEMORY[0x1E0C9AA60];
}

- (void)updateContactsCountSubtitleForSpecifier:(id)a3 contactsTCCAccess:(int)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v9 = v8;
  if (a4 == 1)
  {
    objc_msgSend(v8, "getLimitedAccessContactsCountForBundle:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v10 = (void *)v15;
      v12 = 0;
      goto LABEL_17;
    }
    _PUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore for %@", buf, 0xCu);
    }
    v12 = 0;
    goto LABEL_15;
  }
  if (a4 != 2)
  {
    v12 = 0;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v23 = 0;
  objc_msgSend(v8, "unifiedContactCountWithError:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  if (!v13)
  {
    _PUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore (%@)", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  v16 = v10;

  if (a4 == 1)
  {
    if (objc_msgSend(v16, "longValue") < 1)
    {
      PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_LIMITEDACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v21, *MEMORY[0x1E0D80740]);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForPrivacy(CFSTR("LIMITEDACCESS_CONTACTS_COUNT_SECONDARY_LABEL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v16, "longValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v22, *MEMORY[0x1E0D80740]);

    }
    -[PUIContactsAuthorizationLevelController setLimitedAccessCount:](self, "setLimitedAccessCount:", v16);
    -[PUIContactsAuthorizationLevelController setLimitedAccessSpecifier:](self, "setLimitedAccessSpecifier:", v6);
  }
  else if (a4 == 2)
  {
    if (objc_msgSend(v16, "longValue") < 1)
    {
      PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_FULLACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v18, *MEMORY[0x1E0D80740]);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForPrivacy(CFSTR("FULLACCESS_CONTACTS_COUNT_SECONDARY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, objc_msgSend(v16, "longValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v19, *MEMORY[0x1E0D80740]);

    }
    -[PUIContactsAuthorizationLevelController setFullAccessSpecifier:](self, "setFullAccessSpecifier:", v6);
  }
  -[PUIContactsAuthorizationLevelController reloadSpecifier:](self, "reloadSpecifier:", v6);

}

- (BOOL)isAppLinkedWithContactsLimitedAccessSupportedSDK
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v11;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v11);

  if (v5 && (objc_msgSend(v5, "SDKVersion"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "SDKVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compare:options:", CFSTR("18.0"), 64);

    v9 = v8 < 2;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)contactPicker:(Class)a3 didSelectContacts:(id)a4
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  NSObject *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PUIContactsAuthorizationLevelController limitedAccessSpecifier](self, "limitedAccessSpecifier", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v5, 1);
  -[PUIContactsAuthorizationLevelController reloadSpecifier:](self, "reloadSpecifier:", v5);
  if (!-[PUIContactsAuthorizationLevelController isAppLinkedWithContactsLimitedAccessSupportedSDK](self, "isAppLinkedWithContactsLimitedAccessSupportedSDK"))
  {
    _PUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
      v7 = objc_claimAutoreleasedReturnValue();
      -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "App %@(%@) is linked using SDK that doesn't support LimitedAccess for Contacts", buf, 0x16u);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("Terminating app as selected contacts changed for legacy linked app"));
    if (!v9)
      goto LABEL_22;
    v10 = objc_alloc(MEMORY[0x1E0CA5850]);
    -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:URL:personaUniqueString:personaType:", v11, 0, 0, 4);

    objc_msgSend(MEMORY[0x1E0D87D80], "identityForLSApplicationIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      _PUILoggingFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
      v16 = objc_claimAutoreleasedReturnValue();
      -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get process identity for %@(%@)", buf, 0x16u);

LABEL_20:
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentity:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v14, v9);
    v16 = v15;
    if (v15)
    {
      v26 = 0;
      v17 = -[NSObject execute:](v15, "execute:", &v26);
      v18 = v26;
      v19 = v18;
      if (v17)
      {
        _PUILoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
          v21 = objc_claimAutoreleasedReturnValue();
          -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v21;
          v29 = 2112;
          v30 = v22;
          v23 = "Successfully terminated %@(%@)";
LABEL_17:
          _os_log_impl(&dword_1DB1FB000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (-[NSObject code](v18, "code") != 3)
      {
        _PUILoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
          v21 = objc_claimAutoreleasedReturnValue();
          -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v21;
          v29 = 2112;
          v30 = v22;
          v23 = "Failed to kill %@(%@)";
          goto LABEL_17;
        }
LABEL_18:

      }
    }
    else
    {
      _PUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
        v20 = objc_claimAutoreleasedReturnValue();
        -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v20;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_1DB1FB000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create terminate request for %@(%@)", buf, 0x16u);

        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
LABEL_23:

}

- (void)_presentContactsPickerForModifyingSelection
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  getCNLimitedAccessContactPickerViewControllerClass();
  if (objc_opt_class())
  {
    -[PUIContactsAuthorizationLevelController limitedAccessCount](self, "limitedAccessCount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "longValue");

    v5 = objc_alloc((Class)getCNLimitedAccessContactPickerViewControllerClass());
    -[PUIContactsAuthorizationLevelController displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIContactsAuthorizationLevelController serviceKey](self, "serviceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 <= 0)
      v8 = objc_msgSend(v5, "initDeltaPickerForAppName:bundleId:", v6, v7);
    else
      v8 = objc_msgSend(v5, "initSettingsPickerForAppName:bundleId:", v6, v7);
    v9 = (void *)v8;

    objc_msgSend(v9, "setDelegate:", self);
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__PUIContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke;
      v10[3] = &unk_1EA26B358;
      v10[4] = self;
      -[PUIContactsAuthorizationLevelController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v10);

    }
  }
}

void __86__PUIContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "Edit selected contacts view controller dismissed for %@(%@)", (uint8_t *)&v5, 0x16u);

  }
}

- (id)footerStringForSpecifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "values", (_QWORD)v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", &unk_1EA27E648);

        objc_msgSend(v8, "values");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", &unk_1EA27E660);

        if ((v11 & 1) != 0 || v14)
        {

          PUI_LocalizedStringForPrivacy(CFSTR("CONTACTS_PRIVACY_FOOTER"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }

  v15 = 0;
LABEL_12:

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PUIContactsAuthorizationLevelController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUIContactsAuthorizationLevelController specifierAtIndex:](self, "specifierAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "propertyForKey:", *MEMORY[0x1E0D80868]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("CONTACTS_MANUAL_SELECTION_BUTTON"));

      if (v12)
      {
        objc_msgSend(v10, "performButtonAction");
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      }
      else
      {
        v18.receiver = self;
        v18.super_class = (Class)PUIContactsAuthorizationLevelController;
        -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
        objc_msgSend(v10, "values");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");

        if (v15 == 2)
        {
          -[PUIContactsAuthorizationLevelController _removeLimitedAccessSectionIfPresent](self, "_removeLimitedAccessSectionIfPresent");
          -[PUIContactsAuthorizationLevelController _removePickerUsageSectionIfPresent](self, "_removePickerUsageSectionIfPresent");
        }
        else if (v15 == 1)
        {
          -[NSArray firstObject](self->_limitedAccessSectionSpecifiers, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v16);

          if ((v17 & 1) == 0)
          {
            -[PUIContactsAuthorizationLevelController _addLimitedAccessSection](self, "_addLimitedAccessSection");
            -[PUIContactsAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
            -[PUIContactsAuthorizationLevelController _presentContactsPickerForModifyingSelection](self, "_presentContactsPickerForModifyingSelection");
          }
        }
        else
        {
          -[PUIContactsAuthorizationLevelController _removeLimitedAccessSectionIfPresent](self, "_removeLimitedAccessSectionIfPresent");
          -[PUIContactsAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
        }
      }
    }

  }
}

- (void)_addLimitedAccessSection
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (-[NSArray count](self->_pickerUsageSectionSpecifiers, "count")
    && (-[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3),
        v3,
        v4))
  {
    -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUIContactsAuthorizationLevelController indexOfSpecifier:](self, "indexOfSpecifier:", v5);

    -[PUIContactsAuthorizationLevelController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_limitedAccessSectionSpecifiers, v6, 1);
  }
  else
  {
    -[PUIContactsAuthorizationLevelController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_limitedAccessSectionSpecifiers, 1);
  }
}

- (void)_removeLimitedAccessSectionIfPresent
{
  void *v3;
  int v4;

  -[NSArray firstObject](self->_limitedAccessSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PUIContactsAuthorizationLevelController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_limitedAccessSectionSpecifiers, 1);
}

- (void)_addPickerUsageSectionIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:"))
  {

  }
  else
  {
    bundleIdentifiersWithPickerAccess();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", self->_serviceKey);

    if (v4)
      -[PUIContactsAuthorizationLevelController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_pickerUsageSectionSpecifiers, 1);
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  void *v3;
  int v4;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIContactsAuthorizationLevelController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PUIContactsAuthorizationLevelController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_pickerUsageSectionSpecifiers, 1);
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
  objc_storeStrong((id *)&self->_entityBundle, a3);
}

- (PSSpecifier)fullAccessSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_fullAccessSpecifier);
}

- (void)setFullAccessSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_fullAccessSpecifier, a3);
}

- (PSSpecifier)limitedAccessSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_limitedAccessSpecifier);
}

- (void)setLimitedAccessSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_limitedAccessSpecifier, a3);
}

- (NSNumber)limitedAccessCount
{
  return self->_limitedAccessCount;
}

- (void)setLimitedAccessCount:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessCount, 0);
  objc_destroyWeak((id *)&self->_limitedAccessSpecifier);
  objc_destroyWeak((id *)&self->_fullAccessSpecifier);
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedAccessSectionSpecifiers, 0);
}

void __72__PUIContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DB1FB000, v0, v1, "Error when requesting Contacts TCC for identity: %@ error: %@");
  OUTLINED_FUNCTION_2_0();
}

@end
