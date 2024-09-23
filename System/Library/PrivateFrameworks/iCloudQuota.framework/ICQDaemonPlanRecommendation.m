@implementation ICQDaemonPlanRecommendation

+ (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v7 = a5;
  objc_msgSend(a1, "accountForID:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fullBackupSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__ICQDaemonPlanRecommendation_calculateExtraQuotaNeededToSyncForAccountWithID_isAccountFull_completion___block_invoke;
  v12[3] = &unk_1E8B39A48;
  v14 = v10;
  v15 = a1;
  v13 = v7;
  v11 = v7;
  +[_ICQHelperFunctions remoteBackupSizeForAccount:timeoutInSeconds:completion:](_ICQHelperFunctions, "remoteBackupSizeForAccount:timeoutInSeconds:completion:", v8, v12, 2.0);

}

void __104__ICQDaemonPlanRecommendation_calculateExtraQuotaNeededToSyncForAccountWithID_isAccountFull_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v4 - objc_msgSend(v3, "integerValue");
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_msgSend(v3, "integerValue");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 134218496;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    v16 = 2048;
    v17 = v5;
    _os_log_debug_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEBUG, "Found remote backup size %ld, local storage size: %ld, difference: %ld", (uint8_t *)&v12, 0x20u);
  }

  v7 = objc_msgSend(*(id *)(a1 + 48), "calculateExtraQuotaNeededToSyncWithBackupSize:", v5);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

}

+ (int64_t)calculateExtraQuotaNeededToSyncWithBackupSize:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3 & ~(a3 >> 63);
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Returning new total usage value: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (id)accountForID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C8F2B8];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isICPLEnabledForAccount:(id)a3
{
  return +[_ICQHelperFunctions isICPLEnabledForAccount:](_ICQHelperFunctions, "isICPLEnabledForAccount:", a3);
}

+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3
{
  return +[_ICQHelperFunctions isPhotosLibraryIncludedInBackupForAccount:](_ICQHelperFunctions, "isPhotosLibraryIncludedInBackupForAccount:", a3);
}

+ (BOOL)isBackupEnabledForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = (void *)MEMORY[0x1E0C8F2B8];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_ICQHelperFunctions isBackupEnabledForAccount:accountStore:](_ICQHelperFunctions, "isBackupEnabledForAccount:accountStore:", v4, v5);

  return v6;
}

+ (void)getLocalPhotoLibrarySizeWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__ICQDaemonPlanRecommendation_getLocalPhotoLibrarySizeWithCompletion___block_invoke;
  v5[3] = &unk_1E8B39A70;
  v6 = v3;
  v4 = v3;
  +[_ICQHelperFunctions getOriginalPhotosSizeWithCompletion:](_ICQHelperFunctions, "getOriginalPhotosSizeWithCompletion:", v5);

}

uint64_t __70__ICQDaemonPlanRecommendation_getLocalPhotoLibrarySizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)fullBackupSize
{
  return +[_ICQHelperFunctions usedCapacityForVolume:](_ICQHelperFunctions, "usedCapacityForVolume:", CFSTR("/private/var"));
}

@end
