@implementation WBSHistoryServiceDatabaseProxy

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  NSXPCProxyCreating *proxy;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v6 = a5;
  proxy = self->_proxy;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "getHighLevelHTTPFamilyDomainsVisitedAfterDate:beforeDate:onlyFromThisDevice:completionHandler:", v13, v12, v6, v11);
}

- (void)fetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSXPCProxyCreating *proxy;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  proxy = self->_proxy;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__WBSHistoryServiceDatabaseProxy_fetchWithOptions_predicate_completionHandler___block_invoke;
  v13[3] = &unk_1E4B2B8A0;
  v14 = v8;
  v10 = v8;
  v11 = a4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchWithOptions:predicate:completionHandler:", a3, v11, v10);

}

- (void)fetchMetadataForKeys:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v7;
  id v8;
  void *v9;
  id v10;

  proxy = self->_proxy;
  v7 = a4;
  v8 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchMetadataForKeys:completionHandler:", v8, v7);
}

- (void)fetchEventsForListener:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v7;
  id v8;
  void *v9;
  id v10;

  proxy = self->_proxy;
  v7 = a4;
  v8 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchEventsForListener:completionHandler:", v8, v7);
}

- (void)fetchDomainExpansions:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchDomainExpansions:", v5);
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSHistoryServiceDatabaseProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v7[3] = &unk_1E4B2B8A0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A8599ED0](v7);

  return v5;
}

- (void)fetchDatabaseURL:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchDatabaseURL:", v5);
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  NSXPCProxyCreating *proxy;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  proxy = self->_proxy;
  v17 = a9;
  v18 = a6;
  v19 = a5;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", a3, a4, v19, v18, a7, v17, a8);
}

- (WBSHistoryServiceDatabaseProxy)initWithProxy:(id)a3
{
  id v5;
  WBSHistoryServiceDatabaseProxy *v6;
  WBSHistoryServiceDatabaseProxy *v7;
  WBSHistoryServiceDatabaseProxy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceDatabaseProxy;
  v6 = -[WBSHistoryServiceDatabaseProxy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxy, a3);
    v8 = v7;
  }

  return v7;
}

void __82__WBSHistoryServiceDatabaseProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __82__WBSHistoryServiceDatabaseProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(v5, v3);
  }

}

uint64_t __79__WBSHistoryServiceDatabaseProxy_fetchWithOptions_predicate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAllHistoryInsertingTombstoneUpToDate:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;
  id v8;

  proxy = self->_proxy;
  v6 = a4;
  v7 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearAllHistoryInsertingTombstoneUpToDate:completionHandler:", v7, v6);

}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 tombstoneMode:(unint64_t)a5 completionHandler:(id)a6
{
  NSXPCProxyCreating *proxy;
  id v10;
  id v11;
  id v12;
  id v13;

  proxy = self->_proxy;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:completionHandler:", v12, v11, a5, v10);

}

- (void)clearHistoryItems:(id)a3 afterDate:(id)a4 beforeDate:(id)a5 tombstoneMode:(unint64_t)a6 completionHandler:(id)a7
{
  NSXPCProxyCreating *proxy;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clearHistoryItems:afterDate:beforeDate:tombstoneMode:completionHandler:", v15, v14, v13, a6, v12);

}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v4;
  id v5;

  proxy = self->_proxy;
  v4 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishClearingHistoryIfNecessaryWithCompletionHandler:", v4);

}

- (void)expireOldVisits:(double)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;

  proxy = self->_proxy;
  v6 = a4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expireOldVisits:completionHandler:", v6, a3);

}

- (void)recomputeItemScoresWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recomputeItemScoresWithCompletionHandler:", v5);
}

- (void)performMaintenanceWithAgeLimit:(double)a3 itemCountLimit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSXPCProxyCreating *proxy;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  proxy = self->_proxy;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__WBSHistoryServiceDatabaseProxy_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke;
  v12[3] = &unk_1E4B2B8A0;
  v13 = v8;
  v10 = v8;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performMaintenanceWithAgeLimit:itemCountLimit:completionHandler:", a4, v10, a3);

}

uint64_t __98__WBSHistoryServiceDatabaseProxy_performMaintenanceWithAgeLimit_itemCountLimit_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pruneTombstonesWithEndDatePriorToDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__WBSHistoryServiceDatabaseProxy_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pruneTombstonesWithEndDatePriorToDate:completionHandler:", v9, v8);

}

