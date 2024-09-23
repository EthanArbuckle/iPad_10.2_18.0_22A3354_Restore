@implementation WBSPrivateBrowsingUserDefinedContentBlockerManager

- (BOOL)hasContentBlockerWithActions
{
  char v3;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSPrivateBrowsingUserDefinedContentBlockerManager;
  if (-[WBSUserDefinedContentBlockerManager hasContentBlockerWithActions](&v6, sel_hasContentBlockerWithActions))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
  v3 = objc_msgSend(WeakRetained, "hasContentBlockerWithActions");

  return v3;
}

- (void)globalContentBlockerWithCompletionHandler:(id)a3
{
  WBSUserDefinedContentBlockerManager **p_normalBrowsingUserDefinedContentBlockerManager;
  id v4;
  id WeakRetained;

  p_normalBrowsingUserDefinedContentBlockerManager = &self->_normalBrowsingUserDefinedContentBlockerManager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_normalBrowsingUserDefinedContentBlockerManager);
  objc_msgSend(WeakRetained, "globalContentBlockerWithCompletionHandler:", v4);

}

- (id)cachedGlobalContentBlockerActions
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
  objc_msgSend(WeakRetained, "cachedGlobalContentBlockerActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setCachedGlobalContentBlockerActions:(id)a3
{
  NSObject *v3;

  v3 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[WBSPrivateBrowsingUserDefinedContentBlockerManager _setCachedGlobalContentBlockerActions:].cold.1();
}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
{
  WBSUserDefinedContentBlockerManager **p_normalBrowsingUserDefinedContentBlockerManager;
  id v4;
  id WeakRetained;

  p_normalBrowsingUserDefinedContentBlockerManager = &self->_normalBrowsingUserDefinedContentBlockerManager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_normalBrowsingUserDefinedContentBlockerManager);
  objc_msgSend(WeakRetained, "getGlobalContentBlockerWithCompletionHandler:", v4);

}

- (void)deleteGlobalContentBlockerActionsWithSelectors:(id)a3 completionHandler:(id)a4
{
  WBSUserDefinedContentBlockerManager **p_normalBrowsingUserDefinedContentBlockerManager;
  id v6;
  id v7;
  id WeakRetained;

  p_normalBrowsingUserDefinedContentBlockerManager = &self->_normalBrowsingUserDefinedContentBlockerManager;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_normalBrowsingUserDefinedContentBlockerManager);
  objc_msgSend(WeakRetained, "deleteGlobalContentBlockerActionsWithSelectors:completionHandler:", v7, v6);

}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  return (WBSUserDefinedContentBlockerManager *)objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
}

- (void)setNormalBrowsingUserDefinedContentBlockerManager:(id)a3
{
  objc_storeWeak((id *)&self->_normalBrowsingUserDefinedContentBlockerManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
}

- (void)_setCachedGlobalContentBlockerActions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to cache global content blocker into Private Manager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
