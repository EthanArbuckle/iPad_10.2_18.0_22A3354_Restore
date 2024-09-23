@implementation ICQRequestProvider

- (ICQRequestProvider)initWithAccount:(id)a3
{
  id v5;
  ICQRequestProvider *v6;
  ICQRequestProvider *v7;

  v5 = a3;
  v6 = -[ICQRequestProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)urlForQuotaKey:(id)a3 offerStub:(id)a4 notificationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("quotaOfferReset")))
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "offerResetURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "Missing offer reset URL for reset call", v17, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v10, "offerId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQRequestProvider _urlForQuotaKey:offerID:notificationID:](self, "_urlForQuotaKey:offerID:notificationID:", v8, v15, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)urlForUpdateOfferWithContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "offerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRequestProvider _urlForQuotaKey:offerID:notificationID:](self, "_urlForQuotaKey:offerID:notificationID:", CFSTR("quotaUpdateOfferURL"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_urlForQuotaKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  ACAccount *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  ACAccount *account;
  int v24;
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  ACAccount *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (ACAccount *)a5;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Creating URL for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
  }

  -[ICQRequestProvider _bagURLForKey:withOfferID:withNotificationID:](self, "_bagURLForKey:withOfferID:withNotificationID:", v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412802;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Failed to create URL string for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
    }
    goto LABEL_14;
  }
  v13 = v12;
  if (+[ICQRequestProvider _keyIsEligibleForURLStringReplacement:](ICQRequestProvider, "_keyIsEligibleForURLStringReplacement:", v8))
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "Replacing words in URL string.", (uint8_t *)&v24, 2u);
    }

    +[ICQRequestProvider _urlReplacementDictionaryForKey:withOfferID:withNotificationID:](ICQRequestProvider, "_urlReplacementDictionaryForKey:withOfferID:withNotificationID:", v8, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = v16;
  }
  if (-[NSObject containsString:](v13, "containsString:", CFSTR("{offerId}")))
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412802;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create URL string for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\". Missing offerID!", (uint8_t *)&v24, 0x20u);
    }

LABEL_14:
    v18 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      v24 = 138412802;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "Created URL for quota key \"%@\" with offerID \"%@\" with notificationID \"%@\".", (uint8_t *)&v24, 0x20u);
    }

    v21 = v18;
  }
  else
  {
    if (v20)
    {
      account = self->_account;
      v24 = 138412802;
      v25 = v13;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = account;
      _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "invalid URL string %@ for quota key %@ account %@", (uint8_t *)&v24, 0x20u);
    }

  }
LABEL_23:

  return v18;
}

- (void)addBasicHeadersToRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  objc_msgSend(v13, "ak_addClientInfoHeader");
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abbreviation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v5, CFSTR("X-MMe-Timezone"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v7, CFSTR("Accept-Language"));
  objc_msgSend(v13, "ak_addCountryHeader");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_numberingSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-Locale-Numbering-System"));

  +[_ICQHelperFunctions standardDateFormat:](_ICQHelperFunctions, "standardDateFormat:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-Locale-Date-Format-Long"));

  +[_ICQHelperFunctions standardDateFormat:](_ICQHelperFunctions, "standardDateFormat:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v11, CFSTR("X-Apple-Locale-Date-Format-Short"));

  v12 = (void *)MGCopyAnswer();
  if (v12)
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Mme-Device-Id"));

}

- (void)addBasicAndCloudBackupHeadersToRequest:(id)a3
{
  id v4;
  uint64_t (*v5)(void);
  void *v6;
  void *v7;
  _Unwind_Exception *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[ICQRequestProvider addBasicHeadersToRequest:](self, "addBasicHeadersToRequest:", v4);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v13 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v9[3] = &unk_1E8B384E8;
    v9[4] = &v10;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)v9);
    v5 = (uint64_t (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    v8 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled].cold.1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  if ((v5() & 1) == 0)
  {
    +[ICQDaemonOfferManager ckBackupDeviceID](ICQDaemonOfferManager, "ckBackupDeviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-Cloud-Bkp-Id"));

    -[ICQRequestProvider _stringTimeOfLastBackup](self, "_stringTimeOfLastBackup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-Cloud-Bkp-Time"));

  }
}

