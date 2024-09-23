@implementation PSAccountSecurityController

- (PSAccountSecurityController)init
{
  PSAccountSecurityController *v2;
  PSKeychainSyncManager *v3;
  PSKeychainSyncManager *manager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSAccountSecurityController;
  v2 = -[PSListController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PSKeychainSyncManager);
    manager = v2->_manager;
    v2->_manager = v3;

  }
  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[KeychainSyncPhoneSettingsFragment resignFirstResponder](self->_phoneSettingsFragment, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)PSAccountSecurityController;
  -[PSListController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSAccountSecurityController;
  -[PSListController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (-[PSAccountSecurityController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PSAccountSecurityController_viewDidAppear___block_invoke;
    block[3] = &unk_1E4A654F0;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __45__PSAccountSecurityController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  int v13;
  _Unwind_Exception *v14;
  _QWORD block[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  PSSecureBackupAccountInfo(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v3 = (id *)getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  v19 = getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusKeySymbolLoc_ptr)
  {
    v4 = (void *)CloudServicesLibrary_1();
    v3 = (id *)dlsym(v4, "kSecureBackupRecordStatusKey");
    v17[3] = (uint64_t)v3;
    getkSecureBackupRecordStatusKeySymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v16, 8);
  if (!v3)
  {
    PSPNCreateFormattedStringWithCountry_cold_1();
LABEL_16:
    PSPNCreateFormattedStringWithCountry_cold_1();
    goto LABEL_17;
  }
  v5 = *v3;
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v7 = (id *)getkSecureBackupRecordStatusInvalidSymbolLoc_ptr;
  v19 = getkSecureBackupRecordStatusInvalidSymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusInvalidSymbolLoc_ptr)
  {
    v8 = (void *)CloudServicesLibrary_1();
    v7 = (id *)dlsym(v8, "kSecureBackupRecordStatusInvalid");
    v17[3] = (uint64_t)v7;
    getkSecureBackupRecordStatusInvalidSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v16, 8);
  if (!v7)
    goto LABEL_16;
  v9 = *v7;
  if (objc_msgSend(v6, "isEqualToString:", v9))
  {

LABEL_13:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PSAccountSecurityController_viewDidAppear___block_invoke_2;
    block[3] = &unk_1E4A654F0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_14;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr;
  v19 = getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr)
  {
    v11 = (void *)CloudServicesLibrary_1();
    v10 = dlsym(v11, "kSecureBackupEscrowTrustStatusKey");
    v17[3] = (uint64_t)v10;
    getkSecureBackupEscrowTrustStatusKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
  {
LABEL_17:
    v14 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v14);
  }
  objc_msgSend(v2, "objectForKey:", *v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13 == 2)
    goto LABEL_13;
LABEL_14:

}

uint64_t __45__PSAccountSecurityController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBurnedRecord");
}

- (id)passcodeSpecifiers
{
  NSArray *passcodeSpecifiers;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  passcodeSpecifiers = self->_passcodeSpecifiers;
  if (!passcodeSpecifiers)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v5);
    PS_LocalizedStringForKeychainSync(CFSTR("CHANGE_SECURITY_CODE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setButtonAction:", sel_changeSecurityCode_);
    -[NSArray addObject:](v4, "addObject:", v7);
    v8 = self->_passcodeSpecifiers;
    self->_passcodeSpecifiers = v4;

    passcodeSpecifiers = self->_passcodeSpecifiers;
  }
  return passcodeSpecifiers;
}

- (id)specifiers
{
  NSArray *specifiers;
  NSObject *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD block[5];

  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PSAccountSecurityController_specifiers__block_invoke;
    block[3] = &unk_1E4A654F0;
    block[4] = self;
    dispatch_async(v4, block);

    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
    v7 = self->super._specifiers;
    self->super._specifiers = v6;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

void __41__PSAccountSecurityController_specifiers__block_invoke(uint64_t a1)
{
  int CircleMembershipStatus;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  __int16 v15;
  id v16[2];
  __int16 v17;

  v17 = 0;
  v16[1] = 0;
  CircleMembershipStatus = PSKeychainSyncGetCircleMembershipStatus((_BYTE *)&v17 + 1, (BOOL *)&v17);
  v3 = 0;
  v4 = v3;
  if (CircleMembershipStatus)
  {
    v16[0] = v3;
    PSSecureBackupAccountInfo(v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16[0];

    v4 = v6;
  }
  else
  {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PSAccountSecurityController_specifiers__block_invoke_2;
  block[3] = &unk_1E4A67C20;
  v14 = CircleMembershipStatus;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v7;
  v13 = v5;
  v15 = v17;
  v8 = v5;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41__PSAccountSecurityController_specifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  KeychainSyncPhoneSettingsFragment *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  _Unwind_Exception *v59;
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v60, "isEqualToString:", *MEMORY[0x1E0CD6818]))
    {

      return;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "code") == 1)
    {

    }
    else
    {
      v41 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v41 != 2)
        return;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1440), "promptForPasswordOverController:withCompletion:");
    return;
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1416);
  *(_QWORD *)(v2 + 1416) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1424);
  *(_QWORD *)(v4 + 1424) = 0;

  if (!*(_QWORD *)(a1 + 32))
  {
    v7 = *(void **)(a1 + 48);
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v8 = (id *)getkSecureBackupIsEnabledKeySymbolLoc_ptr_1;
    v64 = getkSecureBackupIsEnabledKeySymbolLoc_ptr_1;
    if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr_1)
    {
      v9 = (void *)CloudServicesLibrary_1();
      v8 = (id *)dlsym(v9, "kSecureBackupIsEnabledKey");
      v62[3] = (uint64_t)v8;
      getkSecureBackupIsEnabledKeySymbolLoc_ptr_1 = (uint64_t)v8;
    }
    _Block_object_dispose(&v61, 8);
    if (v8)
    {
      v10 = *v8;
      objc_msgSend(v7, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1432) = objc_msgSend(v11, "BOOLValue");

      if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1432))
        goto LABEL_4;
      v12 = *(void **)(a1 + 48);
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v13 = (_QWORD *)getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0;
      v64 = getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0;
      if (!getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0)
      {
        v14 = (void *)CloudServicesLibrary_1();
        v13 = dlsym(v14, "kSecureBackupUsesRandomPassphraseKey");
        v62[3] = (uint64_t)v13;
        getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr_0 = (uint64_t)v13;
      }
      _Block_object_dispose(&v61, 8);
      if (v13)
      {
        objc_msgSend(v12, "objectForKey:", *v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v15, "BOOLValue");

        v16 = *(void **)(a1 + 48);
        getkSecureBackupMetadataKey_0();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v62 = &v61;
        v63 = 0x2020000000;
        v19 = (_QWORD *)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0;
        v64 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0;
        if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0)
        {
          v20 = (void *)CloudServicesLibrary_1();
          v19 = dlsym(v20, "kSecureBackupUsesComplexPassphraseKey");
          v62[3] = (uint64_t)v19;
          getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr_0 = (uint64_t)v19;
        }
        _Block_object_dispose(&v61, 8);
        if (v19)
        {
          objc_msgSend(v18, "objectForKey:", *v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          v23 = *(void **)(a1 + 48);
          getkSecureBackupMetadataKey_0();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0;
          v62 = &v61;
          v63 = 0x2020000000;
          v26 = (_QWORD *)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0;
          v64 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0;
          if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0)
          {
            v27 = (void *)CloudServicesLibrary_1();
            v26 = dlsym(v27, "kSecureBackupUsesNumericPassphraseKey");
            v62[3] = (uint64_t)v26;
            getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr_0 = (uint64_t)v26;
          }
          _Block_object_dispose(&v61, 8);
          if (v26)
          {
            objc_msgSend(v25, "objectForKey:", *v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "BOOLValue");

            if (v6)
              v30 = 2;
            else
              v30 = v22 & ~v29;
            objc_msgSend(*(id *)(a1 + 40), "setSecurityCodeType:", v30);
            goto LABEL_25;
          }
LABEL_50:
          v59 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
          _Block_object_dispose(&v61, 8);
          _Unwind_Resume(v59);
        }
