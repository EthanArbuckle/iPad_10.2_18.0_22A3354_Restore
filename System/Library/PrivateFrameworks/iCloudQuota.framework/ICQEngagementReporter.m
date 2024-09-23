@implementation ICQEngagementReporter

+ (void)sendEventFor:(int64_t)a3 withBundleID:(id)a4 link:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a1, "_eventNameForEngagementType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Sending AMSMetricEvent for %@", (uint8_t *)&v10, 0xCu);
  }

  if (a3 == 2)
  {
    objc_msgSend(a1, "_sendBubbleDisplayedEventFor:", v7);
  }
  else if (a3 == 3)
  {
    objc_msgSend(a1, "_sendSubscriptionChangedEvent");
  }

}

+ (void)_sendImpressionEventWithName:(id)a3 bundleID:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  v8 = CFSTR("com.apple.iCloudQuotaUI");
  if (v6)
    v8 = v6;
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x1E0CFDB68]);
  v21[0] = CFSTR("eventType");
  v21[1] = CFSTR("bundleId");
  v22[0] = v5;
  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUnderlyingDictionary:", v11);

  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Sending AMS metricEvent to start on-device journey with bundleID %@", (uint8_t *)&v19, 0xCu);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  objc_msgSend(v12, "underlyingDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "enqueueData:", v15);

  _ICQGetLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "underlyingDictionary");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent to AMSEngagement: %@", (uint8_t *)&v19, 0xCu);

  }
}

+ (void)shouldShowOpportunityBubbleWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("photosLibraryFooter"), CFSTR("homeDashboardHeader"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA88]), "initWithServiceType:placements:", CFSTR("iCloudQuotaUI"), v9);
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to determine if we should show OpportunityBubble.", buf, 2u);
  }

  objc_msgSend(v8, "enqueueMessageEvent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke;
  v17[3] = &unk_1E8B39B28;
  v21 = v7;
  v22 = a1;
  v18 = v9;
  v19 = v6;
  v20 = v8;
  v13 = v8;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v12, "addFinishBlock:", v17);

}

void __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke_cold_1(v5, v6);
    goto LABEL_4;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a2, "messageActions");
  v6 = objc_claimAutoreleasedReturnValue();
  v33 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v33)
  {
    v7 = *(_QWORD *)v41;
    v35 = v6;
    v32 = *(_QWORD *)v41;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v6);
        v34 = v8;
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        _ICQGetLogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd.", buf, 2u);
        }

        objc_msgSend(v9, "placements");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _ICQGetLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v11;
          _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests: %@", buf, 0xCu);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = *(id *)(a1 + 32);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (!v14)
          goto LABEL_22;
        v15 = v14;
        v16 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "_placementDictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v18) = objc_msgSend(v18, "isEqualToString:", v21);

            if ((_DWORD)v18)
            {
              _ICQGetLogSystem();
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
              if (v19)
              {
                v5 = 0;
                if (v23)
                {
                  *(_WORD *)buf = 0;
                  v24 = "ICQTileView should be shown.";
                  goto LABEL_30;
                }
              }
              else
              {
                v5 = 0;
                if (v23)
                {
                  *(_WORD *)buf = 0;
                  v24 = "ICQTileView shouldn't be shown.";
LABEL_30:
                  _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
                }
              }

              _ICQGetLogSystem();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v19, "metricsEvent");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "underlyingDictionary");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSEngagementMessageRequest to AMSEngagement: %@", buf, 0xCu);

              }
              v28 = *(void **)(a1 + 48);
              objc_msgSend(v19, "metricsEvent");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "underlyingDictionary");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (id)objc_msgSend(v28, "enqueueData:", v30);

              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
              goto LABEL_34;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v15)
            continue;
          break;
        }
LABEL_22:

        v8 = v34 + 1;
        v6 = v35;
        v5 = 0;
        v7 = v32;
      }
      while (v34 + 1 != v33);
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v33);
  }
LABEL_4:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_34:

}

