@implementation ICQDaemonOfferManager

- (void)stopDirectingToStorageManagement
{
  ICQDaemonOfferManager *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[ICQDaemonOfferManager _clearStorageManagementFollowup](v2, "_clearStorageManagementFollowup");
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQDaemonOfferManager stopDirectingToStorageManagement]";
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "%s successfully cleared CFU", (uint8_t *)&v5, 0xCu);
  }

  if (-[ICQDaemonOfferManager shouldDirectToStorageManagement](v2, "shouldDirectToStorageManagement"))
  {
    -[ICQDaemonOfferManager setShouldDirectToStorageManagement:](v2, "setShouldDirectToStorageManagement:", 0);
  }
  else
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[ICQDaemonOfferManager stopDirectingToStorageManagement]";
    }

  }
  objc_sync_exit(v2);

}

- (BOOL)shouldDirectToStorageManagement
{
  BOOL v2;
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("_ICQShouldDirectToStorageManagement"), CFSTR("com.apple.cloud.quota"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  v3 = !v2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v9 = "-[ICQDaemonOfferManager shouldDirectToStorageManagement]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning value %{public}@.", buf, 0x16u);
  }

  return v3;
}

- (void)_clearStorageManagementFollowup
{
  FLFollowUpController *followUpController;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  followUpController = self->_followUpController;
  v9 = 0;
  -[FLFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:error:](followUpController, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", &unk_1E8B552E8, &v9);
  v3 = v9;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      v6 = "Error clearing Storage Management followup; error: %{public}@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Cleared Storage Management followup";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

}

- (id)soonestOfferOrStubExpirationDate
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;

  +[ICQDaemonPersisted persistedObject](ICQDaemonOfferStubs, "persistedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = objc_claimAutoreleasedReturnValue();

  +[ICQDaemonPersisted persistedObject](ICQDaemonOffer, "persistedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3 | v5)
  {
    if (v3)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {
      if (v5)
        v7 = (void *)v5;
      else
        v7 = (void *)v3;
      v9 = v7;
    }
    else
    {
      objc_msgSend((id)v3, "earlierDate:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedDaemonOfferManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICQDaemonOfferManager_sharedDaemonOfferManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonOfferManager_onceToken != -1)
    dispatch_once(&sharedDaemonOfferManager_onceToken, block);
  return (id)sharedDaemonOfferManager_sDaemonOfferManager;
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *, _QWORD))a6;
  -[ICQDaemonOfferManager clearLegacyFollowups](self, "clearLegacyFollowups");
  _ICQSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = _ICQSignpostCreateWithObject(v13, v14);
  v17 = v16;

  _ICQSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchOffers", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.3();

  if (v10)
  {
    +[ICQDaemonPersisted persistedObject](ICQDaemonOfferStubs, "persistedObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isValidForAccount:](v22, "isValidForAccount:", v10)
      && (-[NSObject isExpired](v22, "isExpired") & 1) == 0
      && -[ICQDaemonOfferManager _isCacheValidForRequestType:offerStubs:](self, "_isCacheValidForRequestType:offerStubs:", a4, v22))
    {
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject expirationDate](v22, "expirationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "using cached offer stubs - expires %@", buf, 0xCu);

      }
      -[NSObject _persistenceDictionary](v22, "_persistenceDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v25, 0);

      _ICQSignpostGetNanoseconds(v15, v17);
      _ICQSignpostLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v27, OS_SIGNPOST_INTERVAL_END, v15, "FetchOffers", ", buf, 2u);
      }

      _ICQSignpostLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.1();
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke;
      v32[3] = &unk_1E8B39020;
      v34 = v15;
      v35 = v17;
      v33 = v12;
      -[ICQDaemonOfferManager _fetchDaemonOfferStubsForAccount:isForBuddy:quotaReason:completion:](self, "_fetchDaemonOfferStubsForAccount:isForBuddy:quotaReason:completion:", v10, a4 == 4, v11, v32);
      v28 = v33;
    }

  }
  else
  {
    ICQCreateError(8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v12)[2](v12, 0, v29);

    _ICQSignpostGetNanoseconds(v15, v17);
    _ICQSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v31, OS_SIGNPOST_INTERVAL_END, v15, "FetchOffers", ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.1();
  }

}

- (void)clearLegacyFollowups
{
  +[_ICQFollowupSpecification clearLegacyFollowupWithController:](_ICQFollowupSpecification, "clearLegacyFollowupWithController:", self->_followUpController);
}

- (void)_coalescedReconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  __objc2_class *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  BOOL v48;
  _QWORD v49[5];
  id v50;
  id v51;
  uint64_t v52;
  BOOL v53;
  _QWORD aBlock[4];
  id v55;
  os_signpost_id_t v56;
  uint64_t v57;
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v14 = a6;
  v39 = a7;
  v15 = a8;
  v40 = a5;
  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v14;
    _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "Reconsidering offers with options %@", buf, 0xCu);
  }

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v14);
  _ICQSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v20 = _ICQSignpostCreateWithObject(v18, v19);
  v22 = v21;

  _ICQSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v59 = v25;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "ReconsiderOffers", " enableTelemetry=YES %@", buf, 0xCu);

  }
  _ICQSignpostLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _coalescedReconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:].cold.1(v20, v17, v26);

  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke;
  aBlock[3] = &unk_1E8B393D0;
  v56 = v20;
  v57 = v22;
  v28 = v15;
  v55 = v28;
  v29 = _Block_copy(aBlock);
  switch(v17)
  {
    case 0:
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonPremiumOffer, "clearPersistedObject");
      +[ICQDaemonAlert dismissAlertsWithNotificationID:](ICQDaemonAlert, "dismissAlertsWithNotificationID:", 0);
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOffer, "clearPersistedObject");
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonDefaultOffer, "clearPersistedObject");
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonEventOffer, "clearPersistedObject");
      +[ICQLiftUICache sharedCache](ICQLiftUICache, "sharedCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "discardCaches");

      goto LABEL_16;
    case 1:
      goto LABEL_12;
    case 2:
      v31 = ICQDaemonPremiumOffer;
      goto LABEL_15;
    case 4:
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonBuddyOffer, "clearPersistedObject");
      v31 = ICQDaemonOfferStubs;
      goto LABEL_15;
    case 5:
      v31 = ICQDaemonEventOffer;
      goto LABEL_15;
    default:
      +[ICQDaemonAlert dismissAlertsWithNotificationID:](ICQDaemonAlert, "dismissAlertsWithNotificationID:", 0);
      +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOffer, "clearPersistedObject");
LABEL_12:
      v31 = ICQDaemonDefaultOffer;
LABEL_15:
      -[__objc2_class clearPersistedObject](v31, "clearPersistedObject");
LABEL_16:
      v49[0] = v27;
      v49[1] = 3221225472;
      v49[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_272;
      v49[3] = &unk_1E8B39420;
      v49[4] = self;
      v52 = v17;
      v32 = v38;
      v50 = v32;
      v53 = a4;
      v33 = v29;
      v51 = v33;
      v42[0] = v27;
      v42[1] = 3221225472;
      v42[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3;
      v42[3] = &unk_1E8B394D8;
      v42[4] = self;
      v43 = v32;
      v48 = a4;
      v44 = v33;
      v45 = _Block_copy(v49);
      v46 = v39;
      v47 = v17;
      v34 = v39;
      v35 = v45;
      v36 = v32;
      v37 = v33;
      -[ICQDaemonOfferManager _daemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:](self, "_daemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:", v36, v17, v40, v42);

      return;
  }
}

void __98__ICQDaemonOfferManager__daemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 6);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:", a1[4], a1[7], a1[5], v4);

}

uint64_t __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  ICQDaemonOfferStubs *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  char v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting stubs", buf, 2u);
  }

  if (v5 && !v6)
  {
    v8 = -[ICQDaemonOfferStubs initWithDictionary:]([ICQDaemonOfferStubs alloc], "initWithDictionary:", v5);
    if (!v8)
    {
      _ICQGetLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v5;
        _os_log_impl(&dword_1CDEBD000, v27, OS_LOG_TYPE_DEFAULT, "Error: Unable to create offer stubs from dict %@", buf, 0xCu);
      }

      _ICQGetLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v28, OS_LOG_TYPE_DEFAULT, "Persisting placeholder & clearing any existing followups", buf, 2u);
      }

      ICQCreateErrorWithMessage(996, CFSTR("malformed daemon offer stubs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 80))
        v29 = 4;
      else
        v29 = 3;
      objc_msgSend(*(id *)(a1 + 32), "_placeholderOfferForAccount:requestType:error:", *(_QWORD *)(a1 + 40), v29, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "persistObject");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_38;
    }
    v9 = (void *)objc_opt_new();
    v10 = *(_QWORD *)(a1 + 64);
    if (v10
      && ((*(void (**)(uint64_t, ICQDaemonOfferStubs *))(v10 + 16))(v10, v8),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v12;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Choice handler block returned stub %@", buf, 0xCu);
      }

      if (v12)
      {
        v51 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v14;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_getStubsForRequestType:fromDaemonStubs:", *(_QWORD *)(a1 + 72), v8);
      v12 = v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_279);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      if (objc_msgSend(v17, "count") != 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_handlerMultipleStubs:forAccount:requestType:completion:", v17, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
LABEL_38:

        goto LABEL_39;
      }
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "serverDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[ICQMLProtocolParser shouldCallMlDaemonForFetchOfferStub:](ICQMLProtocolParser, "shouldCallMlDaemonForFetchOfferStub:", v19);

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0DDBC28], "shared");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "serverDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "parseNotification:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "serverDictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICQMLProtocolParser parseMaxDelaySecsFromFetchOffersResponse:](ICQMLProtocolParser, "parseMaxDelaySecsFromFetchOffersResponse:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_280;
        v45[3] = &unk_1E8B394B0;
        v26 = *(void **)(a1 + 40);
        v46 = *(id *)(a1 + 32);
        v47 = v26;
        v48 = v18;
        v50 = *(_BYTE *)(a1 + 80);
        v49 = *(id *)(a1 + 56);
        objc_msgSend(v46, "_subdFetchNewOfferResponseWithContent:andMaxDelaySecs:completion:", v23, v25, v45);

      }
      else
      {
        v40 = *(void **)(a1 + 32);
        v41 = *(_QWORD *)(a1 + 40);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_282;
        v42[3] = &unk_1E8B39488;
        v42[4] = v40;
        v44 = *(_BYTE *)(a1 + 80);
        v43 = *(id *)(a1 + 56);
        objc_msgSend(v40, "_fetchDaemonOfferForAccount:stub:notificationID:completion:", v41, v18, 0, v42);

      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 72) == 1)
      {
        _ICQGetLogSystem();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);

      }
      _ICQGetLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", *(_QWORD *)(a1 + 72));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v39;
        _os_log_impl(&dword_1CDEBD000, v38, OS_LOG_TYPE_DEFAULT, "No stub matched for %@ offer -- persisting placeholder", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_placeholderOfferForAccount:requestType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "persistObject");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

    goto LABEL_38;
  }
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v6;
    _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Unable to get offer stubs; error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_39:

}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke(_QWORD *a1)
{
  os_signpost_id_t *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v2 = a1 + 5;
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *v2;
  if (*v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ReconsiderOffers", ", v8, 2u);
  }

  _ICQSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_cold_1();

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __109__ICQDaemonOfferManager__reconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_coalescedReconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);

}

- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 options:(id)a6 choiceHandler:(id)a7 completion:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;
  id location;

  v12 = a4;
  v14 = a3;
  v28 = a5;
  v15 = a6;
  v29 = a7;
  v16 = a8;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v15, v17, v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "aa_altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingString:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[ICQDaemonOfferManager taskLimiters](self, "taskLimiters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __109__ICQDaemonOfferManager__reconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke;
  v30[3] = &unk_1E8B393A8;
  objc_copyWeak(&v35, &location);
  v24 = v14;
  v31 = v24;
  v36 = v12;
  v25 = v28;
  v32 = v25;
  v26 = v15;
  v33 = v26;
  v27 = v29;
  v34 = v27;
  objc_msgSend(v23, "performClosureNoParamsWithIdentifier:task:completion:", v22, v30, v16);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_daemonOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 quotaReason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "aa_altDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", CFSTR("FetchOffers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[ICQDaemonOfferManager taskLimiters](self, "taskLimiters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__ICQDaemonOfferManager__daemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke;
  v20[3] = &unk_1E8B38FF8;
  objc_copyWeak(v23, &location);
  v18 = v10;
  v21 = v18;
  v23[1] = (id)a4;
  v19 = v11;
  v22 = v19;
  objc_msgSend(v17, "performWithIdentifier:task:completion:", v16, v20, v12);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

- (_TtC11iCloudQuota15ICQTaskLimiters)taskLimiters
{
  return self->_taskLimiters;
}

- (void)_daemonLocalOfferStubsDictionaryForAccount:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSObject *v10;
  void *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  _ICQSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v12 = _ICQSignpostCreateWithObject(v10, v11);
  v14 = v13;

  _ICQSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchOffers", " enableTelemetry=YES ", (uint8_t *)&v37, 2u);
  }

  _ICQSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.3();

  if (v8)
  {
    +[ICQDaemonPersisted persistedObject](ICQDaemonOfferStubs, "persistedObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isValidForAccount:](v19, "isValidForAccount:", v8)
      && (-[NSObject isExpired](v19, "isExpired") & 1) == 0
      && -[ICQDaemonOfferManager _isCacheValidForRequestType:offerStubs:](self, "_isCacheValidForRequestType:offerStubs:", a4, v19))
    {
      _ICQGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject expirationDate](v19, "expirationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412290;
        v38 = v21;
        _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "using cached offer stubs - expires %@", (uint8_t *)&v37, 0xCu);

      }
      -[NSObject _persistenceDictionary](v19, "_persistenceDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v22, 0);
    }
    else
    {
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ICQDaemonOfferManager _daemonLocalOfferStubsDictionaryForAccount:requestType:completion:].cold.3(v23, v24, v25, v26, v27, v28, v29, v30);

      ICQCreateError(11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v22);
    }

    _ICQSignpostGetNanoseconds(v12, v14);
    _ICQSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(v37) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v32, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", ", (uint8_t *)&v37, 2u);
    }

    _ICQSignpostLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.1();

  }
  else
  {
    ICQCreateError(8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v34);

    _ICQSignpostGetNanoseconds(v12, v14);
    _ICQSignpostLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      LOWORD(v37) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v36, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", ", (uint8_t *)&v37, 2u);
    }

    _ICQSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ICQDaemonOfferManager _coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:].cold.1();
  }

}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  ICQDaemonOfferStubs *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v8 = -[ICQDaemonOfferStubs initWithDictionary:]([ICQDaemonOfferStubs alloc], "initWithDictionary:", v5);
    -[ICQDaemonOfferStubs chooseStub](v8, "chooseStub");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonOfferStubs choosePremiumStub](v8, "choosePremiumStub");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_172;
    v25[3] = &unk_1E8B38A58;
    v14 = v10;
    v26 = v14;
    objc_msgSend(v11, "_processOfferStub:account:offerType:completion:", v9, v12, 3, v25);
    dispatch_group_enter(v14);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_2;
    v23[3] = &unk_1E8B38A58;
    v24 = v14;
    v17 = v14;
    objc_msgSend(v15, "_processOfferStub:account:offerType:completion:", v20, v16, 2, v23);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_3;
    block[3] = &unk_1E8B38F08;
    v22 = *(id *)(a1 + 48);
    dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

