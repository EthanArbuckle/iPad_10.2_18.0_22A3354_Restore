@implementation PPSocialHighlightMetrics

+ (void)logFeedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = +[PPSocialHighlightStorage unifiedFeedbackTypeForHighlightFeedbackType:](PPSocialHighlightStorage, "unifiedFeedbackTypeForHighlightFeedbackType:", a4);
  if (v9 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E7E18470[v9];
  }
  pp_social_highlights_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "Logging feedback for highlight engagement", buf, 2u);
  }

  v12 = (void *)MEMORY[0x1C3BD6630]();
  v16[0] = CFSTR("clientIdentifier");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v13;
  v17[1] = CFSTR("engagementFeedbackDomain");
  v16[1] = CFSTR("feedbackDomain");
  v16[2] = CFSTR("feedbackType");
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  objc_autoreleasePoolPop(v12);
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackReceived"), v14, 0);

}

+ (void)logFeedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = +[PPSocialHighlightStorage attributionFeedbackTypeForAttributionFeedbackType:](PPSocialHighlightStorage, "attributionFeedbackTypeForAttributionFeedbackType:", a4);
  if (v9 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E7E18470[v9];
  }
  pp_social_highlights_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "Logging feedback for highlight attribution", buf, 2u);
  }

  v12 = (void *)MEMORY[0x1C3BD6630]();
  v16[0] = CFSTR("clientIdentifier");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v13;
  v17[1] = CFSTR("attributionFeedbackDomain");
  v16[1] = CFSTR("feedbackDomain");
  v16[2] = CFSTR("feedbackType");
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  objc_autoreleasePoolPop(v12);
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackReceived"), v14, 0);

}

+ (double)hoursFromSeconds:(double)a3
{
  return a3 / 3600.0;
}

+ (void)logMatchedFeedbackForHighlightMatches:(id)a3 batchSize:(unint64_t)a4 type:(int)a5 client:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  __CFString *v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
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
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  __CFString *v54;
  id v55;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *context;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[16];
  _QWORD v69[13];
  _QWORD v70[3];
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BYTE v81[128];
  _QWORD v82[2];
  _QWORD v83[4];

  v7 = *(_QWORD *)&a5;
  v83[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (v7 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E7E18470[v7];
  }
  pp_social_highlights_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "Logging matched feedback for social highlights.", buf, 2u);
  }

  if (objc_msgSend(v9, "count"))
  {
    v57 = (void *)objc_opt_new();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v46 = v9;
    obj = v9;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    if (v58)
    {
      v53 = *(_QWORD *)v65;
      v54 = v11;
      v13 = 0x1E0CB3000uLL;
      v55 = v10;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v65 != v53)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          v16 = MEMORY[0x1C3BD6630]();
          v17 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v15, "contentCreationSecondsSinceReferenceDate");
          v18 = (void *)objc_msgSend(v17, "initWithTimeIntervalSinceReferenceDate:");
          objc_msgSend(v57, "timeIntervalSinceDate:", v18);
          v20 = v19;

          v21 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v15, "syndicationSecondsSinceReferenceDate");
          v22 = (void *)objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:");
          objc_msgSend(v57, "timeIntervalSinceDate:", v22);
          v24 = v23;

          v69[0] = CFSTR("clientIdentifier");
          v25 = v10;
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v52;
          }
          v70[0] = v25;
          v70[1] = v11;
          v69[1] = CFSTR("feedbackType");
          v69[2] = CFSTR("rank");
          objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInt:", objc_msgSend(v15, "rank"));
          v26 = objc_claimAutoreleasedReturnValue();
          v70[2] = v26;
          v69[3] = CFSTR("isPrimary");
          objc_msgSend(*(id *)(v13 + 2024), "numberWithBool:", objc_msgSend(v15, "isPrimary"));
          v71 = objc_claimAutoreleasedReturnValue();
          v69[4] = CFSTR("hoursSinceCreation");
          v61 = (void *)v71;
          if (objc_msgSend(v15, "hasContentCreationSecondsSinceReferenceDate"))
          {
            v27 = *(void **)(v13 + 2024);
            +[PPSocialHighlightMetrics hoursFromSeconds:](PPSocialHighlightMetrics, "hoursFromSeconds:", v20);
            objc_msgSend(v27, "numberWithDouble:");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 0x1E0C99000;
          }
          else
          {
            v29 = 0x1E0C99000uLL;
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v72 = v28;
          v69[5] = CFSTR("hoursSinceHighlight");
          v62 = (void *)v26;
          context = (void *)v16;
          v60 = (void *)v28;
          if (objc_msgSend(v15, "hasSyndicationSecondsSinceReferenceDate"))
          {
            v30 = *(void **)(v13 + 2024);
            +[PPSocialHighlightMetrics hoursFromSeconds:](PPSocialHighlightMetrics, "hoursFromSeconds:", v24);
            objc_msgSend(v30, "numberWithDouble:");
          }
          else
          {
            objc_msgSend(*(id *)(v29 + 3640), "null");
          }
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v59;
          v69[6] = CFSTR("isManuallyHighlighted");
          objc_msgSend(*(id *)(v13 + 2024), "numberWithInt:", objc_msgSend(v15, "highlightType") == 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v31;
          v69[7] = CFSTR("batchSize");
          objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInteger:", a4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v32;
          v69[8] = CFSTR("isTopKResult");
          objc_msgSend(*(id *)(v13 + 2024), "numberWithBool:", objc_msgSend(v15, "isTopKResult"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v33;
          v69[9] = CFSTR("iMesssageBucket");
          objc_msgSend(a1, "iMessageBucketDescriptionWithShouldContinueBlock:", &__block_literal_global_7812);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (!v34)
          {
            objc_msgSend(*(id *)(v29 + 3640), "null");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v51;
          }
          v77 = v35;
          v69[10] = CFSTR("SMSBucket");
          objc_msgSend(a1, "SMSBucketDescriptionWithShouldContinueBlock:", &__block_literal_global_68_7813);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (!v36)
          {
            objc_msgSend(*(id *)(v29 + 3640), "null");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v50;
          }
          v78 = v37;
          v69[11] = CFSTR("activeiMessageUser");
          objc_msgSend(a1, "hasSentIMessageWithShouldContinueBlock:", &__block_literal_global_69_7814);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (!v38)
          {
            objc_msgSend(*(id *)(v29 + 3640), "null");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v49;
          }
          v79 = v39;
          v69[12] = CFSTR("activeSMSUser");
          v40 = a1;
          objc_msgSend(a1, "hasSentSMSWithShouldContinueBlock:", &__block_literal_global_70);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (!v41)
          {
            objc_msgSend(*(id *)(v29 + 3640), "null");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v48;
          }
          v80 = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 13);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41)

          if (!v38)
          a1 = v40;
          if (!v36)

          v13 = 0x1E0CB3000;
          if (!v34)

          v10 = v55;
          if (!v55)

          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackMatched"), v43, 0);
          objc_autoreleasePoolPop(context);
          v11 = v54;
        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      }
      while (v58);
    }

    v9 = v46;
  }
  else
  {
    v44 = (void *)MEMORY[0x1C3BD6630]();
    v82[0] = CFSTR("clientIdentifier");
    v82[1] = CFSTR("feedbackType");
    v83[0] = v10;
    v83[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackNotMatched"), v45, 0);

    objc_autoreleasePoolPop(v44);
  }

}

