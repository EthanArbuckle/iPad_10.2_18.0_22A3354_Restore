@implementation WBSAnalyticsLogger

void __61__WBSAnalyticsLogger__sendEventAddingVersionInfo_usingBlock___block_invoke(uint64_t a1)
{
  id v2;

  if (AnalyticsIsEventUsed())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_sendEventAddingVersionInfo:baseEvent:", *(_QWORD *)(a1 + 32));

  }
}

id __53__WBSAnalyticsLogger_reportTabUpdatedWithUpdateType___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("tabUpdateChangeType");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 0xB)
    v2 = CFSTR("navigation");
  else
    v2 = off_1E649B518[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_sendEventAddingVersionInfo:(id)a3 baseEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  WBSAnalyticsLogger *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke;
  aBlock[3] = &unk_1E649A6B0;
  v9 = v7;
  v17 = v9;
  v18 = self;
  v10 = v6;
  v19 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (self->_persona && self->_safariVersion)
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
  else
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke_2;
    v13[3] = &unk_1E649A6B0;
    v13[4] = self;
    v14 = v10;
    v15 = v9;
    -[WBSAnalyticsLogger performOnAnalyticsQueueWithDelay:block:](self, "performOnAnalyticsQueueWithDelay:block:", 5, v13);

  }
}

- (void)performOnAnalyticsQueueWithDelay:(int64_t)a3 block:(id)a4
{
  int64_t v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  v5 = 1000000000 * a3;
  block = a4;
  v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)self->_analyticsSynchronizationQueue, block);

}

- (void)reportTabUpdatedWithUpdateType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_reportTabUpdatedWithUpdateType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.DidModifyTab"), v3);
}

- (void)_sendEventAddingVersionInfo:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *analyticsSynchronizationQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSAnalyticsLogger *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSAnalyticsLogger__sendEventAddingVersionInfo_usingBlock___block_invoke;
  block[3] = &unk_1E649A688;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, block);

}

+ (id)sharedLogger
{
  if (+[WBSAnalyticsLogger sharedLogger]::once != -1)
    dispatch_once(&+[WBSAnalyticsLogger sharedLogger]::once, &__block_literal_global_0);
  return (id)+[WBSAnalyticsLogger sharedLogger]::shared;
}

void __34__WBSAnalyticsLogger_sharedLogger__block_invoke()
{
  NSObject *v0;
  WBSAnalyticsLogger *v1;
  void *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.Safari.Analytics", v0);

  v1 = -[WBSAnalyticsLogger initWithQueue:]([WBSAnalyticsLogger alloc], "initWithQueue:", v3);
  v2 = (void *)+[WBSAnalyticsLogger sharedLogger]::shared;
  +[WBSAnalyticsLogger sharedLogger]::shared = (uint64_t)v1;

}

- (WBSAnalyticsLogger)initWithQueue:(id)a3
{
  id v5;
  WBSAnalyticsLogger *v6;
  WBSAnalyticsLogger *v7;
  WBSAnalyticsLogger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAnalyticsLogger;
  v6 = -[WBSAnalyticsLogger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_analyticsSynchronizationQueue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)registerSafariVersion:(id)a3 persona:(int64_t)a4
{
  id v6;
  NSObject *analyticsSynchronizationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WBSAnalyticsLogger_registerSafariVersion_persona___block_invoke;
  block[3] = &unk_1E649A318;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __52__WBSAnalyticsLogger_registerSafariVersion_persona___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 48);
}

- (void)recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier:(id)a3 searchProviderIdentifier:(id)a4 provenance:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *analyticsSynchronizationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke;
  block[3] = &unk_1E649A318;
  v14 = v9;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    v3 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;
  v12[0] = CFSTR("defaultSearchProviderIdentifier");
  v12[1] = CFSTR("searchProviderIdentifier");
  v4 = *(const __CFString **)(a1 + 32);
  if (!v4)
    v4 = &stru_1E64A2498;
  v13[0] = *(_QWORD *)(a1 + 40);
  v13[1] = v4;
  v12[2] = CFSTR("isSearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("usesDefaultSearchProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("isReferredByUnifiedField");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_QWORD *)(a1 + 48) == 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("provenance");
  v8 = *(_QWORD *)(a1 + 48) - 1;
  if (v8 > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E649ACD8[v8];
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didRequestSearchSuggestions
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.RequestedSearchSuggestions"), &__block_literal_global_375);
}

void *__49__WBSAnalyticsLogger_didRequestSearchSuggestions__block_invoke()
{
  return &unk_1E64D0F68;
}

- (void)reportWeakPasswordWarningEvent:(int64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("warningEvent");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("show password detail view with warning");
  else
    v2 = off_1E649ACF0[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didRevealDownloadWithMIMEType:(id)a3 uti:(id)a4 result:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *analyticsSynchronizationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke;
  block[3] = &unk_1E649A318;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke_2(_QWORD *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  unint64_t v3;
  const __CFString *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("<unknown type>");
  v6[0] = CFSTR("MIMEType");
  v6[1] = CFSTR("UTI");
  v2 = (const __CFString *)a1[4];
  if (!v2)
    v2 = CFSTR("<unknown type>");
  if (a1[5])
    v1 = (const __CFString *)a1[5];
  v7[0] = v2;
  v7[1] = v1;
  v6[2] = CFSTR("result");
  v3 = a1[6] - 1;
  if (v3 > 2)
    v4 = CFSTR("reveal in Files app with magnifying glass");
  else
    v4 = off_1E649AD08[v3];
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didMoveToBackgroundWithNumberOfOnGoingDownloads:(unint64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  if (a3)
  {
    analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(analyticsSynchronizationQueue, block);
  }
}

uint64_t __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberOfDownloads");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didSetDownloadFolderToProviderWithIdentifier:(id)a3 isDefaultFolder:(BOOL)a4
{
  id v6;
  NSObject *analyticsSynchronizationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke;
  v9[3] = &unk_1E649A410;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);

}

void __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke_2(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = *(const __CFString **)(a1 + 32);
  if (!v1)
    v1 = CFSTR("Unspecified");
  v5[1] = CFSTR("isDefaultFolder");
  v6[0] = v1;
  v5[0] = CFSTR("providerIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didDownvoteDataSourceWithMetadata:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didBanWebsiteWithMetadata:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didRetrieveNumberOfRecommendations:(unint64_t)a3 numberOfTopics:(unint64_t)a4
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD v5[6];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a3;
  v5[5] = a4;
  dispatch_async(analyticsSynchronizationQueue, v5);
}

uint64_t __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("recommendationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("topicCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didOpenRecommendationWithMetadata:(id)a3 withPosition:(int64_t)a4
{
  id v6;
  NSObject *analyticsSynchronizationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke;
  v9[3] = &unk_1E649A4F0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);

}

void __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 > 3)
    v5 = &stru_1E64A2498;
  else
    v5 = off_1E649B258[v4];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("openLocation"));
  return v3;
}

- (void)didOpenReadingListItemWithPosition:(int64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenCloudTabsItemWithPosition:(int64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenRecentlyClosedTabsItemWithPosition:(int64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_nameForStartPageSection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return CFSTR("Favorites");
  else
    return off_1E649AD20[a3 - 1];
}

- (void)didToggleShowMoreButtonForSection:(int64_t)a3 isShowingMore:(BOOL)a4
{
  AnalyticsSendEventLazy();
}

id __70__WBSAnalyticsLogger_didToggleShowMoreButtonForSection_isShowingMore___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("section");
  objc_msgSend(*(id *)(a1 + 32), "_nameForStartPageSection:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("result");
  v7[0] = v2;
  if (*(_BYTE *)(a1 + 48))
    v3 = CFSTR("Show More");
  else
    v3 = CFSTR("Show Less");
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didToggleShowMoreButtonForSection:(int64_t)a3
{
  -[WBSAnalyticsLogger didToggleShowMoreButtonForSection:isShowingMore:](self, "didToggleShowMoreButtonForSection:isShowingMore:", a3, 1);
}

- (void)didToggleShowLessButtonForSection:(int64_t)a3
{
  -[WBSAnalyticsLogger didToggleShowMoreButtonForSection:isShowingMore:](self, "didToggleShowMoreButtonForSection:isShowingMore:", a3, 0);
}

- (void)didRetrieveNumberOfFavorites:(unint64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("itemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didRetrieveNumberOfFrequentlyVisitedSites:(unint64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD block[5];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("itemCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didReceiveAnalyticsEventFromWebKitWithName:(id)a3 description:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *analyticsSynchronizationQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Safari")))
    objc_msgSend(CFSTR("com.apple.Safari."), "stringByAppendingString:", v8);
  else
    objc_msgSend(CFSTR("com.apple.WebKit."), "stringByAppendingString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke;
  v15[3] = &unk_1E649A540;
  v16 = v11;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(analyticsSynchronizationQueue, v15);

}

void __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportStatusForExtensions:(id)a3 extensionType:(id)a4
{
  id v6;
  id v7;
  NSObject *analyticsSynchronizationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__WBSAnalyticsLogger_reportStatusForExtensions_extensionType___block_invoke;
  v11[3] = &unk_1E649A540;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, v11);

}

void __62__WBSAnalyticsLogger_reportStatusForExtensions_extensionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[3];
  _QWORD v25[3];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (AnalyticsIsEventUsed())
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = *(id *)(a1 + 32);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v2)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = v2;
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v24[0] = CFSTR("extensionIdentifier");
          objc_msgSend(v4, "identifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v5;
          v24[1] = CFSTR("enabled");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "enabled"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2] = CFSTR("extensionType");
          v7 = *(_QWORD *)(a1 + 40);
          v25[1] = v6;
          v25[2] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("WebExtension")))
          {
            v22[0] = CFSTR("manifestVersion");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "manifestVersion"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = v9;
            v22[1] = CFSTR("allWebsitesPermissionLevel");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "allWebsitesPermissionLevel"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v23[1] = v10;
            v22[2] = CFSTR("websitesGrantedAccessCount");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "websitesGrantedAccessCount"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v23[2] = v11;
            v22[3] = CFSTR("websitesDeniedAccessCount");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "websitesDeniedAccessCount"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v23[3] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "safari_dictionaryByMergingWithDictionary:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v14;
          }
          AnalyticsSendEvent();

        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v2);
    }

  }
}

