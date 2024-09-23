@implementation PPSocialHighlightStorage

- (id)autoDonatingChatsWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v28;
  uint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  __int128 *p_buf;
  _QWORD v33[4];
  id v34;
  uint8_t v35[4];
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(_QWORD))a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setReason:", CFSTR("SHConversations"));
  objc_msgSend(v7, "setDisableBlockingOnIndex:", 1);
  v44[0] = *MEMORY[0x1E0CA5F30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchAttributes:", v8);

  objc_msgSend(v7, "setLowPriority:", qos_class_self() < QOS_CLASS_USER_INITIATED);
  objc_msgSend(v7, "setReason:", CFSTR("reason:PPSocialHighlightStore-1; code:1"));
  v43 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtectionClasses:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "socialHighlightDecayInterval");
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("kMDItemLastUsedDate>=$time.now(-%.f)"), v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ && %@"), CFSTR("com_apple_mobilesms_isChatAutoDonating=1"), v13);
  pp_social_highlights_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Performing CoreSpotlight automatic donation query: %@", (uint8_t *)&buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v14, v7);
  v42 = *MEMORY[0x1E0D70E28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBundleIDs:", v17);

  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke;
  v33[3] = &unk_1E7E1DF28;
  v19 = v6;
  v34 = v19;
  objc_msgSend(v16, "setFoundItemsHandler:", v33);
  v20 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__20106;
  v40 = __Block_byref_object_dispose__20107;
  v41 = 0;
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke_235;
  v30[3] = &unk_1E7E1DF50;
  p_buf = &buf;
  v21 = v20;
  v31 = v21;
  objc_msgSend(v16, "setCompletionHandler:", v30);
  objc_msgSend(v16, "start");
  if (v5)
  {
    while (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v21, 1.0) == 1)
    {
      if ((v5[2](v5) & 1) == 0)
      {
        pp_social_highlights_log_handle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMaintenance: deferring autodonating chats", v35, 2u);
        }

        objc_msgSend(v16, "cancel");
        goto LABEL_9;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v21);
  }
  pp_social_highlights_log_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v19, "count");
    *(_DWORD *)v35 = 134217984;
    v36 = v25;
    _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight automatic donation query result count: %tu", v35, 0xCu);
  }

  if (objc_msgSend(v19, "count") || !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    pp_private_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v35 = 138412290;
      v36 = (uint64_t)v19;
      _os_log_debug_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: CoreSpotlight automatic donation query results: %@", v35, 0xCu);
    }

    v23 = v19;
  }
  else
  {
    pp_social_highlights_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v35 = 138412290;
      v36 = v29;
      _os_log_error_impl(&dword_1C392E000, v28, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight automatic donation query error: %@", v35, 0xCu);
    }

    if (a4)
    {
      v23 = 0;
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    }
    else
    {
LABEL_9:
      v23 = 0;
    }
  }

  _Block_object_dispose(&buf, 8);
  return v23;
}

id __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (id)sharedContentForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 autoDonatingChatIdentifiers:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  int v58;
  _QWORD v59[4];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  pp_social_highlights_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  pp_social_highlights_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Storage.sharedContentFromChats", ", buf, 2u);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "socialHighlightDecayInterval");
  -[PPSocialHighlightStorage sharedContentFromChats:dateRange:applicationIdentifiers:error:](self, "sharedContentFromChats:dateRange:applicationIdentifiers:error:", v17, v16, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  pp_social_highlights_signpost_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v25, OS_SIGNPOST_INTERVAL_END, v19, "Storage.sharedContentFromChats", " enableTelemetry=YES ", buf, 2u);
  }

  v60[0] = v14;
  v59[0] = CFSTR("client");
  v59[1] = CFSTR("limit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v26;
  v60[2] = &unk_1E7E5A5A8;
  v59[2] = CFSTR("maximumResultCount");
  v59[3] = CFSTR("spotlightResultCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
  v28 = objc_claimAutoreleasedReturnValue();

  v46 = v28;
  PLLogRegisteredEvent();
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "plistForFactorName:namespaceName:", CFSTR("social_highlight_blocked_hosts.plist"), CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("blockedHostSuffixes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v28) = objc_opt_isKindOfClass();

  if ((v28 & 1) != 0)
  {
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("blockedHostSuffixes"), v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = (void *)MEMORY[0x1E0C9AA60];
  }
  v33 = objc_msgSend(v16, "containsObject:", CFSTR("*"), v46);
  v34 = objc_msgSend(v16, "containsObject:", CFSTR("collaborations"));
  pp_social_highlights_log_handle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v56 = v33;
    v57 = 1024;
    v58 = v34;
    _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: kPPAccessWildCard: %u, kPPAllCollaborations: %u entitlements detected", buf, 0xEu);
  }

  -[PPSocialHighlightStorage _screenTimeConversation](self, "_screenTimeConversation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_new();
  -[PPSocialHighlightStorageUtilities clearCache](self->_socialHighlightStorageUtils, "clearCache");
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __122__PPSocialHighlightStorage_sharedContentForClient_variant_applicationIdentifiers_limit_autoDonatingChatIdentifiers_error___block_invoke;
  v48[3] = &unk_1E7E1E250;
  v48[4] = self;
  v49 = v16;
  v50 = v14;
  v51 = v32;
  v52 = v37;
  v53 = v15;
  v54 = v36;
  v38 = v36;
  v39 = v15;
  v40 = v37;
  v41 = v32;
  v42 = v14;
  v43 = v16;
  objc_msgSend(v23, "_pas_filteredArrayWithTest:", v48);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage freezeAppLinksCache](self, "freezeAppLinksCache");

  return v44;
}

- (id)sharedContentFromChats:(id)a3 dateRange:(double)a4 applicationIdentifiers:(id)a5 error:(id *)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  dispatch_semaphore_t v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v45;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  NSObject *v56;
  _BYTE *v57;
  _QWORD v58[4];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t v66[4];
  uint64_t v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  _QWORD v73[5];
  _QWORD v74[25];
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v52 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setReason:", CFSTR("SHContent"));
  objc_msgSend(v9, "setDisableBlockingOnIndex:", 1);
  v10 = objc_msgSend(&unk_1E7E5A5A8, "integerValue");
  objc_msgSend(v9, "setMaximumBatchSize:", 2 * v10);
  objc_msgSend(v9, "setReason:", CFSTR("reason:PPSocialHighlightStore-2; code:1"));
  v75[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProtectionClasses:", v11);

  v12 = *MEMORY[0x1E0CA6970];
  v74[0] = *MEMORY[0x1E0CA6978];
  v74[1] = v12;
  v13 = *MEMORY[0x1E0CA6010];
  v74[2] = *MEMORY[0x1E0CA60D0];
  v74[3] = v13;
  v14 = *MEMORY[0x1E0CA6028];
  v74[4] = *MEMORY[0x1E0CA6018];
  v74[5] = v14;
  v15 = *MEMORY[0x1E0CA67C0];
  v74[6] = *MEMORY[0x1E0CA5F28];
  v74[7] = v15;
  v16 = *MEMORY[0x1E0CA6408];
  v74[8] = *MEMORY[0x1E0CA6158];
  v74[9] = v16;
  v17 = *MEMORY[0x1E0CA6320];
  v74[10] = *MEMORY[0x1E0CA60F8];
  v74[11] = v17;
  v18 = *MEMORY[0x1E0CA6310];
  v74[12] = *MEMORY[0x1E0CA68B8];
  v74[13] = v18;
  v74[14] = CFSTR("com_apple_mobilesms_highlightedContentServerDate");
  v74[15] = CFSTR("com_apple_mobilesms_syndicationContentType");
  v19 = *MEMORY[0x1E0CA6900];
  v74[16] = CFSTR("com_apple_mobilesms_collaborationIdentifier");
  v74[17] = v19;
  v74[18] = *MEMORY[0x1E0CA6338];
  v74[19] = CFSTR("com_apple_mobilesms_resolvedURL");
  v74[20] = CFSTR("com_apple_mobilesms_fromMe");
  v74[21] = CFSTR("com_apple_mobilesms_ckBundleIDs");
  v74[22] = CFSTR("com_apple_mobilesms_localIdentityProof");
  v74[23] = CFSTR("com_apple_mobilesms_localIdentity");
  v74[24] = CFSTR("com_apple_mobilesms_handleToIdentityMap");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchAttributes:", v20);

  objc_msgSend(v9, "setLowPriority:", qos_class_self() < QOS_CLASS_USER_INITIATED);
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v50 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@=\"%@\"), *MEMORY[0x1E0CA6488], CFSTR("lnk"));
  LODWORD(self) = -[PPSocialHighlightStorage _isCollaborationEntitlementPresentForApplicationIdentifiers:](self, "_isCollaborationEntitlementPresentForApplicationIdentifiers:", v52);
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  if ((_DWORD)self)
    v23 = CFSTR("%@=1");
  else
    v23 = CFSTR("%@!=2");
  v49 = (void *)objc_msgSend(v22, "initWithFormat:", v23, CFSTR("com_apple_mobilesms_syndicationContentType"));
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ != 0 && (InRange(com_apple_mobilesms_isHighlightedContent, 1, 2) || com_apple_mobilesms_isHighlightedContent=8)"), v16);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(%@ || %@)"), CFSTR("InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)"), v51);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("kMDItemContentCreationDate>=$time.now(-%.f)"), *(_QWORD *)&a4);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v26 = (void *)MEMORY[0x1C3BD6630]();
  v73[0] = v50;
  v73[1] = v24;
  v73[2] = CFSTR("URL=*");
  v73[3] = v48;
  v73[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_pas_componentsJoinedByString:", CFSTR(" && "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  pp_social_highlights_log_handle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v9, "lowPriority");
    v31 = CFSTR("high");
    if (v30)
      v31 = CFSTR("low");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v28;
    _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Performing CoreSpotlight highlight query (%@ priority): %@", buf, 0x16u);
  }

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v28, v9);
  v72 = *MEMORY[0x1E0D70E28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBundleIDs:", v33);

  v34 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke;
  v58[3] = &unk_1E7E1DFE0;
  v60 = &v62;
  v35 = v25;
  v59 = v35;
  v61 = v10;
  objc_msgSend(v32, "setFoundItemsHandler:", v58);
  v36 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v69 = __Block_byref_object_copy__20106;
  v70 = __Block_byref_object_dispose__20107;
  v71 = 0;
  v55[0] = v34;
  v55[1] = 3221225472;
  v55[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_3;
  v55[3] = &unk_1E7E1DF50;
  v57 = buf;
  v37 = v36;
  v56 = v37;
  objc_msgSend(v32, "setCompletionHandler:", v55);
  objc_msgSend(v32, "start");
  dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
  if (v63[3] || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v38 = 1;
  }
  else
  {
    pp_social_highlights_log_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v45 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v66 = 138412290;
      v67 = v45;
      _os_log_error_impl(&dword_1C392E000, v39, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight highlight query error: %@", v66, 0xCu);
    }

    if (a6)
      objc_storeStrong(a6, *(id *)(*(_QWORD *)&buf[8] + 40));
    objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
    v38 = 0;
  }

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(v26);
  if (v38)
  {
    v53[0] = v34;
    v53[1] = 3221225472;
    v53[2] = __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_271;
    v53[3] = &unk_1E7E1E008;
    v54 = v47;
    objc_msgSend(v35, "_pas_filteredArrayWithTest:", v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    pp_social_highlights_log_handle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v63[3];
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight query result count: %tu returning top %tu", buf, 0x16u);
    }

    pp_social_highlights_log_handle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl(&dword_1C392E000, v43, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Returned results: %@", buf, 0xCu);
    }

  }
  else
  {
    v40 = (void *)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v62, 8);

  return v40;
}

- (void)freezeAppLinksCache
{
  _PASLock *lsAppLinkCache;
  _QWORD v3[6];

  lsAppLinkCache = self->_lsAppLinkCache;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PPSocialHighlightStorage_freezeAppLinksCache__block_invoke;
  v3[3] = &unk_1E7E1E178;
  v3[4] = self;
  v3[5] = a2;
  -[_PASLock runWithLockAcquired:](lsAppLinkCache, "runWithLockAcquired:", v3);
}

- (id)deduplicateAndSortRankedHighlights:(id)a3 attributionLookup:(id)a4 limit:(unint64_t)a5 client:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
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
  double v31;
  double v32;
  double v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  id v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  id v64;
  id v65;
  void *v66;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  PPSocialHighlightStorage *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  id v89;
  _QWORD v90[4];
  _QWORD v91[4];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v64 = a4;
  v69 = a6;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_284);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_286);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v12, "initWithObjects:forKeys:", v13, v11);

  v14 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_287);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v11;
  v72 = (void *)objc_msgSend(v14, "initWithObjects:forKeys:", v15, v11);

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  v70 = v16;
  v71 = v10;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v81 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v21, "highlightIdentifier", v64);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          pp_default_log_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C392E000, v35, OS_LOG_TYPE_FAULT, "PPSocialHighlightStorage: highlight did not have a highlight identifier when queried.", buf, 2u);
          }
          goto LABEL_25;
        }
        if (objc_msgSend(v21, "isCollaboration")
          && objc_msgSend(v21, "hasDomainIdentifier"))
        {
          objc_msgSend(v21, "highlightIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "domainIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "highlightIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "domainIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "syndicationSecondsSinceReferenceDate");
            v32 = v31;
            objc_msgSend(v21, "syndicationSecondsSinceReferenceDate");
            if (v32 > v33)
            {
              objc_msgSend(v21, "highlightIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "domainIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, v34);

              goto LABEL_15;
            }
          }
          else
          {
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, v29);
            v30 = v27;
