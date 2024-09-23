@implementation ICQDaemonOfferRequestBuilder

- (ICQDaemonOfferRequestBuilder)initWithAccount:(id)a3 accountManager:(id)a4
{
  id v7;
  id v8;
  ICQDaemonOfferRequestBuilder *v9;
  ICQDaemonOfferRequestBuilder *v10;
  ICQRequestProvider *v11;
  ICQRequestProvider *requestProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQDaemonOfferRequestBuilder;
  v9 = -[ICQDaemonOfferRequestBuilder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    v11 = -[ICQRequestProvider initWithAccount:]([ICQRequestProvider alloc], "initWithAccount:", v7);
    requestProvider = v10->_requestProvider;
    v10->_requestProvider = v11;

    objc_storeStrong((id *)&v10->_accountManager, a4);
  }

  return v10;
}

- (id)requestWithQuotaKey:(id)a3 reason:(id)a4 offerStub:(id)a5 notificationID:(id)a6 contextDictionary:(id)a7 mlDaemonExtraFields:(id)a8 sourceIsServerSample:(BOOL)a9
{
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  ICQRequestProvider *requestProvider;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  ICQRequestProvider *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  _BOOL4 v77;
  __CFString *v78;
  ACAccount *account;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  id v90;
  __CFString *v91;
  void *v92;
  id v93;
  int v94;
  void *v95;
  void *v96;
  _QWORD v97[3];
  _QWORD v98[3];
  uint8_t buf[4];
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v15 = (__CFString *)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (__CFString *)objc_msgSend(a3, "copy");
  v21 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("buddy:quotaFetchOffersURL"));
  if (v21)
  {
    v22 = CFSTR("quotaFetchOffersURL");

    v20 = v22;
  }
  -[ICQRequestProvider urlForQuotaKey:offerStub:notificationID:](self->_requestProvider, "urlForQuotaKey:offerStub:notificationID:", v20, v16, v17);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
  {
    v95 = (void *)v23;
    v96 = v19;
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", v23, 1, 30.0);
    v25 = objc_claimAutoreleasedReturnValue();
    requestProvider = self->_requestProvider;
    objc_msgSend(v16, "offerId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(requestProvider) = -[ICQRequestProvider willUseNewKey:offerID:notificationID:](requestProvider, "willUseNewKey:offerID:notificationID:", v20, v27, v17);

    v94 = v21;
    if (!(_DWORD)requestProvider)
    {
      v97[0] = CFSTR("event");
      v97[1] = CFSTR("ck_hw_id");
      v98[0] = CFSTR("quota_alert");
      v98[1] = CFSTR("ALL");
      v97[2] = CFSTR("dsid");
      -[ACAccount aa_personID](self->_account, "aa_personID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v42, "mutableCopy");

      objc_msgSend(v43, "setObject:forKeyedSubscript:", v15, CFSTR("reason"));
      if (v16)
      {
        +[ICQRequestProvider addEntriesToPostDictionary:forStub:](ICQRequestProvider, "addEntriesToPostDictionary:forStub:", v43, v16);
        v44 = v96;
      }
      else
      {
        v44 = v96;
        if (-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("quotaFetchOffersURL")))
        {
          if (a9)
          {
            -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-All-Device-Offers"));
            -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("t"), CFSTR("X-Apple-InvoiceEvent-Simulate"));
            -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("AlmostFull"), CFSTR("X-Apple-QuotaEvent-Simulate"));
          }
          else
          {
            +[ICQRequestProvider addEntriesToPostDictionary:forStub:](ICQRequestProvider, "addEntriesToPostDictionary:forStub:", v43, 0);
          }
          if (objc_msgSend(MEMORY[0x1E0CFDA50], "deviceOffersContainType:", 2))
            -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Storage-Has-SubscriptionOffer"));
        }
      }
      if (_isWAPIDevice_onceToken != -1)
        dispatch_once(&_isWAPIDevice_onceToken, &__block_literal_global_0);
      if (_isWAPIDevice_sIsWAPIDevice)
        objc_msgSend(v43, "setObject:forKey:", CFSTR("true"), CFSTR("useWlanTerm"));
      if (v17)
        objc_msgSend(v43, "setObject:forKey:", v17, CFSTR("notificationId"));
      if (v18)
        objc_msgSend(v43, "setObject:forKey:", v18, CFSTR("contextDictionary"));
      if (v44)
      {
        _ICQGetLogSystem();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v96;
          _os_log_impl(&dword_1CDEBD000, v74, OS_LOG_TYPE_DEFAULT, "[SUBD] Setting extra request fields [%@].", buf, 0xCu);
        }

        objc_msgSend(v43, "addEntriesFromDictionary:", v96);
      }
      v75 = (void *)objc_msgSend(v43, "copy");
      _ICQGetLogSystem();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v75;
        _os_log_impl(&dword_1CDEBD000, v76, OS_LOG_TYPE_DEFAULT, "fetchOffer(s) with postDict %@", buf, 0xCu);
      }

      v77 = +[ICQRequestProvider attemptSetRequest:toPostWithJSONDict:](ICQRequestProvider, "attemptSetRequest:toPostWithJSONDict:", v25, v75);
      if (!v77)
      {
        v40 = 0;
LABEL_76:
        v19 = v96;

        v24 = v95;
        goto LABEL_77;
      }
      v93 = v18;
