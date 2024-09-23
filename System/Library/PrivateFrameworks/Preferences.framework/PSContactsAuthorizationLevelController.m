@implementation PSContactsAuthorizationLevelController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSContactsAuthorizationLevelController;
  -[PSListItemsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PSContactsPrivacyUpgradePromptCompletedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleUpgradePromptNotification_, CFSTR("PSContactsPrivacyUpgradePromptCompletedNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _Unwind_Exception *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PSContactsPrivacyUpgradePromptCompletedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = (_QWORD *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  v12 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    v6 = (void *)ContactsLibrary();
    v5 = dlsym(v6, "CNContactStoreDidChangeNotification");
    v10[3] = (uint64_t)v5;
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
  {
    v7 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v4, "removeObserver:name:object:", self, *v5, 0);

  v8.receiver = self;
  v8.super_class = (Class)PSContactsAuthorizationLevelController;
  -[PSListItemsController dealloc](&v8, sel_dealloc);
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PSContactsPrivacyUpgradePromptAppIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PSContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke;
    block[3] = &unk_1E4A654F0;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __75__PSContactsAuthorizationLevelController__handleUpgradePromptNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  id v4;

  -[PSContactsAuthorizationLevelController fullAccessSpecifier](self, "fullAccessSpecifier", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v4, 2);
  -[PSListController reloadSpecifier:](self, "reloadSpecifier:", v4);

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
    dispatch_once(&_currentTCCAuthorizationRight_onceToken, &__block_literal_global_21);
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

void __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_currentTCCAuthorizationRight_tccServer;
  _currentTCCAuthorizationRight_tccServer = v0;

}

void __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting Contacts authorization for identity: %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (id)_parentTCCSpecifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t j;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  void *v23;
  void *v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PSContactsAuthorizationLevelController;
  -[PSListItemsController specifiers](&v36, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (v8[7] == 3)
        {
          objc_msgSend(v8, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "intValue");

          if (v10 == 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    v15 = v5 ^ 1;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");

        v20 = v17[7];
        if (v20 != 3 || (_DWORD)v19 != 4)
        {
          if (v20 == 3)
            v22 = v15;
          else
            v22 = 1;
          if ((v22 & 1) != 0 || (_DWORD)v19)
          {
            if (v20 == 3 && (v19 - 1) <= 1)
            {
              objc_msgSend(v17, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
              -[PSContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v17, v19);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setIdentifier:", v23);

          }
          objc_msgSend(v3, "addObject:", v17);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v13);
  }

  v25 = (void *)objc_msgSend(v3, "copy");
  return v25;
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
  v9.super_class = (Class)PSContactsAuthorizationLevelController;
  v4 = a3;
  -[PSListController setSpecifier:](&v9, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("appBundleID"), v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceKey = self->_serviceKey;
  self->_serviceKey = v5;

  objc_msgSend(v4, "propertyForKey:", CFSTR("appLocalizedDisplayName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  displayName = self->_displayName;
  self->_displayName = v7;

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
        v11 = objc_msgSend(v10, "isEqual:", &unk_1E4A92F10);

        objc_msgSend(v8, "values");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", &unk_1E4A92F28);

        if ((v11 & 1) != 0 || v14)
        {

          PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_PRIVACY_FOOTER"));
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

- (id)_pickerUsageSectionSpecifiers
{
  void *v3;
  NSArray *pickerUsageSectionSpecifiers;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  bundleIdentifiersWithPickerAccess();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", self->_serviceKey))
  {
    pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    if (!pickerUsageSectionSpecifiers)
    {
      +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", CFSTR("CONTACTS_PICKER_INFO_GROUP"), CFSTR("id"));
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", CFSTR("CONTACTS_PICKER_INFO_CELL"), CFSTR("id"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEBC10]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v7, CFSTR("height"));

      objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
      v12[0] = v5;
      v12[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_pickerUsageSectionSpecifiers;
      self->_pickerUsageSectionSpecifiers = v8;

      pickerUsageSectionSpecifiers = self->_pickerUsageSectionSpecifiers;
    }
    v10 = pickerUsageSectionSpecifiers;
  }
  else
  {
    v10 = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_limitedAccessSectionSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *limitedAccessSectionSpecifiers;
  unint64_t v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!self->_limitedAccessSectionSpecifiers)
  {
    +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", CFSTR("CONTACTS_MANUAL_SELECTION_GROUP"), CFSTR("id"));
    PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_MANUAL_SELECTION_BUTTON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("enabled"));

    objc_msgSend(v5, "setProperty:forKey:", CFSTR("CONTACTS_MANUAL_SELECTION_BUTTON"), CFSTR("id"));
    objc_msgSend(v5, "setButtonAction:", sel__presentContactsPickerForModifyingSelection);
    v15[0] = v3;
    v15[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    limitedAccessSectionSpecifiers = self->_limitedAccessSectionSpecifiers;
    self->_limitedAccessSectionSpecifiers = v7;

  }
  v9 = -[PSContactsAuthorizationLevelController _currentTCCAuthorizationRight](self, "_currentTCCAuthorizationRight");
  if (v9 == 3)
  {
    v10 = self->_limitedAccessSectionSpecifiers;
  }
  else
  {
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "sf_isInternalInstall") & 1) != 0 || PSDiagnosticsAreEnabled())
    {
      _PSLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PSContactsAuthorizationLevelController _limitedAccessSectionSpecifiers].cold.1(v11, v13);

    }
    v10 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  return v10;
}

- (void)updateContactsCountSubtitleForSpecifier:(id)a3 contactsTCCAccess:(int)a4
{
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 buf;
  Class (*v28)(uint64_t);
  void *v29;
  id *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (id)getCNContactStoreClass_softClass;
  v26 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v28 = __getCNContactStoreClass_block_invoke;
    v29 = &unk_1E4A65650;
    v30 = &v23;
    __getCNContactStoreClass_block_invoke((uint64_t)&buf);
    v8 = v24[3];
  }
  v9 = (objc_class *)objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  v10 = objc_alloc_init(v9);
  v11 = v10;
  if (a4 == 1)
  {
    objc_msgSend(v10, "getLimitedAccessContactsCountForBundle:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14 = 0;
      goto LABEL_17;
    }
    _PSLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore for %@", (uint8_t *)&buf, 0xCu);
    }
    v14 = 0;
    goto LABEL_15;
  }
  if (a4 != 2)
  {
    v14 = 0;
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v23 = 0;
  objc_msgSend(v10, "unifiedContactCountWithError:", &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  v14 = v13;
  if (!v12 && v13)
  {
    _PSLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "Error: unable to get contacts count from ContactStore (%@)", (uint8_t *)&buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  v16 = v12;

  if (a4 == 1)
  {
    if (objc_msgSend(v16, "longValue") < 1)
    {
      PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_LIMITEDACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v21, CFSTR("cellSubtitleText"));
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      PS_LocalizedStringForSystemPolicy(CFSTR("LIMITEDACCESS_CONTACTS_COUNT_SECONDARY_LABEL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v16, "longValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v22, CFSTR("cellSubtitleText"));

    }
    -[PSContactsAuthorizationLevelController setLimitedAccessCount:](self, "setLimitedAccessCount:", v16);
    -[PSContactsAuthorizationLevelController setLimitedAccessSpecifier:](self, "setLimitedAccessSpecifier:", v6);
  }
  else if (a4 == 2)
  {
    if (objc_msgSend(v16, "longValue") < 1)
    {
      PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_FULLACCESS_NOCONTACTS_COUNT_SECONDARY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v18, CFSTR("cellSubtitleText"));
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      PS_LocalizedStringForSystemPolicy(CFSTR("FULLACCESS_CONTACTS_COUNT_SECONDARY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, objc_msgSend(v16, "longValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v19, CFSTR("cellSubtitleText"));

    }
    -[PSContactsAuthorizationLevelController setFullAccessSpecifier:](self, "setFullAccessSpecifier:", v6);
  }
  -[PSListController reloadSpecifier:](self, "reloadSpecifier:", v6);

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
  -[PSContactsAuthorizationLevelController limitedAccessSpecifier](self, "limitedAccessSpecifier", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSContactsAuthorizationLevelController updateContactsCountSubtitleForSpecifier:contactsTCCAccess:](self, "updateContactsCountSubtitleForSpecifier:contactsTCCAccess:", v5, 1);
  -[PSListController reloadSpecifier:](self, "reloadSpecifier:", v5);
  if (!-[PSContactsAuthorizationLevelController isAppLinkedWithContactsLimitedAccessSupportedSDK](self, "isAppLinkedWithContactsLimitedAccessSupportedSDK"))
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PSContactsAuthorizationLevelController displayName](self, "displayName");
      v7 = objc_claimAutoreleasedReturnValue();
      -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "App %@(%@) is linked using SDK that doesn't support LimitedAccess for Contacts", buf, 0x16u);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("Terminating app as selected contacts changed for legacy linked app"));
    if (!v9)
      goto LABEL_22;
    v10 = objc_alloc(MEMORY[0x1E0CA5850]);
    -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:URL:personaUniqueString:personaType:", v11, 0, 0, 4);

    objc_msgSend(MEMORY[0x1E0D87D80], "identityForLSApplicationIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      _PSLoggingFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      -[PSContactsAuthorizationLevelController displayName](self, "displayName");
      v16 = objc_claimAutoreleasedReturnValue();
      -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1A3819000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get process identity for %@(%@)", buf, 0x16u);

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
        _PSLoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[PSContactsAuthorizationLevelController displayName](self, "displayName");
          v21 = objc_claimAutoreleasedReturnValue();
          -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v21;
          v29 = 2112;
          v30 = v22;
          v23 = "Successfully terminated %@(%@)";
LABEL_17:
          _os_log_impl(&dword_1A3819000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (-[NSObject code](v18, "code") != 3)
      {
        _PSLoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[PSContactsAuthorizationLevelController displayName](self, "displayName");
          v21 = objc_claimAutoreleasedReturnValue();
          -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
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
      _PSLoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[PSContactsAuthorizationLevelController displayName](self, "displayName");
        v20 = objc_claimAutoreleasedReturnValue();
        -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v20;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_1A3819000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create terminate request for %@(%@)", buf, 0x16u);

        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
LABEL_23:

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
  -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
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
    -[PSContactsAuthorizationLevelController limitedAccessCount](self, "limitedAccessCount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "longValue");

    v5 = objc_alloc((Class)getCNLimitedAccessContactPickerViewControllerClass());
    -[PSContactsAuthorizationLevelController displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSContactsAuthorizationLevelController serviceKey](self, "serviceKey");
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
      v10[2] = __85__PSContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke;
      v10[3] = &unk_1E4A654F0;
      v10[4] = self;
      -[PSContactsAuthorizationLevelController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v10);

    }
  }
}

void __85__PSContactsAuthorizationLevelController__presentContactsPickerForModifyingSelection__block_invoke(uint64_t a1)
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
  _PSLoggingFacility();
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
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Edit selected contacts view controller dismissed for %@(%@)", (uint8_t *)&v5, 0x16u);

  }
}

- (id)specifiers
{
  PSContactsAuthorizationLevelController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *specifiers;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super.super._specifiers)
  {
    v3 = -[PSContactsAuthorizationLevelController _currentTCCAuthorizationRight](v2, "_currentTCCAuthorizationRight");
    -[PSListController specifier](v2, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("hasPickerInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
    if (v3 == 2)
      v7 = 0;
    else
      v7 = v6;

    -[PSListController specifier](v2, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("hasTCCOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v10)
    {
      -[PSContactsAuthorizationLevelController _parentTCCSpecifiers](v2, "_parentTCCSpecifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v12);
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSContactsAuthorizationLevelController footerStringForSpecifiers:](v2, "footerStringForSpecifiers:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v13, "setProperty:forKey:", v14, CFSTR("footerText"));
      -[PSContactsAuthorizationLevelController _limitedAccessSectionSpecifiers](v2, "_limitedAccessSectionSpecifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v15);

    }
    -[PSContactsAuthorizationLevelController _pickerUsageSectionSpecifiers](v2, "_pickerUsageSectionSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PS_LocalizedStringForSystemPolicy(CFSTR("CONTACTS_AUTH_HEADER"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setName:", v19);

      }
      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v17);
    }
    specifiers = v2->super.super._specifiers;
    v2->super.super._specifiers = v11;

  }
  objc_sync_exit(v2);

  return v2->super.super._specifiers;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  BOOL v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSListController specifierAtIndex:](self, "specifierAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "propertyForKey:", CFSTR("id"));
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
        v18.super_class = (Class)PSContactsAuthorizationLevelController;
        -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
        objc_msgSend(v10, "values");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");

        if (v15 == 2)
        {
          -[PSContactsAuthorizationLevelController _removeLimitedAccessSectionIfPresent](self, "_removeLimitedAccessSectionIfPresent");
          -[PSContactsAuthorizationLevelController _removePickerUsageSectionIfPresent](self, "_removePickerUsageSectionIfPresent");
        }
        else if (v15 == 1)
        {
          -[NSArray firstObject](self->_limitedAccessSectionSpecifiers, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v16);

          if (!v17)
          {
            -[PSContactsAuthorizationLevelController _addLimitedAccessSection](self, "_addLimitedAccessSection");
            -[PSContactsAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
            -[PSContactsAuthorizationLevelController _presentContactsPickerForModifyingSelection](self, "_presentContactsPickerForModifyingSelection");
          }
        }
        else
        {
          -[PSContactsAuthorizationLevelController _removeLimitedAccessSectionIfPresent](self, "_removeLimitedAccessSectionIfPresent");
          -[PSContactsAuthorizationLevelController _addPickerUsageSectionIfNeeded](self, "_addPickerUsageSectionIfNeeded");
        }
      }
    }

  }
}

- (void)_addLimitedAccessSection
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  int64_t v6;

  if (-[NSArray count](self->_pickerUsageSectionSpecifiers, "count")
    && (-[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3),
        v3,
        v4))
  {
    -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v5);

    -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_limitedAccessSectionSpecifiers, v6, 1);
  }
  else
  {
    -[PSListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_limitedAccessSectionSpecifiers, 1);
  }
}

- (void)_removeLimitedAccessSectionIfPresent
{
  void *v3;
  _BOOL4 v4;

  -[NSArray firstObject](self->_limitedAccessSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_limitedAccessSectionSpecifiers, 1);
}

- (void)_addPickerUsageSectionIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PSListController containsSpecifier:](self, "containsSpecifier:"))
  {

  }
  else
  {
    bundleIdentifiersWithPickerAccess();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", self->_serviceKey);

    if (v4)
      -[PSListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", self->_pickerUsageSectionSpecifiers, 1);
  }
}