LABEL_15:

          }
          objc_msgSend(v21, "highlightIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "domainIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "highlightIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "domainIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v41, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "syndicationSecondsSinceReferenceDate");
            v45 = v44;
            objc_msgSend(v21, "syndicationSecondsSinceReferenceDate");
            if (v45 < v46)
            {
              objc_msgSend(v21, "highlightIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "objectForKeyedSubscript:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "domainIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v21, v47);

              goto LABEL_20;
            }
            v10 = v71;
          }
          else
          {
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v21, v42);
            v43 = v40;
LABEL_20:
            v10 = v71;

          }
          v16 = v70;
        }
        objc_msgSend(v21, "highlightIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v9, "containsObject:", v48);

        if ((v49 & 1) != 0)
          continue;
        objc_msgSend(v10, "addObject:", v21);
        objc_msgSend(v21, "highlightIdentifier");
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v35);
LABEL_25:

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v18);
  }

  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_288;
  v75[3] = &unk_1E7E1E0D0;
  v65 = v64;
  v76 = v65;
  v74 = v73;
  v77 = v74;
  v50 = v72;
  v78 = v50;
  v79 = self;
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v75);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "socialHighlightMaxNumHighlights");

  v54 = v51;
  if (objc_msgSend(v51, "count") > v53)
  {
    objc_msgSend(v51, "subarrayWithRange:", 0, v53, v65);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v91[0] = v69;
  v90[0] = CFSTR("client");
  v90[1] = CFSTR("limit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53, v65);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v55;
  v90[2] = CFSTR("portraitResultCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v56;
  v90[3] = CFSTR("portraitCacheDate");
  -[PPSocialHighlightStorage lastCacheInvalidationDateForClient:](self, "lastCacheInvalidationDateForClient:", v69);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v91[3] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57)

  PLLogRegisteredEvent();
  pp_social_highlights_log_handle();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend(v70, "count");
    v62 = objc_msgSend(v54, "count");
    *(_DWORD *)buf = 134218498;
    v85 = v61;
    v86 = 2048;
    v87 = v62;
    v88 = 2112;
    v89 = v69;
    _os_log_impl(&dword_1C392E000, v60, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: reduced %tu highlights into %tu deduplicated highlights for %@", buf, 0x20u);
  }

  return v54;
}

- (id)lastCacheInvalidationDateForClient:(id)a3
{
  return -[PPSocialHighlightCache lastCacheInvalidationDateForClient:](&self->_cache->super.isa, a3);
}

- (id)_screenTimeConversation
{
  if (_screenTimeConversation__pasOnceToken396 != -1)
    dispatch_once(&_screenTimeConversation__pasOnceToken396, &__block_literal_global_307);
  return (id)_screenTimeConversation__pasExprOnceResult;
}

- (BOOL)_isCollaborationEntitlementPresentForApplicationIdentifiers:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "containsObject:", CFSTR("*")) & 1) != 0
      || (objc_msgSend(v4, "containsObject:", CFSTR("collaborations")) & 1) == 0)
    {
      v5 = objc_msgSend(v4, "containsObject:", CFSTR("portraitCollaborations"));
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id *v12;

  v12 = a2;
  v3 = v12[1];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "remoteDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12[1], "publishersForRemoteDevices:startTime:includeLocal:pipeline:", v4, 1, &__block_literal_global_368, *(double *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "merge");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    objc_msgSend(v3, "publisherFromStartTime:", *(double *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

  v11 = (id)objc_opt_self();
}

void __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  __CFString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  PPSocialHighlightCache *cache;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  PPSocialHighlightCache *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  void *v39;
  int v40;
  id v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  PPSocialHighlightCache *v48;
  __CFString *v49;
  __CFString *v50;
  NSObject *v51;
  NSObject *queue;
  void *v54;
  dispatch_semaphore_t dsema;
  unint64_t v56;
  id v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  _QWORD v70[4];
  dispatch_semaphore_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[128];
  _QWORD v80[2];
  _QWORD v81[2];
  _BYTE buf[24];
  void *v83;
  PPSocialHighlightCache *v84;
  id v85;
  __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a4;
  v57 = a5;
  v62 = a6;
  v80[0] = CFSTR("client");
  v80[1] = CFSTR("limit");
  v81[0] = v11;
  v56 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
  pp_social_highlights_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: fetching rankedHighlights for client %@", buf, 0xCu);
  }

  v64 = (void *)objc_opt_new();
  if (-[PPSocialHighlightStorage _isCollaborationEntitlementPresentForApplicationIdentifiers:](self, "_isCollaborationEntitlementPresentForApplicationIdentifiers:", v62))
  {
    pp_social_highlights_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("collaborations");
      _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Overwriting client identifier %@ to %@", buf, 0x16u);
    }

    v11 = CFSTR("collaborations");
  }
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__20106;
  v77 = __Block_byref_object_dispose__20107;
  v78 = 0;
  v15 = dispatch_semaphore_create(0);
  cache = self->_cache;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke;
  v70[3] = &unk_1E7E1E278;
  v72 = &v73;
  dsema = v15;
  v71 = dsema;
  -[PPSocialHighlightCache cachedRankedHighlightsForClient:variant:completion:]((uint64_t)cache, v11, v70);
  v69 = 0;
  -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:limit:error:", v11, v57, v62, a3, &v69);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
    *a7 = objc_retainAutorelease(v69);
  objc_msgSend(v60, "first");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "second");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v11;
  if (v60 && v17 && v61)
  {
    v54 = v17;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v18 = v61;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v66 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v18, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allValues");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_355);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_357);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          pp_social_highlights_log_handle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = objc_msgSend(v27, "count");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v29;
            _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Social highlight: %@ attributions deduplicated to %tu items", buf, 0x16u);
          }

          objc_msgSend(v64, "setObject:forKeyedSubscript:", v27, v22);
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v19);
    }

    pp_social_highlights_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v60, "first");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v32;
      _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Social rankable highlights count: %tu", buf, 0xCu);

    }
    pp_social_highlights_log_handle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v64, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_1C392E000, v33, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Social highlight deduplicated count: %tu", buf, 0xCu);
    }

    v35 = self->_cache;
    if (v35)
      dispatch_sync((dispatch_queue_t)v35->_queue, &__block_literal_global_595);
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    pp_social_highlights_log_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = objc_msgSend((id)v74[5], "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: cachedHighlights count: %tu", buf, 0xCu);
    }

    v38 = -[PPSocialHighlightCache cachedHighlightsArrayIsValid:queryResults:]((uint64_t)self->_cache, (void *)v74[5], v54);
    v39 = (void *)v74[5];
    if (v39)
      v40 = v38;
    else
      v40 = 0;
    if (v40 == 1)
    {
      v41 = v39;

    }
    else
    {
      pp_social_highlights_log_handle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v59;
        _os_log_impl(&dword_1C392E000, v44, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Ranking social highlights for client '%@', as no valid cache exists.", buf, 0xCu);
      }

      -[PPSocialHighlightStorage featurizeRankedHighlights:](self, "featurizeRankedHighlights:", v54);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)objc_opt_new();
      objc_msgSend(v46, "rankSocialHighlights:client:performRerank:", v45, v59, -[PPSocialHighlightStorage rerankingEnabled](self, "rerankingEnabled"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = self->_cache;
      v41 = v47;
      v49 = v59;
      v50 = v49;
      if (v48)
      {
        if (!v49)
        {
          pp_social_highlights_log_handle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: Saving ranked items to the vended stream without a client identifier. The cache will not be active.", buf, 2u);
          }

        }
        queue = v48->_queue;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke;
        v83 = &unk_1E7E1AC58;
        v84 = v48;
        v85 = v41;
        v86 = v50;
        dispatch_sync(queue, buf);

      }
    }
    -[PPSocialHighlightStorage deduplicateAndSortRankedHighlights:attributionLookup:limit:client:](self, "deduplicateAndSortRankedHighlights:attributionLookup:limit:client:", v41, v64, v56, v59, v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v41;
  }
  else
  {
    pp_social_highlights_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v42, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: spotlight query failed.", buf, 2u);
    }

    v43 = 0;
  }

  _Block_object_dispose(&v73, 8);
  return v43;
}

- (BOOL)rerankingEnabled
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PPSocialHighlightStorage _socialLayerDefaults](self, "_socialLayerDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ProactiveRerankingDisabled"));

  pp_social_highlights_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("on");
    if (v3)
      v6 = CFSTR("off");
    v7 = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: reranking state is %@.", (uint8_t *)&v7, 0xCu);
  }

  return v3 ^ 1;
}

- (id)featurizeRankedHighlights:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PPSocialHighlightFeaturizer *v14;
  void *v15;
  PPSocialHighlightFeaturizer *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  -[PPSocialHighlightStorage feedbackPublisherWithInterval:includingRemote:](self, "feedbackPublisherWithInterval:includingRemote:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSocialHighlightFeaturizer trialSpecifiedFeatures](PPSocialHighlightFeaturizer, "trialSpecifiedFeatures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    pp_social_highlights_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: no ranking features found.", v20, 2u);
    }

    v12 = (void *)objc_opt_new();
  }
  v14 = [PPSocialHighlightFeaturizer alloc];
  objc_msgSend(v9, "cachedSignificantContactHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[PPSocialHighlightFeaturizer initWithFeedbackPublisher:topicStore:interactionStore:significantContactHandles:features:highlights:](v14, "initWithFeedbackPublisher:topicStore:interactionStore:significantContactHandles:features:highlights:", v11, v8, v7, v15, v12, v4);
  }
  else
  {
    v17 = (void *)objc_opt_new();
    v16 = -[PPSocialHighlightFeaturizer initWithFeedbackPublisher:topicStore:interactionStore:significantContactHandles:features:highlights:](v14, "initWithFeedbackPublisher:topicStore:interactionStore:significantContactHandles:features:highlights:", v11, v8, v7, v17, v12, v4);

  }
  -[PPSocialHighlightFeaturizer featurizeHighlights:](v16, "featurizeHighlights:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)feedbackPublisherWithInterval:(double)a3 includingRemote:(BOOL)a4
{
  void *v7;
  double v8;
  double v9;
  _PASLock *lock;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20106;
  v21 = __Block_byref_object_dispose__20107;
  v22 = 0;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8 - a3;

  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke;
  v15[3] = &unk_1E7E1E3B0;
  v16 = a4;
  v15[4] = &v17;
  *(double *)&v15[5] = v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  objc_msgSend((id)v18[5], "filterWithIsIncluded:", &__block_literal_global_370);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v18[5];
  v18[5] = v11;

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_socialLayerDefaults
{
  if (_socialLayerDefaults__pasOnceToken397 != -1)
    dispatch_once(&_socialLayerDefaults__pasOnceToken397, &__block_literal_global_309);
  return (id)_socialLayerDefaults__pasExprOnceResult;
}

- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  int v17;
  void *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  __CFString *v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (-[PPSocialHighlightStorage _isCollaborationEntitlementPresentForApplicationIdentifiers:](self, "_isCollaborationEntitlementPresentForApplicationIdentifiers:", v14))
  {
    pp_social_highlights_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("collaborations");
      _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is enabled due to %@ entitlement", buf, 0xCu);
    }

    v16 = 0;
  }
  else
  {
    v24 = 0;
    v17 = -[PPSocialHighlightStorage automaticSharingEnabledForClient:error:](self, "automaticSharingEnabledForClient:error:", v12, &v24);
    v16 = (__CFString *)v24;
    if (v17 != 2)
    {
      v18 = (void *)objc_opt_new();
      if (v18)
        goto LABEL_7;
      goto LABEL_9;
    }
  }
  v23 = v16;
  -[PPSocialHighlightStorage autoDonatingChatsWithError:](self, "autoDonatingChatsWithError:", &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;

  v16 = v19;
  if (v18)
  {
LABEL_7:
    -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:", v12, v13, v14, v18, a6, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_9:
  if (a7)
    objc_storeStrong(a7, v16);
  pp_social_highlights_log_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: unable to fetch auto donating chat identifiers: %@", buf, 0xCu);
  }

  v20 = 0;
LABEL_14:

  return v20;
}

- (id)_rankableItemsForClient:(id)a3 variant:(id)a4 applicationIdentifiers:(id)a5 autoDonatingChatIdentifiers:(id)a6 limit:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v67;
  id v68;
  id v69;
  os_signpost_id_t spid;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  id obj;
  uint64_t v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  void *v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v84 = a6;
  -[PPSocialHighlightStorage sharedContentForClient:variant:applicationIdentifiers:limit:autoDonatingChatIdentifiers:error:](self, "sharedContentForClient:variant:applicationIdentifiers:limit:autoDonatingChatIdentifiers:error:", v14, v15, v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_332);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  pp_social_highlights_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v94 = objc_msgSend(v18, "count");
    _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight filtered result count: %tu", buf, 0xCu);
  }

  pp_social_highlights_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  pp_social_highlights_signpost_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v75 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Storage.rankableHighlightsFromItems", ", buf, 2u);
  }
  spid = v21;

  objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_335);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  -[PPSocialHighlightStorage attributionsForIdentifiers:error:](self, "attributionsForIdentifiers:error:", v24, &v92);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v92;
  if (objc_msgSend(v24, "count") && !objc_msgSend(v25, "count"))
  {
    pp_social_highlights_log_handle();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v94 = (uint64_t)v26;
      _os_log_error_impl(&dword_1C392E000, v67, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Failed to fetch attributions for identifiers: %@", buf, 0xCu);
    }

    if (!a8)
    {
      v65 = 0;
      goto LABEL_50;
    }
    v68 = v26;
    v65 = 0;
    v69 = *a8;
    *a8 = v68;
    v64 = v69;
  }
  else
  {
    v71 = v26;
    v72 = v24;
    v74 = v17;
    v80 = (void *)objc_opt_new();
    v82 = (void *)objc_opt_new();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v73 = v18;
    obj = v18;
    v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    if (v86)
    {
      v27 = *(_QWORD *)v89;
      v76 = *MEMORY[0x1E0CA6028];
      v78 = v15;
      v79 = v14;
      v81 = v25;
      v77 = v16;
      v83 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v86; ++i)
        {
          if (*(_QWORD *)v89 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          v30 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v29, "attributeSet");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "URL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v87 = v30;
            objc_msgSend(v29, "uniqueIdentifier");
            v33 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v33);
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            if (v33)
              v36 = v34 == 0;
            else
              v36 = 1;
            if (v36)
            {
              pp_social_highlights_log_handle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v94 = (uint64_t)v33;
                _os_log_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Failed to fetch attribution for identifier: %@", buf, 0xCu);
              }
            }
            else
            {
              +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:](PPRankableSocialHighlightUtils, "rankableHighlightFromSearchableItem:attribution:autoDonatingChats:applicationIdentifiers:clientIdentifier:variant:", v29, v34, v84, v16, v14, v15);
              v38 = objc_claimAutoreleasedReturnValue();
              v37 = v38;
              if (v38
                && (-[NSObject highlightIdentifier](v38, "highlightIdentifier"),
                    v39 = (void *)objc_claimAutoreleasedReturnValue(),
                    v39,
                    v39))
              {
                objc_msgSend(v80, "addObject:", v37);
                pp_social_highlights_log_handle();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v94 = (uint64_t)v41;
                  _os_log_impl(&dword_1C392E000, v40, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: CoreSpotlight fetched highlight with identifier: %@", buf, 0xCu);

                }
                -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v43)
                {
                  v44 = (void *)objc_opt_new();
                  -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "setObject:forKeyedSubscript:", v44, v45);

                }
                objc_msgSend(v29, "attributeSet");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "attributeForKey:", v76);
                v47 = objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSObject firstObject](v47, "firstObject");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v48 = 0;
                }
                v51 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v35, "conversationIdentifier");
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = (void *)v52;
                if (v48)
                {
                  v54 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("%@_%@"), v52, v48, spid);
                }
                else
                {
                  objc_msgSend(v35, "sender");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "handle");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("%@_%@"), v53, v56);

                }
                if (v54)
                {
                  -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "objectForKeyedSubscript:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "objectForKeyedSubscript:", v54);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v59)
                  {
                    -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "objectForKeyedSubscript:", v60);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "setObject:forKeyedSubscript:", v35, v54);

                  }
                }

                v15 = v78;
                v14 = v79;
                v16 = v77;
                v25 = v81;
              }
              else
              {
                pp_social_highlights_log_handle();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v29, "uniqueIdentifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject highlightIdentifier](v37, "highlightIdentifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v94 = (uint64_t)v49;
                  v95 = 2112;
                  v96 = v50;
                  _os_log_impl(&dword_1C392E000, v47, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: item %@ did not produce a correct rankable highlight identifier: %@", buf, 0x16u);

                  v25 = v81;
                }
              }

              v27 = v83;
            }

            v30 = v87;
          }
          else
          {
            pp_social_highlights_log_handle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v33, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight fetched highlight with missing URL.", buf, 2u);
            }
          }

          objc_autoreleasePoolPop(v30);
        }
        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
      }
      while (v86);
    }

    pp_social_highlights_signpost_handle();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = v62;
    if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v63, OS_SIGNPOST_INTERVAL_END, spid, "Storage.rankableHighlightsFromItems", " enableTelemetry=YES ", buf, 2u);
    }

    v64 = v80;
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v80, v82);

    v18 = v73;
    v17 = v74;
    v26 = v71;
    v24 = v72;
  }

