@implementation WBSSiriIntelligenceDonor

+ (WBSSiriIntelligenceDonor)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_94);
  return (WBSSiriIntelligenceDonor *)(id)sharedInstance_sharedInstance;
}

void __42__WBSSiriIntelligenceDonor_sharedInstance__block_invoke()
{
  WBSSiriIntelligenceDonor *v0;
  void *v1;

  if (NSClassFromString(CFSTR("CSSearchableIndex")))
  {
    v0 = objc_alloc_init(WBSSiriIntelligenceDonor);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

  }
}

+ (id)historyItemIdentifierForURL:(id)a3 profileIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "safari_userVisibleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_historyItemIdentifierForURLString:profileIdentifier:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_historyItemIdentifierForURLString:(id)a3 profileIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("history:%@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_coreSpotlightItemIdentifierForURLString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_bookmarkItemIdentifierForURLString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bookmark:%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_coreSpotlightItemIdentifierForURLString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_coreSpotlightItemIdentifierForURLString:(id)a3
{
  return (id)objc_msgSend(a3, "safari_sha256Hash");
}

+ (id)coreSpotlightPageDonationIdentifierForProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (coreSpotlightPageDonationIdentifierForProfileWithIdentifier__once == -1)
  {
    if (!v3)
      goto LABEL_4;
  }
  else
  {
    dispatch_once(&coreSpotlightPageDonationIdentifierForProfileWithIdentifier__once, &__block_literal_global_145);
    if (!v4)
      goto LABEL_4;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v4, coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_4:
  v5 = (id)coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier;
LABEL_6:
  v6 = v5;

  return v6;
}

void __88__WBSSiriIntelligenceDonor_coreSpotlightPageDonationIdentifierForProfileWithIdentifier___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.PageContentDonation"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier;
  coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier = v1;

}

+ (id)_coreSpotlightTabDonationIdentifierForProfileWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_coreSpotlightTabDonationIdentifierForProfileWithIdentifier__onceToken, &__block_literal_global_149);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v4, _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __88__WBSSiriIntelligenceDonor__coreSpotlightTabDonationIdentifierForProfileWithIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.TabDonation"), v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier;
  _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier = v2;

}

+ (id)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey
{
  if (coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_onceToken != -1)
    dispatch_once(&coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_onceToken, &__block_literal_global_152);
  return (id)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey;
}

void __82__WBSSiriIntelligenceDonor_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("bookmarkIsVistedForProfileIDs"), 1, 0, 1, 1);
  v1 = (void *)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey;
  coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey = v0;

}

+ (id)coreSpotlightBookmarkTitleAttributeKey
{
  if (coreSpotlightBookmarkTitleAttributeKey_onceToken != -1)
    dispatch_once(&coreSpotlightBookmarkTitleAttributeKey_onceToken, &__block_literal_global_154);
  return (id)coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey;
}

void __66__WBSSiriIntelligenceDonor_coreSpotlightBookmarkTitleAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("bookmarkTitle"), 0, 0, 0, 0);
  v1 = (void *)coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey;
  coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey = v0;

}

+ (id)coreSpotlightProfileIDKey
{
  if (coreSpotlightProfileIDKey_onceToken != -1)
    dispatch_once(&coreSpotlightProfileIDKey_onceToken, &__block_literal_global_155);
  return (id)coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey;
}

void __53__WBSSiriIntelligenceDonor_coreSpotlightProfileIDKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("profileIdentifier"), 0, 0, 0, 0);
  v1 = (void *)coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey;
  coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey = v0;

}

+ (id)coreSpotlightHistoryItemIsSTPAttributeKey
{
  if (coreSpotlightHistoryItemIsSTPAttributeKey_onceToken != -1)
    dispatch_once(&coreSpotlightHistoryItemIsSTPAttributeKey_onceToken, &__block_literal_global_156_0);
  return (id)coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey;
}

void __69__WBSSiriIntelligenceDonor_coreSpotlightHistoryItemIsSTPAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("itemIsFromSTP"), 0, 0, 0, 0);
  v1 = (void *)coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey;
  coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey = v0;

}

+ (id)coreSpotlightTabTabGroupAttributeKey
{
  if (coreSpotlightTabTabGroupAttributeKey_onceToken != -1)
    dispatch_once(&coreSpotlightTabTabGroupAttributeKey_onceToken, &__block_literal_global_157_1);
  return (id)coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey;
}

void __64__WBSSiriIntelligenceDonor_coreSpotlightTabTabGroupAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("tabGroupUUID"), 0, 0, 0, 0);
  v1 = (void *)coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey;
  coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey = v0;

}

- (BOOL)donateTextInWebView:(id)a3 extractedReaderText:(id)a4 canDonateFullPageText:(BOOL)a5 profileIdentifier:(id)a6 personalizationData:(id)a7 extractInnerText:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  WBSSiriIntelligenceDonor *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v15, "length"))
  {
    if (!a5)
      -[WBSSiriIntelligenceDonor donateDataForPageWithURL:fullPageText:readerText:profileIdentifier:personalizationData:](self, "donateDataForPageWithURL:fullPageText:readerText:profileIdentifier:personalizationData:", v19, 0, 0, v16, v17);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke;
    v22[3] = &unk_1E4B3F760;
    v28 = a5;
    v23 = v19;
    v24 = self;
    v25 = v16;
    v26 = v17;
    v27 = v18;
    objc_msgSend(v14, "_getContentsAsStringWithCompletionHandler:", v22);

    goto LABEL_7;
  }
  -[WBSSiriIntelligenceDonor donateDataForPageWithURL:fullPageText:readerText:profileIdentifier:personalizationData:](self, "donateDataForPageWithURL:fullPageText:readerText:profileIdentifier:personalizationData:", v19, 0, v15, v16, v17);
  v20 = 1;
