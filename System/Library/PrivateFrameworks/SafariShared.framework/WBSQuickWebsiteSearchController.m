@implementation WBSQuickWebsiteSearchController

+ (id)sharedController
{
  if (+[WBSQuickWebsiteSearchController sharedController]::onceToken != -1)
    dispatch_once(&+[WBSQuickWebsiteSearchController sharedController]::onceToken, &__block_literal_global_85);
  return (id)+[WBSQuickWebsiteSearchController sharedController]::controller;
}

void __51__WBSQuickWebsiteSearchController_sharedController__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safari_settingsDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("SearchDescriptions.plist"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[WBSQuickWebsiteSearchController _initWithSearchDescriptionsURL:]([WBSQuickWebsiteSearchController alloc], "_initWithSearchDescriptionsURL:", v4);
  v3 = (void *)+[WBSQuickWebsiteSearchController sharedController]::controller;
  +[WBSQuickWebsiteSearchController sharedController]::controller = (uint64_t)v2;

  objc_msgSend((id)+[WBSQuickWebsiteSearchController sharedController]::controller, "beginLoadingFromDiskIfNeeded");
}

- (id)_initWithSearchDescriptionsURL:(id)a3
{
  id v5;
  WBSQuickWebsiteSearchController *v6;
  WBSQuickWebsiteSearchController *v7;
  NSURL **p_searchDescriptionsURL;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  uint64_t v14;
  NSMutableDictionary *quickWebsiteSearchProvidersByHost;
  uint64_t v16;
  NSMutableDictionary *openSearchDescriptionsByDescriptionDocumentURLString;
  uint64_t v18;
  NSMutableDictionary *hostSetsByOpenSearchDescriptionDocumentURLString;
  void *v20;
  WBSQuickWebsiteSearchController *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSQuickWebsiteSearchController;
  v6 = -[WBSQuickWebsiteSearchController init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    p_searchDescriptionsURL = &v6->_searchDescriptionsURL;
    objc_storeStrong((id *)&v6->_searchDescriptionsURL, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.QuickWebsiteSearchProvidersAccess.%@.%p.accessQueue"), objc_opt_class(), v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = v7->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    v7->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    quickWebsiteSearchProvidersByHost = v7->_quickWebsiteSearchProvidersByHost;
    v7->_quickWebsiteSearchProvidersByHost = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    openSearchDescriptionsByDescriptionDocumentURLString = v7->_openSearchDescriptionsByDescriptionDocumentURLString;
    v7->_openSearchDescriptionsByDescriptionDocumentURLString = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    hostSetsByOpenSearchDescriptionDocumentURLString = v7->_hostSetsByOpenSearchDescriptionDocumentURLString;
    v7->_hostSetsByOpenSearchDescriptionDocumentURLString = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel__didCollectOpenSearchDescription_, CFSTR("WBSOpenSearchSchemaFetcherDidCollectDescriptionNotification"), 0);
    if (!*p_searchDescriptionsURL)
      -[WBSQuickWebsiteSearchController _didFinishLoadingFromDisk](v7, "_didFinishLoadingFromDisk");
    v21 = v7;

  }
  return v7;
}

- (void)beginLoadingFromDiskIfNeeded
{
  if (!self->_hasBegunLoadingFromDisk)
  {
    self->_hasBegunLoadingFromDisk = 1;
    -[WBSQuickWebsiteSearchController _loadFromDisk](self, "_loadFromDisk");
  }
}

- (void)noteProvidersAreStale
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__WBSQuickWebsiteSearchController_noteProvidersAreStale__block_invoke;
  v2[3] = &unk_1E4B2A2C8;
  v2[4] = self;
  -[WBSQuickWebsiteSearchController _resetCachedDataWithCompletionHandler:](self, "_resetCachedDataWithCompletionHandler:", v2);
}

uint64_t __56__WBSQuickWebsiteSearchController_noteProvidersAreStale__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadFromDisk");
}

- (void)savePendingChangesBeforeTermination
{
  -[WBSCoalescedAsynchronousWriter completePendingWriteSynchronously](self->_writer, "completePendingWriteSynchronously");
}

- (void)savePendingChangesNowWithCompletionHandler:(id)a3
{
  -[WBSCoalescedAsynchronousWriter startScheduledWriteNowWithCompletionHandler:](self->_writer, "startScheduledWriteNowWithCompletionHandler:", a3);
}

- (void)clearWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__WBSQuickWebsiteSearchController_clearWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4B2A250;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSQuickWebsiteSearchController _resetCachedDataWithCompletionHandler:](self, "_resetCachedDataWithCompletionHandler:", v6);

}