LABEL_50:
  return v65;
}

- (id)attributionsForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  dispatch_semaphore_t dsema;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  dispatch_semaphore_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  uint64_t v52;
  const __CFString *v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _QWORD v58[16];

  v58[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CA6198];
  v58[0] = *MEMORY[0x1E0CA6978];
  v58[1] = v7;
  v8 = *MEMORY[0x1E0CA6158];
  v58[2] = *MEMORY[0x1E0CA6338];
  v58[3] = v8;
  v9 = *MEMORY[0x1E0CA6018];
  v58[4] = *MEMORY[0x1E0CA6048];
  v58[5] = v9;
  v10 = *MEMORY[0x1E0CA67C0];
  v58[6] = *MEMORY[0x1E0CA67D8];
  v58[7] = v10;
  v11 = *MEMORY[0x1E0CA6900];
  v58[8] = CFSTR("com_apple_mobilesms_highlightedContentServerDate");
  v58[9] = v11;
  v58[10] = CFSTR("com_apple_mobilesms_fromMe");
  v58[11] = CFSTR("com_apple_mobilesms_collaborationMetadata");
  v58[12] = CFSTR("com_apple_mobilesms_chatUniqueIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__20106;
  v49 = __Block_byref_object_dispose__20107;
  v50 = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = *MEMORY[0x1E0CB2AC0];
  v15 = *MEMORY[0x1E0D70E28];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __61__PPSocialHighlightStorage_attributionsForIdentifiers_error___block_invoke;
  v41[3] = &unk_1E7E1E320;
  v42 = v6;
  v44 = &v45;
  v33 = v42;
  dsema = v13;
  v43 = dsema;
  objc_msgSend(v35, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v12, v14, v15, v42, v41);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v46[5] && (v16 = objc_msgSend(v33, "count"), v16 == objc_msgSend((id)v46[5], "count")))
  {
    v36 = (id)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = (id)v46[5];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v21;
            -[PPSocialHighlightStorage _socialAttributionFromAttributeValues:fetchAttributes:](self, "_socialAttributionFromAttributeValues:fetchAttributes:", v22, v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              objc_msgSend(v23, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25 == 0;

              if (!v26)
              {
                objc_msgSend(v24, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v24, v27);

              }
            }

          }
          else
          {
            pp_social_highlights_log_handle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query result was not an array.", buf, 2u);
            }
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v18);
    }
  }
  else
  {
    pp_social_highlights_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(v33, "count");
      v32 = objc_msgSend((id)v46[5], "count");
      *(_DWORD *)buf = 134218240;
      v55 = v31;
      v56 = 2048;
      v57 = v32;
      _os_log_error_impl(&dword_1C392E000, v28, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: CoreSpotlight attribution query for identifiers: %tu returned invalid number of results: %tu", buf, 0x16u);
    }

    if (!a4)
    {
      v36 = (id)MEMORY[0x1E0C9AA70];
      goto LABEL_24;
    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0D70D18];
    v53 = CFSTR("CoreSpotlight attribution query returned invalid results.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 24, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v36 = (id)MEMORY[0x1E0C9AA70];
  }

LABEL_24:
  _Block_object_dispose(&v45, 8);

  return v36;
}

- (id)autoDonatingChatsWithError:(id *)a3
{
  return -[PPSocialHighlightStorage autoDonatingChatsWithShouldContinueBlock:error:](self, "autoDonatingChatsWithShouldContinueBlock:error:", 0, a3);
}

void __61__PPSocialHighlightStorage_attributionsForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_social_highlights_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v7 = 134218240;
    v8 = v5;
    v9 = 2048;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query for identifiers: %tu result count: %tu", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
    v6 = v3;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (unsigned)automaticSharingEnabledForClient:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PPSocialHighlightStorage automaticSharingEnabled](self, "automaticSharingEnabled");
  if (v7 > 1)
  {
    -[PPSocialHighlightStorage _socialLayerDefaults](self, "_socialLayerDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryForKey:", CFSTR("SharedWithYouApps"));
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      pp_social_highlights_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Failed to read SocialLayer app defaults", buf, 2u);
      }
      LOBYTE(v8) = 0;
      goto LABEL_21;
    }
    if (!objc_msgSend(v6, "length"))
    {
      LOBYTE(v8) = 2;
      goto LABEL_22;
    }
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v6, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v11)
    {
      objc_msgSend(v11, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if ((v15 & 1) != 0)
      {

        LOBYTE(v8) = 2;
LABEL_21:

        goto LABEL_22;
      }
      pp_social_highlights_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "bundleIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v17;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is disabled for %@", buf, 0xCu);

      }
      LOBYTE(v8) = 1;
    }
    else
    {
      pp_social_highlights_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: LSBundleRecord query error: %@", buf, 0xCu);
      }

      LOBYTE(v8) = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }

    goto LABEL_21;
  }
  LODWORD(v8) = v7;
  pp_social_highlights_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = (_DWORD)v8;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Automatic Sharing is disabled globally due to toggle state: %hhu", buf, 8u);
  }
LABEL_22:

  return v8;
}

- (unsigned)automaticSharingEnabled
{
  unsigned __int8 v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"), &keyExistsAndHasValidFormat))
  {
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  if (keyExistsAndHasValidFormat)
    return v2;
  else
    return 0;
}

void __47__PPSocialHighlightStorage_freezeAppLinksCache__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = v3[3];
  pp_social_highlights_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: freezing app link cache", buf, 2u);
    }

    if (v3[2] != v3[3])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPSocialHighlightStorage.m"), 830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->_urlToAppID == guardedData->_mutableURLToAppID"));

    }
    objc_msgSend(MEMORY[0x1E0D815D0], "lazyPlistDictionaryWithPlistDictionary:");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v3[2];
    v3[2] = v7;

    v5 = v3[3];
    v3[3] = 0;
  }
  else if (v6)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: existing frozen cache is still OK", v10, 2u);
  }

}

- (PPSocialHighlightStorage)init
{
  id v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  PPSocialHighlightStorageUtilities *v14;
  PPSocialHighlightStorageUtilities *socialHighlightStorageUtils;
  void *v16;
  _PASLock *v17;
  _PASLock *lsAppLinkCache;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PPSocialHighlightStorage *v23;

  v3 = objc_alloc(MEMORY[0x1E0D02778]);
  +[PPSocialHighlightStorage feedbackPruningPolicy](PPSocialHighlightStorage, "feedbackPruningPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPruningPolicy:", v4);

  v6 = NSRoundUpToMultipleOfPageSize(0x30000uLL);
  +[PPPaths subdirectory:](PPPaths, "subdirectory:", CFSTR("streams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024C0]), "initWithStoreBasePath:segmentSize:", v7, v6);
  v9 = objc_alloc(MEMORY[0x1E0D024B0]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "socialHighlightRankedStorageMaxAge");
  v11 = (void *)objc_msgSend(v9, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 5 * v6);

  objc_msgSend(v8, "setPruningPolicy:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("rankedSocialHighlights"), v8);
  v13 = -[PPSocialHighlightStorage _screenTimeConversation](self, "_screenTimeConversation");
  v14 = (PPSocialHighlightStorageUtilities *)objc_opt_new();
  socialHighlightStorageUtils = self->_socialHighlightStorageUtils;
  self->_socialHighlightStorageUtils = v14;

  v16 = (void *)objc_opt_new();
  v17 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v16);
  lsAppLinkCache = self->_lsAppLinkCache;
  self->_lsAppLinkCache = v17;

  -[PPSocialHighlightStorage resetLSAppLinkCache](self, "resetLSAppLinkCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handleAppLinkChangeNotification_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_handleAppLinkChangeNotification_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_handleAppLinkChangeNotification_, CFSTR("com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification"), 0);

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSocialHighlightStorage initWithFeedbackStream:rankedStream:database:](self, "initWithFeedbackStream:rankedStream:database:", v5, v12, v22);

  return v23;
}

- (PPSocialHighlightStorage)initWithFeedbackStream:(id)a3 rankedStream:(id)a4 database:(id)a5
{
  id v9;
  id v10;
  id v11;
  PPSocialHighlightStorage *v12;
  id *v13;
  id *v14;
  PPSocialHighlightCache *cache;
  uint64_t v16;
  _PASLock *lock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PPSocialHighlightStorage;
  v12 = -[PPSocialHighlightStorage init](&v19, sel_init);
  if (v12)
  {
    v13 = (id *)objc_opt_new();
    objc_storeStrong(v13 + 1, a3);
    if (v10)
    {
      v14 = -[PPSocialHighlightCache initWithStream:database:]((id *)[PPSocialHighlightCache alloc], v10, v11);
      cache = v12->_cache;
      v12->_cache = (PPSocialHighlightCache *)v14;

    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v13);
    lock = v12->_lock;
    v12->_lock = (_PASLock *)v16;

  }
  return v12;
}

- (void)syncFeedback
{
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  pp_social_highlights_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: triggering sync", buf, 2u);
  }

  v3 = (void *)objc_opt_new();
  v8 = 0;
  v4 = objc_msgSend(v3, "triggerSyncWithError:", &v8);
  v5 = v8;
  pp_social_highlights_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: successfully triggered sync", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failed to trigger sync: %@", buf, 0xCu);
  }

}

- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v45 = a4;
  v44 = a6;
  v10 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v16, "highlight");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20 = (void *)objc_opt_new();
          objc_msgSend(v16, "highlight");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v22);

        }
        objc_msgSend(v16, "highlight");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "highlight");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attributionIdentifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObjectsFromArray:", v27);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v13);
  }

  v28 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v10, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v10, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "allObjects");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v31);
  }

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __103__PPSocialHighlightStorage_rankedHighlightsForSyncedItems_client_variant_applicationIdentifiers_error___block_invoke;
  v47[3] = &unk_1E7E1DF78;
  v48 = v44;
  v49 = v45;
  v37 = v45;
  v38 = v44;
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v47);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "rankSocialHighlights:client:performRerank:", v39, v37, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPSocialHighlightStorage deduplicateAndSortRankedHighlights:attributionLookup:limit:client:](self, "deduplicateAndSortRankedHighlights:attributionLookup:limit:client:", v41, v28, -1, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)highlightFromRankableHighlight:(id)a3 attributionIdentifiers:(id)a4 earliestAttributionIdentifiers:(id)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  NSObject *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  const __CFString *v61;
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "score");
  if (v12 < 0.0)
  {
    pp_social_highlights_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "highlightIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "score");
      *(_DWORD *)buf = 138412546;
      v64 = v46;
      v65 = 2048;
      v66 = v47;
      _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: Suppressing highlight %@ due to negative score: %g", buf, 0x16u);

    }
    v14 = 0;
    goto LABEL_28;
  }
  v15 = objc_msgSend(v9, "isTopKResult");
  objc_msgSend(v9, "score");
  v17 = v16 * 0.2 + 0.8;
  v18 = v16 * 0.8;
  if (v15)
    v19 = v17;
  else
    v19 = v18;
  if (!objc_msgSend(v9, "hasResolvedUrl")
    || (objc_msgSend(v9, "resolvedUrl"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "length"),
        v20,
        !v21))
  {
    v24 = 0;
    goto LABEL_13;
  }
  v22 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v9, "resolvedUrl");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithString:", v23);

  if (!v24)
  {
LABEL_13:
    v59 = MEMORY[0x1E0C9AA70];
    goto LABEL_14;
  }
  v61 = CFSTR("com_apple_mobilesms_resolvedURL");
  v62 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v59 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  pp_social_highlights_log_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "highlightIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v64 = v26;
    v65 = 2112;
    v66 = v10;
    _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Constructed social highlight with identifier: %@, attributionIdentifiers: %@", buf, 0x16u);

  }
  v27 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v9, "resourceUrl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "initWithString:", v28);

  v58 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightStorage.m"), 570, CFSTR("All social highlights must have a resource URL"));

  }
  v30 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v9, "syndicationSecondsSinceReferenceDate");
  v31 = (void *)objc_msgSend(v30, "initWithTimeIntervalSinceReferenceDate:");
  v60 = v24;
  if (objc_msgSend(v9, "isCollaboration"))
  {
    objc_msgSend(v9, "applicationIdentifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "containsObject:", CFSTR("com.apple.private.sociallayer.highlights"));

    v56 = v11;
    if (v33)
    {
      objc_msgSend(v9, "handleToIdentityMap");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    v55 = objc_alloc(MEMORY[0x1E0D70C58]);
    objc_msgSend(v9, "highlightIdentifier");
    v57 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collaborationIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentDisplayName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v9, "contentCreationSecondsSinceReferenceDate");
    v52 = (void *)objc_msgSend(v42, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v9, "contentType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileProviderId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentityProof");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v58;
    v40 = (void *)v59;
    v14 = (void *)objc_msgSend(v55, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:collaborationIdentifier:contentDisplayName:contentCreationDate:contentUTIType:fileProviderId:earliestAttributionIdentifiers:localIdentity:localIdentityProof:handleToIdentityMap:score:", v57, v58, v31, v10, v59, v53, v54, v52, v51, v50, v56, v49, v43, v34, v44);

    v36 = (void *)v34;
    v11 = v56;
    v38 = (void *)v57;

  }
  else
  {
    v35 = objc_alloc(MEMORY[0x1E0D70C60]);
    objc_msgSend(v9, "highlightIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v37 = v10;
    else
      v37 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v35;
    v41 = v58;
    v40 = (void *)v59;
    v14 = (void *)objc_msgSend(v39, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:", v36, v58, v31, v37, v59, v38);
  }

  v13 = v60;
LABEL_28:

  return v14;
}

- (id)allSupportedHighlightsForAutoDonatingChats:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D70F10];
  v8 = *MEMORY[0x1E0D70DB0];
  v39[0] = *MEMORY[0x1E0D70D88];
  v39[1] = v8;
  v9 = *MEMORY[0x1E0D70D98];
  v39[2] = *MEMORY[0x1E0D70D80];
  v39[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:", &stru_1E7E221D0, v7, v10, v6, objc_msgSend(&unk_1E7E5A5A8, "unsignedIntegerValue"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "first");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *MEMORY[0x1E0D70DA0];
    v38[0] = CFSTR("*");
    v38[1] = CFSTR("internal");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSocialHighlightStorage _rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:](self, "_rankableItemsForClient:variant:applicationIdentifiers:autoDonatingChatIdentifiers:limit:error:", v13, v7, v14, v6, objc_msgSend(&unk_1E7E5A5A8, "unsignedIntegerValue"), a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "first");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v32 = v6;
      v17 = (void *)objc_opt_new();
      v18 = (void *)objc_opt_new();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = (void *)MEMORY[0x1C3BD6630]();
      v31 = v16;
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v19);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v25, "highlightIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v18, "containsObject:", v26);

            if ((v27 & 1) == 0)
            {
              objc_msgSend(v17, "addObject:", v25);
              objc_msgSend(v25, "highlightIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v28);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v22);
      }

      v29 = (void *)objc_msgSend(v17, "copy");
      v16 = v31;
      v6 = v32;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)handleAppLinkChangeNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  pp_social_highlights_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: clearing app link cache due to invalidation notification", v5, 2u);
  }

  -[PPSocialHighlightStorage resetLSAppLinkCache](self, "resetLSAppLinkCache");
}

- (void)resetLSAppLinkCache
{
  -[_PASLock runWithLockAcquired:](self->_lsAppLinkCache, "runWithLockAcquired:", &__block_literal_global_320);
}

- (id)applicationIdentifiersForResourceURL:(id)a3 resolvedURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASLock *lsAppLinkCache;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _PASLock *v20;
  id v21;
  void *v22;
  void *v24;
  PPSocialHighlightStorage *v25;
  id v26;
  id v27;
  id obj;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v25 = self;
  lsAppLinkCache = self->_lsAppLinkCache;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke;
  v38[3] = &unk_1E7E1E1A0;
  v26 = v6;
  v39 = v26;
  v27 = v7;
  v40 = v27;
  v42 = &v43;
  v29 = v8;
  v41 = v29;
  -[_PASLock runWithLockAcquired:](lsAppLinkCache, "runWithLockAcquired:", v38);
  if (!*((_BYTE *)v44 + 24))
  {
    v10 = (void *)objc_opt_new();
    +[PPSocialHighlightStorage appLinksForResourceURL:resolvedURL:](PPSocialHighlightStorage, "appLinksForResourceURL:resolvedURL:", v26, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v24;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v35 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v14, "targetApplicationRecord");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "applicationIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = objc_alloc(MEMORY[0x1E0D81638]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "isEnabled"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v17, "initWithFirst:second:", v16, v18);

            objc_msgSend(v10, "addObject:", v19);
            objc_msgSend(v29, "addObject:", v19);

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        }
        while (v11);
      }

    }
    v20 = v25->_lsAppLinkCache;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke_2;
    v30[3] = &unk_1E7E1E1C8;
    v30[4] = v25;
    v31 = v26;
    v32 = v27;
    v21 = v10;
    v33 = v21;
    -[_PASLock runWithLockAcquired:](v20, "runWithLockAcquired:", v30);

  }
  objc_msgSend(v29, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v43, 8);
  return v22;
}

- (BOOL)isValidHighlight:(id)a3 applicationIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int v14;
  char v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syndicationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "unsignedIntegerValue") == 2;
  objc_msgSend(v5, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeForKey:", CFSTR("com_apple_mobilesms_fromMe"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend(v11, "BOOLValue") ^ 1 | v9;
  else
    LOBYTE(v12) = 1;
  v13 = +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:](PPRankableSocialHighlightUtils, "isSearchableItemCollaboration:", v5);
  v14 = objc_msgSend(v6, "containsObject:", CFSTR("fromMe"));

  v15 = v12 | v14 | v13;
  if ((v15 & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v17;
      v18 = "PPSocialHighlightStorage: Suppressing outgoing item since it is not pinned: %@";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v14)
  {
    pp_social_highlights_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v17;
      v18 = "PPSocialHighlightStorage: Including outgoing item since fromMe entitlement is present: %@";
LABEL_14:
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  LOBYTE(self) = -[PPSocialHighlightStorage isClientEntitledForItem:client:applicationIdentifiers:blockedHosts:iTunesOverrideChecker:](self, "isClientEntitledForItem:client:applicationIdentifiers:blockedHosts:iTunesOverrideChecker:", v13, v12, v11, v10, v14);

  return (char)self;
}

- (BOOL)isClientEntitledForItem:(id)a3 client:(id)a4 applicationIdentifiers:(id)a5 blockedHosts:(id)a6 iTunesOverrideChecker:(id)a7
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  char v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  void *context;
  id v91;
  id v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  _BOOL4 v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  id v110;
  NSObject *obj;
  void *v112;
  NSObject *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint8_t v133[128];
  uint8_t buf[4];
  NSObject *v135;
  __int16 v136;
  void *v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v13, "containsObject:", CFSTR("portraitCollaborations"));
  LODWORD(a7) = objc_msgSend(v13, "containsObject:", CFSTR("*"));
  v17 = objc_msgSend(v13, "containsObject:", CFSTR("collaborations"));
  v18 = a7 & ~(a7 & v17 & v16);
  if (v18 == 1 && !-[NSObject length](v12, "length"))
  {
    v30 = 1;
    goto LABEL_118;
  }
  v107 = v13;
  v19 = v15;
  v20 = v12;
  v21 = v14;
  v22 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v11, "attributeSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URL");
  v24 = v11;
  v25 = objc_claimAutoreleasedReturnValue();

  v112 = (void *)v25;
  if (v25)
  {
    v108 = v24;
    objc_msgSend(v24, "attributeSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributeForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_opt_class();
      v14 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v27);
      else
        v28 = 0;
    }
    else
    {
      v28 = 0;
      v14 = v21;
    }
    v12 = v20;
    v103 = (void *)v28;
    -[PPSocialHighlightStorage applicationIdentifiersForResourceURL:resolvedURL:](self, "applicationIdentifiersForResourceURL:resolvedURL:", v112, v28);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v22;
    if (v104)
    {
      v93 = +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:](PPRankableSocialHighlightUtils, "isSearchableItemCollaboration:", v108);
      v15 = v19;
      v13 = v107;
      if ((v17 & v93) == 1 && v16 == objc_msgSend(v107, "containsObject:", CFSTR("*")))
      {
        v53 = 1;
        v52 = 1;
        v32 = v112;
LABEL_114:

        objc_autoreleasePoolPop(v31);
        if (v53)
          v30 = v52;
        else
          v30 = 0;
        v11 = v108;
        goto LABEL_118;
      }
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      obj = v104;
      v113 = v12;
      v100 = v31;
      v101 = v15;
      v105 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
      if (v105)
      {
        v102 = 0;
        v106 = *(_QWORD *)v127;
        v99 = *MEMORY[0x1E0D70D88];
        v94 = v27;
        v97 = *MEMORY[0x1E0D70DA8];
        v32 = v112;
        v91 = v14;
        while (2)
        {
          for (i = 0; i != v105; ++i)
          {
            if (*(_QWORD *)v127 != v106)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v34, "first");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "second");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "BOOLValue");

            if (v38)
            {
              if (objc_msgSend(v36, "isEqualToString:", v99)
                && ((objc_msgSend(v32, "nr_isWebURL") & 1) != 0 || (objc_msgSend(v103, "nr_isWebURL") & 1) != 0))
              {
                v102 = 0;
              }
              else if (objc_msgSend(v36, "isEqualToString:", v97))
              {
                v39 = (void *)MEMORY[0x1C3BD6630]();
                objc_msgSend(v108, "attributeSet");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "attributeForKey:", CFSTR("com_apple_mobilesms_ckBundleIDs"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                v98 = v41;
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (objc_msgSend(v41, "firstObject"),
                      v42 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      isKindOfClass = objc_opt_isKindOfClass(),
                      v42,
                      (isKindOfClass & 1) == 0))
                {
                  pp_social_highlights_log_handle();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v108, "uniqueIdentifier");
                    v89 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v135 = v89;
                    _os_log_error_impl(&dword_1C392E000, v46, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: could not find any CKBundleIDs to check for %@", buf, 0xCu);

                  }
                  v52 = 0;
                  v14 = v91;
LABEL_53:

                  objc_autoreleasePoolPop(v39);
                  v27 = v94;
                  goto LABEL_61;
                }
                context = v39;
                pp_social_highlights_log_handle();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1C392E000, v44, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: using CSSI bundle IDs to check link entitlement", buf, 2u);
                }

                -[PPSocialHighlightStorageUtilities resolveBundleIdToApplicationIdentifierIfInstalled:](self->_socialHighlightStorageUtils, "resolveBundleIdToApplicationIdentifierIfInstalled:", v98);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = objc_msgSend(v45, "count") != 0;
                v122 = 0u;
                v123 = 0u;
                v124 = 0u;
                v125 = 0u;
                v46 = v45;
                v47 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
                if (v47)
                {
                  v48 = v47;
                  v49 = *(_QWORD *)v123;
                  while (2)
                  {
                    for (j = 0; j != v48; ++j)
                    {
                      if (*(_QWORD *)v123 != v49)
                        objc_enumerationMutation(v46);
                      v51 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
                      if ((v18 | objc_msgSend(v107, "containsObject:", v51, context)) == 1
                        && (!-[NSObject length](v113, "length")
                         || (-[NSObject isEqualToString:](v113, "isEqualToString:", v51) & 1) != 0))
                      {

                        v52 = 1;
                        v32 = v112;
                        v12 = v113;
                        v39 = context;
                        v14 = v91;
                        goto LABEL_53;
                      }
                    }
                    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
                    if (v48)
                      continue;
                    break;
                  }
                }

                objc_autoreleasePoolPop(context);
                v32 = v112;
                v12 = v113;
                v27 = v94;
              }
              else
              {
                v102 = 1;
              }
            }
            if ((v18 | objc_msgSend(v107, "containsObject:", v36, context)) == 1
              && (!-[NSObject length](v12, "length")
               || (-[NSObject isEqualToString:](v12, "isEqualToString:", v36) & 1) != 0))
            {
              v52 = 1;
              v14 = v91;
LABEL_61:

              objc_autoreleasePoolPop(v35);
              v53 = 1;
              v31 = v100;
              v15 = v101;
              goto LABEL_113;
            }

            objc_autoreleasePoolPop(v35);
          }
          v14 = v91;
          v31 = v100;
          v15 = v101;
          v105 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
          if (v105)
            continue;
          break;
        }
      }
      else
      {
        v102 = 0;
        v32 = v112;
      }

      if (!v102 && !v93)
      {
        objc_msgSend(v15, "overrideForURL:", v32);
        v54 = objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          obj = v54;
          if ((-[NSObject isEqual:](v54, "isEqual:", v32) & 1) != 0)
          {
            LOBYTE(v102) = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            pp_private_log_handle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v135 = obj;
              _os_log_debug_impl(&dword_1C392E000, v57, OS_LOG_TYPE_DEBUG, "Searching for applications to open URL override: %@", buf, 0xCu);
            }
            v95 = v27;
            v92 = v14;

            objc_msgSend(v56, "applicationsAvailableForOpeningURL:", obj);
            v58 = objc_claimAutoreleasedReturnValue();
            pp_social_highlights_log_handle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v135 = v58;
              _os_log_impl(&dword_1C392E000, v59, OS_LOG_TYPE_INFO, "Applications found for URL override: %@", buf, 0xCu);
            }

            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v60 = v58;
            v61 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
            LOBYTE(v102) = v61 != 0;
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v119;
              while (2)
              {
                for (k = 0; k != v62; ++k)
                {
                  if (*(_QWORD *)v119 != v63)
                    objc_enumerationMutation(v60);
                  objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * k), "correspondingApplicationRecord");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "applicationIdentifier");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = v18 | objc_msgSend(v107, "containsObject:", v66);

                  if (v67 == 1)
                  {
                    if (!-[NSObject length](v113, "length")
                      || (objc_msgSend(v65, "applicationIdentifier"),
                          v68 = (void *)objc_claimAutoreleasedReturnValue(),
                          v69 = -[NSObject isEqualToString:](v113, "isEqualToString:", v68),
                          v68,
                          v69))
                    {
                      pp_social_highlights_log_handle();
                      v87 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v65, "applicationIdentifier");
                        v88 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v135 = v88;
                        _os_log_impl(&dword_1C392E000, v87, OS_LOG_TYPE_DEFAULT, "Found app supporting URL override but not Universal Links: %@", buf, 0xCu);

                      }
                      v53 = 1;
                      v52 = 1;
                      v32 = v112;
                      v12 = v113;
                      v14 = v92;
                      v31 = v100;
                      v15 = v101;
                      v27 = v95;
                      goto LABEL_113;
                    }
                  }

                }
                v62 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
                if (v62)
                  continue;
                break;
              }
            }

            v32 = v112;
            v12 = v113;
            v14 = v92;
            v31 = v100;
            v15 = v101;
            v27 = v95;
          }
          v54 = obj;
        }
        else
        {
          LOBYTE(v102) = 0;
        }

      }
      objc_msgSend(v108, "attributeSet");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "syndicationStatus");
      v71 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      obj = v71;
      if ((objc_opt_isKindOfClass() & 1) == 0 || -[NSObject unsignedIntegerValue](v71, "unsignedIntegerValue") != 2)
      {
        objc_msgSend(v32, "host");
        v72 = objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          v96 = v27;
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v110 = v14;
          v73 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
          if (v73)
          {
            v74 = v73;
            v75 = *(_QWORD *)v115;
            while (2)
            {
              v76 = 0;
              do
              {
                v77 = v14;
                if (*(_QWORD *)v115 != v75)
                  objc_enumerationMutation(v110);
                v78 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v76);
                v79 = (void *)MEMORY[0x1C3BD6630]();
                if (objc_msgSend(v78, "hasPrefix:", CFSTR(".")))
                {
                  v80 = v78;
                }
                else
                {
                  objc_msgSend(CFSTR("."), "stringByAppendingString:", v78);
                  v80 = (id)objc_claimAutoreleasedReturnValue();
                }
                v81 = v80;
                objc_autoreleasePoolPop(v79);
                if ((-[NSObject isEqual:](v72, "isEqual:", v78) & 1) != 0
                  || -[NSObject hasSuffix:](v72, "hasSuffix:", v81))
                {
                  pp_social_highlights_log_handle();
                  v83 = objc_claimAutoreleasedReturnValue();
                  v14 = v77;
                  v31 = v100;
                  v15 = v101;
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v108, "uniqueIdentifier");
                    v84 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v135 = v84;
                    _os_log_impl(&dword_1C392E000, v83, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing URL with blocked host, item: %@", buf, 0xCu);

                  }
                  v12 = v113;
                  v27 = v96;
                  goto LABEL_107;
                }

                ++v76;
                v12 = v113;
                v14 = v77;
                v31 = v100;
                v15 = v101;
              }
              while (v74 != v76);
              v74 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
              if (v74)
                continue;
              break;
            }
          }

          v27 = v96;
        }

        v32 = v112;
      }
      if (v102 || (v18 & 1) == 0)
      {
        v53 = 0;
      }
      else
      {
        if (objc_msgSend(v107, "containsObject:", CFSTR("internal"))
          && !-[NSObject isEqualToString:](v12, "isEqualToString:", *MEMORY[0x1E0D70DA0])
          || -[NSObject isEqualToString:](v12, "isEqualToString:", *MEMORY[0x1E0D70DB0]))
        {
          pp_social_highlights_log_handle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v108, "uniqueIdentifier");
            v82 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v135 = v82;
            _os_log_impl(&dword_1C392E000, v72, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing link that is not supported by installed app, wildcard entitlement is present and client is not Safari or TV: %@", buf, 0xCu);

          }
LABEL_107:

          v52 = 0;
          v53 = 1;
          v32 = v112;
          goto LABEL_113;
        }
        v53 = 1;
      }
      v52 = 1;
    }
    else
    {
      pp_social_highlights_log_handle();
      obj = objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v108, "uniqueIdentifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v135 = v12;
        v136 = 2112;
        v137 = v85;
        _os_log_error_impl(&dword_1C392E000, obj, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: App Links could not be fetched for client: %@, item: %@", buf, 0x16u);

      }
      v52 = 0;
      v53 = 1;
      v32 = v112;
      v13 = v107;
    }