+ (void)registerCTSDataCollection
{
  +[PPSocialHighlightMetrics registerLogConsumedByClient](PPSocialHighlightMetrics, "registerLogConsumedByClient");
  +[PPSocialHighlightMetrics registerDeviceSettingsCollection](PPSocialHighlightMetrics, "registerDeviceSettingsCollection");
  +[PPSocialHighlightMetrics registerCountLinks](PPSocialHighlightMetrics, "registerCountLinks");
  +[PPSocialHighlightMetrics registerSampledUnsupportedClientLogging](PPSocialHighlightMetrics, "registerSampledUnsupportedClientLogging");
  +[PPSocialHighlightMetrics registerClientLinkStatus](PPSocialHighlightMetrics, "registerClientLinkStatus");
  +[PPSocialHighlightMetrics registerExpiredLinkReview](PPSocialHighlightMetrics, "registerExpiredLinkReview");
}

+ (id)_countSentMessagesInLastWeekMatchingChatType:(id)a3 shouldContinueBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t v21[16];
  _QWORD v22[4];
  NSObject *v23;
  __int128 *p_buf;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  _QWORD v39[3];
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(_QWORD))a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setReason:", CFSTR("SHMetrics"));
  objc_msgSend(v7, "setDisableBlockingOnIndex:", 1);
  objc_msgSend(v7, "setMaxCount:", 500);
  v41[0] = *MEMORY[0x1E0CA6380];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchAttributes:", v8);

  objc_msgSend(v7, "setLowPriority:", 1);
  objc_msgSend(v7, "setReason:", CFSTR("reason:PPSocialHighlightMetrics-1; code:1"));
  v40 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtectionClasses:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com_apple_mobilesms_service=\"%@\"), v5);
  v39[0] = v10;
  v39[1] = CFSTR("kMDItemContentCreationDate>=$time.now(-7d)");
  v39[2] = CFSTR("com_apple_mobilesms_fromMe=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_componentsJoinedByString:", CFSTR(" && "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  pp_social_highlights_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Performing CoreSpotlight highlight query: %@", (uint8_t *)&buf, 0xCu);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v12, v7);
  v38 = *MEMORY[0x1E0D70E28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleIDs:", v15);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v16 = MEMORY[0x1E0C809B0];
  v32 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke;
  v28[3] = &unk_1E7E1E4A0;
  v28[4] = &v29;
  objc_msgSend(v14, "setFoundItemsHandler:", v28);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__7653;
  v36 = __Block_byref_object_dispose__7654;
  v37 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke_86;
  v22[3] = &unk_1E7E182C8;
  p_buf = &buf;
  v25 = v26;
  v17 = dispatch_semaphore_create(0);
  v23 = v17;
  objc_msgSend(v14, "setCompletionHandler:", v22);
  objc_msgSend(v14, "start");
  do
  {
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v17, 1.0) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v30 + 6));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  while ((v6[2](v6) & 1) != 0);
  pp_default_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring while counting metrics.", v21, 2u);
  }

  objc_msgSend(v14, "cancel");
  v19 = 0;
LABEL_10:

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

+ (BOOL)_queryLinksWithFetchAttributes:(id)a3 interval:(double)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  _QWORD v22[4];
  NSObject *v23;
  __int128 *p_buf;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setReason:", CFSTR("SHMetrics"));
  objc_msgSend(v9, "setDisableBlockingOnIndex:", 1);
  objc_msgSend(v9, "setMaxCount:", 500);
  objc_msgSend(v9, "setFetchAttributes:", v7);
  objc_msgSend(v9, "setLowPriority:", 1);
  objc_msgSend(v9, "setReason:", CFSTR("reason:PPSocialHighlightMetrics-1 code:1"));
  v37[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProtectionClasses:", v10);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@=\"%@\"), *MEMORY[0x1E0CA6488], CFSTR("lnk"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemContentCreationDate>=$time.now(-%.f)"), *(_QWORD *)&a4);
  v36[0] = v12;
  v36[1] = v13;
  v36[2] = CFSTR("URL=*");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(" && "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  pp_social_highlights_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Performing CoreSpotlight highlight query: %@", (uint8_t *)&buf, 0xCu);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v15, v9);
  v35 = *MEMORY[0x1E0D70E28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBundleIDs:", v18);

  objc_msgSend(v17, "setFoundItemsHandler:", v8);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7653;
  v33 = __Block_byref_object_dispose__7654;
  v34 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v19 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__PPSocialHighlightMetrics__queryLinksWithFetchAttributes_interval_handler___block_invoke;
  v22[3] = &unk_1E7E182C8;
  p_buf = &buf;
  v25 = &v26;
  v20 = v19;
  v23 = v20;
  objc_msgSend(v17, "setCompletionHandler:", v22);
  objc_msgSend(v17, "start");
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v18) = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&buf, 8);

  return (char)v18;
}

+ (id)highlightsReceivedInInterval:(double)a3 shouldContinueBlock:(id)a4
{
  uint64_t (**v5)(_QWORD);
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  id obj;
  id v20;
  id location;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(_QWORD))a4;
  v6 = (void *)objc_opt_new();
  v20 = 0;
  objc_msgSend(v6, "autoDonatingChatsWithShouldContinueBlock:error:", v5, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  location = v8;
  if (!v7)
  {
    v15 = v8;
    pp_social_highlights_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch autodonating chats (possibly deferred): %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((v5[2](v5) & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring highlights received in interval.", buf, 2u);
    }
LABEL_10:
    v13 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "sharedContentFromChats:dateRange:applicationIdentifiers:error:", v7, 0, &location, a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[NSObject _pas_mappedArrayWithTransform:](v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    obj = location;
    objc_msgSend(v6, "attributionsForIdentifiers:error:", v11, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&location, obj);

    if (v12)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke_101;
      v17[3] = &unk_1E7E18310;
      v18 = v12;
      -[NSObject _pas_mappedArrayWithTransform:](v10, "_pas_mappedArrayWithTransform:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
    }
    else
    {
      pp_social_highlights_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = location;
        _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch attributions: %@", buf, 0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    pp_social_highlights_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = location;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch searchable items: %@", buf, 0xCu);
    }
    v13 = 0;
  }

LABEL_19:
  return v13;
}

+ (id)allHighlightIdentifiersReceivedWithShouldContinueBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialHighlightMetricReportingInterval");
  +[PPSocialHighlightMetrics highlightsReceivedInInterval:shouldContinueBlock:](PPSocialHighlightMetrics, "highlightsReceivedInInterval:shouldContinueBlock:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "highlightIdentifier", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "highlightIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)countAllLinksReceivedInMessages
{
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = *MEMORY[0x1E0CA6970];
  v12[0] = *MEMORY[0x1E0CA6978];
  v12[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialHighlightMetricReportingInterval");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PPSocialHighlightMetrics_countAllLinksReceivedInMessages__block_invoke;
  v7[3] = &unk_1E7E1E4A0;
  v7[4] = &v8;
  +[PPSocialHighlightMetrics _queryLinksWithFetchAttributes:interval:handler:](PPSocialHighlightMetrics, "_queryLinksWithFetchAttributes:interval:handler:", v3, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)unsupportedClientsFromPastDayWithShouldContinueBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v39 = (void *)objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0D70D88], *MEMORY[0x1E0D70D98], *MEMORY[0x1E0D70D80], *MEMORY[0x1E0D70DB0], 0);
  objc_autoreleasePoolPop(v4);
  +[PPSocialHighlightMetrics highlightsReceivedInInterval:shouldContinueBlock:](PPSocialHighlightMetrics, "highlightsReceivedInInterval:shouldContinueBlock:", v3, 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v37 = v3;
    v38 = (id)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v36 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      v11 = 0x1E0C99000uLL;
      v40 = *(_QWORD *)v49;
      v41 = v7;
      do
      {
        v12 = 0;
        v42 = v9;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
          objc_msgSend(v13, "resourceUrl");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_alloc(*(Class *)(v11 + 3736));
            objc_msgSend(v13, "resourceUrl");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "initWithString:", v16);

            if (v17)
            {
              objc_msgSend(v13, "resolvedUrl");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = objc_alloc(*(Class *)(v11 + 3736));
                objc_msgSend(v13, "resolvedUrl");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v19, "initWithString:", v20);

              }
              else
              {
                v21 = 0;
              }

              +[PPSocialHighlightStorage appLinksForResourceURL:resolvedURL:](PPSocialHighlightStorage, "appLinksForResourceURL:resolvedURL:", v17, v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                v43 = v21;
                v24 = (void *)objc_opt_new();
                v44 = 0u;
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                v25 = v23;
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v45;
                  do
                  {
                    for (i = 0; i != v27; ++i)
                    {
                      if (*(_QWORD *)v45 != v28)
                        objc_enumerationMutation(v25);
                      v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                      if (objc_msgSend(v30, "isEnabled"))
                      {
                        objc_msgSend(v30, "targetApplicationRecord");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "applicationIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v32)
                          objc_msgSend(v24, "addObject:", v32);

                      }
                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                  }
                  while (v27);
                }

                if (objc_msgSend(v24, "count"))
                {
                  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v24);
                  v34 = objc_msgSend(v33, "intersectsSet:", v39);

                  if ((v34 & 1) == 0)
                    objc_msgSend(v38, "addObjectsFromArray:", v24);
                }

                v10 = v40;
                v7 = v41;
                v9 = v42;
                v21 = v43;
                v11 = 0x1E0C99000;
              }

            }
          }
          else
          {
            pp_social_highlights_log_handle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "attributionIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v54 = v22;
              _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: encountered highlight (attribution ID: %@) without a valid resource URL", buf, 0xCu);

            }
          }

          ++v12;
        }
        while (v12 != v9);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v9);
    }

    v6 = v36;
    v3 = v37;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