LABEL_67:
      v78 = v15;
      -[ICQDaemonOfferRequestBuilder addPremiumOffersHeaderIfNeededForRequest:](self, "addPremiumOffersHeaderIfNeededForRequest:", v25);
      if (v94)
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Storage-Include-BuddyOffer"));
      account = self->_account;
      -[_ICQAccountManager accountStore](self->_accountManager, "accountStore");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = +[_ICQHelperFunctions isBackupEnabledForAccount:accountStore:](_ICQHelperFunctions, "isBackupEnabledForAccount:accountStore:", account, v80);

      if (v81)
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Storage-Include-BackupOffer"));
      -[ICQRequestProvider addCommonHeadersToRequest:](self->_requestProvider, "addCommonHeadersToRequest:", v25);
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "ams_activeiTunesAccount");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v83;
      if (v83)
      {
        objc_msgSend(v83, "ams_DSID");
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          objc_msgSend(v84, "ams_DSID");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "stringValue");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", v87, CFSTR("X-Apple-Itunes-DSID"));

        }
      }
      v40 = -[NSObject copy](v25, "copy");

      v15 = v78;
      v18 = v93;
      goto LABEL_76;
    }
    v90 = v17;
    v93 = v18;
    objc_msgSend(v16, "conditionsWhenChosen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v16, "conditionsWhenChosen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isPhotosCloudEnabled");

      objc_msgSend(v16, "conditionsWhenChosen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isPhotosOptimizeEnabled");

    }
    else
    {
      v30 = +[ICQDaemonOfferConditions isPhotosCloudEnabled](ICQDaemonOfferConditions, "isPhotosCloudEnabled");
      v32 = +[ICQDaemonOfferConditions isPhotosOptimizeEnabled](ICQDaemonOfferConditions, "isPhotosOptimizeEnabled");
    }
    if (v30)
      v45 = CFSTR("true");
    else
      v45 = CFSTR("false");
    v46 = v45;
    if (v32)
      v47 = CFSTR("true");
    else
      v47 = CFSTR("false");
    v48 = v47;
    v91 = v48;
    if (v20 == CFSTR("quotaFetchOffersURL"))
    {
      v49 = v48;
      v50 = (void *)objc_opt_new();
      v43 = v50;
      if (v15)
        v51 = v15;
      else
        v51 = &stru_1E8B3C468;
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, CFSTR("reason"));
      objc_msgSend(v43, "setObject:forKey:", v46, CFSTR("iCPLEnabled"));
      objc_msgSend(v43, "setObject:forKey:", v49, CFSTR("optimizeEnabled"));
      +[ICQAppLaunchLinkTracker shared](ICQAppLaunchLinkTracker, "shared");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "allDaysSinceLastShown");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
        objc_msgSend(v43, "setObject:forKey:", v53, CFSTR("appLaunch"));
      if (a9)
      {
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-All-Device-Offers"));
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("t"), CFSTR("X-Apple-InvoiceEvent-Simulate"));
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("AlmostFull"), CFSTR("X-Apple-QuotaEvent-Simulate"));
      }
      if (objc_msgSend(MEMORY[0x1E0CFDA50], "deviceOffersContainType:", 2))
        -[NSObject setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Storage-Has-SubscriptionOffer"));

      if (!v43)
        goto LABEL_47;
    }
    else
    {
      if (v20 != CFSTR("quotaRefreshOfferDetailsURL"))
      {
        v43 = 0;
LABEL_47:
        v71 = self->_requestProvider;
        objc_msgSend(v16, "offerId");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQRequestProvider httpMethodForKey:offerID:notificationID:](v71, "httpMethodForKey:offerID:notificationID:", v20, v72, v17);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setHTTPMethod:](v25, "setHTTPMethod:", v73);

        goto LABEL_67;
      }
      v54 = (void *)MEMORY[0x1E0CB3998];
      -[NSObject URL](v25, "URL");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsWithURL:resolvingAgainstBaseURL:", v55, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("photos-icp"), v46);
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("photos-optimize"), v91);
      v92 = (void *)v57;
      v101 = v57;
      v102 = objc_claimAutoreleasedReturnValue();
      v89 = (void *)v102;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setQueryItems:", v58);

      v59 = (void *)MEMORY[0x1E0CB37A8];
      objc_msgSend(v56, "URL");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "requestWithURL:cachePolicy:timeoutInterval:", v60, 1, 30.0);
      v61 = objc_claimAutoreleasedReturnValue();

      v25 = v61;
      -[NSObject setValue:forHTTPHeaderField:](v61, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      v17 = v90;
      if (v96 && objc_msgSend(v96, "count"))
      {
        _ICQGetLogSystem();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v96;
          _os_log_impl(&dword_1CDEBD000, v62, OS_LOG_TYPE_DEFAULT, "[SUBD] Setting extra request fields [%@].", buf, 0xCu);
        }

        v43 = (void *)objc_msgSend(v96, "mutableCopy");
      }
      else
      {
        v43 = 0;
      }

      if (!v43)
        goto LABEL_47;
    }
    if (!+[ICQRequestProvider attemptSetRequest:toPostWithJSONDict:](ICQRequestProvider, "attemptSetRequest:toPostWithJSONDict:", v25, v43))
    {
      _ICQGetLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[ICQDaemonOfferRequestBuilder requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:].cold.2(v63, v64, v65, v66, v67, v68, v69, v70);

      v25 = 0;
    }
    goto LABEL_47;
  }
  _ICQGetLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ICQDaemonOfferRequestBuilder requestWithQuotaKey:reason:offerStub:notificationID:contextDictionary:mlDaemonExtraFields:sourceIsServerSample:].cold.1(v25, v33, v34, v35, v36, v37, v38, v39);
  v40 = 0;