LABEL_49:
        PSPNCreateFormattedStringWithCountry_cold_1();
        goto LABEL_50;
      }
    }
    else
    {
      PSPNCreateFormattedStringWithCountry_cold_1();
    }
    PSPNCreateFormattedStringWithCountry_cold_1();
    goto LABEL_49;
  }
  NSLog(CFSTR("getAccountStatus error = %@"), *(_QWORD *)(a1 + 32));
LABEL_4:
  LOBYTE(v6) = 0;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(CFSTR("KEYCHAIN_RECOVERY_DESCRIPTION"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setProperty:forKey:", v33, CFSTR("footerText"));

  objc_msgSend(v31, "addObject:", v32);
  v34 = *(_QWORD *)(a1 + 40);
  v35 = *(void **)(v34 + 1376);
  if (!v35)
  {
    PS_LocalizedStringForKeychainSync(CFSTR("KEYCHAIN_RECOVERY"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v36, *(_QWORD *)(a1 + 40), sel_setUseRecovery_specifier_, sel_useRecoveryForSepecifier_, 0, 6, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(a1 + 40);
    v39 = *(void **)(v38 + 1376);
    *(_QWORD *)(v38 + 1376) = v37;

    v34 = *(_QWORD *)(a1 + 40);
    v35 = *(void **)(v34 + 1376);
  }
  if (*(_BYTE *)(a1 + 57))
  {
    v40 = 1;
  }
  else if (*(_BYTE *)(a1 + 58))
  {
    v40 = 0;
  }
  else
  {
    v40 = *(unsigned __int8 *)(v34 + 1432);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setProperty:forKey:", v42, CFSTR("enabled"));

  objc_msgSend(v31, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1376));
  v43 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v43 + 1432) && *(_BYTE *)(a1 + 57))
  {
    objc_msgSend((id)v43, "passcodeSpecifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v44);

    v43 = *(_QWORD *)(a1 + 40);
    v45 = *(_BYTE *)(v43 + 1432) ? v6 : 1;
    if ((v45 & 1) == 0 && *(_BYTE *)(a1 + 57))
    {
      v46 = *(void **)(v43 + 1408);
      if (!v46)
      {
        v47 = -[KeychainSyncPhoneSettingsFragment initWithListController:]([KeychainSyncPhoneSettingsFragment alloc], "initWithListController:", *(_QWORD *)(a1 + 40));
        v48 = *(_QWORD *)(a1 + 40);
        v49 = *(void **)(v48 + 1408);
        *(_QWORD *)(v48 + 1408) = v47;

        v50 = *(void **)(*(_QWORD *)(a1 + 40) + 1408);
        PS_LocalizedStringForKeychainSync(CFSTR("VERIFICATION_NUMBER"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setTitle:", v51);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1408), "setDelegate:");
        v46 = *(void **)(*(_QWORD *)(a1 + 40) + 1408);
      }
      objc_msgSend(v46, "specifiers");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObjectsFromArray:", v52);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1408), "unformattedPhoneNumber");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = *(_QWORD *)(a1 + 40);
      v55 = *(void **)(v54 + 1416);
      *(_QWORD *)(v54 + 1416) = v53;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1408), "countryInfo");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = *(_QWORD *)(a1 + 40);
      v58 = *(void **)(v57 + 1424);
      *(_QWORD *)(v57 + 1424) = v56;

      v43 = *(_QWORD *)(a1 + 40);
    }
  }
  objc_msgSend((id)v43, "beginUpdates");
  objc_msgSend(*(id *)(a1 + 40), "removeSpecifierAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:atIndex:", v31, 0);
  objc_msgSend(*(id *)(a1 + 40), "endUpdates");

}

void __41__PSAccountSecurityController_specifiers__block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v2, "reloadSpecifiers");
  }
  else
  {
    objc_msgSend(v2, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (void)reloadSpecifiers
{
  objc_super v3;

  -[KeychainSyncPhoneSettingsFragment reloadSpecifiers](self->_phoneSettingsFragment, "reloadSpecifiers");
  v3.receiver = self;
  v3.super_class = (Class)PSAccountSecurityController;
  -[PSListController reloadSpecifiers](&v3, sel_reloadSpecifiers);
  -[PSAccountSecurityController _setShowsDoneButton:](self, "_setShowsDoneButton:", 0);
}

- (void)_showSecurityCodeChangeSheetOnSpecifier:(id)a3
{
  id v4;
  BOOL v5;
  PSKeychainSyncManager *manager;
  _QWORD v7[5];
  BOOL v8;

  v4 = a3;
  v5 = -[PSAccountSecurityController securityCodeType](self, "securityCodeType") == 2;
  manager = self->_manager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke;
  v7[3] = &unk_1E4A67C48;
  v8 = v5;
  v7[4] = self;
  -[PSKeychainSyncManager showChangeSecurityCodeFlowWithSpecifier:overController:completion:](manager, "showChangeSecurityCodeFlowWithSpecifier:overController:completion:", v4, self, v7);

}

void __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke(uint64_t a1, int a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  objc_super v27;

  v9 = a3;
  v10 = a5;
  if (a2)
  {
    if (a4 == 2 || *(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
      if (a4 == 2)
        goto LABEL_10;
    }
    else
    {
      v27.receiver = *(id *)(a1 + 32);
      v27.super_class = (Class)PSAccountSecurityController;
      objc_msgSendSuper2(&v27, sel_reloadSpecifiers);
    }
    if (PSIsUsingPasscode(0))
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "passcode:meetsCurrentConstraintsOutError:", v9, 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "setSecurityCode:", v9);
        v12 = (void *)MEMORY[0x1E0CEA2E8];
        PS_LocalizedStringForKeychainSync(CFSTR("USE_SECURITY_CODE_AS_DEVICE_PASSCODE"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, 0, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("DONT_CHANGE_PASSCODE"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_2;
        v26[3] = &unk_1E4A65BF8;
        v26[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v18);

        v19 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForKeychainSync(CFSTR("USE_SAME_CODE_ICSC_TO_DEVICE"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v17;
        v25[1] = 3221225472;
        v25[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_3;
        v25[3] = &unk_1E4A65BF8;
        v25[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v21);

        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_4;
        block[3] = &unk_1E4A655B8;
        block[4] = *(_QWORD *)(a1 + 32);
        v24 = v14;
        v22 = v14;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
  }
LABEL_10:

}

uint64_t __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSecurityCode:", 0);
}

void __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_3(uint64_t a1)
{
  PSSetupController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = objc_alloc_init(PSSetupController);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1392);
  *(_QWORD *)(v3 + 1392) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v7, CFSTR("customControllerClass"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setParentController:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setupController");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1400);
  *(_QWORD *)(v10 + 1400) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setDelegate:");
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 1400);
  PS_LocalizedStringForKeychainSync(CFSTR("ENTER_CURRENT_PASSCODE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnterPasscodeTitle:", v13);

  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1400);
  PS_LocalizedStringForKeychainSync(CFSTR("ENTER_CURRENT_PASSCODE_DESCRIPTION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnterPasscodeReason:", v15);

  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel_cancelPressed);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:", v17);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1392), 1, 0);
}

uint64_t __71__PSAccountSecurityController__showSecurityCodeChangeSheetOnSpecifier___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)changeSecurityCode:(id)a3
{
  KeychainSyncPhoneSettingsFragment *phoneSettingsFragment;
  void *v5;
  id v6;

  phoneSettingsFragment = self->_phoneSettingsFragment;
  v6 = a3;
  -[KeychainSyncPhoneSettingsFragment phoneNumberCell](phoneSettingsFragment, "phoneNumberCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[PSAccountSecurityController _showSecurityCodeChangeSheetOnSpecifier:](self, "_showSecurityCodeChangeSheetOnSpecifier:", v6);
}

- (void)disableRecovery
{
  id v3;
  _QWORD v4[5];

  v3 = objc_alloc_init((Class)getSecureBackupClass_0());
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PSAccountSecurityController_disableRecovery__block_invoke;
  v4[3] = &unk_1E4A67C70;
  v4[4] = self;
  objc_msgSend(v3, "disableWithInfo:completionBlock:", 0, v4);

}

void __46__PSAccountSecurityController_disableRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PSAccountSecurityController_disableRecovery__block_invoke_2;
  v6[3] = &unk_1E4A655B8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __46__PSAccountSecurityController_disableRecovery__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id *v10;
  void *v11;
  id v12;
  BOOL v13;

  if (*(_QWORD *)(a1 + 32))
  {
    NSLog(CFSTR("Failed to disable escrow: %@"), *(_QWORD *)(a1 + 32));
    v2 = (void *)MEMORY[0x1E0CEA2E8];
    PS_LocalizedStringForKeychainSync(CFSTR("DISABLE_BACKUP_KEYCHAIN_ERROR_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("OK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v6);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v12, 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1376), 1);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1432) = 0;
    v13 = 0;
    if (PSKeychainSyncGetCircleMembershipStatus(0, &v13))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1376);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("enabled"));

    }
    v9 = *(_QWORD **)(a1 + 40);
    if (v9[173])
    {
      objc_msgSend(v9, "beginUpdates");
      objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1376));
      v10 = *(id **)(a1 + 40);
      objc_msgSend(v10[176], "specifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeContiguousSpecifiers:animated:", v11, 1);

      objc_msgSend(*(id *)(a1 + 40), "removeContiguousSpecifiers:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1384), 1);
      objc_msgSend(*(id *)(a1 + 40), "endUpdates");
    }
    else
    {
      objc_msgSend(v9, "reloadSpecifier:animated:", v9[172], 1);
    }
    objc_msgSend(*(id *)(a1 + 40), "_setShowsDoneButton:", 0);
  }
}