LABEL_8:

  return v20;
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_2(v7);
  }
  else
  {
    if (!objc_msgSend(v5, "length"))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 40), "donateDataForPageWithURL:fullPageText:readerText:profileIdentifier:personalizationData:", *(_QWORD *)(a1 + 32), v5, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (WBSSiriIntelligenceDonor)init
{
  WBSSiriIntelligenceDonor *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *coreSpotlightDonationSerialQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *tabDonationSerialQueue;
  uint64_t v9;
  WBSSpotlightDonationEntityCorrelator *entityCorrelator;
  WBSSpotlightReindexingBackgroundSystemTaskManager *v11;
  WBSSpotlightReindexingBackgroundSystemTaskManager *reindexingBackgroundSystemTaskManager;
  WBSSiriIntelligenceDonor *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSSiriIntelligenceDonor;
  v2 = -[WBSSiriIntelligenceDonor init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.SafariShared.CoreSpotlightDonation", v4);
    coreSpotlightDonationSerialQueue = v2->_coreSpotlightDonationSerialQueue;
    v2->_coreSpotlightDonationSerialQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.SafariShared.TabDonationQueue", v4);
    tabDonationSerialQueue = v2->_tabDonationSerialQueue;
    v2->_tabDonationSerialQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89D10]), "initIfAvailable");
    entityCorrelator = v2->_entityCorrelator;
    v2->_entityCorrelator = (WBSSpotlightDonationEntityCorrelator *)v9;

    v11 = objc_alloc_init(WBSSpotlightReindexingBackgroundSystemTaskManager);
    reindexingBackgroundSystemTaskManager = v2->_reindexingBackgroundSystemTaskManager;
    v2->_reindexingBackgroundSystemTaskManager = v11;

    v13 = v2;
  }

  return v2;
}

- (void)donateDataForPageWithURL:(id)a3 fullPageText:(id)a4 readerText:(id)a5 profileIdentifier:(id)a6 personalizationData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[WBSHistoryController existingSharedHistoryController](WBSHistoryController, "existingSharedHistoryController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "historyForProfileIdentifier:loadIfNeeded:", v15, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "safari_originalDataAsString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __115__WBSSiriIntelligenceDonor_donateDataForPageWithURL_fullPageText_readerText_profileIdentifier_personalizationData___block_invoke;
  v26[3] = &unk_1E4B3F788;
  v26[4] = self;
  v27 = v12;
  v28 = v18;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v18;
  v25 = v12;
  objc_msgSend(v24, "getAutocompleteTriggersForURLString:completionHandler:", v19, v26);

}

uint64_t __115__WBSSiriIntelligenceDonor_donateDataForPageWithURL_fullPageText_readerText_profileIdentifier_personalizationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donateDataForPageWithURL:history:fullPageText:readerText:autocompleteTriggers:profileIdentifier:personalizationData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
}

- (void)_donateDataForPageWithURL:(id)a3 history:(id)a4 fullPageText:(id)a5 readerText:(id)a6 autocompleteTriggers:(id)a7 profileIdentifier:(id)a8 personalizationData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *coreSpotlightDonationSerialQueue;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  WBSSiriIntelligenceDonor *v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if ((objc_msgSend(v15, "safari_isURLTooLongToDisplay") & 1) == 0)
  {
    coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke;
    v23[3] = &unk_1E4B2A620;
    v24 = v16;
    v25 = v15;
    v26 = v17;
    v27 = v18;
    v28 = v19;
    v29 = v21;
    v30 = v20;
    v31 = self;
    dispatch_async(coreSpotlightDonationSerialQueue, v23);

  }
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  WBSSiriIntelligenceDonorHistoryData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "itemForURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(WBSSiriIntelligenceDonorHistoryData);
    -[WBSSiriIntelligenceDonorHistoryData setFullPageText:](v4, "setFullPageText:", *(_QWORD *)(a1 + 48));
    -[WBSSiriIntelligenceDonorHistoryData setPageURL:](v4, "setPageURL:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSiriIntelligenceDonorHistoryData setPageTitle:](v4, "setPageTitle:", v5);

    -[WBSSiriIntelligenceDonorHistoryData setReaderText:](v4, "setReaderText:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v3, "userVisibleURLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSiriIntelligenceDonorHistoryData setUserVisibleURLString:](v4, "setUserVisibleURLString:", v6);

    objc_msgSend(v3, "lastVisitedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSiriIntelligenceDonorHistoryData setLastVisitedDate:](v4, "setLastVisitedDate:", v7);

    -[WBSSiriIntelligenceDonorHistoryData setAutocompleteTriggers:](v4, "setAutocompleteTriggers:", *(_QWORD *)(a1 + 64));
    -[WBSSiriIntelligenceDonorHistoryData setPersonalizationData:](v4, "setPersonalizationData:", *(_QWORD *)(a1 + 72));
    -[WBSSiriIntelligenceDonorHistoryData setProfileIdentifier:](v4, "setProfileIdentifier:", *(_QWORD *)(a1 + 80));
    v8 = *(void **)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_indexHistoryItemsToCoreSpotlight:completionHandler:", v9, 0);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_2();
    v11 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_1(v2, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)donateAllHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "distantPast");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonor _donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:](self, "_donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:", v10, v9, v8, v7);

}

- (void)export30DaysWorthOfHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentCalendar");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 60, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 30);
  objc_msgSend(v12, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonor _donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:](self, "_donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:", v11, v9, v8, v7);

}

