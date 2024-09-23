@implementation PLHandleSpotlightAddedOrUpdatedItemsForSyndicationLibrary

void __PLHandleSpotlightAddedOrUpdatedItemsForSyndicationLibrary_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customAttributeDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com_apple_mobilesms_isChatAutoDonating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  +[PLConversation albumWithConversationID:inLibrary:](PLConversation, "albumWithConversationID:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (v5)
    {
      if (!objc_msgSend(v6, "syndicate"))
      {
        PLSyndicationGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "pathManager");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v35 = v10;
          v36 = 2112;
          v37 = v11;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] Chat was updated: %@ autoDonating=1 (was off) in library %@", buf, 0x16u);

        }
        objc_msgSend(v7, "setSyndicate:", 1);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      v28 = v4;
      PLSyndicationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "pathManager");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v13;
        v36 = 2112;
        v37 = v14;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] Chat was updated: %@ autoDonating=0 (was on) in library %@", buf, 0x16u);

      }
      objc_msgSend(v7, "setSyndicate:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = v7;
      objc_msgSend(v7, "assets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v20, "additionalAttributes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "syndicationIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
            }
            else
            {
              PLSyndicationGetLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v25 = *(_QWORD *)(a1 + 40);
                v26 = CFSTR("syndicationIdentifier");
                if (!v22)
                  v26 = CFSTR("additionalAttributes");
                *(_DWORD *)buf = 138412546;
                v35 = v25;
                v36 = 2114;
                v37 = v26;
                _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "conversation %@ %{public}@ is nil", buf, 0x16u);
              }

            }
            objc_autoreleasePoolPop(v21);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v17);
      }

      v7 = v27;
      v4 = v28;
    }
  }

}

@end