+ (void)registerSampledUnsupportedClientLogging
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.UnsupportedClient", v4, v5);

}

+ (void)_recordTipsContentEvent:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPSocialHighlight-tipsContent", 5);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PPSocialHighlightMetrics__recordTipsContentEvent___block_invoke;
  block[3] = &unk_1E7E1F4F0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

+ (void)registerClientLinkStatus
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ClientLinkStatus", v4, v5);

}

+ (void)logConsumptionByClientWithShouldContinueBlock:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t (**v18)(_QWORD);
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *context;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[16];
  _QWORD v72[4];
  id v73;
  id v74;
  char v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[7];
  _QWORD v79[7];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasWrittenSharedWithYouContentConsumed");

  v7 = objc_alloc(MEMORY[0x1E0C99D68]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socialHighlightMetricReportingInterval");
  v10 = (void *)objc_msgSend(v7, "initWithTimeIntervalSinceNow:", -v9);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "timeIntervalSinceNow");
  objc_msgSend(v11, "feedbackPublisherWithInterval:includingRemote:", 0, -v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke;
  v76[3] = &unk_1E7E1CDC8;
  v16 = v10;
  v77 = v16;
  objc_msgSend(v13, "filterWithIsIncluded:", v76);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v15;
  v72[1] = 3221225472;
  v72[2] = __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_149;
  v72[3] = &unk_1E7E183C8;
  v59 = v14;
  v73 = v59;
  v75 = v6;
  v18 = (uint64_t (**)(_QWORD))v4;
  v74 = v18;
  v19 = (id)objc_msgSend(v17, "sinkWithCompletion:shouldContinue:", &__block_literal_global_148_7726, v72);

  v46 = v18;
  if ((v18[2](v18) & 1) != 0)
  {
    objc_msgSend(a1, "iMessageBucketDescriptionWithShouldContinueBlock:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if ((v18[2](v18) & 1) != 0)
    {
      v45 = v16;
      objc_msgSend(a1, "SMSBucketDescriptionWithShouldContinueBlock:", v18);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18[2](v18) & 1) != 0)
      {
        v44 = v13;
        objc_msgSend(a1, "hasSentIMessageWithShouldContinueBlock:", v18);
        v21 = objc_claimAutoreleasedReturnValue();
        if ((v18[2](v18) & 1) != 0)
        {
          objc_msgSend(a1, "hasSentSMSWithShouldContinueBlock:", v18);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v18[2](v18) & 1) != 0)
          {
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            objc_msgSend(v59, "keyEnumerator");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
            if (!v49)
            {

              goto LABEL_56;
            }
            obj = v22;
            v23 = 0;
            v48 = *(_QWORD *)v68;
LABEL_8:
            v24 = 0;
            while (1)
            {
              if (*(_QWORD *)v68 != v48)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v24);
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              objc_msgSend(v59, "objectForKeyedSubscript:", v25);
              v51 = (id)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
              if (v60)
                break;
LABEL_40:

              if (++v24 == v49)
              {
                v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
                if (!v49)
                {

                  if ((v23 & 1) != 0)
                    goto LABEL_57;
LABEL_56:
                  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackStreamReviewed"), MEMORY[0x1E0C9AA70], 1);
                  goto LABEL_57;
                }
                goto LABEL_8;
              }
            }
            v50 = v24;
            v58 = *(_QWORD *)v64;
LABEL_13:
            v26 = 0;
            while (1)
            {
              v27 = v21;
              if (*(_QWORD *)v64 != v58)
                objc_enumerationMutation(v51);
              v28 = v20;
              v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
              context = (void *)MEMORY[0x1C3BD6630]();
              v78[0] = CFSTR("clientIdentifier");
              v30 = v25;
              if (!v25)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v56;
              }
              v79[0] = v30;
              v78[1] = CFSTR("feedbackType");
              +[PPSocialHighlightFeedbackUtils stringifyBiomeFeedbackType:](PPSocialHighlightFeedbackUtils, "stringifyBiomeFeedbackType:", objc_msgSend(v29, "unsignedIntegerValue"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v79[1] = v31;
              v78[2] = CFSTR("eventCount");
              v32 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v59, "objectForKeyedSubscript:", v25);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "countForObject:", v29));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v79[2] = v34;
              v78[3] = CFSTR("iMesssageBucket");
              v35 = v28;
              if (!v28)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v55 = objc_claimAutoreleasedReturnValue();
                v35 = v55;
              }
              v79[3] = v35;
              v78[4] = CFSTR("SMSBucket");
              v36 = v62;
              if (!v62)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v54;
              }
              v79[4] = v36;
              v78[5] = CFSTR("activeiMessageUser");
              v37 = v27;
              if (!v27)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v53 = objc_claimAutoreleasedReturnValue();
                v37 = v53;
              }
              v79[5] = v37;
              v78[6] = CFSTR("activeSMSUser");
              v38 = v57;
              if (!v57)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v52;
              }
              v79[6] = v38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 7);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackStreamReviewed"), v39, 1);

              if (!v57)
              v20 = v28;
              v21 = v27;
              if (!v27)

              if (v62)
              {
                if (!v20)
                  goto LABEL_37;
              }
              else
              {

                if (!v20)
LABEL_37:

              }
              if (!v25)

              objc_autoreleasePoolPop(context);
              if (v60 == ++v26)
              {
                v40 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
                v60 = v40;
                if (!v40)
                {
                  v23 = 1;
                  v24 = v50;
                  goto LABEL_40;
                }
                goto LABEL_13;
              }
            }
          }
          pp_social_highlights_log_handle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v43, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
          }

        }
        else
        {
          pp_social_highlights_log_handle();
          v42 = objc_claimAutoreleasedReturnValue();
          v57 = v42;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
          }
        }