uint64_t __90__WBSHistoryServiceDatabaseProxy_pruneTombstonesWithEndDatePriorToDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)convertTombstoneWithGenerationToSecureFormat:(int64_t)a3 lastSyncedGeneration:(int64_t)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;

  proxy = self->_proxy;
  v8 = a5;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:completionHandler:", a3, a4, v8);

}

- (void)replayAndAddTombstones:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;
  id v8;

  proxy = self->_proxy;
  v6 = a4;
  v7 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replayAndAddTombstones:completionHandler:", v7, v6);

}

- (void)fetchAllTombstonesWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCProxyCreating *proxy;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  proxy = self->_proxy;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__WBSHistoryServiceDatabaseProxy_fetchAllTombstonesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4B2B8A0;
  v9 = v4;
  v6 = v4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAllTombstonesWithCompletionHandler:", v6);

}

uint64_t __74__WBSHistoryServiceDatabaseProxy_fetchAllTombstonesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addAutocompleteTrigger:(id)a3 forURL:(id)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;
  id v11;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAutocompleteTrigger:forURL:completionHandler:", v10, v9, v8);

}

- (void)fetchAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__WBSHistoryServiceDatabaseProxy_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAutocompleteTriggersForURLString:completionHandler:", v9, v8);

}

uint64_t __90__WBSHistoryServiceDatabaseProxy_fetchAutocompleteTriggersForURLString_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordVisitWithIdentifier:(id)a3 sourceVisit:(id)a4 title:(id)a5 wasHTTPNonGet:(BOOL)a6 loadSuccessful:(BOOL)a7 origin:(int64_t)a8 attributes:(unint64_t)a9 statusCode:(int64_t)a10 completionHandler:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  NSXPCProxyCreating *proxy;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v12 = a7;
  v13 = a6;
  proxy = self->_proxy;
  v18 = a11;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v18);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recordVisitWithIdentifier:sourceVisit:title:wasHTTPNonGet:loadSuccessful:origin:attributes:statusCode:completionHandler:", v21, v20, v19, v13, v12, a8, a9, a10, v18);

}

- (void)updateVisitWithIdentifier:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5 completionHandler:(id)a6
{
  NSXPCProxyCreating *proxy;
  id v10;
  id v11;
  id v12;

  proxy = self->_proxy;
  v10 = a6;
  v11 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateVisitWithIdentifier:removeAttributes:addAttributes:completionHandler:", v11, a4, a5, v10);

}

- (void)updateVisitWithIdentifier:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;
  id v11;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateVisitWithIdentifier:title:completionHandler:", v10, v9, v8);

}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCProxyCreating *proxy;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  proxy = self->_proxy;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__WBSHistoryServiceDatabaseProxy_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4B2B8A0;
  v9 = v4;
  v6 = v4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flushWithCompletionHandler:", v6);

}

void __61__WBSHistoryServiceDatabaseProxy_flushWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__WBSHistoryServiceDatabaseProxy_flushWithCompletionHandler___block_invoke_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v4;
  id v5;

  proxy = self->_proxy;
  v4 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vacuumHistoryWithCompletionHandler:", v4);

}

- (void)checkIfLocalVisitExistsForDatabaseIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__WBSHistoryServiceDatabaseProxy_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkIfLocalVisitExistsForDatabaseIDs:withCompletion:", v9, v8);

}

void __87__WBSHistoryServiceDatabaseProxy_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __87__WBSHistoryServiceDatabaseProxy_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke_cold_1(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__WBSHistoryServiceDatabaseProxy_getItemCountBeforeDate_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getItemCountBeforeDate:completionHandler:", v9, v8);

}

uint64_t __75__WBSHistoryServiceDatabaseProxy_getItemCountBeforeDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getVisitedLinksWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getVisitedLinksWithCompletionHandler:", v5);
}

- (void)groupVisitsIntoSessionsBetweenStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  proxy = self->_proxy;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "groupVisitsIntoSessionsBetweenStartDate:endDate:completionHandler:", v11, v10, v9);
}

- (void)fetchCloudClientVersionTable:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchCloudClientVersionTable:", v5);
}

