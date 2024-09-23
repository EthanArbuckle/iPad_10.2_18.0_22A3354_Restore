@implementation WBSHistoryItem

+ (id)synchronizationQueue
{
  return (id)WBSHistoryItemSynchronizationQueue;
}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryItem.Synchronization", 0);
    v3 = (void *)WBSHistoryItemSynchronizationQueue;
    WBSHistoryItemSynchronizationQueue = (uint64_t)v2;

    v4 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryItem.Cache", 0);
    v5 = (void *)WBSHistoryItemCacheQueue;
    WBSHistoryItemCacheQueue = (uint64_t)v4;

  }
}

+ (double)timeIntervalForDailyAndWeeklyVisitCountScores
{
  return 86400.0 * (double)0x31uLL;
}

- (WBSHistoryItem)initWithURLString:(id)a3
{
  id v4;
  WBSHistoryItem *v5;
  uint64_t v6;
  NSMutableArray *visits;
  uint64_t v8;
  NSString *urlString;
  WBSHistoryItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryItem;
  v5 = -[WBSHistoryItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    visits = v5->_visits;
    v5->_visits = (NSMutableArray *)v6;

    v8 = objc_msgSend(v4, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (WBSHistoryItem)initWithSQLiteRow:(id)a3
{
  id v4;
  void *v5;
  WBSHistoryItem *v6;
  void *v7;
  NSObject *v8;
  int64_t databaseID;
  WBSHistoryVisit *v10;
  WBSHistoryVisit *lastVisit;
  WBSHistoryItem *v12;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSHistoryItem initWithURLString:](self, "initWithURLString:", v5);
  if (v6)
  {
    v6->_databaseID = objc_msgSend(v4, "int64AtIndex:", 0);
    objc_msgSend(v5, "safari_userVisibleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        databaseID = v6->_databaseID;
        v14 = 134217984;
        v15 = databaseID;
        _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Nil user-visible URL string found when loading history item with id %ld", (uint8_t *)&v14, 0xCu);
      }
    }
    v6->_statusCode = objc_msgSend(v4, "int64AtIndex:", 9);
    v10 = -[WBSHistoryVisit initWithHistoryItem:sqliteRow:baseColumnIndex:]([WBSHistoryVisit alloc], "initWithHistoryItem:sqliteRow:baseColumnIndex:", v6, v4, 10);
    lastVisit = v6->_lastVisit;
    v6->_lastVisit = v10;

    v12 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WBSHistoryItem_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, block);
  v3.receiver = self;
  v3.super_class = (Class)WBSHistoryItem;
  -[WBSHistoryItem dealloc](&v3, sel_dealloc);
}

uint64_t __25__WBSHistoryItem_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)visitsPendingWriteTable, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSString)title
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__WBSHistoryItem_title__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __23__WBSHistoryItem_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setTitle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__WBSHistoryItem_setTitle___block_invoke;
  block[3] = &unk_1E4B2B448;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __27__WBSHistoryItem_setTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTitle:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_addVisitToPendingWriteSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSURL)url
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__WBSHistoryItem_url__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemCacheQueue, block);
  return self->_url;
}

void __21__WBSHistoryItem_url__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", *(_QWORD *)(v1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
}

- (NSString)userVisibleURLString
{
  void *v2;
  void *v3;

  -[NSString safari_userVisibleURL](self->_urlString, "safari_userVisibleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByFoldingWideCharactersAndNormalizing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userVisibleHostOrFallbackURLString
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[WBSHistoryItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "safari_userVisibleString");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (WBSHistoryVisit)lastVisit
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__WBSHistoryItem_lastVisit__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryVisit *)v2;
}

void __27__WBSHistoryItem_lastVisit__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (WBSHistoryVisit)lastVisitOnSynchronizationQueue
{
  return self->_lastVisit;
}