+ (void)fetchBubbleContentWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("photosLibraryFooter"), CFSTR("homeDashboardHeader"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA88]), "initWithServiceType:placements:", CFSTR("iCloudQuotaUI"), v9);
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to pull bubble content from Mercury.", buf, 2u);
  }

  objc_msgSend(v8, "enqueueMessageEvent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__ICQEngagementReporter_fetchBubbleContentWithBundleID_completion___block_invoke;
  v17[3] = &unk_1E8B39B50;
  v21 = v7;
  v22 = a1;
  v18 = v9;
  v19 = v6;
  v20 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v16 = v9;
  objc_msgSend(v12, "addFinishBlock:", v17);

}

void __67__ICQEngagementReporter_fetchBubbleContentWithBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(a2, "messageActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v29)
  {
    v4 = *(_QWORD *)v38;
    v31 = v3;
    v28 = *(_QWORD *)v38;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v38 != v4)
          objc_enumerationMutation(v3);
        v30 = v5;
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
        _ICQGetLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd for bubble content.", buf, 2u);
        }

        objc_msgSend(v6, "placements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _ICQGetLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v8;
          _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests for bubble content: %@", buf, 0xCu);
        }

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        obj = *(id *)(a1 + 32);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "makeDialogRequest");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 64), "_placementDictionary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v14) = objc_msgSend(v14, "isEqualToString:", v18);

              if ((_DWORD)v14)
              {
                v19 = *(_QWORD *)(a1 + 56);
                objc_msgSend(*(id *)(a1 + 64), "_createOpportunityBubbleFrom:bundleID:", v16, *(_QWORD *)(a1 + 40));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);

                v21 = *(void **)(a1 + 48);
                objc_msgSend(v16, "metricsEvent");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "underlyingDictionary");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (id)objc_msgSend(v21, "enqueueData:", v23);

                _ICQGetLogSystem();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v16, "metricsEvent");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "underlyingDictionary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v43 = v27;
                  _os_log_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSDialogRequest to AMSEngagement after pulling for bubble content: %@", buf, 0xCu);

                }
                return;
              }

            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v11)
              continue;
            break;
          }
        }

        v5 = v30 + 1;
        v3 = v31;
        v4 = v28;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v29);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (id)_createOpportunityBubbleFrom:(id)a3 bundleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICQOpportunityBubbleSpecification *v16;
  ICQOpportunityBubbleSpecification *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  const __CFString *v43;
  void *v44;
  _QWORD v45[4];
  _QWORD v46[4];
  const __CFString *v47;
  void *v48;
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[2];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[1] = CFSTR("opportunityBubbleDetails");
  v57[0] = a4;
  v56[0] = CFSTR("appId");
  v54[0] = CFSTR("title");
  v42 = a4;
  v5 = a3;
  objc_msgSend(v5, "title");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v41;
  v54[1] = CFSTR("message");
  objc_msgSend(v5, "message");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v40;
  v54[2] = CFSTR("imageDetails");
  v52[0] = CFSTR("3x");
  objc_msgSend(v5, "iconURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v39;
  v52[1] = CFSTR("2x");
  objc_msgSend(v5, "iconURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v38;
  v52[2] = CFSTR("1x");
  objc_msgSend(v5, "iconURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v36;
  v54[3] = CFSTR("actions");
  v49[0] = CFSTR("btnId");
  objc_msgSend(v5, "buttonActions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v33;
  v49[1] = CFSTR("btnTitle");
  objc_msgSend(v5, "buttonActions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v30;
  v50[2] = CFSTR("LAUNCH_REMOTE_UI");
  v49[2] = CFSTR("btnAction");
  v49[3] = CFSTR("btnActParams");
  v47 = CFSTR("openUrl");
  objc_msgSend(v5, "buttonActions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "deepLink");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "absoluteString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v24;
  v45[0] = CFSTR("btnId");
  objc_msgSend(v5, "buttonActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v21;
  v45[1] = CFSTR("btnTitle");
  objc_msgSend(v5, "buttonActions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v6;
  v46[2] = CFSTR("HTTP_CALL");
  v45[2] = CFSTR("btnAction");
  v45[3] = CFSTR("btnActParams");
  v43 = CFSTR("openUrl");
  objc_msgSend(v5, "buttonActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deepLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [ICQOpportunityBubbleSpecification alloc];
  v17 = -[ICQOpportunityBubbleSpecification initWithOpportunityBubble:andOpportunitySheet:](v16, "initWithOpportunityBubble:andOpportunitySheet:", v15, 0);

  return v17;
}

+ (void)_sendBubbleDisplayedEventFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("photosLibraryFooter"), CFSTR("homeDashboardHeader"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA88]), "initWithServiceType:placements:", CFSTR("iCloudQuotaUI"), v4);
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to send impression event.", buf, 2u);
  }

  objc_msgSend(v3, "enqueueMessageEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ICQEngagementReporter__sendBubbleDisplayedEventFor___block_invoke;
  v10[3] = &unk_1E8B39B78;
  v11 = v4;
  v12 = v3;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v7, "addFinishBlock:", v10);

}

void __54__ICQEngagementReporter__sendBubbleDisplayedEventFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a2, "messageActions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v2);
        _ICQGetLogSystem();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd.", buf, 2u);
        }
        v24 = v2;

        objc_msgSend(v3, "placements");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        _ICQGetLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v5;
          _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests: %@", buf, 0xCu);
        }

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = *(id *)(a1 + 32);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "makeDialogRequest");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = *(void **)(a1 + 40);
              objc_msgSend(v13, "metricsEvent");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "underlyingDictionary");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (id)objc_msgSend(v14, "enqueueData:", v16);

              _ICQGetLogSystem();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "metricsEvent");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "underlyingDictionary");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v36 = v20;
                _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSDialogRequest to AMSEngagement: %@", buf, 0xCu);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

        v2 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v23);
  }

}

