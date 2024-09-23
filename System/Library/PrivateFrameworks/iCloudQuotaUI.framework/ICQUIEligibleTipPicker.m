@implementation ICQUIEligibleTipPicker

- (ICQUIEligibleTipPicker)initWithAccount:(id)a3 planRecommendation:(id)a4
{
  id v7;
  id v8;
  ICQUIEligibleTipPicker *v9;
  ICQUIEligibleTipPicker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIEligibleTipPicker;
  v9 = -[ICQUIEligibleTipPicker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_planRecommendation, a4);
  }

  return v10;
}

- (void)getFirstEligibleTipFromTips:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  ICQStoragePlanRecommendation *planRecommendation;
  void *v12;
  _QWORD v13[4];
  id v14;
  ICQUIEligibleTipPicker *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ICQUIEligibleTipPicker getFirstEligibleTipFromTips:completion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s determining first eligible tip from tips: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "criteria");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    planRecommendation = self->_planRecommendation;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke;
    v13[3] = &unk_24E3F5370;
    v16 = v7;
    v14 = v6;
    v15 = self;
    -[ICQStoragePlanRecommendation calculateExtraQuotaNeededToSyncIsAccountFull:completion:](planRecommendation, "calculateExtraQuotaNeededToSyncIsAccountFull:completion:", 0, v13);

    v12 = v16;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

void __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id obj;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v23 = v6;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = *(id *)(a1 + 32);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      v11 = *MEMORY[0x24BEC7280];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v14 = *(void **)(a1 + 40);
          objc_msgSend(v13, "criteria", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = objc_msgSend(v14, "_deviceStoragePassesCriteria:freeCloudStorage:", v15, v5);

          if ((_DWORD)v14)
          {
            objc_msgSend(v13, "anchor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v11);

            if (!v17)
              goto LABEL_19;
            v18 = *(void **)(a1 + 40);
            objc_msgSend(v13, "criteria");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "excludeApps");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v18) = objc_msgSend(v18, "_eligibleForSyncWithiCloudTipExcludingApps:", v20);

            if ((_DWORD)v18)
            {
              _ICQGetLogSystem();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21F2CC000, v22, OS_LOG_TYPE_DEFAULT, "Found tip for Sync with iCloud section.", buf, 2u);
              }

LABEL_19:
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

              goto LABEL_20;
            }
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v9)
          continue;
        break;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_20:
    v7 = v23;
  }
  else
  {
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke_cold_1((uint64_t)v7, v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (BOOL)_eligibleForSyncWithiCloudTipExcludingApps:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  ACAccount *account;
  void *v13;
  int v14;
  int v15;
  int v16;
  _BOOL4 v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[ICQUIDataclassHelper unsyncedDataclassesExcludingPhotosForAccount:](ICQUIDataclassHelper, "unsyncedDataclassesExcludingPhotosForAccount:", self->_account);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)) ^ 1;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v11 = (void *)MEMORY[0x24BEC7350];
  account = self->_account;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isBackupEnabledForAccount:accountStore:", account, v13);

  v15 = objc_msgSend(MEMORY[0x24BEC7350], "isICPLEnabledForAccount:", self->_account);
  v16 = v15 ^ 1;
  if (v8 > 1)
    v16 = 1;
  if (v14)
    v17 = v16;
  else
    v17 = 1;
  _ICQGetLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    v28 = "-[ICQUIEligibleTipPicker _eligibleForSyncWithiCloudTipExcludingApps:]";
    *(_DWORD *)buf = 136316162;
    if (v14)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v30 = v20;
    v29 = 2112;
    if (v15)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v31 = 2112;
    v32 = v21;
    if (v17)
      v19 = CFSTR("YES");
    v33 = 2048;
    v34 = v8;
    v35 = 2112;
    v36 = v19;
    _os_log_impl(&dword_21F2CC000, v18, OS_LOG_TYPE_DEFAULT, "%s: isiCloudBackupEnabled (%@) isiCPLEnabled (%@) numberOfUnsyncedDataclasses (%lu) is eligible? (%@)", buf, 0x34u);
  }

  return v17;
}

- (BOOL)_deviceStoragePassesCriteria:(id)a3 freeCloudStorage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  BOOL v18;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "minimumRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = objc_msgSend(v6, "unsignedIntegerValue");

  v10 = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(v5, "maximumRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v6, "unsignedLongValue");
    v15 = CFSTR("NO");
    v20 = 136316162;
    v21 = "-[ICQUIEligibleTipPicker _deviceStoragePassesCriteria:freeCloudStorage:]";
    v22 = 2112;
    v24 = 2048;
    if (v8 >= v9)
      v16 = CFSTR("NO");
    else
      v16 = CFSTR("YES");
    v23 = v5;
    v25 = v14;
    if (v10 < v12)
      v15 = CFSTR("YES");
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "%s criteria (%@) and freeCloudStorage %lu: satisfies minimum range (%@) satisfies maximum range (%@)", (uint8_t *)&v20, 0x34u);
  }

  v18 = v8 < v9 && v10 < v12;
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planRecommendation, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __65__ICQUIEligibleTipPicker_getFirstEligibleTipFromTips_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ICQUIEligibleTipPicker getFirstEligibleTipFromTips:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "%s - Failed to fetch storage space with error: %@, will not evaluate tip criteria.", (uint8_t *)&v2, 0x16u);
}

@end