LABEL_113:

    goto LABEL_114;
  }
  pp_social_highlights_log_handle();
  v29 = objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v24, "uniqueIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v135 = v20;
    v136 = 2112;
    v137 = v55;
    _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Encountered CSSearchableItem with nil resourceURL when querying for client: %@, item: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v30 = 0;
  v14 = v21;
  v12 = v20;
  v15 = v19;
  v13 = v107;
LABEL_118:

  return v30;
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage attributionsForIdentifiers:error:](self, "attributionsForIdentifiers:error:", v8, a4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_socialAttributionFromAttributeValues:(id)a3 fetchAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v45;
  void *v46;
  BOOL v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint8_t buf[4];
  NSObject *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v5, "count");
  if (v8 == objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 9);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 10);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 11);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 12);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v9;
    v48 = v6;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = v9;
      if (!v10)
        goto LABEL_13;
    }
    else
    {
      v16 = 0;
      if (!v10)
        goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = v10;
      if (!v11)
        goto LABEL_17;
      goto LABEL_14;
    }
LABEL_13:
    v63 = 0;
    if (!v11)
      goto LABEL_17;
LABEL_14:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "stringByStandardizingPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v19, 0);

      if (!v12)
        goto LABEL_20;
LABEL_18:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = v12;
        goto LABEL_21;
      }
LABEL_20:
      v55 = 0;
LABEL_21:
      v51 = v15;
      v52 = v14;
      if (v65)
      {
        objc_opt_class();
        v64 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0 || !v13)
        {
LABEL_33:
          v49 = v10;
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v15)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v46 = v7;
                  v22 = v14;
                  v23 = v15;
                  v24 = objc_msgSend(v22, "count");
                  v53 = v23;
                  if (v24 == objc_msgSend(v23, "count") && objc_msgSend(v22, "count"))
                  {
                    v25 = 0;
                    do
                    {
                      objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "objectAtIndexedSubscript:", v25);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v26)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          if (v27)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v28 = v13;
                              v29 = v12;
                              v30 = v11;
                              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C70]), "initWithHandle:displayName:", v27, v26);
                              objc_msgSend(v46, "addObject:", v31);

                              v11 = v30;
                              v12 = v29;
                              v13 = v28;
                            }
                          }
                        }
                      }

                      ++v25;
                    }
                    while (objc_msgSend(v22, "count") > v25);
                  }

                  v7 = v46;
                }
              }
            }
          }
          v32 = v58;
          if (v58)
          {
            objc_opt_class();
            v34 = v61;
            v33 = v62;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v58, "firstObject");
              v35 = objc_claimAutoreleasedReturnValue();

              v32 = (id)v35;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = v32;
              v59 = v32;
            }
            else
            {
              v59 = 0;
            }
          }
          else
          {
            v59 = 0;
            v34 = v61;
            v33 = v62;
          }
          if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v47 = objc_msgSend(v33, "unsignedIntegerValue") == 2;
            if (!v34)
              goto LABEL_61;
          }
          else
          {
            v47 = 0;
            if (!v34)
              goto LABEL_61;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = objc_msgSend(v34, "BOOLValue");
            goto LABEL_62;
          }
LABEL_61:
          v36 = 0;
LABEL_62:
          if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            v54 = v60;
          else
            v54 = 0;
          pp_social_highlights_log_handle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v16;
            _os_log_impl(&dword_1C392E000, v37, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: Constructed social attribution with identifier: %@", buf, 0xCu);
          }

          if (v16 && v63 && v64 && objc_msgSend(v7, "count") && v59)
          {
            v38 = v13;
            v17 = v16;
            if (v57)
            {
              v39 = v7;
              objc_opt_class();
              v40 = v60;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v41 = v57;
              else
                v41 = 0;
            }
            else
            {
              v39 = v7;
              v41 = 0;
              v40 = v60;
            }
            BYTE1(v45) = v36;
            LOBYTE(v45) = v47;
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C50]), "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v17, CFSTR("Messages"), v63, v56, v55, v41, v39, v64, v59, v54, v45);
          }
          else
          {
            pp_social_highlights_log_handle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v16;
              _os_log_error_impl(&dword_1C392E000, v42, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: Constructed social attribution has missing data: %@", buf, 0xCu);
            }
            v38 = v13;

            pp_private_log_handle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413314;
              v67 = v16;
              v68 = 2112;
              v69 = v63;
              v70 = 2112;
              v71 = v64;
              v72 = 2112;
              v73 = v7;
              v74 = 2112;
              v75 = v59;
              _os_log_debug_impl(&dword_1C392E000, v43, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: attributionIdentifier: %@, conversationIdentifier: %@, sender: %@, relatedPeople: %@, timestamp: %@", buf, 0x34u);
            }
            v17 = v16;
            v39 = v7;

            v41 = 0;
            v18 = 0;
            v40 = v60;
          }

          v7 = v39;
          v6 = v48;
          goto LABEL_85;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v65, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
            goto LABEL_31;
          objc_opt_class();
          v64 = 0;
          if ((objc_opt_isKindOfClass() & 1) == 0 || !v21)
            goto LABEL_32;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C70]), "initWithHandle:displayName:", v21, v20);
            objc_msgSend(v7, "addObject:");
          }
          else
          {
LABEL_31:
            v64 = 0;
          }
LABEL_32:

          v15 = v51;
          v14 = v52;
          goto LABEL_33;
        }
      }
      v64 = 0;
      goto LABEL_33;
    }
LABEL_17:
    v56 = 0;
    if (!v12)
      goto LABEL_20;
    goto LABEL_18;
  }
  pp_social_highlights_log_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight attribution query result did not include all of the necessary components.", buf, 2u);
  }
  v18 = 0;
LABEL_85:

  return v18;
}

- (void)saveFeedbackItems:(id)a3
{
  _PASLock *lock;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (-[PPSocialHighlightStorage rerankingEnabled](self, "rerankingEnabled"))
  {
    lock = self->_lock;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PPSocialHighlightStorage_saveFeedbackItems___block_invoke;
    v6[3] = &unk_1E7E1E348;
    v7 = v5;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);

  }
}

- (id)feedbackItemsInInterval:(double)a3 includingRemote:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__20106;
  v22 = __Block_byref_object_dispose__20107;
  v23 = 0;
  v7 = (void *)MEMORY[0x1C3BD6630](self, a2);
  -[PPSocialHighlightStorage feedbackPublisherWithInterval:includingRemote:](self, "feedbackPublisherWithInterval:includingRemote:", v4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithIsIncluded:", &__block_literal_global_371);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapWithTransform:", &__block_literal_global_373);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_3;
  v17[3] = &unk_1E7E1E478;
  v17[4] = &v18;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_375;
  v16[3] = &unk_1E7E1E4A0;
  v16[4] = &v18;
  v12 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v17, v16);

  objc_autoreleasePoolPop(v7);
  v13 = (void *)v19[5];
  if (!v13)
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;
  _Block_object_dispose(&v18, 8);

  return v14;
}

- (id)feedbackItems
{
  void *v3;
  void *v4;

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialHighlightFeedbackDeletionInterval");
  -[PPSocialHighlightStorage feedbackItemsInInterval:includingRemote:](self, "feedbackItemsInInterval:includingRemote:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cleanUpFeedbackWithShouldContinueBlock:(id)a3 ttl:(double)a4 onDeleteBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _PASLock *lock;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[4];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -a4);
  v11 = objc_alloc(MEMORY[0x1E0C99D68]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "socialHighlightDecayInterval");
  v14 = (void *)objc_msgSend(v11, "initWithTimeIntervalSinceNow:", -v13);

  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke;
  v30[3] = &unk_1E7E1E4F0;
  v18 = v8;
  v35 = v18;
  v19 = v14;
  v31 = v19;
  v20 = v15;
  v32 = v20;
  v21 = v16;
  v33 = v21;
  v22 = v10;
  v34 = v22;
  v37 = v38;
  v23 = v9;
  v36 = v23;
  if (v18)
    v24 = v18;
  else
    v24 = &__block_literal_global_382;
  if (-[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v30, v24) == 1)
  {
    pp_default_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deferring before lock acquired for cleanup.", buf, 2u);
    }

  }
  pp_social_highlights_log_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v27;
    _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: repersisted %tu hidden feedback items.", buf, 0xCu);
  }

  pp_social_highlights_log_handle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v29;
    _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deleted a total of %tu feedback items.", buf, 0xCu);
  }

  _Block_object_dispose(v38, 8);
}

