@implementation WBSFoundInRecommendationManager

- (void)beginListeningForURLSuggestionChanges
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Could not begin listening for Found In notifications", v1, 2u);
}

void __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke_2;
  block[3] = &unk_1E5441F48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("WBSFoundInRecommendationManagerDidUpdateSuggestionsNotification"), WeakRetained);

  }
}

- (void)stopListeningForURLSuggestionChanges
{
  int changeNotificationToken;

  changeNotificationToken = self->_changeNotificationToken;
  if (changeNotificationToken)
  {
    notify_cancel(changeNotificationToken);
    self->_changeNotificationToken = 0;
  }
}

- (void)recentRecommendationsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WBSFoundInRecommendationManager _createInternalQueueIfNecessary](self, "_createInternalQueueIfNecessary");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5443DC8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[WBSFoundInRecommendationManager _recentURLRecommendationsWithCompletionHandler:](self, "_recentURLRecommendationsWithCompletionHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5443450;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_recentURLRecommendationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForURLs");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5443E30;
  v14 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x1A85D45E4](v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "startOfDayForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.mail"), CFSTR("com.apple.mobilemail"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x1E0D8A3C8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:limit:withCompletion:", v12, v9, v10, 64, v5);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recentURLsWithLimit:withCompletion:", 64, v5);
  }

}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2_cold_1(v8, v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:contactStoreProvider:](WBSFoundInRecommendationManager, "_linkRecommendationsFromSGSuggestions:contactStoreProvider:", v5, &__block_literal_global_14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = 134218240;
        v13 = objc_msgSend(v9, "count");
        v14 = 2048;
        v15 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Got %ld recommendations out of %ld Found In links retrieved from suggestions service.", (uint8_t *)&v12, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

uint64_t __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
}

- (void)_createInternalQueueIfNecessary
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *internalQueue;

  if (!self->_internalQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.FoundInRecommendationManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;

  }
}

+ (id)_linkRecommendationsFromSGSuggestions:(id)a3 contactStoreProvider:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_class **v9;
  uint64_t v10;
  id v11;
  __objc2_class *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  double v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  WBSForYouLinkRecommendation *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  WBSForYouLinkRecommendation *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  int v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  void *v87;
  void *v88;
  void (**v89)(void);
  void *v90;
  char v91;
  id v92;
  void *v93;
  WBSForYouLinkRecommendation *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id obj;
  uint8_t v106;
  char v107[15];
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  char v114[16];
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  char v119[16];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v89 = (void (**)(void))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
  if (!v6)
  {
    v101 = 0;
    v93 = 0;
    goto LABEL_103;
  }
  v7 = v6;
  v91 = 0;
  v101 = 0;
  v93 = 0;
  v8 = *(_QWORD *)v111;
  v9 = &off_1E5440000;
  v104 = *(_QWORD *)v111;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v111 != v8)
        objc_enumerationMutation(obj);
      v11 = *(id *)(*((_QWORD *)&v110 + 1) + 8 * v10);
      v12 = v9[38];
      objc_msgSend(v11, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[__objc2_class foundInSourceFromBundleIdentifier:](v12, "foundInSourceFromBundleIdentifier:", v13);

      if (v14 < 2)
        goto LABEL_43;
      objc_msgSend(v11, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scheme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
      {
        v17 = objc_msgSend(v15, "safari_isHTTPFamilyURL");

        if ((v17 & 1) == 0)
          goto LABEL_42;
      }
      else
      {

      }
      objc_msgSend(v15, "safari_canonicalURLForStartPage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "host");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "length") || (objc_msgSend(v19, "safari_looksLikeIPAddress") & 1) != 0)
        goto LABEL_40;
      bestDateForSuggestion(v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_39;
      if (v14 == 2)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v11, "documentTitle"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v28 = objc_msgSend(v27, "length"),
              v27,
              !v28))
        {
LABEL_39:

LABEL_40:
          v33 = (uint64_t)v11;
          goto LABEL_41;
        }
        objc_msgSend(v11, "documentDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v30 = v29;
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v32 = v31;
          if (v30 >= v31 + -600.0)
          {
            objc_msgSend(v11, "documentTimeInterval");
            LOBYTE(v9) = v30 <= v32 + v50;
            goto LABEL_29;
          }
        }
      }
      else
      {
        if (v14 != 3)
          goto LABEL_30;
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_39;
        objc_msgSend(v11, "documentDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "components:fromDate:", 96, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "hour") || objc_msgSend(v23, "minute"))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v25 = v24;
            objc_msgSend(v21, "timeIntervalSinceReferenceDate");
            LOBYTE(v9) = v25 <= v26 + 3600.0 && v25 >= v26 + -3600.0;
          }
          else
          {
            LOBYTE(v9) = 0;
          }

          goto LABEL_29;
        }
      }
      LOBYTE(v9) = 0;