uint64_t __62__WBSQuickWebsiteSearchController_clearWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeProvidersAddedAfterDate:(id)a3 beforeDate:(id)a4
{
  id v6;
  id v7;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);

}

void __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD block[5];
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_2;
  v10[3] = &unk_1E4B3E590;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  v7 = v2;
  v13 = v7;
  v8 = v3;
  v14 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsForKeys:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsForKeys:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsForKeys:", v8);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_3;
  block[3] = &unk_1E4B2A2C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "dateAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safari_isInclusivelyBetweenDate:andDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    objc_msgSend(v5, "openSearchDescriptionURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

  }
}

uint64_t __76__WBSQuickWebsiteSearchController_removeProvidersAddedAfterDate_beforeDate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
}

- (void)_sendNotification:(id)a3 forQuickWebsiteSearchProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = CFSTR("QuickWebsiteSearchProvider");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v6, self, v8);

}

- (NSArray)quickWebsiteSearchHosts
{
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[WBSQuickWebsiteSearchController quickWebsiteSearchProvidersLoadedFromDisk](self, "quickWebsiteSearchProvidersLoadedFromDisk"))return (NSArray *)0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__31;
  v11 = __Block_byref_object_dispose__31;
  v12 = 0;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke;
  v6[3] = &unk_1E4B2BDF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke_2;
  v8[3] = &unk_1E4B3E5B8;
  v8[4] = v2;
  objc_msgSend(v3, "keysOfEntriesPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __58__WBSQuickWebsiteSearchController_quickWebsiteSearchHosts__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:");
}

- (id)providersMatchingString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  WBSQuickWebsiteSearchController *v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke;
  v19 = &unk_1E4B399F0;
  v20 = self;
  v10 = v6;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  v12 = v8;
  v23 = v12;
  dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, &v16);
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_27_0, v16, v17, v18, v19, v20);
  v13 = v23;
  v14 = v12;

  return v14;
}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_2;
  v5[3] = &unk_1E4B3E608;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(a1[4], "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:", v5) & 1) != 0)
  {
    v6 = objc_msgSend(v7, "length");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_3;
    v8[3] = &unk_1E4B3E5E0;
    v9 = v7;
    v10 = a1[5];
    v14 = v6;
    v11 = a1[6];
    v12 = v5;
    v13 = a1[7];
    objc_msgSend(v9, "safari_enumerateSubdomainRangesInHostUsingBlock:", v8);

  }
}

void __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(_QWORD *)(a1 + 40), 393, a2, *(_QWORD *)(a1 + 72) - a2);
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "safari_domainFromHost", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "hostname");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_domainFromHost");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {

            return;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
    *a4 = 1;
  }
}

uint64_t __93__WBSQuickWebsiteSearchController_providersMatchingString_excludingSearchEngineHostSuffixes___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "dateOfLastSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateOfLastSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 || !v7)
  {
    if (!v6 || v7)
    {
      if (!v6 || !v7 || (v9 = objc_msgSend(v7, "compare:", v6)) == 0)
      {
        objc_msgSend(v5, "dateAdded");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateAdded");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "compare:", v11);

      }
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)providersMatchingQueryString:(id)a3 excludingSearchEngineHostSuffixes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 8206, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10);

  if (v11 >= 3 && v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "substringToIndex:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = v14;
    -[WBSQuickWebsiteSearchController providersMatchingString:excludingSearchEngineHostSuffixes:](self, "providersMatchingString:excludingSearchEngineHostSuffixes:", v14, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v9, "length") >= 3)
  {
    v14 = v9;
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:

  return v13;
}

- (void)didPerformSearchWithProvider:(id)a3
{
  id v4;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSQuickWebsiteSearchController *v9;

  v4 = a3;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v7);

}

void __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDateOfLastSearch:", v2);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke_2;
  block[3] = &unk_1E4B2A2C8;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__WBSQuickWebsiteSearchController_didPerformSearchWithProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
}

- (void)setSearchURLTemplateFromForm:(id)a3 forSourcePageURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke;
    block[3] = &unk_1E4B3AEE8;
    block[4] = self;
    v16 = v13;
    v17 = v8;
    v19 = v10;
    v18 = v9;
    dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