LABEL_9:
    goto LABEL_10;
  }
  _ICQGetLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "Unable to get offer stubs; error: %@", buf, 0xCu);
  }

  v19 = *(_QWORD *)(a1 + 48);
  if (!v7)
  {
    ICQCreateError(11);
    v8 = (ICQDaemonOfferStubs *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, ICQDaemonOfferStubs *))(v19 + 16))(v19, v8);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v7);
LABEL_10:

}

uint64_t __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "reconsiderOffersWithReason:reuseLocalOffers:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)reconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v6 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[ICQDaemonOfferManager accountManager](self, "accountManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "aa_primaryAppleAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke;
    v19[3] = &unk_1E8B38F30;
    v19[4] = self;
    v21 = v11;
    v22 = v9;
    v20 = v8;
    v13 = v9;
    v14 = v11;
    -[ICQDaemonOfferManager _reconsiderLocalOffersWithReason:account:completion:](self, "_reconsiderLocalOffersWithReason:account:completion:", v20, v12, v19);

  }
  else
  {
    +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOfferStubs, "clearPersistedObject");
    v23 = CFSTR("isForFetchOffers");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__ICQDaemonOfferManager_reconsiderOffersWithReason_reuseLocalOffers_completion___block_invoke_2;
    v16[3] = &unk_1E8B38F58;
    v17 = v11;
    v18 = v9;
    v15 = v9;
    v13 = v11;
    -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:", v12, 0, v8, v14, 0, v16);

  }
}

- (_ICQAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)_reconsiderLocalOffersWithReason:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Reconsidering local offers", buf, 2u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke;
  v12[3] = &unk_1E8B38F80;
  v13 = v7;
  v14 = v8;
  v12[4] = self;
  v10 = v7;
  v11 = v8;
  -[ICQDaemonOfferManager _daemonLocalOfferStubsDictionaryForAccount:requestType:completion:](self, "_daemonLocalOfferStubsDictionaryForAccount:requestType:completion:", v10, 0, v12);

}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ind"));

  if ((v5 & 1) != 0)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Fetching CloudKit backup container device id...", buf, 2u);
    }

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v7 = (void *)getCKContainerClass_softClass;
    v21 = getCKContainerClass_softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getCKContainerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __getCKContainerClass_block_invoke;
      v16 = &unk_1E8B384E8;
      v17 = &v18;
      __getCKContainerClass_block_invoke((uint64_t)buf);
      v7 = (void *)v19[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v9, "containerWithIdentifier:", CFSTR("com.apple.backup.ios"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_268;
    v11[3] = &unk_1E8B39380;
    v12 = v2;
    objc_msgSend(v10, "fetchCurrentDeviceIDWithCompletionHandler:", v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v2 + 2))(v2, 0);
  }

}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke()
{
  ICQAsyncValueLoader *v0;
  void *v1;

  v0 = -[ICQAsyncValueLoader initWithDefaultValue:valueFetcher:]([ICQAsyncValueLoader alloc], "initWithDefaultValue:valueFetcher:", 0, &__block_literal_global_263);
  v1 = (void *)getCkBackupDeviceIDWithCompletionHandler__loader;
  getCkBackupDeviceIDWithCompletionHandler__loader = (uint64_t)v0;

}

void __49__ICQDaemonOfferManager_sharedDaemonOfferManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedDaemonOfferManager_sDaemonOfferManager;
  sharedDaemonOfferManager_sDaemonOfferManager = (uint64_t)v0;

}

- (ICQDaemonOfferManager)init
{
  _ICQAccountManager *v3;
  ICQDaemonOfferManager *v4;

  v3 = objc_alloc_init(_ICQAccountManager);
  v4 = -[ICQDaemonOfferManager initWithAccountManager:](self, "initWithAccountManager:", v3);

  return v4;
}

- (ICQDaemonOfferManager)initWithAccountManager:(id)a3
{
  id v5;
  ICQDaemonOfferManager *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSURLSession *sharedURLSession;
  uint64_t v15;
  FLFollowUpController *followUpController;
  uint64_t v17;
  _TtC11iCloudQuota15ICQTaskLimiters *taskLimiters;
  id v19;
  uint64_t v20;
  ICQNetworkThrottleController *throttleController;
  uint8_t v23[16];
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQDaemonOfferManager;
  v6 = -[ICQDaemonOfferManager init](&v24, sel_init);
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0CFAD60], "sharedSessionWithNoUrlCache"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_opt_respondsToSelector(),
          v7,
          (v8 & 1) != 0))
    {
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Using AAA provided session.", v23, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CFAD60], "sharedSessionWithNoUrlCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "urlSession");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Unable to use AAA provided session.", v23, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("ICQFetchOfferURLSession"));
      objc_msgSend(v10, "set_appleIDContext:", v13);

      objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    sharedURLSession = v6->_sharedURLSession;
    v6->_sharedURLSession = (NSURLSession *)v11;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.icloud.quota"));
    followUpController = v6->_followUpController;
    v6->_followUpController = (FLFollowUpController *)v15;

    objc_storeStrong((id *)&v6->_accountManager, a3);
    v17 = objc_opt_new();
    taskLimiters = v6->_taskLimiters;
    v6->_taskLimiters = (_TtC11iCloudQuota15ICQTaskLimiters *)v17;

    v19 = +[ICQDaemonOfferManager ckBackupDeviceID](ICQDaemonOfferManager, "ckBackupDeviceID");
    v20 = objc_opt_new();
    throttleController = v6->_throttleController;
    v6->_throttleController = (ICQNetworkThrottleController *)v20;

  }
  return v6;
}

- (void)daemonOfferDictionaryForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  void (**v29)(id, _QWORD, void *);
  _QWORD v30[5];
  id v31;
  id v32;
  void (**v33)(id, _QWORD, void *);
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(id, _QWORD, void *);
  uint8_t buf[4];
  objc_class *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.purplebuddy")))
  {
    if (!v8)
    {
      ICQCreateError(8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v12);
LABEL_28:

      goto LABEL_29;
    }
    if (+[_ICQHelperFunctions backupRestoreCompletedInOptions:](_ICQHelperFunctions, "backupRestoreCompletedInOptions:", v9))
    {
      +[_ICQHelperFunctions setUserDefaultsBool:forKey:](_ICQHelperFunctions, "setUserDefaultsBool:forKey:", 1, CFSTR("backupRestoreComplete"));
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("contextDictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke;
      v34[3] = &unk_1E8B38DE8;
      v35 = v8;
      v37 = v10;
      v36 = v12;
      -[ICQDaemonOfferManager _fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:](self, "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", v35, CFSTR("quotaFetchOffersURL"), v11, 0, 0, v36, 0, v34);

      v13 = v35;
LABEL_27:

      goto LABEL_28;
    }
    v14 = -[ICQDaemonOfferManager daemonOfferClassFromBundleId:options:](self, "daemonOfferClassFromBundleId:options:", v11, v9);
    -[objc_class persistedObject](v14, "persistedObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "isValidForAccount:", v8))
      {
        v16 = objc_msgSend(v13, "isExpired");
        _ICQGetLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412290;
            v39 = v14;
            _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Returning persisted daemon offer of class %@", buf, 0xCu);
          }

          objc_msgSend(v13, "_persistenceDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v10)[2](v10, v21, 0);
          goto LABEL_26;
        }
        if (v18)
        {
          objc_msgSend(v13, "retrievalDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "callbackInterval");
          *(_DWORD *)buf = 138543874;
          v39 = v14;
          v40 = 2112;
          v41 = v19;
          v42 = 2048;
          v43 = v20;
          _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Skipping persisted daemon offer of class %{public}@ because it expired: daemon offer retrieval date %@, callback interval: %f", buf, 0x20u);

        }
        objc_msgSend(v13, "notificationID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        if (objc_msgSend(v21, "length"))
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_128;
          v30[3] = &unk_1E8B38E38;
          v30[4] = self;
          v31 = v9;
          v32 = v11;
          v33 = v10;
          -[ICQDaemonOfferManager _fetchDaemonOfferForAccount:stub:notificationID:completion:](self, "_fetchDaemonOfferForAccount:stub:notificationID:completion:", v8, 0, v21, v30);

        }
        else
        {
          -[ICQDaemonOfferManager _getHandlerForBundleId:options:](self, "_getHandlerForBundleId:options:", v11, v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_3;
          v26[3] = &unk_1E8B38E60;
          v26[4] = self;
          v27 = v11;
          v28 = v9;
          v29 = v10;
          -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:", v8, 0, v27, v28, v25, v26);

        }
LABEL_26:

        goto LABEL_27;
      }
      _ICQGetLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "accountAltDSID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "aa_altDSID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v14;
        v40 = 2112;
        v41 = v24;
        v42 = 2112;
        v43 = v23;
        v44 = 2112;
        v45 = v13;
        _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "Skipping persisted daemon offer of class %{public}@ due to account mismatch: daemon offer account alt dsid: %@, account alt dsid: %@. Persisted offer was %@", buf, 0x2Au);

      }
    }
    else
    {
      _ICQGetLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v14;
        _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "Did not find a persisted daemon offer of class %{public}@", buf, 0xCu);
      }
    }

    v21 = 0;
    goto LABEL_20;
  }
  -[ICQDaemonOfferManager daemonBuddyOfferDictionaryForAccount:completion:](self, "daemonBuddyOfferDictionaryForAccount:completion:", v8, v10);
LABEL_29:

}

- (Class)daemonOfferClassFromBundleId:(id)a3 options:(id)a4
{
  +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", a4, a3, 0);
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)getCkBackupDeviceIDWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;

  v3 = (void (**)(id, void *))a3;
  if (getCkBackupDeviceIDWithCompletionHandler__onceToken != -1)
    dispatch_once(&getCkBackupDeviceIDWithCompletionHandler__onceToken, &__block_literal_global_260);
  if (v3)
  {
    objc_msgSend((id)getCkBackupDeviceIDWithCompletionHandler__loader, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)getCkBackupDeviceIDWithCompletionHandler__loader, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v5);

    }
    else
    {
      objc_msgSend((id)getCkBackupDeviceIDWithCompletionHandler__loader, "setDidUpdate:", v3);
    }
  }
  objc_msgSend((id)getCkBackupDeviceIDWithCompletionHandler__loader, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)ckBackupDeviceID
{
  return (NSString *)+[ICQDaemonOfferManager getCkBackupDeviceIDWithCompletionHandler:](ICQDaemonOfferManager, "getCkBackupDeviceIDWithCompletionHandler:", 0);
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  ICQDaemonOffer *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = a1[5];
      v20 = 138412802;
      v21 = v7;
      v22 = 2114;
      v23 = v17;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "error %@ fetching offers with context dictionary %{public}@ resulting in serverDict %@", (uint8_t *)&v20, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v8 = -[ICQDaemonOfferStubs _initWithAccount:serverDictionary:]([ICQDaemonOfferStubs alloc], "_initWithAccount:serverDictionary:", a1[4], v5);
    objc_msgSend(v8, "chooseFirstStub");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [ICQDaemonOffer alloc];
      v11 = a1[4];
      objc_msgSend(v9, "serverDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[ICQDaemonOffer _initWithAccount:serverDictionary:](v10, "_initWithAccount:serverDictionary:", v11, v12);

      objc_msgSend(v13, "cacheLiftUIContent");
      v14 = a1[6];
      objc_msgSend(v13, "_persistenceDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

    }
    else
    {
      _ICQGetLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "context dictionary response is missing device offers", (uint8_t *)&v20, 2u);
      }

      v19 = a1[6];
      ICQCreateErrorWithMessage(996, CFSTR("context dictionary response is missing device offers"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v13);
    }

  }
}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_2;
  v13[3] = &unk_1E8B38E10;
  v7 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v10 = *(id *)(a1 + 56);
  v18 = v6;
  v19 = v10;
  v17 = v5;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "_postFollowupForDaemonOffer:replaceExisting:completion:", v12, 1, v13);

}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0));
  v2 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 56), "_persistenceDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 64));

}

void __76__ICQDaemonOfferManager_daemonOfferDictionaryForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "daemonOfferClassFromBundleId:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), "persistedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "_persistenceDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

}

- (id)_getHandlerForBundleId:(id)a3 options:(id)a4
{
  int64_t v4;

  v4 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", a4, a3, 0);
  if ((unint64_t)(v4 - 1) > 4)
    return 0;
  else
    return *(&off_1E8B39728 + v4 - 1);
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chooseFirstDefaultStub");
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chooseFirstPremiumStub");
}

uint64_t __56__ICQDaemonOfferManager__getHandlerForBundleId_options___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chooseFirstEventStub");
}

- (void)daemonBuddyOfferDictionaryForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ICQDaemonOfferManager_daemonBuddyOfferDictionaryForAccount_completion___block_invoke;
  v8[3] = &unk_1E8B38F08;
  v9 = v6;
  v7 = v6;
  -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:", a3, 1, CFSTR("com.apple.purplebuddy"), 0, v8);

}

void __73__ICQDaemonOfferManager_daemonBuddyOfferDictionaryForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    +[ICQDaemonPersisted persistedObject](ICQDaemonBuddyOffer, "persistedObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "_persistenceDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

- (void)teardownOffersForAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_msgSend(v6, "aa_isPrimaryAccount");
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "teardown offers related to primary account %@", (uint8_t *)&v11, 0xCu);
    }

    -[ICQDaemonOfferManager _teardownCachedOffersAndNotify:](self, "_teardownCachedOffersAndNotify:", 1);
    if (!v7)
      goto LABEL_10;