- (void)reportNumberOfExtensionsWithFrequencyDictionaryProvider:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke;
  block[3] = &unk_1E649A590;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

uint64_t __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didInjectScriptForExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__WBSAnalyticsLogger_didInjectScriptForExtensionWithIdentifier___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Extensions.Invoked"), v6);

}

id __64__WBSAnalyticsLogger_didInjectScriptForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  return extensionInvokedMetric(*(NSString **)(a1 + 32), 0);
}

- (void)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__WBSAnalyticsLogger_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Extensions.Invoked"), v6);

}

id __71__WBSAnalyticsLogger_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  return extensionInvokedMetric(*(NSString **)(a1 + 32), 1);
}

- (void)didFinishPageLoadWithPageLoadStatus:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__WBSAnalyticsLogger_didFinishPageLoadWithPageLoadStatus___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.PageFinishedLoad"), v3);
}

id __58__WBSAnalyticsLogger_didFinishPageLoadWithPageLoadStatus___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("loadStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didActivateLinkWithZoomScale:(float)a3 recentlyZoomedIn:(BOOL)a4
{
  _QWORD v4[4];
  float v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__WBSAnalyticsLogger_didActivateLinkWithZoomScale_recentlyZoomedIn___block_invoke;
  v4[3] = &__block_descriptor_37_e19___NSDictionary_8__0l;
  v5 = a3;
  v6 = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.LinkActivated"), v4);
}

id __68__WBSAnalyticsLogger_didActivateLinkWithZoomScale_recentlyZoomedIn___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("pageZoomScale");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("pageRecentlyZoomedIn");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didStartDragWithDragContentType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didStartDragWithDragContentType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.ContentDrag"), v3);
}

id __54__WBSAnalyticsLogger_didStartDragWithDragContentType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("dragContentType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportStartPageOverrideStatistics:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("newTabPageIsOverridden");
  v1 = (id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "newTabPageIsOverridden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("hasExtensionThatCanOverrideNewTabPage");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*v1, "hasExtensionThatCanOverrideNewTabPage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  AnalyticsSendEventLazy();

}

id __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didConvertExtensionWithKeySupport:(id)a3
{
  void *v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

uint64_t __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_467);
}

void __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  AnalyticsSendEventLazy();

}

id __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)webExtensionBackgroundPage:(id)a3 livedTooLong:(double)a4
{
  id v6;
  NSObject *analyticsSynchronizationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke;
  v9[3] = &unk_1E649A4F0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);

}

void __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = *(_QWORD *)(a1 + 32);
  v4[0] = CFSTR("extensionIdentifier");
  v4[1] = CFSTR("lifespan");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v2;
  AnalyticsSendEventLazy();

}

id __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_sendEvent:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *analyticsSynchronizationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__WBSAnalyticsLogger__sendEvent_usingBlock___block_invoke;
  v11[3] = &unk_1E649A640;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, v11);

}

uint64_t __44__WBSAnalyticsLogger__sendEvent_usingBlock___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (void)_sendEvent:(id)a3
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", a3, &__block_literal_global_470);
}

uint64_t __33__WBSAnalyticsLogger__sendEvent___block_invoke()
{
  return 0;
}

void __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("safariClient");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) - 1;
  if (v3 > 5)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E649AD68[v3];
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v6 = &stru_1E64A2498;
  if (v5)
    v6 = *(const __CFString **)(*(_QWORD *)(a1 + 40) + 24);
  v12[0] = v4;
  v12[1] = v6;
  v11[1] = CFSTR("safariVersion");
  v11[2] = CFSTR("safariComparableVersionNumber");
  objc_msgSend(v5, "safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.0"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_dictionaryByMergingWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  AnalyticsSendEvent();

}

uint64_t __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEventAddingVersionInfo:baseEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didSetCustomStartPageBackgroundImage
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.DidUpdateBackgroundImage"), &__block_literal_global_480);
}

void *__58__WBSAnalyticsLogger_didSetCustomStartPageBackgroundImage__block_invoke()
{
  return &unk_1E64D0F90;
}

- (void)didSetBuiltInStartPageBackgroundImage
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.DidUpdateBackgroundImage"), &__block_literal_global_488);
}

void *__59__WBSAnalyticsLogger_didSetBuiltInStartPageBackgroundImage__block_invoke()
{
  return &unk_1E64D0FB8;
}

- (void)didDragAndDropCustomStartPageBackgroundImage
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.DidUpdateBackgroundImage"), &__block_literal_global_494);
}

void *__66__WBSAnalyticsLogger_didDragAndDropCustomStartPageBackgroundImage__block_invoke()
{
  return &unk_1E64D0FE0;
}

- (void)didClearStartPageBackgroundImage
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.DidUpdateBackgroundImage"), &__block_literal_global_500);
}

void *__54__WBSAnalyticsLogger_didClearStartPageBackgroundImage__block_invoke()
{
  return &unk_1E64D1008;
}

- (void)didChangeStartPageSectionVisibility:(id)a3 visible:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__WBSAnalyticsLogger_didChangeStartPageSectionVisibility_visible___block_invoke;
  v8[3] = &unk_1E649A3E8;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.DidChangeSectionVisibility"), v8);

}

id __66__WBSAnalyticsLogger_didChangeStartPageSectionVisibility_visible___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("isVisible");
  v6[0] = v1;
  v5[0] = CFSTR("section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reportStartPageSectionVisibility:(int64_t)a3 visible:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__WBSAnalyticsLogger_reportStartPageSectionVisibility_visible___block_invoke;
  v4[3] = &unk_1E649A518;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.ReportSectionVisibility"), v4);
}

id __63__WBSAnalyticsLogger_reportStartPageSectionVisibility_visible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("section");
  objc_msgSend(*(id *)(a1 + 32), "_nameForStartPageSection:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("isVisible");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportStartPageBackgroundImageVisible:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__WBSAnalyticsLogger_reportStartPageBackgroundImageVisible___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.ReportSectionVisibility"), v3);
}

id __60__WBSAnalyticsLogger_reportStartPageBackgroundImageVisible___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[1] = CFSTR("isVisible");
  v5[0] = CFSTR("Background Image");
  v4[0] = CFSTR("section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportCustomizationSyncEnablement:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_reportCustomizationSyncEnablement___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.ReportSectionVisibility"), v3);
}

id __56__WBSAnalyticsLogger_reportCustomizationSyncEnablement___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[1] = CFSTR("isVisible");
  v5[0] = CFSTR("Customization Sync");
  v4[0] = CFSTR("section");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportStartPageVisibility
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.ReportStartPageVisibility"), &__block_literal_global_513);
}

uint64_t __47__WBSAnalyticsLogger_reportStartPageVisibility__block_invoke()
{
  return MEMORY[0x1E0C9AA70];
}

- (void)reportPrivateRelayModulePromptEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__WBSAnalyticsLogger_reportPrivateRelayModulePromptEvent___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.PrivateRelayModulePrompt"), v6);

}

id __58__WBSAnalyticsLogger_reportPrivateRelayModulePromptEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("privateRelayModulePromptEvent");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_builtInImageNameToSimpleName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(&unk_1E64D1030, "objectForKeyedSubscript:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("custom");
  v5 = v3;

  return v5;
}

- (void)reportStartPageBackgroundName:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WBSAnalyticsLogger_reportStartPageBackgroundName___block_invoke;
  v6[3] = &unk_1E649A618;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.StartPage.CurrentBackgroundImageName"), v6);

}

id __52__WBSAnalyticsLogger_reportStartPageBackgroundName___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "_builtInImageNameToSimpleName:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didEngageWithStartPageSection:(int64_t)a3
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD v4[6];

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke;
  v4[3] = &unk_1E649A4F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(analyticsSynchronizationQueue, v4);
}

uint64_t __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "_nameForStartPageSection:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didDismissSwitchToSafariBanner
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.DidDismissSwitchToSafariBanner"), &__block_literal_global_559);
}

void *__52__WBSAnalyticsLogger_didDismissSwitchToSafariBanner__block_invoke()
{
  return &unk_1E64D1058;
}

- (void)didSwitchToSafari:(id)a3 entryPoint:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__WBSAnalyticsLogger_didSwitchToSafari_entryPoint___block_invoke;
  v10[3] = &unk_1E649A618;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.setSafariAsDefaultBrowser"), v10);

}

id __51__WBSAnalyticsLogger_didSwitchToSafari_entryPoint___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("originBrowser");
  v3[1] = CFSTR("entryPoint");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportShowFullURLInSmartSearchFieldPreference:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__WBSAnalyticsLogger_reportShowFullURLInSmartSearchFieldPreference___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Preferences.ShowFullURLInSmartSearchField"), v3);
}

id __68__WBSAnalyticsLogger_reportShowFullURLInSmartSearchFieldPreference___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportShowStandaloneTabBarPreference:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_reportShowStandaloneTabBarPreference___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Preferences.ShowStandaloneTabBar"), v3);
}

id __59__WBSAnalyticsLogger_reportShowStandaloneTabBarPreference___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportUnifiedTabBarStatusWithLayout:(int64_t)a3 numberOfTabsInCurrentTabBar:(unint64_t)a4 tabBarIsCurrentlyScrollable:(BOOL)a5 tabsShowOnlyIcons:(BOOL)a6 backgroundColorInTabBarEnabled:(BOOL)a7
{
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;
  BOOL v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __163__WBSAnalyticsLogger_reportUnifiedTabBarStatusWithLayout_numberOfTabsInCurrentTabBar_tabBarIsCurrentlyScrollable_tabsShowOnlyIcons_backgroundColorInTabBarEnabled___block_invoke;
  v7[3] = &__block_descriptor_51_e19___NSDictionary_8__0l;
  v7[4] = a3;
  v7[5] = a4;
  v8 = a5;
  v9 = a6;
  v10 = a7;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.ReportUnifiedTabBarStatus"), v7);
}