LABEL_57:

        v13 = v44;
      }
      else
      {
        pp_social_highlights_log_handle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
        }
      }

      v16 = v45;
    }
    else
    {
      pp_social_highlights_log_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      v62 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
      }
    }

  }
  else
  {
    pp_social_highlights_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review.", buf, 2u);
    }
  }

}

+ (void)registerLogConsumedByClient
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.FeedbackStreamReviewed", v4, v5);

}

+ (void)registerCountLinks
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LinkStatusGeneration", v4, v5);

}

+ (id)feedbackTypeCountsByHighlightIdentifierInInterval:(double)a3 forTVOS:(BOOL)a4
{
  _BOOL8 v4;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[6];
  _QWORD v22[4];
  id v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "feedbackPublisherWithInterval:includingRemote:", v4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -a3);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__7653;
  v29 = __Block_byref_object_dispose__7654;
  v30 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke;
  v22[3] = &unk_1E7E1CBF0;
  v12 = v10;
  v23 = v12;
  v24 = v4;
  objc_msgSend(v9, "filterWithIsIncluded:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_2;
  v21[3] = &__block_descriptor_48_e67___NSMutableDictionary_24__0__NSMutableDictionary_8__BMStoreEvent_16l;
  v21[4] = a2;
  v21[5] = a1;
  objc_msgSend(v13, "reduceWithInitial:nextPartialResult:", v14, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_187;
  v20[3] = &unk_1E7E1E4A0;
  v20[4] = &v25;
  v17 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_186, v20);

  v18 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v18;
}

+ (void)logLinkExpiredMetricsForHighlight:(id)a3 feedbackCountsByClient:(id)a4 forTVOS:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *context;
  int v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _QWORD v60[2];
  _QWORD v61[4];

  v5 = a5;
  v61[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v49 = a4;
  objc_msgSend(v49, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "_pas_shuffledArrayUsingRng:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1C3BD6630]();
  v60[0] = CFSTR("forTVOS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = CFSTR("isManualHighlight");
  v61[0] = v12;
  v45 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "highlightType") == 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
  v48 = (void *)objc_msgSend(v14, "mutableCopy");

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = v10;
  v50 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v16 = 0;
  if (v50)
  {
    obj = v15;
    v47 = *(_QWORD *)v56;
    v17 = 1;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v56 != v47)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        context = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v49, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E7E59360);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v16 | objc_msgSend(v21, "BOOLValue");

        objc_msgSend(v49, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", &unk_1E7E59378);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntegerValue");

        objc_msgSend(v49, "objectForKeyedSubscript:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E7E59390);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "unsignedIntegerValue");

        objc_msgSend(v49, "objectForKeyedSubscript:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", &unk_1E7E593A8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v29, "unsignedIntegerValue");

        objc_msgSend(v19, "_pas_stringBackedByUTF8CString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("client%u"), v17);
        objc_msgSend(v31, "_pas_stringBackedByUTF8CString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v30, v32);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("countConsumedClient%u"), v17);
        objc_msgSend(v34, "_pas_stringBackedByUTF8CString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v33, v35);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("countDisplayedClient%u"), v17);
        objc_msgSend(v37, "_pas_stringBackedByUTF8CString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v36, v38);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("countActivityClient%u"), v17);
        objc_msgSend(v40, "_pas_stringBackedByUTF8CString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v39, v41);

        v16 = v53;
        ++v17;
        objc_autoreleasePoolPop(context);
      }
      v15 = obj;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v50);
  }

  if ((unint64_t)objc_msgSend(v15, "count") > 3
    || (unint64_t)objc_msgSend(v15, "count") >= 3
    && (objc_msgSend(v15, "containsObject:", &stru_1E7E221D0) & 1) == 0)
  {
    pp_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v42, OS_LOG_TYPE_FAULT, "PPSocialHighlightMetrics: excessive clients found providing feedback for this highlight identifier. This may result in dropped metrics.", buf, 2u);
    }

  }
  v43 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 & 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v43);
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v44, CFSTR("isHidden"));

  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.LinkExpired"), v48, 1);
}

+ (id)sendLinkExpiredMessagesForFeedbackCountsByHighlightId:(id)a3 tvFeedbackCountsByHighlightId:(id)a4 highlights:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  const char *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  v9 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPSocialHighlightMetrics.m"), 903, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlights.count > 0"));

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v11)
  {

LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPSocialHighlightMetrics.m"), 913, CFSTR("This value must not be nil, as the highlight array has contents."));

    v13 = 0;
    goto LABEL_17;
  }
  v12 = v11;
  v31 = a2;
  v32 = a1;
  v13 = 0;
  v14 = *(_QWORD *)v37;
  do
  {
    v15 = 0;
    v35 = v12;
    do
    {
      if (*(_QWORD *)v37 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v16, "highlightIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend(v16, "hasContentCreationSecondsSinceReferenceDate");

        if (v20)
        {
          v21 = v14;
          v22 = v13;
          objc_msgSend(v16, "highlightIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPSocialHighlightMetrics logLinkExpiredMetricsForHighlight:feedbackCountsByClient:forTVOS:](PPSocialHighlightMetrics, "logLinkExpiredMetricsForHighlight:feedbackCountsByClient:forTVOS:", v16, v24, 1);

          objc_msgSend(v16, "highlightIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPSocialHighlightMetrics logLinkExpiredMetricsForHighlight:feedbackCountsByClient:forTVOS:](PPSocialHighlightMetrics, "logLinkExpiredMetricsForHighlight:feedbackCountsByClient:forTVOS:", v16, v26, 0);

          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "contentCreationSecondsSinceReferenceDate");
          objc_msgSend(v27, "numberWithDouble:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v21;
          v12 = v35;
        }
      }
      objc_autoreleasePoolPop(v17);
      ++v15;
    }
    while (v12 != v15);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v12);

  a2 = v31;
  a1 = v32;
  if (!v13)
    goto LABEL_16;
LABEL_17:

  return v13;
}

+ (id)logExpiredLinkStatsWithHighlights:(id)a3 shouldContinueBlock:(id)a4
{
  uint64_t (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = (uint64_t (**)(_QWORD))a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_215);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socialHighlightFeedbackDeletionInterval");
  +[PPSocialHighlightMetrics feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:](PPSocialHighlightMetrics, "feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6[2](v6) & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferred after feedback count generation.", buf, 2u);
    }
    goto LABEL_9;
  }
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "socialHighlightFeedbackDeletionInterval");
  +[PPSocialHighlightMetrics feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:](PPSocialHighlightMetrics, "feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:", 1);
  v11 = objc_claimAutoreleasedReturnValue();

  if ((v6[2](v6) & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferred after tv feedback count generation.", v15, 2u);
    }

LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "sendLinkExpiredMessagesForFeedbackCountsByHighlightId:tvFeedbackCountsByHighlightId:highlights:", v9, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

+ (void)registerExpiredLinkReview
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ExpiredLinkReview", v4, v5);

}

