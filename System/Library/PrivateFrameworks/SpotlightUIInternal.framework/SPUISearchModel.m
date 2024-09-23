@implementation SPUISearchModel

+ (id)sharedGeneralInstance
{
  if (sharedGeneralInstance_onceToken != -1)
    dispatch_once(&sharedGeneralInstance_onceToken, &__block_literal_global_1);
  return (id)sGeneralQueryModel;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)sharedFullZWKInstance
{
  if (sharedFullZWKInstance_onceToken != -1)
    dispatch_once(&sharedFullZWKInstance_onceToken, &__block_literal_global_63);
  return (id)sFullZKWQueryModel;
}

- (void)didReceiveResponse:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22E078000, v5, v6, "Got response %@", (uint8_t *)&v7, 0xCu);
  }

  -[SPUISearchModel performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_updateWithResponse_, v4, 0);
}

- (void)updateWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  SPUISearchModel *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchModel queryTask](self, "queryTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    SPLogForSPLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v4;
      _os_log_impl(&dword_22E078000, v7, v8, "updateWithResponse: %@", buf, 0xCu);
    }

    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "resultSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v11 = (void *)objc_opt_new();
    v29 = self;
    -[SPUISearchModel queryTask](self, "queryTask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = v4;
    objc_msgSend(v4, "resultSections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v15, "results");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v37;
            while (2)
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v37 != v20)
                  objc_enumerationMutation(v17);
                if (!v11
                  || (v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0)
                  || (objc_msgSend(v22, "resultBundleId"),
                      v23 = (void *)objc_claimAutoreleasedReturnValue(),
                      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.searchd.suggestion")),
                      v23,
                      !v24))
                {
                  objc_msgSend(v34, "addObject:", v15);
                  goto LABEL_21;
                }
                objc_msgSend(MEMORY[0x24BEB0318], "buildResultWithResult:queryContext:", v22, v35);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v25);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              if (v19)
                continue;
              break;
            }
          }
LABEL_21:

          if (objc_msgSend(v11, "count"))
          {
            objc_msgSend(v15, "setResults:", v11);
            objc_msgSend(v34, "addObject:", v15);

            v11 = 0;
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v33);
    }

    v4 = v30;
    objc_msgSend(v30, "setResultSections:", v34);
    -[SPUISearchModel setLastResponse:](v29, "setLastResponse:", v30);
    v26 = objc_msgSend(v30, "state");
    -[SPUISearchModel setQueryPartiallyComplete:](v29, "setQueryPartiallyComplete:", (v26 & 0xFFFFFFFFFFFFFFFELL) == 2);
    -[SPUISearchModel setQueryJustHasTopHits:](v29, "setQueryJustHasTopHits:", v26 == 1);
    -[SPUISearchModel setQueryComplete:](v29, "setQueryComplete:", objc_msgSend(v30, "state") == 4);
    v27 = objc_msgSend(v30, "kind");
    if (v27 == 1)
    {
      -[SPUISearchModel delegate](v29, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "searchAgentFinishedQueryWithoutAdditionalResults:", v29);
    }
    else
    {
      if (v27)
      {
LABEL_30:

        goto LABEL_31;
      }
      -[SPUISearchModel delegate](v29, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "searchAgentUpdatedResults:", v29);
    }

    goto LABEL_30;
  }
LABEL_31:

}

