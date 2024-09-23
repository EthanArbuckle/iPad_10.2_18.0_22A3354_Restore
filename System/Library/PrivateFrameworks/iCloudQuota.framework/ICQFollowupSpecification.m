@implementation ICQFollowupSpecification

void __83___ICQFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "uniqueIdentifier", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifierPrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v10)
        {
          _ICQGetLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifierPrefix");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v20 = v14;
            _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Found existing followup with id %@. Not reposting.", buf, 0xCu);

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_15;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v5)
        continue;
      break;
    }
  }

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifierPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "ICQFollowup not found with id %@. Posting now.", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_postFollowupWithController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_15:

}

void __68___ICQFollowupSpecification__postFollowupWithController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("failure: ");
    if ((_DWORD)a2)
      v10 = CFSTR("success");
    v13 = 138413058;
    v14 = v7;
    v11 = &stru_1E8B3C468;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    if (v5)
      v11 = v5;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Posted ICQFollowup item (title:%@ group:%@) %@%@", (uint8_t *)&v13, 0x2Au);

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);

}

void __63___ICQFollowupSpecification_clearLegacyFollowupWithController___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "legacy ICQFollowup items clear completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);

  }
}

void __53___ICQFollowupSpecification_sharedFollowUpController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.icloud.quota"));
  v1 = (void *)sharedFollowUpController_controller;
  sharedFollowUpController_controller = v0;

}

void __82___ICQFollowupSpecification_clearNotificationWithController_offerType_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", a1[4]);

        if (v10)
        {
          v11 = (void *)a1[5];
          v13 = 0;
          objc_msgSend(v11, "clearNotificationForItem:error:", v8, &v13);
          v12 = v13;
          (*(void (**)(void))(a1[6] + 16))();

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

@end