LABEL_9:
    v7[2](v7);
    goto LABEL_10;
  }
  if (v10)
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "teardown for non-primary account %@ - ignoring", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
    goto LABEL_9;
LABEL_10:

}

- (void)addCommonHeadersToRequest:(id)a3
{
  id v4;
  ICQRequestProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  ICQRequestProvider *v9;

  v4 = a3;
  v5 = [ICQRequestProvider alloc];
  -[ICQDaemonOfferManager accountManager](self, "accountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", v8);

  -[ICQRequestProvider addCommonHeadersToRequest:](v9, "addCommonHeadersToRequest:", v4);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ICQDaemonOfferManager renewCredentialsWithCompletion:]";
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "%s - Renewing credentials", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renewCredentialsForAccount:force:reason:completion:", v6, 0, 0, v3);

}

- (id)_storageManagementFollowupActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D15E28];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEVICE_FULL_FOLLOWUP_MANAGE_STORAGE_BUTTON_TITLE"), &stru_1E8B3C468, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithLabel:url:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D15E28];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DEVICE_FULL_FOLLOWUP_LEARN_MORE_BUTTON_TITLE"), &stru_1E8B3C468, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT206504"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithLabel:url:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v6;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_storageManagementFollowupNotification
{
  id v2;
  void *v3;
  void *v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D15E40]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQModelSpecificLocalizedStringKeyForKey(CFSTR("DEVICE_FULL_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1E8B3C468, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQModelSpecificLocalizedStringKeyForKey(CFSTR("DEVICE_FULL_ALERT_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E8B3C468, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInformativeText:", v8);

  v9 = (void *)MEMORY[0x1E0D15E28];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEVICE_FULL_ALERT_ACTIVATE_BUTTON_TITLE"), &stru_1E8B3C468, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithLabel:url:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivateAction:", v13);

  objc_msgSend(v2, "setFrequency:", 86400.0);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = *MEMORY[0x1E0D15E18];
  v19[0] = *MEMORY[0x1E0D15E10];
  v19[1] = v15;
  v19[2] = *MEMORY[0x1E0D15E20];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOptions:", v17);

  return v2;
}

- (id)_storageManagementFollowupItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0D15E38]);
  objc_msgSend(v3, "setUniqueIdentifier:", CFSTR("com.apple.iCloudQuota.StorageManagement.followup"));
  objc_msgSend(v3, "setGroupIdentifier:", *MEMORY[0x1E0D15DF0]);
  objc_msgSend(v3, "setDisplayStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQModelSpecificLocalizedStringKeyForKey(CFSTR("DEVICE_FULL_FOLLOWUP_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E8B3C468, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQModelSpecificLocalizedStringKeyForKey(CFSTR("DEVICE_FULL_FOLLOWUP_MESSAGE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E8B3C468, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInformativeText:", v9);

  -[ICQDaemonOfferManager _storageManagementFollowupActions](self, "_storageManagementFollowupActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActions:", v10);

  -[ICQDaemonOfferManager _storageManagementFollowupNotification](self, "_storageManagementFollowupNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotification:", v11);

  return v3;
}

- (void)_postStorageManagementFollowup
{
  void *v3;
  FLFollowUpController *followUpController;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICQDaemonOfferManager _storageManagementFollowupItem](self, "_storageManagementFollowupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  followUpController = self->_followUpController;
  v11 = 0;
  -[FLFollowUpController postFollowUpItem:error:](followUpController, "postFollowUpItem:error:", v3, &v11);
  v5 = v11;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543618;
      v13 = v3;
      v14 = 2114;
      v15 = v5;
      v8 = "Error posting Storage Management followup %{public}@; error: %{public}@";
      v9 = v6;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    v8 = "Posted Storage Management followup %{public}@";
    v9 = v6;
    v10 = 12;
    goto LABEL_6;
  }

}

- (void)startDirectingToStorageManagement
{
  ICQDaemonOfferManager *v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[ICQDaemonOfferManager shouldDirectToStorageManagement](v2, "shouldDirectToStorageManagement"))
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[ICQDaemonOfferManager startDirectingToStorageManagement]";
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    -[ICQDaemonOfferManager setShouldDirectToStorageManagement:](v2, "setShouldDirectToStorageManagement:", 1);
    -[ICQDaemonOfferManager _teardownCachedOffersAndNotify:](v2, "_teardownCachedOffersAndNotify:", 1);
    -[ICQDaemonOfferManager _postStorageManagementFollowup](v2, "_postStorageManagementFollowup");
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[ICQDaemonOfferManager startDirectingToStorageManagement]";
      v4 = "%s successfully posted CFU";
      goto LABEL_6;
    }
  }

  objc_sync_exit(v2);
}

- (void)reconsiderOffersWithCompletion:(id)a3
{
  -[ICQDaemonOfferManager reconsiderOffersWithReason:reuseLocalOffers:completion:](self, "reconsiderOffersWithReason:reuseLocalOffers:completion:", CFSTR("Unknown"), 0, a3);
}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_172(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__ICQDaemonOfferManager__reconsiderLocalOffersWithReason_account_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isCachedDaemonOfferValid:(id)a3 forAccount:(id)a4
{
  id v5;
  int v6;

  v5 = a3;
  if (objc_msgSend(v5, "isValidForAccount:", a4))
    v6 = objc_msgSend(v5, "isExpired") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (void)_processOfferStub:(id)a3 account:(id)a4 offerType:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  int64_t v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  int64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  if (a3)
  {
    objc_msgSend(a3, "persistedOffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICQDaemonOfferManager _isCachedDaemonOfferValid:forAccount:](self, "_isCachedDaemonOfferValid:forAccount:", v12, v10))
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "%@ offer is valid, posting CFU with replaceExisting: NO", buf, 0xCu);

      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke_173;
      v17[3] = &unk_1E8B38FA8;
      v17[4] = self;
      v19 = a5;
      v18 = v11;
      -[ICQDaemonOfferManager _postFollowupForDaemonOffer:replaceExisting:completion:](self, "_postFollowupForDaemonOffer:replaceExisting:completion:", v12, 0, v17);

    }
    else
    {
      v11[2](v11);
    }

  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "%@ offer is no longer valid, removing CFU.", buf, 0xCu);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke;
    v20[3] = &unk_1E8B38FA8;
    v20[4] = self;
    v22 = a5;
    v21 = v11;
    -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", a5, v20);

  }
}

uint64_t __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__ICQDaemonOfferManager__processOfferStub_account_offerType_completion___block_invoke_173(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)clearAllFollowupsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Clearing all followups", buf, 2u);
  }

  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke;
  v16[3] = &unk_1E8B38A58;
  v8 = v6;
  v17 = v8;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 3, v16);
  dispatch_group_enter(v8);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_2;
  v14[3] = &unk_1E8B38A58;
  v9 = v8;
  v15 = v9;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 2, v14);
  dispatch_group_enter(v9);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E8B38A58;
  v13 = v9;
  v10 = v9;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 5, v12);
  v11 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v10, v11);
  v4[2](v4);

}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__ICQDaemonOfferManager_clearAllFollowupsWithCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)clearFollowupsOfferType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  FLFollowUpController *followUpController;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to clear followup! offer type: %@", buf, 0xCu);

  }
  followUpController = self->_followUpController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke;
  v11[3] = &unk_1E8B38FD0;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  +[_ICQFollowupSpecification clearFollowupWithController:offerType:completion:](_ICQFollowupSpecification, "clearFollowupWithController:offerType:completion:", followUpController, a3, v11);

}

void __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Succeeded at clearing followup! offerType: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke_cold_1((uint64_t)v5, a1);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (unint64_t)daemonOfferSource
{
  void *v2;
  unint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("_ICQOfferSource"), CFSTR("com.apple.cloud.quota"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("local-sample")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("server-sample")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_useFetchOffersDataDirectly
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("_ICQUseFetchOffersDataDirectly"), CFSTR("com.apple.cloud.quota"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

void __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  os_signpost_id_t *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  v6 = a1[5];
  v7 = a1[6];
  v5 = a1 + 5;
  v8 = a3;
  v9 = a2;
  _ICQSignpostGetNanoseconds(v6, v7);
  _ICQSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *v5;
  if (*v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchOffers", ", v16, 2u);
  }

  _ICQSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke_cold_1();

  v14 = a1[4];
  objc_msgSend(v9, "_persistenceDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v8);
}

- (BOOL)_isCacheValidForRequestType:(int64_t)a3 offerStubs:(id)a4
{
  void *v4;
  BOOL v5;

  if (a3 != 1)
    return 1;
  objc_msgSend(a4, "chooseDefaultStub");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_processPushNotificationCheckHardwareIDWithDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  ICQDaemonOfferManager *v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[2];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _ICQSignpostCreate(v8);

  _ICQSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v11, OS_SIGNPOST_EVENT, v9, "PushNotification", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _processPushNotificationCheckHardwareIDWithDictionary:completion:].cold.1();

  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "_processPushNotificationDictionary: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICQDaemonOfferManager clearLegacyFollowups](self, "clearLegacyFollowups");
    v26[0] = CFSTR("CKHardwareID");
    v26[1] = CFSTR("hardwareId");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQStringForOneOfKeys(v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16
      && (objc_msgSend(v16, "lowercaseString"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("all")),
          v17,
          (v18 & 1) == 0))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __90__ICQDaemonOfferManager__processPushNotificationCheckHardwareIDWithDictionary_completion___block_invoke;
      v21[3] = &unk_1E8B39048;
      v22 = v16;
      v25 = v7;
      v23 = self;
      v24 = v6;
      v20 = +[ICQDaemonOfferManager getCkBackupDeviceIDWithCompletionHandler:](ICQDaemonOfferManager, "getCkBackupDeviceIDWithCompletionHandler:", v21);

    }
    else
    {
      -[ICQDaemonOfferManager _processPushNotificationDictionary:completion:](self, "_processPushNotificationDictionary:completion:", v6, v7);
    }

  }
  else
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v14;
      _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "push notification with bad event %@", buf, 0xCu);
    }

    v7[2](v7);
  }

}

void __90__ICQDaemonOfferManager__processPushNotificationCheckHardwareIDWithDictionary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "push targeted to this device only with CKHardwareID:%@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_processPushNotificationDictionary:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "ignoring push (CKHardwareID:%@ does not match local CKHardwareID:%@)", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_processPushNotificationDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  void (**v32)(_QWORD);
  __int128 *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(_QWORD);
  __int128 *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD);
  __int128 *v44;
  uint8_t buf[4];
  void *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)&v47 = 0;
    *((_QWORD *)&v47 + 1) = &v47;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__5;
    v50 = __Block_byref_object_dispose__5;
    -[ICQDaemonOfferManager accountManager](self, "accountManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountStore");
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 40), "aa_primaryAppleAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqual:", v12);

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v14;
        _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "handling push event %@", buf, 0xCu);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _ICQGetLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v16;
          _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "push notification with bad notificationId %@", buf, 0xCu);
        }

        v16 = 0;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("alert")))
      {
        _ICQGetLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "push event (alert)", buf, 2u);
        }

        _ICQGetLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v16;
          _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "refreshing offer details for notificationID %@", buf, 0xCu);
        }

        if (v6)
          v20 = v6;
        else
          v20 = (id)MEMORY[0x1E0C9AA70];
        +[ICQMLBiomePublisher publishEventWithPushNotification:](ICQMLBiomePublisher, "publishEventWithPushNotification:", v20);
        if (+[ICQMLProtocolParser shouldCallMlDaemonForPushNotification:](ICQMLProtocolParser, "shouldCallMlDaemonForPushNotification:", v6))
        {
          objc_msgSend(MEMORY[0x1E0DDBC28], "shared");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "parseNotification:", v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          +[ICQMLProtocolParser parseMaxDelaySecsFromPushNotification:](ICQMLProtocolParser, "parseMaxDelaySecsFromPushNotification:", v6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke;
          v39[3] = &unk_1E8B39070;
          v39[4] = self;
          v40 = v6;
          v43 = v7;
          v41 = v11;
          v44 = &v47;
          v42 = v16;
          -[ICQDaemonOfferManager _subdFetchNewOfferResponseWithContent:andMaxDelaySecs:completion:](self, "_subdFetchNewOfferResponseWithContent:andMaxDelaySecs:completion:", v22, v23, v39);

        }
        else
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2;
          v34[3] = &unk_1E8B390C0;
          v34[4] = self;
          v35 = v6;
          v38 = &v47;
          v36 = v11;
          v37 = v7;
          -[ICQDaemonOfferManager _fetchDaemonOfferForAccount:stub:notificationID:completion:](self, "_fetchDaemonOfferForAccount:stub:notificationID:completion:", v36, 0, v16, v34);

        }
      }
      else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("dismiss")) & 1) != 0
             || objc_msgSend(v14, "isEqualToString:", CFSTR("teardown")))
      {
        _ICQGetLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v14;
          _os_log_impl(&dword_1CDEBD000, v28, OS_LOG_TYPE_DEFAULT, "push event (%{public}@)", buf, 0xCu);
        }

        -[ICQDaemonOfferManager _teardownCachedOffersAndNotify:](self, "_teardownCachedOffersAndNotify:", 0);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_194;
        v30[3] = &unk_1E8B39110;
        v30[4] = self;
        v31 = v11;
        v33 = &v47;
        v32 = v7;
        -[ICQDaemonOfferManager reconsiderOffersWithReason:reuseLocalOffers:completion:](self, "reconsiderOffersWithReason:reuseLocalOffers:completion:", CFSTR("PushTeardown"), 0, v30);

      }
      else
      {
        _ICQGetLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v14;
          _os_log_impl(&dword_1CDEBD000, v29, OS_LOG_TYPE_DEFAULT, "push notification with unexpected event %@ (ignored)", buf, 0xCu);
        }

        v7[2](v7);
      }

    }
    else
    {
      _ICQGetLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v27, OS_LOG_TYPE_DEFAULT, "dsid mismatch: ignoring", buf, 2u);
      }

      v7[2](v7);
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    _ICQGetLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v47) = 138412290;
      *(_QWORD *)((char *)&v47 + 4) = v26;
      _os_log_impl(&dword_1CDEBD000, v24, OS_LOG_TYPE_DEFAULT, "push notification with bad dsid of class %@", (uint8_t *)&v47, 0xCu);

    }
    v7[2](v7);
  }

}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subdRefreshOfferDetailsAndDisplay:completion:account:accountStore:notificationID:isoNewOfferResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56), a2);
}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "fetch error %@", buf, 0xCu);
    }

    v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_193;
    v17[3] = &unk_1E8B38F58;
    v17[4] = v16;
    v11 = &v18;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v16, "clearAllFollowupsWithCompletion:", v17);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "offerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_clearCachedStubsIfOfferIDIsNew:", v9);

    v10 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_3;
    v19[3] = &unk_1E8B39098;
    v19[4] = v10;
    v11 = &v20;
    v12 = v5;
    v20 = v12;
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 64);
    v21 = v13;
    v24 = v14;
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v10, "_postFollowupForDaemonOffer:replaceExisting:completion:", v12, 1, v19);

  }
}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("debugAlert"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_addSampleAlert");
  v3 = +[ICQDaemonAlert shouldShowForDaemonOffer:](ICQDaemonAlert, "shouldShowForDaemonOffer:", *(_QWORD *)(a1 + 40));
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "showing alert", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_showDaemonAlertForOffer:notificationDictionary:store:account:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "skipping alert", v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_193(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_194(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = (void *)a1[6];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2_195;
  v5[3] = &unk_1E8B390E8;
  v6 = v3;
  objc_msgSend(v1, "_updateOffer:buttonId:info:account:accountStore:completion:", 0, CFSTR("teardown"), 0, v2, v4, v5);

}

void __71__ICQDaemonOfferManager__processPushNotificationDictionary_completion___block_invoke_2_195(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "reconsidered offers success:%d error:%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_clearCachedStubsIfOfferIDIsNew:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;

  v3 = a3;
  +[ICQDaemonPersisted persistedObject](ICQDaemonOfferStubs, "persistedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsOfferID:", v3);
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[ICQDaemonOfferManager _clearCachedStubsIfOfferIDIsNew:].cold.1(v6);

  }
  else
  {
    if (v7)
      -[ICQDaemonOfferManager _clearCachedStubsIfOfferIDIsNew:].cold.2();

    +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOfferStubs, "clearPersistedObject");
  }

}

