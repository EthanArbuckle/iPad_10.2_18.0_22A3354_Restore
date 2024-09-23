@implementation PKWalletVisibility

+ (BOOL)isWalletRestricted
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D47240], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionValuesForFeature:", *MEMORY[0x1E0D46F78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.Passbook"));
  return (char)v2;
}

+ (BOOL)isWalletVisible
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  char v4;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (PKCurrentPassbookState() == 1)
  {
    v2 = dispatch_semaphore_create(0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__PKWalletVisibility_isWalletVisible__block_invoke;
    v6[3] = &unk_1E2AD59F0;
    v7 = v2;
    v8 = &v9;
    v3 = v2;
    _GetPrimaryAppleAccountAttributes(1, v6);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  }
  v4 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

intptr_t __37__PKWalletVisibility_isWalletVisible__block_invoke(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 ^ 1 | a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)updateWalletVisibility
{
  NSObject *v2;
  uint8_t v3[16];

  if (PKPassbookIsSupported())
  {
    PKLogFacilityTypeGetObject(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Updating Wallet visibility restriction...", v3, 2u);
    }

    _GetPrimaryAppleAccountAttributes(0, &__block_literal_global_167);
  }
}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[24];
  uint64_t v13;

  v3 = 0;
  v13 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D46F78];
    *(_QWORD *)buf = CFSTR("com.apple.Passbook");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetUnionRestriction:values:", v4, v5);

  }
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Restricted");
    if (!v3)
      v7 = CFSTR("Unrestricted");
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Wallet visibility: %{public}@", buf, 0xCu);
  }

  if (qword_1ECF229D0 != -1)
    dispatch_once(&qword_1ECF229D0, &__block_literal_global_26_0);
  v8 = qword_1ECF229D8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKWalletVisibility_updateWalletVisibility__block_invoke_2;
  block[3] = &unk_1E2ABE120;
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke_24()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.passkitcore.wallet.visibility.restriction", 0);
  v1 = (void *)qword_1ECF229D8;
  qword_1ECF229D8 = (uint64_t)v0;

}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(v2, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v3, CFSTR("com.apple.Passbook"), CFSTR("com.apple.Passbook"), 0, 0, 0, 0, &v6);
  v4 = v6;

  if (v4)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Wallet visibility: failed to apply restrictions with error %@", buf, 0xCu);
    }

  }
}

+ (id)setOfActiveRestrictionUUIDs
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  intptr_t (*v10)(uint64_t, int, char);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57;
  v18 = __Block_byref_object_dispose__57;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v2 = dispatch_semaphore_create(0);
  if (PKPassbookIsSupported())
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __49__PKWalletVisibility_setOfActiveRestrictionUUIDs__block_invoke;
    v11 = &unk_1E2AD59F0;
    v13 = &v14;
    v3 = v2;
    v12 = v3;
    _GetPrimaryAppleAccountAttributes(1, &v8);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  }
  objc_msgSend((id)v15[5], "addObject:", CFSTR("com.apple.passbook.upgradedpasscoderestriction"), v8, v9, v10, v11);
  objc_msgSend((id)v15[5], "addObject:", CFSTR("com.apple.passbook.allowwhenlocked"));
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v15[5];
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Wallet visibility: returning active restrictions: %@", buf, 0xCu);
  }

  v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

intptr_t __49__PKWalletVisibility_setOfActiveRestrictionUUIDs__block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", CFSTR("com.apple.Passbook"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", CFSTR("com.apple.Passbook"));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