- (void)setUseRecovery:(id)a3 specifier:(id)a4
{
  id v6;
  PSKeychainSyncManager *manager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v6 = a4;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    manager = self->_manager;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke;
    v21[3] = &unk_1E4A671D0;
    v21[4] = self;
    -[PSKeychainSyncManager showEnableEscrowFlowWithSpecifier:overController:completion:](manager, "showEnableEscrowFlowWithSpecifier:overController:completion:", v6, self, v21);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CEA2E8];
    PS_LocalizedStringForKeychainSync(CFSTR("DONT_USE_SECURITY_CODE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("DISABLE_RECOVERY_DESCRIPTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_2;
    v20[3] = &unk_1E4A65BF8;
    v20[4] = self;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("DONT_USE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_3;
    v19[3] = &unk_1E4A65BF8;
    v19[4] = self;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v18);

    -[PSAccountSecurityController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }

}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376));
}

uint64_t __56__PSAccountSecurityController_setUseRecovery_specifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disableRecovery");
}

- (id)useRecoveryForSepecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureBackupEnabled);
}

- (void)handleBurnedRecord
{
  NSObject *v3;
  _QWORD block[5];

  -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self->_manager, "startNavigationSpinnerInViewController:", self);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__PSAccountSecurityController_handleBurnedRecord__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD block[5];

  v2 = objc_alloc_init((Class)getSecureBackupClass_0());
  objc_msgSend(v2, "disableWithInfo:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Error disabling backup: %@"), v3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_2;
  block[3] = &unk_1E4A654F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "stopNavigationSpinner");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[180];
  objc_msgSend(v2, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_3;
  v9 = &unk_1E4A671D0;
  v10 = v5;
  objc_msgSend(v3, "showEnableEscrowFlowWithSpecifier:overController:completion:", v4);

}