LABEL_29:

LABEL_30:
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v11, "documentIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v34;
        if (!v34)
          goto LABEL_37;
        objc_msgSend(v34, "pageURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "url");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "host");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "host");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if ((v37 & 1) != 0)
        {
          objc_msgSend(v19, "pathComponents");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v38, "count");
          objc_msgSend(v18, "pathComponents");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          v41 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
          v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
          if (v97 > v40)
          {
            if (v42)
            {
              *(_DWORD *)buf = 138543362;
              v116 = v33;
              _os_log_error_impl(&dword_1A840B000, v41, OS_LOG_TYPE_ERROR, "We have a Found In link with a duplicate GUID and host but more path components so we'll replace the existing one: %{public}@", buf, 0xCu);
            }

LABEL_37:
            objc_msgSend(v11, "url");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "safari_canonicalURLForStartPage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            bestDateForSuggestion(v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "bundleIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = +[WBSFoundInRecommendationManager foundInSourceFromBundleIdentifier:](WBSFoundInRecommendationManager, "foundInSourceFromBundleIdentifier:", v44);

            switch(v45)
            {
              case 0uLL:
                goto LABEL_41;
              case 1uLL:
                v46 = 5;
                goto LABEL_56;
              case 2uLL:
                v46 = 6;
                goto LABEL_56;
              case 3uLL:
                v46 = 7;
LABEL_56:
                v98 = v46;
                break;
              default:
                v98 = 0;
                break;
            }
            v94 = [WBSForYouLinkRecommendation alloc];
            v51 = v11;
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (objc_msgSend(v51, "documentTitle"),
                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                  v53 = objc_msgSend(v52, "length"),
                  v52,
                  v53))
            {
              objc_msgSend(v51, "documentTitle");
              v54 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v51, "title");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "length");

              if (!v56)
              {
                v57 = &stru_1E5449658;
                goto LABEL_64;
              }
              objc_msgSend(v51, "title");
              v54 = objc_claimAutoreleasedReturnValue();
            }
            v57 = (__CFString *)v54;