id __163__WBSAnalyticsLogger_reportUnifiedTabBarStatusWithLayout_numberOfTabsInCurrentTabBar_tabBarIsCurrentlyScrollable_tabsShowOnlyIcons_backgroundColorInTabBarEnabled___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("layout");
  if (*(_QWORD *)(a1 + 32))
    v2 = CFSTR("separate");
  else
    v2 = CFSTR("compact");
  v3 = v2;
  v11[0] = v3;
  v10[1] = CFSTR("numberOfTabs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("tabBarIsCurrentlyScrollable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("tabsShowOnlyIcons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("backgroundColorInTabBarEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reportOverlayStatusBarIsEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_reportOverlayStatusBarIsEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Preferences.OverlayStatusBar"), v3);
}

id __54__WBSAnalyticsLogger_reportOverlayStatusBarIsEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportNumberOfPinnedTabs:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_reportNumberOfPinnedTabs___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.PinnedTabs.PeriodicCount"), v3);
}

id __47__WBSAnalyticsLogger_reportNumberOfPinnedTabs___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberOfPinnedTabs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didDetectLanguageOfWebpage:(id)a3 primaryLocale:(id)a4 webpageCanBeTranslatedToPrimaryLocale:(BOOL)a5 canOfferTranslation:(BOOL)a6 firstNonPrimaryLocaleThatCanBeTranslatedTo:(id)a7 numberOfPreferredLocales:(unint64_t)a8 notificationLevel:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __207__WBSAnalyticsLogger_didDetectLanguageOfWebpage_primaryLocale_webpageCanBeTranslatedToPrimaryLocale_canOfferTranslation_firstNonPrimaryLocaleThatCanBeTranslatedTo_numberOfPreferredLocales_notificationLevel___block_invoke;
  v21[3] = &unk_1E649A7D8;
  v22 = v15;
  v23 = v16;
  v27 = a5;
  v28 = a6;
  v24 = v17;
  v25 = a8;
  v26 = a9;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Translation.DetectedWebpageLanguage"), v21);

}

id __207__WBSAnalyticsLogger_didDetectLanguageOfWebpage_primaryLocale_webpageCanBeTranslatedToPrimaryLocale_canOfferTranslation_firstNonPrimaryLocaleThatCanBeTranslatedTo_numberOfPreferredLocales_notificationLevel___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("unknown");
  v14[0] = CFSTR("webpageLocale");
  v14[1] = CFSTR("primaryLocale");
  v3 = *(const __CFString **)(a1 + 32);
  if (!v3)
    v3 = CFSTR("unknown");
  if (*(_QWORD *)(a1 + 40))
    v2 = *(const __CFString **)(a1 + 40);
  v15[0] = v3;
  v15[1] = v2;
  v14[2] = CFSTR("canTranslateWebpageToPrimaryLocale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = CFSTR("canTranslateToAnyPreferredLocale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 73));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E64A2498;
  v8 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 48))
    v7 = *(const __CFString **)(a1 + 48);
  v15[3] = v5;
  v15[4] = v7;
  v14[4] = CFSTR("firstNonPrimaryLocaleThatCanBeTranslatedTo");
  v14[5] = CFSTR("numberOfPreferredLocales");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  v14[6] = CFSTR("notificationLevel");
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 > 2)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E649AD98[v10];
  v15[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)didRequestTranslatingToLocale:(id)a3 webpageLocale:(id)a4 requestType:(int64_t)a5 isTargetLocalePrimaryLocale:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__WBSAnalyticsLogger_didRequestTranslatingToLocale_webpageLocale_requestType_isTargetLocalePrimaryLocale___block_invoke;
  v14[3] = &unk_1E649A800;
  v15 = v11;
  v16 = v10;
  v18 = a6;
  v17 = a5;
  v12 = v10;
  v13 = v11;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Translation.RequestedTranslation"), v14);

}

id __106__WBSAnalyticsLogger_didRequestTranslatingToLocale_webpageLocale_requestType_isTargetLocalePrimaryLocale___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("webpageLocale");
  v11[1] = CFSTR("targetLocale");
  v2 = *(const __CFString **)(a1 + 32);
  v3 = *(const __CFString **)(a1 + 40);
  if (!v2)
    v2 = CFSTR("unknown");
  if (!v3)
    v3 = CFSTR("unknown");
  v12[0] = v2;
  v12[1] = v3;
  v11[2] = CFSTR("isTargetLocalePrimaryLocale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("requestType");
  v5 = *(_QWORD *)(a1 + 48);
  v6 = CFSTR("continued translation");
  if (v5 != 1)
    v6 = CFSTR("unknown");
  if (v5)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("manual translation");
  v8 = v7;
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reportFirstInteractionAfterTranslation:(int64_t)a3 maxVisibleHeightPercentage:(float)a4
{
  _QWORD v4[5];
  float v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__WBSAnalyticsLogger_reportFirstInteractionAfterTranslation_maxVisibleHeightPercentage___block_invoke;
  v4[3] = &__block_descriptor_44_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v5 = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Translation.ScrollInteraction"), v4);
}

id __88__WBSAnalyticsLogger_reportFirstInteractionAfterTranslation_maxVisibleHeightPercentage___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("millisecondsBetweenTranslationAndFirstInteraction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("maxVisibleHeightPercentage");
  v8[0] = v2;
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didShowSafeBrowsingWarningWithSource:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_didShowSafeBrowsingWarningWithSource___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SafeBrowsing.ShowedWarning"), v3);
}

id __59__WBSAnalyticsLogger_didShowSafeBrowsingWarningWithSource___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("source");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = CFSTR("unknown");
  if (v1 == 1)
    v2 = CFSTR("content blocker extension");
  if (v1)
    v3 = (__CFString *)v2;
  else
    v3 = CFSTR("service");
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didPerformSafeBrowsingAction:(int64_t)a3 fromSource:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__WBSAnalyticsLogger_didPerformSafeBrowsingAction_fromSource___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SafeBrowsing.PerformedAction"), v4);
}

id __62__WBSAnalyticsLogger_didPerformSafeBrowsingAction_fromSource___block_invoke(uint64_t a1)
{
  unint64_t v1;
  __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("action");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = CFSTR("unknown");
  v3 = CFSTR("unknown");
  if (v1 <= 2)
    v3 = off_1E649ADB0[v1];
  v8[1] = CFSTR("source");
  v9[0] = v3;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 1)
    v2 = CFSTR("content blocker extension");
  if (!v4)
    v2 = CFSTR("service");
  v5 = v2;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didLoadTabContent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__WBSAnalyticsLogger_didLoadTabContent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.LoadedTabContent"), v3);
}

id __40__WBSAnalyticsLogger_didLoadTabContent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("tabContent");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = CFSTR("is PDF document");
  if (v1 == 1)
    v2 = CFSTR("has Quick Look content");
  if (v1 == 2)
    v3 = CFSTR("other");
  else
    v3 = (__CFString *)v2;
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didContinueUserActivityOfType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__WBSAnalyticsLogger_didContinueUserActivityOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ContinuedUserActivity"), v3);
}

id __52__WBSAnalyticsLogger_didContinueUserActivityOfType___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("type");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("show reading list");
  else
    v2 = off_1E649ADC8[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didAddWebClip
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.AddedWebClip"), &__block_literal_global_617);
}

uint64_t __35__WBSAnalyticsLogger_didAddWebClip__block_invoke()
{
  return 0;
}

- (void)didPrintPage
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.PrintedPage"), &__block_literal_global_618);
}

uint64_t __34__WBSAnalyticsLogger_didPrintPage__block_invoke()
{
  return 0;
}

- (void)didClearBrowsingDataFromInterval:(int64_t)a3 withMethod:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__WBSAnalyticsLogger_didClearBrowsingDataFromInterval_withMethod___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ClearedBrowsingData"), v4);
}

id __66__WBSAnalyticsLogger_didClearBrowsingDataFromInterval_withMethod___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("interval");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("last hour");
  else
    v2 = off_1E649ADE0[v1];
  v8[0] = v2;
  v7[1] = CFSTR("method");
  if (*(_QWORD *)(a1 + 40))
    v3 = CFSTR("settings");
  else
    v3 = CFSTR("in app");
  v4 = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didSetPrivateBrowsingEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didSetPrivateBrowsingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SetPrivateBrowsingEnabled"), v3);
}

id __51__WBSAnalyticsLogger_didSetPrivateBrowsingEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didEnterTabViewWithMethod:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__WBSAnalyticsLogger_didEnterTabViewWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.EnteredTabView"), v3);
}

id __48__WBSAnalyticsLogger_didEnterTabViewWithMethod___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("method");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = CFSTR("tap button");
  if (v1 == 1)
    v2 = CFSTR("pinch gesture");
  if (v1 == 2)
    v3 = CFSTR("keyboard shortcut");
  else
    v3 = (__CFString *)v2;
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportUserPreferencesOnLaunchForJavaScriptEnabled:(BOOL)a3 safeBrowsingEnabled:(BOOL)a4 siteSpecificSearchEnabled:(BOOL)a5 trackingPolicy:(unint64_t)a6
{
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;
  BOOL v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __133__WBSAnalyticsLogger_reportUserPreferencesOnLaunchForJavaScriptEnabled_safeBrowsingEnabled_siteSpecificSearchEnabled_trackingPolicy___block_invoke;
  v6[3] = &__block_descriptor_43_e19___NSDictionary_8__0l;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v6[4] = a6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.UserPreferencesOnLaunch"), v6);
}