- (SPQueryTask)queryTask
{
  return (SPQueryTask *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setQueryPartiallyComplete:(BOOL)a3
{
  self->_queryPartiallyComplete = a3;
}

- (void)setQueryJustHasTopHits:(BOOL)a3
{
  self->_queryJustHasTopHits = a3;
}

- (void)setQueryComplete:(BOOL)a3
{
  self->_queryComplete = a3;
}

- (SPSearchAgentDelegate)delegate
{
  return (SPSearchAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)queryPartiallyComplete
{
  return self->_queryPartiallyComplete;
}

- (NSArray)sections
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    -[SPQueryResponse resultSections](self->_lastResponse, "resultSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22E078000, v3, v4, "Sections: %@", (uint8_t *)&v7, 0xCu);

  }
  -[SPQueryResponse resultSections](self->_lastResponse, "resultSections");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)wantsCompletions
{
  void *v2;
  uint64_t v3;

  -[SPUISearchModel queryTask](self, "queryTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "queryKind");

  return (unint64_t)(v3 - 1) < 2;
}

- (SFResultSection)searchThroughSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)queryJustHasTopHits
{
  return self->_queryJustHasTopHits;
}

- (BOOL)queryComplete
{
  return self->_queryComplete;
}

- (void)setQueryTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

void __40__SPUISearchModel_sharedFullZWKInstance__block_invoke()
{
  SPUISearchModelZKW *v0;
  void *v1;

  v0 = objc_alloc_init(SPUISearchModelZKW);
  v1 = (void *)sFullZKWQueryModel;
  sFullZKWQueryModel = (uint64_t)v0;

}

void __40__SPUISearchModel_sharedGeneralInstance__block_invoke()
{
  SPUISearchModelGeneral *v0;
  void *v1;

  v0 = objc_alloc_init(SPUISearchModelGeneral);
  v1 = (void *)sGeneralQueryModel;
  sGeneralQueryModel = (uint64_t)v0;

}

+ (SPUISearchModel)sharedInstance
{
  return (SPUISearchModel *)+[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
}

+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
  objc_msgSend(MEMORY[0x24BEB0070], "retrieveFirstTimeExperienceTextWithReply:", a3);
}

- (BOOL)queryInProgress
{
  return 0;
}

- (void)enableUpdates
{
  __assert_rtn("-[SPUISearchModel enableUpdates]", "SPUISearchModel.m", 144, "_updatesDisabled");
}

- (void)disableUpdates
{
  int64_t updatesDisabled;

  updatesDisabled = self->_updatesDisabled;
  self->_updatesDisabled = updatesDisabled + 1;
  if (!updatesDisabled)
    -[SPUISearchModel updatesDisabled](self, "updatesDisabled");
}

- (void)purgeMemory
{
  -[SPUISearchModel setLastResponse:](self, "setLastResponse:", 0);
  -[SPUISearchModel setQueryTask:](self, "setQueryTask:", 0);
}

- (BOOL)_suggestionsReadyForDisplay
{
  return -[SPQueryResponse state](self->_lastResponse, "state") != 0;
}

- (void)invalidateQuery:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[SPUISearchModel queryTask](self, "queryTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SPUISearchModel setLastResponse:](self, "setLastResponse:", 0);
    -[SPUISearchModel delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchAgentUpdatedResults:", self);

  }
}

- (void)resultsDidBecomeInvalid:(id)a3
{
  -[SPUISearchModel performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invalidateQuery_, a3, 0);
}

- (void)invalidate
{
  SPQueryTask *queryTask;
  SPQueryResponse *lastResponse;

  queryTask = self->_queryTask;
  self->_queryTask = 0;

  lastResponse = self->_lastResponse;
  self->_lastResponse = 0;

  self->_queryComplete = 0;
  *(_WORD *)&self->_queryJustHasTopHits = 0;
}

- (int64_t)maxUISuggestions
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)springBoardIsActive
{
  return self->_springBoardIsActive;
}

- (void)setSpringBoardIsActive:(BOOL)a3
{
  self->_springBoardIsActive = a3;
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (BOOL)forceStableResults
{
  return self->_forceStableResults;
}

- (void)setForceStableResults:(BOOL)a3
{
  self->_forceStableResults = a3;
}

- (SPQueryResponse)lastResponse
{
  return (SPQueryResponse *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryTask, 0);
  objc_storeStrong((id *)&self->_searchThroughSection, 0);
  objc_storeStrong((id *)&self->_lastQueryString, 0);
}

@end