+ (id)_loggableToggleStatus:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    if (a3 != 1)
      return MEMORY[0x1E0C9AAB0];
    v5 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (void)registerDeviceSettingsCollection
{
  xpc_object_t v4;
  _QWORD v5[6];

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SocialHighlightSettingsCollection", v4, v5);

}

+ (id)countIMessagesSentInPastWeekWithShouldContinueBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kPPSentIMessagesLock);
  v5 = (void *)kPPSentIMessagesCount;
  if (!kPPSentIMessagesCount)
  {
    objc_msgSend(a1, "_countSentMessagesInLastWeekMatchingChatType:shouldContinueBlock:", CFSTR("iMessage"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)kPPSentIMessagesCount;
    kPPSentIMessagesCount = v6;

    v5 = (void *)kPPSentIMessagesCount;
  }
  v8 = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&kPPSentIMessagesLock);

  return v8;
}

+ (id)countSMSSentInPastWeekWithShouldContinueBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kPPSentSMSLock);
  v5 = (void *)kPPSentSMSCount;
  if (!kPPSentSMSCount)
  {
    objc_msgSend(a1, "_countSentMessagesInLastWeekMatchingChatType:shouldContinueBlock:", CFSTR("SMS"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)kPPSentSMSCount;
    kPPSentSMSCount = v6;

    v5 = (void *)kPPSentSMSCount;
  }
  v8 = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&kPPSentSMSLock);

  return v8;
}

+ (id)iMessageBucketDescriptionWithShouldContinueBlock:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(a1, "countIMessagesSentInPastWeekWithShouldContinueBlock:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
    v6 = CFSTR("1-3");
    v7 = CFSTR("11+");
    if (v5 < 0xB)
      v7 = CFSTR("4-10");
    if (v5 >= 4)
      v6 = v7;
    if (v5)
      v8 = v6;
    else
      v8 = CFSTR("0");
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

+ (id)SMSBucketDescriptionWithShouldContinueBlock:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(a1, "countSMSSentInPastWeekWithShouldContinueBlock:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
    v6 = CFSTR("1-3");
    v7 = CFSTR("11+");
    if (v5 < 0xB)
      v7 = CFSTR("4-10");
    if (v5 >= 4)
      v6 = v7;
    if (v5)
      v8 = v6;
    else
      v8 = CFSTR("0");
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

+ (id)hasSentIMessageWithShouldContinueBlock:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "countIMessagesSentInPastWeekWithShouldContinueBlock:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "unsignedIntegerValue") != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)hasSentSMSWithShouldContinueBlock:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "countSMSSentInPastWeekWithShouldContinueBlock:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "unsignedIntegerValue") != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char **v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD aBlock[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v27 = &v28;
  v5 = v3;
  v26 = v5;
  v19 = v4;
  v20 = 3221225472;
  v21 = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_3;
  v22 = &unk_1E7E18338;
  v6 = _Block_copy(aBlock);
  v7 = *(_QWORD *)(a1 + 32);
  v23 = v6;
  v24 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SocialHighlightSettingsCollection", ", buf, 2u);
  }

  v8[2](v8);
  pp_maintenance_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = *((unsigned __int8 *)v29 + 24);
    *(_DWORD *)buf = 67109120;
    v33 = v15;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v10, "SocialHighlightSettingsCollection", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v29 + 24))
    v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v16);
  if (*((_BYTE *)v29 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPSocialHighlightMetrics.m"), 1110, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: SocialHighlightSettingsCollection: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v28, 8);

}

uint64_t __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v2, "automaticSharingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("automaticSharingEnabled"));
    objc_msgSend(*(id *)(a1 + 40), "iMessageBucketDescriptionWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "SMSBucketDescriptionWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
      v6 = objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "hasSentIMessageWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
        v7 = objc_claimAutoreleasedReturnValue();
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "hasSentSMSWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
          v8 = objc_claimAutoreleasedReturnValue();
          if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
          {
            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70DB0], 0));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("tvAutomaticSharing"));

            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70D88], 0));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("newsAutomaticSharing"));

            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70D80], 0));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("musicAutomaticSharing"));

            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70D98], 0));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("podcastsAutomaticSharing"));

            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70D90], 0));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("photosAutomaticSharing"));

            +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", objc_msgSend(v2, "automaticSharingEnabledForClient:error:", *MEMORY[0x1E0D70DA0], 0));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("safariAutomaticSharing"));

            if (v5)
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("iMesssageBucket"));
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("iMesssageBucket"));

            }
            if (v6)
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SMSBucket"));
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("SMSBucket"));

            }
            if (v7)
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("activeiMessageUser"));
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("activeiMessageUser"));

            }
            if (v8)
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("activeSMSUser"));
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("activeSMSUser"));

            }
            if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
              +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.SettingsStatus"), v4, 1);
          }
          else
          {
            pp_social_highlights_log_handle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v20, 2u);
            }

          }
        }
        else
        {
          pp_social_highlights_log_handle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v21, 2u);
          }
        }

      }
      else
      {
        pp_social_highlights_log_handle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v22, 2u);
        }
      }

    }
    else
    {
      pp_social_highlights_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collectionduring message counts fetching.", buf, 2u);
      }
    }

  }
}

void __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ExpiredLinkReview", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ExpiredLinkReview", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPSocialHighlightMetrics.m"), 1023, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ExpiredLinkReview: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  double v31;
  __int128 v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v28 = 0;
  objc_msgSend(v2, "autoDonatingChatsWithShouldContinueBlock:error:", v3, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;
  v29 = v5;
  if (v4)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    {
      *(_QWORD *)&v32 = 0;
      *((_QWORD *)&v32 + 1) = &v32;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__7653;
      v35 = __Block_byref_object_dispose__7654;
      v36 = 0;
      +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_218;
      v27[3] = &unk_1E7E1DEE8;
      v27[4] = &v32;
      objc_msgSend(v6, "readTransactionWithClient:block:", 6, v27);

      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
      {
        pp_social_highlights_log_handle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link review after last date.", buf, 2u);
        }
        goto LABEL_26;
      }
      v8 = objc_alloc(MEMORY[0x1E0C99D68]);
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "socialHighlightFeedbackDeletionInterval");
      v11 = objc_msgSend(v8, "initWithTimeIntervalSinceNow:", -v10);

      v12 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 40), "doubleValue");
      v13 = (void *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
      objc_msgSend(v13, "timeIntervalSinceNow");
      v15 = v14;

      if (v15 > 0.0)
      {
        pp_social_highlights_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v31 = -v15;
          _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: lastProcessedTimeSinceNow is in the future! %f", buf, 0xCu);
        }
        goto LABEL_25;
      }
      objc_msgSend(v2, "allSupportedHighlightsForAutoDonatingChats:error:", v4, &v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_223;
      v25[3] = &unk_1E7E1E678;
      v26 = v11;
      objc_msgSend(v19, "_pas_filteredArrayWithTest:", v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "count"))
      {
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
        {
          +[PPSocialHighlightMetrics logExpiredLinkStatsWithHighlights:shouldContinueBlock:](PPSocialHighlightMetrics, "logExpiredLinkStatsWithHighlights:shouldContinueBlock:", v20, *(_QWORD *)(a1 + 32));
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_storeStrong((id *)(*((_QWORD *)&v32 + 1) + 40), v21);
            +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = v7;
            v24[1] = 3221225472;
            v24[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_225;
            v24[3] = &unk_1E7E18450;
            v24[4] = &v32;
            objc_msgSend(v22, "writeTransactionWithClient:block:", 6, v24);

          }
          goto LABEL_24;
        }
        pp_social_highlights_log_handle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v23 = "PPSocialHighlightMetrics: deferred while constructing highlight array";
          goto LABEL_23;
        }
      }
      else
      {
        pp_social_highlights_log_handle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v23 = "PPSocialHighlightMetrics: no highlights have expired.";
LABEL_23:
          _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
        }
      }