void __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke(uint64_t a1)
{
  WBSQuickWebsiteSearchProvider *v2;
  WBSQuickWebsiteSearchProvider *v3;
  void *v4;
  char v5;
  id *v6;
  WBSQuickWebsiteSearchProvider *v7;
  _QWORD v8[5];
  WBSQuickWebsiteSearchProvider *v9;
  id v10;
  _QWORD block[5];
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (WBSQuickWebsiteSearchProvider *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7 = -[WBSQuickWebsiteSearchProvider initWithSourcePageURLString:searchURLTemplateFromForm:delegate:]([WBSQuickWebsiteSearchProvider alloc], "initWithSourcePageURLString:searchURLTemplateFromForm:delegate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4B2B178;
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = (id *)&v9;
    v3 = v7;
    v9 = v3;
    v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    goto LABEL_5;
  }
  -[WBSQuickWebsiteSearchProvider searchURLTemplateFromForm](v2, "searchURLTemplateFromForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 48));

  if ((v5 & 1) == 0)
  {
    -[WBSQuickWebsiteSearchProvider setSearchURLTemplateFromForm:](v3, "setSearchURLTemplateFromForm:", *(_QWORD *)(a1 + 48));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B2A250;
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = &v12;
    v12 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_5:

  }
}

uint64_t __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __105__WBSQuickWebsiteSearchController_setSearchURLTemplateFromForm_forSourcePageURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_sendNotification:forQuickWebsiteSearchProvider:", CFSTR("WBSQuickWebsiteSearchControllerDidUpdateProviderNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setOpenSearchDescriptionURLString:(id)a3 forSourcePageURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_stringByRemovingWwwDotPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke;
    v12[3] = &unk_1E4B399F0;
    v12[4] = self;
    v13 = v10;
    v14 = v6;
    v15 = v7;
    dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v12);

  }
}

void __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke(uint64_t a1)
{
  WBSQuickWebsiteSearchProvider *v2;
  WBSQuickWebsiteSearchProvider *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (WBSQuickWebsiteSearchProvider *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    -[WBSQuickWebsiteSearchProvider openSearchDescriptionURLString](v2, "openSearchDescriptionURLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      -[WBSQuickWebsiteSearchProvider setOpenSearchDescriptionURLString:](v3, "setOpenSearchDescriptionURLString:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_addHost:toOpenSearchDescriptionWithDocumentURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      if (v4)
        objc_msgSend(*(id *)(a1 + 32), "_removeHost:fromOpenSearchDescriptionWithDocumentURL:", *(_QWORD *)(a1 + 40), v4);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_2;
      block[3] = &unk_1E4B2A2C8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
  else
  {
    v3 = -[WBSQuickWebsiteSearchProvider initWithSourcePageURLString:openSearchDescriptionURLString:delegate:]([WBSQuickWebsiteSearchProvider alloc], "initWithSourcePageURLString:openSearchDescriptionURLString:delegate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_addHost:toOpenSearchDescriptionWithDocumentURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_3;
    v5[3] = &unk_1E4B2A2C8;
    v5[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }

}

uint64_t __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
}

uint64_t __92__WBSQuickWebsiteSearchController_setOpenSearchDescriptionURLString_forSourcePageURLString___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
}

- (id)providerForSourcePageURLString:(id)a3
{
  id v4;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[WBSQuickWebsiteSearchController quickWebsiteSearchProvidersLoadedFromDisk](self, "quickWebsiteSearchProvidersLoadedFromDisk"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__31;
    v15 = __Block_byref_object_dispose__31;
    v16 = 0;
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__WBSQuickWebsiteSearchController_providerForSourcePageURLString___block_invoke;
    block[3] = &unk_1E4B384C0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __66__WBSQuickWebsiteSearchController_providerForSourcePageURLString___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)openSearchDescriptionForOpenSearchDescriptionURLString:(id)a3
{
  id v4;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[WBSQuickWebsiteSearchController quickWebsiteSearchProvidersLoadedFromDisk](self, "quickWebsiteSearchProvidersLoadedFromDisk"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__31;
    v15 = __Block_byref_object_dispose__31;
    v16 = 0;
    quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__WBSQuickWebsiteSearchController_openSearchDescriptionForOpenSearchDescriptionURLString___block_invoke;
    block[3] = &unk_1E4B384C0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __90__WBSQuickWebsiteSearchController_openSearchDescriptionForOpenSearchDescriptionURLString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeProvidersWithHosts:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSQuickWebsiteSearchController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);

}

void __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "openSearchDescriptionURLString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(a1 + 40), "_removeHost:fromOpenSearchDescriptionWithDocumentURL:", v7, v10);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", v7);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_2;
          block[3] = &unk_1E4B2B448;
          block[4] = *(_QWORD *)(a1 + 40);
          v15 = v9;
          dispatch_async(v5, block);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_3;
  v12[3] = &unk_1E4B2A250;
  v11 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendNotification:forQuickWebsiteSearchProvider:", CFSTR("WBSQuickWebsiteSearchControllerDidUpdateProviderNotification"), *(_QWORD *)(a1 + 40));
}

uint64_t __78__WBSQuickWebsiteSearchController_removeProvidersWithHosts_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_saveToDiskSoon");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeProviderWithHost:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSQuickWebsiteSearchController removeProvidersWithHosts:completionHandler:](self, "removeProvidersWithHosts:completionHandler:", v5, 0);

}