LABEL_77:

  return v40;
}

- (void)renewAuthHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6;
  ACAccount *account;
  _ICQAccountManager *accountManager;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  account = self->_account;
  accountManager = self->_accountManager;
  v9 = a3;
  -[_ICQAccountManager accountStore](accountManager, "accountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke;
  v12[3] = &unk_1E8B382C0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "icq_renewAuthorizationHeadersForAccount:store:completion:", account, v10, v12);

}

uint64_t __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke_cold_1(a2, v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v8[2] = __73__ICQDaemonOfferRequestBuilder_addPremiumOffersHeaderIfNeededForRequest___block_invoke;
  v8[3] = &unk_1E8B382E8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __73__ICQDaemonOfferRequestBuilder_addPremiumOffersHeaderIfNeededForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_requestProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)requestWithQuotaKey:(uint64_t)a3 reason:(uint64_t)a4 offerStub:(uint64_t)a5 notificationID:(uint64_t)a6 contextDictionary:(uint64_t)a7 mlDaemonExtraFields:(uint64_t)a8 sourceIsServerSample:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "No url found. Failed to generate a urlRequest.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)requestWithQuotaKey:(uint64_t)a3 reason:(uint64_t)a4 offerStub:(uint64_t)a5 notificationID:(uint64_t)a6 contextDictionary:(uint64_t)a7 mlDaemonExtraFields:(uint64_t)a8 sourceIsServerSample:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Could not set dictionary on request object.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __70__ICQDaemonOfferRequestBuilder_renewAuthHeadersForRequest_completion___block_invoke_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "ICQDaemonOfferRequestBuilder renewAuthHeadersForRequest validation completed with success: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end