- (void)deleteFeedbackMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASLock *lock;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  lock = self->_lock;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke;
  v18 = &unk_1E7E1E560;
  v8 = v6;
  v19 = v8;
  v9 = v5;
  v20 = v9;
  v10 = v4;
  v21 = v10;
  v22 = &v23;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v15);
  pp_social_highlights_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v9, "count", v15, v16, v17, v18, v19, v20);
    v13 = v24[3];
    *(_DWORD *)buf = 134218240;
    v28 = v12;
    v29 = 2048;
    v30 = v13;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: distilled %lu hidden feedback, and deleted %lu others.", buf, 0x16u);
  }

  if (v24[3])
  {
    -[PPSocialHighlightStorage syncFeedback](self, "syncFeedback");
    pp_social_highlights_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: forcing sync of deletions.", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

- (void)deleteVendedMatchingPredicate:(id)a3
{
  -[PPSocialHighlightCache deleteMatchingPredicate:]((uint64_t)self->_cache, a3);
}

- (void)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  uint64_t v5;
  _PASLock *lock;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v13[3] = &unk_1E7E1E588;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  if (*((_BYTE *)v17 + 24))
  {
    pp_social_highlights_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Skipped deletion due to bloom filter miss", buf, 2u);
    }

  }
  else
  {
    v10[4] = self;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_386;
    v11[3] = &unk_1E7E1E5B0;
    v11[4] = self;
    v9[4] = self;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
    v10[3] = &unk_1E7E1E5D8;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_3;
    v9[3] = &unk_1E7E1E600;
    objc_msgSend(v7, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v11, v10, v9);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)deleteAllRecordsFromBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  PPSocialHighlightCache *cache;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke;
  v17[3] = &unk_1E7E1E628;
  v8 = v4;
  v18 = v8;
  objc_msgSend(v6, "predicateWithBlock:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage deleteFeedbackMatchingPredicate:](self, "deleteFeedbackMatchingPredicate:", v9);

  objc_autoreleasePoolPop(v5);
  v10 = (void *)MEMORY[0x1C3BD6630]();
  cache = self->_cache;
  v12 = (void *)MEMORY[0x1E0CB3880];
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke_2;
  v15[3] = &unk_1E7E1E628;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v12, "predicateWithBlock:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightCache deleteMatchingPredicate:]((uint64_t)cache, v14);

  objc_autoreleasePoolPop(v10);
}

- (void)deleteAllRecordsFromBundleId:(id)a3 matchingDomainSelection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke;
  v24[3] = &unk_1E7E1E650;
  v11 = v6;
  v25 = v11;
  v12 = v7;
  v26 = v12;
  objc_msgSend(v9, "predicateWithBlock:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage deleteFeedbackMatchingPredicate:](self, "deleteFeedbackMatchingPredicate:", v13);

  v14 = (void *)MEMORY[0x1E0CB3880];
  v18 = v10;
  v19 = 3221225472;
  v20 = __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke_2;
  v21 = &unk_1E7E1E650;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  objc_msgSend(v14, "predicateWithBlock:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage deleteVendedMatchingPredicate:](self, "deleteVendedMatchingPredicate:", v17, v18, v19, v20, v21);

  objc_autoreleasePoolPop(v8);
}

- (void)deleteAllRecordsFromBundleId:(id)a3 matchingAttributionIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
  v9 = (void *)MEMORY[0x1C3BD6630]();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke;
  v25[3] = &unk_1E7E1E650;
  v12 = v6;
  v26 = v12;
  v13 = v8;
  v27 = v13;
  objc_msgSend(v10, "predicateWithBlock:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage deleteFeedbackMatchingPredicate:](self, "deleteFeedbackMatchingPredicate:", v14);

  v15 = (void *)MEMORY[0x1E0CB3880];
  v19 = v11;
  v20 = 3221225472;
  v21 = __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke_2;
  v22 = &unk_1E7E1E650;
  v16 = v12;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  objc_msgSend(v15, "predicateWithBlock:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightStorage deleteVendedMatchingPredicate:](self, "deleteVendedMatchingPredicate:", v18, v19, v20, v21, v22);

  objc_autoreleasePoolPop(v9);
}

- (double)_sessionLoggingRate
{
  char v2;
  double result;
  int v4;

  v2 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  result = 1.0;
  if ((v2 & 1) == 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E0D81588], "isBetaBuild", 1.0);
    result = 0.01;
    if (!v4)
      return 0.0;
  }
  return result;
}

- (void)_performFeedbackSessionLoggingForEnrichedFeedback:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
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
  void *context;
  void *v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PPSocialHighlightStorage _sessionLoggingRate](self, "_sessionLoggingRate");
  if (objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:"))
  {
    context = (void *)MEMORY[0x1C3BD6630]();
    v45 = v6;
    objc_msgSend(v6, "highlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "features");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    v44 = v7;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v14 = v12;

    v15 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("_"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "_pas_stringBackedByUTF8CString");
            v26 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v26;
          }
          objc_msgSend(v24, "_pas_stringBackedByUTF8CString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v27);

          objc_autoreleasePoolPop(v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v18);
    }

    v7 = v44;
    objc_msgSend(v44, "_pas_stringBackedByUTF8CString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("clientId"));

    v6 = v45;
    v29 = objc_msgSend(v45, "feedbackType");
    if (v29 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_1E7E1E740[v29];
    }
    -[__CFString _pas_stringBackedByUTF8CString](v30, "_pas_stringBackedByUTF8CString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("feedbackType"));

    v32 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v45, "highlight");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isPrimary"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v34, CFSTR("isPrimary"));

    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v45, "highlight");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "isProxy"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v37, CFSTR("isProxy"));

    v38 = (void *)objc_opt_new();
    objc_msgSend(v38, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "substringToIndex:", (unint64_t)objc_msgSend(v39, "length") >> 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_pas_stringBackedByUTF8CString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v41, CFSTR("uuid"));

    pp_social_highlights_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: performing feedback session logging.", buf, 2u);
    }

    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlightSessionMatched"), v15, 0);
    objc_autoreleasePoolPop(context);
  }
  else
  {
    pp_social_highlights_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: skipping feedback session logging as not selected for sampling.", buf, 2u);
    }

  }
}

- (void)_writeEnrichedFeedbackForAttributionIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _PASLock *lock;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
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
  void *v42;
  _PASLock *v43;
  id v44;
  __CFString *v45;
  PPSocialHighlightStorage *v46;
  void *v47;
  void *context;
  id v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  PPSocialHighlightStorage *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  __CFString *v71;
  uint64_t v72;

  v51 = *(_QWORD *)&a5;
  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pp_private_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v51 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v51);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = off_1E7E1E740[v51];
    }
    *(_DWORD *)buf = 138412802;
    v67 = v7;
    v68 = 2112;
    v69 = v8;
    v70 = 2112;
    v71 = v45;
    _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: saving attribution feedback for item %@, from client '%@' of type %@.", buf, 0x20u);

  }
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke;
  v63[3] = &unk_1E7E1E678;
  v10 = v7;
  v64 = v10;
  -[PPSocialHighlightStorage _mostRecentRankedHighlightsMatchingTest:client:](self, "_mostRecentRankedHighlightsMatchingTest:client:", v63, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v12 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v11, "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
LABEL_4:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v17);
      if (objc_msgSend(v18, "hasIsPrimary"))
      {
        if ((objc_msgSend(v18, "isPrimary") & 1) != 0)
          break;
      }
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (v15)
          goto LABEL_4;
        goto LABEL_11;
      }
    }
    v21 = v18;

    v19 = v51;
    v20 = MEMORY[0x1E0C809B0];
    if (v21)
      goto LABEL_16;
  }
  else
  {
LABEL_11:

    v19 = v51;
    v20 = MEMORY[0x1E0C809B0];
  }
  pp_social_highlights_log_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v8;
    _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: received feedback from %@, but was unable to match a primary highlight.", buf, 0xCu);
  }

  v21 = 0;
LABEL_16:
  v50 = v21;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setClientIdentifier:", v8);
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  objc_msgSend(v23, "setFeedbackCreationSecondsSinceReferenceDate:");

  objc_msgSend(v23, "setFeedbackType:", v19);
  lock = self->_lock;
  v54[0] = v20;
  v54[1] = 3221225472;
  v54[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_411;
  v54[3] = &unk_1E7E1E6A0;
  v26 = v11;
  v55 = v26;
  v27 = v23;
  v56 = v27;
  v57 = self;
  v28 = v8;
  v58 = v28;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v54);
  if (!objc_msgSend(v26, "count"))
  {
    context = (void *)MEMORY[0x1C3BD6630]();
    pp_private_log_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v10;
      v68 = 2112;
      v69 = v28;
      _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: unable to match feedback for attribution identifier: %@ from client '%@'", buf, 0x16u);
    }

    -[PPSocialHighlightStorage attributionForIdentifier:error:](self, "attributionForIdentifier:error:", v10, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v10;
    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "setAttributionIdentifier:", v49);
    v47 = v30;
    objc_msgSend(v30, "groupDisplayName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDisplayName:", v32);

    v33 = (void *)MEMORY[0x1E0D70D00];
    objc_msgSend(v30, "groupPhotoPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "absoluteString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dataUsingEncoding:", 4);
    v46 = self;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "Sha256ForData:withSalt:", v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "substringToIndex:", 8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setGroupPhotoPathDigest:", v39);

    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "setClientIdentifier:", v28);
    objc_msgSend(v40, "setFeedbackType:", v51);
    v41 = (void *)objc_opt_new();
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    objc_msgSend(v40, "setFeedbackCreationSecondsSinceReferenceDate:");

    objc_msgSend(v40, "setHighlight:", v31);
    +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v46->_lock;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_412;
    v52[3] = &unk_1E7E1E348;
    v53 = v42;
    v44 = v42;
    -[_PASLock runWithLockAcquired:](v43, "runWithLockAcquired:", v52);

    v10 = v49;
    objc_autoreleasePoolPop(context);
  }

}

- (void)_writeEnrichedFeedbackForHighlightIdentifier:(id)a3 client:(id)a4 feedbackType:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  _PASLock *lock;
  id v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _PASLock *v36;
  id v37;
  __CFString *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  PPSocialHighlightStorage *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  __CFString *v58;
  uint64_t v59;

  v5 = *(_QWORD *)&a5;
  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pp_private_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (v5 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E7E1E740[v5];
    }
    *(_DWORD *)buf = 138412802;
    v54 = v8;
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = v38;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: saving feedback for item %@, from client '%@' of type %@.", buf, 0x20u);

  }
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke;
  v50[3] = &unk_1E7E1E678;
  v11 = v8;
  v51 = v11;
  -[PPSocialHighlightStorage _mostRecentRankedHighlightsMatchingTest:client:](self, "_mostRecentRankedHighlightsMatchingTest:client:", v50, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v12, "reverseObjectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v13);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
LABEL_4:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
      if (objc_msgSend(v19, "hasIsPrimary"))
      {
        if ((objc_msgSend(v19, "isPrimary") & 1) != 0)
          break;
      }
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v16)
          goto LABEL_4;
        goto LABEL_11;
      }
    }
    v20 = v19;

    if (v20)
      goto LABEL_16;
  }
  else
  {
LABEL_11:

  }
  pp_social_highlights_log_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v9;
    _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: received feedback from %@, but was unable to match a primary highlight.", buf, 0xCu);
  }

  v20 = 0;
LABEL_16:
  objc_msgSend(v20, "batchIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSocialHighlightStorage countDistinctRankedItemsMatchingBatchIdentifier:](self, "countDistinctRankedItemsMatchingBatchIdentifier:", v22);

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setClientIdentifier:", v9);
  objc_msgSend(v24, "setFeedbackType:", v5);
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "timeIntervalSinceReferenceDate");
  objc_msgSend(v24, "setFeedbackCreationSecondsSinceReferenceDate:");

  lock = self->_lock;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_413;
  v41[3] = &unk_1E7E1E6A0;
  v27 = v12;
  v42 = v27;
  v28 = v24;
  v43 = v28;
  v44 = self;
  v29 = v9;
  v45 = v29;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v41);
  +[PPSocialHighlightMetrics logMatchedFeedbackForHighlightMatches:batchSize:type:client:](PPSocialHighlightMetrics, "logMatchedFeedbackForHighlightMatches:batchSize:type:client:", v27, v23, v5, v29);
  if (!objc_msgSend(v27, "count"))
  {
    v30 = (void *)MEMORY[0x1C3BD6630]();
    pp_private_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v11;
      v55 = 2112;
      v56 = v29;
      _os_log_debug_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: unable to match feedback for identifier: %@ from client '%@'", buf, 0x16u);
    }

    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setHighlightIdentifier:", v11);
    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setClientIdentifier:", v29);
    objc_msgSend(v33, "setFeedbackType:", v5);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v34, "timeIntervalSinceReferenceDate");
    objc_msgSend(v33, "setFeedbackCreationSecondsSinceReferenceDate:");

    objc_msgSend(v33, "setHighlight:", v32);
    +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = self->_lock;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_415;
    v39[3] = &unk_1E7E1E348;
    v40 = v35;
    v37 = v35;
    -[_PASLock runWithLockAcquired:](v36, "runWithLockAcquired:", v39);

    objc_autoreleasePoolPop(v30);
  }

}

- (BOOL)saveFeedbackForHighlightIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (-[PPSocialHighlightStorage rerankingEnabled](self, "rerankingEnabled"))
  {
    v11 = +[PPSocialHighlightStorage unifiedFeedbackTypeForHighlightFeedbackType:](PPSocialHighlightStorage, "unifiedFeedbackTypeForHighlightFeedbackType:", a4);
    -[PPSocialHighlightStorage _writeEnrichedFeedbackForHighlightIdentifier:client:feedbackType:](self, "_writeEnrichedFeedbackForHighlightIdentifier:client:feedbackType:", v9, v10, v11);
    if (a4 == 2)
    {
      pp_social_highlights_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: forcing a sync as a hide occurred.", buf, 2u);
      }

      -[PPSocialHighlightStorage syncFeedback](self, "syncFeedback");
      pp_social_highlights_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v11 >= 0xB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_1E7E1E740[v11];
        }
        *(_DWORD *)buf = 138412546;
        v17 = v14;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: invalidating cache due to feedback of type %@ from client '%@'", buf, 0x16u);

      }
      -[PPSocialHighlightCache invalidateCacheForClient:]((uint64_t)self->_cache, v10);
    }
  }

  return 1;
}

- (BOOL)saveAttributionFeedbackForAttributionIdentifier:(id)a3 feedbackType:(unint64_t)a4 client:(id)a5 variant:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a5;
  if (-[PPSocialHighlightStorage rerankingEnabled](self, "rerankingEnabled"))
    -[PPSocialHighlightStorage _writeEnrichedFeedbackForAttributionIdentifier:client:feedbackType:](self, "_writeEnrichedFeedbackForAttributionIdentifier:client:feedbackType:", v9, v10, +[PPSocialHighlightStorage attributionFeedbackTypeForAttributionFeedbackType:](PPSocialHighlightStorage, "attributionFeedbackTypeForAttributionFeedbackType:", a4));

  return 1;
}

- (id)rankedItems
{
  PPSocialHighlightCache *cache;
  void *v3;
  void *v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;

  cache = self->_cache;
  if (!cache)
    return 0;
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1C3BD6630]();
  lock = cache->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PPSocialHighlightCache_allItems__block_invoke;
  v8[3] = &unk_1E7E1CB78;
  v6 = v3;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void)clearStreams
{
  -[PPSocialHighlightStorage clearRankedStream](self, "clearRankedStream");
  -[PPSocialHighlightStorage clearFeedbackStream](self, "clearFeedbackStream");
}

- (void)clearRankedStream
{
  void *v3;
  PPSocialHighlightCache *cache;
  void *v5;

  v3 = (void *)MEMORY[0x1C3BD6630](self, a2);
  cache = self->_cache;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightCache deleteMatchingPredicate:]((uint64_t)cache, v5);

  objc_autoreleasePoolPop(v3);
}

- (void)clearFeedbackStream
{
  void *v3;

  v3 = (void *)MEMORY[0x1C3BD6630](self, a2);
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_416);
  objc_autoreleasePoolPop(v3);
}

- (id)cachedRankedHighlightsForClient:(id)a3 variant:(id)a4 queriedHighlights:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  PPSocialHighlightCache *cache;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__20106;
  v29 = __Block_byref_object_dispose__20107;
  v30 = 0;
  v11 = dispatch_semaphore_create(0);
  cache = self->_cache;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __86__PPSocialHighlightStorage_cachedRankedHighlightsForClient_variant_queriedHighlights___block_invoke;
  v22 = &unk_1E7E1E278;
  v24 = &v25;
  v13 = v11;
  v23 = v13;
  -[PPSocialHighlightCache cachedRankedHighlightsForClient:variant:completion:]((uint64_t)cache, v8, &v19);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (v10
    && (-[PPSocialHighlightCache cachedHighlightsArrayIsValid:queryResults:]((uint64_t)self->_cache, (void *)v26[5], v10) & 1) == 0)
  {
    -[PPSocialHighlightStorage invalidateCacheForClient:](self, "invalidateCacheForClient:", v8, v19, v20, v21, v22);
    pp_social_highlights_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v8;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: cache for client '%@' is invalid, re-ranking.", buf, 0xCu);
    }

    v16 = 0;
  }
  else
  {
    pp_social_highlights_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend((id)v26[5], "count", v19, v20, v21, v22);
      *(_DWORD *)buf = 134218242;
      v32 = v15;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: returning cached %tu items for client '%@'", buf, 0x16u);
    }

    v16 = (void *)objc_msgSend((id)v26[5], "copy");
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (unint64_t)countDistinctRankedItemsMatchingBatchIdentifier:(id)a3
{
  PPSocialHighlightCache *cache;
  id v4;
  void *v5;
  unint64_t v6;
  _PASLock *lock;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  cache = self->_cache;
  v4 = a3;
  v5 = v4;
  if (cache)
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      lock = cache->_lock;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke;
      v9[3] = &unk_1E7E1CDA0;
      v10 = v4;
      v11 = &v12;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
      v6 = v13[3];

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)saveOrderedBatch:(id)a3
{
  -[PPSocialHighlightCache saveOrderedBatch:]((uint64_t)self->_cache, a3);
}

- (id)_mostRecentRankedHighlightsMatchingTest:(id)a3 client:(id)a4
{
  PPSocialHighlightCache *cache;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  __int128 v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  cache = self->_cache;
  v6 = a3;
  v7 = a4;
  if (cache)
  {
    v8 = (void *)objc_opt_new();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__597;
    v22[4] = __Block_byref_object_dispose__598;
    v23 = 0;
    v9 = (void *)MEMORY[0x1C3BD6630]();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__597;
    v34 = __Block_byref_object_dispose__598;
    v35 = 0;
    v10 = MEMORY[0x1E0C809B0];
    lock = cache->_lock;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke;
    v21[3] = &unk_1E7E1CCF8;
    v21[4] = &buf;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v21);
    v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)&v24 = v10;
    *((_QWORD *)&v24 + 1) = 3221225472;
    v25 = __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_30;
    v26 = &unk_1E7E150D8;
    v27 = v7;
    v29 = v6;
    v30 = v22;
    v13 = v8;
    v28 = v13;
    v14 = (id)objc_msgSend(v12, "sinkWithCompletion:shouldContinue:", &__block_literal_global_29, &v24);

    _Block_object_dispose(&buf, 8);
    objc_autoreleasePoolPop(v9);
    pp_social_highlights_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v13, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found %tu matching highlights.", (uint8_t *)&buf, 0xCu);
    }

    v17 = v13;
    _Block_object_dispose(v22, 8);

  }
  else
  {
    v17 = 0;
  }

  pp_social_highlights_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v17, "count");
    LODWORD(v24) = 134217984;
    *(_QWORD *)((char *)&v24 + 4) = v19;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: found %tu matching highlights.", (uint8_t *)&v24, 0xCu);
  }

  return v17;
}

- (void)invalidateCacheForClient:(id)a3
{
  -[PPSocialHighlightCache invalidateCacheForClient:]((uint64_t)self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsAppLinkCache, 0);
  objc_storeStrong((id *)&self->_socialHighlightStorageUtils, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __86__PPSocialHighlightStorage_cachedRankedHighlightsForClient_variant_queriedHighlights___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __47__PPSocialHighlightStorage_clearFeedbackStream__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "deleteLocalAndRemoteEventsWithReason:usingPredicateBlock:", 1, &__block_literal_global_417);
}

uint64_t __47__PPSocialHighlightStorage_clearFeedbackStream__block_invoke_2()
{
  return 1;
}

uint64_t __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasHighlightIdentifier"))
  {
    objc_msgSend(v3, "highlightIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_413(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3[1], "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD6630]();
        v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
        objc_msgSend(v12, "setHighlight:", v10);
        objc_msgSend(*(id *)(a1 + 48), "_performFeedbackSessionLoggingForEnrichedFeedback:client:", v12, *(_QWORD *)(a1 + 56));
        +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v13);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

void __93__PPSocialHighlightStorage__writeEnrichedFeedbackForHighlightIdentifier_client_feedbackType___block_invoke_415(uint64_t a1, uint64_t a2)
{
  -[PPSocialHighlightStorageGuardedData sendEvent:](a2, *(void **)(a1 + 32));
}

uint64_t __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasAttributionIdentifier"))
  {
    objc_msgSend(v3, "attributionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_411(uint64_t a1, void *a2)
{
  id v3;
  id v4;
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
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD6630](v5);
        v11 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy", (_QWORD)v13);
        objc_msgSend(v11, "setHighlight:", v9);
        objc_msgSend(*(id *)(a1 + 48), "_performFeedbackSessionLoggingForEnrichedFeedback:client:", v11, *(_QWORD *)(a1 + 56));
        +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v12);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v5;
    }
    while (v5);
  }

}

void __95__PPSocialHighlightStorage__writeEnrichedFeedbackForAttributionIdentifier_client_feedbackType___block_invoke_412(uint64_t a1, uint64_t a2)
{
  -[PPSocialHighlightStorageGuardedData sendEvent:](a2, *(void **)(a1 + 32));
}

uint64_t __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highlight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sourceBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v9, "sourceBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v12))
    {
      objc_msgSend(v9, "attributionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = *(void **)(a1 + 40);
        objc_msgSend(v9, "attributionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "containsObject:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v16;
}

uint64_t __88__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingAttributionIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v8, "sourceBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      objc_msgSend(v8, "attributionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v8, "attributionIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsObject:", v14);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

uint64_t __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highlight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sourceBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v9, "sourceBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v12))
    {
      objc_msgSend(v9, "domainIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = *(void **)(a1 + 40);
        objc_msgSend(v9, "domainIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "containsDomain:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v16;
}

uint64_t __81__PPSocialHighlightStorage_deleteAllRecordsFromBundleId_matchingDomainSelection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v8, "sourceBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      objc_msgSend(v8, "domainIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v8, "domainIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsDomain:", v14);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

uint64_t __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highlight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sourceBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v9, "sourceBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

  }
  else
  {
    v13 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v13;
}

uint64_t __57__PPSocialHighlightStorage_deleteAllRecordsFromBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasSourceBundleId"))
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;

  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if (a2)
  {
    if (*(_QWORD *)(a2 + 16))
      LOBYTE(a2) = objc_msgSend(v4, "matchesBloomFilter:") ^ 1;
    else
      LOBYTE(a2) = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

uint64_t __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_386(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAllRecordsFromBundleId:", a2);
}

uint64_t __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAllRecordsFromBundleId:matchingDomainSelection:", a2, a3);
}

void __72__PPSocialHighlightStorage_deleteDataDerivedFromContentMatchingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllRecordsFromBundleId:matchingAttributionIdentifiers:", v5, v6);

}

void __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  double v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id *v37;
  uint64_t v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3[1];
    LODWORD(v5) = 869711765;
    objc_msgSend(MEMORY[0x1E0D81538], "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", 4000, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v3[2];
    v3[2] = (id)v6;

    v8 = MEMORY[0x1E0C809B0];
    v3[3] = 0;
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke_383;
    v33[3] = &unk_1E7E1E538;
    v34 = *(id *)(a1 + 32);
    v35 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v36 = v9;
    v38 = v10;
    v11 = v3;
    v37 = v11;
    -[NSObject deleteLocalAndRemoteEventsWithReason:usingPredicateBlock:](v4, "deleteLocalAndRemoteEventsWithReason:usingPredicateBlock:", 2, v33);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v13)
    {
      v14 = v13;
      v26 = v4;
      v27 = v3;
      v15 = *(_QWORD *)v30;
      obj = v12;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1C3BD6630]();
          v19 = (void *)objc_opt_new();
          v20 = (void *)objc_opt_new();
          objc_msgSend(v19, "setHighlight:", v20);

          objc_msgSend(v17, "highlight");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "highlightIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "highlight");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setHighlightIdentifier:", v22);

          objc_msgSend(v17, "feedbackCreationSecondsSinceReferenceDate");
          objc_msgSend(v19, "setFeedbackCreationSecondsSinceReferenceDate:");
          objc_msgSend(v19, "setFeedbackType:", 2);
          +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v11, v24);

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      }
      while (v14);

      v4 = v26;
      v3 = v27;
      if (!v11)
        goto LABEL_16;
    }
    else
    {

    }
    if ((unint64_t)v3[3] <= 0x7F)
    {
      v25 = v3[2];
      v3[2] = 0;

      v3[3] = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  pp_social_highlights_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failing deletion due to Biome version mismatch.", buf, 2u);
  }
LABEL_17:

}

uint64_t __60__PPSocialHighlightStorage_deleteFeedbackMatchingPredicate___block_invoke_383(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:](PPSocialHighlightFeedbackUtils, "feedbackFromBiomeEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "feedbackType") == 2)
  {
    objc_msgSend(v6, "highlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_10;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "highlight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v11);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v6, "highlight");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "highlightIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

    }
  }
  v15 = objc_msgSend(*(id *)(a1 + 48), "evaluateWithObject:", v3);
  if (v6)
    v16 = v15 == 0;
  else
    v16 = 0;
  if (v16)
  {
    -[PPSocialHighlightStorageGuardedData addToBloomFilter:](*(_QWORD *)(a1 + 56), v5);
    v17 = 0;
    goto LABEL_12;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
LABEL_10:
  v17 = 1;
LABEL_12:

  objc_autoreleasePoolPop(v4);
  return v17;
}

void __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3[1];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_378;
    v18[3] = &unk_1E7E1E4C8;
    v23 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v13 = *(_OWORD *)(a1 + 72);
    v5 = (id)v13;
    v24 = v13;
    -[NSObject deleteLocalAndRemoteEventsWithReason:usingPredicateBlock:](v4, "deleteLocalAndRemoteEventsWithReason:usingPredicateBlock:", 1, v18);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1C3BD6630]();
          -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v11);
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
      }
      while (v8);
    }

  }
  else
  {
    pp_social_highlights_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: failing deletion due to Biome version mismatch.", buf, 2u);
    }
  }

}

uint64_t __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_380()
{
  return 1;
}