- (id)quickWebsiteSearchProvider:(id)a3 openSearchDescriptionForOpenSearchDescriptionURLString:(id)a4
{
  -[WBSQuickWebsiteSearchController openSearchDescriptionForOpenSearchDescriptionURLString:](self, "openSearchDescriptionForOpenSearchDescriptionURLString:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "searchURLTemplateFromForm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "openSearchDescriptionURLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_openSearchDescriptionsByDescriptionDocumentURLString, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchURLTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)_addHost:(id)a3 toOpenSearchDescriptionWithDocumentURL:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostSetsByOpenSearchDescriptionDocumentURLString, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostSetsByOpenSearchDescriptionDocumentURLString, "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)_removeHost:(id)a3 fromOpenSearchDescriptionWithDocumentURL:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostSetsByOpenSearchDescriptionDocumentURLString, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);
  if (!objc_msgSend(v7, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_hostSetsByOpenSearchDescriptionDocumentURLString, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_openSearchDescriptionsByDescriptionDocumentURLString, "removeObjectForKey:", v6);
  }

}

- (BOOL)_shouldRemoveQuickWebsiteSearchProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "dateAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "dateOfLastSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      v6 = v7 < -604800.0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_pruneUnusedQuickWebsiteSearchProviders
{
  NSMutableDictionary *quickWebsiteSearchProvidersByHost;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  _QWORD v7[5];

  quickWebsiteSearchProvidersByHost = self->_quickWebsiteSearchProvidersByHost;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__WBSQuickWebsiteSearchController__pruneUnusedQuickWebsiteSearchProviders__block_invoke;
  v7[3] = &unk_1E4B3E5B8;
  v7[4] = self;
  -[NSMutableDictionary keysOfEntriesPassingTest:](quickWebsiteSearchProvidersByHost, "keysOfEntriesPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_quickWebsiteSearchProvidersByHost;
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v5, "removeObjectsForKeys:", v6);

}

uint64_t __74__WBSQuickWebsiteSearchController__pruneUnusedQuickWebsiteSearchProviders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_shouldRemoveQuickWebsiteSearchProvider:", v6);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "openSearchDescriptionURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "_removeHost:fromOpenSearchDescriptionWithDocumentURL:", v5, v8);

  }
  return v7;
}

- (void)_saveToDiskSoon
{
  WBSCoalescedAsynchronousWriter *writer;
  id v4;
  NSURL *searchDescriptionsURL;
  WBSCoalescedAsynchronousWriter *v6;
  WBSCoalescedAsynchronousWriter *v7;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_searchDescriptionsURL)
  {
    writer = self->_writer;
    if (!writer)
    {
      objc_initWeak(&location, self);
      v4 = objc_alloc(MEMORY[0x1E0D89BC0]);
      searchDescriptionsURL = self->_searchDescriptionsURL;
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke;
      v11 = &unk_1E4B3E670;
      objc_copyWeak(&v12, &location);
      v6 = (WBSCoalescedAsynchronousWriter *)objc_msgSend(v4, "initWithName:fileURL:dataSourceBlock:", CFSTR("SearchDescriptions"), searchDescriptionsURL, &v8);
      v7 = self->_writer;
      self->_writer = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      writer = self->_writer;
    }
    -[WBSCoalescedAsynchronousWriter scheduleWrite](writer, "scheduleWrite", v8, v9, v10, v11);
  }
}

id __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(WeakRetained, "_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (!v4)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke_cold_1(v7, buf, v6);
    }

  }
  return v4;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  WBSQuickWebsiteSearchController *v14;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke;
  v13 = &unk_1E4B2B2A8;
  v14 = self;
  v6 = v3;
  v15 = v6;
  v7 = v4;
  v16 = v7;
  dispatch_sync(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, &v10);
  v17[0] = CFSTR("WebsiteSpecificSearchDescriptions");
  v17[1] = CFSTR("OpenSearchDescriptions");
  v18[0] = v6;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_pruneUnusedQuickWebsiteSearchProviders");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_2;
  v10[3] = &unk_1E4B3E698;
  v10[4] = v3;
  v11 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_3;
  v8[3] = &unk_1E4B3E6C0;
  v8[4] = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:"))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v6, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __60__WBSQuickWebsiteSearchController__dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)_loadFromDisk
{
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  _QWORD block[5];

  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSQuickWebsiteSearchController__loadFromDisk__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, block);
}