- (void)_fetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 quotaReason:(id)a5 stub:(id)a6 notificationID:(id)a7 contextDictionary:(id)a8 mlDaemonExtraFields:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, void *, _QWORD);
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v25;
  ICQDaemonOfferRequestBuilder *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  ICQDaemonOfferRequestBuilder *v50;
  id v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  _QWORD v53[4];
  id v54;
  id v55;
  void (**v56)(id, void *, _QWORD);
  _QWORD *v57;
  _BYTE *v58;
  _BYTE *v59;
  _QWORD v60[4];
  ICQDaemonOfferRequestBuilder *v61;
  _QWORD v62[5];
  ICQNetworkThrottleController *v63;
  _BYTE v64[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  __int128 v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  _BYTE v69[20];
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v52 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v51 = a9;
  v21 = (void (**)(id, void *, _QWORD))a10;
  _ICQGetLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v68 = v52;
    *(_WORD *)v69 = 2112;
    *(_QWORD *)&v69[2] = v18;
    *(_WORD *)&v69[10] = 2112;
    *(_QWORD *)&v69[12] = v19;
    v70 = 2112;
    v71 = v20;
    _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "_fetchDictionaryForAccount:%@ quotaKey:%@ quotaReason:%@ stub:%@ notificationID:%@ contextDictionary:%@", buf, 0x3Eu);
  }

  if (+[_ICQHelperFunctions isServerMockingEnabled](_ICQHelperFunctions, "isServerMockingEnabled"))
  {
    -[ICQDaemonOfferManager _mockFetchDictionaryForAccount:quotaKey:stub:notificationID:contextDictionary:completion:](self, "_mockFetchDictionaryForAccount:quotaKey:stub:notificationID:contextDictionary:completion:", v16, v17, v18, v19, v20, v21);
  }
  else if (v16)
  {
    if (v18
      && -[ICQDaemonOfferManager _useFetchOffersDataDirectly](self, "_useFetchOffersDataDirectly")
      && (objc_msgSend(v18, "serverDictionary"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = v23 == 0,
          v23,
          !v24))
    {
      objc_msgSend(v18, "serverDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v25, 0);

    }
    else
    {
      v26 = [ICQDaemonOfferRequestBuilder alloc];
      -[ICQDaemonOfferManager accountManager](self, "accountManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[ICQDaemonOfferRequestBuilder initWithAccount:accountManager:](v26, "initWithAccount:accountManager:", v16, v27);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v68 = __Block_byref_object_copy__5;
      *(_QWORD *)v69 = __Block_byref_object_dispose__5;
      LOBYTE(v43) = -[ICQDaemonOfferManager daemonOfferSource](self, "daemonOfferSource") == 2;
      -[ICQDaemonOfferRequestBuilder requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:](v50, "requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:", v17, v52, v18, v19, v20, v51, v43);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v69[8] = objc_msgSend(v28, "mutableCopy");

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        if (-[ICQNetworkThrottleController requestShouldThrottle:](self->_throttleController, "requestShouldThrottle:"))
        {
          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request throttling active for request: %@"), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            ICQCreateErrorWithMessage(16, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *, void *))v21)[2](v21, 0, v30);

          }
        }
        else
        {
          _ICQGetLogSystem();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);

          if (v37)
          {
            _ICQGetLogSystem();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v45 = *(void **)(*(_QWORD *)&buf[8] + 40);
              objc_msgSend(v45, "allHTTPHeaderFields");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "HTTPBody");
              v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              v44 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "HTTPBody");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v64 = 138413058;
              *(_QWORD *)&v64[4] = v45;
              *(_WORD *)&v64[12] = 2112;
              *(_QWORD *)&v64[14] = v48;
              *(_WORD *)&v64[22] = 2112;
              v65 = v39;
              LOWORD(v66) = 2112;
              v46 = (void *)objc_msgSend(v44, "initWithData:encoding:", v47, 4);
              *(_QWORD *)((char *)&v66 + 2) = v46;
              _os_log_debug_impl(&dword_1CDEBD000, v38, OS_LOG_TYPE_DEBUG, "request: %@ headers: %@ body: %@ body (as string): %@", v64, 0x2Au);

            }
          }
          else
          {
            _ICQGetLogSystem();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl(&dword_1CDEBD000, v38, OS_LOG_TYPE_DEFAULT, "sending request for latest offer", v64, 2u);
            }
          }

          *(_QWORD *)v64 = 0;
          *(_QWORD *)&v64[8] = v64;
          *(_QWORD *)&v64[16] = 0x3032000000;
          v65 = __Block_byref_object_copy__5;
          *(_QWORD *)&v66 = __Block_byref_object_dispose__5;
          *((_QWORD *)&v66 + 1) = -[ICQNetworkRequestController initWithSession:numberOfSecondsBetweenRetries:]([ICQNetworkRequestController alloc], "initWithSession:numberOfSecondsBetweenRetries:", self->_sharedURLSession, &unk_1E8B55300);
          v62[0] = 0;
          v62[1] = v62;
          v62[2] = 0x3032000000;
          v62[3] = __Block_byref_object_copy__5;
          v62[4] = __Block_byref_object_dispose__5;
          v63 = self->_throttleController;
          v49 = *(void **)(*(_QWORD *)&v64[8] + 40);
          v40 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8B55318);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = MEMORY[0x1E0C809B0];
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke;
          v60[3] = &unk_1E8B39138;
          v61 = v50;
          v53[0] = v42;
          v53[1] = 3221225472;
          v53[2] = __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke_2;
          v53[3] = &unk_1E8B39160;
          v54 = v18;
          v55 = v19;
          v57 = v62;
          v58 = buf;
          v56 = v21;
          v59 = v64;
          objc_msgSend(v49, "executeRequest:acceptedStatusCodes:renewHeadersBlock:completion:", v40, v41, v60, v53);

          _Block_object_dispose(v62, 8);
          _Block_object_dispose(v64, 8);

        }
      }
      else if (v21)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v18, "offerId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("Failed to build request for key: %@ reason: %@ offerID: %@ notificationID: %@ contextDictionary: %@"), v17, v52, v33, v19, v20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        ICQCreateErrorWithMessage(6, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v21)[2](v21, 0, v35);

      }
      _Block_object_dispose(buf, 8);

    }
  }
  else if (v21)
  {
    ICQCreateError(8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v21)[2](v21, 0, v31);

  }
}

uint64_t __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "renewAuthHeadersForRequest:completion:", a2, a3);
}

void __142__ICQDaemonOfferManager__fetchDictionaryForAccount_quotaKey_quotaReason_stub_notificationID_contextDictionary_mlDaemonExtraFields_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = CFSTR("refreshOffer");
  if (!a1[4] && !a1[5])
    v8 = CFSTR("fetchOffer");
  v9 = a4;
  ICQLogDataTaskComplete(v8, v7, a3, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "request:didCompleteWithError:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), v9);

  if (v7)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (v11)
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "error parsing fetched offer: %@", buf, 0xCu);
      }

      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
  v15 = *(_QWORD *)(a1[9] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

- (void)addPremiumOffersHeaderIfNeededForRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[_ICQHelperFunctions defaultValueForKey:](_ICQHelperFunctions, "defaultValueForKey:", CFSTR("_ICQEnableServerPremiumOffers"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "BOOLValue"))
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-apple-opt-in-flow"));
  +[_ICQHelperFunctions defaultValueForKey:](_ICQHelperFunctions, "defaultValueForKey:", CFSTR("_ICQAddFetchOffersHeaders"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ICQDaemonOfferManager_addPremiumOffersHeaderIfNeededForRequest___block_invoke;
  v8[3] = &unk_1E8B382E8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __66__ICQDaemonOfferManager_addPremiumOffersHeaderIfNeededForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, v6);
  }

}

- (void)_mockFetchDictionaryForAccount:(id)a3 quotaKey:(id)a4 stub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 completion:(id)a8
{
  __CFString *v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  __CFString *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *, _QWORD))a8;
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Mocking the server response", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("quotaFetchOffersURL")) & 1) != 0)
  {
    v16 = CFSTR("_ICQ_MOCK_FETCH_OFFER");
    goto LABEL_12;
  }
  if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("quotaRefreshOfferDetailsURL")))
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      v16 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    v38 = v11;
    v18 = "Mocking Not Supported for %@";
    v19 = v17;
    v20 = 12;
LABEL_10:
    _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_11;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_ICQ_MOCK_%@"), v13);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!v12)
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v18 = "Mocking Not Supported in case of both stub and notification id are nil";
    v19 = v17;
    v20 = 2;
    goto LABEL_10;
  }
  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "offerId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("_ICQ_MOCK_%@"), v33);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  _ICQGetLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v16;
    _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "getting mock server dict from %@", buf, 0xCu);
  }

  +[_ICQHelperFunctions defaultStringValueForKey:](_ICQHelperFunctions, "defaultStringValueForKey:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v23, 0, &v36);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = (__CFString *)v36;
    if (!v25)
      goto LABEL_23;
    _ICQGetLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v25;
      _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "error parsing mock offer: %@", buf, 0xCu);
    }

    _ICQGetLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v11;
      v28 = v13;
      v29 = v12;
      v30 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
      *(_DWORD *)buf = 138412290;
      v38 = v30;
      _os_log_impl(&dword_1CDEBD000, v27, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      v12 = v29;
      v13 = v28;
      v11 = v34;
    }

  }
  else
  {
    v25 = 0;
  }
  v24 = 0;
LABEL_23:
  _ICQGetLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v24;
    _os_log_impl(&dword_1CDEBD000, v31, OS_LOG_TYPE_DEFAULT, "mockServerDict = %@", buf, 0xCu);
  }

  v14[2](v14, v24, 0);
}

- (void)_updateQuotaForAccount:(id)a3 withServerDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQDictionaryForKey(a4, CFSTR("quotaInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalQuota"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("total_quota"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v5, "aa_lastKnownQuota");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 && (objc_msgSend(v12, "isEqualToNumber:", v11) & 1) == 0)
  {
    v14 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v14, "reload");
    objc_msgSend(v14, "aa_setLastKnownQuota:", v11);
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = v5;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Quota for %@ changed from %@ to %@; updating last known quota",
        (uint8_t *)&v17,
        0x20u);
    }

    objc_msgSend(v5, "accountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "saveVerifiedAccount:withCompletionHandler:", v14, &__block_literal_global_241);

  }
}

void __69__ICQDaemonOfferManager__updateQuotaForAccount_withServerDictionary___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Updated account quota information with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_fetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", +[_ICQHelperFunctions _offerRequestTypeForStub:](_ICQHelperFunctions, "_offerRequestTypeForStub:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "aa_altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingString:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v18, "stringByAppendingString:", v12);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_initWeak(&location, self);
  -[ICQDaemonOfferManager taskLimiters](self, "taskLimiters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__ICQDaemonOfferManager__fetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke;
  v24[3] = &unk_1E8B391C8;
  objc_copyWeak(&v28, &location);
  v21 = v10;
  v25 = v21;
  v22 = v11;
  v26 = v22;
  v23 = v12;
  v27 = v23;
  objc_msgSend(v20, "performWithIdentifier:task:completion:", v18, v24, v13);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __84__ICQDaemonOfferManager__fetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:", a1[4], a1[5], a1[6], v4);

}