LABEL_64:

            v58 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v94, "initWithTitle:url:lastSeenDate:source:topicSource:", v57, v18, v19, v98, 0);
            objc_msgSend(v51, "bundleIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSForYouLinkRecommendation setBundleIdentifier:](v58, "setBundleIdentifier:", v59);

            -[WBSForYouLinkRecommendation setSourceID:](v58, "setSourceID:", v33);
            if (v45 == 3 || v45 == 2)
            {
              v96 = (void *)MEMORY[0x1E0CB3940];
              v67 = v58;
              _WBSLocalizedString();
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSForYouLinkRecommendation title](v58, "title");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "localizedStringWithFormat:", v100, v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSForYouLinkRecommendation setTitle:](v67, "setTitle:", v69);

              _WBSLocalizedString();
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSForYouLinkRecommendation setFootnote:](v67, "setFootnote:", v70);

              v71 = v101;
              v58 = v67;
              goto LABEL_97;
            }
            if (v45 != 1)
            {
              v71 = v101;
              goto LABEL_97;
            }
            _WBSLocalizedString();
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "receivedFromHandle");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v60, "hasPrefix:", CFSTR("e:")))
            {
              objc_msgSend(v60, "substringFromIndex:", 2);
              v61 = objc_claimAutoreleasedReturnValue();

              v60 = (void *)v61;
            }
            v62 = v60;
            if (!v93)
            {
              v89[2]();
              v93 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v99 = v62;
            if ((v91 & 1) != 0 || objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
            {
              v63 = v101;
            }
            else
            {
              v109 = 0;
              objc_msgSend(v93, "_ios_meContactWithKeysToFetch:error:", MEMORY[0x1E0C9AA60], &v109);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v109;

              if (v64)
              {
                v65 = v63;
                v66 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:contactStoreProvider:].cold.3((uint64_t)v119, v66);

                v63 = v65;
                v62 = v99;
              }
            }
            v108 = 0;
            objc_msgSend(v93, "contactForHandle:error:", v62, &v108);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v63;
            v92 = v108;
            objc_msgSend(v63, "identifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v72;
            objc_msgSend(v72, "identifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v72) = objc_msgSend(v73, "isEqualToString:", v74);

            if ((_DWORD)v72)
            {
              v75 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138478083;
                v77 = v99;
                v116 = (uint64_t)v99;
                v117 = 2113;
                v118 = v33;
                _os_log_debug_impl(&dword_1A840B000, v75, OS_LOG_TYPE_DEBUG, "Skipping suggestion from Me contact with handle: %{private}@ document identifier: %{private}@", buf, 0x16u);
                v76 = 3;
              }
              else
              {
                v76 = 3;
                v77 = v99;
              }
              v78 = v77;
LABEL_96:

              v91 = 1;
              v71 = v90;
              if (v76 != 11)
              {
LABEL_98:

                v101 = v71;
LABEL_41:

                v11 = (id)v33;
                v8 = v104;
                v9 = &off_1E5440000;
LABEL_42:

LABEL_43:
                goto LABEL_44;
              }
LABEL_97:
              objc_msgSend(v103, "setObject:forKeyedSubscript:", v58, v33);
              goto LABEL_98;
            }
            objc_msgSend(v102, "safari_fullName");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v79;
            if (objc_msgSend(v79, "length"))
            {
              v78 = v79;

            }
            else
            {
              v78 = v99;
              if (v93)
              {
                v82 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
                v83 = v82;
                if (v92)
                {
                  v77 = v99;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                    +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:contactStoreProvider:].cold.2((uint64_t)v114, v83);
                }
                else
                {
                  v77 = v99;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                    +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:contactStoreProvider:].cold.1(&v106, v107, v83);
                }
                v76 = 3;
                v78 = v77;
                goto LABEL_95;
              }
            }
            -[WBSForYouLinkRecommendation setContact:](v58, "setContact:", v102);
            v87 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "localizedStringWithFormat:", v80, v95, v78);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSForYouLinkRecommendation setFootnote:](v58, "setFootnote:", v81);

            v76 = 11;
            v77 = v99;
LABEL_95:

            goto LABEL_96;
          }
          if (!v42)
            goto LABEL_41;
          *(_DWORD *)buf = 138543362;
          v116 = v33;
          v48 = v41;
          v49 = "Skipping Found In link with a duplicate GUID and host but less path components: %{public}@";
        }
        else
        {
          v47 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_DWORD *)buf = 138543362;
          v116 = v33;
          v48 = v47;
          v49 = "Skipping Found In link with a duplicate GUID but different URL host: %{public}@";
        }
        _os_log_error_impl(&dword_1A840B000, v48, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
        goto LABEL_41;
      }
      v8 = v104;
      v9 = &off_1E5440000;
LABEL_44:
      ++v10;
    }
    while (v7 != v10);
    v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
    v7 = v84;
  }
  while (v84);
LABEL_103:

  objc_msgSend(v103, "allValues");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  return v85;
}

+ (unint64_t)foundInSourceFromBundleIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;

  v4 = a3;
  if ((objc_msgSend(a1, "isBundleIdentifierFromCalendar:", v4) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(a1, "isBundleIdentifierFromMessages:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.reminders"));

    if (v7)
      v5 = 3;
    else
      v5 = 0;
  }

  return v5;
}

+ (BOOL)isBundleIdentifierFromCalendar:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iCal"));

  return v4;
}

+ (BOOL)isBundleIdentifierFromMessages:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iChat")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Unable to get Found In suggestions: %{public}@", (uint8_t *)&v5, 0xCu);

}

+ (void)_linkRecommendationsFromSGSuggestions:(os_log_t)log contactStoreProvider:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A840B000, log, OS_LOG_TYPE_DEBUG, "Unable to get full contact name for Messages link", buf, 2u);
}

+ (void)_linkRecommendationsFromSGSuggestions:(uint64_t)a1 contactStoreProvider:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_0_6(&dword_1A840B000, v7, v8, "Unable to get full contact name for Messages link with error: %{public}@");

  OUTLINED_FUNCTION_4_3();
}

+ (void)_linkRecommendationsFromSGSuggestions:(uint64_t)a1 contactStoreProvider:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_0_6(&dword_1A840B000, v7, v8, "Could not fetch me card with error: %{public}@");

  OUTLINED_FUNCTION_4_3();
}

@end