void __48__WBSQuickWebsiteSearchController__loadFromDisk__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WBSQuickWebsiteSearchProvider *v7;
  WBSQuickWebsiteSearchProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  WBSOpenSearchDescription *v20;
  WBSOpenSearchDescription *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safari_arrayForKey:", CFSTR("WebsiteSpecificSearchDescriptions"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v24;
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v3)
      {
        v4 = *(_QWORD *)v32;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v32 != v4)
              objc_enumerationMutation(obj);
            v6 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v5);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v7 = -[WBSQuickWebsiteSearchProvider initWithDictionaryRepresentation:delegate:]([WBSQuickWebsiteSearchProvider alloc], "initWithDictionaryRepresentation:delegate:", v6, *(_QWORD *)(a1 + 32));
              v8 = v7;
              if (v7)
              {
                v9 = (void *)MEMORY[0x1E0C99E98];
                -[WBSQuickWebsiteSearchProvider sourcePageURLString](v7, "sourcePageURLString");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "URLWithString:", v10);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "host");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v8, v13);
                -[WBSQuickWebsiteSearchProvider openSearchDescriptionURLString](v8, "openSearchDescriptionURLString");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14)
                  objc_msgSend(*(id *)(a1 + 32), "_addHost:toOpenSearchDescriptionWithDocumentURL:", v13, v14);

              }
            }
            ++v5;
          }
          while (v3 != v5);
          v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v3);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v25, "safari_arrayForKey:", CFSTR("OpenSearchDescriptions"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v28;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[WBSOpenSearchDescription initWithDictionaryRepresentation:]([WBSOpenSearchDescription alloc], "initWithDictionaryRepresentation:", v19);
              v21 = v20;
              if (v20)
              {
                v22 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
                -[WBSOpenSearchDescription descriptionDocumentURLString](v20, "descriptionDocumentURLString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

              }
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v16);
      }

      objc_msgSend(*(id *)(a1 + 32), "_pruneUnusedQuickWebsiteSearchProviders");
    }
    objc_msgSend(*(id *)(a1 + 32), "_didFinishLoadingFromDisk");

  }
  else
  {
    objc_msgSend(v2, "_didFinishLoadingFromDisk");
  }
}

- (void)_didFinishLoadingFromDisk
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSQuickWebsiteSearchController__didFinishLoadingFromDisk__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__WBSQuickWebsiteSearchController__didFinishLoadingFromDisk__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setQuickWebsiteSearchProvidersLoadedFromDisk:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBSQuickWebsiteSearchControllerDidFinishLoadingNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_didCollectOpenSearchDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  WBSQuickWebsiteSearchController *v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WBSOpenSearchDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke;
  v9[3] = &unk_1E4B2B448;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v9);

}

void __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "descriptionDocumentURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 40), "_quickWebsiteSearchProviderHasSearchURLTemplateStringOnAccessQueue:", v8) & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke_2;
  v11[3] = &unk_1E4B2B448;
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __68__WBSQuickWebsiteSearchController__didCollectOpenSearchDescription___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_sendNotification:forQuickWebsiteSearchProvider:", CFSTR("WBSQuickWebsiteSearchControllerDidUpdateProviderNotification"), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_saveToDiskSoon");
}

- (void)_resetCachedDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue = self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, v7);

}

void __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B2B038;
  v12 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__WBSQuickWebsiteSearchController__resetCachedDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)quickWebsiteSearchProvidersLoadedFromDisk
{
  return self->_quickWebsiteSearchProvidersLoadedFromDisk;
}

- (void)setQuickWebsiteSearchProvidersLoadedFromDisk:(BOOL)a3
{
  self->_quickWebsiteSearchProvidersLoadedFromDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_hostSetsByOpenSearchDescriptionDocumentURLString, 0);
  objc_storeStrong((id *)&self->_openSearchDescriptionsByDescriptionDocumentURLString, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvidersByHost, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvidersBySourcePageURLStringAccessQueue, 0);
  objc_storeStrong((id *)&self->_searchDescriptionsURL, 0);
}

void __50__WBSQuickWebsiteSearchController__saveToDiskSoon__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "error \"%{public}@\" trying to convert search descriptions to NSData", buf, 0xCu);

}

@end