uint64_t __85__PPSocialHighlightStorage_cleanUpFeedbackWithShouldContinueBlock_ttl_onDeleteBlock___block_invoke_378(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint8_t v35[16];

  v5 = a2;
  v6 = a1[8];
  if (v6 && ((*(uint64_t (**)(void))(v6 + 16))() & 1) == 0)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: deferring cleanup.", v35, 2u);
    }

    *a3 = 1;
  }
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v5, "timestamp");
  v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(v5, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "feedbackCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eventBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "feedbackType");

  if (v14 == 2 && objc_msgSend(v12, "compare:", a1[4]) != -1)
  {
    objc_msgSend(v5, "eventBody");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v5, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "highlight");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "highlightIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)a1[5];
        objc_msgSend(v5, "eventBody");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "highlight");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "highlightIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v20) = objc_msgSend(v20, "containsObject:", v23);

        if ((v20 & 1) == 0)
        {
          v24 = (void *)a1[6];
          objc_msgSend(v5, "eventBody");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);

          v26 = (void *)a1[5];
          objc_msgSend(v5, "eventBody");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "highlight");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "highlightIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v29);

LABEL_20:
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
  }
  if (objc_msgSend(v10, "compare:", a1[7]) == -1 || objc_msgSend(v12, "compare:", a1[7]) == -1 || v14 == 2)
  {
    objc_msgSend(v5, "eventBody");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "eventBody");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:](PPSocialHighlightFeedbackUtils, "feedbackFromBiomeEvent:", v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      ++*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
      if (v27)
      {
        v33 = a1[9];
        if (v33)
          (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v27);
      }
      goto LABEL_20;
    }
LABEL_21:
    v30 = 1;
    goto LABEL_22;
  }
  v30 = 0;
LABEL_22:

  objc_autoreleasePoolPop(v8);
  return v30;
}

void __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = objc_msgSend(v3, "state");
  pp_social_highlights_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = (uint64_t)v8;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightStorage: error collecting feedback: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: successfully collected feedback %tu feedback items.", (uint8_t *)&v10, 0xCu);
  }

  objc_autoreleasePoolPop(v4);
}

void __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_375(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSocialHighlightFeedbackUtils feedbackFromBiomeEvent:](PPSocialHighlightFeedbackUtils, "feedbackFromBiomeEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

BOOL __68__PPSocialHighlightStorage_feedbackItemsInInterval_includingRemote___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);

  return v4 != 0;
}

BOOL __74__PPSocialHighlightStorage_feedbackPublisherWithInterval_includingRemote___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: filtering event from Biome with nil event body.", v7, 2u);
    }

  }
  objc_autoreleasePoolPop(v3);

  return v4 != 0;
}

void __46__PPSocialHighlightStorage_saveFeedbackItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD6630](v6);
        +[PPSocialHighlightFeedbackUtils biomeEventFromFeedback:](PPSocialHighlightFeedbackUtils, "biomeEventFromFeedback:", v10, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSocialHighlightStorageGuardedData sendEvent:]((uint64_t)v3, v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      v7 = v6;
    }
    while (v6);
  }

  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v20 = v14;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_INFO, "PPSocialHighlightStorage: saved %tu events to the stream.", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __98__PPSocialHighlightStorage_rankedHighlightsWithLimit_client_variant_applicationIdentifiers_error___block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __122__PPSocialHighlightStorage_sharedContentForClient_variant_applicationIdentifiers_limit_autoDonatingChatIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isValidHighlight:applicationIdentifiers:", v3, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:

      v4 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v6;
    v7 = "PPSocialHighlightStorage: item: %@ suppressed as it is not valid";
    v8 = v5;
    v9 = 12;
LABEL_19:
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v23, v9);

    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isClientEntitledForItem:client:applicationIdentifiers:blockedHosts:iTunesOverrideChecker:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v22 = *(void **)(a1 + 48);
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v22;
    v25 = 2112;
    v26 = v6;
    v7 = "PPSocialHighlightStorage: Client: %@, is not entitled for item: %@";
    v8 = v5;
    v9 = 22;
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(a1 + 72), "isEqualToString:", *MEMORY[0x1E0D70F20]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v11 = (void *)MEMORY[0x1C3BD6630]();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v3, "attributeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "authorAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v14);

    objc_msgSend(v3, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recipientAddresses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v16);

    objc_msgSend(v3, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountHandles");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectsInArray:", v18);

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(*(id *)(a1 + 80), "allowableByContactsHandles:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v19, "allowedByScreenTime");
      if ((v4 & 1) == 0)
      {
        pp_social_highlights_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v21;
          _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: Suppressing item due to Screen Time restrictions: %@", (uint8_t *)&v23, 0xCu);

        }
      }

    }
    else
    {
      v4 = 1;
    }

    objc_autoreleasePoolPop(v11);
  }
LABEL_9:

  return v4;
}

uint64_t __123__PPSocialHighlightStorage__rankableItemsForClient_variant_applicationIdentifiers_autoDonatingChatIdentifiers_limit_error___block_invoke_333(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __123__PPSocialHighlightStorage__rankableItemsForClient_variant_applicationIdentifiers_autoDonatingChatIdentifiers_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3[1];
  objc_msgSend(v3[2], "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3[2], "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_23;
  }
  else
  {
    v8 = 0;
    if (!v7)
      goto LABEL_23;
  }
  if (!*(_QWORD *)(a1 + 40) || v8)
  {
    v29 = v8;
    v30 = v7;
    v31 = v5;
    v32 = v4;
    v33 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
          v15 = *(void **)(a1 + 48);
          v16 = objc_alloc(MEMORY[0x1E0D81638]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "containsObject:", v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithFirst:second:", v14, v17);
          objc_msgSend(v15, "addObject:", v18);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v11);
    }

    v4 = v32;
    v3 = v33;
    v7 = v30;
    v5 = v31;
    v8 = v29;
    if (v29)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v29;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v35;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v23);
            v25 = *(void **)(a1 + 48);
            v26 = objc_alloc(MEMORY[0x1E0D81638]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "containsObject:", v24));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v26, "initWithFirst:second:", v24, v27);
            objc_msgSend(v25, "addObject:", v28);

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v21);
      }

      v4 = v32;
      v3 = v33;
      v7 = v30;
      v5 = v31;
      v8 = v29;
    }
  }
LABEL_23:

}

void __77__PPSocialHighlightStorage_applicationIdentifiersForResourceURL_resolvedURL___block_invoke_2(id *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  id *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  if ((unint64_t)objc_msgSend(v37[3], "count") >= 0x7D1)
  {
    pp_social_highlights_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: clearing LSAppLink cache.", buf, 2u);
    }

    objc_msgSend(a1[4], "resetLSAppLinkCache");
  }
  if (!v37[3])
  {
    v4 = objc_msgSend(v37[2], "mutableCopy");
    v5 = v37[3];
    v37[3] = (id)v4;

    objc_storeStrong(v37 + 2, v37[3]);
  }
  objc_msgSend(a1[5], "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "absoluteString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  if (objc_msgSend(a1[7], "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = a1[7];
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v11, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v11, "second");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "BOOLValue");

            objc_msgSend(v37[3], "objectForKeyedSubscript:", v6);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            v18 = (void *)MEMORY[0x1E0C9AA60];
            if (v16)
              v18 = (void *)v16;
            v19 = v18;

            if ((objc_msgSend(v19, "containsObject:", v13) & 1) == 0)
            {
              objc_msgSend(v19, "arrayByAddingObject:", v13);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37[3], "setObject:forKeyedSubscript:", v20, v6);

            }
            if (a1[6])
            {
              v21 = a1;
              objc_msgSend(v37[3], "objectForKeyedSubscript:", v36);
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              v24 = (void *)MEMORY[0x1E0C9AA60];
              if (v22)
                v24 = (void *)v22;
              v25 = v24;

              if ((objc_msgSend(v25, "containsObject:", v13) & 1) == 0)
              {
                objc_msgSend(v25, "arrayByAddingObject:", v13);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37[3], "setObject:forKeyedSubscript:", v26, v36);

              }
              a1 = v21;
              v6 = v33;
            }
            if (v15)
              objc_msgSend(v37[1], "addObject:", v13);

          }
          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);
    }
    goto LABEL_38;
  }
  objc_msgSend(v37[3], "objectForKeyedSubscript:", v6);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v29 = MEMORY[0x1E0C9AA60];
  if (v27)
    v30 = v27;
  else
    v30 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v37[3], "setObject:forKeyedSubscript:", v30, v6, v6);

  if (a1[6])
  {
    objc_msgSend(v37[3], "objectForKeyedSubscript:", v36);
    v31 = objc_claimAutoreleasedReturnValue();
    obj = (id)v31;
    if (v31)
      v32 = v31;
    else
      v32 = v29;
    v6 = v34;
    objc_msgSend(v37[3], "setObject:forKeyedSubscript:", v32, v36);
LABEL_38:

  }
}

void __47__PPSocialHighlightStorage_resetLSAppLinkCache__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)a2[2];
  a2[2] = MEMORY[0x1E0C9AA70];
  v3 = a2;

  v4 = (void *)v3[3];
  v3[3] = 0;

  v5 = objc_opt_new();
  v6 = (id)v3[1];
  v3[1] = v5;

}

void __48__PPSocialHighlightStorage__socialLayerDefaults__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SocialLayer"));
  v2 = (void *)_socialLayerDefaults__pasExprOnceResult;
  _socialLayerDefaults__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __51__PPSocialHighlightStorage__screenTimeConversation__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D8C050]);
  v2 = *MEMORY[0x1E0D70E28];
  PPSharedCNContactStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithBundleIdentifier:contactStore:", v2, v3);
  v5 = (void *)_screenTimeConversation__pasExprOnceResult;
  _screenTimeConversation__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_288(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "highlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  if (objc_msgSend(v3, "isCollaboration") && v4 && v27)
  {
    v6 = v4;
    v25 = v3;
    v26 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
          objc_msgSend(a1[5], "objectForKeyedSubscript:", v6, v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v27);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

    v16 = (void *)MEMORY[0x1E0C99E60];
    v4 = v6;
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueForKey:", CFSTR("attributionIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "objectForKeyedSubscript:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2_292;
    v28[3] = &unk_1E7E1F8C8;
    v29 = v20;
    v22 = v20;
    objc_msgSend(v21, "_pas_filteredArrayWithTest:", v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v25;
  }
  objc_msgSend(a1[7], "highlightFromRankableHighlight:attributionIdentifiers:earliestAttributionIdentifiers:", v3, v5, v26, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2_292(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_3()
{
  return (id)objc_opt_new();
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke_2()
{
  return (id)objc_opt_new();
}

id __94__PPSocialHighlightStorage_deduplicateAndSortRankedHighlights_attributionLookup_limit_client___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isCollaboration"))
  {
    objc_msgSend(v2, "highlightIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v3;
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_20297);
      if (v8 < *(_QWORD *)(a1 + 48))
        objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v7, v8);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > *(_QWORD *)(a1 + 48))
        objc_msgSend(*(id *)(a1 + 32), "removeLastObject");

      objc_autoreleasePoolPop(v6);
    }
  }

}

uint64_t __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_271(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "attributeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syndicationStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 0;
    v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
    if (v7 == 2)
      v11 = 1;
    else
      v11 = v10;
    if (v7 == 8)
      v9 = 1;
    else
      v9 = v11;

  }
  else
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_fault_impl(&dword_1C392E000, v8, OS_LOG_TYPE_FAULT, "PPSocialHighlightStorage: CSSI %{public}@ missing domainIdentifier", (uint8_t *)&v14, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

uint64_t __90__PPSocialHighlightStorage_sharedContentFromChats_dateRange_applicationIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contentCreationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = objc_msgSend(v14, "compare:", v9);
  return v15;
}

id __103__PPSocialHighlightStorage_rankedHighlightsForSyncedItems_client_variant_applicationIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPRankableSocialHighlightUtils rankableHighlightFromSyncedItem:applicationIdentifiers:clientIdentifier:](PPRankableSocialHighlightUtils, "rankableHighlightFromSyncedItem:applicationIdentifiers:clientIdentifier:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
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
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v8, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accountIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
        }
        else
        {
          pp_social_highlights_log_handle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "attributeSet");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v20 = v14;
            _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: CoreSpotlight automatic donation query returned nil accountIdentifier for chat: %@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

}

void __75__PPSocialHighlightStorage_autoDonatingChatsWithShouldContinueBlock_error___block_invoke_235(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)feedbackPruningPolicy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D024B0]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialHighlightFeedbackDeletionInterval");
  v4 = (void *)objc_msgSend(v2, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 7340032);

  return v4;
}

+ (unint64_t)entitlementStatusForClient:(id)a3 applicationIdentifiers:(id)a4
{
  void *v4;
  unint64_t v5;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isWebBrowser"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)appLinksForResourceURL:(id)a3 resolvedURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v5, 1, 1, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  pp_social_highlights_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v8;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: LSAppLink URL query error: %@", buf, 0xCu);
    }
    v14 = 0;
    v7 = v10;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v21 = v16;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: LSAppLink for URL count: %tu", buf, 0xCu);
  }

  if (v6 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {

    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v6, 1, 1, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    pp_social_highlights_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134217984;
        v21 = v17;
        _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPSocialHighlightStorage: LSAppLink for resolvedURL count: %tu", buf, 0xCu);
      }

      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v11);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = v11;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v8;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightStorage: LSAppLink resolvedURL query error: %@", buf, 0xCu);
      }

      v14 = 0;
    }
LABEL_13:

    v7 = (void *)v14;
  }

  return v7;
}

+ (int)unifiedFeedbackTypeForHighlightFeedbackType:(unint64_t)a3
{
  if (a3 > 7)
    return 2;
  else
    return dword_1C3AE5284[a3];
}

+ (int)attributionFeedbackTypeForAttributionFeedbackType:(unint64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 4;
  else
    v3 = 3;
  if (a3 == 2)
    return 9;
  else
    return v3;
}

@end