uint64_t __49__PSAccountSecurityController_handleBurnedRecord__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)keychainSyncController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v7 = a4;
  if (self->_devicePINController == a3)
  {
    -[PSKeychainSyncManager startNavigationSpinnerInViewController:](self->_manager, "startNavigationSpinnerInViewController:", a3);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSAccountSecurityController securityCode](self, "securityCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v10 = objc_msgSend(v8, "changePasscodeFrom:to:outError:", v7, v9, &v20);
    v11 = v20;

    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "saveDeviceUnlockPasscodeInputModes");
    }
    else
    {
      NSLog(CFSTR("Error changing passcode: %@"), v11);
      v13 = (void *)MEMORY[0x1E0CEA2E8];
      PS_LocalizedStringForKeychainSync(CFSTR("ERROR_CHANGING_PASSCODE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForKeychainSync(CFSTR("OK"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v17);

      -[PSAccountSecurityController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    }

    -[PSKeychainSyncManager stopNavigationSpinner](self->_manager, "stopNavigationSpinner");
    -[PSViewController rootController](self, "rootController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PSAccountSecurityController_keychainSyncController_didFinishWithResult_error___block_invoke;
    v19[3] = &unk_1E4A654F0;
    v19[4] = self;
    objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, v19);

  }
}

void __80__PSAccountSecurityController_keychainSyncController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setSecurityCode:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1400);
  *(_QWORD *)(v2 + 1400) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1392);
  *(_QWORD *)(v4 + 1392) = 0;

}