- (void)addCommonHeadersToRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICQRequestProvider addBasicAndCloudBackupHeadersToRequest:](self, "addBasicAndCloudBackupHeadersToRequest:", v5);
  -[ICQRequestProvider getBackupDeviceUUID](self, "getBackupDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Client-Backup-UUID"));

  objc_msgSend(v5, "ak_addAnisetteHeaders");
}

- (id)getBackupDeviceUUID
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke;
  block[3] = &unk_1E8B38A58;
  block[4] = self;
  if (getBackupDeviceUUID_onceToken != -1)
    dispatch_once(&getBackupDeviceUUID_onceToken, block);
  return (id)getBackupDeviceUUID_backupDeviceUUID;
}

void __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D4E0A8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithAccount:delegate:eventQueue:error:", v3, 0, 0, &v9);
  v5 = v9;
  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v4, "backupDeviceUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)getBackupDeviceUUID_backupDeviceUUID;
    getBackupDeviceUUID_backupDeviceUUID = v7;

    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = getBackupDeviceUUID_backupDeviceUUID;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "MBManager reports backupDeviceUUID as %@", buf, 0xCu);
    }
  }

}

- (id)_bagURLForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5
{
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  __CFString *v13;
  void *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  -[ACAccount propertiesForDataclass:](self->_account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == CFSTR("quotaRefreshOfferDetailsURL"))
  {
    if (a4)
      v9 = CFSTR("acseGatewayV1Offer");
    else
      v9 = CFSTR("acseGatewayV1Notification");
  }
  else
  {
    v9 = +[ICQRequestProvider _newAccountBagKeyForOldKey:](ICQRequestProvider, "_newAccountBagKeyForOldKey:", v7);
  }
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    v13 = v9;
    if (v12)
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Using new key %@ to get url from account bag.", (uint8_t *)&v16, 0xCu);
      v13 = v9;
    }
  }
  else
  {
    v13 = v7;
    if (v12)
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Using old key \"%@\" to get url from account bag.", (uint8_t *)&v16, 0xCu);
      v13 = v7;
    }
  }

  objc_msgSend(v8, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)willUseNewKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("quotaOfferReset")) & 1) != 0)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    -[ACAccount propertiesForDataclass:](self->_account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQRequestProvider _bagURLForKey:withOfferID:withNotificationID:](self, "_bagURLForKey:withOfferID:withNotificationID:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEqualToString:", v14) ^ 1;

  }
  return v11;
}

- (id)httpMethodForKey:(id)a3 offerID:(id)a4 notificationID:(id)a5
{
  id v8;
  const __CFString *v9;

  v8 = a3;
  if (!-[ICQRequestProvider willUseNewKey:offerID:notificationID:](self, "willUseNewKey:offerID:notificationID:", v8, a4, a5)|| (objc_msgSend(v8, "isEqualToString:", CFSTR("quotaFetchOffersURL")) & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("quotaRefreshOfferDetailsURL")) & 1) == 0)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("quotaUpdateOfferURL")) & 1) != 0)
    {
      v9 = CFSTR("PUT");
      goto LABEL_8;
    }
LABEL_7:
    v9 = CFSTR("POST");
    goto LABEL_8;
  }
  v9 = CFSTR("GET");
LABEL_8:

  return (id)v9;
}

+ (id)_urlReplacementDictionaryForKey:(id)a3 withOfferID:(id)a4 withNotificationID:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a5;
  v8 = (void *)objc_opt_new();
  v9 = (void *)MGCopyAnswer();
  if (v9)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("{udId}"));
  if (v6)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("{offerId}"));
  }
  else
  {
    if (v7)
    {
      v10 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("{notificationId}"));

  }
  return v8;
}

