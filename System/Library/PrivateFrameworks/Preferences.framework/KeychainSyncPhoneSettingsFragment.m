@implementation KeychainSyncPhoneSettingsFragment

- (KeychainSyncPhoneSettingsFragment)initWithListController:(id)a3
{
  id v4;
  KeychainSyncPhoneSettingsFragment *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncPhoneSettingsFragment;
  v5 = -[KeychainSyncPhoneSettingsFragment init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_textFieldChanged_, *MEMORY[0x1E0CEBD20], 0);

    objc_storeWeak((id *)&v5->_listController, v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)KeychainSyncPhoneSettingsFragment;
  -[KeychainSyncPhoneSettingsFragment dealloc](&v4, sel_dealloc);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSString *phoneNumber;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  KeychainSyncCountryInfo *countryInfo;
  void *v32;
  uint64_t v33;
  PSSpecifier *countrySpecifier;
  uint64_t v35;
  KeychainSyncCountryInfo *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PSPhoneNumberSpecifier *v50;
  PSPhoneNumberSpecifier *phoneNumberSpecifier;
  PSPhoneNumberSpecifier **p_phoneNumberSpecifier;
  PSPhoneNumberSpecifier *v53;
  void *v54;
  NSArray *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  NSArray *v65;
  KeychainSyncPhoneSettingsFragment *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  v66 = self;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  PSSecureBackupAccountInfo(&v72, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v72;
  v57 = v4;
  if (!v4)
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v5 = (_QWORD *)getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr;
    v76 = getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr;
    if (!getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr)
    {
      v6 = (void *)CloudServicesLibrary();
      v5 = dlsym(v6, "kSecureBackupSMSTargetInfoKey");
      v74[3] = (uint64_t)v5;
      getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v73, 8);
    if (v5)
    {
      objc_msgSend(v59, "objectForKey:", *v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = 0;
        v74 = &v73;
        v75 = 0x2020000000;
        v8 = (id *)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr;
        v76 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr;
        if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr)
        {
          v9 = (void *)CloudServicesLibrary();
          v8 = (id *)dlsym(v9, "kSecureBackupSMSTargetPhoneNumberKey");
          v74[3] = (uint64_t)v8;
          getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr = (uint64_t)v8;
        }
        _Block_object_dispose(&v73, 8);
        if (!v8)
          goto LABEL_45;
        v10 = *v8;
        objc_msgSend(v7, "objectForKey:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        phoneNumber = v66->_phoneNumber;
        v66->_phoneNumber = (NSString *)v11;

        v73 = 0;
        v74 = &v73;
        v75 = 0x2020000000;
        v13 = (_QWORD *)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr;
        v76 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr;
        if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr)
        {
          v14 = (void *)CloudServicesLibrary();
          v13 = dlsym(v14, "kSecureBackupCountryDialCodeKey");
          v74[3] = (uint64_t)v13;
          getkSecureBackupCountryDialCodeKeySymbolLoc_ptr = (uint64_t)v13;
        }
        _Block_object_dispose(&v73, 8);
        if (!v13)
          goto LABEL_45;
        objc_msgSend(v7, "objectForKey:", *v13);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupCountryCodeKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v15);
        v64 = (id)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v58 = 0;
      }
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v16 = (_QWORD *)getkSecureBackupMetadataKeySymbolLoc_ptr;
      v76 = getkSecureBackupMetadataKeySymbolLoc_ptr;
      if (!getkSecureBackupMetadataKeySymbolLoc_ptr)
      {
        v17 = (void *)CloudServicesLibrary();
        v16 = dlsym(v17, "kSecureBackupMetadataKey");
        v74[3] = (uint64_t)v16;
        getkSecureBackupMetadataKeySymbolLoc_ptr = (uint64_t)v16;
      }
      _Block_object_dispose(&v73, 8);
      if (v16)
      {
        objc_msgSend(v59, "objectForKey:", *v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        getkSecureBackupCountryCodeKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v19);
        v64 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
    }
LABEL_45:
    PSPNCreateFormattedStringWithCountry_cold_1();
    __break(1u);
  }
  NSLog(CFSTR("getAccountInfo error = %@"), v4);
  v58 = 0;
  v64 = 0;