- (void)_coalescedFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 completion:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  ICQDaemonOfferManager *v29;
  id v30;
  id v31;
  id v32;
  os_signpost_id_t v33;
  uint64_t v34;
  uint8_t buf[16];

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  if (!(v11 | v12))
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: both stub and notificationID are nil -- attempting blind refresh", buf, 2u);
    }

  }
  _ICQSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v17 = _ICQSignpostCreateWithObject(v15, v16);
  v19 = v18;

  _ICQSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RefreshOfferDetails", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:].cold.1();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke;
  v27[3] = &unk_1E8B39230;
  v28 = (id)v11;
  v29 = self;
  v30 = v10;
  v31 = (id)v12;
  v33 = v17;
  v34 = v19;
  v32 = v13;
  v23 = v13;
  v24 = (id)v12;
  v25 = v10;
  v26 = (id)v11;
  -[ICQDaemonOfferManager _fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:](self, "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", v25, CFSTR("quotaRefreshOfferDetailsURL"), CFSTR("RefreshOfferDetails"), v26, v24, 0, 0, v27);

}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICQDaemonOfferStub *v7;
  ICQDaemonOfferStub *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  objc_class *v19;
  void *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  const __CFString *v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (ICQDaemonOfferStub *)*(id *)(a1 + 32);
  v8 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v5);
  if (v5)
    v9 = v5;
  else
    v9 = (id)MEMORY[0x1E0C9AA70];
  +[ICQMLBiomePublisher publishEventWithRefreshOfferDetailsResponse:](ICQMLBiomePublisher, "publishEventWithRefreshOfferDetailsResponse:", v9);
  if (v7)
  {
    if (v5)
    {
      -[ICQDaemonOfferStub offerId](v7, "offerId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQDaemonOfferStub offerId](v8, "offerId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        _ICQGetLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(v8, v7);

      }
      if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer")
        && !-[ICQDaemonOfferStub isBuddyOffer](v8, "isBuddyOffer"))
      {
        _ICQGetLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "missing buddyOffer flag after refresh offer details", buf, 2u);
        }

      }
    }
  }
  else
  {
    v7 = v8;
  }
  -[ICQDaemonOfferStub conditionsWhenChosen](v7, "conditionsWhenChosen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[ICQDaemonOfferStub conditionsWhenChosen](v7, "conditionsWhenChosen");
  else
    +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQDaemonOfferStub criteria](v8, "criteria");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSatisfiedByConditions:", v16);

  if ((v18 & 1) != 0)
  {
    if (v5)
    {
      v46 = v6;
      v19 = (objc_class *)objc_msgSend(*(id *)(a1 + 40), "_classForOfferStub:", v8);
      ICQLogOfferDetailsForServerDictionary(v5);
      objc_msgSend(*(id *)(a1 + 40), "_updateQuotaForAccount:withServerDictionary:", *(_QWORD *)(a1 + 48), v5);
      v20 = (void *)objc_msgSend([v19 alloc], "_initWithAccount:serverDictionary:", *(_QWORD *)(a1 + 48), v5);
      objc_msgSend(v20, "setNotificationID:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v20, "cacheLiftUIContent");
      objc_msgSend(v20, "persistObject");
      Nanoseconds = _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      _ICQSignpostLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = *(_QWORD *)(a1 + 72);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v19;
        _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v23, OS_SIGNPOST_INTERVAL_END, v24, "RefreshOfferDetails", "%@", buf, 0xCu);
      }

      _ICQSignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v48 = *(unsigned __int16 *)(a1 + 72);
        *(_WORD *)&v48[4] = 2048;
        *(double *)&v48[6] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&v48[14] = 2112;
        *(_QWORD *)&v48[16] = v19;
        _os_log_debug_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
      }

      _ICQGetLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "expirationDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v48 = v19;
        *(_WORD *)&v48[8] = 2112;
        *(_QWORD *)&v48[10] = v27;
        _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "Finished persisting %{public}@ offer; expires on %@",
          buf,
          0x16u);

      }
      v28 = *(_QWORD *)(a1 + 64);
      if (v28)
        (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v20, 0);

      v29 = v46;
      goto LABEL_58;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v30, OS_LOG_TYPE_DEFAULT, "Fetched offer is not valid in current conditions, invalidating both old and new offers", buf, 2u);
    }

    -[ICQDaemonOfferStub offerResetURL](v8, "offerResetURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "Updating server with invalid fetched offer status", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", *(_QWORD *)(a1 + 48), CFSTR("quotaOfferReset"), CFSTR("OfferReset"), v8, *(_QWORD *)(a1 + 56), 0, 0, &__block_literal_global_250);
    }
    else
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "No offerResetURL provided in fetched offer, unable to notify server", buf, 2u);
      }

    }
  }
  _ICQGetLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer"))
      v35 = CFSTR("buddy ");
    else
      v35 = &stru_1E8B3C468;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v48 = v6;
    *(_WORD *)&v48[8] = 2114;
    *(_QWORD *)&v48[10] = v35;
    _os_log_impl(&dword_1CDEBD000, v34, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching %{public}@offer -- persisting placeholder", buf, 0x16u);
  }

  v36 = objc_msgSend(*(id *)(a1 + 40), "_classForOfferStub:", v7);
  v29 = v6;
  objc_msgSend(*(id *)(a1 + 40), "_placeholderOfferForAccount:requestType:error:", *(_QWORD *)(a1 + 48), -[ICQDaemonOfferStub requestType](v7, "requestType"), v6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheLiftUIContent");
  objc_msgSend(v5, "persistObject");
  v37 = _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  _ICQSignpostLogSystem();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v40 = *(_QWORD *)(a1 + 72);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v48 = v36;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v39, OS_SIGNPOST_INTERVAL_END, v40, "RefreshOfferDetails", "%@", buf, 0xCu);
  }

  _ICQSignpostLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v48 = *(unsigned __int16 *)(a1 + 72);
    *(_WORD *)&v48[4] = 2048;
    *(double *)&v48[6] = (double)v37 / 1000000000.0;
    *(_WORD *)&v48[14] = 2112;
    *(_QWORD *)&v48[16] = v36;
    _os_log_debug_impl(&dword_1CDEBD000, v41, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
  }

  _ICQGetLogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer"))
      v43 = CFSTR("buddy ");
    else
      v43 = &stru_1E8B3C468;
    objc_msgSend(v5, "expirationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v48 = v43;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v44;
    _os_log_impl(&dword_1CDEBD000, v42, OS_LOG_TYPE_DEFAULT, "Finished persisting placeholder %{public}@ offer; expires on %@",
      buf,
      0x16u);

  }
  v45 = *(_QWORD *)(a1 + 64);
  if (v45)
    (*(void (**)(uint64_t, id, _QWORD))(v45 + 16))(v45, v5, 0);
LABEL_58:

}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_249(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_249_cold_1();

  }
}

- (Class)_classForOfferStub:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "offerClass");
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Fetched daemon offer of class %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return (Class)v3;
}

- (void)_fetchDaemonOfferStubsForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, NSObject *, _QWORD);
  id v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  __CFString *v17;
  __CFString **v18;
  __CFString *v19;
  NSObject *v20;
  void (**v21)(id, NSObject *, _QWORD);
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v8 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, NSObject *, _QWORD))a6;
  v12 = a5;
  if (-[ICQDaemonOfferManager daemonOfferSource](self, "daemonOfferSource") == 1)
  {
    +[ICQDaemonOfferStubs daemonOfferStubsDictionarySample](ICQDaemonOfferStubs, "daemonOfferStubsDictionarySample");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "fetched local sample offer", buf, 2u);
      }

      v14 = -[ICQDaemonOfferStubs _initWithAccount:serverDictionary:]([ICQDaemonOfferStubs alloc], "_initWithAccount:serverDictionary:", v10, v13);
      -[NSObject persistObject](v14, "persistObject");
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject expirationDate](v14, "expirationDate");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "Finished persisting local offer stubs; expires on %@",
          buf,
          0xCu);

      }
      if (v11)
        v11[2](v11, v14, 0);
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "Unable to get local offer stubs; dropping through to server stubs",
        buf,
        2u);
    }

  }
  v18 = &ICQAccountQuotaFetchOffersForBuddyURLKey;
  if (!v8)
    v18 = ICQAccountQuotaFetchOffersURLKey;
  v19 = *v18;
  _ICQGetLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v19;
    _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "Fetching offer stubs - calling %@", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__ICQDaemonOfferManager__fetchDaemonOfferStubsForAccount_isForBuddy_quotaReason_completion___block_invoke;
  v23[3] = &unk_1E8B39258;
  v23[4] = self;
  v24 = v10;
  v25 = v11;
  v21 = v11;
  v22 = v10;
  -[ICQDaemonOfferManager _fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:](self, "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", v22, v19, v12, 0, 0, 0, 0, v23);

}

void __92__ICQDaemonOfferManager__fetchDaemonOfferStubsForAccount_isForBuddy_quotaReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "fetched offers:\n%@", (uint8_t *)&v14, 0xCu);
    }

    +[ICQMLBiomePublisher publishEventWithFetchOffersResponse:](ICQMLBiomePublisher, "publishEventWithFetchOffersResponse:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_updateQuotaForAccount:withServerDictionary:", *(_QWORD *)(a1 + 40), v5);
    v9 = -[ICQDaemonOfferStubs _initWithAccount:serverDictionary:]([ICQDaemonOfferStubs alloc], "_initWithAccount:serverDictionary:", *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(v9, "persistObject");
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "expirationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      v12 = "Finished persisting offer stubs; expires on %@";
LABEL_10:
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching offer stubs -- persisting placeholder", (uint8_t *)&v14, 0xCu);
    }

    v9 = -[ICQDaemonOfferStubs _initWithAccount:error:]([ICQDaemonOfferStubs alloc], "_initWithAccount:error:", *(_QWORD *)(a1 + 40), v6);
    objc_msgSend(v9, "persistObject");
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "expirationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      v12 = "Finished persisting placeholder stubs; expires on %@";
      goto LABEL_10;
    }
  }

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v9, 0);

}

- (void)_showDaemonAlertForOffer:(id)a3 notificationDictionary:(id)a4 store:(id)a5 account:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  ICQDaemonOfferManager *v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke;
  block[3] = &unk_1E8B392A8;
  v23 = v12;
  v24 = v14;
  v20 = v11;
  v21 = self;
  v22 = v13;
  v15 = v12;
  v16 = v13;
  v17 = v14;
  v18 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  ICQDaemonAlert *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  int8x16_t v17;
  _QWORD v18[4];
  int8x16_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "showing alert for daemonOffer %@", buf, 0xCu);
  }

  if (sDaemonAlert)
  {
    objc_msgSend((id)sDaemonAlert, "dismissAlert");
    v4 = (void *)sDaemonAlert;
    sDaemonAlert = 0;

  }
  v5 = +[ICQDaemonAlert shouldShowForDaemonOffer:](ICQDaemonAlert, "shouldShowForDaemonOffer:", a1[4]);
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1[4], "level"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "alertSpecification");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Showing alert from daemon with offer level %@ alertSpecification %@", buf, 0x16u);

    }
    v10 = -[ICQDaemonAlert initWithDaemonOffer:]([ICQDaemonAlert alloc], "initWithDaemonOffer:", a1[4]);
    v11 = (void *)sDaemonAlert;
    sDaemonAlert = (uint64_t)v10;

    +[ICQMLBiomePublisher publishOfferDisplayActionEvent](ICQMLBiomePublisher, "publishOfferDisplayActionEvent");
    v12 = (void *)sDaemonAlert;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_253;
    v18[3] = &unk_1E8B39280;
    v17 = *((int8x16_t *)a1 + 2);
    v13 = (id)v17.i64[0];
    v19 = vextq_s8(v17, v17, 8uLL);
    v20 = a1[6];
    v21 = a1[7];
    v22 = a1[8];
    objc_msgSend(v12, "showAlertWithCompletion:", v18);

  }
  else
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1[4], "level"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "alertSpecification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Skipping alert from daemon offer level %@ alertSpecification %@", buf, 0x16u);

    }
    v16 = (void (**)(void))a1[8];
    if (v16)
      v16[2]();
  }
}

void __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_253(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _ICQStringForAction(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Daemon alert completed with action %@ parameters %@", buf, 0x16u);

  }
  if (a2 == 4)
    +[ICQMLBiomePublisher publishOfferBuyActionEvent](ICQMLBiomePublisher, "publishOfferBuyActionEvent");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ServerLinkId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "offerId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_254;
    v15[3] = &unk_1E8B390E8;
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v9, "_updateOffer:buttonId:info:account:accountStore:completion:", v10, v8, 0, v11, v12, v15);

  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "no buttonId, skipping teardown ack", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
      (*(void (**)(void))(v14 + 16))();
  }

}

uint64_t __98__ICQDaemonOfferManager__showDaemonAlertForOffer_notificationDictionary_store_account_completion___block_invoke_254(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:(int64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "posting push received darwin notification: %@", (uint8_t *)&v13, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    +[_ICQHelperFunctions _darwinNotificationNameForRequestType:](_ICQHelperFunctions, "_darwinNotificationNameForRequestType:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)v5, 0, 0, 1u);
    _ICQSignpostLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _ICQSignpostCreate(v8);

    _ICQSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v13 = 138412290;
      v14 = v5;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v11, OS_SIGNPOST_EVENT, v9, "DarwinNotification", " enableTelemetry=YES %@", (uint8_t *)&v13, 0xCu);
    }

    _ICQSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:].cold.2();

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:].cold.1(v5);
  }

}

- (void)_persistAndNotifyMissingPlaceholdersForRequestType:(int64_t)a3 account:(id)a4
{
  id v6;
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
  _QWORD v17[5];

  v6 = a4;
  if (a3 == 5)
  {
    -[objc_class persistedObject](-[ICQDaemonOfferManager _daemonOfferClassForRequestType:](self, "_daemonOfferClassForRequestType:", 5), "persistedObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[ICQDaemonOfferManager _placeholderOfferForAccount:requestType:error:](self, "_placeholderOfferForAccount:requestType:error:", v6, 5, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "persistObject");

    }
  }
  else if (a3)
  {
    -[objc_class persistedObject](-[ICQDaemonOfferManager _daemonOfferClassForRequestType:](self, "_daemonOfferClassForRequestType:", a3), "persistedObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[ICQDaemonOfferManager _placeholderOfferForAccount:requestType:error:](self, "_placeholderOfferForAccount:requestType:error:", v6, a3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "persistObject");

      -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:](self, "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", a3);
    }
  }
  else
  {
    +[ICQDaemonPersisted persistedObject](ICQDaemonOffer, "persistedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[ICQDaemonOfferManager _placeholderOfferForAccount:requestType:error:](self, "_placeholderOfferForAccount:requestType:error:", v6, 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistObject");

      -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:](self, "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 3);
    }
    +[ICQDaemonPersisted persistedObject](ICQDaemonDefaultOffer, "persistedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[ICQDaemonOfferManager _placeholderOfferForAccount:requestType:error:](self, "_placeholderOfferForAccount:requestType:error:", v6, 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistObject");

      -[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:](self, "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
    }
    +[ICQDaemonPersisted persistedObject](ICQDaemonPremiumOffer, "persistedObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[ICQDaemonOfferManager _placeholderOfferForAccount:requestType:error:](self, "_placeholderOfferForAccount:requestType:error:", v6, 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistObject");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__ICQDaemonOfferManager__persistAndNotifyMissingPlaceholdersForRequestType_account___block_invoke;
      v17[3] = &unk_1E8B38A58;
      v17[4] = self;
      -[ICQDaemonOfferManager _postFollowupForDaemonOffer:replaceExisting:completion:](self, "_postFollowupForDaemonOffer:replaceExisting:completion:", v12, 1, v17);

    }
  }

}