- (void)donateSafariBookmarksToCoreSpotlight:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WBSSiriIntelligenceDonor *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Indexing bookmarks to CoreSpotlight", buf, 2u);
  }
  v9 = -[WBSSiriIntelligenceDonor _computeCoreSpotlightIDsForBookmarks:](self, "_computeCoreSpotlightIDsForBookmarks:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E4B3F818;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  -[WBSSiriIntelligenceDonor _getIndexedBookmarksIDsToAttributesWithCompletionHandler:](self, "_getIndexedBookmarksIDsToAttributesWithCompletionHandler:", v12);

}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id obj;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_2(v7);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      coreSpotlightBookmarksDonationIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v14, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "safari_setByApplyingBlock:", &__block_literal_global_174);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 40);
    v48 = 0;
    v49 = 0;
    v37 = (void *)v15;
    v38 = v11;
    objc_msgSend(v16, "_computeCoreSpotlightIndexingRequirementsForAllIDs:indexedIDs:outIndexIDs:outRemoveIDs:");
    v17 = v49;
    v36 = v48;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v39 = a1;
    obj = *(id *)(a1 + 32);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v22, "coreSpotlightID", v36);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", CFSTR("title"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "bookmarkTitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v22 & 1) == 0)
          {
            objc_msgSend(v17, "setByAddingObject:", v23);
            v27 = objc_claimAutoreleasedReturnValue();

            v17 = (id)v27;
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v19);
    }

    v28 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    v29 = v36;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_1();
    objc_msgSend(*(id *)(v39 + 40), "_searchableItemsForIDs:allBookmarks:", v17, *(_QWORD *)(v39 + 32), v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_178;
    v41[3] = &unk_1E4B3F7F0;
    v42 = v29;
    v43 = v31;
    v32 = v31;
    v33 = v29;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v41);
    v34 = *(void **)(v39 + 40);
    objc_msgSend(v33, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeCoreSpotlightDataWithIDs:completionHandler:", v35, 0);

    objc_msgSend(*(id *)(v39 + 40), "_indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:", v30, 0, *(_QWORD *)(v39 + 48));
    v6 = 0;
  }

}

uint64_t __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_172(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "coreSpotlightID");
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_178(uint64_t a1, uint64_t a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("weakRelatedUniqueIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    v6 = v8;
  }

}

- (void)updateCoreSpotlightReadingListDataAfterUpgrade:(id)a3
{
  void *v4;
  NSObject *coreSpotlightDonationSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_184);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_2;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(coreSpotlightDonationSerialQueue, v7);

}

uint64_t __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReadingListItem");
}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_computeCoreSpotlightIDsForBookmarks:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_searchableItemsForIDs:allBookmarks:", v3, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:", v2, 0, &__block_literal_global_186);

}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Successfully indexed reading list items to CoreSpotlight on upgrade", v6, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("DidUpdateCoreSpotlightBookmarksDataOnUpgrade"));

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3_cold_1();
  }
}

- (void)reindexAllBookmarkAndHistoryItems:(id)a3 historiesForProfiles:(id)a4 withAcknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WBSSpotlightReindexingBackgroundSystemTaskManager *reindexingBackgroundSystemTaskManager;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke;
  v23[3] = &unk_1E4B3F8A0;
  v23[4] = self;
  v24 = v8;
  v25 = v10;
  v12 = v10;
  v13 = v8;
  v14 = (void *)MEMORY[0x1A8599ED0](v23);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "components:fromDate:", 60, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDay:", objc_msgSend(v17, "day") - 7);
  objc_msgSend(v15, "dateFromComponents:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonor _donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:](self, "_donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:", v18, v16, v9, v14);

  reindexingBackgroundSystemTaskManager = self->_reindexingBackgroundSystemTaskManager;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_189;
  v21[3] = &unk_1E4B2A118;
  v21[4] = self;
  v22 = v9;
  v20 = v9;
  -[WBSSpotlightReindexingBackgroundSystemTaskManager registerAndSubmitRequestForTask:](reindexingBackgroundSystemTaskManager, "registerAndSubmitRequestForTask:", v21);

}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed last week of searchable history items for CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1();
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_188;
  v8[3] = &unk_1E4B3D320;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "donateSafariBookmarksToCoreSpotlight:withCompletionHandler:", v7, v8);

}

uint64_t __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_188(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable bookmark items for CoreSpotlight", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_188_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "donateAllHistoryToCoreSpotlightForProfiles:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_190);
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable history items for CoreSpotlight", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2_cold_1();
  }
}

- (void)reindexBookmarkAndHistoryItemsWithIdentifiers:(id)a3 allBookmarks:(id)a4 historiesForProfiles:(id)a5 withAcknowledgementHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *identifiersLeftToReindex;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (a3)
  {
    v14 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
    identifiersLeftToReindex = self->_identifiersLeftToReindex;
    self->_identifiersLeftToReindex = v14;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke;
    v18[3] = &unk_1E4B3F8A0;
    v18[4] = self;
    v19 = v10;
    v20 = v13;
    -[WBSSiriIntelligenceDonor _donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:](self, "_donateHistoryItemsToCoreSpotlightCreatedAfterDate:beforeDate:historiesForProfiles:withCompletionHandler:", v16, v17, v11, v18);

  }
  else
  {
    (*((void (**)(id))v12 + 2))(v12);
  }

}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed searchable history items with identifiers to CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1();
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_computeCoreSpotlightIDsForBookmarks:", *(_QWORD *)(a1 + 40));
  v7 = *(id **)(a1 + 32);
  v8 = (void *)objc_msgSend(v7[2], "copy");
  objc_msgSend(v7, "_searchableItemsForIDs:allBookmarks:", v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_191;
  v11[3] = &unk_1E4B38980;
  v11[4] = v10;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "_indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:", v9, 0, v11);

}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_191(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  id *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed searchable bookmark items with identifiers to CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_191_cold_1();
  }
  v6 = *(id **)(a1 + 32);
  objc_msgSend(v6[2], "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_192;
  v9[3] = &unk_1E4B38980;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "removeCoreSpotlightDataWithIDs:completionHandler:", v7, v9);

}