- (void)_removePickerUsageSectionIfPresent
{
  void *v3;
  _BOOL4 v4;

  -[NSArray firstObject](self->_pickerUsageSectionSpecifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSListController containsSpecifier:](self, "containsSpecifier:", v3);

  if (v4)
    -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_pickerUsageSectionSpecifiers, 1);
}

- (NSString)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (NSBundle)entityBundle
{
  return self->_entityBundle;
}

- (void)setEntityBundle:(id)a3
{
  objc_storeStrong((id *)&self->_entityBundle, a3);
}

- (NSNumber)limitedAccessCount
{
  return self->_limitedAccessCount;
}

- (void)setLimitedAccessCount:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessCount, a3);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitedAccessSpecifier);
  objc_destroyWeak((id *)&self->_fullAccessSpecifier);
  objc_storeStrong((id *)&self->_limitedAccessCount, 0);
  objc_storeStrong((id *)&self->_entityBundle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_limitedLibraryRowSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerUsageSectionSpecifiers, 0);
  objc_storeStrong((id *)&self->_limitedAccessSectionSpecifiers, 0);
}

void __71__PSContactsAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1A3819000, v0, v1, "Error when requesting Contacts TCC for identity: %@ error: %@");
  OUTLINED_FUNCTION_11();
}

- (void)_limitedAccessSectionSpecifiers
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1A3819000, a2, OS_LOG_TYPE_DEBUG, "Contacts: Empty specifier are returned, auth = %llu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_11();
}

@end