uint64_t __84__ICQDaemonOfferManager__persistAndNotifyMissingPlaceholdersForRequestType_account___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 2);
}

- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "accountStore");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonOfferManager _updateOffer:buttonId:info:account:accountStore:completion:](self, "_updateOffer:buttonId:info:account:accountStore:completion:", v15, v14, v13, v16, v17, v12);

}

- (void)_updateOffer:(id)a3 buttonId:(id)a4 info:(id)a5 account:(id)a6 accountStore:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ICQOfferUpdateRequestContext *v20;
  void *v21;
  void *v22;
  id v23;
  ICQOfferUpdateController *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_alloc_init(ICQOfferUpdateRequestContext);
  -[ICQOfferUpdateRequestContext setAccount:](v20, "setAccount:", v17);
  -[ICQOfferUpdateRequestContext setButtonId:](v20, "setButtonId:", v15);
  v26 = v14;
  -[ICQOfferUpdateRequestContext setOfferId:](v20, "setOfferId:", v14);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ICQUpdateOfferKeyIsZeroAction"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ICQUpdateOfferKeyIsZeroAction"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQOfferUpdateRequestContext setZeroAction:](v20, "setZeroAction:", objc_msgSend(v22, "BOOLValue"));

  }
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  v30[4] = __Block_byref_object_dispose__5;
  v23 = v18;
  v31 = v23;
  v24 = -[ICQOfferUpdateController initWithSession:]([ICQOfferUpdateController alloc], "initWithSession:", self->_sharedURLSession);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__ICQDaemonOfferManager__updateOffer_buttonId_info_account_accountStore_completion___block_invoke;
  v27[3] = &unk_1E8B392D0;
  v29 = v30;
  v25 = v19;
  v28 = v25;
  -[ICQOfferUpdateController performOfferUpdateWithContext:completion:](v24, "performOfferUpdateWithContext:completion:", v20, v27);

  _Block_object_dispose(v30, 8);
}

void __84__ICQDaemonOfferManager__updateOffer_buttonId_info_account_accountStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (void)_teardownCachedOfferAndNotify:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  +[ICQDaemonAlert dismissAlertsWithNotificationID:](ICQDaemonAlert, "dismissAlertsWithNotificationID:", 0);
  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOffer, "clearPersistedObject");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICQDaemonOfferManager__teardownCachedOfferAndNotify___block_invoke;
  v5[3] = &unk_1E8B392F8;
  v6 = a3;
  v5[4] = self;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 3, v5);
}

void __55__ICQDaemonOfferManager__teardownCachedOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "regular daemon offer / alerts / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 3);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "regular daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }

  }
}

- (void)_teardownCachedDefaultOfferAndNotify:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonDefaultOffer, "clearPersistedObject");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ICQDaemonOfferManager__teardownCachedDefaultOfferAndNotify___block_invoke;
  v5[3] = &unk_1E8B392F8;
  v6 = a3;
  v5[4] = self;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 3, v5);
}

void __62__ICQDaemonOfferManager__teardownCachedDefaultOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "default daemon offer torn down without replacement; notifying clients",
        buf,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "default daemon offer torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }

  }
}

- (void)_teardownCachedBuddyOffer
{
  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonBuddyOffer, "clearPersistedObject");
}

- (void)_teardownCachedPremiumOfferAndNotify:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonPremiumOffer, "clearPersistedObject");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ICQDaemonOfferManager__teardownCachedPremiumOfferAndNotify___block_invoke;
  v5[3] = &unk_1E8B392F8;
  v6 = a3;
  v5[4] = self;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 2, v5);
}

void __62__ICQDaemonOfferManager__teardownCachedPremiumOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 2);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }

  }
}

- (void)_teardownCachedEventOfferAndNotify:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonEventOffer, "clearPersistedObject");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ICQDaemonOfferManager__teardownCachedEventOfferAndNotify___block_invoke;
  v5[3] = &unk_1E8B392F8;
  v6 = a3;
  v5[4] = self;
  -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", 5, v5);
}

void __60__ICQDaemonOfferManager__teardownCachedEventOfferAndNotify___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / followups were torn down without replacement; notifying clients",
        buf,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 5);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "premium daemon offer / alerts / followups were torn down but will be replaced; not notifying clients until then",
        v5,
        2u);
    }

  }
}

- (void)_teardownCachedOffersAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _ICQSignpostCreate(v5);

  _ICQSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = &stru_1E8B3C468;
    if (v3)
      v9 = CFSTR("and notify");
    v11 = 138412290;
    v12 = v9;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v8, OS_SIGNPOST_EVENT, v6, "TeardownAllOffers", " enableTelemetry=YES %@", (uint8_t *)&v11, 0xCu);
  }

  _ICQSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _teardownCachedOffersAndNotify:].cold.1(v6, v3, v10);

  +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOfferStubs, "clearPersistedObject");
  -[ICQDaemonOfferManager _teardownCachedBuddyOffer](self, "_teardownCachedBuddyOffer");
  -[ICQDaemonOfferManager _teardownCachedPremiumOfferAndNotify:](self, "_teardownCachedPremiumOfferAndNotify:", v3);
  -[ICQDaemonOfferManager _teardownCachedEventOfferAndNotify:](self, "_teardownCachedEventOfferAndNotify:", v3);
  -[ICQDaemonOfferManager _teardownCachedOfferAndNotify:](self, "_teardownCachedOfferAndNotify:", v3);
  -[ICQDaemonOfferManager _teardownCachedDefaultOfferAndNotify:](self, "_teardownCachedDefaultOfferAndNotify:", v3);
  -[ICQDaemonOfferManager _subdTearDown](self, "_subdTearDown");
}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_268(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_268_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Fetched CloudKit backup container device id: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (Class)_daemonOfferClassForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class();
}

- (id)_placeholderOfferForAccount:(id)a3 requestType:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(-[ICQDaemonOfferManager _daemonOfferClassForRequestType:](self, "_daemonOfferClassForRequestType:", a4)), "_initWithAccount:error:", v9, v8);

  objc_msgSend(v10, "setNotificationID:", &stru_1E8B3C468);
  return v10;
}

- (void)_reconsiderOffersForAccount:(id)a3 isForBuddy:(BOOL)a4 quotaReason:(id)a5 choiceHandler:(id)a6 completion:(id)a7
{
  -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:options:choiceHandler:completion:", a3, a4, a5, 0, a6, a7);
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_272(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_persistAndNotifyMissingPlaceholdersForRequestType:account:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 64))
  {
    v4 = objc_msgSend(v3, "isDefaultOffer");
    v5 = *(void **)(a1 + 32);
    if (!v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2;
      v6[3] = &unk_1E8B393F8;
      v6[4] = v5;
      v7 = v3;
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v5, "_postFollowupForDaemonOffer:replaceExisting:completion:", v7, 1, v6);

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:

}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_277(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "offerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E8B3C468);

  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "serverDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Missing offer id in stub %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return v4 ^ 1u;
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_280(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2_281;
  v6[3] = &unk_1E8B39488;
  v6[4] = v3;
  v8 = *(_BYTE *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:", v4, v5, 0, a2, v6);

}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_2_281(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v5, "_logErrorsForFetchOfferResultWithOffer:error:isForBuddy:", v7, a3, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_282(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v5, "_logErrorsForFetchOfferResultWithOffer:error:isForBuddy:", v7, a3, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_getStubsForRequestType:(int64_t)a3 fromDaemonStubs:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void **v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Choosing all available stubs", buf, 2u);
      }

      -[ICQDaemonOfferManager _getFetchOfferStubsFromStubs:](self, "_getFetchOfferStubsFromStubs:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 1:
      objc_msgSend(v6, "chooseDefaultStub");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_26;
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Chose default stub %@", buf, 0xCu);
      }

      v21 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v21;
      goto LABEL_25;
    case 2:
      objc_msgSend(v6, "choosePremiumStub");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_26;
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "Chose premium stub %@", buf, 0xCu);
      }

      v22 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v22;
      goto LABEL_25;
    case 4:
      objc_msgSend(v6, "chooseBuddyStub");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "ChooseBuddyStub returned stub %@", buf, 0xCu);
      }

      if (!v10)
        goto LABEL_26;
      v23 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v23;
      goto LABEL_25;
    case 5:
      objc_msgSend(v6, "chooseEventStub");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_26;
      _ICQGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Chose backup restored stub %@", buf, 0xCu);
      }

      v20 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v20;
      goto LABEL_25;
    default:
      objc_msgSend(v6, "chooseStub");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Chose regular stub %@", buf, 0xCu);
        }

        v19 = v10;
        v12 = (void *)MEMORY[0x1E0C99D20];
        v13 = &v19;
LABEL_25:
        objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_26:
        v9 = 0;
      }

LABEL_28:
      return v9;
  }
}

- (id)_getFetchOfferStubsFromStubs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "chooseStub");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "choosePremiumStub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chooseEventStub");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chooseDefaultStub");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Adding regular offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v4, "addObject:", v5);
  }
  if (v6)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Adding premium offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v4, "addObject:", v6);
  }
  if (v7)
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Adding event offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v4, "addObject:", v7);
  }
  if (v8)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Adding default offer stub %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v4, "addObject:", v8);
  }

  return v4;
}

- (void)_handlerMultipleStubs:(id)a3 forAccount:(id)a4 requestType:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _BOOL4 v18;
  dispatch_time_t v19;
  void (**v20)(_QWORD);
  id obj;
  _QWORD v23[5];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20 = (void (**)(_QWORD))a6;
  v11 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "serverDictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[ICQMLProtocolParser shouldCallMlDaemonForFetchOfferStub:](ICQMLProtocolParser, "shouldCallMlDaemonForFetchOfferStub:", v17);

        if (v18)
        {
          -[ICQDaemonOfferManager _subdHandleFetchOffersStub:account:requestType:group:completion:](self, "_subdHandleFetchOffersStub:account:requestType:group:completion:", v16, v10, a5, v11, v20);
        }
        else
        {
          dispatch_group_enter(v11);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke;
          v23[3] = &unk_1E8B39528;
          v23[4] = self;
          v24 = v11;
          -[ICQDaemonOfferManager _fetchDaemonOfferForAccount:stub:notificationID:completion:](self, "_fetchDaemonOfferForAccount:stub:notificationID:completion:", v10, v16, 0, v23);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  v19 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v11, v19);
  -[ICQDaemonOfferManager _persistAndNotifyMissingPlaceholdersForRequestType:account:](self, "_persistAndNotifyMissingPlaceholdersForRequestType:account:", a5, v10);
  v20[2](v20);

}

void __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logErrorsForFetchOfferResultWithOffer:error:isForBuddy:", v5, a3, 0);
  if (v5 && !objc_msgSend(v5, "isBuddyOffer"))
  {
    v6 = objc_msgSend(v5, "isDefaultOffer");
    v7 = *(void **)(a1 + 32);
    if (!v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke_2;
      v8[3] = &unk_1E8B39500;
      v8[4] = v7;
      v9 = v5;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v7, "_postFollowupForDaemonOffer:replaceExisting:completion:", v9, 1, v8);

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_6:

}

void __81__ICQDaemonOfferManager__handlerMultipleStubs_forAccount_requestType_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_logErrorsForFetchOfferResultWithOffer:(id)a3 error:(id)a4 isForBuddy:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      v10 = "Unexpected error %@";
      v11 = v9;
      v12 = 12;
LABEL_15:
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (!v7)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v14) = 0;
    v10 = "Error: Unexpected nil daemonOffer";
    goto LABEL_14;
  }
  v13 = objc_msgSend(v7, "isBuddyOffer");
  if (v5)
  {
    if ((v13 & 1) == 0)
    {
      _ICQGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      LOWORD(v14) = 0;
      v10 = "Error: Requested buddy offer but got non-buddy offer!";
LABEL_14:
      v11 = v9;
      v12 = 2;
      goto LABEL_15;
    }
  }
  else if (v13)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v14) = 0;
    v10 = "Error: Requested offer but got buddy offer!";
    goto LABEL_14;
  }
LABEL_17:

}

- (void)_postFollowupForDaemonOffer:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  FLFollowUpController *followUpController;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD);
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "followupSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    followUpController = self->_followUpController;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__ICQDaemonOfferManager__postFollowupForDaemonOffer_replaceExisting_completion___block_invoke;
    v19[3] = &unk_1E8B38C78;
    v20 = v8;
    v21 = v9;
    objc_msgSend(v10, "postFollowupWithController:replaceExisting:completion:", followUpController, v6, v19);

  }
  else
  {
    -[ICQDaemonOfferManager clearFollowupsOfferType:completion:](self, "clearFollowupsOfferType:completion:", objc_msgSend(v8, "requestType"), 0);
    objc_msgSend(v8, "lockScreenInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "there's no follow up info but lock screen info ... attempting to post a user notification", buf, 2u);
      }

      objc_msgSend(v8, "offerId");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("Unknown");
      if (v14)
        v16 = (__CFString *)v14;
      v17 = v16;

      objc_msgSend(v8, "lockScreenInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQDaemonOfferManager _postUserNotification:replaceExisting:offerID:completion:](self, "_postUserNotification:replaceExisting:offerID:completion:", v18, v6, v17, v9);

    }
    else
    {
      v9[2](v9);
    }
  }

}