uint64_t __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_192(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v9[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Successfully removed spotlight items that do not map to a current history or bookmark item", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_192_cold_1();
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_donateHistoryItemsToCoreSpotlightCreatedAfterDate:(id)a3 beforeDate:(id)a4 historiesForProfiles:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *coreSpotlightDonationSerialQueue;
  id v18;
  id obj;
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  WBSSiriIntelligenceDonor *v26;
  void *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  char v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v10 = a4;
  v11 = a5;
  v18 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v12 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        dispatch_group_enter(v12);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke;
        v24[3] = &unk_1E4B3F960;
        v25 = v12;
        v26 = self;
        v27 = v16;
        v28 = v33;
        objc_msgSend(v16, "getVisitsCreatedAfterDate:beforeDate:completionHandler:", v20, v10, v24);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v13);
  }

  if (v18)
  {
    coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_197;
    block[3] = &unk_1E4B3F988;
    v22 = v18;
    v23 = v33;
    dispatch_group_notify(v12, coreSpotlightDonationSerialQueue, block);

  }
  _Block_object_dispose(v33, 8);

}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4B3F938;
    block[4] = v4;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 56);
    v11 = v6;
    v14 = v7;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12 = v8;
    v13 = v9;
    dispatch_async(v5, block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "databaseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E4B3F8E8;
  v7 = v4;
  v16 = v7;
  v17 = v2;
  v8 = v2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E4B3F910;
  v14 = *(_QWORD *)(a1 + 64);
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v9 = v7;
  v10 = (void *)MEMORY[0x1A8599ED0](v11);
  objc_msgSend(*(id *)(a1 + 56), "_indexHistoryItemsToCoreSpotlight:completionHandler:", v8, v10);

}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSSiriIntelligenceDonorHistoryData *v14;

  v3 = a2;
  v14 = objc_alloc_init(WBSSiriIntelligenceDonorHistoryData);
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonorHistoryData setPageURL:](v14, "setPageURL:", v7);

  objc_msgSend(v3, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSiriIntelligenceDonorHistoryData setPageTitle:](v14, "setPageTitle:", v8);
  objc_msgSend(v4, "lastVisitedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonorHistoryData setLastVisitedDate:](v14, "setLastVisitedDate:", v9);

  objc_msgSend(v4, "userVisibleURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonorHistoryData setUserVisibleURLString:](v14, "setUserVisibleURLString:", v10);

  -[WBSSiriIntelligenceDonorHistoryData setProfileIdentifier:](v14, "setProfileIdentifier:", *(_QWORD *)(a1 + 32));
  -[WBSSiriIntelligenceDonorHistoryData pageURL](v14, "pageURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[WBSSiriIntelligenceDonorHistoryData pageTitle](v14, "pageTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  }

}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable history items to CoreSpotlight for profile with ID: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4_cold_1(a1, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_197(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0);
}

- (id)_searchableItemsForIDs:(id)a3 allBookmarks:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __CFString *v14;
  objc_class *v15;
  __CFString *v16;
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
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  WBSSpotlightDonationEntityCorrelator *entityCorrelator;
  void *v34;
  void *v35;
  id v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  WBSSiriIntelligenceDonor *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __64__WBSSiriIntelligenceDonor__searchableItemsForIDs_allBookmarks___block_invoke;
  v44[3] = &unk_1E4B3F9B0;
  v37 = v6;
  v45 = v37;
  v46 = self;
  objc_msgSend(a4, "safari_filterObjectsUsingBlock:", v44);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isReadingListItem");
        v14 = CFSTR("com.apple.safari.bookmark");
        if (v13)
          v14 = CFSTR("com.apple.safari.readinglist");
        v15 = (objc_class *)MEMORY[0x1E0CA6B50];
        v16 = v14;
        v17 = (void *)objc_msgSend([v15 alloc], "initWithItemContentType:", v16);

        objc_msgSend(v12, "bookmarkTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTitle:", v18);

        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v12, "bookmarkURLString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safari_URLWithDataAsString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setContentURL:", v21);
        v22 = (void *)objc_opt_class();
        objc_msgSend(v12, "bookmarkURLString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_coreSpotlightItemIdentifierForURLString:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWeakRelatedUniqueIdentifier:", v24);

        objc_msgSend(v21, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPath:", v25);

        objc_msgSend(v21, "host");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setComment:", v27);

        -[WBSSiriIntelligenceDonor _sanitizeAttributeSet:](self, "_sanitizeAttributeSet:", v17);
        v28 = objc_alloc(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v12, "coreSpotlightID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        coreSpotlightBookmarksDonationIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v28, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v29, v30, v17);

        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setExpirationDate:", v32);

        if (v31)
        {
          objc_msgSend(v39, "addObject:", v31);
          entityCorrelator = self->_entityCorrelator;
          objc_msgSend(v12, "uuidString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSpotlightDonationEntityCorrelator correlateBookmarkEntityForItem:withUUIDString:](entityCorrelator, "correlateBookmarkEntityForItem:withUUIDString:", v31, v34);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v9);
  }

  v35 = (void *)objc_msgSend(v39, "copy");
  return v35;
}

uint64_t __64__WBSSiriIntelligenceDonor__searchableItemsForIDs_allBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "coreSpotlightID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v6)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    if (v7)
    {
      objc_msgSend(v3, "coreSpotlightID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);

    }
  }

  return v6;
}

- (id)_coreSpotlightItemsSubarrays:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 >= 0x8000)
    {
      do
      {
        if (v5 >= 0x7FFF)
          v8 = 0x7FFFLL;
        else
          v8 = v5;
        objc_msgSend(v3, "subarrayWithRange:", 0, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);
        v5 -= v8;

      }
      while (v5);
    }
    else
    {
      objc_msgSend(v6, "addObject:", v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_arrayByFilteringDeletedHistoryItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__WBSSiriIntelligenceDonor__arrayByFilteringDeletedHistoryItems___block_invoke;
  v10[3] = &unk_1E4B3F9D8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __65__WBSSiriIntelligenceDonor__arrayByFilteringDeletedHistoryItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentType");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 == CFSTR("com.apple.safari.history"))
  {
    objc_msgSend(v3, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "coreSpotlightProfileIDKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForCustomKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[WBSHistoryController existingSharedHistoryController](WBSHistoryController, "existingSharedHistoryController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "historyForProfileIdentifier:loadIfNeeded:", v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, v9);
      }
      objc_msgSend(v3, "attributeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemForURL:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 completionHandler:(id)a5
{
  -[WBSSiriIntelligenceDonor _indexCoreSpotlightData:filterDeletedHistoryItems:onDispatchQueue:completionHandler:](self, "_indexCoreSpotlightData:filterDeletedHistoryItems:onDispatchQueue:completionHandler:", a3, a4, self->_coreSpotlightDonationSerialQueue, a5);
}

- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 onDispatchQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WBSSiriIntelligenceDonor *v17;
  NSObject *v18;
  id v19;
  _QWORD *v20;
  BOOL v21;
  _QWORD v22[5];
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    -[WBSSiriIntelligenceDonor _coreSpotlightItemsSubarrays:](self, "_coreSpotlightItemsSubarrays:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__32;
    v22[4] = __Block_byref_object_dispose__32;
    v23 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke;
    v15[3] = &unk_1E4B3FA00;
    v21 = a4;
    v16 = v13;
    v17 = self;
    v20 = v22;
    v18 = v11;
    v19 = v12;
    v14 = v13;
    dispatch_async(v18, v15);

    _Block_object_dispose(v22, 8);
  }
  else if (v12)
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
  }

}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 72))
        {
          objc_msgSend(*(id *)(a1 + 40), "_arrayByFilteringDeletedHistoryItems:", v7);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = v7;
        }
        v9 = v8;
        objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2;
        v17[3] = &unk_1E4B3B078;
        v17[4] = *(_QWORD *)(a1 + 64);
        objc_msgSend(v10, "indexSearchableItems:completionHandler:", v9, v17);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_203;
  block[3] = &unk_1E4B3F988;
  v11 = *(NSObject **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = v12;
  v16 = v13;
  dispatch_async(v11, block);

}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2_cold_1(v5);
  }

}