id __133__WBSAnalyticsLogger_reportUserPreferencesOnLaunchForJavaScriptEnabled_safeBrowsingEnabled_siteSpecificSearchEnabled_trackingPolicy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C9AAB0];
  v11[0] = CFSTR("iconsInTabsEnabled");
  v11[1] = CFSTR("javaScriptEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v2;
  v11[2] = CFSTR("safeBrowsingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v3;
  v11[3] = CFSTR("siteSpecificSearchEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v4;
  v11[4] = CFSTR("trackingPolicy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("always");
  if (v5 == 1)
    v6 = CFSTR("never");
  if (v5 == 2)
    v7 = CFSTR("only from main document domain");
  else
    v7 = (__CFString *)v6;
  v8 = v7;
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reportExperimentalFeaturesOnLaunchForWebXREnabled:(BOOL)a3 webXRGamepadsModuleEnabled:(BOOL)a4 webXRHandInputModuleEnabled:(BOOL)a5 modelElementEnabled:(BOOL)a6
{
  _QWORD v6[4];
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __147__WBSAnalyticsLogger_reportExperimentalFeaturesOnLaunchForWebXREnabled_webXRGamepadsModuleEnabled_webXRHandInputModuleEnabled_modelElementEnabled___block_invoke;
  v6[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.ExperimentalFeaturesOnLaunch"), v6);
}

id __147__WBSAnalyticsLogger_reportExperimentalFeaturesOnLaunchForWebXREnabled_webXRGamepadsModuleEnabled_webXRHandInputModuleEnabled_modelElementEnabled___block_invoke(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("webXREnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("webXRGamepadsModuleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[33]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("webXRHandInputModuleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[34]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("modelElementEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[35]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didRemoveSiteSpecificSearchProvider
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.RemovedSiteSpecificSearchProvider"), &__block_literal_global_641);
}

void *__57__WBSAnalyticsLogger_didRemoveSiteSpecificSearchProvider__block_invoke()
{
  return &unk_1E64D1080;
}

- (void)didRequestPageShowingSideBar:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didRequestPageShowingSideBar___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.RequestedPage"), v3);
}

id __51__WBSAnalyticsLogger_didRequestPageShowingSideBar___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("showingSideBar");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didDetectPossibleUserTrackingInHostApp:(id)a3 urlHasIDFA:(BOOL)a4 urlHasQueryString:(BOOL)a5 userInteracted:(BOOL)a6 viewControllerIsHidden:(BOOL)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  v12 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __128__WBSAnalyticsLogger_didDetectPossibleUserTrackingInHostApp_urlHasIDFA_urlHasQueryString_userInteracted_viewControllerIsHidden___block_invoke;
  v14[3] = &unk_1E649A8E8;
  v15 = v12;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v13 = v12;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariViewController.DetectedPossibleUserTracking"), v14);

}

id __128__WBSAnalyticsLogger_didDetectPossibleUserTrackingInHostApp_urlHasIDFA_urlHasQueryString_userInteracted_viewControllerIsHidden___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("hostAppIdentifier");
  v8[1] = CFSTR("urlHasIDFA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  v8[2] = CFSTR("urlHasQueryString");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v3;
  v8[3] = CFSTR("userInteracted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  v8[4] = CFSTR("viewControllerIsHidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 43));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didAddReadingListItemWithMethod:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAddReadingListItemWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ReadingList.AddedItem"), v3);
}

id __54__WBSAnalyticsLogger_didAddReadingListItemWithMethod___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("method");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 4)
    v2 = CFSTR("context menu");
  else
    v2 = off_1E649ADF8[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenReadingListItemWithReachableNetwork:(BOOL)a3 isContinuousTransition:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__WBSAnalyticsLogger_didOpenReadingListItemWithReachableNetwork_isContinuousTransition___block_invoke;
  v4[3] = &__block_descriptor_34_e19___NSDictionary_8__0l;
  v5 = a3;
  v6 = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ReadingList.OpenedItem"), v4);
}

id __88__WBSAnalyticsLogger_didOpenReadingListItemWithReachableNetwork_isContinuousTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("isNetworkReachable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("isContinuousTransition");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didManuallyMarkReadingListItemAsRead:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_didManuallyMarkReadingListItemAsRead___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ReadingList.ManuallyMarkedItemAsRead"), v3);
}

id __59__WBSAnalyticsLogger_didManuallyMarkReadingListItemAsRead___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("read");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didDetermineReaderAvailability:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_didDetermineReaderAvailability___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.ReaderAvailabilityDetermined"), v3);
}

id __53__WBSAnalyticsLogger_didDetermineReaderAvailability___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("available");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didActivateReaderWithTrigger:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didActivateReaderWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.ReaderActivated"), v3);
}

id __51__WBSAnalyticsLogger_didActivateReaderWithTrigger___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("triggerType");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("manual");
  else
    v2 = off_1E649AE20[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didDismissCompletionListWithItemAccepted:(BOOL)a3 goKeyTapped:(BOOL)a4 unifiedFieldContentType:(int64_t)a5
{
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__WBSAnalyticsLogger_didDismissCompletionListWithItemAccepted_goKeyTapped_unifiedFieldContentType___block_invoke;
  v5[3] = &__block_descriptor_42_e19___NSDictionary_8__0l;
  v6 = a3;
  v7 = a4;
  v5[4] = a5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.CompletionList.DismissedCompletionList"), v5);
}

id __99__WBSAnalyticsLogger_didDismissCompletionListWithItemAccepted_goKeyTapped_unifiedFieldContentType___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("acceptedCompletionItem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("unifiedFieldContentType");
  v11[0] = v2;
  v3 = *(unsigned __int8 *)(a1 + 41);
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = CFSTR("address");
    if (v4 == 1)
      v5 = CFSTR("search query");
    if (v4 == 2)
      v6 = CFSTR("parsec top hit");
    else
      v6 = (__CFString *)v5;
    v7 = v6;
  }
  else
  {
    v7 = &stru_1E64A2498;
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)

  return v8;
}

- (void)didAcceptCompletionItemOfType:(int64_t)a3 atRank:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__WBSAnalyticsLogger_didAcceptCompletionItemOfType_atRank___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.CompletionList.AcceptedItem"), v4);
}

id __59__WBSAnalyticsLogger_didAcceptCompletionItemOfType_atRank___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("type");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 9)
    v2 = CFSTR("bookmarks and history");
  else
    v2 = off_1E649AE38[v1];
  v7[0] = v2;
  v6[1] = CFSTR("rank");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didAcceptSearchSuggestionOfType:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAcceptSearchSuggestionOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.CompletionList.AcceptedSearchSuggestion"), v3);
}

id __54__WBSAnalyticsLogger_didAcceptSearchSuggestionOfType___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("type");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("literal search");
  else
    v2 = off_1E649AE88[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didChooseTopHit:(BOOL)a3 matchLength:(unint64_t)a4 matchScore:(float)a5
{
  _QWORD v5[5];
  float v6;
  BOOL v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__WBSAnalyticsLogger_didChooseTopHit_matchLength_matchScore___block_invoke;
  v5[3] = &__block_descriptor_45_e19___NSDictionary_8__0l;
  v7 = a3;
  v5[4] = a4;
  v6 = a5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.CompletionList.ChoseOrIgnoredTopHit"), v5);
}

id __61__WBSAnalyticsLogger_didChooseTopHit_matchLength_matchScore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("isTopHitChosen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("matchLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("matchScore");
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didActivateVoiceSearchAccidentally:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didActivateVoiceSearchAccidentally___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.VoiceSearchActivatedAccidentally"), v3);
}

id __57__WBSAnalyticsLogger_didActivateVoiceSearchAccidentally___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("activatedAccidentally");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didSnapBack
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SnapBack"), &__block_literal_global_686);
}

uint64_t __33__WBSAnalyticsLogger_didSnapBack__block_invoke()
{
  return 0;
}

- (void)reportNumberOfWindows:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__WBSAnalyticsLogger_reportNumberOfWindows___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.WindowCount"), v3);
}

id __44__WBSAnalyticsLogger_reportNumberOfWindows___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("windowCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportNumberOfTabsPerWindow:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportNumberOfTabsPerWindow___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabsPerWindowCount"), v3);
}

id __50__WBSAnalyticsLogger_reportNumberOfTabsPerWindow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("tabsPerWindowCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportNumberOfTabs:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__WBSAnalyticsLogger_reportNumberOfTabs___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabCount"), v3);
}

id __41__WBSAnalyticsLogger_reportNumberOfTabs___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("tabCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportNewWindowBehavior:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__WBSAnalyticsLogger_reportNewWindowBehavior___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.NewWindowBehavior"), v3);
}

id __46__WBSAnalyticsLogger_reportNewWindowBehavior___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("newWindowBehavior");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 4)
    v2 = CFSTR("Start Page");
  else
    v2 = off_1E649AEA0[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportNewTabBehavior:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__WBSAnalyticsLogger_reportNewTabBehavior___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.NewTabBehavior"), v3);
}

id __43__WBSAnalyticsLogger_reportNewTabBehavior___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("newTabBehavior");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 4)
    v2 = CFSTR("Start Page");
  else
    v2 = off_1E649AEA0[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenVisualTabPickerWithMethod:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__WBSAnalyticsLogger_didOpenVisualTabPickerWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.VisualTabPicker.Entry"), v3);
}

id __55__WBSAnalyticsLogger_didOpenVisualTabPickerWithMethod___block_invoke(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("openMethod");
  if (*(_QWORD *)(a1 + 32))
    v1 = CFSTR("open with pinching");
  else
    v1 = CFSTR("open");
  v2 = v1;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didCloseVisualTabPickerWithMethod:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didCloseVisualTabPickerWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.VisualTabPicker.Exit"), v3);
}

id __56__WBSAnalyticsLogger_didCloseVisualTabPickerWithMethod___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("closeMethod");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("close");
  else
    v2 = off_1E649AEC8[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didPerformVisualTabPickerMiscEvent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didPerformVisualTabPickerMiscEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.VisualTabPicker.Misc"), v3);
}

id __57__WBSAnalyticsLogger_didPerformVisualTabPickerMiscEvent___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("miscEvent");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("close tab");
  else
    v2 = off_1E649AEE0[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenClearHistoryFromSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WBSAnalyticsLogger_didOpenClearHistoryFromSource___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ClearHistory.Opened"), v6);

}

id __52__WBSAnalyticsLogger_didOpenClearHistoryFromSource___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("source");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didTakeActionOnClearHistory:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WBSAnalyticsLogger_didTakeActionOnClearHistory___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ClearHistory.ActionTaken"), v6);

}

id __50__WBSAnalyticsLogger_didTakeActionOnClearHistory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("actionTaken");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didFindOnPageWithTrigger:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_didFindOnPageWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.FindOnPageTriggered"), v3);
}

id __47__WBSAnalyticsLogger_didFindOnPageWithTrigger___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("trigger");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = CFSTR("unknown");
  else
    v2 = off_1E649AEF8[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didCloseTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
  -[WBSAnalyticsLogger didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:](self, "didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:", a3, 0, 1, a4);
}