- (double)lastVisitedTimeInterval
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__WBSHistoryItem_lastVisitedTimeInterval__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__WBSHistoryItem_lastVisitedTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "visitTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)lastVisitedTimeIntervalOnSynchronizationQueue
{
  double result;

  -[WBSHistoryVisit visitTime](self->_lastVisit, "visitTime");
  return result;
}

- (NSDate)lastVisitedDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[WBSHistoryItem lastVisit](self, "lastVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visitTime");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)lastVisitWasFailure
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__WBSHistoryItem_lastVisitWasFailure__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__WBSHistoryItem_lastVisitWasFailure__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "loadWasSuccessful");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)setLastVisitWasFailure:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__WBSHistoryItem_setLastVisitWasFailure___block_invoke;
  v3[3] = &unk_1E4B2AED8;
  v3[4] = self;
  v4 = a3;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v3);
}

uint64_t __41__WBSHistoryItem_setLastVisitWasFailure___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLoadSuccessful:", *(_BYTE *)(a1 + 40) == 0);
  return objc_msgSend(*(id *)(a1 + 32), "_addVisitToPendingWriteSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)lastVisitWasHTTPNonGet
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__WBSHistoryItem_lastVisitWasHTTPNonGet__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__WBSHistoryItem_lastVisitWasHTTPNonGet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "wasHTTPNonGet");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)stringForUserTypedDomainExpansion
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;

  -[WBSHistoryItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", CFSTR(".com")) & 1) != 0)
  {
    if ((objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", CFSTR("www.")) & 1) != 0)
    {
      if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("www.com")))
      {
        v6 = CFSTR("www");
        goto LABEL_8;
      }
      v4 = objc_msgSend(v3, "length") - 8;
      v5 = 4;
    }
    else
    {
      v7 = objc_msgSend(v3, "length");
      v5 = 0;
      v4 = v7 - 4;
    }
    objc_msgSend(v3, "substringWithRange:", v5, v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_8:

  return (NSString *)v6;
}

- (WBSHistoryItem)lastVisitRedirectDestinationItem
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__WBSHistoryItem_lastVisitRedirectDestinationItem__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryItem *)v2;
}

void __50__WBSHistoryItem_lastVisitRedirectDestinationItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "redirectDestination");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (WBSHistoryItem)endOfLastVisitRedirectChain
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21;
  v9 = __Block_byref_object_dispose__21;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__WBSHistoryItem_endOfLastVisitRedirectChain__block_invoke;
  v4[3] = &unk_1E4B2BE20;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryItem *)v2;
}

void __45__WBSHistoryItem_endOfLastVisitRedirectChain__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v11;
  void *v12;
  _QWORD *v13;

  v2 = *(id *)(a1 + 32);
  v3 = 0;
  v4 = 0;
  v5 = (void *)v2[1];
  do
  {
    objc_msgSend(v5, "endOfRedirectChain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;

      v2 = v9;
    }

    v5 = (void *)v2[1];
    if (v6 == v5)
      break;
    v4 = v6;
  }
  while (v3++ < 4);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v2;
  v13 = v2;

}

- (void)mergeDataFromItem:(id)a3
{
  WBSHistoryItem *v4;
  NSObject *v5;
  WBSHistoryItem *v6;
  _QWORD block[4];
  WBSHistoryItem *v8;
  WBSHistoryItem *v9;

  v4 = (WBSHistoryItem *)a3;
  if (v4 != self)
  {
    v5 = WBSHistoryItemSynchronizationQueue;
    block[1] = 3221225472;
    block[2] = __36__WBSHistoryItem_mergeDataFromItem___block_invoke;
    block[3] = &unk_1E4B2B448;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    v9 = self;
    dispatch_sync(v5, block);

    v4 = v6;
  }

}

void __36__WBSHistoryItem_mergeDataFromItem___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastVisitOnSynchronizationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visitTime");
  v4 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "visitTime");
  v6 = v5;

  if (v4 > v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastVisitOnSynchronizationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = v7;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "setItem:", *(_QWORD *)(a1 + 40), (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_visitsPendingWriteSetCreatingIfNeeded:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "_visitsPendingWriteSetCreatingIfNeeded:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unionSet:", v14);

  }
}