- (void)saveSMSTargetChanges
{
  -[PSKeychainSyncManager promptForPasswordOverController:withCompletion:](self->_manager, "promptForPasswordOverController:withCompletion:");
}

void __51__PSAccountSecurityController_saveSMSTargetChanges__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  int CircleMembershipStatus;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  _BOOL4 v34;
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
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[7];

  v65[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v55 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "unformattedPhoneNumber");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "countryInfo");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    CircleMembershipStatus = PSKeychainSyncGetCircleMembershipStatus((_BYTE *)&v58 + 1, (BOOL *)&v58);
    v7 = 0;
    v8 = v7;
    if (!CircleMembershipStatus)
    {
      NSLog(CFSTR("Failed to set new phone number: %@"), v7);
LABEL_32:

      v5 = v55;
      goto LABEL_33;
    }
    if (!HIBYTE(v58) || !(_BYTE)v58)
      goto LABEL_32;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v9 = (id *)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1;
    v62 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1;
    if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1)
    {
      v10 = (void *)CloudServicesLibrary_1();
      v9 = (id *)dlsym(v10, "kSecureBackupSMSTargetPhoneNumberKey");
      v60[3] = (uint64_t)v9;
      getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_1 = (uint64_t)v9;
    }
    _Block_object_dispose(&v59, 8);
    if (v9)
    {
      v52 = *v9;
      v63[0] = v52;
      v65[0] = v56;
      v59 = 0;
      v60 = &v59;
      v61 = 0x2020000000;
      v11 = (id *)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1;
      v62 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1;
      if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1)
      {
        v12 = (void *)CloudServicesLibrary_1();
        v11 = (id *)dlsym(v12, "kSecureBackupCountryDialCodeKey");
        v60[3] = (uint64_t)v11;
        getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_1 = (uint64_t)v11;
      }
      _Block_object_dispose(&v59, 8);
      if (v11)
      {
        v13 = *v11;
        v63[1] = v13;
        objc_msgSend(v57, "dialingPrefix");
        v14 = objc_claimAutoreleasedReturnValue();
        v65[1] = v14;
        v59 = 0;
        v60 = &v59;
        v61 = 0x2020000000;
        v15 = (id *)getkSecureBackupCountryCodeKeySymbolLoc_ptr_1;
        v62 = getkSecureBackupCountryCodeKeySymbolLoc_ptr_1;
        if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr_1)
        {
          v16 = (void *)CloudServicesLibrary_1();
          v15 = (id *)dlsym(v16, "kSecureBackupCountryCodeKey");
          v60[3] = (uint64_t)v15;
          getkSecureBackupCountryCodeKeySymbolLoc_ptr_1 = (uint64_t)v15;
        }
        _Block_object_dispose(&v59, 8);
        if (v15)
        {
          v17 = *v15;
          v63[2] = v17;
          objc_msgSend(v57, "countryCode");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v65[2] = v54;
          v59 = 0;
          v60 = &v59;
          v61 = 0x2020000000;
          v18 = (id *)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0;
          v62 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0;
          if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0)
          {
            v19 = (void *)CloudServicesLibrary_1();
            v18 = (id *)dlsym(v19, "kSecureBackupAuthenticationAppleID");
            v60[3] = (uint64_t)v18;
            getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr_0 = (uint64_t)v18;
          }
          _Block_object_dispose(&v59, 8);
          if (v18)
          {
            v20 = *v18;
            v63[3] = v20;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "appleIDUsername");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)v14;
            v65[3] = v21;
            v59 = 0;
            v60 = &v59;
            v61 = 0x2020000000;
            v23 = (id *)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0;
            v62 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0;
            if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0)
            {
              v24 = (void *)CloudServicesLibrary_1();
              v23 = (id *)dlsym(v24, "kSecureBackupAuthenticationPassword");
              v60[3] = (uint64_t)v23;
              getkSecureBackupAuthenticationPasswordSymbolLoc_ptr_0 = (uint64_t)v23;
            }
            _Block_object_dispose(&v59, 8);
            if (v23)
            {
              v64 = *v23;
              v25 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
              v26 = v64;
              objc_msgSend(v25, "appleIDPasswordOrEquivalentToken");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v65[4] = v27;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v63, 5);
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = objc_alloc_init((Class)getSecureBackupClass_0());
              objc_msgSend(v28, "changeSMSTargetWithInfo:", v53);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = (void *)v29;
              if (!v29)
              {
                objc_msgSend(*(id *)(a1 + 32), "navigationController");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (id)objc_msgSend(v35, "popViewControllerAnimated:", 1);
                goto LABEL_31;
              }
              NSLog(CFSTR("Failed to change phone number: %@"), v29);
              objc_msgSend(v30, "domain");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = 0;
              v60 = &v59;
              v61 = 0x2020000000;
              v32 = (_QWORD *)getkSecureBackupErrorDomainSymbolLoc_ptr_0;
              v62 = getkSecureBackupErrorDomainSymbolLoc_ptr_0;
              if (!getkSecureBackupErrorDomainSymbolLoc_ptr_0)
              {
                v33 = (void *)CloudServicesLibrary_1();
                v32 = dlsym(v33, "kSecureBackupErrorDomain");
                v60[3] = (uint64_t)v32;
                getkSecureBackupErrorDomainSymbolLoc_ptr_0 = (uint64_t)v32;
              }
              _Block_object_dispose(&v59, 8);
              if (v32)
              {
                if (objc_msgSend(v31, "isEqualToString:", *v32))
                {
                  v34 = objc_msgSend(v30, "code") == 29;

                  if (v34)
                  {
                    +[PSKeychainSyncPhoneNumber phoneNumberWithDigits:countryInfo:](PSKeychainSyncPhoneNumber, "phoneNumberWithDigits:countryInfo:", v56, v57);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = (void *)MEMORY[0x1E0CB3940];
                    PS_LocalizedStringForKeychainSync(CFSTR("INVALID_PHONE_NUMBER"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "formattedStringWithDialingPrefix");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "stringWithFormat:", v37, v38);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();

                    v40 = (void *)MEMORY[0x1E0CEA2E8];
                    PS_LocalizedStringForKeychainSync(CFSTR("KEYCHAIN_VERIFICATION"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "alertControllerWithTitle:message:preferredStyle:", v41, v39, 1);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    v43 = (void *)MEMORY[0x1E0CEA2E0];
                    PS_LocalizedStringForKeychainSync(CFSTR("OK"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 0, 0);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "addAction:", v45);

                    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v42, 1, 0);
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else
                {

                }
                v47 = (void *)MEMORY[0x1E0CEA2E8];
                PS_LocalizedStringForKeychainSync(CFSTR("FAILED_TO_CHANGE_PHONE_NUMBER"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "alertControllerWithTitle:message:preferredStyle:", v48, 0, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v49 = (void *)MEMORY[0x1E0CEA2E0];
                PS_LocalizedStringForKeychainSync(CFSTR("OK"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "actionWithTitle:style:handler:", v50, 0, 0);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addAction:", v51);

                objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v35, 1, 0);
                goto LABEL_31;
              }
            }
          }
        }
      }
    }
    PSPNCreateFormattedStringWithCountry_cold_1();
    __break(1u);
  }