uint64_t __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_203(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0);
  return result;
}

- (void)removeCoreSpotlightDataWithIDs:(id)a3 completionHandler:(id)a4
{
  -[WBSSiriIntelligenceDonor _removeCoreSpotlightDataWithIDs:onDispatchQueue:completionHandler:](self, "_removeCoreSpotlightDataWithIDs:onDispatchQueue:completionHandler:", a3, self->_coreSpotlightDonationSerialQueue, a4);
}

- (void)_removeCoreSpotlightDataWithIDs:(id)a3 onDispatchQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke;
    v10[3] = &unk_1E4B2A708;
    v11 = v7;
    v12 = v9;
    dispatch_async(v8, v10);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4B2B8A0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "deleteSearchableItemsWithIdentifiers:completionHandler:", v3, v4);

}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2_cold_1(v4);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 0);

}

- (void)removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *coreSpotlightDonationSerialQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Removing all CoreSpotlight data donated by Safari", buf, 2u);
  }
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke;
  v8[3] = &unk_1E4B2A118;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(coreSpotlightDonationSerialQueue, v8);

}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "coreSpotlightPageDonationIdentifierForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_coreSpotlightTabDonationIdentifierForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v4, &__block_literal_global_204);

}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_2(v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_1();
  }

}

- (void)_indexHistoryItemsToCoreSpotlight:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend(v9, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_completionHandler___block_invoke;
    v10[3] = &unk_1E4B3FA48;
    v10[4] = self;
    v11 = v7;
    v8 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    -[WBSSiriIntelligenceDonor _indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:](self, "_indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:", v8, 1, v6);

  }
  else if (v6)
  {
    v6[2](v6, 1);
  }

}

void __80__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "userVisibleURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_historyItemIdentifierForURLString:profileIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v8)
  {
    if (!objc_msgSend(v8, "containsObject:", v7))
      goto LABEL_30;
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    if (v9)
      objc_msgSend(v9, "removeObject:", v7);
  }
  objc_msgSend(v3, "pageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.safari.history"));
    objc_msgSend(v3, "pageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentURL:", v12);

    objc_msgSend(v3, "pageTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v13);

    objc_msgSend(v3, "readerText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "setTextContent:", v14);
    }
    else
    {
      objc_msgSend(v3, "fullPageText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextContent:", v16);

    }
    objc_msgSend(v3, "readerText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = CFSTR("ReaderText");
    else
      v18 = CFSTR("FullPageText");
    objc_msgSend(v11, "setTextContentDataSource:", v18);

    objc_msgSend(v3, "lastVisitedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastUsedDate:", v19);

    objc_msgSend(v3, "profileIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "coreSpotlightProfileIDKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forCustomKey:", v20, v21);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "autocompleteTriggers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutocompleteTriggers:", v22);

    }
    objc_msgSend(v3, "personalizationData");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v3, "personalizationData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "searchQuery");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v3, "lastVisitedDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLastAppEngagementDate:", v27);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v3, "personalizationData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "searchQuery");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLastAppSearchEngagementQuery:", v29);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "personalizationData");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "position"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLastAppSearchEngagementRenderPosition:", v32);

        }
      }
    }
    v33 = (void *)objc_opt_class();
    objc_msgSend(v3, "userVisibleURLString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_coreSpotlightItemIdentifierForURLString:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWeakRelatedUniqueIdentifier:", v35);

    objc_msgSend(*(id *)(a1 + 32), "_sanitizeAttributeSet:", v11);
    v36 = (void *)objc_opt_class();
    objc_msgSend(v3, "profileIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "coreSpotlightPageDonationIdentifierForProfileWithIdentifier:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v7, v38, v11);
    v40 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      __80__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_completionHandler___block_invoke_cold_1((uint64_t)v7, v40, v11);
    v41 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = v41;
      objc_msgSend(v3, "pageURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textContent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138478339;
      v46 = v43;
      v47 = 2113;
      v48 = v7;
      v49 = 2048;
      v50 = objc_msgSend(v44, "length");
      _os_log_debug_impl(&dword_1A3D90000, v42, OS_LOG_TYPE_DEBUG, "Donating history item to CoreSpotlight with URL: %{private}@ ID: %{private}@ text content length: %ld", (uint8_t *)&v45, 0x20u);

      if (!v39)
        goto LABEL_29;
    }
    else if (!v39)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "correlateHistoryEntityForItem:", v39);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v39);
    goto LABEL_29;
  }
  v15 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v45) = 0;
    _os_log_impl(&dword_1A3D90000, v15, OS_LOG_TYPE_INFO, "Skipping donation of history item due to nil url.", (uint8_t *)&v45, 2u);
  }