- (void)wasVisited:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__WBSHistoryItem_wasVisited___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __29__WBSHistoryItem_wasVisited___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wasVisitedOnSynchronizationQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_addVisit:(id)a3
{
  id v4;

  v4 = a3;
  -[WBSHistoryItem _addExistingVisit:](self, "_addExistingVisit:");
  -[WBSHistoryItem _addVisitToPendingWriteSet:](self, "_addVisitToPendingWriteSet:", v4);

}

- (void)addExistingVisit:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSHistoryItem_addExistingVisit___block_invoke;
  block[3] = &unk_1E4B2B448;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __35__WBSHistoryItem_addExistingVisit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addExistingVisit:", *(_QWORD *)(a1 + 40));
}

- (void)_addExistingVisit:(id)a3
{
  WBSHistoryVisit **p_lastVisit;
  double v6;
  double v7;
  double v8;

  p_lastVisit = &self->_lastVisit;
  if (!self->_lastVisit
    || (objc_msgSend(a3, "visitTime"), v7 = v6, -[WBSHistoryVisit visitTime](*p_lastVisit, "visitTime"), v7 >= v8))
  {
    objc_storeStrong((id *)p_lastVisit, a3);
  }
  -[NSMutableArray addObject:](self->_visits, "addObject:", a3);
}

- (void)wasRedirectedFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  WBSHistoryItem *v14;

  v6 = a3;
  v7 = a4;
  v8 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSHistoryItem_wasRedirectedFrom_to___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __39__WBSHistoryItem_wasRedirectedFrom_to___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setRedirectSource:", a1[5]);
  objc_msgSend(a1[5], "setRedirectDestination:", a1[4]);
  return objc_msgSend(a1[6], "_wasVisitedOnSynchronizationQueue:", a1[4]);
}

- (void)removeVisits:(id)a3 candidateLastVisit:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSHistoryItem_removeVisits_candidateLastVisit___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __50__WBSHistoryItem_removeVisits_candidateLastVisit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeVisitsOnSynchronizationQueue:candidateLastVisit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeVisitsOnSynchronizationQueue:(id)a3 candidateLastVisit:(id)a4
{
  void *v7;
  void *v8;
  WBSHistoryVisit **p_lastVisit;
  WBSHistoryVisit *lastVisit;
  id v11;

  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryItem _visitsPendingWriteSetCreatingIfNeeded:](self, "_visitsPendingWriteSetCreatingIfNeeded:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v7);
  if (!objc_msgSend(v8, "count"))
    -[WBSHistoryItem clearVisitsPendingWriteToDataStoreFromSynchronizationQueue](self, "clearVisitsPendingWriteToDataStoreFromSynchronizationQueue");
  lastVisit = self->_lastVisit;
  p_lastVisit = &self->_lastVisit;
  if (objc_msgSend(v7, "containsObject:", lastVisit))
    objc_storeStrong((id *)p_lastVisit, a4);

}

- (void)visitWasModified:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WBSHistoryItem_visitWasModified___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __35__WBSHistoryItem_visitWasModified___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addVisitToPendingWriteSet:", *(_QWORD *)(a1 + 40));
}

- (id)visitForTimeOnSynchronizationQueue:(double)a3
{
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_visits;
  v5 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "visitTime", (_QWORD)v11);
        if (v9 == a3)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_visitsPendingWriteSetCreatingIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend((id)visitsPendingWriteTable, "objectForKey:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)visitsPendingWriteTable;
    if (!visitsPendingWriteTable)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 1);
      v9 = (void *)visitsPendingWriteTable;
      visitsPendingWriteTable = v8;

      v7 = (void *)visitsPendingWriteTable;
    }
    objc_msgSend(v7, "setObject:forKey:", v5, self);
  }
  return v5;
}