+ (void)_sendSubscriptionChangedEvent
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint8_t buf[16];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__7;
  v17[4] = __Block_byref_object_dispose__7;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__7;
  v15[4] = __Block_byref_object_dispose__7;
  v16 = 0;
  v3 = dispatch_group_create();
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Requesting current storage level", buf, 2u);
  }

  dispatch_group_enter(v3);
  +[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke;
  v10[3] = &unk_1E8B39BA0;
  v12 = v17;
  v13 = v15;
  v7 = v3;
  v11 = v7;
  objc_msgSend(v5, "getPremiumOfferWithCompletion:", v10);

  dispatch_get_global_queue(33, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke_56;
  v9[3] = &unk_1E8B39BC8;
  v9[5] = v15;
  v9[6] = a1;
  v9[4] = v17;
  dispatch_group_notify(v7, v8, v9);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

void __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "commerceQuotaInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(v5, "bundleQuotaInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v19 = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v16 = "Current iCloudStorageLevel: %@ appleOneStorageLevel %@";
      v17 = v13;
      v18 = 22;
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v6;
      v16 = "No premium offer return with error: %@";
      v17 = v13;
      v18 = 12;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke_56(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "_eventNameForEngagementType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("eventType");
  v16[1] = CFSTR("bundleId");
  v17[0] = v2;
  v17[1] = CFSTR("com.apple.iCloudQuotaUI");
  v16[2] = CFSTR("newiCloudStoragePlan");
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v4;
  v16[3] = CFSTR("newAppleOneStoragePlan");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v3)
      goto LABEL_7;
  }
  else
  {

    if (v3)
      goto LABEL_7;
  }

LABEL_7:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithUnderlyingDictionary:", v7);
  v9 = objc_alloc_init(MEMORY[0x1E0CFDA78]);
  objc_msgSend(v8, "underlyingDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "enqueueData:", v10);

  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "underlyingDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent to AMSEngagement: %@", (uint8_t *)&v14, 0xCu);

  }
}

+ (id)_eventNameForEngagementType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("iCloudQuota:dismissal");
  else
    return off_1E8B39BE8[a3];
}

+ (id)_placementDictionary
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobileslideshow");
  v3[1] = CFSTR("com.apple.Home");
  v4[0] = CFSTR("photosLibraryFooter");
  v4[1] = CFSTR("homeDashboardHeader");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "Received error from amsngagementd %@", (uint8_t *)&v4, 0xCu);

}

@end