LABEL_30:

}

- (void)_getIndexedItemsForSearchQueryString:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  OS_dispatch_queue *coreSpotlightDonationSerialQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("uniqueIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v13, "setPrivateQuery:", 1);
  objc_msgSend(v13, "setFetchAttributes:", v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v9, v13);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke;
  v32[3] = &unk_1E4B3EC50;
  v17 = v15;
  v33 = v17;
  objc_msgSend(v14, "setFoundItemsHandler:", v32);
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_3;
  v29[3] = &unk_1E4B2A708;
  v30 = v14;
  v19 = v10;
  v31 = v19;
  v20 = v14;
  +[WBSDispatchSourceTimer timerWithInterval:repeats:queue:handler:](WBSDispatchSourceTimer, "timerWithInterval:repeats:queue:handler:", 0, coreSpotlightDonationSerialQueue, v29, 5000000000.0);
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_4;
  v25[3] = &unk_1E4B3FAC0;
  v25[4] = self;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  v28 = v19;
  v21 = v17;
  v22 = v19;
  v23 = v26;
  objc_msgSend(v20, "setCompletionHandler:", v25);
  objc_msgSend(v20, "start");

}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_2;
  v3[3] = &unk_1E4B3FA70;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(v6, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  objc_sync_exit(v3);
}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  obj = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 40));
  objc_sync_enter(obj);
  if ((_WBSRunOnceImpl() & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
  objc_sync_exit(obj);

}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_5;
  v7[3] = &unk_1E4B3FA98;
  v8 = v4;
  v9 = v3;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;
  id objb;
  id obja;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (*(_QWORD *)(a1 + 40))
  {
    obj = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 56));
    objc_sync_enter(obj);
    if ((_WBSRunOnceImpl() & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_sync_exit(obj);
    v2 = obj;
  }
  else
  {
    objb = *(id *)(a1 + 48);
    objc_sync_enter(objb);
    v3 = objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_sync_exit(objb);

    obja = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 56));
    objc_sync_enter(obja);
    if ((_WBSRunOnceImpl() & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_sync_exit(obja);

    v2 = (void *)v3;
  }

}

- (void)_getIndexedIDsForSearchQueryString:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  OS_dispatch_queue *coreSpotlightDonationSerialQueue;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v8 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v8, "setPrivateQuery:", 1);
  objc_msgSend(v8, "setFetchAttributes:", &unk_1E4B87718);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v6, v8);

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke;
  v26[3] = &unk_1E4B3EC50;
  v12 = v10;
  v27 = v12;
  objc_msgSend(v9, "setFoundItemsHandler:", v26);
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_3;
  v23[3] = &unk_1E4B2A708;
  v24 = v9;
  v14 = v7;
  v25 = v14;
  v15 = v9;
  +[WBSDispatchSourceTimer timerWithInterval:repeats:queue:handler:](WBSDispatchSourceTimer, "timerWithInterval:repeats:queue:handler:", 0, coreSpotlightDonationSerialQueue, v23, 5000000000.0);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_4;
  v19[3] = &unk_1E4B3FAC0;
  v19[4] = self;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  v22 = v14;
  v16 = v12;
  v17 = v14;
  v18 = v20;
  objc_msgSend(v15, "setCompletionHandler:", v19);
  objc_msgSend(v15, "start");

}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_2;
  v3[3] = &unk_1E4B3FA70;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(v6, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  objc_sync_exit(v3);
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  obj = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 40));
  objc_sync_enter(obj);
  if ((_WBSRunOnceImpl() & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
  objc_sync_exit(obj);

}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_5;
  v7[3] = &unk_1E4B3FA98;
  v8 = v4;
  v9 = v3;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;
  id objb;
  id obja;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (*(_QWORD *)(a1 + 40))
  {
    obj = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 56));
    objc_sync_enter(obj);
    if ((_WBSRunOnceImpl() & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_sync_exit(obj);
    v2 = obj;
  }
  else
  {
    objb = *(id *)(a1 + 48);
    objc_sync_enter(objb);
    v3 = objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_sync_exit(objb);

    obja = (id)MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 56));
    objc_sync_enter(obja);
    if ((_WBSRunOnceImpl() & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_sync_exit(obja);

    v2 = (void *)v3;
  }

}

- (void)_getIndexedBookmarksIDsToAttributesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contentType == \"%@\" || contentType == \"%@\"), CFSTR("com.apple.safari.bookmark"), CFSTR("com.apple.safari.readinglist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3FAE8;
  v8 = v4;
  v6 = v4;
  -[WBSSiriIntelligenceDonor _getIndexedItemsForSearchQueryString:attributes:completionHandler:](self, "_getIndexedItemsForSearchQueryString:attributes:completionHandler:", v5, &unk_1E4B87730, v7);

}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v23;
  char v24;
  _BYTE v25[15];
  char v26;
  _BYTE v27[15];
  char v28;
  _BYTE v29[15];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "attributeSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v11, "attributeSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "weakRelatedUniqueIdentifier");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "attributeSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "title");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (-[__CFString length](v15, "length"))
          {
            if (!v17)
              goto LABEL_15;
          }
          else
          {
            v19 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_3(&v26, v27);

            v15 = &stru_1E4B40D18;
            if (!v17)
            {
LABEL_15:
              v20 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
              v17 = &stru_1E4B40D18;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_2(&v24, v25);
            }
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v15, CFSTR("weakRelatedUniqueIdentifier"));
          objc_msgSend(v21, "setObject:forKey:", v17, CFSTR("title"));
          objc_msgSend(v5, "setObject:forKey:", v21, v13);

          goto LABEL_18;
        }
        v18 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_1(&v28, v29);