void __80__ICQDaemonOfferManager__postFollowupForDaemonOffer_replaceExisting_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "error %{public}@ posting followup", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", objc_msgSend(*(id *)(a1 + 32), "requestType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "posted followup for offer type: %@", (uint8_t *)&v8, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_postUserNotification:(id)a3 replaceExisting:(BOOL)a4 offerID:(id)a5 completion:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[5];

  v36 = a4;
  v48[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38 = a5;
  v37 = a6;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lockTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lockSubTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lockMessage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("default"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("default"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("default"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v15 || !v17)
    goto LABEL_18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("actParams"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = 0x1E0C99000uLL;
  v35 = (void *)v19;
  if (!v19)
  {
    v34 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("action"));
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_9;
  v22 = (void *)v21;
  v47[0] = CFSTR("actParams");
  v47[1] = CFSTR("action");
  v48[0] = v35;
  v48[1] = v21;
  v47[2] = CFSTR("display");
  v48[2] = &stru_1E8B3C468;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQLinkForServerMessageParameter(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_9:
    v34 = 0;
LABEL_10:
    v20 = 0x1E0C99000;
LABEL_12:
    objc_msgSend(*(id *)(v20 + 3736), "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v34 = v24;
  objc_msgSend(v24, "parameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("openURL"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26), (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v34, "action") == 105)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/STORAGE_UPGRADE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0C99000uLL;
      if (v28)
        goto LABEL_13;
      goto LABEL_12;
    }

    goto LABEL_10;
  }
  v28 = (void *)v27;

LABEL_13:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notificationId"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = CFSTR("OOBE_EXPIRED");
  if (v29)
    v31 = (__CFString *)v29;
  v32 = v31;

  _ICQGetLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v42 = v15;
    v43 = 2112;
    v44 = v18;
    v45 = 2112;
    v46 = v28;
    _os_log_impl(&dword_1CDEBD000, v33, OS_LOG_TYPE_DEFAULT, "posting user notification, title:%@, message:%@, url:%@", buf, 0x20u);
  }

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke;
  v39[3] = &unk_1E8B39550;
  v40 = v37;
  +[ICQUserNotifications postUserNotificationWithIdentifier:title:subTitle:bodyText:url:replaceExisting:offerID:completion:](ICQUserNotifications, "postUserNotificationWithIdentifier:title:subTitle:bodyText:url:replaceExisting:offerID:completion:", v32, v15, v16, v18, v28, v36, v38, v39);

LABEL_18:
}

void __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)postOfferType:(id)a3
{
  -[ICQDaemonOfferManager _postOfferType:isForBuddy:](self, "_postOfferType:isForBuddy:", a3, 0);
}

- (void)postBuddyOfferType:(id)a3
{
  -[ICQDaemonOfferManager _postOfferType:isForBuddy:](self, "_postOfferType:isForBuddy:", a3, 1);
}

- (void)_postOfferType:(id)a3 isForBuddy:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  dispatch_semaphore_t v17;
  _QWORD aBlock[4];
  id v19;
  BOOL v20;

  v4 = a4;
  v6 = a3;
  -[ICQDaemonOfferManager accountManager](self, "accountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke;
  aBlock[3] = &unk_1E8B39578;
  v11 = v6;
  v19 = v11;
  v20 = v4;
  v12 = _Block_copy(aBlock);
  if (!v4)
    +[ICQDaemonPersisted clearPersistedObject](ICQDaemonOfferStubs, "clearPersistedObject");
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke_2;
  v15[3] = &unk_1E8B38C50;
  v16 = v8;
  v17 = dispatch_semaphore_create(0);
  v13 = v17;
  v14 = v8;
  -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:", v9, v4, CFSTR("icqctl"), v12, v15);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

}

id __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = _ICQOfferTypeForString(v3);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v4, "chooseBuddyStubForOfferType:", v5);
  else
    objc_msgSend(v4, "chooseStubForOfferType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

intptr_t __51__ICQDaemonOfferManager__postOfferType_isForBuddy___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)forcePostFollowup
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  dispatch_semaphore_t v11;

  -[ICQDaemonOfferManager accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICQDaemonOfferManager_forcePostFollowup__block_invoke;
  v9[3] = &unk_1E8B38C50;
  v10 = v4;
  v11 = v6;
  v7 = v6;
  v8 = v4;
  -[ICQDaemonOfferManager _reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:](self, "_reconsiderOffersForAccount:isForBuddy:quotaReason:choiceHandler:completion:", v5, 0, CFSTR("icqctl"), 0, v9);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __42__ICQDaemonOfferManager_forcePostFollowup__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)teardownCachedOffer
{
  -[ICQDaemonOfferManager _teardownCachedOfferAndNotify:](self, "_teardownCachedOfferAndNotify:", 1);
}

- (void)tearDownCachedPremiumOffer
{
  -[ICQDaemonOfferManager _teardownCachedPremiumOfferAndNotify:](self, "_teardownCachedPremiumOfferAndNotify:", 1);
}

- (void)tearDownCachedEventOffer
{
  -[ICQDaemonOfferManager _teardownCachedEventOfferAndNotify:](self, "_teardownCachedEventOfferAndNotify:", 1);
}

- (void)teardownCachedOffers
{
  -[ICQDaemonOfferManager _teardownCachedOffersAndNotify:](self, "_teardownCachedOffersAndNotify:", 1);
}

- (void)setShouldDirectToStorageManagement:(BOOL)a3
{
  int v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[ICQDaemonOfferManager shouldDirectToStorageManagement](self, "shouldDirectToStorageManagement");
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == v3)
  {
    if (v6)
    {
      v8 = 136315138;
      v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "%s: value didn't change. Exiting early.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v3)
    {
      if (v6)
      {
        v8 = 136315138;
        v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "%s: setting cached value to true.", (uint8_t *)&v8, 0xCu);
      }

      v7 = (const void *)*MEMORY[0x1E0C9AE50];
    }
    else
    {
      if (v6)
      {
        v8 = 136315138;
        v9 = "-[ICQDaemonOfferManager setShouldDirectToStorageManagement:]";
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "%s: removing cached value.", (uint8_t *)&v8, 0xCu);
      }

      v7 = 0;
    }
    CFPreferencesSetAppValue(CFSTR("_ICQShouldDirectToStorageManagement"), v7, CFSTR("com.apple.cloud.quota"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.cloud.quota"));
  }
}

- (BOOL)isSimulatedDeviceStorageAlmostFull
{
  BOOL v2;
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("_ICQSimulatedDeviceStorageAlmostFull"), CFSTR("com.apple.cloud.quota"), &keyExistsAndHasValidFormat))
  {
    v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v2 = 1;
  }
  v3 = !v2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v9 = "-[ICQDaemonOfferManager isSimulatedDeviceStorageAlmostFull]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "%s: returning value %{public}@.", buf, 0x16u);
  }

  return v3;
}

- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 136315138;
      v8 = "-[ICQDaemonOfferManager setSimulatedDeviceStorageAlmostFull:]";
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "%s: setting cached value to true.", (uint8_t *)&v7, 0xCu);
    }

    v6 = (const void *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    if (v5)
    {
      v7 = 136315138;
      v8 = "-[ICQDaemonOfferManager setSimulatedDeviceStorageAlmostFull:]";
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "%s: removing cached value.", (uint8_t *)&v7, 0xCu);
    }

    v6 = 0;
  }
  CFPreferencesSetAppValue(CFSTR("_ICQSimulatedDeviceStorageAlmostFull"), v6, CFSTR("com.apple.cloud.quota"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.cloud.quota"));
}

- (BOOL)isBuddyOfferEnabled
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("_ICQBuddyOfferEnable"), CFSTR("com.apple.cloud.quota"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (void)setBuddyOfferEnabled:(BOOL)a3
{
  const void *v3;

  if (a3)
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  CFPreferencesSetAppValue(CFSTR("_ICQBuddyOfferEnable"), v3, CFSTR("com.apple.cloud.quota"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.cloud.quota"));
}

- (NSNumber)simulatedPhotosLibrarySize
{
  void *v2;
  uint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("_ICQSimulatedPhotosLibrarySize"), CFSTR("com.apple.cloud.quota"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return (NSNumber *)v2;
}

- (void)setSimulatedPhotosLibrarySize:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = 0;
  CFPreferencesSetAppValue(CFSTR("_ICQSimulatedPhotosLibrarySize"), v3, CFSTR("com.apple.cloud.quota"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.cloud.quota"));
}

- (BOOL)isLegacyDeviceStorageLevelNotificationEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("_ICQLegacyDeviceStorageLevelNotification"), CFSTR("com.apple.cloud.quota"), 0) != 0;
}

- (void)setLegacyDeviceStorageLevelNotificationEnabled:(BOOL)a3
{
  const void *v3;

  if (a3)
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  CFPreferencesSetAppValue(CFSTR("_ICQLegacyDeviceStorageLevelNotification"), v3, CFSTR("com.apple.cloud.quota"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.cloud.quota"));
}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "[SUBD] Previously delayed offer is ready to be presented.", v9, 2u);
  }

  -[ICQDaemonOfferManager _subdDisplayDelayedOfferWithContext:completion:](self, "_subdDisplayDelayedOfferWithContext:completion:", v7, v6);
}

- (void)setTaskLimiters:(id)a3
{
  objc_storeStrong((id *)&self->_taskLimiters, a3);
}

- (NSURLSession)sharedURLSession
{
  return self->_sharedURLSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_taskLimiters, 0);
  objc_storeStrong((id *)&self->_throttleController, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_sharedURLSession, 0);
}

- (void)_subdStopFailsafeActivity
{
  NSObject *v2;
  uint8_t v3[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "[SUBD] Cancelling the failsafe activity.", v3, 2u);
  }

  +[ICQDelayedOfferFailsafeActivityController stopActivityWithCompletion:](ICQDelayedOfferFailsafeActivityController, "stopActivityWithCompletion:", &__block_literal_global_456);
}

void __85__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdStopFailsafeActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully cancelled failsafe activity. error=[%@]", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_subdRefreshOfferDetailsAndDisplay:(id)a3 completion:(id)a4 account:(id)a5 accountStore:(id)a6 notificationID:(id)a7 isoNewOfferResponse:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  _ICQGetLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v18;
    _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "refreshing offer details for notificationID %@", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke;
  v25[3] = &unk_1E8B395E8;
  v25[4] = self;
  v26 = v14;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  v21 = v15;
  v22 = v16;
  v23 = v17;
  v24 = v14;
  -[ICQDaemonOfferManager _subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:](self, "_subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:", v22, 0, v18, v19, v25);

}

void __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "fetch error %@", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_457;
    v15[3] = &unk_1E8B38F58;
    v15[4] = v14;
    v11 = &v16;
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v14, "clearAllFollowupsWithCompletion:", v15);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "offerId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_clearCachedStubsIfOfferIDIsNew:", v9);

    v10 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_2;
    v17[3] = &unk_1E8B395C0;
    v17[4] = v10;
    v11 = &v18;
    v12 = v5;
    v18 = v12;
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v10, "_postFollowupForDaemonOffer:replaceExisting:completion:", v12, 1, v17);

  }
}

uint64_t __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("debugAlert"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_addSampleAlert");
  v3 = +[ICQDaemonAlert shouldShowForDaemonOffer:](ICQDaemonAlert, "shouldShowForDaemonOffer:", *(_QWORD *)(a1 + 40));
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "showing alert", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_showDaemonAlertForOffer:notificationDictionary:store:account:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "skipping alert", v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

uint64_t __162__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdRefreshOfferDetailsAndDisplay_completion_account_accountStore_notificationID_isoNewOfferResponse___block_invoke_457(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_subdFetchDaemonOfferForAccount:(id)a3 stub:(id)a4 notificationID:(id)a5 isoNewOfferResponse:(id)a6 completion:(id)a7
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  ICQDaemonOfferManager *v36;
  id v37;
  id v38;
  id v39;
  os_signpost_id_t v40;
  uint64_t v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = a7;
  if (!(v13 | v14))
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "WARNING: both stub and notificationID are nil -- attempting blind refresh", buf, 2u);
    }

  }
  _ICQSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v20 = _ICQSignpostCreateWithObject(v18, v19);
  v22 = v21;

  _ICQSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "RefreshOfferDetails", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[ICQDaemonOfferManager _coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:].cold.1();

  if (v15 && (objc_msgSend(v15, "error"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v26))
  {
    objc_msgSend(v15, "toContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_impl(&dword_1CDEBD000, v33, OS_LOG_TYPE_DEFAULT, "[SUBD] RefreshOfferDetails request will contain extra fields=[%@].", buf, 0xCu);
    }

    if (objc_msgSend(v15, "shouldDisplayOfferNow"))
      -[ICQDaemonOfferManager _subdStopFailsafeActivity](self, "_subdStopFailsafeActivity");
  }
  else
  {
    _ICQGetLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v15;
      _os_log_impl(&dword_1CDEBD000, v27, OS_LOG_TYPE_DEFAULT, "[SUBD] Not passing extra RefreshOfferDetails arguments. isoNewOfferResponse=[%@]", buf, 0xCu);
    }

    v28 = 0;
  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke;
  v34[3] = &unk_1E8B39230;
  v35 = (id)v13;
  v36 = self;
  v37 = v12;
  v38 = (id)v14;
  v40 = v20;
  v41 = v22;
  v39 = v16;
  v29 = v16;
  v30 = (id)v14;
  v31 = v12;
  v32 = (id)v13;
  -[ICQDaemonOfferManager _fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:](self, "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", v31, CFSTR("quotaRefreshOfferDetailsURL"), CFSTR("RefreshOfferDetails"), v32, v30, 0, v28, v34);

}