+ (BOOL)_keyIsEligibleForURLStringReplacement:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _keyIsEligibleForURLStringReplacement__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_keyIsEligibleForURLStringReplacement__onceToken, &__block_literal_global_22);
  v5 = objc_msgSend((id)_keyIsEligibleForURLStringReplacement__eligibleKeys, "containsObject:", v4);

  return v5;
}

void __60__ICQRequestProvider__keyIsEligibleForURLStringReplacement___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("quotaFetchOffersURL");
  v4[1] = CFSTR("quotaRefreshOfferDetailsURL");
  v4[2] = CFSTR("quotaUpdateOfferURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_keyIsEligibleForURLStringReplacement__eligibleKeys;
  _keyIsEligibleForURLStringReplacement__eligibleKeys = v2;

}

+ (id)_newAccountBagKeyForOldKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _newAccountBagKeyForOldKey__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_newAccountBagKeyForOldKey__onceToken, &__block_literal_global_60);
  objc_msgSend((id)_newAccountBagKeyForOldKey__newAccountBagKeys, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__ICQRequestProvider__newAccountBagKeyForOldKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("quotaFetchOffersURL");
  v2[1] = CFSTR("quotaUpdateOfferURL");
  v3[0] = CFSTR("acseGatewayV1Offers");
  v3[1] = CFSTR("acseGatewayV1Action");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_newAccountBagKeyForOldKey__newAccountBagKeys;
  _newAccountBagKeyForOldKey__newAccountBagKeys = v0;

}

+ (BOOL)attemptSetRequest:(id)a3 toPostWithJSONDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Could not convert message body to JSON. Error: %@", buf, 0xCu);
    }

    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[ICQLink addPOSTParams:toRequest:].cold.1((uint64_t)v6, v10);

  }
  else
  {
    objc_msgSend(v5, "setHTTPBody:", v7);
  }

  return v8 == 0;
}

+ (void)addEntriesToPostDictionary:(id)a3 forStub:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "offerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionsWhenChosen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "offerResetPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("offerId"));
      if (v9)
        goto LABEL_4;
    }
    else
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "request: stub missing offerId", buf, 2u);
      }

      if (v9)
      {
LABEL_4:
        v11 = objc_msgSend(v9, "isPhotosCloudEnabled");
        v12 = objc_msgSend(v9, "isPhotosOptimizeEnabled");

        if (!v10)
          goto LABEL_22;
        goto LABEL_14;
      }
    }
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "request: missing conditions when stub was chosen; using live conditions",
        buf,
        2u);
    }

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = +[ICQDaemonOfferConditions isPhotosCloudEnabled](ICQDaemonOfferConditions, "isPhotosCloudEnabled");
  v12 = +[ICQDaemonOfferConditions isPhotosOptimizeEnabled](ICQDaemonOfferConditions, "isPhotosOptimizeEnabled");
  if (!v10)
    goto LABEL_22;
LABEL_14:
  v26 = v10;
  v27 = v8;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, v26, v27, (_QWORD)v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v17);
  }

  v10 = v26;
  v8 = v27;
LABEL_22:
  if (v11)
    v22 = CFSTR("true");
  else
    v22 = CFSTR("false");
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("iCPLEnabled"), v26, v27);
  if (v12)
    v23 = CFSTR("true");
  else
    v23 = CFSTR("false");
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("optimizeEnabled"));
  +[ICQAppLaunchLinkTracker shared](ICQAppLaunchLinkTracker, "shared");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allDaysSinceLastShown");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("appLaunch"));

}

- (id)_stringTimeOfLastBackup
{
  id v3;
  ACAccount *account;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0D4E0A8]);
  account = self->_account;
  v10 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithAccount:delegate:eventQueue:error:", account, 0, 0, &v10);
  v6 = v10;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQRequestProvider _stringTimeOfLastBackup].cold.1();
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "dateOfLastBackup");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject icq_serverFriendlyString](v7, "icq_serverFriendlyString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

void __41__ICQRequestProvider_getBackupDeviceUUID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1CDEBD000, v0, v1, "%s unable to init MBManager with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)_stringTimeOfLastBackup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1CDEBD000, v0, v1, "%s unable to init MBManager with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0_0();
}

@end