LABEL_18:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_computeCoreSpotlightIDsForBookmarks:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  WBSSiriIntelligenceDonor *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __65__WBSSiriIntelligenceDonor__computeCoreSpotlightIDsForBookmarks___block_invoke;
  v13 = &unk_1E4B3FB10;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __65__WBSSiriIntelligenceDonor__computeCoreSpotlightIDsForBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "bookmarkURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bookmarkItemIdentifierForURLString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCoreSpotlightID:", v6);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "coreSpotlightID");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
}

- (void)_computeCoreSpotlightIndexingRequirementsForAllIDs:(id)a3 indexedIDs:(id)a4 outIndexIDs:(id *)a5 outRemoveIDs:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v9 = a4;
  v10 = a3;
  v12 = (id)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v9);
  *a5 = (id)objc_msgSend(v12, "copy");
  v11 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v11, "minusSet:", v10);
  *a6 = (id)objc_msgSend(v11, "copy");

}

- (void)_sanitizeAttributeSet:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    objc_msgSend(v7, "contentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_userVisibleString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

  }
}

- (void)setTabNeedsSpotlightDeletion:(id)a3
{
  void *v4;
  unint64_t v5;
  NSMutableSet *closedTabsToIndex;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSObject *v9;

  objc_msgSend(a3, "appEntityUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_tabsToDonate, "removeObjectForKey:", v4);
    v5 = -[NSMutableSet count](self->_closedTabsToIndex, "count");
    closedTabsToIndex = self->_closedTabsToIndex;
    if (v5 > 0x18)
    {
      -[NSMutableSet addObject:](closedTabsToIndex, "addObject:", v4);
      -[WBSSiriIntelligenceDonor donatePendingTabDataNowWithCompletionHandler:](self, "donatePendingTabDataNowWithCompletionHandler:", 0);
    }
    else
    {
      if (!closedTabsToIndex)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v8 = self->_closedTabsToIndex;
        self->_closedTabsToIndex = v7;

        closedTabsToIndex = self->_closedTabsToIndex;
      }
      -[NSMutableSet addObject:](closedTabsToIndex, "addObject:", v4);
      -[WBSSiriIntelligenceDonor _scheduleTabBatchDonationTimerIfNeeded](self, "_scheduleTabBatchDonationTimerIfNeeded");
    }
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSSiriIntelligenceDonor setTabNeedsSpotlightDeletion:].cold.1();
  }

}

- (void)setTabNeedsSpotlightDonation:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSMutableDictionary *tabsToDonate;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "appEntityUUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_closedTabsToIndex, "removeObject:", v5);
    v6 = -[NSMutableDictionary count](self->_tabsToDonate, "count");
    tabsToDonate = self->_tabsToDonate;
    if (v6 > 0x18)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](tabsToDonate, "setObject:forKeyedSubscript:", v4, v5);
      -[WBSSiriIntelligenceDonor donatePendingTabDataNowWithCompletionHandler:](self, "donatePendingTabDataNowWithCompletionHandler:", 0);
    }
    else
    {
      if (!tabsToDonate)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v9 = self->_tabsToDonate;
        self->_tabsToDonate = v8;

        tabsToDonate = self->_tabsToDonate;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](tabsToDonate, "setObject:forKeyedSubscript:", v4, v5);
      -[WBSSiriIntelligenceDonor _scheduleTabBatchDonationTimerIfNeeded](self, "_scheduleTabBatchDonationTimerIfNeeded");
    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSSiriIntelligenceDonor setTabNeedsSpotlightDonation:].cold.1();
  }

}

- (void)donatePendingTabDataNowWithCompletionHandler:(id)a3
{
  id v4;
  WBSDispatchSourceTimer *tabDonationTimer;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *tabsToDonate;
  NSMutableSet *closedTabsToIndex;
  NSObject *tabDonationSerialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[WBSDispatchSourceTimer invalidate](self->_tabDonationTimer, "invalidate");
  tabDonationTimer = self->_tabDonationTimer;
  self->_tabDonationTimer = 0;

  -[NSMutableDictionary allValues](self->_tabsToDonate, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_234);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)-[NSMutableSet copy](self->_closedTabsToIndex, "copy");
  tabsToDonate = self->_tabsToDonate;
  self->_tabsToDonate = 0;

  closedTabsToIndex = self->_closedTabsToIndex;
  self->_closedTabsToIndex = 0;

  tabDonationSerialQueue = self->_tabDonationSerialQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E4B38908;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v18 = v4;
  v12 = v4;
  v13 = v8;
  v14 = v7;
  dispatch_async(tabDonationSerialQueue, v15);

}

uint64_t __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tabDataForSpotlightDonation");
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Donating Pending Tabs to CoreSpotlight", buf, 2u);
  }
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_235;
  v16[3] = &unk_1E4B2A078;
  v7 = v3;
  v17 = v7;
  objc_msgSend(v4, "_indexTabData:withCompletionHandler:", v5, v16);
  dispatch_group_enter(v7);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2_236;
  v14[3] = &unk_1E4B3D2F8;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v8, "_removeCoreSpotlightDataWithIDs:onDispatchQueue:completionHandler:", v9, v10, v14);

  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    v13 = v12;
    WBSDispatchGroupNotifyWithTimeout();

  }
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_235(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2_236(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v5 = v4;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Finished CoreSpotlight tab donations successfully.", buf, 2u);
  }
  v6 = *(id *)(a1 + 32);
  WBSPerformBlockOnMainRunLoopWithCommonModes();

}