LABEL_24:

      v16 = v26;
LABEL_25:

LABEL_26:
      _Block_object_dispose(&v32, 8);

      goto LABEL_27;
    }
    pp_social_highlights_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link review after fetching chats.", (uint8_t *)&v32, 2u);
    }
  }
  else
  {
    v17 = v5;
    pp_social_highlights_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v32) = 138412290;
      *(_QWORD *)((char *)&v32 + 4) = v17;
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chats: %@", (uint8_t *)&v32, 0xCu);
    }
  }

LABEL_27:
}

void __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_218(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[PPSQLKVStore numberForKey:transaction:](PPSQLKVStore, "numberForKey:transaction:", CFSTR("lastProcessedSocialHighlightLinkDate"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

BOOL __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_223(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0D70D00];
  objc_msgSend(a2, "contentCreationSecondsSinceReferenceDate");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return objc_msgSend(v3, "compareDouble:withDouble:", v5, v6) == -1;
}

uint64_t __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_225(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore setNumber:forKey:transaction:](PPSQLKVStore, "setNumber:forKey:transaction:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("lastProcessedSocialHighlightLinkDate"), a2);
}

uint64_t __82__PPSocialHighlightMetrics_logExpiredLinkStatsWithHighlights_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "contentCreationSecondsSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v5, "contentCreationSecondsSinceReferenceDate");
  v9 = v8;

  return objc_msgSend(v4, "compareDouble:withDouble:", v7, v9);
}

uint64_t __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "feedbackType");

    if (v9 == 2)
    {
      objc_msgSend(v3, "eventBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "feedbackCreationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", *(_QWORD *)(a1 + 32)) != -1;
    }
    else
    {
      v13 = *(unsigned __int8 *)(a1 + 40);
      objc_msgSend(v3, "eventBody");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v13)
      {
        objc_msgSend(v14, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D70DB8]);
      }
      else
      {
        objc_msgSend(v14, "highlight");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "isPrimary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
          v15 = (void *)MEMORY[0x1E0C9AAB0];
        if (objc_msgSend(v15, "BOOLValue"))
        {
          objc_msgSend(v3, "eventBody");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clientIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v18 != 0;

        }
        else
        {
          v12 = 0;
        }

      }
    }

  }
  else
  {
    v12 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v12;
}

id __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  void *context;

  v5 = a2;
  v6 = a3;
  context = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highlightIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E7E221D0;
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPSocialHighlightMetrics.m"), 847, CFSTR("Highlight identifier has been checked in the filter clause to be nonnull"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v9);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v14);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "eventBody");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "feedbackType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  v28 = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28 + 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v27, "eventBody");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "feedbackType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v34);

  v35 = v5;
  objc_autoreleasePoolPop(context);

  return v35;
}

void __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_187(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    pp_social_highlights_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: failed to collect highlight feedback counts: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

void __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char **v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD aBlock[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v27 = &v28;
  v5 = v3;
  v26 = v5;
  v19 = v4;
  v20 = 3221225472;
  v21 = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_3;
  v22 = &unk_1E7E18338;
  v6 = _Block_copy(aBlock);
  v7 = *(_QWORD *)(a1 + 32);
  v23 = v6;
  v24 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "LinkStatusGeneration", ", buf, 2u);
  }

  v8[2](v8);
  pp_maintenance_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = *((unsigned __int8 *)v29 + 24);
    *(_DWORD *)buf = 67109120;
    v33 = v15;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v10, "LinkStatusGeneration", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v29 + 24))
    v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v16);
  if (*((_BYTE *)v29 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPSocialHighlightMetrics.m"), 814, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: LinkStatusGeneration: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v28, 8);

}

uint64_t __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_3(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  unsigned int v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *context;
  void *contexta;
  unint64_t v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  NSObject *log;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id obj;
  id location;
  _QWORD v113[15];
  _QWORD v114[15];
  uint8_t v115[128];
  uint8_t buf[4];
  id v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  id v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = +[PPSocialHighlightMetrics countAllLinksReceivedInMessages](PPSocialHighlightMetrics, "countAllLinksReceivedInMessages");
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats after messages count.", buf, 2u);
    }

    goto LABEL_97;
  }
  obj = 0;
  location = 0;
  objc_msgSend(v2, "autoDonatingChatsWithShouldContinueBlock:error:", *(_QWORD *)(a1 + 32), &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&location, obj);
  if (!v4)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v117 = location;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chats (potentially deferred). %@", buf, 0xCu);
    }
    goto LABEL_96;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats after fetching autodonating chats.", buf, 2u);
    }
    goto LABEL_96;
  }
  objc_msgSend(v2, "allSupportedHighlightsForAutoDonatingChats:error:", v4, &location);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    pp_social_highlights_log_handle();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v117 = location;
      _os_log_error_impl(&dword_1C392E000, log, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch highlights, will retry at a later date: %@", buf, 0xCu);
    }
    goto LABEL_95;
  }
  v94 = a1;
  v91 = v3;
  log = objc_opt_new();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v93 = v5;
  v6 = v5;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v108 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend(v11, "highlightIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "highlightIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v11, "highlightIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v15, v16);

          }
          objc_msgSend(v11, "attributionIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v11, "highlightIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "attributionIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

          }
        }
      }
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
    }
    while (v8);
  }

  v21 = v94;
  +[PPSocialHighlightMetrics allHighlightIdentifiersReceivedWithShouldContinueBlock:](PPSocialHighlightMetrics, "allHighlightIdentifiersReceivedWithShouldContinueBlock:", *(_QWORD *)(v94 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    pp_social_highlights_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Unable to fetch, or requested to defer fetching of highlight identifiers.", buf, 2u);
    }
    v5 = v93;
    goto LABEL_94;
  }
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSObject allKeys](log, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "initWithArray:", v24);

  objc_msgSend(v22, "minusSet:", v25);
  v96 = (void *)objc_opt_new();
  v26 = objc_msgSend(v22, "count");
  objc_msgSend(*(id *)(v94 + 40), "iMessageBucketDescriptionWithShouldContinueBlock:", *(_QWORD *)(v94 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(v94 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    v5 = v93;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    goto LABEL_93;
  }
  v72 = v26;
  objc_msgSend(*(id *)(v94 + 40), "SMSBucketDescriptionWithShouldContinueBlock:", *(_QWORD *)(v94 + 32));
  v28 = objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(v94 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    v5 = v93;
    goto LABEL_92;
  }
  objc_msgSend(*(id *)(v94 + 40), "hasSentIMessageWithShouldContinueBlock:", *(_QWORD *)(v94 + 32));
  v74 = objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(v94 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v53 = objc_claimAutoreleasedReturnValue();
    v5 = v93;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v53, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    v52 = v74;
    goto LABEL_91;
  }
  objc_msgSend(*(id *)(v94 + 40), "hasSentSMSWithShouldContinueBlock:", *(_QWORD *)(v94 + 32));
  v69 = objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(v94 + 32) + 16))() & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v54, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }

LABEL_89:
    v5 = v93;
    goto LABEL_90;
  }
  v67 = v28;
  v68 = v27;
  v66 = v22;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v73 = v6;
  v71 = v4;
  v80 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  if (!v80)
  {
    v75 = 0;
    goto LABEL_69;
  }
  v75 = 0;
  v77 = v25;
  v78 = *(_QWORD *)v104;
  v70 = v2;
  while (2)
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v104 != v78)
        objc_enumerationMutation(v73);
      v87 = v33;
      v34 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v33);
      context = (void *)MEMORY[0x1C3BD6630]();
      if (((*(uint64_t (**)(void))(*(_QWORD *)(v21 + 32) + 16))() & 1) == 0)
      {
        pp_social_highlights_log_handle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v55, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: link stats deferring.", buf, 2u);
        }
        goto LABEL_88;
      }
      objc_msgSend(v34, "highlightIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_40;
      v83 = v31;
      objc_msgSend(v34, "highlightIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v37, "count");

      objc_msgSend(v34, "highlightIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v85);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "allObjects");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = location;
      objc_msgSend(v2, "attributionsForIdentifiers:error:", v39, &v102);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&location, v102);
      objc_msgSend(v40, "allValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        pp_social_highlights_log_handle();
        v55 = objc_claimAutoreleasedReturnValue();
        v25 = v77;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v34, "highlightIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "highlightIdentifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v117 = v63;
          v118 = 2112;
          v119 = v65;
          v120 = 2112;
          v121 = location;
          _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch attributions for highlight: %@, attributions %@, will try again at a later date: %@", buf, 0x20u);

        }
LABEL_88:
        v22 = v66;
        v28 = v67;
        v27 = v68;

        objc_autoreleasePoolPop(context);
        goto LABEL_89;
      }
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
      v25 = v77;
      if (v43)
      {
        v44 = v43;
        v45 = 0;
        v46 = *(_QWORD *)v99;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v99 != v46)
              objc_enumerationMutation(v42);
            v48 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
            objc_msgSend(v48, "conversationIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "addObject:", v49);

            v50 = objc_msgSend(v48, "isStarred");
            v29 += v50;
            v30 += v50 ^ 1;
            v45 |= v50;
            v32 += objc_msgSend(v48, "isFromMe");
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
        }
        while (v44);

        v25 = v77;
        v75 += v45 & 1;
        v2 = v70;
        v4 = v71;
      }
      else
      {

      }
      v31 = v82 + v83;

      v21 = v94;
LABEL_40:
      objc_autoreleasePoolPop(context);
      v33 = v87 + 1;
    }
    while (v87 + 1 != v80);
    v80 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
    if (v80)
      continue;
    break;
  }