- (void)didCloseTabWithTrigger:(int64_t)a3 tabClosingAction:(int64_t)a4 numberOfTabsClosed:(unint64_t)a5 tabCollectionViewType:(int64_t)a6
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__WBSAnalyticsLogger_didCloseTabWithTrigger_tabClosingAction_numberOfTabsClosed_tabCollectionViewType___block_invoke;
  v6[3] = &__block_descriptor_64_e19___NSDictionary_8__0l;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Tabs.ClosedTab"), v6);
}

id __103__WBSAnalyticsLogger_didCloseTabWithTrigger_tabClosingAction_numberOfTabsClosed_tabCollectionViewType___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  const __CFString *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("tabClosingTrigger");
  v2 = a1[4] - 1;
  if (v2 > 2)
    v3 = CFSTR("close button");
  else
    v3 = off_1E649AF18[v2];
  v12[0] = v3;
  v11[1] = CFSTR("tabClosingAction");
  v4 = a1[5] - 1;
  if (v4 > 3)
    v5 = CFSTR("none");
  else
    v5 = off_1E649AF30[v4];
  v12[1] = v5;
  v11[2] = CFSTR("numberOfTabsClosed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("tabCollectionViewType");
  v7 = a1[7] - 1;
  if (v7 > 2)
    v8 = CFSTR("not visible");
  else
    v8 = off_1E649AF90[v7];
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didOpenNewBlankTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__WBSAnalyticsLogger_didOpenNewBlankTabWithTrigger_tabCollectionViewType___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Tabs.OpenedNewTab"), v4);
}

id __74__WBSAnalyticsLogger_didOpenNewBlankTabWithTrigger_tabCollectionViewType___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  unint64_t v3;
  const __CFString *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("withURL");
  v6[1] = CFSTR("isExternalLink");
  v7[0] = MEMORY[0x1E0C9AAA0];
  v7[1] = MEMORY[0x1E0C9AAA0];
  v6[2] = CFSTR("trigger");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 2)
    v2 = CFSTR("keyboard shortcut");
  else
    v2 = off_1E649AF50[v1];
  v7[2] = v2;
  v6[3] = CFSTR("tabCollectionViewType");
  v3 = *(_QWORD *)(a1 + 40) - 1;
  if (v3 > 2)
    v4 = CFSTR("not visible");
  else
    v4 = off_1E649AF90[v3];
  v7[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
  -[WBSAnalyticsLogger didOpenNewTabWithURLWithTrigger:isExternalLink:tabCollectionViewType:](self, "didOpenNewTabWithURLWithTrigger:isExternalLink:tabCollectionViewType:", a3, 0, a4);
}

- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 isExternalLink:(BOOL)a4 tabCollectionViewType:(int64_t)a5
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__WBSAnalyticsLogger_didOpenNewTabWithURLWithTrigger_isExternalLink_tabCollectionViewType___block_invoke;
  v5[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  v6 = a4;
  v5[4] = a3;
  v5[5] = a5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Tabs.OpenedNewTab"), v5);
}

id __91__WBSAnalyticsLogger_didOpenNewTabWithURLWithTrigger_isExternalLink_tabCollectionViewType___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C9AAB0];
  v9[0] = CFSTR("withURL");
  v9[1] = CFSTR("isExternalLink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = CFSTR("trigger");
  v3 = *(_QWORD *)(a1 + 32) - 1;
  if (v3 > 4)
    v4 = CFSTR("continue activity");
  else
    v4 = off_1E649AF68[v3];
  v10[2] = v4;
  v9[3] = CFSTR("tabCollectionViewType");
  v5 = *(_QWORD *)(a1 + 40) - 1;
  if (v5 > 2)
    v6 = CFSTR("not visible");
  else
    v6 = off_1E649AF90[v5];
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("interval");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportAutomaticTabClosingInterval:(id)a3
{
  id v4;
  NSObject *analyticsSynchronizationQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke;
  block[3] = &unk_1E649A460;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("interval");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didCloseTabsAutomaticallyWithCount:(unint64_t)a3 tabClosingInterval:(id)a4
{
  id v6;
  NSObject *analyticsSynchronizationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke;
  v9[3] = &unk_1E649A4F0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);

}

void __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("interval");
  v6[1] = CFSTR("closedTabCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didPerformActionOnDownloadsPopover:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didPerformActionOnDownloadsPopover___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Downloads.Popover"), v3);
}

id __57__WBSAnalyticsLogger_didPerformActionOnDownloadsPopover___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("performedAction");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 5)
    v2 = CFSTR("Detached popover");
  else
    v2 = off_1E649AFA8[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didPerformDownloadsFileEvent:(int64_t)a3 withFileType:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__WBSAnalyticsLogger_didPerformDownloadsFileEvent_withFileType___block_invoke;
  v8[3] = &unk_1E649A340;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Downloads.FileType"), v8);

}

id __64__WBSAnalyticsLogger_didPerformDownloadsFileEvent_withFileType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("downloadsFileEvent");
  v2 = *(_QWORD *)(a1 + 48);
  v3 = CFSTR("created destination");
  if (v2 == 1)
    v3 = CFSTR("finished download");
  if (v2 == 2)
    v4 = CFSTR("canceled download");
  else
    v4 = (__CFString *)v3;
  v5 = v4;
  v9[1] = CFSTR("fileType");
  v10[0] = v5;
  objc_msgSend(*(id *)(a1 + 32), "_sanitizedPathExtensionForAnalyticsForPathExtension:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sanitizedPathExtensionForAnalyticsForPathExtension:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "safari_isPathExtensionAllowedForAnalytics"))
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("Unspecified");

  return v4;
}

- (void)didReloadEvent:(int64_t)a3 withReloadType:(int64_t)a4 withReloadProvenance:(int64_t)a5 withLayout:(int64_t)a6
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__WBSAnalyticsLogger_didReloadEvent_withReloadType_withReloadProvenance_withLayout___block_invoke;
  v6[3] = &__block_descriptor_64_e19___NSDictionary_8__0l;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Reload"), v6);
}

id __84__WBSAnalyticsLogger_didReloadEvent_withReloadType_withReloadProvenance_withLayout___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  const __CFString *v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("reloadEvent");
  v2 = a1[4] - 1;
  if (v2 > 2)
    v3 = CFSTR("reloaded page");
  else
    v3 = off_1E649AFD8[v2];
  v13[0] = v3;
  v12[1] = CFSTR("reloadType");
  v4 = a1[5] - 1;
  if (v4 > 5)
    v5 = CFSTR("reloaded normally");
  else
    v5 = off_1E649AFF0[v4];
  v13[1] = v5;
  v12[2] = CFSTR("reloadProvenance");
  if (a1[6])
    v6 = CFSTR("reloaded within the reload button menu");
  else
    v6 = CFSTR("reloaded within the more menu");
  v7 = v6;
  v13[2] = v7;
  v12[3] = CFSTR("layout");
  v8 = a1[7] - 1;
  if (v8 > 4)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E649B3F8[v8];
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)reportAudioIndicatorClickEvent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_reportAudioIndicatorClickEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.TabAudio"), v3);
}

id __53__WBSAnalyticsLogger_reportAudioIndicatorClickEvent___block_invoke(uint64_t a1)
{
  unint64_t v1;
  __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("audioIndicatorEvent");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 4)
    v2 = 0;
  else
    v2 = off_1E649B020[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportPictureInPictureEvent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportPictureInPictureEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.PictureInPicture"), v3);
}

id __50__WBSAnalyticsLogger_reportPictureInPictureEvent___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("didExit");
  if (!*(_QWORD *)(a1 + 32))
    v1 = CFSTR("didEnter");
  v3 = CFSTR("pipEvent");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportPrivateBrowsingUsage:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__WBSAnalyticsLogger_reportPrivateBrowsingUsage___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.PrivateBrowsing"), v3);
}

id __49__WBSAnalyticsLogger_reportPrivateBrowsingUsage___block_invoke(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("usage");
  if (*(_QWORD *)(a1 + 32))
    v1 = CFSTR("is using private browsing in any window");
  else
    v1 = CFSTR("opened private window");
  v2 = v1;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reportInvalidMessageFromWebProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__WBSAnalyticsLogger_reportInvalidMessageFromWebProcess___block_invoke;
    v7[3] = &unk_1E649A618;
    v8 = v4;
    v9 = v6;
    -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.InvalidMessageFromWebProcess"), v7);

  }
}

id __57__WBSAnalyticsLogger_reportInvalidMessageFromWebProcess___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("message");
  v3[1] = CFSTR("safariBundleVersion");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportUnifiedFieldEvent:(int64_t)a3
{
  __CFString *v3;
  _QWORD v4[4];
  __CFString *v5;
  int64_t v6;

  if ((unint64_t)a3 <= 6 && ((0x77u >> a3) & 1) != 0)
  {
    v3 = off_1E649B048[a3];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__WBSAnalyticsLogger_reportUnifiedFieldEvent___block_invoke;
    v4[3] = &unk_1E649A4C8;
    v5 = v3;
    v6 = a3;
    -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.URL"), v4);

  }
}

id __46__WBSAnalyticsLogger_reportUnifiedFieldEvent___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("unifiedFieldEvent");
  v1 = *(_QWORD *)(a1 + 40) - 1;
  if (v1 > 5)
    v2 = CFSTR("UnifiedField");
  else
    v2 = off_1E649B080[v1];
  v4[1] = CFSTR("value");
  v5[0] = v2;
  v5[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__WBSAnalyticsLogger_reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.URL"), v6);

}

id __95__WBSAnalyticsLogger_reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("unifiedFieldEvent");
  v3[1] = CFSTR("value");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = CFSTR("HistoryItemAutocompleted");
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportUnifiedFieldSearchSlowDown:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__WBSAnalyticsLogger_reportUnifiedFieldSearchSlowDown___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.URL.SearchSlowDown"), v3);
}

id __55__WBSAnalyticsLogger_reportUnifiedFieldSearchSlowDown___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didModifyPerSitePreferencesWithPreferenceIdentifier:(id)a3 modificationLevel:(int64_t)a4 type:(int64_t)a5 method:(int64_t)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  int64_t v17;
  int64_t v18;

  v10 = a3;
  switch(a6)
  {
    case 1:
      v11 = CFSTR("in-app");
      break;
    case 2:
      v11 = CFSTR("settings");
      break;
    case 3:
      v11 = CFSTR("keyboard shortcut");
      break;
    case 4:
      v11 = CFSTR("preference pane");
      break;
    case 5:
      v11 = self->_perSitePreferencesPopoverLocation;
      break;
    default:
      v11 = CFSTR("page formatting menu");
      break;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__WBSAnalyticsLogger_didModifyPerSitePreferencesWithPreferenceIdentifier_modificationLevel_type_method___block_invoke;
  v14[3] = &unk_1E649A9D0;
  v17 = a4;
  v18 = a5;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.PerSitePreferences"), v14);

}