- (void)lastSeenDateForCloudClientVersion:(unint64_t)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v7;
  void *v8;
  id v9;

  proxy = self->_proxy;
  v7 = a4;
  -[WBSHistoryServiceDatabaseProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastSeenDateForCloudClientVersion:completionHandler:", a3, v7);
}

- (void)setLastSeenDate:(id)a3 forCloudClientVersion:(unint64_t)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastSeenDate:forCloudClientVersion:completionHandler:", v9, a4, v8);

}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;
  id v11;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetadataValue:forKey:completionHandler:", v10, v9, v8);

}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 writeHandle:(id)a6 completionHandler:(id)a7
{
  NSXPCProxyCreating *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchForUserTypedString:options:currentTime:writeHandle:completionHandler:", v14, a4, v13, v12, a5);

}

- (void)markEventsAsReceivedByListener:(id)a3 eventIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSXPCProxyCreating *proxy;
  NSXPCProxyCreating *v11;
  NSXPCProxyCreating *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  proxy = self->_proxy;
  if (v9)
  {
    -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v9);
    v11 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = proxy;
  }
  v12 = v11;
  -[NSXPCProxyCreating markEventsAsReceivedByListener:eventIDs:completionHandler:](v11, "markEventsAsReceivedByListener:eventIDs:completionHandler:", v13, v8, v9);

}

- (void)dispatchEvent:(id)a3 listenersToIgnore:(id)a4 persistForDelayedDispatching:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  NSXPCProxyCreating *proxy;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v6 = a5;
  v10 = a6;
  proxy = self->_proxy;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__WBSHistoryServiceDatabaseProxy_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke;
  v16[3] = &unk_1E4B2B8A0;
  v17 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dispatchEvent:listenersToIgnore:persistForDelayedDispatching:completionHandler:", v14, v13, v6, v12);

}

uint64_t __113__WBSHistoryServiceDatabaseProxy_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)visitIdentifiersMatchingExistingVisits:(id)a3 desiredVisitTimePrecision:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSXPCProxyCreating *proxy;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  proxy = self->_proxy;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__WBSHistoryServiceDatabaseProxy_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke;
  v13[3] = &unk_1E4B2B8A0;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visitIdentifiersMatchingExistingVisits:desiredVisitTimePrecision:completionHandler:", v11, a4, v10);

}

uint64_t __117__WBSHistoryServiceDatabaseProxy_visitIdentifiersMatchingExistingVisits_desiredVisitTimePrecision_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetCloudHistoryDataWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v4;
  id v5;

  proxy = self->_proxy;
  v4 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetCloudHistoryDataWithCompletionHandler:", v4);

}

- (void)visitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  proxy = self->_proxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__WBSHistoryServiceDatabaseProxy_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke;
  v10[3] = &unk_1E4B2B8A0;
  v11 = v6;
  v8 = v6;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visitsAndTombstonesNeedingSyncWithVisitSyncWindow:completionHandler:", v8, a3);

}

uint64_t __102__WBSHistoryServiceDatabaseProxy_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateDatabaseAfterSuccessfulSyncWithGeneration:(int64_t)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;

  proxy = self->_proxy;
  v6 = a4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDatabaseAfterSuccessfulSyncWithGeneration:completionHandler:", a3, v6);

}

- (void)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  NSXPCProxyCreating *proxy;
  id v12;
  id v13;
  id v14;
  id v15;

  proxy = self->_proxy;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[NSXPCProxyCreating remoteObjectProxy](proxy, "remoteObjectProxy");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createTagsForIdentifiers:withTitles:type:level:completionHandler:", v14, v13, a5, a6, v12);

}

- (void)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;
  id v11;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCProxyCreating remoteObjectProxy](proxy, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assignURLString:toTopicTagsWithIDs:completionHandler:", v10, v9, v8);

}

- (void)setTitle:(id)a3 ofTagWithID:(int64_t)a4 completionHandler:(id)a5
{
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  id v10;

  proxy = self->_proxy;
  v8 = a5;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxy](proxy, "remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:ofTagWithID:completionHandler:", v9, a4, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

void __82__WBSHistoryServiceDatabaseProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "XPC Proxy reported: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __61__WBSHistoryServiceDatabaseProxy_flushWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to flush database: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __87__WBSHistoryServiceDatabaseProxy_checkIfLocalVisitExistsForDatabaseIDs_withCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to check local visit for history items: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