- (void)_addVisitToPendingWriteSet:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WBSHistoryItem _visitsPendingWriteSetCreatingIfNeeded:](self, "_visitsPendingWriteSetCreatingIfNeeded:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (BOOL)_visitsPendingWriteSetContains:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WBSHistoryItem _visitsPendingWriteSetCreatingIfNeeded:](self, "_visitsPendingWriteSetCreatingIfNeeded:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)visitsPendingWriteToDataStoreOnSynchronizationQueue
{
  void *v2;
  void *v3;
  void *v4;

  -[WBSHistoryItem _visitsPendingWriteSetCreatingIfNeeded:](self, "_visitsPendingWriteSetCreatingIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (void)clearVisitsPendingWriteToDataStoreFromSynchronizationQueue
{
  void *v2;

  objc_msgSend((id)visitsPendingWriteTable, "removeObjectForKey:", self);
  if (!objc_msgSend((id)visitsPendingWriteTable, "count"))
  {
    v2 = (void *)visitsPendingWriteTable;
    visitsPendingWriteTable = 0;

  }
}

- (void)updateWithServiceItem:(id)a3
{
  id v4;

  v4 = a3;
  self->_databaseID = objc_msgSend(v4, "databaseID");
  self->_statusCode = objc_msgSend(v4, "statusCode");

}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSArray)visits
{
  return &self->_visits->super;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (unint64_t)dailyVisitCountScoresCountOnSynchronizationQueue
{
  return self->_dailyVisitCountScoresCountOnSynchronizationQueue;
}

- (const)dailyVisitCountScoresPtrOnSynchronizationQueue
{
  return self->_dailyVisitCountScoresPtrOnSynchronizationQueue;
}

- (unint64_t)weeklyVisitCountScoresCountOnSynchronizationQueue
{
  return self->_weeklyVisitCountScoresCountOnSynchronizationQueue;
}

- (const)weeklyVisitCountScoresPtrOnSynchronizationQueue
{
  return self->_weeklyVisitCountScoresPtrOnSynchronizationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
}

- (WBSHistoryItem)initWithHistoryStreamedItem:(const _HistoryStreamedItem *)a3
{
  WBSHistoryItem *v4;
  void *v5;
  WBSHistoryItem *v6;
  WBSHistoryItem *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryItem;
  v4 = -[WBSHistoryItem init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSHistoryItem initWithURLString:](v4, "initWithURLString:", v5);
    v4 = v6;
    if (v6)
    {
      v6->_databaseID = a3->var1;
      v6->_statusCode = a3->var5;
      v7 = v6;
    }

  }
  return v4;
}

- (void)updateWithStreamedItem:(const _HistoryStreamedItem *)a3
{
  int64_t var1;
  int64_t var5;
  _QWORD block[7];

  var1 = a3->var1;
  var5 = a3->var5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSHistoryItem_HistoryStreamedItem__updateWithStreamedItem___block_invoke;
  block[3] = &unk_1E4B3B2D0;
  block[4] = self;
  block[5] = var1;
  block[6] = var5;
  dispatch_async((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, block);
}

_QWORD *__62__WBSHistoryItem_HistoryStreamedItem__updateWithStreamedItem___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_QWORD *)(v1 + 16))
  {
    *(_QWORD *)(v1 + 16) = result[5];
    v1 = result[4];
  }
  *(_QWORD *)(v1 + 48) = result[6];
  return result;
}

- (void)updateLastVisitIfNil:(id)a3
{
  id v5;
  WBSHistoryVisit **p_lastVisit;
  WBSHistoryVisit *lastVisit;
  id v8;

  v5 = a3;
  lastVisit = self->_lastVisit;
  p_lastVisit = &self->_lastVisit;
  if (!lastVisit)
  {
    v8 = v5;
    objc_storeStrong((id *)p_lastVisit, a3);
    v5 = v8;
  }

}

@end