LABEL_33:

}

- (void)navCancelPressed
{
  id v2;
  id v3;

  -[PSAccountSecurityController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)navDonePressed
{
  -[KeychainSyncPhoneSettingsFragment resignFirstResponder](self->_phoneSettingsFragment, "resignFirstResponder");
  -[PSAccountSecurityController saveSMSTargetChanges](self, "saveSMSTargetChanges");
}

- (void)_setShowsDoneButton:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_navCancelPressed);
    -[PSAccountSecurityController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v8);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_navDonePressed);
    -[PSAccountSecurityController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
  else
  {
    -[PSAccountSecurityController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", 0);

    -[PSAccountSecurityController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", 0);
  }

}

- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (-[NSString isEqualToString:](self->_SMSTarget, "isEqualToString:", v13)
    && -[KeychainSyncCountryInfo isEqual:](self->_SMSTargetCountryInfo, "isEqual:", v7))
  {
    -[PSAccountSecurityController _setShowsDoneButton:](self, "_setShowsDoneButton:", 0);
  }
  else
  {
    -[PSAccountSecurityController _setShowsDoneButton:](self, "_setShowsDoneButton:", 1);
    -[PSAccountSecurityController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v13, "length");
    if (v7)
      v11 = v10 == 0;
    else
      v11 = 1;
    v12 = !v11;
    objc_msgSend(v9, "setEnabled:", v12);

  }
}

- (void)cancelPressed
{
  void *v3;
  _QWORD v4[5];

  -[PSViewController rootController](self, "rootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PSAccountSecurityController_cancelPressed__block_invoke;
  v4[3] = &unk_1E4A654F0;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __44__PSAccountSecurityController_cancelPressed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1392);
  *(_QWORD *)(v1 + 1392) = 0;

}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (void)setSecurityCodeType:(int)a3
{
  self->_securityCodeType = a3;
}

- (NSString)securityCode
{
  return self->_securityCode;
}

- (void)setSecurityCode:(id)a3
{
  objc_storeStrong((id *)&self->_securityCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityCode, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_SMSTargetCountryInfo, 0);
  objc_storeStrong((id *)&self->_SMSTarget, 0);
  objc_storeStrong((id *)&self->_phoneSettingsFragment, 0);
  objc_storeStrong((id *)&self->_devicePINController, 0);
  objc_storeStrong((id *)&self->_devicePasscodeChangeSetupController, 0);
  objc_storeStrong((id *)&self->_passcodeSpecifiers, 0);
  objc_storeStrong((id *)&self->_recoverySwitch, 0);
}

@end