LABEL_22:
  v20 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v60, "localeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsFromLocaleIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v64;
  if (!v64)
    v23 = v61;
  v62 = v23;
  if (-[NSString length](v66->_phoneNumber, "length"))
  {
    v24 = PSPNCreateFormattedStringWithCountry((uint64_t)v66->_phoneNumber, objc_msgSend(v62, "lowercaseString"));
    v25 = v66->_phoneNumber;
    v66->_phoneNumber = (NSString *)v24;
  }
  else
  {
    v26 = v61;
    v25 = (NSString *)v64;
    v64 = v26;
  }

  v65 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (PSIsRunningInAssistant()
    && (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "userInterfaceIdiom") == 0,
        v27,
        v28))
  {
    +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v65, "addObject:", v63);
  }
  else
  {
    -[KeychainSyncPhoneSettingsFragment title](v66, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v29);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    PS_LocalizedStringForKeychainSync(CFSTR("PHONE_NUMBER_DESCRIPTION"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setProperty:forKey:", v30, CFSTR("footerText"));

    -[NSArray addObject:](v65, "addObject:", v63);
  }
  countryInfo = v66->_countryInfo;
  v66->_countryInfo = 0;

  PS_LocalizedStringForKeychainSync(CFSTR("COUNTRY"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, v66, sel_setDialingCountryInfo_forSpecifier_, sel_dialingCountryInfoForSpecifier_, objc_opt_class(), 2, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  countrySpecifier = v66->_countrySpecifier;
  v66->_countrySpecifier = (PSSpecifier *)v33;

  -[PSSpecifier setProperty:forKey:](v66->_countrySpecifier, "setProperty:forKey:", objc_opt_class());
  if (!v66->_countryInfo)
  {
    +[KeychainSyncCountryInfo countryInfoForCountryCode:dialingPrefix:](KeychainSyncCountryInfo, "countryInfoForCountryCode:dialingPrefix:", v64, v58);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v66->_countryInfo;
    v66->_countryInfo = (KeychainSyncCountryInfo *)v35;

  }
  +[KeychainSyncCountryInfo allCountries](KeychainSyncCountryInfo, "allCountries");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v37;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v69 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v42, "localizedCountryName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          v45 = v43;
        }
        else
        {
          objc_msgSend(v42, "countryName");
          v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        v46 = v45;

        v47 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v42, "dialingPrefix");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", CFSTR("\u202A+%@\u202C (%@)"), v48, v46);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "addObject:", v49);
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v39);
  }

  -[PSSpecifier setValues:titles:](v66->_countrySpecifier, "setValues:titles:", obj, v38);
  -[NSArray addObject:](v65, "addObject:", v66->_countrySpecifier);
  v50 = objc_alloc_init(PSPhoneNumberSpecifier);
  p_phoneNumberSpecifier = &v66->_phoneNumberSpecifier;
  phoneNumberSpecifier = v66->_phoneNumberSpecifier;
  v66->_phoneNumberSpecifier = v50;

  v53 = v66->_phoneNumberSpecifier;
  PS_LocalizedStringForKeychainSync(CFSTR("NUMBER"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setName:](v53, "setName:", v54);

  objc_storeWeak(&v66->_phoneNumberSpecifier->super.super.target, v66);
  (*p_phoneNumberSpecifier)->super.super.setter = sel_setPhoneNumber_forSpecifier_;
  (*p_phoneNumberSpecifier)->super.super.getter = sel_phoneNumberForSpecifier_;
  (*p_phoneNumberSpecifier)->super.super.detailControllerClass = 0;
  (*p_phoneNumberSpecifier)->super.super.cellType = 8;
  (*p_phoneNumberSpecifier)->super.super.editPaneClass = 0;
  -[PSPhoneNumberSpecifier setCountryCode:](v66->_phoneNumberSpecifier, "setCountryCode:", v62);
  -[PSSpecifier setKeyboardType:autoCaps:autoCorrection:](v66->_phoneNumberSpecifier, "setKeyboardType:autoCaps:autoCorrection:", 5, 0, 1);
  -[PSPhoneNumberSpecifier setProperty:forKey:](v66->_phoneNumberSpecifier, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
  -[NSArray addObject:](v65, "addObject:", v66->_phoneNumberSpecifier);
  v55 = v66->_specifiers;
  v66->_specifiers = v65;

  specifiers = v66->_specifiers;
  return specifiers;
}

- (void)reloadSpecifiers
{
  NSArray *specifiers;

  specifiers = self->_specifiers;
  self->_specifiers = 0;

}

- (void)resignFirstResponder
{
  id v2;

  -[KeychainSyncPhoneSettingsFragment phoneNumberCell](self, "phoneNumberCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)setDialingCountryInfo:(id)a3 forSpecifier:(id)a4
{
  KeychainSyncCountryInfo *v6;
  PSPhoneNumberSpecifier *phoneNumberSpecifier;
  void *v8;
  KeychainSyncCountryInfo *countryInfo;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *phoneNumber;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  KeychainSyncCountryInfo *v18;

  v6 = (KeychainSyncCountryInfo *)a3;
  if (self->_countryInfo != v6)
  {
    v18 = v6;
    objc_storeStrong((id *)&self->_countryInfo, a3);
    phoneNumberSpecifier = self->_phoneNumberSpecifier;
    -[KeychainSyncCountryInfo countryCode](self->_countryInfo, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPhoneNumberSpecifier setCountryCode:](phoneNumberSpecifier, "setCountryCode:", v8);

    countryInfo = self->_countryInfo;
    v10 = self->_phoneNumber;
    -[KeychainSyncCountryInfo countryCode](countryInfo, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSString *)PSPNCreateFormattedStringWithCountry((uint64_t)v10, objc_msgSend(v11, "lowercaseString"));
    phoneNumber = self->_phoneNumber;
    self->_phoneNumber = v12;

    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "reloadSpecifier:", self->_phoneNumberSpecifier);

    -[KeychainSyncPhoneSettingsFragment delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncPhoneSettingsFragment unformattedPhoneNumber](self, "unformattedPhoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncPhoneSettingsFragment countryInfo](self, "countryInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "phoneSettingsFragment:didChangePhoneNumber:countryInfo:", self, v16, v17);

    v6 = v18;
  }

}

- (id)dialingCountryInfoForSpecifier:(id)a3
{
  return self->_countryInfo;
}

- (void)setPhoneNumber:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  if (self->_phoneNumber != a3)
  {
    -[KeychainSyncPhoneSettingsFragment setPhoneNumber:](self, "setPhoneNumber:");
    -[KeychainSyncPhoneSettingsFragment delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncPhoneSettingsFragment unformattedPhoneNumber](self, "unformattedPhoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncPhoneSettingsFragment countryInfo](self, "countryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneSettingsFragment:didChangePhoneNumber:countryInfo:", self, v5, v6);

  }
}

- (id)phoneNumberForSpecifier:(id)a3
{
  return self->_phoneNumber;
}

- (id)unformattedPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  -[KeychainSyncPhoneSettingsFragment phoneNumber](self, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr;
  v11 = get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr;
  if (!get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr)
  {
    v4 = (void *)PhoneNumbersLibrary();
    v3 = dlsym(v4, "_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable");
    v9[3] = (uint64_t)v3;
    get_PNCreateStringByStrippingFormattingAndNotVisiblyAllowableSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = (void *)((uint64_t (*)(void *))v3)(v2);

  return v5;
}

- (PSEditableTableCell)phoneNumberCell
{
  return (PSEditableTableCell *)-[PSSpecifier propertyForKey:](self->_phoneNumberSpecifier, "propertyForKey:", CFSTR("cellObject"));
}

- (void)textFieldChanged:(id)a3
{
  PSPhoneNumberSpecifier *phoneNumberSpecifier;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  phoneNumberSpecifier = self->_phoneNumberSpecifier;
  v5 = a3;
  -[PSSpecifier propertyForKey:](phoneNumberSpecifier, "propertyForKey:", CFSTR("cellObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editableTextField");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    objc_msgSend(v9, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncPhoneSettingsFragment setPhoneNumber:forSpecifier:](self, "setPhoneNumber:forSpecifier:", v8, self->_phoneNumberSpecifier);

  }
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (KeychainSyncCountryInfo)countryInfo
{
  return self->_countryInfo;
}

- (void)setCountryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_countryInfo, a3);
}

- (KeychainSyncPhoneSettingsFragmentDelegate)delegate
{
  return (KeychainSyncPhoneSettingsFragmentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_countryInfo, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_countrySpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberSpecifier, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