id __104__WBSAnalyticsLogger_didModifyPerSitePreferencesWithPreferenceIdentifier_modificationLevel_type_method___block_invoke(_QWORD *a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = a1[4];
  v9[0] = CFSTR("identifier");
  v9[1] = CFSTR("level");
  if (a1[6])
    v2 = CFSTR("domain");
  else
    v2 = CFSTR("default");
  v3 = v2;
  v10[1] = v3;
  v9[2] = CFSTR("type");
  if (a1[7])
    v4 = CFSTR("clear");
  else
    v4 = CFSTR("set");
  v5 = v4;
  v9[3] = CFSTR("method");
  v6 = a1[5];
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didOpenPerSitePreferencesPopoverVia:(int64_t)a3
{
  const __CFString *v4;
  __CFString *v5;
  _QWORD v6[5];

  v4 = CFSTR("popover via Safari menu item");
  if (a3 == 1)
    v4 = CFSTR("popover via context menu item");
  if (a3 == 2)
    v5 = CFSTR("popover via toolbar button");
  else
    v5 = (__CFString *)v4;
  objc_storeStrong((id *)&self->_perSitePreferencesPopoverLocation, v5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__WBSAnalyticsLogger_didOpenPerSitePreferencesPopoverVia___block_invoke;
  v6[3] = &unk_1E649A438;
  v6[4] = self;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.PerSitePreferences.PopoverOpened"), v6);
}

id __58__WBSAnalyticsLogger_didOpenPerSitePreferencesPopoverVia___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = CFSTR("location");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount:(unint64_t)a3 allDuplicatesCount:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __101__WBSAnalyticsLogger_reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount_allDuplicatesCount___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.ReportNumberOfDuplicates"), v4);
}

id __101__WBSAnalyticsLogger_reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount_allDuplicatesCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("topLevelDuplicatesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("allDuplicatesCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didVisitBookmarksWithOpenLocation:(int64_t)a3 numberOfBookmarksVisited:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__WBSAnalyticsLogger_didVisitBookmarksWithOpenLocation_numberOfBookmarksVisited___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.VisitedBookmarks"), v4);
}

id __81__WBSAnalyticsLogger_didVisitBookmarksWithOpenLocation_numberOfBookmarksVisited___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v7[0] = v2;
  v6[1] = CFSTR("numberOfBookmarksVisited");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didPreventBookmarkActionWithBookmarkType:(int64_t)a3 actionType:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__WBSAnalyticsLogger_didPreventBookmarkActionWithBookmarkType_actionType___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.PreventedBookmarkAction"), v4);
}

id __74__WBSAnalyticsLogger_didPreventBookmarkActionWithBookmarkType_actionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("bookmarkType");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("bookmark");
  if (v2 == 1)
    v3 = CFSTR("favorite");
  if (v2 == 2)
    v4 = CFSTR("reading list item");
  else
    v4 = (__CFString *)v3;
  v5 = v4;
  v10[1] = CFSTR("actionType");
  v11[0] = v5;
  v6 = *(_QWORD *)(a1 + 40) - 1;
  if (v6 > 2)
    v7 = CFSTR("add");
  else
    v7 = off_1E649B0B0[v6];
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didAddBookmarkWithMethod:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = CFSTR("long press bookmark button");
  else
    v3 = off_1E649B0C8[a3 - 1];
  -[WBSAnalyticsLogger _didAddBookmarkWithMethod:menuItemType:](self, "_didAddBookmarkWithMethod:menuItemType:", v3, &stru_1E64A2498);
}

- (void)didAddBookmarkFromToolbarMenuWithItemType:(int64_t)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("folder");
  else
    v3 = CFSTR("single");
  -[WBSAnalyticsLogger _didAddBookmarkWithMethod:menuItemType:](self, "_didAddBookmarkWithMethod:menuItemType:", CFSTR("long press bookmark button"), v3);
}

- (void)_didAddBookmarkWithMethod:(id)a3 menuItemType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__WBSAnalyticsLogger__didAddBookmarkWithMethod_menuItemType___block_invoke;
  v10[3] = &unk_1E649A618;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.AddedBookmark"), v10);

}

id __61__WBSAnalyticsLogger__didAddBookmarkWithMethod_menuItemType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("method");
  v3[1] = CFSTR("menuItemType");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didAddNumberOfBookmarksInMemory:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAddNumberOfBookmarksInMemory___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.AddedBookmarksInMemory"), v3);
}

id __54__WBSAnalyticsLogger_didAddNumberOfBookmarksInMemory___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberOfBookmarksAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didDeleteBookmarkInMemory
{
  -[WBSAnalyticsLogger didDeleteNumberOfBookmarksInMemory:](self, "didDeleteNumberOfBookmarksInMemory:", 1);
}

- (void)didDeleteNumberOfBookmarksInMemory:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didDeleteNumberOfBookmarksInMemory___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.DeletedBookmarksInMemory"), v3);
}

id __57__WBSAnalyticsLogger_didDeleteNumberOfBookmarksInMemory___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberOfBookmarksDeleted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didEnterBackgroundWithBookmarksInMemory
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.EnteredBackgroundWithBookmarksInMemory"), &__block_literal_global_779);
}

uint64_t __61__WBSAnalyticsLogger_didEnterBackgroundWithBookmarksInMemory__block_invoke()
{
  return 0;
}

- (void)didSaveInMemoryBookmarksToSideFile
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Bookmarks.SavedInMemoryBookmarksToSideFile"), &__block_literal_global_780);
}

uint64_t __56__WBSAnalyticsLogger_didSaveInMemoryBookmarksToSideFile__block_invoke()
{
  return 0;
}

- (void)didShowPasswordGenerationPromptWithPasswordAccepted:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__WBSAnalyticsLogger_didShowPasswordGenerationPromptWithPasswordAccepted___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Autofill.PasswordGeneration.ShowedPrompt"), v3);
}

id __74__WBSAnalyticsLogger_didShowPasswordGenerationPromptWithPasswordAccepted___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("passwordAccepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didUseGeneratedPassword
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Autofill.PasswordGeneration.UsedGeneratedPassword"), &__block_literal_global_783);
}

uint64_t __45__WBSAnalyticsLogger_didUseGeneratedPassword__block_invoke()
{
  return 0;
}

- (void)didChooseCustomPassword
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidChooseCustomPassword"), &__block_literal_global_784);
}

uint64_t __45__WBSAnalyticsLogger_didChooseCustomPassword__block_invoke()
{
  return 0;
}

- (void)didChooseToEditStrongPassword
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidChooseToEditStrongPassword"), &__block_literal_global_785);
}

uint64_t __51__WBSAnalyticsLogger_didChooseToEditStrongPassword__block_invoke()
{
  return 0;
}

- (void)didChooseStrongPasswordWithoutSpecialCharacters
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidChooseStrongPasswordWithoutSpecialCharacters"), &__block_literal_global_786);
}

uint64_t __69__WBSAnalyticsLogger_didChooseStrongPasswordWithoutSpecialCharacters__block_invoke()
{
  return 0;
}

- (void)didLaunchPasswordsApp
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidLaunchPasswordsApp"), &__block_literal_global_787);
}

uint64_t __43__WBSAnalyticsLogger_didLaunchPasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSurfaceUsePasswordsAppView
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSurfaceUsePasswordsAppView"), &__block_literal_global_788);
}

uint64_t __51__WBSAnalyticsLogger_didSurfaceUsePasswordsAppView__block_invoke()
{
  return 0;
}

- (void)didSelectUsePasswordsApp
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSelectUsePasswordsApp"), &__block_literal_global_789);
}

uint64_t __46__WBSAnalyticsLogger_didSelectUsePasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSelectNotNowForUsePasswordsApp
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSelectNotNowForUsePasswordsApp"), &__block_literal_global_790);
}

uint64_t __55__WBSAnalyticsLogger_didSelectNotNowForUsePasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSurfaceNewStrongPasswordView
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSurfaceNewStrongPasswordView"), &__block_literal_global_791);
}

uint64_t __53__WBSAnalyticsLogger_didSurfaceNewStrongPasswordView__block_invoke()
{
  return 0;
}

- (void)didSelectNewStrongPassword
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSelectNewStrongPassword"), &__block_literal_global_792);
}

uint64_t __48__WBSAnalyticsLogger_didSelectNewStrongPassword__block_invoke()
{
  return 0;
}

- (void)didSelectXForNewStrongPassword
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Passwords.DidSelectXForNewStrongPassword"), &__block_literal_global_793);
}

uint64_t __52__WBSAnalyticsLogger_didSelectXForNewStrongPassword__block_invoke()
{
  return 0;
}

- (void)generatedPasswordDidOverwriteExistingPasswordWithTrigger:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__WBSAnalyticsLogger_generatedPasswordDidOverwriteExistingPasswordWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Autofill.PasswordGeneration.OverwroteExistingPassword"), v3);
}

id __79__WBSAnalyticsLogger_generatedPasswordDidOverwriteExistingPasswordWithTrigger___block_invoke(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("trigger");
  if (*(_QWORD *)(a1 + 32))
    v1 = CFSTR("view close");
  else
    v1 = CFSTR("app suspend");
  v2 = v1;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didPresentUsernamePrompt
{
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Autofill.PasswordManagement.DidPresentUsernamePrompt"), &__block_literal_global_794);
}

uint64_t __46__WBSAnalyticsLogger_didPresentUsernamePrompt__block_invoke()
{
  return 0;
}

- (void)didSuggestUsernameInPromptAndUserKeptSuggestion:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__WBSAnalyticsLogger_didSuggestUsernameInPromptAndUserKeptSuggestion___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.Autofill.PasswordManagement.ReportUseOfSuggestedUsernameInPrompt"), v3);
}