uint64_t __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_scheduleTabBatchDonationTimerIfNeeded
{
  WBSDispatchSourceTimer *v3;
  WBSDispatchSourceTimer *tabDonationTimer;
  _QWORD v5[5];

  if (!self->_tabDonationTimer)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__WBSSiriIntelligenceDonor__scheduleTabBatchDonationTimerIfNeeded__block_invoke;
    v5[3] = &unk_1E4B2A078;
    v5[4] = self;
    +[WBSDispatchSourceTimer scheduledTimerWithInterval:repeats:handler:](WBSDispatchSourceTimer, "scheduledTimerWithInterval:repeats:handler:", 0, v5, 30.0);
    v3 = (WBSDispatchSourceTimer *)objc_claimAutoreleasedReturnValue();
    tabDonationTimer = self->_tabDonationTimer;
    self->_tabDonationTimer = v3;

  }
}

uint64_t __66__WBSSiriIntelligenceDonor__scheduleTabBatchDonationTimerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "donatePendingTabDataNowWithCompletionHandler:", 0);
}

- (void)_indexTabData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
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
  id v25;
  void *v26;
  void *v27;
  OS_dispatch_queue *tabDonationSerialQueue;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x1E0CA6B50]);
        objc_msgSend(v14, "setContentType:", CFSTR("com.apple.safari.tab"));
        objc_msgSend(v13, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setContentURL:", v15);

        objc_msgSend(v13, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitle:", v16);

        objc_msgSend(v13, "lastVisitedDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastUsedDate:", v17);

        objc_msgSend(v14, "setDisableSearchInSpotlight:", MEMORY[0x1E0C9AAB0]);
        objc_msgSend(v13, "profileIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "coreSpotlightProfileIDKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValue:forCustomKey:", v18, v19);

        objc_msgSend(v13, "tabGroupUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "coreSpotlightTabTabGroupAttributeKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValue:forCustomKey:", v20, v21);

        -[WBSSiriIntelligenceDonor _sanitizeAttributeSet:](self, "_sanitizeAttributeSet:", v14);
        v22 = (void *)objc_opt_class();
        objc_msgSend(v13, "profileIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_coreSpotlightTabDonationIdentifierForProfileWithIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v13, "uuidString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v26, v24, v14);

        objc_msgSend(v7, "addObject:", v27);
        -[WBSSpotlightDonationEntityCorrelator correlateTabEntityForItem:](self->_entityCorrelator, "correlateTabEntityForItem:", v27);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  tabDonationSerialQueue = self->_tabDonationSerialQueue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__WBSSiriIntelligenceDonor__indexTabData_withCompletionHandler___block_invoke;
  v31[3] = &unk_1E4B3D320;
  v32 = v30;
  v29 = v30;
  -[WBSSiriIntelligenceDonor _indexCoreSpotlightData:filterDeletedHistoryItems:onDispatchQueue:completionHandler:](self, "_indexCoreSpotlightData:filterDeletedHistoryItems:onDispatchQueue:completionHandler:", v7, 0, tabDonationSerialQueue, v31);

}

uint64_t __64__WBSSiriIntelligenceDonor__indexTabData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexingBackgroundSystemTaskManager, 0);
  objc_storeStrong((id *)&self->_closedTabsToIndex, 0);
  objc_storeStrong((id *)&self->_tabsToDonate, 0);
  objc_storeStrong((id *)&self->_tabDonationTimer, 0);
  objc_storeStrong((id *)&self->_entityCorrelator, 0);
  objc_storeStrong((id *)&self->_tabDonationSerialQueue, 0);
  objc_storeStrong((id *)&self->_identifiersLeftToReindex, 0);
  objc_storeStrong((id *)&self->_coreSpotlightDonationSerialQueue, 0);
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "String contents of webpage is empty, but proceeding with donation to CoreSpotlight for page URL: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Error extracting content of webpage as string: %{public}@; page will not be donated to CoreSpotlight",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_1();
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Failed to donate page contents to CoreSpotlight due to missing history item for URL: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to donate page contents to CoreSpotlight due to missing history item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v1, (uint64_t)v1, "Safari will index bookmarks to CoreSpotlight with IDs %@ and remove bookmarks with IDs: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to obtain indexed bookmarks IDs with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to index reading list items items to CoreSpotlight on upgrade", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to re-index last week of searchable items history items for CoreSpotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_188_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to re-index all searchable items bookmark items for CoreSpotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to re-index all searchable items history items for CoreSpotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to re-indexed searchable history items with identifiers to CoreSpotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_191_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to re-indexed searchable bookmark items with identifiers to CoreSpotlight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_192_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to removed spotlight items that do not map to a current history or bookmark item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to re-indexed all searchable history items to CoreSpotlight for profile with ID: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to index CoreSpotlight searchable items with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to remove CoreSpotlight searchable items with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_DEBUG, "Removed CoreSpotlight data", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Failed to remove CoreSpotlight data with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __80__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = a1;
  v10 = 2048;
  v11 = objc_msgSend(v6, "length");
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v5, v7, "Donating history item to CoreSpotlight with ID: %{private}@ text content length: %ld", (uint8_t *)&v8);

}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, v2, (uint64_t)v2, "Indexed bookmark has nil uniqueID.", v3);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, v2, (uint64_t)v2, "Indexed bookmark has nil title.", v3);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, v2, (uint64_t)v2, "Indexed bookmark has nil weakIdentifier.", v3);
}

- (void)setTabNeedsSpotlightDeletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Received nil UUID for tab spotlight deletion request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setTabNeedsSpotlightDonation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Received nil UUID for tab spotlight donation request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Timed out waiting for CoreSpotlight calls to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