void __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICQDaemonOfferStub *v7;
  ICQDaemonOfferStub *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  objc_class *v19;
  void *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  const __CFString *v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (ICQDaemonOfferStub *)*(id *)(a1 + 32);
  v8 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v5);
  if (v5)
    v9 = v5;
  else
    v9 = (id)MEMORY[0x1E0C9AA70];
  +[ICQMLBiomePublisher publishEventWithRefreshOfferDetailsResponse:](ICQMLBiomePublisher, "publishEventWithRefreshOfferDetailsResponse:", v9);
  if (v7)
  {
    if (v5)
    {
      -[ICQDaemonOfferStub offerId](v7, "offerId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQDaemonOfferStub offerId](v8, "offerId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        _ICQGetLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(v8, v7);

      }
      if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer")
        && !-[ICQDaemonOfferStub isBuddyOffer](v8, "isBuddyOffer"))
      {
        _ICQGetLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "missing buddyOffer flag after refresh offer details", buf, 2u);
        }

      }
    }
  }
  else
  {
    v7 = v8;
  }
  -[ICQDaemonOfferStub conditionsWhenChosen](v7, "conditionsWhenChosen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[ICQDaemonOfferStub conditionsWhenChosen](v7, "conditionsWhenChosen");
  else
    +[ICQDaemonOfferConditions currentConditions](ICQDaemonOfferConditions, "currentConditions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQDaemonOfferStub criteria](v8, "criteria");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSatisfiedByConditions:", v16);

  if ((v18 & 1) != 0)
  {
    if (v5)
    {
      v46 = v6;
      v19 = (objc_class *)objc_msgSend(*(id *)(a1 + 40), "_classForOfferStub:", v8);
      ICQLogOfferDetailsForServerDictionary(v5);
      objc_msgSend(*(id *)(a1 + 40), "_updateQuotaForAccount:withServerDictionary:", *(_QWORD *)(a1 + 48), v5);
      v20 = (void *)objc_msgSend([v19 alloc], "_initWithAccount:serverDictionary:", *(_QWORD *)(a1 + 48), v5);
      objc_msgSend(v20, "setNotificationID:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v20, "cacheLiftUIContent");
      objc_msgSend(v20, "persistObject");
      Nanoseconds = _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      _ICQSignpostLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = *(_QWORD *)(a1 + 72);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v19;
        _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v23, OS_SIGNPOST_INTERVAL_END, v24, "RefreshOfferDetails", "%@", buf, 0xCu);
      }

      _ICQSignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v48 = *(unsigned __int16 *)(a1 + 72);
        *(_WORD *)&v48[4] = 2048;
        *(double *)&v48[6] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&v48[14] = 2112;
        *(_QWORD *)&v48[16] = v19;
        _os_log_debug_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
      }

      _ICQGetLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "expirationDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v48 = v19;
        *(_WORD *)&v48[8] = 2112;
        *(_QWORD *)&v48[10] = v27;
        _os_log_impl(&dword_1CDEBD000, v26, OS_LOG_TYPE_DEFAULT, "Finished persisting %{public}@ offer; expires on %@",
          buf,
          0x16u);

      }
      v28 = *(_QWORD *)(a1 + 64);
      if (v28)
        (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v20, 0);

      v29 = v46;
      goto LABEL_58;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v30, OS_LOG_TYPE_DEFAULT, "Fetched offer is not valid in current conditions, invalidating both old and new offers", buf, 2u);
    }

    -[ICQDaemonOfferStub offerResetURL](v8, "offerResetURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "Updating server with invalid fetched offer status", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_fetchDictionaryForAccount:quotaKey:quotaReason:stub:notificationID:contextDictionary:mlDaemonExtraFields:completion:", *(_QWORD *)(a1 + 48), CFSTR("quotaOfferReset"), CFSTR("OfferReset"), v8, *(_QWORD *)(a1 + 56), 0, 0, &__block_literal_global_459);
    }
    else
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "No offerResetURL provided in fetched offer, unable to notify server", buf, 2u);
      }

    }
  }
  _ICQGetLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer"))
      v35 = CFSTR("buddy ");
    else
      v35 = &stru_1E8B3C468;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v48 = v6;
    *(_WORD *)&v48[8] = 2114;
    *(_QWORD *)&v48[10] = v35;
    _os_log_impl(&dword_1CDEBD000, v34, OS_LOG_TYPE_DEFAULT, "error %{public}@ occurred fetching %{public}@offer -- persisting placeholder", buf, 0x16u);
  }

  v36 = objc_msgSend(*(id *)(a1 + 40), "_classForOfferStub:", v7);
  v29 = v6;
  objc_msgSend(*(id *)(a1 + 40), "_placeholderOfferForAccount:requestType:error:", *(_QWORD *)(a1 + 48), -[ICQDaemonOfferStub requestType](v7, "requestType"), v6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistObject");
  v37 = _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  _ICQSignpostLogSystem();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v40 = *(_QWORD *)(a1 + 72);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v48 = v36;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v39, OS_SIGNPOST_INTERVAL_END, v40, "RefreshOfferDetails", "%@", buf, 0xCu);
  }

  _ICQSignpostLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v48 = *(unsigned __int16 *)(a1 + 72);
    *(_WORD *)&v48[4] = 2048;
    *(double *)&v48[6] = (double)v37 / 1000000000.0;
    *(_WORD *)&v48[14] = 2112;
    *(_QWORD *)&v48[16] = v36;
    _os_log_debug_impl(&dword_1CDEBD000, v41, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) RefreshOfferDetails %@", buf, 0x1Cu);
  }

  _ICQGetLogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if (-[ICQDaemonOfferStub isBuddyOffer](v7, "isBuddyOffer"))
      v43 = CFSTR("buddy ");
    else
      v43 = &stru_1E8B3C468;
    objc_msgSend(v5, "expirationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v48 = v43;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v44;
    _os_log_impl(&dword_1CDEBD000, v42, OS_LOG_TYPE_DEFAULT, "Finished persisting placeholder %{public}@ offer; expires on %@",
      buf,
      0x16u);

  }
  v45 = *(_QWORD *)(a1 + 64);
  if (v45)
    (*(void (**)(uint64_t, id, _QWORD))(v45 + 16))(v45, v5, 0);
LABEL_58:

}

void __143__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchDaemonOfferForAccount_stub_notificationID_isoNewOfferResponse_completion___block_invoke_458(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_249_cold_1();

  }
}

- (void)_subdFetchNewOfferResponseWithContent:(id)a3 andMaxDelaySecs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  double v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "shouldCallMlDaemon");
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8 && v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = objc_msgSend(v8, "intValue");
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Installing a the failsafe activity with maxDelaySecs=[%d].", buf, 8u);
    }

    objc_msgSend(v8, "doubleValue");
    v14 = (uint64_t)v13;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke;
    v15[3] = &unk_1E8B39658;
    v16 = v7;
    v17 = v9;
    +[ICQDelayedOfferFailsafeActivityController startActivityWithDelaySecs:completion:](ICQDelayedOfferFailsafeActivityController, "startActivityWithDelaySecs:completion:", v14, v15);

  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Skipping call to SubscriptionD and using the normal IND code flow. notificationContent=[%@] maxDelaySecs=[%@]", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_2();

  }
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = _ICQSignpostCreateWithObject(v5, v6);
  v9 = v8;

  _ICQSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "QuotaClientNewOffer", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_1();

  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "[SUBD] Calling SubscriptionD with content=[%@].", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DDBC28], "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_460;
  v17[3] = &unk_1E8B39630;
  v19 = v7;
  v20 = v9;
  v16 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v15, "newOffer:andCallback:", v16, v17);

}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_460(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  int v9;
  _BYTE v10[14];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v9 = 138412290;
    *(_QWORD *)v10 = v3;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "QuotaClientNewOffer", "[SUBD] Async call to SubscriptionD with response=[%@].", (uint8_t *)&v9, 0xCu);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 67109634;
    *(_DWORD *)v10 = *((unsigned __int16 *)a1 + 20);
    *(_WORD *)&v10[4] = 2048;
    *(double *)&v10[6] = (double)Nanoseconds / 1000000000.0;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) QuotaClientNewOffer [SUBD] Async call to SubscriptionD with response=[%@].", (uint8_t *)&v9, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_subdHandleFetchOffersStub:(id)a3 account:(id)a4 requestType:(int64_t)a5 group:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  NSObject *v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_group_enter(v12);
  objc_msgSend(MEMORY[0x1E0DDBC28], "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "parseNotification:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQMLProtocolParser parseMaxDelaySecsFromFetchOffersResponse:](ICQMLProtocolParser, "parseMaxDelaySecsFromFetchOffersResponse:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke;
  v21[3] = &unk_1E8B39680;
  v21[4] = self;
  v22 = v11;
  v23 = v10;
  v24 = v12;
  v18 = v12;
  v19 = v10;
  v20 = v11;
  -[ICQDaemonOfferManager _subdFetchNewOfferResponseWithContent:andMaxDelaySecs:completion:](self, "_subdFetchNewOfferResponseWithContent:andMaxDelaySecs:completion:", v15, v17, v21);

}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_2;
  v6[3] = &unk_1E8B39528;
  v6[4] = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:", v4, v5, 0, a2, v6);

}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logErrorsForFetchOfferResultWithOffer:error:isForBuddy:", v5, a3, 0);
  if (v5 && !objc_msgSend(v5, "isBuddyOffer"))
  {
    v6 = objc_msgSend(v5, "isDefaultOffer");
    v7 = *(void **)(a1 + 32);
    if (!v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_3;
      v8[3] = &unk_1E8B39500;
      v8[4] = v7;
      v9 = v5;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v7, "_postFollowupForDaemonOffer:replaceExisting:completion:", v9, 1, v8);

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_6:

}

void __124__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdHandleFetchOffersStub_account_requestType_group_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_subdDisplayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  ICQDaemonOfferStub *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DDBC28];
  v8 = a3;
  objc_msgSend(v7, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parseDelayedOfferFromJson:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "[SUBD] Parsed the delayed offer context=[%@].", buf, 0xCu);
  }

  if (v10)
  {
    objc_msgSend(v10, "serverDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "newOfferResponse");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("notificationId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
    }
    else
    {
      if (v12)
      {
        v16 = -[ICQDaemonOfferStub initWithServerDictionary:]([ICQDaemonOfferStub alloc], "initWithServerDictionary:", v12);
        v15 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v15 = 0;
    }
    v16 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  v15 = 0;
  v16 = 0;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "aa_primaryAppleAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke;
  v22[3] = &unk_1E8B38E38;
  v22[4] = self;
  v23 = v17;
  v24 = v18;
  v25 = v6;
  v19 = v6;
  v20 = v18;
  v21 = v17;
  -[ICQDaemonOfferManager _subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:](self, "_subdFetchDaemonOfferForAccount:stub:notificationID:isoNewOfferResponse:completion:", v20, v16, v15, v13, v22);

}

void __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  id *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Fetch offer error [%@] for a delayed offer notification.", buf, 0xCu);
    }

    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_462;
    v14[3] = &unk_1E8B396D0;
    v14[4] = v13;
    v9 = &v16;
    v16 = *(id *)(a1 + 56);
    v11 = &v15;
    v15 = v7;
    objc_msgSend(v13, "clearAllFollowupsWithCompletion:", v14);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_2;
    v17[3] = &unk_1E8B396A8;
    v17[4] = v8;
    v9 = &v18;
    v10 = v5;
    v18 = v10;
    v11 = &v19;
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v8, "_postFollowupForDaemonOffer:replaceExisting:completion:", v10, 1, v17);

  }
}

void __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", objc_msgSend(*(id *)(a1 + 40), "requestType"));
  v2 = +[ICQDaemonAlert shouldShowForDaemonOffer:](ICQDaemonAlert, "shouldShowForDaemonOffer:", *(_QWORD *)(a1 + 40));
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Showing the alert triggered by a delayed offer notification.", buf, 2u);
    }

    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_461;
    v9[3] = &unk_1E8B38F08;
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v5, "_showDaemonAlertForOffer:notificationDictionary:store:account:completion:", v6, 0, v7, v8, v9);

  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Skipping alert from a delayed offer notification.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_461(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __107__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdDisplayDelayedOfferWithContext_completion___block_invoke_462(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_subdTearDown
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DDBC28], "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearNotificationState:", &__block_literal_global_463);

}

void __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Successfully cleaned up the Subscription Daemon state.", v5, 2u);
  }

}

void __60__ICQDaemonOfferManager_clearFollowupsOfferType_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", *(_QWORD *)(a2 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1CDEBD000, v3, v4, "Failed to clear followup with error %{public}@, offerType: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) FetchOffers ", v2);
  OUTLINED_FUNCTION_0_0();
}

- (void)_coalescedDaemonOfferStubsDictionaryForAccount:requestType:quotaReason:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: FetchOffers  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __107__ICQDaemonOfferManager__coalescedDaemonOfferStubsDictionaryForAccount_requestType_quotaReason_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) FetchOffers ", v2);
  OUTLINED_FUNCTION_0_0();
}

- (void)_daemonLocalOfferStubsDictionaryForAccount:(uint64_t)a3 requestType:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Invalid cache while reconsidering offers locally", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_processPushNotificationCheckHardwareIDWithDictionary:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST EVENT [id: %hu] PushNotification  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_clearCachedStubsIfOfferIDIsNew:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "Found a matching cached offer. Skipping cache clear for fetchOffers on alert push.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_clearCachedStubsIfOfferIDIsNew:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1CDEBD000, v0, OS_LOG_TYPE_DEBUG, "Offer ID %@ is a new offer! Clearing fetchOffers cache.", v1, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

- (void)_coalescedFetchDaemonOfferForAccount:stub:notificationID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RefreshOfferDetails  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_cold_1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "offerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "offerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1CDEBD000, v5, v6, "Fetched offerId (%@) does not match requested offerId (%@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

void __93__ICQDaemonOfferManager__coalescedFetchDaemonOfferForAccount_stub_notificationID_completion___block_invoke_249_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Updated server with offer reset failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 134218242;
  v2 = 0;
  v3 = 2080;
  v4 = "-[ICQDaemonOfferManager _postDaemonOfferChangedDueToPushDarwinNotificationRequestType:]";
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "Invalid type %ld passed to %s. Must post darwin notifications for individual offer types.", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

- (void)_postDaemonOfferChangedDueToPushDarwinNotificationRequestType:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, v1, (uint64_t)v1, "SIGNPOST EVENT [id: %hu] DarwinNotification  enableTelemetry=YES %@", v2);
  OUTLINED_FUNCTION_0_0();
}

- (void)_teardownCachedOffersAndNotify:(NSObject *)a3 .cold.1(unsigned __int16 a1, char a2, NSObject *a3)
{
  const __CFString *v3;
  _DWORD v4[2];
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = &stru_1E8B3C468;
  if ((a2 & 1) != 0)
    v3 = CFSTR("and notify");
  v4[0] = 67109378;
  v4[1] = a1;
  v5 = 2112;
  v6 = v3;
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, a3, (uint64_t)a3, "SIGNPOST EVENT [id: %hu] TeardownAllOffers  enableTelemetry=YES %@", (uint8_t *)v4);
  OUTLINED_FUNCTION_0_0();
}

void __66__ICQDaemonOfferManager_getCkBackupDeviceIDWithCompletionHandler___block_invoke_268_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Error fetching CloudKit backup container device id: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)_coalescedReconsiderOffersForAccount:(NSObject *)a3 isForBuddy:quotaReason:options:choiceHandler:completion:.cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  int v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v4;
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, a3, v6, "SIGNPOST BEGIN [id: %hu]: ReconsiderOffers  enableTelemetry=YES %@", (uint8_t *)v7);

  OUTLINED_FUNCTION_6();
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) ReconsiderOffers ", v2);
  OUTLINED_FUNCTION_0_0();
}

void __118__ICQDaemonOfferManager__coalescedReconsiderOffersForAccount_isForBuddy_quotaReason_options_choiceHandler_completion___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Default offer is missing from fetchOffers response! Something went wrong", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __82__ICQDaemonOfferManager__postUserNotification_replaceExisting_offerID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "failed to post user notificaiton: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: QuotaClientNewOffer  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __125__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdFetchNewOfferResponseWithContent_andMaxDelaySecs_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "[SUBD] Failed to setup the failsafe activity. error=[%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __73__ICQDaemonOfferManager_iCloudSubscriptionOptimizerDaemon___subdTearDown__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to clean up the Subscription Daemon state with error=[%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