id __70__WBSAnalyticsLogger_didSuggestUsernameInPromptAndUserKeptSuggestion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("userKeptUsernameSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withFieldType:(int64_t)a4 elementType:(unint64_t)a5 isAutoFilled:(BOOL)a6 isManuallyFilledByUser:(BOOL)a7 modificationType:(unint64_t)a8 autoFillOfferedType:(unint64_t)a9 webpageLocale:(id)a10
{
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;

  v17 = a10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __155__WBSAnalyticsLogger_didSubmitFormOfType_withFieldType_elementType_isAutoFilled_isManuallyFilledByUser_modificationType_autoFillOfferedType_webpageLocale___block_invoke;
  v19[3] = &unk_1E649ABB8;
  v22 = a4;
  v23 = a5;
  v26 = a6;
  v27 = a7;
  v24 = a8;
  v25 = a9;
  v20 = v17;
  v21 = a3;
  v18 = v17;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidSubmitFieldInForm"), v19);

}

id __155__WBSAnalyticsLogger_didSubmitFormOfType_withFieldType_elementType_isAutoFilled_isManuallyFilledByUser_modificationType_autoFillOfferedType_webpageLocale___block_invoke(uint64_t a1)
{
  unint64_t v2;
  const __CFString *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[10];
  _QWORD v21[11];

  v21[10] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("formType");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 > 5)
    v3 = CFSTR("Invalid Form Type");
  else
    v3 = off_1E649B228[v2];
  v21[0] = v3;
  v20[1] = CFSTR("fieldType");
  stringForFieldType(*(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = CFSTR("elementType");
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 > 4)
    v6 = CFSTR("Invalid Element Type");
  else
    v6 = off_1E649B0E0[v5];
  v21[2] = v6;
  v20[3] = CFSTR("isAutoFilled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v7;
  v20[4] = CFSTR("isManuallyFilledByUser");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v8;
  v20[5] = CFSTR("modificationType");
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 > 5)
    v10 = CFSTR("Invalid Modification Type");
  else
    v10 = off_1E649B108[v9];
  v21[5] = v10;
  v20[6] = CFSTR("autoFillOfferedType");
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 > 4)
    v12 = CFSTR("Invalid AutoFill Offered Type");
  else
    v12 = off_1E649B138[v11];
  v13 = *(const __CFString **)(a1 + 32);
  if (!v13)
    v13 = CFSTR("unknown");
  v21[6] = v12;
  v21[7] = v13;
  v20[7] = CFSTR("webpageLocale");
  v20[8] = CFSTR("userRegion");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "countryCode");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("unknown");
  v20[9] = CFSTR("autoFillTelemetryVersion");
  v21[8] = v17;
  v21[9] = &unk_1E64CE280;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormModificationsDictionary:(id)a4 webpageLocale:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormModificationsDictionary_webpageLocale___block_invoke;
  v12[3] = &unk_1E649A340;
  v14 = v9;
  v15 = a3;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidSubmitForm"), v12);

}

id __91__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormModificationsDictionary_webpageLocale___block_invoke(_QWORD *a1)
{
  void *v1;
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v12[0] = CFSTR("formType");
  v2 = a1[6];
  if (v2 > 5)
    v3 = CFSTR("Invalid Form Type");
  else
    v3 = off_1E649B228[v2];
  v4 = (const __CFString *)a1[5];
  if (!v4)
    v4 = CFSTR("unknown");
  v13[0] = v3;
  v13[1] = v4;
  v12[1] = CFSTR("webpageLocale");
  v12[2] = CFSTR("userRegion");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("unknown");
  v12[3] = CFSTR("autoFillTelemetryVersion");
  v13[2] = v8;
  v13[3] = &unk_1E64CE280;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_dictionaryByMergingWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormUsageDictionary:(id)a4 webpageLocale:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormUsageDictionary_webpageLocale___block_invoke;
  v12[3] = &unk_1E649A340;
  v14 = v9;
  v15 = a3;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidSubmitFormAutoFillUsage"), v12);

}

id __83__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormUsageDictionary_webpageLocale___block_invoke(_QWORD *a1)
{
  void *v1;
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v12[0] = CFSTR("formType");
  v2 = a1[6];
  if (v2 > 5)
    v3 = CFSTR("Invalid Form Type");
  else
    v3 = off_1E649B228[v2];
  v4 = (const __CFString *)a1[5];
  if (!v4)
    v4 = CFSTR("unknown");
  v13[0] = v3;
  v13[1] = v4;
  v12[1] = CFSTR("webpageLocale");
  v12[2] = CFSTR("userRegion");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("unknown");
  v12[3] = CFSTR("autoFillTelemetryVersion");
  v13[2] = v8;
  v13[3] = &unk_1E64CE280;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_dictionaryByMergingWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didUseCreditCardAutoFillEscapeHatchFillingNewType:(id)a3 forPreviousType:(id)a4 fieldType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__WBSAnalyticsLogger_didUseCreditCardAutoFillEscapeHatchFillingNewType_forPreviousType_fieldType___block_invoke;
  v12[3] = &unk_1E649A340;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.AutoFill.DidUseCreditCardEscapeHatch"), v12);

}

id __98__WBSAnalyticsLogger_didUseCreditCardAutoFillEscapeHatchFillingNewType_forPreviousType_fieldType___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("newType");
  v5[1] = CFSTR("previousType");
  v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = v1;
  v5[2] = CFSTR("fieldType");
  stringForFieldType(a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didSelectFavoriteWithOpenLocation:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didSelectFavoriteWithOpenLocation___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.StartPage.SelectedFavorite"), v3);
}

id __56__WBSAnalyticsLogger_didSelectFavoriteWithOpenLocation___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didSelectFavoritesRow:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__WBSAnalyticsLogger_didSelectFavoritesRow___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Favorites"), v3);
}

id __44__WBSAnalyticsLogger_didSelectFavoritesRow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("favoritesRow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didSelectFrequentlyVisitedSiteWithOpenLocation:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__WBSAnalyticsLogger_didSelectFrequentlyVisitedSiteWithOpenLocation___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.StartPage.SelectedFrequentlyVisitedSite"), v3);
}

id __69__WBSAnalyticsLogger_didSelectFrequentlyVisitedSiteWithOpenLocation___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("openLocation");
  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 3)
    v2 = &stru_1E64A2498;
  else
    v2 = off_1E649B258[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didRemoveFrequentlyVisitedSite
{
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.StartPage.RemovedFrequentlyVisitedSite"), &__block_literal_global_824);
}

uint64_t __52__WBSAnalyticsLogger_didRemoveFrequentlyVisitedSite__block_invoke()
{
  return 0;
}

- (void)reportSafariVersion:(id)a3 safariAndWebKitVersion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__WBSAnalyticsLogger_reportSafariVersion_safariAndWebKitVersion___block_invoke;
  v10[3] = &unk_1E649A618;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Version"), v10);

}

id __65__WBSAnalyticsLogger_reportSafariVersion_safariAndWebKitVersion___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v1 = &stru_1E64A2498;
  v4[0] = CFSTR("safariVariant");
  v4[1] = CFSTR("safariWebkitVersion");
  v2 = *(const __CFString **)(a1 + 32);
  if (!v2)
    v2 = &stru_1E64A2498;
  if (*(_QWORD *)(a1 + 40))
    v1 = *(const __CFString **)(a1 + 40);
  v5[0] = v2;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportApplicationCacheSize:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v4[5];

  v3 = a3 >> 10;
  if (a3 >> 10 >= 0xC8)
    v3 = 200;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__WBSAnalyticsLogger_reportApplicationCacheSize___block_invoke;
  v4[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v4[4] = v3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ApplicationCache.Size"), v4);
}

id __49__WBSAnalyticsLogger_reportApplicationCacheSize___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage___block_invoke;
  v9[3] = &unk_1E649A438;
  v8 = v6;
  v10 = v8;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", v7, v9);

}

id __68__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = &stru_1E64A2498;
  if (*(_QWORD *)(a1 + 32))
    v1 = *(const __CFString **)(a1 + 32);
  v3 = CFSTR("diagnosticMessage");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 result:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage_result___block_invoke;
  v11[3] = &unk_1E649A4C8;
  v10 = v8;
  v12 = v10;
  v13 = a5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", v9, v11);

}

id __75__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  else
    v2 = &stru_1E64A2498;
  v7[0] = CFSTR("diagnosticMessage");
  v7[1] = CFSTR("result");
  v8[0] = v2;
  v3 = CFSTR("noop");
  if (v1 == 1)
    v3 = CFSTR("fail");
  if (!v1)
    v3 = CFSTR("pass");
  v4 = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (!objc_msgSend(v11, "scanInteger:", &v12) || !objc_msgSend(v11, "isAtEnd"))
  {

LABEL_6:
    -[WBSAnalyticsLogger _logDiagnosticMessageWithKey:diagnosticMessage:stringValue:](self, "_logDiagnosticMessageWithKey:diagnosticMessage:stringValue:", v8, v9, v10);
    goto LABEL_7;
  }
  -[WBSAnalyticsLogger _logDiagnosticMessageWithKey:diagnosticMessage:integerValue:](self, "_logDiagnosticMessageWithKey:diagnosticMessage:integerValue:", v8, v9, v12);

LABEL_7:
}

- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 stringValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_stringValue___block_invoke;
  v13[3] = &unk_1E649A618;
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", v10, v13);

}

id __81__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_stringValue___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v1 = &stru_1E64A2498;
  v4[0] = CFSTR("diagnosticMessage");
  v4[1] = CFSTR("stringValue");
  v2 = *(const __CFString **)(a1 + 32);
  if (!v2)
    v2 = &stru_1E64A2498;
  if (*(_QWORD *)(a1 + 40))
    v1 = *(const __CFString **)(a1 + 40);
  v5[0] = v2;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 integerValue:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_integerValue___block_invoke;
  v11[3] = &unk_1E649A4C8;
  v10 = v8;
  v12 = v10;
  v13 = a5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", v9, v11);

}

id __82__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_integerValue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  else
    v2 = &stru_1E64A2498;
  v6[0] = CFSTR("diagnosticMessage");
  v6[1] = CFSTR("integerValue");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didCreateNewTabGroup
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.TabGroupCreated"), &__block_literal_global_838);
}