LABEL_69:

  v113[0] = CFSTR("urlsInMessages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v91);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v95;
  v113[1] = CFSTR("manuallyHighlightedLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v92;
  v113[2] = CFSTR("automaticallyHighlightedLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = contexta;
  v113[3] = CFSTR("totalLinkCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v114[3] = v88;
  v113[4] = CFSTR("uniqueLinkCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v73, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v114[4] = v86;
  v113[5] = CFSTR("uniqueChats");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v96, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v114[5] = v84;
  v113[6] = CFSTR("autoDonatingChats");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v114[6] = v81;
  v113[7] = CFSTR("uniqueManuallyHighlightedLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v75);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v114[7] = v79;
  v113[8] = CFSTR("outboundLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v114[8] = v76;
  v113[9] = CFSTR("automaticSyndicationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v2, "automaticSharingEnabled"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v114[9] = v56;
  v113[10] = CFSTR("unsupportedLinkCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v72);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v114[10] = v57;
  v113[11] = CFSTR("iMesssageBucket");
  v58 = v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[11] = v58;
  v113[12] = CFSTR("SMSBucket");
  v59 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[12] = v59;
  v113[13] = CFSTR("activeiMessageUser");
  v60 = (void *)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[13] = v60;
  v113[14] = CFSTR("activeSMSUser");
  v61 = (void *)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114[14] = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 15);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.LinkStatusGenerated"), v62, 1);

  if (!v69)
  if (!v74)

  if (!v67)
  if (!v68)

  v4 = v71;
  v5 = v93;
  v22 = v66;
  v28 = v67;
  v27 = v68;
LABEL_90:
  v52 = v74;
  v53 = v69;
LABEL_91:

LABEL_92:
LABEL_93:

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

}

void __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeedbackStreamReviewed", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "FeedbackStreamReviewed", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPSocialHighlightMetrics.m"), 667, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: FeedbackStreamReviewed: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

uint64_t __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_3(uint64_t a1)
{
  return +[PPSocialHighlightMetrics logConsumptionByClientWithShouldContinueBlock:](PPSocialHighlightMetrics, "logConsumptionByClientWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "feedbackType");

  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 2)
  {
    objc_msgSend(v7, "feedbackCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 32)) != -1;
    v11 = v8;
  }
  else
  {
    objc_msgSend(v7, "highlight");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "isPrimary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v11, "isPrimary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "BOOLValue");

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  objc_autoreleasePoolPop(v4);

  return v10;
}

uint64_t __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E7E221D0;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "eventBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "feedbackType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  objc_msgSend(v3, "eventBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "feedbackType") == 1)
  {
    v17 = *(unsigned __int8 *)(a1 + 48);

    if (!v17)
      +[PPSocialHighlightMetrics _recordTipsContentEvent:](PPSocialHighlightMetrics, "_recordTipsContentEvent:", CFSTR("com.apple.proactive.PersonalizationPortrait.shared-with-you-content-consumed"));
  }
  else
  {

  }
  v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v4);
  return v18;
}

void __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    pp_social_highlights_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: failed to complete traversal of local feedback stream: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

void __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ClientLinkStatus", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ClientLinkStatus", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPSocialHighlightMetrics.m"), 554, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ClientLinkStatus: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  __int128 v54;
  void *v55;
  void *context;
  void *contexta;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  NSObject *v77;
  NSObject *v78;
  id v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[7];
  _QWORD v86[7];
  uint8_t buf[4];
  const __CFString *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _QWORD v91[2];
  _QWORD v92[7];

  v92[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x1E0D70D88];
  v92[0] = *MEMORY[0x1E0D70DB0];
  v92[1] = v3;
  v4 = *MEMORY[0x1E0D70D98];
  v92[2] = *MEMORY[0x1E0D70DA0];
  v92[3] = v4;
  v92[4] = *MEMORY[0x1E0D70D80];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = CFSTR("internal");
  v91[1] = CFSTR("*");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (!v9)
    goto LABEL_61;
  v11 = v9;
  v68 = *(_QWORD *)v82;
  v66 = *MEMORY[0x1E0D70F10];
  *(_QWORD *)&v10 = 138412290;
  v54 = v10;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v82 != v68)
      objc_enumerationMutation(v8);
    v71 = v12;
    v13 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v12);
    v14 = (void *)MEMORY[0x1C3BD6630]();
    v15 = objc_msgSend(v2, "automaticSharingEnabledForClient:error:", v13, 0);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
      goto LABEL_60;
    if (v15 != 2
      || (objc_msgSend(v2, "autoDonatingChatsWithShouldContinueBlock:error:", *(_QWORD *)(a1 + 32), 0),
          (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      pp_social_highlights_log_handle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v51, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chat identifiers", buf, 2u);
      }
      goto LABEL_59;
    }
    v17 = v16;
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
      break;
    objc_msgSend(v2, "sharedContentForClient:variant:applicationIdentifiers:limit:autoDonatingChatIdentifiers:error:", v13, v66, v7, -1, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v18;
    v70 = v14;
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    {
      v65 = v13;
      v67 = v17;
      objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_126);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "attributionsForIdentifiers:error:", v19, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
      {
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_127;
        v76[3] = &unk_1E7E18380;
        v64 = v20;
        v77 = v20;
        v78 = v67;
        v79 = v7;
        v80 = v65;
        objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v76);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
        {
          v60 = v11;
          v61 = a1;
          v62 = v8;
          v63 = v7;
          v58 = v2;
          context = (void *)objc_msgSend(v21, "count");
          v22 = (void *)objc_opt_new();
          v23 = (void *)objc_opt_new();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v59 = v21;
          v24 = v21;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
          if (v25)
          {
            v26 = v25;
            v27 = 0;
            v28 = 0;
            v29 = *(_QWORD *)v73;
            while (1)
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v73 != v29)
                  objc_enumerationMutation(v24);
                v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                if (objc_msgSend(v31, "hasHighlightIdentifier", v54))
                {
                  if (objc_msgSend(v31, "highlightType") == 2)
                  {
                    objc_msgSend(v31, "highlightIdentifier");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = v22;
                  }
                  else
                  {
                    if (objc_msgSend(v31, "highlightType") != 1)
                      goto LABEL_24;
                    objc_msgSend(v31, "highlightIdentifier");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = v23;
                  }
                  objc_msgSend(v33, "addObject:", v32);

                }
LABEL_24:
                if (objc_msgSend(v31, "highlightType") == 2)
                {
                  ++v28;
                }
                else if (objc_msgSend(v31, "highlightType") == 1)
                {
                  ++v27;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
              if (!v26)
                goto LABEL_39;
            }
          }
          v27 = 0;
          v28 = 0;
LABEL_39:

          if (v27 | v28
            && (+[PPSettings sharedInstance](PPSettings, "sharedInstance"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v37 = objc_msgSend(v36, "hasWrittenSharedWithYouContentAvailable"),
                v36,
                (v37 & 1) == 0))
          {
            +[PPSocialHighlightMetrics _recordTipsContentEvent:](PPSocialHighlightMetrics, "_recordTipsContentEvent:", CFSTR("com.apple.proactive.PersonalizationPortrait.shared-with-you-content-available"));
            v39 = context;
            v2 = v58;
          }
          else
          {
            pp_social_highlights_log_handle();
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = context;
            v2 = v58;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              +[PPSettings sharedInstance](PPSettings, "sharedInstance");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "hasWrittenSharedWithYouContentAvailable");
              v42 = CFSTR("NO");
              if (v41)
                v42 = CFSTR("YES");
              *(_DWORD *)buf = v54;
              v88 = v42;
              _os_log_impl(&dword_1C392E000, v38, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ineligible to update tips shared content. Has written previously: %@", buf, 0xCu);

            }
          }
          contexta = (void *)MEMORY[0x1C3BD6630]();
          v85[0] = CFSTR("automaticHighlights");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = v55;
          v85[1] = CFSTR("uniqueAutomaticHighlights");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v86[1] = v43;
          v85[2] = CFSTR("manualHighlights");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v86[2] = v44;
          v85[3] = CFSTR("uniqueManualHighlights");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v86[3] = v45;
          v85[4] = CFSTR("totalHighlights");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v86[4] = v46;
          v85[5] = CFSTR("uniqueHighlights");
          v47 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "setByAddingObjectsFromSet:", v22);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v85[6] = CFSTR("clientIdentifier");
          v86[5] = v49;
          v86[6] = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 7);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(contexta);
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.ClientLinkStatus"), v50, 1);

          v34 = 0;
          v8 = v62;
          v7 = v63;
          v11 = v60;
          a1 = v61;
          v21 = v59;
        }
        else
        {
          v34 = 1;
        }

        v35 = v77;
        v20 = v64;
      }
      else
      {
        pp_social_highlights_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring after fetching attributions.", buf, 2u);
        }
        v34 = 1;
      }

      v17 = v67;
    }
    else
    {
      pp_social_highlights_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring after fetching searchable items.", buf, 2u);
      }
      v34 = 1;
    }

    objc_autoreleasePoolPop(v70);
    if (v34)
      goto LABEL_61;
    v12 = v71 + 1;
    if (v71 + 1 == v11)
    {
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      if (!v11)
        goto LABEL_61;
      goto LABEL_3;
    }
  }
  v52 = v17;
  pp_social_highlights_log_handle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v53, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring client link status after fetching autodonating chats.", buf, 2u);
  }

  v51 = v52;
LABEL_59:

LABEL_60:
  objc_autoreleasePoolPop(v14);
LABEL_61:

}

id __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_127(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)a1[4];
    objc_msgSend(v3, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:](PPRankableSocialHighlightUtils, "rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:", v3, v9, a1[5], a1[6], a1[7], *MEMORY[0x1E0D70F10]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __52__PPSocialHighlightMetrics__recordTipsContentEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02618]), "initWithIdentifier:bundleID:context:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.proactive.PersonalizationPortrait"), 0);
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Discoverability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Signals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v2);
  pp_social_highlights_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: wrote tips content event %@", (uint8_t *)&v9, 0xCu);
  }

}

void __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char **v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD aBlock[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v27 = &v28;
  v5 = v3;
  v26 = v5;
  v6 = _Block_copy(aBlock);
  v19 = v4;
  v20 = 3221225472;
  v21 = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_3;
  v22 = &unk_1E7E18338;
  v24 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UnsupportedClient", ", buf, 2u);
  }

  v8[2](v8);
  pp_maintenance_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = *((unsigned __int8 *)v29 + 24);
    *(_DWORD *)buf = 67109120;
    v33 = v15;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v10, "UnsupportedClient", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v29 + 24))
    v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v16);
  if (*((_BYTE *)v29 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPSocialHighlightMetrics.m"), 425, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: UnsupportedClient: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v28, 8);

}

uint64_t __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[16];
  const __CFString *v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "unsupportedClientsFromPastDayWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_shuffledArrayUsingRng:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v5)
    {
      v6 = v5;
      v12 = v3;
      v7 = *(_QWORD *)v14;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
          break;
        if (objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.01))
        {
          v10 = (void *)MEMORY[0x1C3BD6630]();
          v18 = CFSTR("bundleId");
          v19 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.UnsupportedLinkReceived"), v11, 1);

          objc_autoreleasePoolPop(v10);
        }
        if (v6 == ++v8)
        {
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
      v3 = v12;
    }
  }
  else
  {
    pp_social_highlights_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: unable to, or deferred from fetching unsupported clients.", buf, 2u);
    }
  }

}

uint64_t __59__PPSocialHighlightMetrics_countAllLinksReceivedInMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke_101(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:](PPRankableSocialHighlightUtils, "rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:", v3, v9, v10, MEMORY[0x1E0C9AA60], &stru_1E7E221D0, *MEMORY[0x1E0D70F10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __76__PPSocialHighlightMetrics__queryLinksWithFetchAttributes_interval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke_86(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_4()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_3()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_2()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke()
{
  return 1;
}

@end