uint64_t __42__WBSAnalyticsLogger_didCreateNewTabGroup__block_invoke()
{
  return 0;
}

- (void)didOpenTabGroupDropDownMenu
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.DropDownMenu.Opened"), &__block_literal_global_839);
}

uint64_t __49__WBSAnalyticsLogger_didOpenTabGroupDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSelectTabGroupInDropDownMenu
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.DropDownMenu.ChangedTabGroup"), &__block_literal_global_840);
}

uint64_t __53__WBSAnalyticsLogger_didSelectTabGroupInDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSelectStartPrivateWindowInDropDownMenu
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.DropDownMenu.StartAPrivateWindow"), &__block_literal_global_841);
}

uint64_t __63__WBSAnalyticsLogger_didSelectStartPrivateWindowInDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didCreateNewTabGroupFromTheDropDownMenu
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.DropDownMenu.NewTabGroup"), &__block_literal_global_842);
}

uint64_t __61__WBSAnalyticsLogger_didCreateNewTabGroupFromTheDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSendTabGroup
{
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.SentTabGroup"), &__block_literal_global_843);
}

uint64_t __37__WBSAnalyticsLogger_didSendTabGroup__block_invoke()
{
  return 0;
}

- (void)reportAverageNumberOfTabsPerTabGroup:(int64_t)a3 andMaximum:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__WBSAnalyticsLogger_reportAverageNumberOfTabsPerTabGroup_andMaximum___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.AverageNumberOfTabsPerTabGroup"), v4);
}

id __70__WBSAnalyticsLogger_reportAverageNumberOfTabsPerTabGroup_andMaximum___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("avgNumberOfTabs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("maximumNumberOfTabs");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportTabsForNonTabGroupUser:(int64_t)a3 andAverageNumber:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__WBSAnalyticsLogger_reportTabsForNonTabGroupUser_andAverageNumber___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.NonTabGroupUsersTabs"), v4);
}

id __68__WBSAnalyticsLogger_reportTabsForNonTabGroupUser_andAverageNumber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("avgAgeOfOpenTabs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("numOfOpenTabs");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportNumberOfTabGroups:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__WBSAnalyticsLogger_reportNumberOfTabGroups___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.SafariShared.TabGroups.NumberOfTabGroups"), v3);
}

id __46__WBSAnalyticsLogger_reportNumberOfTabGroups___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("totalNumberOfTabGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didCreateTabGroupFromLocation:(int64_t)a3 prepopulatedWithTabs:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__WBSAnalyticsLogger_didCreateTabGroupFromLocation_prepopulatedWithTabs___block_invoke;
  v4[3] = &__block_descriptor_41_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v5 = a4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabGroups.CreatedTabGroup"), v4);
}

id __73__WBSAnalyticsLogger_didCreateTabGroupFromLocation_prepopulatedWithTabs___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("source");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 0xA)
    v2 = CFSTR("sidebar");
  else
    v2 = off_1E649B278[v1];
  v7[0] = v2;
  v6[1] = CFSTR("prepopulatedWithTabs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didSwitchToTabGroupFromLocation:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didSwitchToTabGroupFromLocation___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabGroups.SwitchedToTabGroup"), v3);
}

id __54__WBSAnalyticsLogger_didSwitchToTabGroupFromLocation___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("source");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 0xA)
    v2 = CFSTR("sidebar");
  else
    v2 = off_1E649B278[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportMacOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__WBSAnalyticsLogger_reportMacOSToolbarButtonUsage_withLayout___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.ToolbarButtonUsage"), v4);
}

id __63__WBSAnalyticsLogger_reportMacOSToolbarButtonUsage_withLayout___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("buttonName");
  stringForToolbarButtonType(*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("provenance");
  v8[0] = v2;
  v3 = *(_QWORD *)(a1 + 40) - 1;
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E649B3F8[v3];
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportIOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__WBSAnalyticsLogger_reportIOSToolbarButtonUsage_withLayout___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.ToolbarButtonUsage"), v4);
}

id __61__WBSAnalyticsLogger_reportIOSToolbarButtonUsage_withLayout___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("buttonName");
  stringForToolbarButtonType(*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("provenance");
  v8[0] = v2;
  v3 = *(_QWORD *)(a1 + 40) - 1;
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E649B3F8[v3];
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportSVCToolbarButtonUsage:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportSVCToolbarButtonUsage___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariViewController.ToolbarButtonUsage"), v3);
}

id __50__WBSAnalyticsLogger_reportSVCToolbarButtonUsage___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("buttonName");
  stringForToolbarButtonType(*(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didPerformMoreMenuAction:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_didPerformMoreMenuAction___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.PerformedMoreMenuAction"), v3);
}

id __47__WBSAnalyticsLogger_didPerformMoreMenuAction___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("actionType");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 0xA)
    v2 = CFSTR("stop");
  else
    v2 = off_1E649B420[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didUseSidebarAction:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__WBSAnalyticsLogger_didUseSidebarAction___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.SidebarAction"), v3);
}

id __42__WBSAnalyticsLogger_didUseSidebarAction___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("action");
  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 0x13)
    v2 = CFSTR("local tab group selected");
  else
    v2 = off_1E649B478[v1];
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didToggleMagicMenuSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didToggleMagicMenu"));
}

- (void)didClickFindInPageSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickFindInPageSBA"));
}

- (void)didClickZoomOutSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickZoomOutSBA"));
}

- (void)didClickZoomInSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickZoomInSBA"));
}

- (void)didClickZoomSelectorSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickZoomSelectorSBA"));
}

- (void)didClickWebsiteSettingsSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickWebsiteSettingsSBA"));
}

- (void)didToggleReaderSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didToggleReader"));
}

- (void)didToggleScribbleSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.Scribble.didToggleScribble"));
}

- (void)didFinishScribbleSBA:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__WBSAnalyticsLogger_didFinishScribbleSBA___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Scribble.didFinishScribble"), v3);
}

id __43__WBSAnalyticsLogger_didFinishScribbleSBA___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("chagesMade");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didClearScribbleSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.Scribble.didClearScribble"));
}

- (void)didCancelScribbleSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.Scribble.didCancelScribble"));
}

- (void)didHideMoreItemsSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.Scribble.didHideMoreItems"));
}

- (void)reportNumberOfWebsitesWithScribbleActiveSBA:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__WBSAnalyticsLogger_reportNumberOfWebsitesWithScribbleActiveSBA___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Scribble.reportNumberOfWebsitesWithScribbleActive"), v3);
}

id __66__WBSAnalyticsLogger_reportNumberOfWebsitesWithScribbleActiveSBA___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("websites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportUserConsentStateSBA:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__WBSAnalyticsLogger_reportUserConsentStateSBA___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.userConsentState"), v6);

}

id __48__WBSAnalyticsLogger_reportUserConsentStateSBA___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("consentState");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didVisitWebpageSBAWithUserOptedIn:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didVisitWebpageSBAWithUserOptedIn___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v4 = a3;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didVisitWebpage"), v3);
}

id __56__WBSAnalyticsLogger_didVisitWebpageSBAWithUserOptedIn___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("optedIn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didShowSparkleSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didShowSparkle"));
}

- (void)didClickSparkleSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickOnSparkle"));
}

- (void)didShowEntityCardSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didShowEntityCard"));
}

- (void)didClickEntityCardSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickEntityCard"));
}

- (void)didShowSummaryCardSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didShowSummaryCard"));
}

- (void)didClickSummaryCardSBA
{
  -[WBSAnalyticsLogger _sendEvent:](self, "_sendEvent:", CFSTR("com.apple.Safari.SmartBrowsingAssistant.didClickSummaryCard"));
}

- (void)reportTabGroupSyncFinishedWithInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__WBSAnalyticsLogger_reportTabGroupSyncFinishedWithInfo___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabGroups.Sync.SyncFinished"), v6);

}

id __57__WBSAnalyticsLogger_reportTabGroupSyncFinishedWithInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportTabGroupSyncSuccessesWithCount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__WBSAnalyticsLogger_reportTabGroupSyncSuccessesWithCount___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.TabGroups.Sync.SyncFinished"), v6);

}

id __59__WBSAnalyticsLogger_reportTabGroupSyncSuccessesWithCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("syncResult");
  v3[1] = CFSTR("periodicCount");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = &unk_1E64CE298;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reportAdvancedPrivacyProtectionPreference
{
  void *v3;
  int v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableEnhancedPrivacyInPrivateBrowsing")) & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableEnhancedPrivacyInRegularBrowsing"));
    v5 = 1;
    if (v4)
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__WBSAnalyticsLogger_reportAdvancedPrivacyProtectionPreference__block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = v5;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.Preferences.ReportAdvancedPrivacyProtectionStatus"), v6);

}

id __63__WBSAnalyticsLogger_reportAdvancedPrivacyProtectionPreference__block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("preference");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = CFSTR("disabled");
  if (v1 == 1)
    v2 = CFSTR("private browsing only");
  if (v1 == 2)
    v3 = CFSTR("all browsing");
  else
    v3 = (__CFString *)v2;
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportNumberOfWebApps:(int64_t)a3 andBookmarks:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__WBSAnalyticsLogger_reportNumberOfWebApps_andBookmarks___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v4[4] = a3;
  v4[5] = a4;
  -[WBSAnalyticsLogger _sendEvent:usingBlock:](self, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.WebClipCount"), v4);
}

id __57__WBSAnalyticsLogger_reportNumberOfWebApps_andBookmarks___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("webAppCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("bookmarkCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reportWebContentProcessInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WBSAnalyticsLogger_reportWebContentProcessInfo___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.WebContentProcessInfo"), v6);

}

id __50__WBSAnalyticsLogger_reportWebContentProcessInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportAllProcessInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__WBSAnalyticsLogger_reportAllProcessInfo___block_invoke;
  v6[3] = &unk_1E649A438;
  v7 = v4;
  v5 = v4;
  -[WBSAnalyticsLogger _sendEventAddingVersionInfo:usingBlock:](self, "_sendEventAddingVersionInfo:usingBlock:", CFSTR("com.apple.Safari.AllProcessInfo"), v6);

}

id __43__WBSAnalyticsLogger_reportAllProcessInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perSitePreferencesPopoverLocation, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_analyticsSynchronizationQueue, 0);
}

@end
