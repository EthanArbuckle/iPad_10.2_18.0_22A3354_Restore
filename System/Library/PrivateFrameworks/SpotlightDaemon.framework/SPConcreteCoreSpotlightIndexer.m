@implementation SPConcreteCoreSpotlightIndexer

- (__SI)index
{
  return self->_index;
}

- (NSSet)knownClients
{
  return (NSSet *)objc_getProperty(self, a2, 200, 1);
}

void __145__SPConcreteCoreSpotlightIndexer__startInternalQueryWithIndex_query_fetchAttributes_forBundleIds_maxCount_resultsHandler_resultQueue_postFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v11, a3, a4, a5, a6);
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v14 = v13 - *(double *)(a1 + 56);
    objc_msgSend(v11, "dataclass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SDTraceAdd(2, v15, *(int *)(a1 + 72), *(void **)(a1 + 32), 0, v14);

    logForCSLogCategoryQuery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(a1 + 64);
      v18 = objc_msgSend(v11, "siJob");
      v19 = *(int *)(a1 + 72);
      v20 = 134218752;
      v21 = (uint64_t)(v14 * 1000.0);
      v22 = 2048;
      v23 = v17;
      v24 = 2048;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      _os_log_debug_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEBUG, "Finished internal query (%lldms), siQuery:%p, siJob:%p, queryID:%ld", (uint8_t *)&v20, 0x2Au);
    }

    SIQueryRelease();
    SDTransactionDone(*(void **)(a1 + 40));
  }

}

void __87__SPConcreteCoreSpotlightIndexer__startQueryWithQueryTask_eventHandler_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  id v18;

  v11 = a2;
  v12 = *(_QWORD *)(a1 + 40);
  v18 = v11;
  if (v12)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, a3, a4, a5, a6);
    v11 = v18;
  }
  if (a3 == 2 && a6)
  {
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v11, "dataclass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SDTraceAdd(2, CFSTR("Performance"), v13, v14, a6, 0.0);

    v11 = v18;
  }
  else if (a3 == 1 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v11, "dataclass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    SDTraceAdd(2, v15, v16, *(void **)(a1 + 32), 0, v17 - *(double *)(a1 + 64));

    SIQueryRelease();
    v11 = v18;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)_startQueryWithQueryTask:(id)a3 eventHandler:(id)a4 resultsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  SPQueryJob *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:].cold.1();
  v11 = v10;
  objc_msgSend(v8, "resultsQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:].cold.2();
  if (!objc_msgSend(v12, "siResultsQueue"))
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:].cold.3();
  v14 = objc_msgSend(v8, "siQuery");
  if (!v14)
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:].cold.4();
  v15 = v14;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index
    || self->_suspended
    || self->_suspending
    || -[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "_startQueryWithQueryTask"))
  {
    v16 = 0;
    goto LABEL_10;
  }
  v34 = (void *)MEMORY[0x2199C2F34](v9);
  objc_msgSend(v8, "queryContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "internal") & 1) == 0)
  {

LABEL_15:
    objc_msgSend(v8, "clientBundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v8, "clientBundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);

    }
    goto LABEL_17;
  }
  objc_msgSend(v8, "queryContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_15;
  objc_msgSend(v8, "queryContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIDs");

LABEL_17:
  v24 = SIExecuteQueryWithResultsCallbackForTags();
  if (v24)
  {
    objc_msgSend(v8, "queryString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryID");
    v27 = v26;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v29 = v28;
    SIQueryRetain();
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v43 = 0;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __87__SPConcreteCoreSpotlightIndexer__startQueryWithQueryTask_eventHandler_resultsHandler___block_invoke;
    v35[3] = &unk_24D0EC030;
    v38 = v42;
    v39 = v27;
    v37 = v11;
    v40 = v29;
    v30 = v25;
    v36 = v30;
    v41 = v15;
    v31 = (void *)objc_msgSend(v35, "copy");
    v16 = -[SPQueryJob initWithSIJob:dataclass:eventHandler:resultsHandler:]([SPQueryJob alloc], "initWithSIJob:dataclass:eventHandler:resultsHandler:", v24, self->_dataclass, v9, v31);
    objc_msgSend(v8, "queryContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "disableResultStreaming");

    if (v33)
      objc_msgSend(v13, "setDisableResultStreaming:", 1);
    objc_msgSend(v13, "addJob:", v16);

    _Block_object_dispose(v42, 8);
  }
  else
  {
    v16 = 0;
  }

LABEL_10:
  return v16;
}

- (void)readyIndex:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSString *v14;
  __SI *index;
  NSObject *v16;
  NSString *v17;
  SPConcreteCoreSpotlightIndexer *v18;
  uint64_t v19;
  NSObject *v20;
  NSString *dataclass;
  NSObject *v22;
  NSString *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_jwlIndex)
  {
    if ((objc_msgSend((id)sDelegate, "deviceUnlocked") & 1) == 0)
    {
      logForCSLogCategoryIndex();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        dataclass = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        v26 = dataclass;
        _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "JWL index open till unlock, dataclass:%@", buf, 0xCu);
      }

      return;
    }
    SICloseJWLIndex();
    self->_jwlIndex = 0;
  }
  if (self->_index)
    goto LABEL_8;
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self->_dataclass;
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Opening index, dataclass:%@", buf, 0xCu);
  }

  -[SPConcreteCoreSpotlightIndexer openIndex:](self, "openIndex:", v3);
  if (self->_index)
  {
LABEL_8:
    if (!SIValidIndex())
    {
      logForCSLogCategoryIndex();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl(&dword_213CF1000, v22, OS_LOG_TYPE_INFO, "Re-opening index, dataclass:%@", buf, 0xCu);
      }

      -[SPConcreteCoreSpotlightIndexer closeIndex](self, "closeIndex");
      v18 = self;
      v19 = 1;
      goto LABEL_40;
    }
    if (self->_index)
    {
      SIResumeForUnlock();
      if (self->_index)
      {
        if (self->_suspended)
        {
          logForCSLogCategoryIndex();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v8 = self->_dataclass;
            v9 = "YES";
            if (!self->_suspended)
              v9 = "NO";
            *(_DWORD *)buf = 138412546;
            v26 = v8;
            v27 = 2080;
            v28 = v9;
            _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Try resume index, dataclass:%@, suspended:%s", buf, 0x16u);
          }

          if (objc_msgSend((id)sDelegate, "deviceUnlocked"))
          {
            if ((v10 = *MEMORY[0x24BDD0CD0],
                  !-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD0]))
              && !-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD8])
              && !-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE8])
              || (-[SPConcreteCoreSpotlightIndexer owner](self, "owner"),
                  v11 = (void *)objc_claimAutoreleasedReturnValue(),
                  v12 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInSB"),
                  v11,
                  v12))
            {
              logForCSLogCategoryIndex();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                v14 = self->_dataclass;
                *(_DWORD *)buf = 138412290;
                v26 = v14;
                _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "Resuming the protected index for dataclass %@ since the device was unlocked", buf, 0xCu);
              }

              if (!self->_softSuspended && !self->_hasAssertion)
                SIResumeIndex();
              index = self->_index;
              v24[0] = MEMORY[0x24BDAC760];
              v24[1] = 3221225472;
              v24[2] = __45__SPConcreteCoreSpotlightIndexer_readyIndex___block_invoke;
              v24[3] = &unk_24D0EAE40;
              v24[4] = self;
              SIBackgroundOpBlock((uint64_t)index, 0, v24);
              if (_os_feature_enabled_impl()
                && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", v10))
              {
                SISyncIndex();
              }
              -[SPConcreteCoreSpotlightIndexer dropBackgroundAssertions:](self, "dropBackgroundAssertions:", SIIsLockedIndexingMode());
              *(_WORD *)&self->_suspended = 0;
              if (self->_index)
              {
                if (SIIsLockedIndexingMode())
                {
                  logForCSLogCategoryIndex();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                  {
                    v17 = self->_dataclass;
                    *(_DWORD *)buf = 138412290;
                    v26 = v17;
                    _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_INFO, "reopening index as it was opened for locked indexing, dataclass:%@", buf, 0xCu);
                  }

                  -[SPConcreteCoreSpotlightIndexer closeIndex](self, "closeIndex");
                  v18 = self;
                  v19 = 0;
LABEL_40:
                  -[SPConcreteCoreSpotlightIndexer openIndex:](v18, "openIndex:", v19);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)startQueryWithQueryTask:(id)a3 startHandler:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6
{
  void (**v10)(id, _QWORD);
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = (void (**)(id, _QWORD))a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
    -[SPConcreteCoreSpotlightIndexer startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:].cold.1();
  v13 = v12;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index || self->_suspended || self->_suspending)
  {
    v10[2](v10, 0);
  }
  else
  {
    -[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:](self, "_startQueryWithQueryTask:eventHandler:resultsHandler:", v15, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, _QWORD), void *, __SI *, NSString *))v10[2])(v10, v14, self->_index, self->_dataclass);

  }
}

- (void)preheat
{
  CFAbsoluteTime v3;

  if (self->_index)
  {
    v3 = self->_lastPreheat + 30.0;
    if (v3 < CFAbsoluteTimeGetCurrent())
    {
      SIPreHeatIndex();
      self->_lastPreheat = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (void)shrink:(unint64_t)a3
{
  NSObject *v5;
  NSString *dataclass;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 == 16 && self->_index && s_last_memory_pressure_status == 16)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      v7 = 138412290;
      v8 = dataclass;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Index %@ shrink", (uint8_t *)&v7, 0xCu);
    }

    SIIndexInactive();
  }
}

- (void)indexFinishedDrainingJournal:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *dataclass;
  void *v7;
  void *v8;
  __SI *v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  void *v33;
  SPCoreSpotlightIndexerTask *v34;
  void *v35;
  SPCoreSpotlightIndexerTask *v36;
  void *v37;
  NSObject *v38;
  _QWORD v39[4];
  id v40;
  id v41[3];
  _QWORD v42[4];
  id v43;
  id v44;
  const __CFString *v45;
  id v46;
  SPConcreteCoreSpotlightIndexer *v47;
  void *v48;
  _BYTE buf[12];
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    v50 = 2112;
    v51 = (const __CFString *)dataclass;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "indexFinishedDrainingJournal, bundleID:%@, dataclass:%@", buf, 0x16u);
  }

  -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "dataMigrationStage");
  v9 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v9
    && !self->_readOnly
    && !self->_suspended
    && !self->_suspending
    && !-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "indexFinishedDrainingJournal"))
  {
    if (!v4 && !sPrivate)
    {
      -[SPConcreteCoreSpotlightIndexer updateEmailLocalParts:](self, "updateEmailLocalParts:", 0);
      -[SPConcreteCoreSpotlightIndexer updateEmailContentURLAttr:](self, "updateEmailContentURLAttr:", 0);
      -[SPConcreteCoreSpotlightIndexer updateRankingDates:](self, "updateRankingDates:", 0);
      -[SPConcreteCoreSpotlightIndexer updateContainersAndScores:](self, "updateContainersAndScores:", 0);
      -[SPConcreteCoreSpotlightIndexer updateGroups:](self, "updateGroups:", 0);
      -[SPConcreteCoreSpotlightIndexer updateNotes:](self, "updateNotes:", 0);
      -[SPConcreteCoreSpotlightIndexer issuePhotosReindexIfNeeded:](self, "issuePhotosReindexIfNeeded:", 0);
    }
    if (!objc_msgSend(v4, "isEqual:", CFSTR("com.apple.mobilemail")))
      goto LABEL_20;
    v10 = *MEMORY[0x24BDD0CD0];
    v11 = -[NSString isEqual:](self->_dataclass, "isEqual:", *MEMORY[0x24BDD0CD0]);
    logForCSLogCategoryIndex();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "Check whether Mail needs reindexing", buf, 2u);
      }

      -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", CFSTR("com.apple.mobilemail.reindexVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "isEqual:", CFSTR("599"));
        logForCSLogCategoryIndex();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if ((v16 & 1) != 0)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v15;
            v50 = 2112;
            v51 = CFSTR("599");
            _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_INFO, "Reindex version matches %@==%@", buf, 0x16u);
          }

LABEL_20:
          if (v4)
          {
            if (-[SPConcreteCoreSpotlightIndexer clientIsCheckedIn:](self, "clientIsCheckedIn:", v4))
            {
              -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "extensionDelegate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "extensionExistsForBundleId:", v4);

              if ((v21 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BEB00D8], "sharedProcessor");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v42[0] = MEMORY[0x24BDAC760];
                v42[1] = 3221225472;
                v42[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_331;
                v42[3] = &unk_24D0EB060;
                v43 = v4;
                objc_msgSend(v22, "updateCheckedInClientWithBundleIdentifier:completionHandler:", v43, v42);

              }
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
          {
            *(_QWORD *)buf = 0;
            objc_initWeak((id *)buf, self);
            v39[0] = MEMORY[0x24BDAC760];
            v39[1] = 3221225472;
            v39[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_334;
            v39[3] = &unk_24D0EB0B0;
            objc_copyWeak(v41, (id *)buf);
            v41[1] = v9;
            v23 = v4;
            v40 = v23;
            v41[2] = v8;
            v24 = (void *)MEMORY[0x2199C2F34](v39);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(_kMDItemWillModify=1)&&(_kMDItemBundleID=\"%@\")"), v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = CFSTR("_kMDItemExternalID");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v23;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v9, v25, v26, v27, v24);

            objc_destroyWeak(v41);
            objc_destroyWeak((id *)buf);
          }
          goto LABEL_38;
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        v50 = 2112;
        v51 = CFSTR("599");
        v28 = "Reindex version mismatch %@!=%@";
        v29 = v18;
        v30 = 22;
      }
      else
      {
        logForCSLogCategoryIndex();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
LABEL_35:

          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 2);
          -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v32;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setProtectionClasses:", v33);

          objc_msgSend(v31, "setReason:", CFSTR("re-indexing mail - finished draining journal"));
          v34 = [SPCoreSpotlightIndexerTask alloc];
          v47 = self;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v34, "initWithIndexJob:indexers:", v31, v35);

          v46 = v4;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPCoreSpotlightIndexerTask setBundleIDs:](v36, "setBundleIDs:", v37);

          -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v36, "setDataMigrationStage:", v8);
          -[SPConcreteCoreSpotlightIndexer performIndexerTask:completionHandler:](self, "performIndexerTask:completionHandler:", v36, &__block_literal_global_329);
          logForCSLogCategoryIndex();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = CFSTR("com.apple.mobilemail.reindexVersion");
            v50 = 2112;
            v51 = CFSTR("599");
            _os_log_impl(&dword_213CF1000, v38, OS_LOG_TYPE_INFO, "Reindexing and setting %@ %@", buf, 0x16u);
          }

          -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", CFSTR("599"), CFSTR("com.apple.mobilemail.reindexVersion"), 1);
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        v28 = "Reindex version not set";
        v29 = v18;
        v30 = 2;
      }
      _os_log_impl(&dword_213CF1000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      goto LABEL_35;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      v50 = 2112;
      v51 = CFSTR("com.apple.mobilemail");
      _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEFAULT, "*warn* index %@ has information for %@", buf, 0x16u);
    }

  }
LABEL_38:

}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 resultsHandler:(id)a7
{
  return -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:", a3, a4, a5, a6, 0, a7);
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8
{
  return -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:", a3, a4, a5, a6, a7, a8, 0);
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9
{
  return -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:postFilter:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:postFilter:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 forBundleIds:(id)a6 maxCount:(unint64_t)a7 resultsHandler:(id)a8 resultQueue:(id)a9 postFilter:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  _BOOL4 suspending;
  const char *v26;
  signed int v27;
  uint64_t v28;
  NSString *dataclass;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  SPQueryJob *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  signed int v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  __SI *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _QWORD v63[4];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (!v19)
  {
    +[SPQueryResultsQueue sharedInstanceMaintenanceDispatchQueue:](SPQueryResultsQueue, "sharedInstanceMaintenanceDispatchQueue:", 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "siResultsQueue");
  if (!a3 || self->_suspended || self->_suspending)
  {
    logForCSLogCategoryQuery();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = "YES";
      suspending = self->_suspending;
      if (self->_suspended)
        v26 = "YES";
      else
        v26 = "NO";
      *(_DWORD *)buf = 138413058;
      if (!suspending)
        v24 = "NO";
      v52 = v15;
      v53 = 2048;
      v54 = a3;
      v55 = 2080;
      v56 = (uint64_t)v26;
      v57 = 2080;
      v58 = (uint64_t)v24;
      _os_log_error_impl(&dword_213CF1000, v21, OS_LOG_TYPE_ERROR, "Failed to execute internal query:\"%@\", index:%p, _suspended:%s, _suspending:%s", buf, 0x2Au);
    }
    v22 = 0;
    goto LABEL_8;
  }
  if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "_startInternalQueryWithIndex"))
  {
    v22 = 0;
    goto LABEL_9;
  }
  v43 = v16;
  do
    v27 = __ldaxr((unsigned int *)&gQueryID_0);
  while (__stlxr(v27 + 1, (unsigned int *)&gQueryID_0));
  v28 = SIQueryCreateWithItems();
  if (v28)
  {
    dataclass = self->_dataclass;
    v63[0] = CFSTR("query");
    v63[1] = dataclass;
    v42 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2, 0, 0, 0, v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SDTransactionCreate(v40);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v31 = v30;
    v32 = SIExecuteQueryWithResultsCallbackForTags();
    if (v32)
    {
      v41 = v32;
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __145__SPConcreteCoreSpotlightIndexer__startInternalQueryWithIndex_query_fetchAttributes_forBundleIds_maxCount_resultsHandler_resultQueue_postFilter___block_invoke;
      v44[3] = &unk_24D0EC740;
      v47 = v18;
      v48 = v31;
      v50 = v27;
      v38 = v15;
      v45 = v38;
      v49 = v42;
      v21 = v21;
      v46 = v21;
      v39 = (void *)objc_msgSend(v44, "copy");
      logForCSLogCategoryQuery();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
        v36 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v52 = v38;
        v53 = 2048;
        v54 = a3;
        v55 = 2048;
        v56 = v42;
        v57 = 2048;
        v58 = v41;
        v59 = 2048;
        v60 = v27;
        v61 = 2112;
        v37 = (void *)v36;
        v62 = v36;
        _os_log_debug_impl(&dword_213CF1000, v33, OS_LOG_TYPE_DEBUG, "Starting internal query:\"%@\", index:%p, siQuery:%p, siJob:%p, queryID:%ld, dataclass:%@", buf, 0x3Eu);

      }
      v34 = -[SPQueryJob initWithSIJob:dataclass:eventHandler:resultsHandler:]([SPQueryJob alloc], "initWithSIJob:dataclass:eventHandler:resultsHandler:", v41, self->_dataclass, 0, v39);
      objc_msgSend(v19, "addJob:", v34);
      v22 = v34 != 0;

      goto LABEL_31;
    }
    logForCSLogCategoryQuery();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v52 = v15;
      v53 = 2048;
      v54 = a3;
      v55 = 2048;
      v56 = v42;
      v57 = 2048;
      v58 = v27;
      _os_log_error_impl(&dword_213CF1000, v35, OS_LOG_TYPE_ERROR, "Failed to execute query:\"%@\", index:%p, siQuery:%p, queryID:%ld", buf, 0x2Au);
    }

    SIQueryRelease();
    SDTransactionDone(v21);
  }
  else
  {
    logForCSLogCategoryQuery();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v52 = v15;
      v53 = 2048;
      v54 = a3;
      v55 = 2048;
      v56 = v27;
      _os_log_error_impl(&dword_213CF1000, v21, OS_LOG_TYPE_ERROR, "Failed to create internal query:\"%@\", index:%p, queryID:%ld", buf, 0x20u);
    }
  }
  v22 = 0;
LABEL_31:
  v16 = v43;
LABEL_8:

LABEL_9:
  return v22;
}

- (SPCoreSpotlightIndexer)owner
{
  return (SPCoreSpotlightIndexer *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)clientDidCheckin:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *dataclass;
  NSMapTable *checkedInClients;
  int v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  NSMapTable *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    checkedInClients = self->_checkedInClients;
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = dataclass;
    v18 = 2112;
    v19 = checkedInClients;
    _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_INFO, "clientDidCheckin, bundleID:%@, dataclass:%@, checkedInClients:%@", (uint8_t *)&v14, 0x20u);
  }

  -[NSMapTable setObject:forKey:](self->_checkedInClients, "setObject:forKey:", v10, v8);
  -[SPConcreteCoreSpotlightIndexer checkInWithBundleID:completionHandler:](self, "checkInWithBundleID:completionHandler:", v8, v9);

}

- (void)checkInWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  NSString *dataclass;
  __SI *index;
  NSSet *knownClients;
  NSMapTable *checkedInClients;
  NSString *v14;
  __SI *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SPCoreSpotlightIndexerTask *v21;
  void *v22;
  SPCoreSpotlightIndexerTask *v23;
  void *v24;
  unint64_t createCount;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  SPConcreteCoreSpotlightIndexer *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  SPConcreteCoreSpotlightIndexer *v33;
  unint64_t v34;
  id v35;
  SPConcreteCoreSpotlightIndexer *v36;
  void *v37;
  _BYTE buf[12];
  __int16 v39;
  NSString *v40;
  __int16 v41;
  __SI *v42;
  __int16 v43;
  NSSet *v44;
  __int16 v45;
  NSMapTable *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    logForCSLogCategoryIndex();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      index = self->_index;
      knownClients = self->_knownClients;
      checkedInClients = self->_checkedInClients;
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v6;
      v39 = 2112;
      v40 = dataclass;
      v41 = 2048;
      v42 = index;
      v43 = 2112;
      v44 = knownClients;
      v45 = 2112;
      v46 = checkedInClients;
      _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "checkInWithBundleID, bundleID:%@, dataclass:%@, index:%p, knownClients:%@, checkedInClients:%@", buf, 0x34u);
    }

    if (self->_knownClients)
    {
      if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.mobilemail"))
        && (v14 = (NSString *)*MEMORY[0x24BDD0CD0],
            (-[NSString isEqual:](self->_dataclass, "isEqual:", *MEMORY[0x24BDD0CD0]) & 1) == 0))
      {
        logForCSLogCategoryIndex();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = CFSTR("com.apple.mobilemail");
          v39 = 2112;
          v40 = v14;
          _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_DEFAULT, "*warn* client checkin %@ has wrong protection class for for %@", buf, 0x16u);
        }

      }
      else if (-[NSSet containsObject:](self->_knownClients, "containsObject:", v6))
      {
        -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v15 = self->_index;
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_642;
        v27[3] = &unk_24D0EB690;
        objc_copyWeak(&v30, (id *)buf);
        v28 = v6;
        v29 = self;
        SISynchedOpWithBlockPropagatingPriority((uint64_t)v15, 2, v27);

        objc_destroyWeak(&v30);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 2);
        -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setProtectionClasses:", v19);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no known client with bundle ID: %@ ; knownClients=%@"),
          v6,
          self->_knownClients);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setReason:", v20);

        v21 = [SPCoreSpotlightIndexerTask alloc];
        v36 = self;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v21, "initWithIndexJob:indexers:", v17, v22);

        v35 = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCoreSpotlightIndexerTask setBundleIDs:](v23, "setBundleIDs:", v24);

        -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v23, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage"));
        -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v23, "setShouldResumeOnFailure:", 0);
        createCount = self->_createCount;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke;
        v31[3] = &unk_24D0EB668;
        v32 = v6;
        v33 = self;
        v34 = createCount;
        -[SPConcreteCoreSpotlightIndexer performIndexerTask:withIndexDelegatesAndCompletionHandler:](self, "performIndexerTask:withIndexDelegatesAndCompletionHandler:", v23, v31);

      }
    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID = \"%@\" && _kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer _deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:](self, "_deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:", v8, v9, v7);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

  }
}

- (void)_deleteSearchableItemsMatchingQuery:(id)a3 forBundleIds:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sIndexQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke;
  v16[3] = &unk_24D0EC058;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  _setup_block(v16, 0, 9842);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v15);

}

- (void)deleteAllUserActivities:(id)a3 completionHandler:(id)a4
{
  -[SPConcreteCoreSpotlightIndexer deleteAllUserActivities:fromClient:completionHandler:](self, "deleteAllUserActivities:fromClient:completionHandler:", a3, 0, a4);
}

- (void)deleteHasTopHitAppShortcutsWithResultsHandler:(id)a3 completionHandler:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDC2468];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setInternal:", 1);
  objc_msgSend(v8, "setLowPriority:", 0);
  v16[0] = *MEMORY[0x24BDC1D50];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchAttributes:", v9);

  v15 = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtectionClasses:", v10);

  objc_msgSend(v8, "setBundleIDs:", &unk_24D0FCFE8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=1"), *MEMORY[0x24BDC1DC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v11, v8, 0, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startQueryTask:", v13);

}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_2(id *a1, uint64_t a2, int a3)
{
  void (**v4)(id, _QWORD, id);
  id v5;
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v4 = (void (**)(id, _QWORD, id))a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);

  }
  else
  {
    v6 = a1[4];
    v8 = a1[7];
    v7 = a1[6];
    SIFetchCSClientState();

  }
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = a2;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v4, "length");
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "#index fetch state dataLen:%ld", (uint8_t *)&v9, 0xCu);
    }

    SDTraceAdd(3, CFSTR("ClientState complete"), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 32), 0.0);
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, 0);
LABEL_9:

    return;
  }
  if (a3)
  {
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "SIFetchCSClientState canceled for bundleID:%@", (uint8_t *)&v9, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v4);
    goto LABEL_9;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 0);
}

- (void)fetchLastClientStateForBundleID:(id)a3 clientStateName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SPConcreteCoreSpotlightIndexer *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer fetchLastClientStateForBundleID:clientStateName:completionHandler:].cold.1();

  v12 = sIndexQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke;
  v17[3] = &unk_24D0EC058;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  _setup_block(v17, 0, 10002);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v12, v16);

}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;

  if (!objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDC1950];
    v8 = -1;
LABEL_20:
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v20);

    return;
  }
  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "readyIndex:", 1);
  v3 = *(_BYTE **)(a1 + 40);
  if (*((_QWORD *)v3 + 16))
  {
    if (!v3[24] && !v3[26])
    {
      v4 = 0;
      goto LABEL_13;
    }
  }
  else if (!*((_QWORD *)v3 + 17) && !v3[96])
  {
    goto LABEL_19;
  }
  if (!_os_feature_enabled_impl()
    || (v9 = *MEMORY[0x24BDD0CD0], (objc_msgSend(*((id *)*v2 + 21), "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) == 0))
  {
LABEL_19:
    v5 = *(_QWORD *)(a1 + 56);
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDC1950];
    v8 = -1000;
    goto LABEL_20;
  }
  v3 = *v2;
  if (*((_QWORD *)*v2 + 16))
  {
LABEL_12:
    v4 = 1;
LABEL_13:
    if (!*((_QWORD *)v3 + 17))
    {
LABEL_14:
      objc_msgSend(v3, "dataclass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SDTraceAdd(3, CFSTR("FetchClientState start"), -1, v10, *(void **)(a1 + 32), 0.0);
      objc_msgSend((id)objc_opt_class(), "_stateInfoAttributeNameWithClientStateName:", *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(v13 + 128);
      if (!v14)
        v14 = *(_QWORD *)(v13 + 136);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_2;
      v21[3] = &unk_24D0EC6A8;
      v22 = *(id *)(a1 + 32);
      v23 = v12;
      v27 = v4;
      v25 = *(id *)(a1 + 56);
      v26 = v11;
      v24 = v10;
      v15 = v10;
      v16 = v12;
      SIBackgroundOpBlock(v14, 9, v21);

      goto LABEL_17;
    }
    goto LABEL_37;
  }
  if (*((_QWORD *)v3 + 17))
  {
LABEL_22:
    if (*((_QWORD *)v3 + 17))
    {
      v4 = 1;
      goto LABEL_14;
    }
LABEL_37:
    __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_cold_2();
  }
  if (_os_feature_enabled_impl() && (objc_msgSend(*((id *)*v2 + 21), "isEqualToString:", v9) & 1) != 0)
  {
    objc_msgSend(*v2, "openJWLIndex");
    v3 = *v2;
    if (*((_QWORD *)*v2 + 17))
    {
      if (*((_QWORD *)v3 + 16))
        goto LABEL_12;
      goto LABEL_22;
    }
    logForCSLogCategoryIndex();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2();

  }
  else
  {
    logForCSLogCategoryIndex();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5();

  }
  v18 = *(_QWORD *)(a1 + 56);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v16);
LABEL_17:

  }
}

- (NSString)dataclass
{
  return self->_dataclass;
}

+ (id)_stateInfoAttributeNameWithClientStateName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("_kMDItemStateInfo_%@"), v4);

  return v5;
}

- (void)commitUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *dataclass;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_index && !self->_suspended)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      v13 = dataclass;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Index %@ sync", buf, 0xCu);
    }

    v7 = self->_dataclass;
    v11[0] = CFSTR("commit");
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SDTransactionCreate(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[SPConcreteCoreSpotlightIndexer _cancelIdleTimer](self, "_cancelIdleTimer");
    if (SISyncIndex())
    {
      syncContextCreate(v4, v9);
      SIIndexInactive();
      SISynchedOp();
    }

  }
}

- (id)_cancelIdleTimer
{
  SPConcreteCoreSpotlightIndexer *v2;
  NSObject *v3;
  OS_os_transaction *v4;
  OS_dispatch_source *indexIdleTimer;
  OS_os_transaction *dirtyTransaction;
  NSObject *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_indexIdleTimer;
  v4 = v2->_dirtyTransaction;
  indexIdleTimer = v2->_indexIdleTimer;
  v2->_indexIdleTimer = 0;

  dirtyTransaction = v2->_dirtyTransaction;
  v2->_dirtyTransaction = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2->_idleStartTime = 0.0;
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SPConcreteCoreSpotlightIndexer _cancelIdleTimer].cold.1();

  }
  return v4;
}

void __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  unsigned int VectorCount;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a3 == 1)
  {
    v17 = WeakRetained;
    if (objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 48))
    {
      SDTraceAdd(3, CFSTR("DeleteMatchingQuey complete"), *(_QWORD *)(a1 + 56), 0, 0, 0.0);
      v16 = *(_QWORD *)(a1 + 32);
      v6 = v17;
      if (!v16)
        goto LABEL_14;
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      v6 = v17;
      if (!v14)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    }
LABEL_13:
    v6 = v17;
    goto LABEL_14;
  }
  if (!a3)
  {
    v17 = WeakRetained;
    v7 = objc_msgSend(WeakRetained, "index");
    v6 = v17;
    if (v7 == *(_QWORD *)(a1 + 48))
    {
      VectorCount = _MDStoreOIDArrayGetVectorCount();
      v6 = v17;
      if (VectorCount >= 2)
      {
        v9 = VectorCount;
        v10 = *(_QWORD *)(a1 + 48);
        v11 = (uint64_t *)(_MDStoreOIDArrayGetVector() + 8);
        v12 = v9 - 1;
        do
        {
          v13 = *v11++;
          MEMORY[0x2199C22A4](v10, v13);
          --v12;
        }
        while (v12);
        objc_msgSend(v17, "dirty");
        goto LABEL_13;
      }
    }
  }
LABEL_14:

}

void __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22[2];
  _BYTE buf[12];
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "readyIndex:", 0);
  v2 = a1[4];
  if (!*((_QWORD *)v2 + 16) || *((_BYTE *)v2 + 24) || *((_BYTE *)v2 + 97))
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v5 = v4[16];
      v6 = *((unsigned __int8 *)v4 + 24);
      LODWORD(v4) = *((unsigned __int8 *)v4 + 97);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v5;
      v24 = 1024;
      v25 = v6;
      v26 = 1024;
      v27 = (int)v4;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Cannot delete attributes in _deleteSearchableItmesMatchingQuery: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    if (a1[7])
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "_indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      (*((void (**)(void))a1[7] + 2))();

    }
  }
  else if (objc_msgSend(v2, "denyOperationOnAssertedIndex:", "_deleteSearchableItemsMatchingQuery"))
  {
    v11 = *MEMORY[0x24BDC1950];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void (**)(id, void *))a1[7];
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, -1000, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v13);

    }
  }
  else
  {
    v14 = (void *)SDTraceAdd(3, CFSTR("DeleteMatchingQuey start"), -1, a1[5], 0, 0.0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, a1[4]);
    v15 = *((_QWORD *)a1[4] + 16);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_981;
    v18[3] = &unk_24D0EC658;
    v21 = a1[7];
    objc_copyWeak(v22, (id *)buf);
    v16 = a1[4];
    v22[1] = v14;
    v18[4] = v16;
    v19 = a1[5];
    v20 = a1[6];
    SIBackgroundOpBlock(v15, 0, v18);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dirty:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  SDTransactionCreate(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sIndexQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke;
  v9[3] = &unk_24D0EAFC8;
  v11 = a3;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  _setup_block(v9, 0, 1720);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, v8);

}

- (void)completeIndexingItemFor:(id)a3 delegate:(id)a4 didBeginThrottle:(BOOL)a5 didEndThrottle:(BOOL)a6 error:(id)a7 live:(BOOL)a8 queue:(id)a9 slow:(BOOL)a10 startTime:(double)a11 completionHandler:(id)a12
{
  _BOOL4 v13;
  _BOOL4 v15;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  double Current;
  int v25;
  double v26;
  void *v27;
  double v28;
  uint64_t v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  dispatch_time_t v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v13 = a8;
  v15 = a6;
  v46 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a9;
  v22 = a12;
  v23 = v22;
  if (a10)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (v13)
    {
      v25 = live_delay;
      v26 = *(float *)&live_delay + *(float *)&live_delay_scaler * (Current - a11);
      if (v26 >= *(float *)&live_delay_scaled_max)
        v26 = *(float *)&live_delay_scaled_max;
    }
    else
    {
      v28 = *(float *)&bulk_delay;
      v29 = objc_msgSend((id)buckets, "count");
      v30 = (float)v29;
      v31 = v30;
      if (!v29)
        v31 = 1.0;
      v32 = v28 + v31 * ((Current - a11) * *(float *)&bulk_delay_scaler);
      v26 = *(float *)&bulk_delay_scaled_max;
      if (v32 < *(float *)&bulk_delay_scaled_max)
        v26 = v32;
      v25 = live_delay;
    }
    if (!v13)
      v25 = bulk_delay;
    v33 = *(float *)&v25;
    if (v26 >= 0.0)
      v33 = v26;
    if (gIsSystemOnBattery)
      v34 = v33;
    else
      v34 = v33 * 0.5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v18;
      v44 = 2048;
      v45 = v34;
      _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Throttling indexing reply for %@ by %g s", buf, 0x16u);
    }
    v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __149__SPConcreteCoreSpotlightIndexer_completeIndexingItemFor_delegate_didBeginThrottle_didEndThrottle_error_live_queue_slow_startTime_completionHandler___block_invoke;
    block[3] = &unk_24D0EBBB8;
    v40 = v23;
    v37 = v20;
    v41 = a5;
    v38 = v19;
    v39 = v18;
    dispatch_after(v35, v21, block);

  }
  else
  {
    (*((void (**)(id, id))v22 + 2))(v22, v20);
    if (v19 && v15)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 5, 0);
      objc_msgSend(v19, "indexRequestsPerformJob:forBundle:completionHandler:", v27, v18, 0);

    }
  }

}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CFAbsoluteTime Current;
  dispatch_time_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD handler[7];
  _BYTE buf[24];
  int v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
  {
    if (CFAbsoluteTimeGetCurrent() - *((double *)*v2 + 23) < (double)*((unint64_t *)*v2 + 26))
    {
      logForCSLogCategoryIndex();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_cold_1((uint64_t)v2, v3);

      v4 = *((_QWORD *)*v2 + 22);
      v5 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v4, v5, 0x12A05F200uLL, 0x12A05F200uLL);
    }
  }
  else if (*(_BYTE *)(a1 + 48) || (SIGetAccumulatedWorkTimeSinceLastSync(), v6 > 1.0))
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *((_QWORD *)*v2 + 21);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = qos_class_self();
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Index %@ dirty qos: %d", buf, 0x12u);
    }

    v9 = *((_QWORD *)*v2 + 21);
    v23[0] = CFSTR("dirty");
    v23[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SDTransactionCreate(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)*v2 + 19));
    Current = CFAbsoluteTimeGetCurrent();
    *((CFAbsoluteTime *)*v2 + 23) = Current;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v22 = 0;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_306;
    handler[3] = &unk_24D0EAFA0;
    handler[4] = *v2;
    handler[5] = buf;
    *(CFAbsoluteTime *)&handler[6] = Current;
    dispatch_source_set_event_handler(v12, handler);
    v14 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v12, v14, 0x12A05F200uLL, 0x12A05F200uLL);
    v15 = *v2;
    objc_sync_enter(v15);
    v16 = (void *)*((_QWORD *)*v2 + 27);
    *((_QWORD *)*v2 + 27) = v11;
    v17 = v11;

    v18 = (void *)*((_QWORD *)*v2 + 22);
    *((_QWORD *)*v2 + 22) = v12;
    v19 = v12;

    dispatch_resume(v19);
    objc_sync_exit(v15);

    _Block_object_dispose(buf, 8);
  }
  SDTransactionDone(*(void **)(a1 + 40));
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5)
{
  id v9;
  void (**v10)(_QWORD);
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;

  v9 = a2;
  v10 = a5;
  v11 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple."));
  if ((a3 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_msgSend((id)buckets, "valueForKey:", v9);
    v12 = v13 < bulk_budget_threshold;
  }
  if (v11)
    v14 = v12 | 2;
  else
    v14 = v12;
  duet_log_activity_start(1);
  v10[2](v10);

  duet_log_activity_stop();
  v15 = sIndexQueue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_5;
  v19[3] = &unk_24D0EB4C0;
  v16 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = a4;
  v24 = a3;
  v19[4] = v16;
  v20 = v9;
  v23 = v14;
  v17 = v9;
  _setup_block(v19, 0, 4143);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v15, v18);

}

+ (int64_t)checkItemOfInterest:(id)a3 mask:(int64_t)a4
{
  char v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a4;
  objc_msgSend(a3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_2:
    v7 = 0;
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_3;
  }
  objc_msgSend(v5, "summarizationContentTopic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_msgSend(v6, "summarizationContentSynopsis"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v6, "summarizationContentTopLine"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v6, "isUrgent"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || objc_msgSend(v6, "urgencyStatus"))
  {

  }
  else if (!objc_msgSend(v6, "summarizationStatus"))
  {
    goto LABEL_2;
  }
  v7 = 1;
  if ((v4 & 2) == 0)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "attributeForKey:", *MEMORY[0x24BDC1DF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v7 |= 2uLL;
LABEL_5:
  if ((v4 & 4) != 0)
  {
    objc_msgSend(v6, "mediaAnalysisComplete");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v7 |= 4uLL;
  }

  return v7;
}

- (int64_t)_interestedAttributesMaskForBundleID:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail"))
    && (_os_feature_enabled_impl() & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS"))
    && (_os_feature_enabled_impl() & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.usernotificationsd"))
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)notifyClientForItemUpdates:(id)a3 updatedItems:(id)a4 batchMask:(int64_t)a5
{
  id v7;
  void *v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  char *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  SPConcreteCoreSpotlightIndexer *v63;
  id v64;
  id obj;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v63 = self;
  v72 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v9)
  {
    v10 = v9;
    v66 = *(_QWORD *)v68;
    v11 = *MEMORY[0x24BDC1DF0];
    do
    {
      v12 = 0;
      do
      {
        v13 = v8;
        if (*(_QWORD *)v68 != v66)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v12);
        objc_msgSend(v14, "attributeSet", v63);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_new();
        objc_msgSend(v14, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "copyWithZone:", 0);
        objc_msgSend(v16, "setUniqueIdentifier:", v18);

        objc_msgSend(v15, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copyWithZone:", 0);
        objc_msgSend(v16, "attributeSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setUniqueIdentifier:", v20);

        objc_msgSend(v15, "domainIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copyWithZone:", 0);
        objc_msgSend(v16, "attributeSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setDomainIdentifier:", v23);

        if ((a5 & 1) != 0)
        {
          v28 = objc_msgSend(v15, "summarizationStatus");
          objc_msgSend(v16, "attributeSet");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setSummarizationStatus:", v28);

          v30 = objc_msgSend(v15, "urgencyStatus");
          objc_msgSend(v16, "attributeSet");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setUrgencyStatus:", v30);

          objc_msgSend(v15, "isUrgent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "attributeSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setIsUrgent:", v32);

          objc_msgSend(v15, "summarizationContentTopLine");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setSummarizationContentTopLine:", v35);

          objc_msgSend(v15, "summarizationContentSynopsis");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v37, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setSummarizationContentSynopsis:", v38);

          objc_msgSend(v15, "summarizationContentTopic");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v40, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setSummarizationContentTopic:", v41);

          objc_msgSend(v15, "providerDataTypeIdentifiers");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v43, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setProviderDataTypeIdentifiers:", v44);

          objc_msgSend(v15, "creator");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(v46, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setCreator:", v47);

          objc_msgSend(v15, "threadIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v49, "copyWithZone:", 0);
          objc_msgSend(v16, "attributeSet");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setThreadIdentifier:", v50);

          if ((a5 & 2) == 0)
          {
LABEL_8:
            if ((a5 & 4) == 0)
              goto LABEL_10;
LABEL_9:
            objc_msgSend(v15, "mediaAnalysisComplete");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v25, "copyWithZone:", 0);
            objc_msgSend(v16, "attributeSet");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setMediaAnalysisComplete:", v26);

            goto LABEL_10;
          }
        }
        else if ((a5 & 2) == 0)
        {
          goto LABEL_8;
        }
        objc_msgSend(v16, "attributeSet");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attributeForKey:", v11);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v53, "copyWithZone:", 0);
        objc_msgSend(v52, "setAttribute:forKey:", v54, v11);

        if ((a5 & 4) != 0)
          goto LABEL_9;
LABEL_10:
        v8 = v13;
        objc_msgSend(v13, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      v10 = v55;
    }
    while (v55);
  }

  if (objc_msgSend(v8, "count"))
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 17);
    objc_msgSend(v56, "setUpdatedItems:", v8);
    objc_msgSend(v56, "setUpdatedItemsMask:", a5);
    logForCSLogCategoryDefault();
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
      -[SPConcreteCoreSpotlightIndexer notifyClientForItemUpdates:updatedItems:batchMask:].cold.1(v8, v57);

    +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer dataclass](v63, "dataclass");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "handleJob:bundleID:protectionClass:completionHandler:", v56, v64, v59, &__block_literal_global_6);

    if ((v60 & 1) == 0)
    {
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "extensionDelegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
        objc_msgSend(v62, "indexRequestsPerformDataJob:forBundle:completionHandler:", v56, v64, &__block_literal_global_150);

    }
  }

}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1();
  }

}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_1();
  }

}

- (void)setProperty:(id)a3 forKey:(id)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  dispatch_group_t v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  if (self->_index)
  {
    SISetProperty();
    if (v5)
    {
      v9 = dispatch_group_create();
      -[SPConcreteCoreSpotlightIndexer commitUpdates:](self, "commitUpdates:", v9);

    }
  }

}

- (id)getPropertyForKey:(id)a3
{
  void *index;

  index = self->_index;
  if (index)
    index = (void *)SICopyProperty();
  return index;
}

- (int64_t)getIntegerPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  if (self->_index)
  {
    -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v5, "integerValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)issuePriorityIndexFixupOn
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (sUsePriorityIndex == 1)
  {
    if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", CFSTR("Priority")))
    {
      dispatch_get_global_queue(21, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke;
      block[3] = &unk_24D0EA758;
      v5 = v2;
      v3 = v2;
      dispatch_async(v3, block);

    }
  }
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  NSObject *v9;
  _QWORD *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[16];
  _QWORD v14[3];
  char v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Requesting update of apps for priority migration", buf, 2u);
  }

  v4 = (void *)sDelegate;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_154;
  v11[3] = &unk_24D0EA758;
  v6 = v2;
  v12 = v6;
  objc_msgSend(v4, "updateApplicationsWithCompletion:clean:", v11, 1);
  v7 = *(void **)(a1 + 32);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_155;
  block[3] = &unk_24D0EACF8;
  v10 = v14;
  v9 = v7;
  dispatch_group_notify(v6, v9, block);

  _Block_object_dispose(v14, 8);
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_154(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished update of apps for priority migration", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_155(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)sPriorityBundleIds, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v2;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Issuing reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_158;
  v8[3] = &unk_24D0EACD0;
  v9 = v2;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = (id)v7;
  v10 = v7;
  v6 = v2;
  objc_msgSend(v4, "_reindexAllItemsForBundleIDs:reason:completionHandler:", v6, CFSTR("priority-index-turned-on"), v8);

}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_158(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_group_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  dispatch_group_t v13;
  id v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  v4 = dispatch_group_create();
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultIndexer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_159;
  v11[3] = &unk_24D0EACA8;
  v12 = *(id *)(a1 + 32);
  v13 = v4;
  v14 = v6;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = (id)v10;
  v15 = v10;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v8, "whenFinishedDraining:", v11);

}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_159(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id obj;
  _QWORD block[5];
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Deleting items from default index for priority migration for bundleIDs %@", buf, 0xCu);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID='%@'"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_165;
          v16[3] = &unk_24D0EAC58;
          v18 = *(_QWORD *)(a1 + 64);
          v16[4] = v9;
          v11 = *(void **)(a1 + 48);
          v17 = *(id *)(a1 + 40);
          objc_msgSend(v11, "deleteItemsForQuery:bundleID:fromClient:completionHandler:", v10, v9, CFSTR("com.apple.searchd"), v16);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    v12 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_167;
    block[3] = &unk_24D0EAC80;
    v13 = *(NSObject **)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 64);
    dispatch_group_notify(v12, v13, block);
  }
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_165(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_165_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 134218242;
      v10 = a3;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Deleted %ld items from default index for priority migration for bundleID %@", (uint8_t *)&v9, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_167(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "defaultIndexer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 1);

    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "priorityIndexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 1);

    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v6 = "Finished priority migration ON";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v6 = "Couldn't complete priority migration ON; will try again on next launch";
      v7 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

}

- (void)issuePriorityIndexFixupOff
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t buf[16];

  if ((sUsePriorityIndex & 1) == 0
    && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Beginning priority migration off default index", buf, 2u);
    }

    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke;
    v7[3] = &unk_24D0EAD20;
    v8 = v4;
    v5 = v4;
    -[SPConcreteCoreSpotlightIndexer whenFinishedDraining:](self, "whenFinishedDraining:", v7);
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v5, v6, &__block_literal_global_170);

  }
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_2()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  NSObject *v6;
  uint8_t buf[16];

  v0 = dispatch_group_create();
  dispatch_group_enter(v0);
  logForCSLogCategoryDefault();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Requesting update of apps for priority migration", buf, 2u);
  }

  v2 = (void *)sDelegate;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_171;
  v5[3] = &unk_24D0EA758;
  v6 = v0;
  v3 = v0;
  objc_msgSend(v2, "updateApplicationsWithCompletion:clean:", v5, 0);
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v3, v4, &__block_literal_global_173);

}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_171(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished update of apps for priority migration", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_172()
{
  void *v0;
  NSObject *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)sPriorityBundleIds, "allObjects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v0;
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Issuing reindex for priority migration for bundleIDs %@", buf, 0xCu);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_176;
  v4[3] = &unk_24D0EA758;
  v5 = v0;
  v3 = v0;
  objc_msgSend(v2, "_reindexAllItemsForBundleIDs:reason:completionHandler:", v3, CFSTR("priority-index-turned-off"), v4);

}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_176(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished priority migration for bundleIDs %@", buf, 0xCu);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "priorityIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Deleting old priority index for priority migration at %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "removeItemAtPath:error:", v5, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    logForCSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_176_cold_1();

  }
}

- (BOOL)issuePriorityIndexFixup
{
  NSString **p_dataclass;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;

  if (sPrivate || (sUpgradedForPriorityIndex & 1) != 0)
  {
LABEL_18:
    LOBYTE(v4) = 0;
    return v4;
  }
  p_dataclass = &self->_dataclass;
  if (!-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
  {
    v4 = -[NSString isEqualToString:](*p_dataclass, "isEqualToString:", CFSTR("Priority"));
    if (!v4)
      return v4;
  }
  v5 = -[SPConcreteCoreSpotlightIndexer getIntegerPropertyForKey:](self, "getIntegerPropertyForKey:", CFSTR("kSPPriorityIndexVersion"));
  v6 = sUsePriorityIndex;
  if (((sUsePriorityIndex ^ (v5 > 4)) & 1) == 0)
  {
    if (v5 < 5)
      v9 = &unk_24D0FD1E0;
    else
      v9 = &unk_24D0FD1C8;
    -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", v9, CFSTR("kSPPriorityIndexVersion"), 1);
    goto LABEL_18;
  }
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixup].cold.1();

    -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixupOn](self, "issuePriorityIndexFixupOn");
  }
  else
  {
    if (v8)
      -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixup].cold.2();

    -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixupOff](self, "issuePriorityIndexFixupOff");
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (void)issuePhotosReindexIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SPCoreSpotlightIndexerTask *v13;
  void *v14;
  SPCoreSpotlightIndexerTask *v15;
  void *v16;
  id WeakRetained;
  _QWORD v18[5];
  SPConcreteCoreSpotlightIndexer *v19;
  NSString *dataclass;
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend((id)sDelegate, "privateIndex") & 1) == 0)
    {
      if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
      {
        -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", CFSTR("PHOTOS_INDEX_VERSION_CHANGE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "integerValue");

        if (v6 < 1 || v3)
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 2, 4);
          v21[0] = CFSTR("com.apple.mobileslideshow");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setBundleIDs:", v8);

          dataclass = self->_dataclass;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &dataclass, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setProtectionClasses:", v9);

          if (v3)
          {
            objc_msgSend(v7, "setReason:", CFSTR("Photos re-index forced"));
          }
          else
          {
            v10 = (void *)MEMORY[0x24BDD17C8];
            -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", CFSTR("PHOTOS_INDEX_VERSION_CHANGE"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("Photos index version changed: %@ -> %lu"), v11, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setReason:", v12);

          }
          v13 = [SPCoreSpotlightIndexerTask alloc];
          v19 = self;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v13, "initWithIndexJob:indexers:", v7, v14);

          objc_msgSend(v7, "bundleIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPCoreSpotlightIndexerTask setBundleIDs:](v15, "setBundleIDs:", v16);

          WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v15, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage"));

          -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v15, "setShouldResumeOnFailure:", 0);
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __61__SPConcreteCoreSpotlightIndexer_issuePhotosReindexIfNeeded___block_invoke;
          v18[3] = &unk_24D0EA758;
          v18[4] = self;
          -[SPConcreteCoreSpotlightIndexer performIndexerTask:completionHandler:](self, "performIndexerTask:completionHandler:", v15, v18);

        }
      }
    }
  }
}

uint64_t __61__SPConcreteCoreSpotlightIndexer_issuePhotosReindexIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", &unk_24D0FD1F8, CFSTR("PHOTOS_INDEX_VERSION_CHANGE"), 0);
}

- (BOOL)denyOperationOnAssertedIndex:(char *)a3
{
  NSObject *v5;
  NSString *dataclass;
  int v8;
  char *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_index && !self->_hasAssertion)
    return 0;
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    v8 = 136315394;
    v9 = a3;
    v10 = 2112;
    v11 = dataclass;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Cannot %s on asserted index when device is locked. dataclass:%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (void)reindexAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 indexAttrName:(id)a5 withVersion:(unint64_t)a6 perItemCompletionAttribute:(id)a7 force:(BOOL)a8 postFilter:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __SI *v20;
  NSObject *v21;
  __SI *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  NSObject *v27;
  id v28;
  id v29;
  _QWORD *v30;
  __SI *v31;
  unint64_t v32;
  _QWORD v33[4];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  v20 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v20)
  {
    if (self->_readOnly)
    {
      logForCSLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:].cold.1();
      goto LABEL_9;
    }
    v22 = v20;
    if (!-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "reindexAttributes")&& (a8 || -[SPConcreteCoreSpotlightIndexer getIntegerPropertyForKey:](self, "getIntegerPropertyForKey:", v17) < a6))
    {
      v34[0] = CFSTR("_kMDItemBundleID");
      v34[1] = CFSTR("_kMDItemExternalID");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      v33[3] = 0;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke;
      v26[3] = &unk_24D0EAE90;
      v26[4] = self;
      v31 = v22;
      v21 = v24;
      v27 = v21;
      v30 = v33;
      v28 = v18;
      v32 = a6;
      v29 = v17;
      v25 = (void *)MEMORY[0x2199C2F34](v26);
      -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:postFilter:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:resultQueue:postFilter:", v22, v16, v21, 0, 0, v25, 0, v19);

      _Block_object_dispose(v33, 8);
LABEL_9:

    }
  }

}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  if (a3 == 1)
  {
    v22 = objc_msgSend(*(id *)(a1 + 32), "index");
    if (v22 == *(_QWORD *)(a1 + 72))
    {
      v23 = v22;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_198;
      v28[3] = &unk_24D0EAE68;
      v24 = *(_QWORD *)(a1 + 80);
      v28[4] = *(_QWORD *)(a1 + 32);
      v31 = v24;
      v25 = *(id *)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 64);
      v27 = *(_QWORD *)(a1 + 72);
      v29 = v25;
      v30 = v26;
      v32 = v27;
      SIBackgroundOpBlock(v23, 0, v28);

    }
  }
  else if (!a3 && objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 72))
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy_;
    v55 = __Block_byref_object_dispose_;
    v56 = 0;
    v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    v50 = 0;
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_193;
    v38[3] = &unk_24D0EADB0;
    v41 = &v45;
    v42 = &v51;
    v43 = *(_OWORD *)(a1 + 64);
    v44 = v10;
    v39 = *(id *)(a1 + 40);
    v40 = *(id *)(a1 + 48);
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", v10, 0, v38);
    if (objc_msgSend((id)v52[5], "count"))
    {
      logForCSLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "resultsQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v58 = v13;
        _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_INFO, "Pause queue:%p", buf, 0xCu);

      }
      objc_msgSend(v9, "resultsQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pauseResults");

      v15 = (id)v52[5];
      v16 = (id)v46[5];
      v17 = *(_QWORD *)(a1 + 72);
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_197;
      v33[3] = &unk_24D0EADD8;
      v18 = v9;
      v19 = *(_QWORD *)(a1 + 64);
      v34 = v18;
      v37 = v19;
      v20 = v15;
      v35 = v20;
      v21 = v16;
      v36 = v21;
      SIBackgroundOpBlock(v17, 0, v33);

    }
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
  }

}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_193(uint64_t a1, _QWORD *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqual:", *a2)
    || (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0x201)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    {
      v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2;
      v26[3] = &unk_24D0EAD88;
      v6 = *(_QWORD *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 72);
      v28 = v5;
      v29 = v6;
      v27 = v4;
      v8 = v5;
      v9 = v4;
      SIBackgroundOpBlock(v7, 0, v26);

    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = objc_msgSend((id)*a2, "mutableCopy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = *(_QWORD *)(a1 + 80);
  if (v17 >= 3)
  {
    v18 = *MEMORY[0x24BDBD430];
    for (i = 2; i < v17; ++i)
    {
      v20 = a2[i];
      if (v20)
        v21 = v20 == v18;
      else
        v21 = 1;
      if (!v21)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v20, v22);

        v17 = *(_QWORD *)(a1 + 80);
      }
    }
  }
  if (objc_msgSend(v16, "count"))
  {
    v23 = (void *)a2[1];
    if (v23)
    {
      v24 = (void *)objc_msgSend(v23, "mutableCopy");
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v24, v25);

      if (*(_QWORD *)(a1 + 40))
        objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v16);
    }
  }

}

uint64_t __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) += objc_msgSend(*(id *)(result + 32), "count");
    return SISetCSAttributes();
  }
  return result;
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_197(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resultsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "resultsQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134217984;
      v10 = v7;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, "Resume cancel queue:%p", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v5, "resumeResults");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = v5;
    if (!SISetCSAttributes())
      unpauseIfSystemInGoodStateCallback(v8);
  }

}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_198(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[11];

  if (!a3)
  {
    v9[9] = v3;
    v9[10] = v4;
    v6 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1[7]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:sync:", v7, a1[5], 1);

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v8 = a1[8];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2_199;
      v9[3] = &unk_24D0EAE40;
      v9[4] = a1[4];
      SISynchedOpWithBlock(v8, 2, v9);
    }
  }
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_2_199(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[9];

  if (!a3)
  {
    v7[7] = v3;
    v7[8] = v4;
    v5 = sIndexQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_3;
    v7[3] = &unk_24D0EA758;
    v7[4] = *(_QWORD *)(a1 + 32);
    _setup_block(v7, 0, 1308);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v6);

  }
}

uint64_t __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeWithCompletionHandler:", &__block_literal_global_201);
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "Post fixup merged finished", v5, 2u);
  }

}

- (void)updateEmailLocalParts:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = *MEMORY[0x24BDC1C10];
  v6 = *MEMORY[0x24BDC1AB8];
  v7 = *MEMORY[0x24BDC20E8];
  v8 = *MEMORY[0x24BDC19F8];
  v9 = *MEMORY[0x24BDC1DD8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ = \"*\"  && %@ != \"*\") ||(%@ = \"*\"  && %@ != \"*\") ||(%@ = \"*\"  && %@ != \"*\") ||(%@ = \"*\"  && %@ != \"*\") ||(%@ = \"*\"  && %@ != \"*\")"), *MEMORY[0x24BDC1C10], *MEMORY[0x24BDC1C18], *MEMORY[0x24BDC1AB8], *MEMORY[0x24BDC1AC0], *MEMORY[0x24BDC20E8], *MEMORY[0x24BDC20F0], *MEMORY[0x24BDC19F8], *MEMORY[0x24BDC1A00], *MEMORY[0x24BDC1DD8], *MEMORY[0x24BDC1DE0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ = \"@\"w || %@ = \"@\"w ||%@ = \"@\"w ||%@ = \"@\"w ||%@ = \"@\"w)"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:](self, "reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:", &unk_24D0FCEF8, v11, CFSTR("kSPEmailLocalParts"), 7, 0, v3, v10);

}

- (void)updateEmailContentURLAttr:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ = \"*\"  && %@!=\"*\") && (%@ = \"%@\")"), *MEMORY[0x24BDC1BA0], *MEMORY[0x24BDC1DB8], *MEMORY[0x24BDC1AE8], CFSTR("com.apple.mobilemail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:](self, "reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:", &unk_24D0FCF10, v5, CFSTR("kSPEmailContentURLAttr"), 2, 0, v3, 0);

}

- (void)updateRankingDates:(BOOL)a3
{
  -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:](self, "reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:", &unk_24D0FCF28, CFSTR("(kMDItemContentCreationDate==* && kMDItemContentCreationDate_Ranking!=*) || (kMDItemLastUsedDate == * && kMDItemLastUsedDate_Ranking != *)|| (kMDItemStartDate==* && kMDItemStartDate_Ranking != *) || (kMDItemCompletionDate=* && kMDItemCompletionDate_Ranking!=*) || (kMDItemDueDate=* && kMDItemDueDate_Ranking!=*) || (com_apple_mail_dateReceived==* && kMDItemMailDateReceived_Ranking!=*) || (kMDItemContentCreationDate==*  || kMDItemLastUsedDate == * || kMDItemStartDate==* || kMDItemCompletionDate=* || kMDItemDueDate=* || com_apple_mail_dateReceived==* || _kMDItemRelatedActivityLastLaunchDate=*) && _kMDItemRankingDateFixed!=1"), CFSTR("kSPCoalescedRanking"), 10, CFSTR("_kMDItemRankingDateFixed"), a3, 0);
}

- (void)updateContainersAndScores:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v3 = a3;
  v7[5] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("_kMDItemBundleID");
  v7[1] = CFSTR("_kMDItemExternalID");
  v5 = *MEMORY[0x24BDC1BF8];
  v7[2] = *MEMORY[0x24BDC1B50];
  v7[3] = v5;
  v7[4] = CFSTR("kMDItemEmailConversationID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:](self, "reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:", v6, CFSTR("(kMDItemContainerIdentifier=* || kMDItemEmailConversationID=* || (_kMDItemDomainIdentifier = * && _kMDItemBundleID = \"com.apple.MobileSMS\")) && _kMDItemContainerIdFixed!=1"), CFSTR("kSPHashedContainers"), 3, CFSTR("_kMDItemContainerIdFixed"), v3, 0);

}

- (void)updateNotes:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BDC1D98];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\"), CFSTR("com.apple.mobilenotes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:](self, "reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:", v5, v6, CFSTR("kSPNotes"), 1, 0, v3, 0);

}

- (void)dumpAllRankingDiagnosticInformationForQuery:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  __SI *v8;
  __SI *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  SPConcreteCoreSpotlightIndexer *v20;
  id v21;
  id v22;
  _QWORD *v23;
  __SI *v24;
  _QWORD v25[3];
  int v26;

  v6 = a3;
  v7 = a4;
  v8 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", CFSTR("_kMDItemSDBInfo"));
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = -1;
    NSHomeDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking/Spotlight_Ranking_Diagnostic_Dump_AllResults.log"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __100__SPConcreteCoreSpotlightIndexer_dumpAllRankingDiagnosticInformationForQuery_withCompletionHandler___block_invoke;
    v19 = &unk_24D0EAEB8;
    v20 = self;
    v23 = v25;
    v24 = v9;
    v13 = v12;
    v21 = v13;
    v22 = v7;
    v14 = (void *)MEMORY[0x2199C2F34](&v16);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("**=\"%@*\"cdwt"), v6, v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v9, v15, v10, v14);

    _Block_object_dispose(v25, 8);
  }

}

void __100__SPConcreteCoreSpotlightIndexer_dumpAllRankingDiagnosticInformationForQuery_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unsigned int ByteVectorCount;
  int v7;
  const void *ByteVector;
  int v9;
  _QWORD __buf[2];

  __buf[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3 == 1)
  {
    v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v9 != -1)
    {
      close(v9);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -1;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (!a3 && objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 64))
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != -1
      || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 1537, 438), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != -1))
    {
      ByteVectorCount = _MDPlistBytesGetByteVectorCount();
      v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      ByteVector = (const void *)_MDPlistBytesGetByteVector();
      write(v7, ByteVector, ByteVectorCount);
      if ((ByteVectorCount & 7) != 0)
      {
        __buf[0] = 0;
        write(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), __buf, ByteVectorCount);
      }
    }
  }

}

- (void)performQueryForCountOfItemsInCategory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __SI *index;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  index = self->_index;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke;
  v11[3] = &unk_24D0EAF08;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  SIBackgroundOpBlock((uint64_t)index, 9, v11);

}

void __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[4];

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v4 = a2;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke_2;
    v11[3] = &unk_24D0EAEE0;
    v5 = *(_QWORD *)(a1 + 32);
    v13 = v15;
    v14 = a2;
    v11[4] = v5;
    v12 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x2199C2F34](v11);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%@=%@"), *MEMORY[0x24BDC1AE8], *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v7, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v4, v8, MEMORY[0x24BDBD1A8], v6);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    _Block_object_dispose(v15, 8);
  }
}

void __83__SPConcreteCoreSpotlightIndexer_performQueryForCountOfItemsInCategory_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  BOOL v8;
  id v9;
  id v10;

  v7 = a2;
  if (a3 == 1)
  {
    v10 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = v10;
  }
  else if (a3 == 5)
  {
    v9 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 56);
    v7 = v9;
    if (v8)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a4;
  }

}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v33;
  __CFRunLoop *Current;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  stat v44;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("bulk_budget_threshold"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      bulk_budget_threshold = objc_msgSend(v3, "intValue");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("budget_check_threshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      budget_check_threshold = objc_msgSend(v5, "intValue");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("budget_check_threshold_delay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      budget_check_threshold_delay = objc_msgSend(v7, "intValue");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("decay_time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      *(double *)&decay_time = v10;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("decay_denominator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "floatValue");
      *(double *)&decay_denominator = v13;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", CFSTR("live_delay_scaler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      live_delay_scaler = v16;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("live_delay_scaled_max"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      live_delay_scaled_max = v19;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueForKey:", CFSTR("live_delay"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "floatValue");
      live_delay = v22;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueForKey:", CFSTR("bulk_delay_scaler"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "floatValue");
      bulk_delay_scaler = v25;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForKey:", CFSTR("bulk_delay_scaled_max"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v27, "floatValue");
      bulk_delay_scaled_max = v28;
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKey:", CFSTR("bulk_delay"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v30, "floatValue");
      bulk_delay = v31;
    }

    if (sIsInternalInstall)
      SISetLogging();
    CFNotificationCenterGetDistributedCenter();
    RunLoopSource = IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)queryPowerState, 0);
    if (RunLoopSource)
    {
      v33 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v33, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      CFRelease(v33);
    }
    queryPowerState();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreSpotlight"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pathForResource:ofType:", CFSTR("schema"), CFSTR("mdplist"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = open((const char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"), 0);
      if (v38 != -1)
      {
        v39 = v38;
        memset(&v44, 0, sizeof(v44));
        if (!fstat(v38, &v44))
        {
          v42 = mmap(0, v44.st_size, 1, 1, v39, 0);
          if (v42 != (void *)-1)
          {
            v43 = v42;
            gDefaultSchemaPlistBytes = _MDPlistContainerCreateWithBytes();
            if (!gDefaultSchemaPlistBytes)
              munmap(v43, v44.st_size);
          }
        }
        close(v39);
      }
    }
    if (gDefaultSchemaPlistBytes)
    {
      v40 = v37;
    }
    else
    {
      objc_msgSend(v35, "pathForResource:ofType:", CFSTR("schema"), CFSTR("plist"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v40);
        if (v41)
          gDefaultSchemaPlistBytes = _MDPlistContainerCreateWithObject();

      }
      if (!gDefaultSchemaPlistBytes)
        goto LABEL_40;
    }
    _MDPlistContainerGetBytes();
    _MDPlistContainerGetLength();
    SISetDefaultSchemaData();
LABEL_40:
    _SISetCoreSpotlightRelatedItemCallback();
    _SISetCoreSpotlightCopyBundleRemapCallback();
    LOBYTE(v44.st_dev) = 0;
    CFPreferencesGetAppBooleanValue(CFSTR("SpotlightTraceDetailed"), (CFStringRef)*MEMORY[0x24BDBD580], (Boolean *)&v44);

  }
}

- (SPConcreteCoreSpotlightIndexer)initWithQueue:(id)a3 protectionClass:(id)a4 cancelPtr:(int *)a5
{
  id v9;
  id v10;
  SPConcreteCoreSpotlightIndexer *v11;
  SPConcreteCoreSpotlightIndexer *v12;
  uint64_t v13;
  NSMapTable *checkedInClients;
  NSMutableSet *v15;
  NSMutableSet *reindexAllDelegateBundleIDs;
  NSMutableSet *v17;
  NSMutableSet *assertedBundleIds;
  id v19;
  const char *v20;
  void *v21;
  id v22;
  _QWORD handler[4];
  id v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SPConcreteCoreSpotlightIndexer;
  v11 = -[SPConcreteCoreSpotlightIndexer init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataclass, a4);
    objc_storeStrong((id *)&v12->_indexQueue, a3);
    v12->_cancelPtr = a5;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    checkedInClients = v12->_checkedInClients;
    v12->_checkedInClients = (NSMapTable *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    reindexAllDelegateBundleIDs = v12->_reindexAllDelegateBundleIDs;
    v12->_reindexAllDelegateBundleIDs = v15;

    v12->_hasAssertion = 0;
    v12->_assertionEndTime = 0.0;
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    assertedBundleIds = v12->_assertedBundleIds;
    v12->_assertedBundleIds = v17;

    v12->_dirtyTimeout = 256;
    -[SPConcreteCoreSpotlightIndexer _indexMaintenanceActivityName](v12, "_indexMaintenanceActivityName");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    v21 = (void *)*MEMORY[0x24BDAC5A0];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __74__SPConcreteCoreSpotlightIndexer_initWithQueue_protectionClass_cancelPtr___block_invoke;
    handler[3] = &unk_24D0EA960;
    v25 = v19;
    v22 = v19;
    xpc_activity_register(v20, v21, handler);

  }
  return v12;
}

void __74__SPConcreteCoreSpotlightIndexer_initWithQueue_protectionClass_cancelPtr___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  xpc_activity_state_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  state = xpc_activity_get_state(activity);
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = state;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "Checking in XPC activity:%@, state:%lu", (uint8_t *)&v6, 0x16u);
  }

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Should not have an index at this point: '%@'", v5);

  OUTLINED_FUNCTION_11();
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_306(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  qos_class_t v4;
  int v5;
  int v6;
  CFAbsoluteTime v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  __int128 v13;
  _BYTE *v14;
  uint64_t v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  CFAbsoluteTime v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v4 = qos_class_self();
    v5 = s_last_memory_pressure_status;
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    LOWORD(v20) = 1024;
    *(_DWORD *)((char *)&v20 + 2) = v6;
    HIWORD(v20) = 2048;
    v21 = v7;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Index %@ qos: %d status: %d retry: %d inactive after %gs", buf, 0x28u);
  }

  if (CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(a1 + 32) + 184) >= (double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 208))
  {
    v10 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = COERCE_DOUBLE(__Block_byref_object_dispose_);
    v22 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_cancelIdleTimer");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "commitUpdates:", v10);
    dispatch_get_global_queue(9, 2uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_313;
    block[3] = &unk_24D0EAF50;
    v13 = *(_OWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v14 = buf;
    dispatch_group_notify(v10, v11, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_onceToken != -1)
      dispatch_once(&PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_onceToken, &__block_literal_global_308);
    v8 = PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_sDASQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_2;
    v16[3] = &unk_24D0EAFA0;
    v17 = *(_OWORD *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 48);
    _setup_block(v16, 0, 1691);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, v9);

  }
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_307()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DASqueue", 0);
  v1 = (void *)PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_sDASQueue;
  PHOTOS_INDEX_VERSION_CHANGE_block_invoke_2_sDASQueue = (uint64_t)v0;

}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  char v9;

  objc_msgSend(MEMORY[0x24BE2E230], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("com.apple.searchd.index.commit"), *MEMORY[0x24BE2E2A0], 0);

  v4 = sIndexQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_3;
  v6[3] = &unk_24D0EAF78;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  _setup_block(v6, 0, 1690);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v5);

}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 *p_buf;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(v2 + 216))
    {
      v3 = dispatch_group_create();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy_;
      v18 = __Block_byref_object_dispose_;
      v19 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_cancelIdleTimer");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "commitUpdates:", v3);
      dispatch_get_global_queue(9, 2uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_4;
      v11[3] = &unk_24D0EAF50;
      v12 = *(_OWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      p_buf = &buf;
      dispatch_group_notify(v3, v4, v11);

      _Block_object_dispose(&buf, 8);
    }
  }
  else if (*(_QWORD *)(v2 + 176) && *(_QWORD *)(v2 + 216))
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Index %@ delay commit", (uint8_t *)&buf, 0xCu);
    }

    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
    v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x12A05F200uLL);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v9 + 208);
    if (v10 >= 0x21)
      *(_QWORD *)(v9 + 208) = v10 >> 1;
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  CFAbsoluteTime v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  CFAbsoluteTime v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 138412802;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Index %@ retry: %d commit complete after %gs", (uint8_t *)&v8, 0x1Cu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_313(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  CFAbsoluteTime v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  CFAbsoluteTime v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 138412802;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Index %@ retry: %d commit complete after %gs", (uint8_t *)&v8, 0x1Cu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)dirty
{
  -[SPConcreteCoreSpotlightIndexer dirty:](self, "dirty:", 1);
}

- (id)_indexPath
{
  void *v3;
  void *v4;
  NSString *dataclass;
  void *v6;

  objc_msgSend((id)sDelegate, "indexDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dataclass = self->_dataclass;
  if (!dataclass)
    dataclass = (NSString *)*MEMORY[0x24BDD0CE0];
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("/%@/%@"), dataclass, CFSTR("index.spotlightV2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_performXPCActivity:(id)a3 name:(id)a4
{
  _xpc_activity_s *v6;
  id v7;
  xpc_activity_state_t state;
  xpc_activity_state_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  _xpc_activity_s *v16;
  id v17;
  xpc_activity_state_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  xpc_activity_state_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (_xpc_activity_s *)a3;
  v7 = a4;
  state = xpc_activity_get_state(v6);
  v9 = state;
  if (state == 2 || state == 4)
  {
    logForCSLogCategoryIndex();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%@, state:%lu", buf, 0x16u);
    }

    if (v9 == 2)
    {
      xpc_activity_set_state(v6, 4);
LABEL_15:
      v13 = sIndexQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke;
      v15[3] = &unk_24D0EAA28;
      v15[4] = self;
      v16 = v6;
      v17 = v7;
      v18 = v9;
      _setup_block(v15, 0, 1784);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v13, v14);

      goto LABEL_16;
    }
    if (!xpc_activity_should_defer(v6) || !xpc_activity_set_state(v6, 3))
      goto LABEL_15;
    logForCSLogCategoryIndex();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2048;
      v22 = v9;
      v12 = "Deferring XPC activity:%@, state:%ld";
      goto LABEL_9;
    }
  }
  else
  {
    logForCSLogCategoryIndex();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2048;
      v22 = v9;
      v12 = "Ignored XPC activity:%@, state:%lu";
LABEL_9:
      _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
    }
  }

LABEL_16:
}

void __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "outstandingMaintenance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "outstandingMaintenance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "outstandingMaintenance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

    buf[0] = 0;
    v8 = dispatch_group_create();
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint8_t *, NSObject *))(v6 + 16))(v6, objc_msgSend(*(id *)(a1 + 32), "index"), *(_QWORD *)(a1 + 40), buf, v8);
    v9 = sIndexQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke_318;
    v14[3] = &unk_24D0EA8C0;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = *(id *)(a1 + 48);
    _setup_block(v14, 0, 1783);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v8, v9, v11);

  }
  else
  {
    objc_msgSend(v4, "setOutstandingMaintenance:", 0);
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2048;
      v20 = v13;
      _os_log_impl(&dword_213CF1000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%@ as done, state:%ld", buf, 0x16u);
    }
  }

}

uint64_t __59__SPConcreteCoreSpotlightIndexer__performXPCActivity_name___block_invoke_318(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performXPCActivity:name:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_indexMaintenanceActivityName
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.searchd.indexmaintenance.%@"), self->_dataclass);
}

- (void)scheduleMaintenance:(id)a3 description:(id)a4 forDarkWake:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSString *dataclass;
  const __CFString *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v5)
      v12 = CFSTR("YES");
    v20 = dataclass;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling maintenance for dataclass:%@, forDarkWake:%@, description:%@", buf, 0x20u);
  }

  v13 = sIndexQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke;
  v16[3] = &unk_24D0EB018;
  v16[4] = self;
  v17 = v8;
  v18 = v5;
  v14 = v8;
  _setup_block(v16, 0, 1823);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v13, v15);

}

void __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD handler[4];
  id v15;
  id v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "outstandingMaintenance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "outstandingMaintenance");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x2199C2F34](*(_QWORD *)(a1 + 40));
    objc_msgSend(v13, "addObject:", v3);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(a1 + 32), "setOutstandingMaintenance:", v4);

    objc_msgSend(*(id *)(a1 + 32), "outstandingMaintenance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x2199C2F34](*(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_indexMaintenanceActivityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Registering XPC activity:%@", buf, 0xCu);
    }

    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x24BDAC598], 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x24BDAC688], *(_BYTE *)(a1 + 48));
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x24BDAC5B8], 0);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC630]);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v10 = objc_retainAutorelease(v7);
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke_325;
    handler[3] = &unk_24D0EAFF0;
    objc_copyWeak(&v16, (id *)buf);
    v12 = v10;
    v15 = v12;
    xpc_activity_register(v11, v9, handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
}

void __78__SPConcreteCoreSpotlightIndexer_scheduleMaintenance_description_forDarkWake___block_invoke_325(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_performXPCActivity:name:", v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Set XPC activity:%@ DONE since indexer was released", (uint8_t *)&v9, 0xCu);
    }

    xpc_activity_set_state(v3, 5);
  }

  objc_autoreleasePoolPop(v4);
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_331(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_331_cold_1();

  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  SPCoreSpotlightIndexerTask *v20;
  void *v21;
  SPCoreSpotlightIndexerTask *v22;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, int, uint64_t, unsigned int);
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (a3 == 1)
  {
    logForCSLogCategoryIndex();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_334_cold_1(a1, v10, v13);
    goto LABEL_11;
  }
  if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 48))
  {
    _MDStoreOIDArrayGetVectorCount();
    v11 = (void *)objc_opt_new();
    v12 = MEMORY[0x24BDAC760];
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_2;
    v30 = &unk_24D0EB088;
    v32 = a6;
    v13 = v11;
    v31 = v13;
    _MDStoreOIDArrayApplyBlock();
    if (-[NSObject count](v13, "count"))
    {
      logForCSLogCategoryIndex();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = -[NSObject count](v13, "count");
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v37 = v15;
        v38 = 2112;
        v39 = v16;
        _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (journal)", buf, 0x16u);
      }

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
      objc_msgSend(v10, "dataclass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setProtectionClasses:", v19);

      objc_msgSend(v17, "setIdentifiersToReindex:", v13);
      v20 = [SPCoreSpotlightIndexerTask alloc];
      v34 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v20, "initWithIndexJob:indexers:", v17, v21);

      v33 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexerTask setBundleIDs:](v22, "setBundleIDs:", v23);

      -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v22, "setDataMigrationStage:", *(_QWORD *)(a1 + 56));
      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_336;
      v24[3] = &unk_24D0EA9D8;
      v25 = v13;
      v26 = *(id *)(a1 + 32);
      objc_msgSend(v10, "performIndexerTask:completionHandler:", v22, v24);

    }
LABEL_11:

  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a3 == 2781)
  {
    v13 = (id)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a5 >= 2)
    {
      v7 = a5;
      v8 = *MEMORY[0x24BDBD430];
      for (i = 1; i != v7; ++i)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11 != v8)
          {
            if (v11)
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
          }

        }
      }
    }

  }
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_336(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134218242;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (journal)", (uint8_t *)&v5, 0x16u);
  }

}

- (void)whenFinishedDraining:(id)a3
{
  NSMutableArray *blocksToRunWhenFinishedDraining;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&sDrainedLock);
  if (self->_finishedDrainingJournal)
  {
    os_unfair_lock_unlock(&sDrainedLock);
    v8[2](v8, 1);
  }
  else
  {
    blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    if (!blocksToRunWhenFinishedDraining)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v6 = self->_blocksToRunWhenFinishedDraining;
      self->_blocksToRunWhenFinishedDraining = v5;

      blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    }
    v7 = (void *)objc_msgSend(v8, "copy");
    -[NSMutableArray addObject:](blocksToRunWhenFinishedDraining, "addObject:", v7);

    os_unfair_lock_unlock(&sDrainedLock);
  }

}

- (void)fixupPathTimeouts
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_9_0(&dword_213CF1000, a3, (uint64_t)a3, "Starting pathFixup query pc: %@", (uint8_t *)a2);

}

void __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == 1)
    {
      logForCSLogCategoryIndex();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_cold_1(v6, v7);

    }
    else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 40))
    {
      _MDStoreOIDArrayGetVectorCount();
      _MDStoreOIDArrayApplyBlock();
    }
  }

}

uint64_t __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a5 - 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataclass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109378;
    v11[1] = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "SIFixupPaths count: %d pc: %@", (uint8_t *)v11, 0x12u);

  }
  return SIFixupPaths();
}

- (void)indexFinishedDrainingJournal
{
  __SI *v3;
  __SI *v4;
  NSMutableArray *v5;
  NSMutableArray *blocksToRunWhenFinishedDraining;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20[2];
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SPConcreteCoreSpotlightIndexer indexFinishedDrainingJournal:](self, "indexFinishedDrainingJournal:", 0);
  v3 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v3 && !self->_readOnly && !self->_suspended && !self->_suspending)
  {
    v4 = v3;
    os_unfair_lock_lock(&sDrainedLock);
    -[SPConcreteCoreSpotlightIndexer setFinishedDrainingJournal:](self, "setFinishedDrainingJournal:", 1);
    v5 = self->_blocksToRunWhenFinishedDraining;
    blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
    self->_blocksToRunWhenFinishedDraining = 0;

    os_unfair_lock_unlock(&sDrainedLock);
    if (v5)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v5;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v23;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v7);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10++) + 16))();
          }
          while (v8 != v10);
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v8);
      }

    }
    objc_msgSend((id)sDelegate, "indexAvailableForProtectionClass:newIndex:", self->_dataclass, 0);
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    location = 0;
    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke;
    v18 = &unk_24D0EB128;
    objc_copyWeak(v20, &location);
    v20[1] = v4;
    v12 = v11;
    v19 = v12;
    v13 = (void *)MEMORY[0x2199C2F34](&v15);
    v26 = CFSTR("_kMDItemExternalID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1, v15, v16, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v4, CFSTR("_kMDItemBundleID=\"com.apple.searchd\"), v14, v13);

    -[SPConcreteCoreSpotlightIndexer fixupPathTimeouts](self, "fixupPathTimeouts");
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

  }
}

void __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a3 == 1)
  {
    if (objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 48))
      objc_msgSend(v7, "addClients:", *(_QWORD *)(a1 + 32));
  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 48))
  {
    _MDStoreOIDArrayGetVectorCount();
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();

    _Block_object_dispose(v9, 8);
  }

}

void __62__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = (void *)_MDPlistBytesCopyPlistAtIndex();
  if (v7)
    v8 = a5 >= 2;
  else
    v8 = 0;
  if (v8)
  {
    v9 = a5;
    v10 = 1;
    v13 = v7;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
      v7 = v13;
      ++v10;
    }
    while (v9 != v10);
  }

}

- (void)removeExpiredItemsForBundleId:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  CFAbsoluteTime v17;

  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke;
  v14[3] = &unk_24D0EAA28;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = Current;
  v9 = v7;
  v10 = v6;
  v11 = (void *)MEMORY[0x2199C2F34](v14);
  v12 = sIndexQueue;
  _setup_block(v11, 0, 2260);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v9, v12, v13);

}

void __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  id v16[2];
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "index");
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_2;
  v13 = &unk_24D0EB198;
  objc_copyWeak(v16, &location);
  v16[1] = v2;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v3 = (void *)MEMORY[0x2199C2F34](&v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@=\"%@\" && %@<=$time.absolute(%f))"), CFSTR("_kMDItemBundleID"), *(_QWORD *)(a1 + 40), *MEMORY[0x24BDC1D40], *(_QWORD *)(a1 + 56), v10, v11, v12, v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v5 = *(void **)(a1 + 32);
  v19[0] = CFSTR("_kMDItemExternalID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v5, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v2, v4, v6, v8, v3);
  if (v7)

  if ((v9 & 1) == 0)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id WeakRetained;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 56))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_3;
    v12[3] = &unk_24D0EB150;
    v11 = v10;
    v13 = v11;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v12);
    if (objc_msgSend(v11, "count"))
      objc_msgSend(WeakRetained, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", 0, v11, 0, 0, 0, *(_QWORD *)(a1 + 32), 0, &__block_literal_global_343);

  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_removeExpiredItemsForBundleId_group___block_invoke_3(uint64_t result, _QWORD *a2)
{
  if (*a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

- (void)revokeExpiredItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __SI *v7;
  __SI *v8;
  CFAbsoluteTime Current;
  dispatch_group_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29[2];
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  NSObject *v33;
  id v34[3];
  id location;
  _QWORD v36[3];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "dataMigrationStage");
  v7 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v7)
  {
    v8 = v7;
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - self->_lastTTLPass >= 21600.0)
    {
      self->_lastTTLPass = Current;
      v10 = dispatch_group_create();
      v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      location = 0;
      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke;
      v30[3] = &unk_24D0EB238;
      objc_copyWeak(v34, &location);
      v34[1] = v8;
      v26 = v11;
      v31 = v26;
      v34[2] = v6;
      v25 = v10;
      v32 = v25;
      v12 = v4;
      v33 = v12;
      v13 = (void *)MEMORY[0x2199C2F34](v30);
      v14 = *MEMORY[0x24BDC2318];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("((%@<=$time.absolute(%f)) && (%@!=*)) || (%@<=$time.absolute(%f))"), *MEMORY[0x24BDC1D40], Current + 86400.0, *MEMORY[0x24BDC2318], *MEMORY[0x24BDC1D40], *(_QWORD *)&Current);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);
      v37[0] = CFSTR("_kMDItemBundleID");
      v37[1] = CFSTR("_kMDItemExternalID");
      v37[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v8, v15, v16, v13);

      if ((v10 & 1) == 0)
        dispatch_group_leave(v12);
      -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD0CD0]);

      if (v18)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_351;
        v27[3] = &unk_24D0EB128;
        objc_copyWeak(v29, &location);
        v29[1] = v8;
        v19 = v12;
        v28 = v19;
        v20 = (void *)MEMORY[0x2199C2F34](v27);
        dispatch_group_enter(v19);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), *MEMORY[0x24BDC1AE8], CFSTR("com.apple.spotlight.category"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = *MEMORY[0x24BDC2130];
        v36[0] = CFSTR("_kMDItemExternalID");
        v36[1] = v22;
        v36[2] = *MEMORY[0x24BDC2128];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v8, v21, v23, &unk_24D0FCF40, v20);

        if (!v24)
          dispatch_group_leave(v19);

        objc_destroyWeak(v29);
      }
      else
      {
        v21 = v15;
      }

      objc_destroyWeak(v34);
      objc_destroyWeak(&location);

    }
  }

}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  SPCoreSpotlightIndexerTask *v18;
  void *v19;
  SPCoreSpotlightIndexerTask *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _BYTE v52[24];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (a3 == 1)
  {
    v22 = sIndexQueue;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_348;
    v25[3] = &unk_24D0EB210;
    v23 = *(NSObject **)(a1 + 40);
    v26 = *(id *)(a1 + 32);
    objc_copyWeak(&v28, (id *)(a1 + 56));
    v27 = *(id *)(a1 + 48);
    _setup_block(v25, 0, 2358);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v23, v22, v24);

    objc_destroyWeak(&v28);
  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 64))
  {
    v46 = 0;
    v47[0] = &v46;
    v47[1] = 0x3032000000;
    v47[2] = __Block_byref_object_copy_;
    v47[3] = __Block_byref_object_dispose_;
    v48 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    v12 = MEMORY[0x24BDAC760];
    v45 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2;
    v33[3] = &unk_24D0EB1E8;
    v13 = *(id *)(a1 + 32);
    v37 = &v46;
    v38 = &v40;
    v34 = v13;
    v35 = v11;
    v39 = *(_QWORD *)(a1 + 72);
    v36 = *(id *)(a1 + 40);
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 3, 0, v33);
    if (objc_msgSend((id)v41[5], "count"))
    {
      logForCSLogCategoryIndex();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_cold_1((uint64_t)v47, (uint64_t)v52, objc_msgSend((id)v41[5], "count"), v14);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
      objc_msgSend(v15, "setIdentifiersToReindex:", v41[5]);
      objc_msgSend(v11, "dataclass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProtectionClasses:", v17);

      v18 = [SPCoreSpotlightIndexerTask alloc];
      v50 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v18, "initWithIndexJob:indexers:", v15, v19);

      v49 = *(_QWORD *)(v47[0] + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexerTask setBundleIDs:](v20, "setBundleIDs:", v21);

      -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v20, "setDataMigrationStage:", *(_QWORD *)(a1 + 72));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_347;
      v29[3] = &unk_24D0EB1C0;
      v31 = &v40;
      v32 = &v46;
      v30 = *(id *)(a1 + 40);
      objc_msgSend(v11, "performIndexerTask:completionHandler:", v20, v29);

    }
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&v46, 8);
  }

}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  SPCoreSpotlightIndexerTask *v14;
  void *v15;
  SPCoreSpotlightIndexerTask *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int8x16_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)a2;
  v5 = *(id *)a2;
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 16);
    if (v6 == *MEMORY[0x24BDBD430] || v6 == 0)
    {
      v8 = *(id *)(a2 + 8);
      if (v8)
      {
        v9 = v8;
        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isEqual:", v5) & 1) == 0)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
          {
            logForCSLogCategoryIndex();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_cold_1();

            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
            objc_msgSend(*(id *)(a1 + 40), "dataclass");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v12;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setProtectionClasses:", v13);

            objc_msgSend(v11, "setIdentifiersToReindex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v14 = [SPCoreSpotlightIndexerTask alloc];
            v26 = *(_QWORD *)(a1 + 40);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v14, "initWithIndexJob:indexers:", v11, v15);

            v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPCoreSpotlightIndexerTask setBundleIDs:](v16, "setBundleIDs:", v17);

            -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v16, "setDataMigrationStage:", *(_QWORD *)(a1 + 72));
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v22[0] = MEMORY[0x24BDAC760];
            v22[1] = 3221225472;
            v22[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_346;
            v22[3] = &unk_24D0EB1C0;
            v24 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            v18 = *(void **)(a1 + 40);
            v23 = *(id *)(a1 + 48);
            objc_msgSend(v18, "performIndexerTask:completionHandler:", v16, v22);

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
          v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v9);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }

}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_346(uint64_t a1)
{
  NSObject *v2;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_346_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_347(uint64_t a1)
{
  NSObject *v2;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_346_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_348(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(WeakRetained, "removeExpiredItemsForBundleId:group:", v7, *(_QWORD *)(a1 + 40), (_QWORD)v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_351(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  __CFString *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 48))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    v21 = (id)objc_opt_new();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_3;
    v12[3] = &unk_24D0EB260;
    v13 = CFSTR("com.apple.spotlight.category");
    v14 = &v22;
    v15 = &v16;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 3, 0, v12);
    if (objc_msgSend((id)v23[5], "count") || objc_msgSend((id)v17[5], "count"))
      objc_msgSend(v11, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", v23[5], v17[5], 0, 0, 0, CFSTR("com.apple.spotlight.category"), 0, 0);

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

  }
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_3(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v7 = objc_msgSend(v6, "count");
  if (v7 != objc_msgSend(v5, "count"))
  {
LABEL_15:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v4);
    goto LABEL_16;
  }
  v25 = a1;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v5);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v6);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "count");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
    {
      v13 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v14, 86400.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "earlierDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 != v9)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v17);

        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObject:", v18);

      }
    }
  }
  if (!objc_msgSend(v8, "count"))
  {

    a1 = v25;
    goto LABEL_15;
  }
  v19 = objc_msgSend(v8, "count");
  if (v19 != objc_msgSend(v5, "count"))
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setUniqueIdentifier:", v4);
    objc_msgSend(v20, "setBundleID:", *(_QWORD *)(v25 + 32));
    v21 = objc_alloc(MEMORY[0x24BDC2480]);
    v22 = *MEMORY[0x24BDC2128];
    v27[0] = *MEMORY[0x24BDC2130];
    v27[1] = v22;
    v28[0] = v8;
    v28[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithAttributes:", v23);
    objc_msgSend(v20, "setAttributeSet:", v24);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v25 + 40) + 8) + 40), "addObject:", v20);
  }

LABEL_16:
}

- (void)requestRequiresImportWithoutSandboxExtension:(id)a3 maxCount:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  __SI *v9;
  dispatch_group_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26[4];
  _QWORD v27[4];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  id location;
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "requestRequiresImportWithoutSandboxExtension", buf, 2u);
  }

  -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "dataMigrationStage");
  v9 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v9)
  {
    v10 = dispatch_group_create();
    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    location = 0;
    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v20[0] = MEMORY[0x24BDAC760];
    v27[3] = 0;
    v20[2] = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke;
    v20[3] = &unk_24D0EB2B0;
    v20[1] = 3221225472;
    objc_copyWeak(v26, &location);
    v24 = buf;
    v25 = v27;
    v26[1] = v9;
    v26[2] = v8;
    v12 = v10;
    v21 = v12;
    v13 = v11;
    v22 = v13;
    v26[3] = (id)a4;
    v14 = v19;
    v23 = v14;
    v15 = (void *)MEMORY[0x2199C2F34](v20);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemRequiresImport==1 && _kMDItemImportComplete!=* && (_kMDItemImportHasSandboxExtension==0 || _kMDItemImportHasSandboxExtension!=*) && kMDItemFileProviderID!=*"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v14);
    v33[0] = CFSTR("_kMDItemBundleID");
    v33[1] = CFSTR("_kMDItemExternalID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v9, v16, v17, v15);

    if (!v18)
      dispatch_group_leave(v14);

    objc_destroyWeak(v26);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);

  }
}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  SPCoreSpotlightIndexerTask *v19;
  void *v20;
  SPCoreSpotlightIndexerTask *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  __int128 *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  __int128 v46;
  __int128 *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (a3 == 1)
  {
    v23 = *(_QWORD *)(a1 + 96);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= v23)
    {
      v29 = v23 << (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0);
      v30 = *(NSObject **)(a1 + 32);
      v31 = sIndexQueue;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_362;
      v36[3] = &unk_24D0EABF0;
      v36[4] = WeakRetained;
      v37 = *(id *)(a1 + 48);
      v38 = v29;
      _setup_block(v36, 0, 2541);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v30, v31, v32);

    }
    else
    {
      logForCSLogCategoryDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        LODWORD(v63) = 134217984;
        *(_QWORD *)((char *)&v63 + 4) = v25;
        _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_DEFAULT, "Completed sandbox items query (%ld processed)", (uint8_t *)&v63, 0xCu);
      }

      v26 = *(NSObject **)(a1 + 32);
      v27 = sIndexQueue;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_363;
      v33[3] = &unk_24D0EACF8;
      v35 = *(_QWORD *)(a1 + 64);
      v34 = *(id *)(a1 + 48);
      _setup_block(v33, 0, 2547);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v26, v27, v28);

    }
  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 80))
  {
    *(_QWORD *)&v63 = 0;
    *((_QWORD *)&v63 + 1) = &v63;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy_;
    v66 = __Block_byref_object_dispose_;
    v67 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy_;
    v54 = __Block_byref_object_dispose_;
    v55 = 0;
    v12 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_2;
    v43[3] = &unk_24D0EB288;
    v46 = *(_OWORD *)(a1 + 56);
    v47 = &v63;
    v48 = &v50;
    v43[4] = v11;
    v49 = *(_QWORD *)(a1 + 88);
    v44 = *(id *)(a1 + 32);
    v45 = *(id *)(a1 + 40);
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 2, 0, v43);
    if (objc_msgSend((id)v51[5], "count"))
    {
      logForCSLogCategoryDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend((id)v51[5], "count");
        v15 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 40);
        *(_DWORD *)buf = 134218242;
        v60 = v14;
        v61 = 2112;
        v62 = v15;
        _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (sandbox items)", buf, 0x16u);
      }

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
      objc_msgSend(v11, "dataclass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setProtectionClasses:", v18);

      objc_msgSend(v16, "setIdentifiersToReindex:", v51[5]);
      v19 = [SPCoreSpotlightIndexerTask alloc];
      v57 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v19, "initWithIndexJob:indexers:", v16, v20);

      v56 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexerTask setBundleIDs:](v21, "setBundleIDs:", v22);

      -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v21, "setDataMigrationStage:", *(_QWORD *)(a1 + 88));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_361;
      v39[3] = &unk_24D0EB1C0;
      v41 = &v50;
      v42 = &v63;
      v40 = *(id *)(a1 + 32);
      objc_msgSend(v11, "performIndexerTask:completionHandler:", v21, v39);

    }
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&v63, 8);
  }

}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_2(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  SPCoreSpotlightIndexerTask *v14;
  void *v15;
  SPCoreSpotlightIndexerTask *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  int8x16_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v4 = *a2;
  v5 = *a2;
  if (v5)
  {
    v6 = a2[1];
    if (v6)
    {
      v7 = v6;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqual:", v5) & 1) == 0)
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
        {
          logForCSLogCategoryDefault();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
            v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            *(_DWORD *)buf = 134218242;
            v32 = v9;
            v33 = 2112;
            v34 = v10;
            _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "Request reimport of %ld items for bundleID:%@ (sandbox items)", buf, 0x16u);
          }

          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
          objc_msgSend(*(id *)(a1 + 32), "dataclass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setProtectionClasses:", v13);

          objc_msgSend(v11, "setIdentifiersToReindex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v14 = [SPCoreSpotlightIndexerTask alloc];
          v29 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v14, "initWithIndexJob:indexers:", v11, v15);

          v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPCoreSpotlightIndexerTask setBundleIDs:](v16, "setBundleIDs:", v17);

          -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v16, "setDataMigrationStage:", *(_QWORD *)(a1 + 88));
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          v22 = MEMORY[0x24BDAC760];
          v23 = 3221225472;
          v24 = __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_360;
          v25 = &unk_24D0EB1C0;
          v27 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
          v18 = *(void **)(a1 + 32);
          v26 = *(id *)(a1 + 40);
          objc_msgSend(v18, "performIndexerTask:completionHandler:", v16, &v22);

        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v4);
        v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v7, v22, v23, v24, v25);

    }
  }

}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_360(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5 = 134218242;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (sandbox items)", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_361(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5 = 134218242;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Done reimporting %ld items for bundleID:%@ (sandbox items)", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_362(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "requestRequiresImportWithoutSandboxExtension:maxCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __88__SPConcreteCoreSpotlightIndexer_requestRequiresImportWithoutSandboxExtension_maxCount___block_invoke_363(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Done reimporting sandbox items (%ld processed)", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_expireCorruptIndexFilesWithPath:(id)a3 keepLatest:(BOOL)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double Current;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  BOOL v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)v5;
  if (v5 && v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v36 = v8;
    objc_msgSend(v8, "enumeratorAtPath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        objc_msgSend(v10, "skipDescendants");
        if (!objc_msgSend(v12, "rangeOfString:", v7))
        {
          objc_msgSend(v12, "substringFromIndex:", v13);
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v15 = strtoull((const char *)objc_msgSend(v14, "UTF8String"), 0, 10);

          if (v15 + 1 >= 2)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        objc_msgSend(v10, "nextObject");
        v17 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v17;
      }
      while (v17);
    }
    if (objc_msgSend(v9, "count"))
    {
      v34 = v9;
      v35 = v4;
      objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reverseObjectEnumerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v19, "nextObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = 0;
        do
        {
          objc_msgSend(v22, "doubleValue");
          v26 = (Current - v24 <= 864000.0 || v24 >= Current) && v23 == 0;
          if (v26 && a4)
          {
            v23 = 1;
          }
          else
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%llu"), v7, objc_msgSend(v22, "unsignedLongLongValue"));
            objc_msgSend(v38, "stringByAppendingPathComponent:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0;
            v29 = objc_msgSend(v36, "removeItemAtPath:error:", v28, &v39);
            v30 = v39;
            logForCSLogCategoryIndex();
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if ((v29 & 1) != 0)
            {
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v28;
                _os_log_impl(&dword_213CF1000, v32, OS_LOG_TYPE_DEFAULT, "Expired corrupt index at path:%@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v41 = v28;
              v42 = 2112;
              v43 = v30;
              _os_log_error_impl(&dword_213CF1000, v32, OS_LOG_TYPE_ERROR, "Failed to remove path:%@, error:%@", buf, 0x16u);
            }

          }
          objc_msgSend(v19, "nextObject");
          v33 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v33;
        }
        while (v33);
      }

      v9 = v34;
      v4 = v35;
    }

  }
}

- (void)writeIndexSuccessfulOpenDate:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  indexOpenRecordPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("pc%@_lastOpen"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_wrlock(&sIndexOpenRecordLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v5);

  if (v10)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v5);
  else
    newIndexOpensDict();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_24D0FCF70, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD0CF0];
      v20[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createFileAtPath:contents:attributes:", v5, 0, v14);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "writeToURL:error:", v15, &v18);
    v16 = v18;

    if (v16)
    {
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexSuccessfulOpenDate:].cold.1();

    }
  }
  pthread_rwlock_unlock(&sIndexOpenRecordLock);

}

- (void)writeIndexDropAnalyticsDate:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  indexOpenRecordPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("pc%@_lastAnalytics"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_wrlock(&sIndexOpenRecordLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v5);

  if (v10)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v5);
  else
    newIndexOpensDict();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_24D0FCF70, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD0CF0];
      v20[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createFileAtPath:contents:attributes:", v5, 0, v14);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "writeToURL:error:", v15, &v18);
    v16 = v18;

    if (v16)
    {
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexDropAnalyticsDate:].cold.1();

    }
  }
  pthread_rwlock_unlock(&sIndexOpenRecordLock);

}

- (int)shouldNotLogIndexDrop:(id)a3 ignoreParentDirectoryAge:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
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
  void *v17;
  uint64_t v18;
  __CFString *v19;
  int FileSystemRepresentation;
  uint64_t v21;
  int v22;
  void *v23;
  double v24;
  stat v27;
  char buffer[1024];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  indexOpenRecordPath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("pc%@_lastOpen"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("pc%@_lastAnalytics"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_rdlock(&sIndexOpenRecordLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v13, "fileExistsAtPath:", v6);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "longValue");

    pthread_rwlock_unlock(&sIndexOpenRecordLock);
    if (v16 <= v18)
    {
      v22 = 2;
    }
    else
    {
      bzero(buffer, 0x400uLL);
      objc_msgSend((id)sDelegate, "indexDirectory");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      FileSystemRepresentation = CFStringGetFileSystemRepresentation(v19, buffer, 1024);

      if (FileSystemRepresentation && (memset(&v27, 0, sizeof(v27)), !stat(buffer, &v27)))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSince1970");
        v21 = (uint64_t)v24 - v27.st_birthtimespec.tv_sec;

      }
      else
      {
        v21 = -1;
      }
      if (v21 > 3600 || v4)
        v22 = 0;
      else
        v22 = 3;
    }

  }
  else
  {
    pthread_rwlock_unlock(&sIndexOpenRecordLock);
    v22 = 1;
  }

  return v22;
}

- (void)writeIndexCreationDate:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  stat v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  indexHeartbeatPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("pc%@_age"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v5);

  if (v10)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v5);
  else
    newHeartbeatDict();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("parentDirectory_age"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("parentDirectory_age")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "longValue"),
        v14,
        v13,
        v15 <= 0))
  {
    memset(&v27, 0, sizeof(v27));
    objc_msgSend((id)sDelegate, "indexDirectory");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = stat((const char *)objc_msgSend(v16, "UTF8String"), &v27);

    v18 = *__error();
    if (v17)
    {
      logForCSLogCategoryDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v27.st_birthtimespec.tv_sec);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("parentDirectory_age"));
    }

    *__error() = v18;
  }
  if (objc_msgSend(&unk_24D0FCF58, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x24BDD0CF0];
      v29[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "createFileAtPath:contents:attributes:", v5, 0, v22);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v11, "writeToURL:error:", v23, &v26);
    v24 = v26;

    if (v24)
    {
      logForCSLogCategoryDefault();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:].cold.1();

    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

}

- (void)writeSDBObjectCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  indexHeartbeatPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("pc%@_obj_count"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v5);

  if (v10)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v5);
  else
    newHeartbeatDict();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_24D0FCF58, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD0CF0];
      v20[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createFileAtPath:contents:attributes:", v5, 0, v14);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "writeToURL:error:", v15, &v18);
    v16 = v18;

    if (v16)
    {
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeSDBObjectCount:].cold.1();

    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

}

- (void)incrementIndexWipeCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  indexHeartbeatPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("pc%@_wipes"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24D0FD2E8, "objectForKeyedSubscript:", self->_dataclass);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("pc%@_wipes_aggregate"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v3);

  if (v11)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
  else
    newHeartbeatDict();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_24D0FCF58, "containsObject:", v6)
    && objc_msgSend(&unk_24D0FCF58, "containsObject:", v9))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longValue") + 1;

    }
    else
    {
      v15 = 1;
    }

    v16 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v6);

    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "longValue") + 1;

      v16 = 0x24BDD1000;
    }
    else
    {
      v20 = 1;
    }

    objc_msgSend(*(id *)(v16 + 1760), "numberWithLong:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v9);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x24BDD0CF0];
      v29[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "createFileAtPath:contents:attributes:", v3, 0, v23);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v12, "writeToURL:error:", v24, &v27);
    v25 = v27;

    if (v25)
    {
      logForCSLogCategoryDefault();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:].cold.1();

    }
  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

}

- (id)indexLossAnalyticsDictWithPreviousIndexCreationDate:(int64_t)a3 size:(int64_t)a4 openingInReadOnly:(BOOL)a5 fullyCreated:(BOOL)a6 forAnalytics:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  const __CFString *v35;
  id v36;
  const char *v37;
  int v38;
  NSObject *v39;
  void *v40;
  uint64_t f_bsize;
  uint64_t f_blocks;
  uint64_t f_bfree;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  int v69;
  void *v70;
  unsigned int v71;
  SPConcreteCoreSpotlightIndexer *v72;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint32_t f_flags;
  __int16 v81;
  uint64_t v82;
  statfs v83;
  uint64_t v84;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v84 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24D0FD210, CFSTR("indexrebuildcount"));
  v12 = (void *)MEMORY[0x24BDD16E0];
  v72 = self;
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", protectionClassForAnalytics(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("fileprotection"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sRootsInstalled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("rootsinstalled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("vectorindexon"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("2313.4.2"), CFSTR("spotlightversion"));
  v17 = (void *)MEMORY[0x24BDD17C8];
  if (v8)
    v18 = (const char *)SIGetRebuildReason();
  else
    v18 = "Not fully created";
  objc_msgSend(v17, "stringWithUTF8String:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("rebuildreason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("textsemanticsearchon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("embeddingdonationon"));

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSince1970");
  v24 = (uint64_t)v23;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)MDBootTime());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v25);
  v27 = (uint64_t)v26;

  if (v7)
    v28 = v24 % 86400;
  else
    v28 = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, CFSTR("droptime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("timesinceboot"));

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "processIdentifier");
  objc_msgSend(v31, "processName");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, CFSTR("pid"));

  if (v33)
    v35 = v33;
  else
    v35 = CFSTR("unknown");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, CFSTR("processname"));
  bzero(&v83, 0x878uLL);
  objc_msgSend((id)sDelegate, "indexDirectory");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37 = (const char *)objc_msgSend(v36, "cStringUsingEncoding:", 4);

  LODWORD(v36) = statfs(v37, &v83);
  v38 = *__error();
  if ((_DWORD)v36)
  {
    logForCSLogCategoryIndex();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:].cold.3(v72, v38, v39);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemtype"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemsize"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemfree"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("readonlyfilesystem"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemflags"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("supportspsid"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("externalvolume"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("diskimage"));
  }
  else
  {
    v69 = v38;
    v70 = v22;
    v71 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v83.f_fstypename);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, CFSTR("filesystemtype"));

    f_bsize = v83.f_bsize;
    f_blocks = v83.f_blocks;
    f_bfree = v83.f_bfree;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v83.f_mntonname);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = f_blocks * f_bsize;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v46, CFSTR("filesystemsize"));

    v47 = f_bfree * f_bsize;
    v48 = (void *)v44;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v49, CFSTR("filesystemfree"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v83.f_flags & 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v50, CFSTR("readonlyfilesystem"));

    logForCSLogCategoryIndex();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v76 = v45;
      v77 = 2048;
      v78 = v47;
      v79 = 1024;
      f_flags = v83.f_flags;
      v81 = 2080;
      v82 = objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      _os_log_impl(&dword_213CF1000, v51, OS_LOG_TYPE_DEFAULT, "[IndexLoss] FS (%llu, %llu, 0x%x) mounted at path %s", buf, 0x26u);
    }

    v68 = v48;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v48);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v53 = _CFURLGetVolumePropertyFlags();
      logForCSLogCategoryIndex();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v9 = v71;
      v22 = v70;
      if (v53)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          -[SPConcreteCoreSpotlightIndexer dataclass](v72, "dataclass");
          v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v57 = objc_msgSend(v56, "UTF8String");
          *(_DWORD *)buf = 136315394;
          v76 = v57;
          v77 = 2048;
          v78 = 0;
          _os_log_impl(&dword_213CF1000, v55, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Got volume property flags 0x%llx", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v58, CFSTR("filesystemflags"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v59, CFSTR("supportspsid"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v60, CFSTR("externalvolume"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v61, CFSTR("diskimage"));

      }
      else
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:].cold.2();

        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemflags"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("supportspsid"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("externalvolume"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("diskimage"));
      }
      v38 = v69;
    }
    else
    {
      logForCSLogCategoryIndex();
      v62 = objc_claimAutoreleasedReturnValue();
      v9 = v71;
      v22 = v70;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:].cold.1(v72, v62);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("filesystemflags"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("supportspsid"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("externalvolume"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("diskimage"));
      v38 = v69;
    }

  }
  *__error() = v38;
  if (a3 < 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("droppedindexage"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v24 - a3);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v63, CFSTR("droppedindexage"));

  }
  if (a4 < 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("droppedindexsize"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v64, CFSTR("droppedindexsize"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v65, CFSTR("readonlyopen"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("wherecorrupted"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v11);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (void)writeIndexLossEventToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("droptime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("droptime"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "longValue");

      v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
      -[NSObject setDateFormat:](v9, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", (double)v8);
      -[NSObject stringFromDate:](v9, "stringFromDate:", v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = getpid();
      v14 = (void *)MEMORY[0x24BDD17C8];
      NSHomeDirectory();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/Library/Logs/CrashReporter/DiagnosticLogs/Search"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v20 = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v38);
        v21 = v38;

        if ((v20 & 1) == 0)
        {
          logForCSLogCategoryIndex();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.6();

        }
      }
      v36 = v9;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/spotlight_index_drop.%@.%d.%@.%@.txt"), v16, v12, v13, self->_dataclass, v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "fileExistsAtPath:", v23);

      if (v25)
      {
        v26 = 0;
        while (1)
        {
          v27 = v23;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/spotlight_index_drop.%@.%d.%@.%@.%03d.txt"), v16, v12, v13, self->_dataclass, v37, v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v27) = objc_msgSend(v28, "fileExistsAtPath:", v23);

          if (!(_DWORD)v27)
            break;
          v26 = (v26 + 1);
          if ((_DWORD)v26 == 100)
          {
            logForCSLogCategoryIndex();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.3();

            v30 = v36;
            goto LABEL_27;
          }
        }
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x24BDD0CF0];
      v40[0] = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "createFileAtPath:contents:attributes:", v23, 0, v32);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = objc_msgSend(v33, "fileExistsAtPath:", v23);

      if ((_DWORD)v32)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v23);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "writeToURL:error:", v34, 0);

        logForCSLogCategoryIndex();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.4();
        v30 = v36;
      }
      else
      {
        logForCSLogCategoryIndex();
        v35 = objc_claimAutoreleasedReturnValue();
        v30 = v36;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.5();
      }

    }
    else
    {
      logForCSLogCategoryIndex();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.2();
    }
  }
  else
  {
    logForCSLogCategoryIndex();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:].cold.1();
  }
LABEL_27:

}

+ (id)fetchItemForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    do
      v7 = __ldaxr(&sFetchID);
    while (__stlxr(v7 + 1, &sFetchID));
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
      *(_DWORD *)buf = 67109378;
      v24 = v7;
      v25 = 2080;
      v26 = v9;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "[%d] fetching %s", buf, 0x12u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke;
    v13[3] = &unk_24D0EB2D8;
    v16 = v7;
    v15 = &v17;
    v10 = v6;
    v14 = v10;
    objc_msgSend(v5, "fetchItemForURL:completionHandler:", v3, v13);
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(_DWORD *)(a1 + 48);
      objc_msgSend(v5, "itemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = 67109378;
      v13[1] = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "[%d] fetched %@", (uint8_t *)v13, 0x12u);

    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v5;
    v8 = *(NSObject **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)fetchParentsForItemID:(id)a3 recursively:(BOOL)a4 timeout:(unint64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  uint64_t *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  _QWORD v39[2];

  v6 = a4;
  v39[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDC8228]);

      if ((v10 & 1) != 0)
      {
        objc_msgSend(v7, "domainIdentifier");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v7, "coreSpotlightIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        do
          v13 = __ldaxr((unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding);
        while (__stlxr(v13 + 1, (unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding));
        if (a5 && v13 >= 7)
        {
          do
            v14 = __ldaxr((unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding);
          while (__stlxr(v14 - 1, (unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding));
          v11 = 0;
          *__error() = 60;
        }
        else
        {
          v15 = dispatch_group_create();
          dispatch_group_enter(v15);
          do
            v16 = __ldaxr(&sFetchID);
          while (__stlxr(v16 + 1, &sFetchID));
          logForCSLogCategoryIndex();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = "parent";
            *(_DWORD *)buf = 67109634;
            v34 = v16;
            if (v6)
              v18 = "all parents";
            v35 = 2080;
            v36 = v18;
            v37 = 2112;
            v38 = v7;
            _os_log_impl(&dword_213CF1000, v17, OS_LOG_TYPE_INFO, "[%d] fetching %s %@", buf, 0x1Cu);
          }

          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke;
          v22[3] = &unk_24D0EB300;
          v26 = v16;
          v23 = v7;
          v25 = &v27;
          v19 = v15;
          v24 = v19;
          objc_msgSend(v8, "_fetchParentsForItemID:recursively:completionHandler:", v23, v6, v22);
          v20 = (id)objc_opt_self();
          if (dispatch_group_wait(v19, a5))
            *__error() = 60;
          v11 = (id)v28[5];

        }
      }
    }
    else
    {
      v11 = (id)v28[5];
    }

  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  char *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  void *v64;
  void *v65;
  _BYTE v66[96];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  do
    v8 = __ldaxr((unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding);
  while (__stlxr(v8 - 1, (unsigned int *)&fetchParentsForItemID_recursively_timeout__sFetchParentsForItemIDOutstanding));
  if (v6)
  {
    logForCSLogCategoryIndex();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke_cold_1();
    goto LABEL_25;
  }
  v10 = objc_msgSend(v5, "count");
  if (v10)
  {
    v54 = 0;
    v52 = v10;
    v53 = v10 + 1;
    v11 = 8 * (v10 + 1);
    v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v14)
    {
      v15 = v14;
      v49 = (uint64_t)&v49;
      v50 = a1;
      v51 = v5;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v58;
      v19 = *MEMORY[0x24BDC8228];
      v55 = v12;
      do
      {
        v20 = 0;
        v56 = v17;
        v21 = &v12[8 * v17];
        do
        {
          if (*(_QWORD *)v58 != v18)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v20);
          objc_msgSend(v22, "itemID", v49);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "coreSpotlightIdentifier");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)&v21[8 * v20];
          *(_QWORD *)&v21[8 * v20] = v24;

          objc_msgSend(v22, "itemID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", v19);

          v16 |= v28;
          ++v20;
        }
        while (v15 != v20);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        v17 = v56 + v20;
        v12 = v55;
      }
      while (v15);

      v5 = v51;
      a1 = v50;
      if ((v16 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

      v17 = 0;
      v19 = *MEMORY[0x24BDC8228];
    }
    v36 = v17;
    v37 = objc_alloc(MEMORY[0x24BDC82E8]);
    objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
    v38 = v12;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithProviderDomainID:itemIdentifier:", v39, v19);

    v12 = v38;
    objc_msgSend(v40, "coreSpotlightIdentifier");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = *(void **)&v38[8 * v36];
    *(_QWORD *)&v38[8 * v36] = v41;

    v17 = v36 + 1;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, v17);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v43;

    if (v53)
    {
      v46 = 8 * v52;
      do
      {

        v46 -= 8;
      }
      while (v46 != -8);
    }
    v7 = v54;
    goto LABEL_23;
  }
  v29 = objc_alloc(MEMORY[0x24BDC82E8]);
  objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithProviderDomainID:itemIdentifier:", v30, *MEMORY[0x24BDC8228]);

  objc_msgSend(v31, "coreSpotlightIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v33;

LABEL_23:
  logForCSLogCategoryIndex();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v47 = *(_DWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "componentsJoinedByString:", CFSTR(" "));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v62 = v47;
    v63 = 2112;
    v64 = v48;
    _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "[%d] fetched parents %@", buf, 0x12u);

  }
LABEL_25:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_sendIndexDropABCEvent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *dataclass;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("unknown");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v15 = objc_alloc_init(MEMORY[0x24BEB3478]);
  dataclass = self->_dataclass;
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
    v12 = (const char *)SIGetRebuildReason();
  else
    v12 = "Not fully created";
  objc_msgSend(v11, "stringWithUTF8String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("SpotlightIndex"), CFSTR("IndexCorruption"), dataclass, v13, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "snapshotWithSignature:delay:events:payload:actions:reply:", v14, 0, 0, 0, &__block_literal_global_561, 10.0);
}

void __57__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB3558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent___block_invoke_cold_1(v2, v5);

  }
}

- (void)_saveCorruptIndexWithPath:(id)a3 shouldSendABC:(BOOL)a4 fullyCreated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  int AppBooleanValue;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[SPConcreteCoreSpotlightIndexer _expireCorruptIndexFilesWithPath:keepLatest:](self, "_expireCorruptIndexFilesWithPath:keepLatest:", v8, 0);
  if (v6)
    -[SPConcreteCoreSpotlightIndexer _sendIndexDropABCEvent:](self, "_sendIndexDropABCEvent:", v5);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SpotlightIndexKeepCorruptFilesEnabled"), (CFStringRef)*MEMORY[0x24BDBD580], &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%llu"), (unint64_t)CFAbsoluteTimeGetCurrent());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtPath:error:", v10, 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v13 = objc_msgSend(v12, "moveItemAtPath:toPath:error:", v8, v10, &v20);
    v14 = v20;

    logForCSLogCategoryIndex();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v10;
        _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "Moved corrupt index to path:%@", buf, 0xCu);
      }

      dispatch_get_global_queue(9, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __87__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated___block_invoke;
      block[3] = &unk_24D0EA758;
      v19 = v10;
      dispatch_async(v17, block);

      v16 = v19;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[SPConcreteCoreSpotlightIndexer _saveCorruptIndexWithPath:shouldSendABC:fullyCreated:].cold.1();
    }

  }
}

void __87__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated___block_invoke(uint64_t a1)
{
  void **v1;
  DIR *v2;
  DIR *v3;
  dirent *v4;
  const char *d_name;
  int v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  int *v15;
  char *v16;
  NSObject *v17;
  const char *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  int *v25;
  char *v26;
  int *v27;
  char *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  stat v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v1 = (void **)(a1 + 32);
  v2 = opendir((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  if (v2)
  {
    v3 = v2;
    v4 = readdir(v2);
    if (v4)
    {
      while (1)
      {
        d_name = v4->d_name;
        if (!strcmp(v4->d_name, ".") || !strcmp(d_name, ".."))
          goto LABEL_25;
        memset(&v32, 0, sizeof(v32));
        v6 = dirfd(v3);
        if ((fstatat(v6, d_name, &v32, 32) & 0x80000000) == 0)
          break;
        logForCSLogCategoryIndex();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = __error();
          v16 = strerror(*v15);
          *(_DWORD *)buf = 136315394;
          v34 = d_name;
          v35 = 2080;
          v36 = v16;
          v17 = v14;
          v18 = "Failed to obtain index file info:%s (%s)";
LABEL_20:
          _os_log_error_impl(&dword_213CF1000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
        }
LABEL_21:

LABEL_25:
        v4 = readdir(v3);
        if (!v4)
          goto LABEL_26;
      }
      if ((v32.st_mode & 0xF000) == 0x4000)
      {
        v7 = *v1;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", d_name);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
        v9 = (char *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v11 = objc_msgSend(v10, "removeItemAtPath:error:", v9, &v31);
        v12 = (char *)v31;

        if ((v11 & 1) == 0)
        {
          logForCSLogCategoryIndex();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v9;
            v35 = 2112;
            v36 = v12;
            _os_log_error_impl(&dword_213CF1000, v13, OS_LOG_TYPE_ERROR, "Failed to remove index directory:%@ (%@)", buf, 0x16u);
          }

        }
        goto LABEL_25;
      }
      v19 = dirfd(v3);
      v20 = openat(v19, d_name, 0x8000);
      if ((v20 & 0x80000000) == 0)
      {
        v21 = v20;
        v30 = 65541;
        v22 = ffsctl(v20, 0xC0084A44uLL, &v30, 0);
        logForCSLogCategoryIndex();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v25 = __error();
            v26 = strerror(*v25);
            *(_DWORD *)buf = 136315394;
            v34 = d_name;
            v35 = 2080;
            v36 = v26;
            _os_log_error_impl(&dword_213CF1000, v24, OS_LOG_TYPE_ERROR, "Failed to mark index file purgable:%s (%s)", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v34 = d_name;
          _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_DEFAULT, "Marked index file purgable:%s", buf, 0xCu);
        }

        close(v21);
        goto LABEL_25;
      }
      logForCSLogCategoryIndex();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v27 = __error();
      v28 = strerror(*v27);
      *(_DWORD *)buf = 136315394;
      v34 = d_name;
      v35 = 2080;
      v36 = v28;
      v17 = v14;
      v18 = "Failed to open index file:%s (%s)";
      goto LABEL_20;
    }
LABEL_26:
    closedir(v3);
  }
  else
  {
    logForCSLogCategoryIndex();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __87__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated___block_invoke_cold_1();

  }
}

- (BOOL)creationTouchFileExists
{
  void *v2;
  id v3;
  const char *v4;
  int v5;

  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("creationTouchFile"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (!v4)
    return 0;
  v5 = open(v4, 0x8000);
  if (v5 < 0)
    return 0;
  close(v5);
  return 1;
}

- (int)creationTouchFileCreate
{
  void *v2;
  id v3;
  const char *v4;
  int v5;

  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("creationTouchFile"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (!v4)
    return 0;
  v5 = open(v4, 512, 384);
  if ((v5 & 0x80000000) == 0)
  {
    close(v5);
    return 0;
  }
  return *__error();
}

- (void)creationTouchFileUnlink
{
  void *v2;
  id v3;
  const char *v4;

  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("creationTouchFile"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (v4)
    unlink(v4);
}

- (int)openIndexForUpgradeSynchronous:(BOOL)a3
{
  int v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  int v10;
  NSObject *v11;
  id *p_dataclass;
  int v13;
  NSString **v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSString *dataclass;
  unint64_t createCount;
  NSString *v27;
  __SI *index;
  NSObject *v29;
  __darwin_time_t tv_sec;
  void *v31;
  double v32;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  __SI *v42;
  stat buf;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  NSString *v47;
  char buffer[1024];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_index)
      return 0;
    v5 = a3;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)MDBootTime());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    bzero(buffer, 0x400uLL);
    if (CFStringGetFileSystemRepresentation(v8, buffer, 1024))
    {
      v9 = open(buffer, 0x8000);
      v10 = v9;
      if ((v9 & 0x80000000) == 0)
      {
        close(v9);
        if (-[SPConcreteCoreSpotlightIndexer creationTouchFileExists](self, "creationTouchFileExists"))
        {
          logForCSLogCategoryIndex();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[SPConcreteCoreSpotlightIndexer openIndexForUpgradeSynchronous:].cold.2(self, v11);
          v3 = -1;
LABEL_45:

          goto LABEL_46;
        }
LABEL_19:
        v19 = (void *)objc_msgSend(&__block_literal_global_571, "copy");
        v20 = (void *)objc_msgSend(&__block_literal_global_573, "copy");
        v21 = (void *)objc_msgSend(&__block_literal_global_574, "copy");
        if (updatedFrom2024Seed_onceToken != -1)
          dispatch_once(&updatedFrom2024Seed_onceToken, &__block_literal_global_2508);
        if (updatedFrom2024Seed_updatedFromSeed)
        {
          v44 = CFSTR("kIndexOptionResetForLargePostings");
          v45 = *MEMORY[0x24BDBD270];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 < 0)
            goto LABEL_28;
        }
        else
        {
          v22 = 0;
          if (v10 < 0)
            goto LABEL_28;
        }
        v3 = SIOpenIndexAtPathWithCallbacks();
        if ((v3 & 0x80000000) == 0)
        {
          SISetFileProvidersCallbacks();
          goto LABEL_34;
        }
LABEL_28:
        if (-[SPConcreteCoreSpotlightIndexer creationTouchFileCreate](self, "creationTouchFileCreate"))
        {
          logForCSLogCategoryIndex();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[SPConcreteCoreSpotlightIndexer openIndexForUpgradeSynchronous:].cold.1();

        }
        v3 = SIOpenIndexAtPathWithCallbacks();
        SISetFileProvidersCallbacks();
        if ((v3 & 0x80000000) == 0)
        {
          SISyncIndex();
          -[SPConcreteCoreSpotlightIndexer creationTouchFileUnlink](self, "creationTouchFileUnlink");
        }
LABEL_34:

        if ((v3 & 0x80000000) == 0)
        {
          v11 = dispatch_group_create();
          self->_index = v42;
          SISetAccumulatedWorkBoundaryCrossCallback();
          protectionClassIntValue(self->_dataclass);
          _SISetProtectionClass();
          logForCSLogCategoryIndex();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            dataclass = self->_dataclass;
            createCount = self->_createCount;
            buf.st_dev = 67109634;
            *(_DWORD *)&buf.st_mode = v3;
            LOWORD(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)dataclass;
            HIWORD(buf.st_uid) = 2048;
            *(_QWORD *)&buf.st_gid = createCount;
            _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_INFO, "Index open, result:%d, dataclass:%@, , createCount:%lu", (uint8_t *)&buf, 0x1Cu);
          }

          if (v3 == 1)
          {
            logForCSLogCategoryIndex();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              buf.st_dev = 138412546;
              *(_QWORD *)&buf.st_mode = CFSTR("com.apple.mobilemail.reindexVersion");
              WORD2(buf.st_ino) = 2112;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)CFSTR("599");
              _os_log_impl(&dword_213CF1000, v34, OS_LOG_TYPE_INFO, "Bootstrapping %@ %@", (uint8_t *)&buf, 0x16u);
            }

            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", CFSTR("599"), CFSTR("com.apple.mobilemail.reindexVersion"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD228, CFSTR("kSPCoalescedRanking"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD240, CFSTR("kSPEmailLocalParts"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD258, CFSTR("kSPHashedContainers"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD240, CFSTR("kSPGroups"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD210, CFSTR("kSPNotes"), 0);
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD1F8, CFSTR("PHOTOS_INDEX_VERSION_CHANGE"), 0);
            if (sUsePriorityIndex == 1
              && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
            {
              -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 0);
            }
            -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", v6, CFSTR("DeviceBootTime"), 0);
            logForCSLogCategoryDefault();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              buf.st_dev = 138412290;
              *(_QWORD *)&buf.st_mode = v6;
              _os_log_impl(&dword_213CF1000, v29, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (initial creation)", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            if (v3 == 2)
              -[SPConcreteCoreSpotlightIndexer dirty:](self, "dirty:", 0);
            v27 = self->_dataclass;
            dispatch_group_enter(v11);
            *(_QWORD *)&buf.st_dev = 0;
            objc_initWeak((id *)&buf, self);
            index = self->_index;
            v35 = MEMORY[0x24BDAC760];
            v36 = 3221225472;
            v37 = __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_577;
            v38 = &unk_24D0EB408;
            v29 = v27;
            v39 = v29;
            v40 = v11;
            objc_copyWeak(&v41, (id *)&buf);
            SISynchedOpWithBlock((uint64_t)index, 2, &v35);
            objc_destroyWeak(&v41);

            objc_destroyWeak((id *)&buf);
          }

          memset(&buf, 0, sizeof(buf));
          if (stat(buffer, &buf))
            tv_sec = -1;
          else
            tv_sec = buf.st_birthtimespec.tv_sec;
          -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:](self, "writeIndexCreationDate:", tv_sec, v35, v36, v37, v38);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timeIntervalSince1970");
          -[SPConcreteCoreSpotlightIndexer writeIndexSuccessfulOpenDate:](self, "writeIndexSuccessfulOpenDate:", (uint64_t)v32);

          -[SPConcreteCoreSpotlightIndexer writeSDBObjectCount:](self, "writeSDBObjectCount:", SIGetObjectCount());
          dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_45;
        }
LABEL_46:

        return v3;
      }
      if (v5)
      {
        v46 = *MEMORY[0x24BDD0CF0];
        p_dataclass = (id *)&self->_dataclass;
        v13 = -[NSString isEqual:](self->_dataclass, "isEqual:", CFSTR("Priority"));
        v14 = (NSString **)MEMORY[0x24BDD0CE0];
        if (!v13)
          v14 = &self->_dataclass;
        v47 = *v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v15, 0);

        logForCSLogCategoryIndex();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = *p_dataclass;
          buf.st_dev = 138412290;
          *(_QWORD *)&buf.st_mode = v18;
          _os_log_impl(&dword_213CF1000, v17, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - creating", (uint8_t *)&buf, 0xCu);
        }

        if (objc_msgSend(*p_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD0]))
          _SIChangeProtectionClassForFilesInDirectory();

        goto LABEL_19;
      }
    }
    v3 = -1;
    goto LABEL_46;
  }
  return -1;
}

uint64_t __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[SPConcreteCoreSpotlightIndexer fetchItemForURL:](SPConcreteCoreSpotlightIndexer, "fetchItemForURL:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "providerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "itemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coreSpotlightIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v9[0] = v4;
        v9[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v5 = 0;
  if (a2 && a4)
  {
    v9 = (void *)*MEMORY[0x24BDC81A0];
    if (a3)
      v9 = a3;
    v10 = (objc_class *)MEMORY[0x24BDC82E8];
    v11 = v9;
    v12 = a2;
    v13 = (void *)objc_msgSend([v10 alloc], "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v12, v11, a4);

    +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:recursively:timeout:](SPConcreteCoreSpotlightIndexer, "fetchParentsForItemID:recursively:timeout:", v13, 0, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v5 = 0;
  if (a2 && a4)
  {
    v9 = (void *)*MEMORY[0x24BDC81A0];
    if (a3)
      v9 = a3;
    v10 = (objc_class *)MEMORY[0x24BDC82E8];
    v11 = v9;
    v12 = a2;
    v13 = (void *)objc_msgSend([v10 alloc], "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v12, v11, a4);

    +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:recursively:timeout:](SPConcreteCoreSpotlightIndexer, "fetchParentsForItemID:recursively:timeout:", v13, 1, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = v5;

  return v14;
}

void __65__SPConcreteCoreSpotlightIndexer_openIndexForUpgradeSynchronous___block_invoke_577(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "finish-draining-journal, for :%@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4 readOnly:(BOOL)a5
{
  int v5;
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;
  char v15;
  NSString **p_dataclass;
  uint64_t v17;
  int v18;
  NSObject *v19;
  NSString *v20;
  int v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  NSString *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSString *v33;
  int v34;
  NSString **v35;
  void *v36;
  NSObject *v37;
  NSString *v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  _BOOL4 v45;
  void *v46;
  const __CFString *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  int v51;
  int v52;
  __CFString *v53;
  int v54;
  int v55;
  NSObject *v56;
  __darwin_time_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  int v61;
  NSString **v62;
  uint64_t v63;
  void *v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  int v68;
  int v69;
  int v70;
  id v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  int v77;
  int v78;
  id v79;
  uint64_t v80;
  void *v81;
  double v82;
  void *v83;
  SPConcreteCoreSpotlightIndexer *v84;
  _BOOL4 v85;
  NSObject *v86;
  const __CFString *v87;
  NSString *dataclass;
  unint64_t createCount;
  NSObject *v90;
  __SI *index;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  __CFString *v95;
  __CFString *v96;
  void *v97;
  NSMutableArray *v98;
  NSMutableArray *blocksToRunWhenFinishedDraining;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  __darwin_time_t tv_sec;
  void *v105;
  double v106;
  void *v108;
  const char *v109;
  uint64_t v110;
  off_t st_size;
  int v112;
  int v113;
  int v114;
  void *v115;
  void *v116;
  id v117;
  int v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  unsigned int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  __CFString *string;
  void *v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[5];
  id v137;
  id v138;
  int v139;
  _QWORD block[5];
  __CFString *v141;
  uint64_t v142;
  uint64_t v143;
  id (*v144)(uint64_t);
  void *v145;
  NSObject *v146;
  id v147;
  _QWORD v148[5];
  _QWORD v149[6];
  _QWORD v150[4];
  _QWORD v151[4];
  id v152;
  id location;
  __SI *v154;
  _BYTE v155[128];
  SPConcreteCoreSpotlightIndexer *v156;
  uint8_t v157[4];
  const char *v158;
  __int16 v159;
  int v160;
  __int16 v161;
  int v162;
  __int16 v163;
  int v164;
  __int16 v165;
  int v166;
  __int16 v167;
  uint64_t v168;
  __int16 v169;
  int v170;
  uint64_t v171;
  NSString *v172;
  stat v173;
  uint64_t v174;
  NSString *v175;
  uint8_t buf[4];
  NSString *v177;
  __int16 v178;
  int v179;
  __int16 v180;
  int v181;
  __int16 v182;
  int v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  self->_tryOpenJwlIndex = 0;
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_index)
      return 0;
    v7 = a5;
    v8 = a4;
    v9 = a3;
    if (a3)
    {
      v10 = objc_msgSend((id)sDelegate, "privateIndex");
      -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        if (-[NSObject isEqualToString:](v11, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
        {
LABEL_14:

          goto LABEL_15;
        }
        -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD0CD8]);

        if ((v15 & 1) != 0)
          goto LABEL_15;
LABEL_12:
        logForCSLogCategoryDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.5(self, v12);
        goto LABEL_14;
      }
      v13 = -[NSObject isEqualToString:](v11, "isEqualToString:", *MEMORY[0x24BDD0CD8]);

      if (v13)
        goto LABEL_12;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)MDBootTime());
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)sDelegate, "deviceFirstUnlockedInMKB") & 1) != 0)
    {
      p_dataclass = &self->_dataclass;
      v17 = *MEMORY[0x24BDD0CD0];
      if (!-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD0])
        && !-[NSString isEqualToString:](*p_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD8]))
      {
        goto LABEL_22;
      }
      v18 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInSB");
      if ((objc_msgSend((id)sDelegate, "deviceUnlocked") & 1) != 0)
      {
        logForCSLogCategoryIndex();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *p_dataclass;
          *(_DWORD *)buf = 138412802;
          v177 = v20;
          v178 = 1024;
          v179 = 1;
          v180 = 1024;
          v181 = v18;
          _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_INFO, "Lazy open of protected index for dataclass:%@ (%d:%d)", buf, 0x18u);
        }

LABEL_22:
        self->_tryOpenJwlIndex = 0;
        v154 = 0;
        -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
        string = (__CFString *)objc_claimAutoreleasedReturnValue();
        bzero(buf, 0x400uLL);
        if (!CFStringGetFileSystemRepresentation(string, (char *)buf, 1024))
        {
          v5 = -1;
LABEL_160:
          if (self->_index)
            _SIStartPreheatScheduler();
          self->_hasAssertion = 0;
          self->_assertionEndTime = 0.0;
          self->_suspended = 0;
          goto LABEL_163;
        }
        v21 = open((const char *)buf, 0x8000);
        v22 = v21;
        if (v21 < 0)
        {
          if (!v9)
          {
            v5 = -1;
LABEL_163:

            goto LABEL_164;
          }
          v174 = *MEMORY[0x24BDD0CF0];
          v34 = -[NSString isEqual:](*p_dataclass, "isEqual:", CFSTR("Priority"));
          v35 = (NSString **)MEMORY[0x24BDD0CE0];
          if (!v34)
            v35 = &self->_dataclass;
          v175 = *v35;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", string, 1, v23, 0);

          logForCSLogCategoryIndex();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = *p_dataclass;
            v173.st_dev = 138412290;
            *(_QWORD *)&v173.st_mode = v38;
            _os_log_impl(&dword_213CF1000, v37, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - creating", (uint8_t *)&v173, 0xCu);
          }

          if (-[NSString isEqualToString:](*p_dataclass, "isEqualToString:", v17))
          {
            v39 = open((const char *)buf, 0);
            if (v39 != -1)
            {
              _SIChangeProtectionClassForFilesInDirectory();
              close(v39);
            }
          }
        }
        else
        {
          close(v21);
          if (!-[SPConcreteCoreSpotlightIndexer creationTouchFileExists](self, "creationTouchFileExists"))
          {
            v40 = 1;
LABEL_53:
            v123 = v40;
            location = 0;
            objc_initWeak(&location, self);
            v151[0] = MEMORY[0x24BDAC760];
            v151[1] = 3221225472;
            v151[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke;
            v151[3] = &unk_24D0EB458;
            objc_copyWeak(&v152, &location);
            v128 = (void *)objc_msgSend(v151, "copy");
            v41 = MEMORY[0x24BDAC760];
            if (openIndex_shouldReindexAll_readOnly__onceToken != -1)
              dispatch_once(&openIndex_shouldReindexAll_readOnly__onceToken, &__block_literal_global_584);
            v150[0] = 0;
            v150[1] = v150;
            v150[2] = 0x2020000000;
            v150[3] = 0;
            v149[0] = v41;
            v149[1] = 3221225472;
            v149[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4;
            v149[3] = &unk_24D0EB4E8;
            v149[4] = self;
            v149[5] = v150;
            v127 = (void *)objc_msgSend(v149, "copy");
            v148[0] = v41;
            v148[1] = 3221225472;
            v148[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_588;
            v148[3] = &unk_24D0EAAE8;
            v148[4] = self;
            v126 = (void *)objc_msgSend(v148, "copy");
            v120 = (void *)objc_msgSend(&__block_literal_global_591, "copy");
            v122 = (void *)objc_msgSend(&__block_literal_global_593, "copy");
            v121 = (void *)objc_msgSend(&__block_literal_global_595, "copy");
            v42 = (void *)objc_opt_new();
            v43 = v42;
            v44 = (_QWORD *)MEMORY[0x24BDBD270];
            if (sPrivate)
              objc_msgSend(v42, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("kIndexOptionPrivate"));
            if (v7)
              objc_msgSend(v43, "setObject:forKey:", *v44, CFSTR("kIndexOptionReadOnly"));
            v45 = -[NSString isEqualToString:](*p_dataclass, "isEqualToString:", CFSTR("Priority"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v45 | (2 * protectionClassIntValue(*p_dataclass)));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("kIndexOptionPriorityPC"));

            if (updatedFrom2024Seed_onceToken != -1)
              dispatch_once(&updatedFrom2024Seed_onceToken, &__block_literal_global_2508);
            if (updatedFrom2024Seed_updatedFromSeed)
              objc_msgSend(v43, "setObject:forKey:", *v44, CFSTR("kIndexOptionResetForLargePostings"));
            if ((v22 & 0x80000000) != 0)
            {
              v47 = 0;
              if ((v123 & !v9 & 1) != 0)
              {
                v5 = -1;
                goto LABEL_116;
              }
LABEL_114:
              self->_readOnly = 0;
              v5 = SIOpenIndexAtPathWithCallbacks();
              if ((v5 & 0x80000000) == 0)
              {
                SISetFileProvidersCallbacks();
                SISyncIndex();
              }
              goto LABEL_116;
            }
            self->_readOnly = v7;
            if (v123)
            {
              v5 = SIOpenIndexAtPathWithCallbacks();
              if ((v5 & 0x80000000) == 0)
              {
                SISetFileProvidersCallbacks();
LABEL_84:
                v47 = 0;
LABEL_116:

                _Block_object_dispose(v150, 8);
                objc_destroyWeak(&v152);
                objc_destroyWeak(&location);
                if ((v5 & 0x80000000) == 0)
                {
                  self->_index = v154;
                  _SISetAssertedJournalNum();
                  SISetAccumulatedWorkBoundaryCrossCallback();
                  protectionClassIntValue(self->_dataclass);
                  _SISetProtectionClass();
                  if (sUsePriorityIndex == 1)
                    -[NSString isEqualToString:](*p_dataclass, "isEqualToString:", CFSTR("Priority"));
                  _SISetPriority();
                  if (!sPrivate)
                  {
                    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "contactsIndexer");
                    v84 = (SPConcreteCoreSpotlightIndexer *)objc_claimAutoreleasedReturnValue();
                    v85 = v84 == self;

                    if (v85)
                      _SISetContactsIndex();
                  }
                  logForCSLogCategoryIndex();
                  v86 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                  {
                    v87 = CFSTR("NO");
                    dataclass = self->_dataclass;
                    createCount = self->_createCount;
                    if (v8)
                      v87 = CFSTR("YES");
                    v173.st_dev = 67109890;
                    *(_DWORD *)&v173.st_mode = v5;
                    LOWORD(v173.st_ino) = 2112;
                    *(__darwin_ino64_t *)((char *)&v173.st_ino + 2) = (__darwin_ino64_t)dataclass;
                    HIWORD(v173.st_uid) = 2112;
                    *(_QWORD *)&v173.st_gid = v87;
                    *((_WORD *)&v173.st_rdev + 2) = 2048;
                    *(_QWORD *)((char *)&v173.st_rdev + 6) = createCount;
                    _os_log_impl(&dword_213CF1000, v86, OS_LOG_TYPE_INFO, "Index open, result:%d, dataclass:%@, shouldReindexAll:%@, createCount:%lu", (uint8_t *)&v173, 0x26u);
                  }

                  if (sIsInternalInstall && !gIsSystemOnBattery)
                  {
                    dispatch_get_global_queue(5, 0);
                    v90 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x24BDAC760];
                    block[1] = 3221225472;
                    block[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_615;
                    block[3] = &unk_24D0EA9D8;
                    block[4] = self;
                    v141 = string;
                    dispatch_async(v90, block);

                  }
                  if (v5 == 1 || v7)
                  {
                    if (!v7)
                    {
                      logForCSLogCategoryIndex();
                      v92 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                      {
                        v173.st_dev = 138412546;
                        *(_QWORD *)&v173.st_mode = CFSTR("com.apple.mobilemail.reindexVersion");
                        WORD2(v173.st_ino) = 2112;
                        *(__darwin_ino64_t *)((char *)&v173.st_ino + 6) = (__darwin_ino64_t)CFSTR("599");
                        _os_log_impl(&dword_213CF1000, v92, OS_LOG_TYPE_INFO, "Bootstrapping %@ %@", (uint8_t *)&v173, 0x16u);
                      }

                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", CFSTR("599"), CFSTR("com.apple.mobilemail.reindexVersion"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD228, CFSTR("kSPCoalescedRanking"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD288, CFSTR("kSPEmailContentURLAttr"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD240, CFSTR("kSPEmailLocalParts"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD258, CFSTR("kSPHashedContainers"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD240, CFSTR("kSPGroups"), 0);
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD210, CFSTR("kSPNotes"), 0);
                      if (sUsePriorityIndex == 1
                        && -[NSString isEqualToString:](*p_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CE0]))
                      {
                        -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 0);
                      }
                      -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", v131, CFSTR("DeviceBootTime"), 1);
                      logForCSLogCategoryDefault();
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                      {
                        v173.st_dev = 138412290;
                        *(_QWORD *)&v173.st_mode = v131;
                        _os_log_impl(&dword_213CF1000, v93, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (initial creation)", (uint8_t *)&v173, 0xCu);
                      }

                      ++self->_createCount;
                      -[NSMutableSet removeAllObjects](self->_reindexAllDelegateBundleIDs, "removeAllObjects");
                      v94 = (void *)objc_opt_new();
                      -[SPConcreteCoreSpotlightIndexer setKnownClients:](self, "setKnownClients:", v94);

                      if (v8)
                      {
                        v95 = CFSTR("bootstrapping new index");
                        if (v47)
                          v95 = (__CFString *)v47;
                        v96 = v95;
                        v156 = self;
                        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v156, 1);
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v130, "reindexAllItemsWithIndexers:reason:completionHandler:", v97, v96, &__block_literal_global_637);

                      }
                      os_unfair_lock_lock(&sDrainedLock);
                      -[SPConcreteCoreSpotlightIndexer setFinishedDrainingJournal:](self, "setFinishedDrainingJournal:", 1);
                      v98 = self->_blocksToRunWhenFinishedDraining;
                      blocksToRunWhenFinishedDraining = self->_blocksToRunWhenFinishedDraining;
                      self->_blocksToRunWhenFinishedDraining = 0;

                      os_unfair_lock_unlock(&sDrainedLock);
                      if (v98)
                      {
                        v134 = 0u;
                        v135 = 0u;
                        v132 = 0u;
                        v133 = 0u;
                        v100 = v98;
                        v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v132, v155, 16);
                        if (v101)
                        {
                          v102 = *(_QWORD *)v133;
                          do
                          {
                            for (i = 0; i != v101; ++i)
                            {
                              if (*(_QWORD *)v133 != v102)
                                objc_enumerationMutation(v100);
                              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i) + 16))();
                            }
                            v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v132, v155, 16);
                          }
                          while (v101);
                        }

                      }
                      objc_msgSend((id)sDelegate, "indexAvailableForProtectionClass:newIndex:", self->_dataclass, 1);
                      -[SPConcreteCoreSpotlightIndexer issuePriorityIndexFixup](self, "issuePriorityIndexFixup");

                    }
                  }
                  else
                  {
                    if (v5 == 2)
                      -[SPConcreteCoreSpotlightIndexer dirty:](self, "dirty:", 0);
                    *(_QWORD *)&v173.st_dev = 0;
                    objc_initWeak((id *)&v173, self);
                    index = self->_index;
                    v136[0] = MEMORY[0x24BDAC760];
                    v136[1] = 3221225472;
                    v136[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_616;
                    v136[3] = &unk_24D0EB620;
                    objc_copyWeak(&v138, (id *)&v173);
                    v136[4] = self;
                    v137 = v131;
                    v139 = v5;
                    SISynchedOpWithBlock((uint64_t)index, 2, v136);

                    objc_destroyWeak(&v138);
                    objc_destroyWeak((id *)&v173);
                  }
                  memset(&v173, 0, sizeof(v173));
                  if (stat((const char *)buf, &v173))
                    tv_sec = -1;
                  else
                    tv_sec = v173.st_birthtimespec.tv_sec;
                  -[SPConcreteCoreSpotlightIndexer writeIndexCreationDate:](self, "writeIndexCreationDate:", tv_sec);
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "timeIntervalSince1970");
                  -[SPConcreteCoreSpotlightIndexer writeIndexSuccessfulOpenDate:](self, "writeIndexSuccessfulOpenDate:", (uint64_t)v106);

                  -[SPConcreteCoreSpotlightIndexer writeSDBObjectCount:](self, "writeSDBObjectCount:", SIGetObjectCount());
                }
                goto LABEL_160;
              }
              if (!v9)
                goto LABEL_84;
            }
            else
            {
              v5 = -1;
            }
            logForCSLogCategoryIndex();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              if (v123)
                v109 = (const char *)SIGetRebuildReason();
              else
                v109 = "Not fully created";
              v173.st_dev = 67109634;
              *(_DWORD *)&v173.st_mode = v5;
              LOWORD(v173.st_ino) = 2112;
              *(__darwin_ino64_t *)((char *)&v173.st_ino + 2) = (__darwin_ino64_t)v108;
              HIWORD(v173.st_uid) = 2080;
              *(_QWORD *)&v173.st_gid = v109;
              _os_log_error_impl(&dword_213CF1000, v48, OS_LOG_TYPE_ERROR, "Failed to open index (openIndex), result:%d, dataclass:%@, reason:%s", (uint8_t *)&v173, 0x1Cu);

            }
            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
            v50 = objc_msgSend(v49, "BOOLForKey:", CFSTR("disable_index_drop_reporting"));
            v116 = v49;
            v51 = -[SPConcreteCoreSpotlightIndexer shouldNotLogIndexDrop:ignoreParentDirectoryAge:](self, "shouldNotLogIndexDrop:ignoreParentDirectoryAge:", string, v50);
            memset(&v173.st_blksize, 0, 32);
            if (v123)
              v52 = v51;
            else
              v52 = 5;
            v118 = v52;
            memset(&v173, 0, 112);
            v53 = objc_retainAutorelease(string);
            v54 = stat((const char *)-[__CFString UTF8String](v53, "UTF8String"), &v173);
            v55 = *__error();
            if (v54)
            {
              logForCSLogCategoryIndex();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.3();

              v57 = 0;
              st_size = 0;
            }
            else
            {
              v57 = v173.st_birthtimespec.tv_sec;
              st_size = v173.st_size;
            }
            *__error() = v55;
            v58 = (const char *)SIGetRebuildReason();
            v112 = strncmp(v58, "Intentional: ", 0xDuLL);
            if (sIsInternalInstall)
            {
              if (v118)
              {
                v59 = 0;
              }
              else if (v112)
              {
                v59 = v50 ^ 1;
              }
              else
              {
                v59 = 0;
              }
              -[SPConcreteCoreSpotlightIndexer _saveCorruptIndexWithPath:shouldSendABC:fullyCreated:](self, "_saveCorruptIndexWithPath:shouldSendABC:fullyCreated:", v53, v59, v123);
            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "removeItemAtPath:error:", v53, 0);

            v171 = *MEMORY[0x24BDD0CF0];
            v61 = -[NSString isEqual:](*p_dataclass, "isEqual:", CFSTR("Priority"));
            v62 = (NSString **)MEMORY[0x24BDD0CE0];
            if (!v61)
              v62 = &self->_dataclass;
            v172 = *v62;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1, v57);
            v63 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = 0;
            v65 = objc_msgSend(v64, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v53, 1, v63, &v147);
            v115 = (void *)v63;
            v117 = v147;

            if (v65)
            {
              if (!-[SPConcreteCoreSpotlightIndexer creationTouchFileCreate](self, "creationTouchFileCreate"))
                goto LABEL_98;
              logForCSLogCategoryIndex();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.1();
            }
            else
            {
              logForCSLogCategoryIndex();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.2();
            }

LABEL_98:
            if (v118)
            {
              logForCSLogCategoryIndex();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = protectionClassForAnalytics(v124);
                v68 = sRootsInstalled;
                v69 = _os_feature_enabled_impl();
                v70 = _os_feature_enabled_impl();
                objc_msgSend((id)sDelegate, "indexDirectory");
                v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v72 = objc_msgSend(v71, "UTF8String");
                *(_DWORD *)v157 = 136316674;
                v158 = "2313.4.2";
                v159 = 1024;
                v160 = v113;
                v161 = 1024;
                v162 = v68;
                v163 = 1024;
                v164 = v69;
                v165 = 1024;
                v166 = v70;
                v167 = 2080;
                v168 = v72;
                v169 = 1024;
                v170 = v118;
                _os_log_impl(&dword_213CF1000, v67, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Not reporting drop (%d, %d, %d, %d, %s) for reason %d", v157, 0x34u);

              }
              v47 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "logWithBundleID:indexOperation:itemCount:code:", CFSTR("com.apple.CoreSpotlight"), 9, 1, 5);

              if (!v112)
              {
                v47 = 0;
LABEL_113:

                goto LABEL_114;
              }
              -[SPConcreteCoreSpotlightIndexer indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:](self, "indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:", v110, st_size, v7, v123, v50 ^ 1);
              v74 = objc_claimAutoreleasedReturnValue();
              v67 = v74;
              if ((v50 & 1) != 0)
              {
                logForCSLogCategoryIndex();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v157 = 0;
                  _os_log_impl(&dword_213CF1000, v75, OS_LOG_TYPE_DEFAULT, "[IndexLoss] writing out to file", v157, 2u);
                }

                -[SPConcreteCoreSpotlightIndexer writeIndexLossEventToFile:](self, "writeIndexLossEventToFile:", v67);
              }
              else
              {
                v142 = MEMORY[0x24BDAC760];
                v143 = 3221225472;
                v144 = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_610;
                v145 = &unk_24D0EB570;
                v146 = v74;
                AnalyticsSendEventLazy();

              }
              logForCSLogCategoryIndex();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v119 = protectionClassForAnalytics(v125);
                v77 = sRootsInstalled;
                v114 = _os_feature_enabled_impl();
                v78 = _os_feature_enabled_impl();
                objc_msgSend((id)sDelegate, "indexDirectory");
                v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v80 = objc_msgSend(v79, "UTF8String");
                *(_DWORD *)v157 = 136316418;
                v158 = "2313.4.2";
                v159 = 1024;
                v160 = v119;
                v161 = 1024;
                v162 = v77;
                v163 = 1024;
                v164 = v114;
                v165 = 1024;
                v166 = v78;
                v167 = 2080;
                v168 = v80;
                _os_log_impl(&dword_213CF1000, v76, OS_LOG_TYPE_DEFAULT, "[IndexLoss] (%s) Sending analytics (%d, %d, %d, %d, %s)", v157, 0x2Eu);

              }
              -[SPConcreteCoreSpotlightIndexer incrementIndexWipeCount](self, "incrementIndexWipeCount");
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "timeIntervalSince1970");
              -[SPConcreteCoreSpotlightIndexer writeIndexDropAnalyticsDate:](self, "writeIndexDropAnalyticsDate:", (uint64_t)v82);

              v47 = CFSTR("index dropped");
            }

            goto LABEL_113;
          }
          logForCSLogCategoryIndex();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:].cold.4(self, v23);
        }

        v40 = v22 >> 31;
        goto LABEL_53;
      }
      if (-[NSString isEqualToString:](*p_dataclass, "isEqualToString:", v17))
        self->_tryOpenJwlIndex = 1;
      logForCSLogCategoryIndex();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v8 || v7)
      {
        if (v27)
        {
          v28 = *p_dataclass;
          *(_DWORD *)buf = 138413058;
          v177 = v28;
          v178 = 1024;
          v179 = 0;
          v180 = 1024;
          v181 = 1;
          v182 = 1024;
          v183 = v18;
          _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device, unlocked:%d (%d:%d)", buf, 0x1Eu);
        }

      }
      else
      {
        if (v27)
        {
          v29 = *p_dataclass;
          *(_DWORD *)buf = 138412290;
          v177 = v29;
          _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_INFO, "Trying locked index open for dataclass:%@", buf, 0xCu);
        }

        -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByAppendingString:", CFSTR("/bgassertions"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        logForCSLogCategoryIndex();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = *p_dataclass;
          *(_DWORD *)buf = 138413058;
          v177 = v33;
          v178 = 1024;
          v179 = 0;
          v180 = 1024;
          v181 = 1;
          v182 = 1024;
          v183 = v18;
          _os_log_impl(&dword_213CF1000, v32, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device without valid assertions file path, unlocked:%d (%d:%d)", buf, 0x1Eu);
        }

      }
    }
    else
    {
      logForCSLogCategoryIndex();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        v177 = v25;
        _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_INFO, "Skipping open of protected index for dataclass:%@ on locked device", buf, 0xCu);
      }

    }
    v5 = 0;
LABEL_164:

    return v5;
  }
  return -1;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = sIndexQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2;
    v13[3] = &unk_24D0EB430;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = a3;
    v16 = a2;
    _setup_block(v13, 0, 4078);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, v11);

  }
  return 0;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleMaintenance:description:forDarkWake:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_3()
{
  _SPBucketSet *v0;
  void *v1;

  v0 = objc_alloc_init(_SPBucketSet);
  v1 = (void *)buckets;
  buckets = (uint64_t)v0;

  openIndex_shouldReindexAll_readOnly__lastTime = CFAbsoluteTimeGetCurrent();
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  double Current;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 0x2711uLL)
  {
    v2 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 32), "commitUpdates:", v2);
    _setup_block(&__block_literal_global_586, 0, 4121);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], v3);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v4 = *(double *)&openIndex_shouldReindexAll_readOnly__lastTime;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current > v4 + *(double *)&decay_time)
  {
    objc_msgSend((id)buckets, "decay:", (uint64_t)((Current - *(double *)&openIndex_shouldReindexAll_readOnly__lastTime)* (double)bulk_budget_threshold/ (*(double *)&decay_time* *(double *)&decay_denominator)));
    openIndex_shouldReindexAll_readOnly__lastTime = *(_QWORD *)&Current;
  }
  if (*(_BYTE *)(a1 + 68)
    || !*(_QWORD *)(a1 + 40)
    || (objc_msgSend(*(id *)(a1 + 32), "owner"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isForegroundFileProviderBundleID:", *(_QWORD *)(a1 + 40)),
        v8,
        (v9 & 1) == 0))
  {
    openIndex_shouldReindexAll_readOnly__totalCost[*(int *)(a1 + 64)] += *(_QWORD *)(a1 + 56);
    objc_msgSend((id)buckets, "addValue:forKey:");
    v6 = *(int *)(a1 + 64);
    v7 = openIndex_shouldReindexAll_readOnly__totalCost[v6];
    if (v7 - openIndex_shouldReindexAll_readOnly__lastReport[v6] > budget_check_threshold)
    {
      check_admission[v6] = 1;
      openIndex_shouldReindexAll_readOnly__lastReport[v6] = v7;
    }
  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_6()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryIndex();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "commitUpdates completed.", v1, 2u);
  }

}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_588(uint64_t result, int a2)
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)(*(_QWORD *)(result + 32) + 8);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + a2, v2));
  return result;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_590(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[SPConcreteCoreSpotlightIndexer fetchItemForURL:](SPConcreteCoreSpotlightIndexer, "fetchItemForURL:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "providerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "itemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coreSpotlightIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v9[0] = v4;
        v9[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_3_592(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v5 = 0;
  if (a2 && a4)
  {
    v9 = (void *)*MEMORY[0x24BDC81A0];
    if (a3)
      v9 = a3;
    v10 = (objc_class *)MEMORY[0x24BDC82E8];
    v11 = v9;
    v12 = a2;
    v13 = (void *)objc_msgSend([v10 alloc], "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v12, v11, a4);

    +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:recursively:timeout:](SPConcreteCoreSpotlightIndexer, "fetchParentsForItemID:recursively:timeout:", v13, 0, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_4_594(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v5 = 0;
  if (a2 && a4)
  {
    v9 = (void *)*MEMORY[0x24BDC81A0];
    if (a3)
      v9 = a3;
    v10 = (objc_class *)MEMORY[0x24BDC82E8];
    v11 = v9;
    v12 = a2;
    v13 = (void *)objc_msgSend([v10 alloc], "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v12, v11, a4);

    +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:recursively:timeout:](SPConcreteCoreSpotlightIndexer, "fetchParentsForItemID:recursively:timeout:", v13, 1, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = v5;

  return v14;
}

id __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_610(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_615(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  objc_msgSend(*(id *)(a1 + 32), "_expireCorruptIndexFilesWithPath:keepLatest:", *(_QWORD *)(a1 + 40), 1);
  objc_autoreleasePoolPop(v2);
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_616(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    logForCSLogCategoryIndex();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v14 = CFSTR("YES");
      if (!a3)
        v14 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v20 = v13;
      v21 = 2048;
      v22 = a2;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEFAULT, "Dropping finish-draining-journal, dataclass:%@, index:%p, canceled:%@", buf, 0x20u);
    }

  }
  else
  {
    v8 = sIndexQueue;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_617;
    v15[3] = &unk_24D0EB5F8;
    v15[4] = WeakRetained;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v16 = v9;
    v17 = v10;
    v18 = *(_DWORD *)(a1 + 56);
    _setup_block(v15, 0, 4518);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, v11);

  }
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_617(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  id *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_group_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  dispatch_group_t v46;
  _QWORD v47[5];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[16])
  {
    objc_msgSend(v2, "indexFinishedDrainingJournal");
    v3 = (void *)SICopyProperty();
    if (!v3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (getSystemVersionString(),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToString:", v3),
          v4,
          (v5 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "issueDuplicateOidCheck");
    }
    if (sPrivate)
      goto LABEL_40;
    objc_msgSend(*(id *)(a1 + 32), "dataclass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDD0CE0];
    v8 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CE0]);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "getPropertyForKey:", CFSTR("MessagesFixupVersion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", &unk_24D0FD210) & 1) == 0)
      {
        v10 = *(void **)(a1 + 32);
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_620;
        v47[3] = &unk_24D0EB060;
        v47[4] = v10;
        objc_msgSend(v10, "issueMessagesFixup:", v47);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "getPropertyForKey:", CFSTR("DeviceBootTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v49 = v13;
      v50 = 2112;
      v51 = v11;
      _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEFAULT, "Comparing bootTime:%@ with stored bootTime:%@", buf, 0x16u);
    }

    if (v11
      && *(_QWORD *)(a1 + 40)
      && (objc_msgSend(v11, "timeIntervalSince1970"),
          v15 = v14,
          objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970"),
          v15 - v16 <= 5.0))
    {
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
      v41 = v40;
      objc_msgSend(v11, "timeIntervalSince1970");
      v17 = v41 - v42 <= 5.0;
    }
    else
    {
      v17 = 0;
    }
    v18 = (id *)(a1 + 40);
    if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0 || v17)
    {
      if (v17)
      {
        objc_msgSend(v11, "timeIntervalSince1970");
        v29 = v28;
        objc_msgSend(*v18, "timeIntervalSince1970");
        if (v29 != v30)
        {
          logForCSLogCategoryDefault();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_617_cold_1();

        }
      }
      logForCSLogCategoryDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = *v18;
        *(_DWORD *)buf = 138412290;
        v49 = v33;
        _os_log_impl(&dword_213CF1000, v32, OS_LOG_TYPE_DEFAULT, "BootTimeDate %@ (matched)", buf, 0xCu);
      }

      v26 = dispatch_group_create();
      objc_msgSend(*(id *)(a1 + 32), "requestRequiresImportWithoutSandboxExtension:maxCount:", v26, 128);
      v34 = sIndexQueue;
      _setup_block(&__block_literal_global_625, 0, 4495);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v26, v34, v35);

      v36 = dispatch_group_create();
      objc_msgSend(*(id *)(a1 + 32), "restartAttachmentImport:maxCount:", v36, 256);
      v37 = sIndexQueue;
      _setup_block(&__block_literal_global_627, 0, 4501);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v36, v37, v38);

    }
    else
    {
      logForCSLogCategoryDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v18, "timeIntervalSince1970");
        v21 = v20;
        objc_msgSend(v11, "timeIntervalSince1970");
        *(_DWORD *)buf = 134218240;
        v49 = v21;
        v50 = 2048;
        v51 = v22;
        _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_DEFAULT, "Mismatch! bootTime:%.0f with stored bootTime:%.0f", buf, 0x16u);
      }

      v23 = dispatch_group_create();
      objc_msgSend(*(id *)(a1 + 32), "removeSandboxExtensions:", v23);
      v24 = sIndexQueue;
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_621;
      v44[3] = &unk_24D0EA8C0;
      v25 = *(void **)(a1 + 40);
      v44[4] = *(_QWORD *)(a1 + 32);
      v45 = v25;
      v46 = v23;
      v26 = v23;
      _setup_block(v44, 0, 4485);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v26, v24, v27);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "issuePriorityIndexFixup") & 1) == 0
      && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
    {
      if (sUsePriorityIndex != 1)
        goto LABEL_45;
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "isEqualToString:", CFSTR("Priority")) & 1) != 0)
      {
LABEL_36:
        if (*(_DWORD *)(a1 + 56) == 2
          || (v39 = objc_msgSend(*(id *)(a1 + 32), "getIntegerPropertyForKey:", CFSTR("AppsFixupVersion")),
              v39 != objc_msgSend(&unk_24D0FD270, "integerValue")))
        {
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_631;
          v43[3] = &unk_24D0EA758;
          v43[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend((id)sDelegate, "updateApplicationsWithCompletion:clean:", v43, 0);
        }
        goto LABEL_39;
      }
      if ((sUsePriorityIndex & 1) == 0)
      {
LABEL_45:
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 168), "isEqualToString:", v7))
          goto LABEL_36;
      }
    }
LABEL_39:

LABEL_40:
  }
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_2_620(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setProperty:forKey:sync:", &unk_24D0FD210, CFSTR("MessagesFixupVersion"), 1);
  return result;
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_621(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", *(_QWORD *)(a1 + 40), CFSTR("DeviceBootTime"), 1);
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Set BootTimeDate %@ (post cleanup)", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "requestRequiresImportWithoutSandboxExtension:maxCount:", *(_QWORD *)(a1 + 48), 1024);
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "removeSandboxExtensions notify done", (uint8_t *)&v8, 2u);
  }

  v5 = *(NSObject **)(a1 + 48);
  v6 = sIndexQueue;
  _setup_block(&__block_literal_global_623, 0, 4484);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, v6, v7);

}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_622()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "requestRequiresImportWithoutSandboxExtension notify done", v1, 2u);
  }

}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_624()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "requestRequiresImportWithoutSandboxExtension notify done", v1, 2u);
  }

}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_626()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "restartAttachmentImport notify done", v1, 2u);
  }

}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_631(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", &unk_24D0FD270, CFSTR("AppsFixupVersion"), 0);
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_636()
{
  return objc_msgSend(MEMORY[0x24BDC2470], "notifyIndexDelegates");
}

- (int)openIndex:(BOOL)a3 shouldReindexAll:(BOOL)a4
{
  return -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:readOnly:](self, "openIndex:shouldReindexAll:readOnly:", a3, a4, 0);
}

- (int)openIndex:(BOOL)a3
{
  return -[SPConcreteCoreSpotlightIndexer openIndex:shouldReindexAll:](self, "openIndex:shouldReindexAll:", a3, a3);
}

- (int)openJWLIndex
{
  int v2;
  __CFString *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  NSString *dataclass;
  uint8_t buf[4];
  _QWORD v13[2];
  char buffer[1024];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((sShuttingDown & 1) == 0)
  {
    if (self->_jwlIndex)
      return 0;
    -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    bzero(buffer, 0x400uLL);
    if (CFStringGetFileSystemRepresentation(v4, buffer, 1024))
    {
      v5 = open(buffer, 0x8000);
      if (v5 < 0)
      {
        logForCSLogCategoryIndex();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          dataclass = self->_dataclass;
          *(_DWORD *)buf = 138412290;
          v13[0] = dataclass;
          _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "No index for for dataclass:%@ - can't open to journal", buf, 0xCu);
        }

        v2 = -1;
        goto LABEL_17;
      }
      v6 = v5;
      protectionClassIntValue(self->_dataclass);
      v2 = SIOpenJWLIndex();
      close(v6);
      if ((v2 & 0x80000000) == 0)
      {
        self->_jwlIndex = 0;
        logForCSLogCategoryIndex();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = self->_dataclass;
          *(_DWORD *)buf = 67109378;
          LODWORD(v13[0]) = v2;
          WORD2(v13[0]) = 2112;
          *(_QWORD *)((char *)v13 + 6) = v8;
          _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "JWL index open, result:%d, dataclass:%@", buf, 0x12u);
        }
LABEL_13:

        self->_hasAssertion = 0;
        self->_assertionEndTime = 0.0;
        self->_suspended = 1;
LABEL_17:

        return v2;
      }
    }
    else
    {
      v2 = -1;
    }
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer openJWLIndex].cold.1();
    goto LABEL_13;
  }
  return -1;
}

- (BOOL)clientIsCheckedIn:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[NSMapTable objectForKey:](self->_checkedInClients, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke(int8x16_t *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint64_t v9;

  if (objc_msgSend(a2, "containsObject:", a1[2].i64[0]))
  {
    v3 = sIndexQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_2;
    v7[3] = &unk_24D0EABF0;
    v9 = a1[3].i64[0];
    v6 = a1[2];
    v4 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    _setup_block(v7, 0, 4736);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, v5);

  }
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[16] && v2[8] == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v2, "_addNewClientWithBundleID:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "index");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138413314;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p, createCount:%lu/%lu", (uint8_t *)&v9, 0x34u);

    }
  }
}

void __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_642(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    logForCSLogCategoryIndex();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
      v13 = CFSTR("YES");
      if (!a3)
        v13 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2048;
      v21 = a2;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "Dropping check-in for known client, bundleID:%@, dataclass:%@, index:%p, canceled:%@", buf, 0x2Au);
    }

  }
  else
  {
    v8 = sIndexQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_643;
    v14[3] = &unk_24D0EA9D8;
    v14[4] = WeakRetained;
    v15 = *(id *)(a1 + 32);
    _setup_block(v14, 0, 4752);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, v9);

  }
}

uint64_t __72__SPConcreteCoreSpotlightIndexer_checkInWithBundleID_completionHandler___block_invoke_643(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexFinishedDrainingJournal:", *(_QWORD *)(a1 + 40));
}

- (void)addClients:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  SPConcreteCoreSpotlightIndexer *v10;

  v4 = a3;
  v5 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SPConcreteCoreSpotlightIndexer_addClients___block_invoke;
  v8[3] = &unk_24D0EA9D8;
  v9 = v4;
  v10 = self;
  v6 = v4;
  _setup_block(v8, 0, 4768);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v7);

}

void __45__SPConcreteCoreSpotlightIndexer_addClients___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v4 + 168);
    v6 = *(_QWORD *)(v4 + 32);
    *(_DWORD *)buf = 138412802;
    v20 = v3;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "addClients, bundleIDs:%@, dataclass:%@, checkedInClients:%@", buf, 0x20u);
  }

  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKnownClients:", v8);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 200);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 40), "checkInWithBundleID:completionHandler:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_addNewClientWithBundleID:(id)a3
{
  id v4;
  void *v5;
  __SI *index;
  NSObject *v7;
  void *v8;
  _BOOL4 readOnly;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  -[NSSet setByAddingObject:](self->_knownClients, "setByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer setKnownClients:](self, "setKnownClients:", v5);

  location = 0;
  objc_initWeak(&location, self);
  index = self->_index;
  if (index)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke;
    v10[3] = &unk_24D0EB690;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    v11 = v4;
    SIBackgroundOpBlock((uint64_t)index, 0, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      readOnly = self->_readOnly;
      *(_DWORD *)buf = 138413058;
      v15 = v4;
      v16 = 2112;
      v17 = v8;
      v18 = 2048;
      v19 = MEMORY[0x24BDAE888];
      v20 = 1024;
      v21 = readOnly;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p,  readOnly:%d", buf, 0x26u);

    }
  }
  objc_destroyWeak(&location);

}

void __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (a3 || !WeakRetained || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97))
  {
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "dataclass");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("YES");
      v13 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97);
      *(_DWORD *)buf = 138413314;
      if (!a3)
        v12 = CFSTR("NO");
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      v28 = 2048;
      v29 = a2;
      v30 = 2112;
      v31 = v12;
      v32 = 1024;
      v33 = v13;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Dropping check-in for new client, bundleID:%@, dataclass:%@, index:%p, canceled:%@, readOnly:%d", buf, 0x30u);

    }
  }
  else
  {
    if ((objc_msgSend(WeakRetained, "denyOperationOnAssertedIndex:", "_addNewClientWithBundleID") & 1) != 0)
      goto LABEL_9;
    v21[0] = CFSTR("_kMDItemBundleID");
    v21[1] = CFSTR("_kMDItemExternalID");
    v14 = *(_QWORD *)(a1 + 40);
    v22[0] = CFSTR("com.apple.searchd");
    v22[1] = v14;
    v21[2] = CFSTR("_kMDClientCheckedIn");
    v22[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke_647;
    v17[3] = &unk_24D0EB6B8;
    v18 = *(id *)(a1 + 40);
    v19 = v7;
    v20 = a2;
    v16 = (const void *)objc_msgSend(v17, "copy");
    if (!SISetCSAttributes())
      CFRelease(v16);

  }
LABEL_9:

}

void __60__SPConcreteCoreSpotlightIndexer__addNewClientWithBundleID___block_invoke_647(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "dataclass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "Recorded check-in for new client, bundleID:%@, dataclass:%@, index:%p, error:%@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "dirty");

}

- (void)performIndexerTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[SPConcreteCoreSpotlightIndexer owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke;
  v14[3] = &unk_24D0EB708;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  _setup_block(v14, 0, 4841);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, v13);

}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = a1[4];
  v5 = a1[5];
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2;
  v17[3] = &unk_24D0EB6E0;
  v7 = v2;
  v18 = v7;
  v19 = v3;
  v8 = v3;
  objc_msgSend(v4, "performIndexerTask:withIndexDelegatesAndCompletionHandler:", v5, v17);
  objc_msgSend(a1[4], "firstUnlockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3;
  v12[3] = &unk_24D0EB708;
  v13 = a1[5];
  v14 = v7;
  v15 = a1[6];
  v16 = a1[7];
  v10 = v7;
  _setup_block(v12, 0, 4840);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v8, v9, v11);

}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __71__SPConcreteCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3(uint64_t a1)
{
  SPCoreSpotlightIndexerTask *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SPCoreSpotlightIndexerTask *v7;

  v2 = [SPCoreSpotlightIndexerTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "job");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "indexers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v2, "initWithIndexJob:indexers:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexerTask setBundleIDs:](v7, "setBundleIDs:", v5);

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexerTask setCompletedBundleIDs:](v7, "setCompletedBundleIDs:", v6);

  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v7, "setDataMigrationStage:", objc_msgSend(*(id *)(a1 + 32), "dataMigrationStage"));
  -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v7, "setShouldResumeOnFailure:", objc_msgSend(*(id *)(a1 + 32), "shouldResumeOnFailure"));
  objc_msgSend(*(id *)(a1 + 48), "performIndexerTask:withIndexExtensionsAndCompletionHandler:", v7, *(_QWORD *)(a1 + 56));

}

- (void)performIndexerTask:(id)a3 withIndexDelegatesAndCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  SPConcreteCoreSpotlightIndexer *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke;
  v13[3] = &unk_24D0EB758;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x2199C2F34](v13);
  -[SPConcreteCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  _setup_block(v10, 0, 4909);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v12);

}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "job");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(a1[4], "bundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);
  }
  else
  {
    objc_msgSend(*((id *)a1[5] + 4), "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v7);

  }
  objc_msgSend(a1[4], "completedBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(a1[4], "completedBundleIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v5, "minusSet:", v12);

  }
  v36 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = dispatch_group_create();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = v5;
  objc_msgSend(v5, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    v34 = (void *)*MEMORY[0x24BDD0CE0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(*((id *)a1[5] + 4), "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          if (!objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
            continue;
          objc_msgSend(*((id *)a1[5] + 4), "objectForKey:", CFSTR("com.apple.assetsd"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            continue;
        }
        if (objc_msgSend(v2, "jobType") == 2)
        {
          if (objc_msgSend(*((id *)a1[5] + 5), "containsObject:", v18))
          {
            logForCSLogCategoryIndex();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = a1[5];
              v22 = v21[21];
              v23 = v21[25];
              v24 = v21[5];
              *(_DWORD *)buf = 138413314;
              v52 = v2;
              v53 = 2112;
              v54 = v18;
              v55 = 2112;
              v56 = v22;
              v57 = 2112;
              v58 = v23;
              v59 = 2112;
              v60 = v24;
              _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "Dropping job:%@ with checked-in client for bundleID:%@, dataclass:%@, knownClients:%@, reindexAllDelegateBundleIDs:%@", buf, 0x34u);
            }
LABEL_25:

            continue;
          }
          objc_msgSend(*((id *)a1[5] + 5), "addObject:", v18);
        }
        logForCSLogCategoryIndex();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = *((_QWORD *)a1[5] + 21);
          *(_DWORD *)buf = 138412802;
          v52 = v2;
          v53 = 2112;
          v54 = v18;
          v55 = 2112;
          v56 = v26;
          _os_log_impl(&dword_213CF1000, v25, OS_LOG_TYPE_INFO, "Performing job:%@ with the checked-in client for bundleID:%@, dataclass:%@", buf, 0x20u);
        }

        dispatch_group_enter(v13);
        v20 = *((id *)a1[5] + 21);
        if (objc_msgSend(*((id *)a1[5] + 21), "isEqual:", CFSTR("Priority")))
        {
          v27 = v34;

          v20 = v27;
        }
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_650;
        v40[3] = &unk_24D0EB730;
        v28 = v2;
        v41 = v28;
        v42 = v18;
        v43 = a1[5];
        v44 = v36;
        v45 = a1[4];
        v46 = v13;
        objc_msgSend(v19, "performIndexJob:protectionClass:acknowledgementHandler:", v28, v20, v40);

        goto LABEL_25;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v15);
  }

  objc_msgSend(a1[5], "firstUnlockQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_651;
  v37[3] = &unk_24D0EA840;
  v30 = a1[6];
  v38 = v36;
  v39 = v30;
  v31 = v36;
  _setup_block(v37, 0, 4907);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v13, v29, v32);

}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_650(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    *(_DWORD *)buf = 138413058;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "Done performing job:%@ with the checked-in client for bundleID:%@, dataclass:%@, error:%@", buf, 0x2Au);
  }

  if (!v3)
  {
    v8 = *(id *)(a1 + 56);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v8);

  }
  v9 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addCompletedBundleIDs:forIndexerTask:", v10, *(_QWORD *)(a1 + 64));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __92__SPConcreteCoreSpotlightIndexer_performIndexerTask_withIndexDelegatesAndCompletionHandler___block_invoke_651(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)startReindexAll
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", CFSTR("SPReindexAllStarted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", MEMORY[0x24BDBD1A8], CFSTR("SPReindexAllCompletedBundleIDs"), 0);
    -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", MEMORY[0x24BDBD1C8], CFSTR("SPReindexAllStarted"), 1);
    v4 = 0;
  }
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SDTraceAdd(3, CFSTR("Reindexall start"), 0, v5, 0, 0.0);

  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("NO");
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    if (v4)
      v8 = CFSTR("YES");
    v12 = CFSTR("SPReindexAllStarted");
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@/YES", (uint8_t *)&v9, 0x20u);

  }
}

- (void)finishReindexAll
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", MEMORY[0x24BDBD1C0], CFSTR("SPReindexAllStarted"), 0);
  -[SPConcreteCoreSpotlightIndexer setProperty:forKey:sync:](self, "setProperty:forKey:sync:", MEMORY[0x24BDBD1A8], CFSTR("SPReindexAllCompletedBundleIDs"), 1);
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SDTraceAdd(3, CFSTR("Reindexall complete"), 0, v3, 0, 0.0);

  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = CFSTR("SPReindexAllStarted");
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "dataclass:%@, %@:NO", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)reindexAllStarted
{
  void *v2;
  char v3;

  -[SPConcreteCoreSpotlightIndexer getPropertyForKey:](self, "getPropertyForKey:", CFSTR("SPReindexAllStarted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)fetchAllCompletedBundleIDsForIndexerTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "job");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "jobType") == 2 && (objc_msgSend(v6, "shouldResumeOnFailure") & 1) != 0)
  {
    v9 = sIndexQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __93__SPConcreteCoreSpotlightIndexer_fetchAllCompletedBundleIDsForIndexerTask_completionHandler___block_invoke;
    v11[3] = &unk_24D0EB780;
    v11[4] = self;
    v12 = v7;
    _setup_block(v11, 0, 4962);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, v10);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __93__SPConcreteCoreSpotlightIndexer_fetchAllCompletedBundleIDsForIndexerTask_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "reindexAllStarted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "getPropertyForKey:", CFSTR("SPReindexAllCompletedBundleIDs"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
      else
        v3 = 0;
    }
    else
    {
      v3 = 0;
    }
    v4 = v3;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138413314;
      v9 = v6;
      v10 = 2112;
      v11 = CFSTR("SPReindexAllStarted");
      v12 = 2112;
      v13 = CFSTR("YES");
      v14 = 2112;
      v15 = CFSTR("SPReindexAllCompletedBundleIDs");
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@, %@:%@", (uint8_t *)&v8, 0x34u);

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);

  }
}

- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "job");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "jobType") == 2
    && objc_msgSend(v6, "count")
    && objc_msgSend(v7, "shouldResumeOnFailure"))
  {
    v9 = sIndexQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__SPConcreteCoreSpotlightIndexer_addCompletedBundleIDs_forIndexerTask___block_invoke;
    v11[3] = &unk_24D0EA9D8;
    v11[4] = self;
    v12 = v6;
    _setup_block(v11, 0, 4988);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, v10);

  }
}

void __71__SPConcreteCoreSpotlightIndexer_addCompletedBundleIDs_forIndexerTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "reindexAllStarted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "getPropertyForKey:", CFSTR("SPReindexAllCompletedBundleIDs"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDBD1A8];
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
    }
    v4 = v3;
    v5 = objc_msgSend(v4, "count");
    v6 = objc_msgSend(*(id *)(a1 + 40), "count") + v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", v6);
    objc_msgSend(v7, "addObjectsFromArray:", v4);

    objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryIndex();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138413570;
      v13 = v10;
      v14 = 2112;
      v15 = CFSTR("SPReindexAllStarted");
      v16 = 2112;
      v17 = CFSTR("YES");
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = CFSTR("SPReindexAllCompletedBundleIDs");
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "dataclass:%@, %@:%@, bundleIDs:%@, %@:%@", (uint8_t *)&v12, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", v8, CFSTR("SPReindexAllCompletedBundleIDs"), 1);

  }
}

- (void)coolDown:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *dataclass;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_index)
  {
    v4 = a3;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      v7 = 138412290;
      v8 = dataclass;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Index %@ coolDown", (uint8_t *)&v7, 0xCu);
    }

    -[SPConcreteCoreSpotlightIndexer commitUpdates:](self, "commitUpdates:", v4);
  }
}

- (void)issueSplit
{
  if (self->_index)
    _SIIssueSplit();
}

- (void)mergeWithGroup:(id)a3
{
  if (self->_index)
    _SIIssueFullMergeWithGroup();
}

- (void)mergeWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  NSObject *v7;
  NSString *dataclass;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD, _QWORD);
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    -[SPConcreteCoreSpotlightIndexer mergeWithCompletionHandler:].cold.1();
  v5 = (void (**)(_QWORD, _QWORD))v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (self->_index && (!self->_suspended || self->_softSuspended))
  {
    v6 = dispatch_group_create();
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      v14 = dataclass;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Performing full merge, dataclass:%@", buf, 0xCu);
    }

    _SIIssueFullMergeWithGroup();
    dispatch_get_global_queue(9, 2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__SPConcreteCoreSpotlightIndexer_mergeWithCompletionHandler___block_invoke;
    v11[3] = &unk_24D0EB780;
    v11[4] = self;
    v12 = v5;
    dispatch_group_notify(v6, v9, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v10);

  }
}

uint64_t __61__SPConcreteCoreSpotlightIndexer_mergeWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Completed full merge, dataclass:%@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cleanupStringsWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  void (**v9)(_QWORD, _QWORD);

  v4 = a3;
  if (!v4)
    -[SPConcreteCoreSpotlightIndexer cleanupStringsWithCompletionHandler:].cold.1();
  v5 = (void (**)(_QWORD, _QWORD))v4;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (self->_index && !self->_suspended)
  {
    v6 = dispatch_group_create();
    -[SPConcreteCoreSpotlightIndexer cleanupStringsWithActivity:group:shouldDefer:flags:](self, "cleanupStringsWithActivity:group:shouldDefer:flags:", 0, v6, 0, 0);
    dispatch_get_global_queue(9, 2uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__SPConcreteCoreSpotlightIndexer_cleanupStringsWithCompletionHandler___block_invoke;
    block[3] = &unk_24D0EA938;
    v9 = v5;
    dispatch_group_notify(v6, v7, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSObject *))v5)[2](v5, v6);
  }

}

uint64_t __70__SPConcreteCoreSpotlightIndexer_cleanupStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cleanupStringsWithActivity:(id)a3 group:(id)a4 shouldDefer:(BOOL *)a5 flags:(int)a6
{
  if (self->_index)
    _SICleanupStrings();
}

- (void)issueDefrag:(id)a3
{
  id v4;
  NSString *dataclass;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_index)
  {
    dataclass = self->_dataclass;
    v8[0] = CFSTR("defrag");
    v8[1] = dataclass;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SDTransactionCreate(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _SIIssueDefrag();
    if (v4)
    {
      syncContextCreate(v4, v7);
      SISynchedOp();
    }

  }
}

- (void)issueRepair
{
  if (self->_index)
    _SIIssueRecovery();
}

- (void)issueConsistencyCheck
{
  if (self->_index)
    _SIConsistencyCheck();
}

- (void)issueDuplicateOidCheck
{
  if (self->_index)
    _SICheckIndexForDuplicateOids();
}

- (void)fixupMessageAttachmentsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __SI *index;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, void *);
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[5];
  NSObject *v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  uint8_t buf[16];
  _QWORD v33[5];
  id v34;
  _QWORD v35[3];
  int v36;
  _QWORD v37[3];
  int v38;

  v4 = (void (**)(id, void *))a3;
  if (self->_readOnly)
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SPConcreteCoreSpotlightIndexer fixupMessageAttachmentsWithCompletionHandler:].cold.1();

    goto LABEL_6;
  }
  if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "fixupMessageAttachmentsWithCompletionHandler"))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, v6);

    goto LABEL_9;
  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  v34 = 0;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments starting", buf, 2u);
  }

  SDTransactionCreate(&unk_24D0FCF88);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke;
  v29[3] = &unk_24D0EB7A8;
  v31 = v33;
  v11 = v9;
  v30 = v11;
  v12 = (void *)MEMORY[0x2199C2F34](v29);
  index = self->_index;
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2;
  v24[3] = &unk_24D0EB848;
  v24[4] = self;
  v27 = v37;
  v14 = v11;
  v25 = v14;
  v28 = v35;
  v15 = v12;
  v26 = v15;
  SIBackgroundOpBlock((uint64_t)index, 0, v24);
  v16 = sIndexQueue;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_677;
  v19[3] = &unk_24D0EB870;
  v22 = v33;
  v23 = v37;
  v21 = v4;
  v17 = v8;
  v20 = v17;
  _setup_block(v19, 0, 5260);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v14, v16, v18);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
LABEL_9:

}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 89;
  }
  else
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3;
    v17 = &unk_24D0EB820;
    v23 = a2;
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 32);
    v21 = v4;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 64);
    v19 = v6;
    v22 = v7;
    v20 = *(id *)(a1 + 48);
    v8 = (void *)MEMORY[0x2199C2F34](&v14);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\" && _kMDItemDomainIdentifier=attachmentDomain && _kMDItemUserActivityType!=* && kMDItemRelatedUniqueIdentifier=*"), CFSTR("com.apple.MobileSMS"), v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[16];
    v12 = *MEMORY[0x24BDC2170];
    v24[0] = *MEMORY[0x24BDC22E8];
    v24[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v11, v9, v13, &unk_24D0FCFA0, v8);

    if ((v10 & 1) != 0)
    {

      return;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 22;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  uint64_t v10;
  unsigned int VectorCount;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  if (a3)
  {
    if (a3 == 1)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "index") != *(_QWORD *)(a1 + 72))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (!*(_DWORD *)(v10 + 24))
          *(_DWORD *)(v10 + 24) = 22;
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 72))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    VectorCount = _MDStoreOIDArrayGetVectorCount();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", VectorCount);
    v13 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_4;
    v27[3] = &unk_24D0EB150;
    v14 = v12;
    v28 = v14;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 2, 0, v27);
    v15 = objc_msgSend(v14, "count");
    logForCSLogCategoryIndex();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_DWORD *)buf = 67109632;
      v30 = v17;
      v31 = 1024;
      v32 = v15;
      v33 = 1024;
      v34 = VectorCount;
      _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments update batch %d count %d (%d)", buf, 0x14u);
    }

    if (v15)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v18 = sIndexQueue;
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_671;
      v23[3] = &unk_24D0EB7F8;
      v19 = *(_QWORD *)(a1 + 72);
      v23[4] = *(_QWORD *)(a1 + 32);
      v26 = v19;
      v22 = *(_OWORD *)(a1 + 48);
      v20 = (id)v22;
      v25 = v22;
      v24 = v14;
      _setup_block(v23, 0, 5226);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v18, v21);

    }
  }

}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  if (*a2)
  {
    v3 = a2[1];
    if (v3)
    {
      if (v2 != *MEMORY[0x24BDBD430] && v3 != *MEMORY[0x24BDBD430])
      {
        v5 = *(void **)(a1 + 32);
        v6 = *MEMORY[0x24BDC2170];
        v8[0] = *MEMORY[0x24BDC22E8];
        v8[1] = v6;
        v9[0] = v2;
        v9[1] = v3;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
    }
  }
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_671(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "index");
  if (v2 == *(_QWORD *)(a1 + 64))
  {
    v3 = v2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2_672;
    v6[3] = &unk_24D0EB7D0;
    v5 = *(_OWORD *)(a1 + 48);
    v4 = (id)v5;
    v8 = v5;
    v7 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v3, 0, v6);

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 22;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_2_672(uint64_t a1, uint64_t a2, int a3)
{
  const void *v4;
  uint64_t v5;

  if (a3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 89;
  v4 = (const void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  if (!SISetCSAttributes())
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_DWORD *)(v5 + 24))
      *(_DWORD *)(v5 + 24) = 22;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CFRelease(v4);
  }
}

id __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_677(_QWORD *a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v2 = a1 + 6;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    || *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24)
    && (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0),
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = *(_QWORD *)(*v2 + 8),
        v8 = *(void **)(v7 + 40),
        *(_QWORD *)(v7 + 40) = v6,
        v8,
        *(_QWORD *)(*(_QWORD *)(*v2 + 8) + 40)))
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_677_cold_1();
  }
  else
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "fixupMessageAttachments complete", v9, 2u);
    }
  }

  v4 = a1[5];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(*v2 + 8) + 40));
  return (id)objc_opt_self();
}

- (void)issueMessagesFixup:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_index && !self->_suspended)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__SPConcreteCoreSpotlightIndexer_issueMessagesFixup___block_invoke;
    v7[3] = &unk_24D0EB898;
    v8 = v4;
    -[SPConcreteCoreSpotlightIndexer fixupMessageAttachmentsWithCompletionHandler:](self, "fixupMessageAttachmentsWithCompletionHandler:", v7);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

uint64_t __53__SPConcreteCoreSpotlightIndexer_issueMessagesFixup___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_appendRervseInfo:(id)a3 dictionary:(id)a4 key:(id)a5 level:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "appendString:", CFSTR("\n"));
  if (a6)
  {
    v13 = a6;
    do
    {
      objc_msgSend(v10, "appendString:", CFSTR("  "));
      --v13;
    }
    while (v13);
  }
  objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v12);
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        v19 = a6 + 1;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            -[SPConcreteCoreSpotlightIndexer _appendRervseInfo:dictionary:key:level:](self, "_appendRervseInfo:dictionary:key:level:", v10, v11, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), v19);
          }
          while (v17 != v20);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v17);
      }

    }
    else
    {
      -[SPConcreteCoreSpotlightIndexer _appendRervseInfo:dictionary:key:level:](self, "_appendRervseInfo:dictionary:key:level:", v10, v11, v14, a6 + 1);
    }
  }

}

- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  __SI *index;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v7 = v6;
  index = self->_index;
  if (index)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke;
    v9[3] = &unk_24D0EB8E8;
    v11 = a3;
    v9[4] = self;
    v10 = v6;
    SISynchedOpWithBlock((uint64_t)index, 4, v9);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  _BYTE v25[128];
  _BYTE v26[4096];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v5 = (void *)objc_opt_new();
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2;
      v23 = &unk_24D0EB8C0;
      v6 = &v24;
      v7 = v5;
      v24 = v7;
      _SIReverseStoreIterate();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("### Reverse Store"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        bzero(v26, 0x1000uLL);
        processReverseInfo((uint64_t)v26, 0, v8, v7, &unk_24D0FD288);
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v7, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              processReverseInfo((uint64_t)v26, 0, v8, v7, *(void **)(*((_QWORD *)&v16 + 1) + 8 * i));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
          }
          while (v11);
        }

        objc_msgSend(v8, "dataUsingEncoding:", 4);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("### Reverse Store"));
      v6 = &v15;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v15;
      _SIReverseStoreIterate();
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v4, 0);

}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9[0] = v5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);
  }

}

uint64_t __69__SPConcreteCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lld %lld\n"), a2, a3);
}

- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  __SI *index;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = v5;
  index = self->_index;
  if (index)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke;
    v8[3] = &unk_24D0EB938;
    v9 = v5;
    SISynchedOpWithBlock((uint64_t)index, 4, v8);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int, uint64_t);
  void *v15;

  if (a3)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    v5 = _SIGetIndexCount();
    if (v5 >= 1)
    {
      v6 = v5;
      v7 = 0;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("### Forward Store (%d)\n"), v7, v12, v13, v14, v15);
        v12 = v8;
        v13 = 3221225472;
        v14 = __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2;
        v15 = &unk_24D0EB910;
        v9 = v4;
        _SIDirectoryStoreIterate();

        ++v7;
      }
      while (v6 != v7);
      v4 = v9;
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

uint64_t __69__SPConcreteCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (21 * a2 + 21);
  v7 = (char *)v18 - ((v6 + 15) & 0x1FFFFFFF0);
  bzero(v7, v6);
  *v7 = 0;
  v8 = v7;
  if (a2 >= 1)
  {
    if (a2 >= 512)
      v9 = 512;
    else
      v9 = a2;
    v8 = v7;
    do
    {
      v10 = *(_QWORD *)(a3 + 8 * (v9 - 1));
      *v8 = 47;
      v11 = -1;
      v12 = 1;
      v13 = v10;
      do
      {
        v14 = v12;
        v15 = v13 + 9;
        v13 /= 10;
        ++v11;
        ++v12;
      }
      while (v15 > 0x12);
      do
      {
        v8[v14--] = v10 % 10 + 48;
        v10 /= 10;
      }
      while (v14 > 0);
      v8 += v11 + 2;
    }
    while (v9-- > 1);
  }
  *v8 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%s\n"), v7);
}

+ (BOOL)dumpCrashStates:(const char *)a3 toFile:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  FILE *v9;
  FILE *v10;
  char *v11;
  const char *v12;
  size_t v13;
  char *v14;
  char *v15;
  DIR *v16;
  DIR *v17;
  dirent *v18;
  dirent *v19;
  size_t v20;
  size_t v21;
  void *v22;
  void *v23;
  void *v24;
  char *v26;
  uint64_t v27;
  size_t v28;
  char *__dst;
  stat v30;

  v5 = a4;
  v6 = v5;
  if (!a3)
    goto LABEL_24;
  v7 = dup(objc_msgSend(v5, "fileDescriptor"));
  if (v7 < 0)
  {
LABEL_23:
    LOBYTE(a3) = 0;
    goto LABEL_24;
  }
  v8 = v7;
  v9 = fdopen(v7, "a");
  if (!v9)
  {
    close(v8);
    goto LABEL_23;
  }
  v10 = v9;
  v11 = strrchr((char *)a3, 47);
  if (!v11
    || v11 == a3
    || (*v11 = 0, v12 = v11 + 1, v13 = strlen(a3), (v14 = (char *)malloc_type_malloc(0x400uLL, 0x59432C55uLL)) == 0))
  {
LABEL_22:
    fclose(v10);
    goto LABEL_23;
  }
  v15 = v14;
  v16 = opendir(a3);
  if (!v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[SPConcreteCoreSpotlightIndexer dumpCrashStates:toFile:].cold.1();
    free(v15);
    goto LABEL_22;
  }
  v17 = v16;
  v18 = readdir(v16);
  if (v18)
  {
    v19 = v18;
    v20 = v13 - 1014;
    v28 = v13 + 1;
    __dst = &v15[v13 + 1];
    v26 = &v15[v13];
    v27 = (uint64_t)&v15[v13 + 2];
    do
    {
      if (v19->d_type == 4 && v19->d_name[0] != 46 && v20 + v19->d_namlen >= 0xFFFFFFFFFFFFFC00)
      {
        v21 = strlen(v12);
        if (!strncmp(v19->d_name, v12, v21))
        {
          __strcpy_chk();
          *v26 = 47;
          strcpy(__dst, v19->d_name);
          v15[v28 + v19->d_namlen] = 47;
          strcpy((char *)(v27 + v19->d_namlen), "mds64-crash-state-v2");
          memset(&v30, 0, sizeof(v30));
          if (!stat(v15, &v30))
          {
            +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nCrash State %s\n"), v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "dataUsingEncoding:", 4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "writeData:toFile:", v24, v6);

            _SICrashStateDump();
            fflush(v10);
          }
        }
      }
      v19 = readdir(v17);
    }
    while (v19);
  }
  free(v15);
  closedir(v17);
  fclose(v10);
  LOBYTE(a3) = 1;
LABEL_24:

  return (char)a3;
}

- (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *indexQueue;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  __SI *index;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  char v56;
  BOOL v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  BOOL v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  id v68;
  int v69;
  void *v70;
  void *v71;
  char v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  size_t v86;
  DIR *v87;
  dirent *v88;
  int d_type;
  char *d_name;
  int v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  char v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v109;
  NSObject *v110;
  void *v111;
  id obj;
  time_t *v113;
  time_t *v114;
  const char *v115;
  size_t v116;
  id v117;
  id v118;
  tm v119;
  stat v120;
  _QWORD v121[4];
  id v122;
  char *v123;
  _QWORD v124[5];
  id v125;
  id v126;
  id v127;
  NSObject *v128;
  uint64_t *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  NSObject *v136;
  char *v137;
  _QWORD block[5];
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  char v142;
  char v143[16];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  char v147[16];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  char v151[16];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  char v155[8];
  char *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v118 = a5;
  v139 = 0;
  v140 = &v139;
  v141 = 0x2020000000;
  v142 = 0;
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("=== Index %@\n\n"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "writeData:toFile:", v14, v8);
  *((_BYTE *)v140 + 24) = v15;

  if (*((_BYTE *)v140 + 24))
  {
    if (!objc_msgSend(v9, "length"))
      goto LABEL_7;
    if (objc_msgSend(v118, "length"))
    {
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bundle: %@\nItem Identifier: %@\n\n"), v9, v118);
    }
    else
    {
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bundle: %@\n\n"), v9);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "writeData:toFile:", v18, v8);
    *((_BYTE *)v140 + 24) = v19;

    if (*((_BYTE *)v140 + 24))
    {
LABEL_7:
      -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
      v117 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v115 = (const char *)objc_msgSend(v117, "fileSystemRepresentation");
      v116 = strlen(v115);
      if (!self->_index || !SIValidIndex())
        goto LABEL_47;
      if (self->_suspended)
      {
        indexQueue = self->_indexQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke;
        block[3] = &unk_24D0EA758;
        block[4] = self;
        dispatch_sync(indexQueue, block);
        if (self->_suspended)
        {
          +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("   Index suspended\n\n"), "dataUsingEncoding:", 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "writeData:toFile:", v22, v8);
          *((_BYTE *)v140 + 24) = v23;

          if (!*((_BYTE *)v140 + 24))
            goto LABEL_73;
          goto LABEL_47;
        }
      }
      v114 = (time_t *)SICopyProperties();
      if (!v114)
      {
LABEL_39:
        v64 = (void *)SICopyCSClientStateCache();
        if (!v64)
          goto LABEL_43;
        +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("ClientStateCache:\n"), "dataUsingEncoding:", 4);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "writeData:toFile:", v66, v8);
        *((_BYTE *)v140 + 24) = v67;

        if (*((_BYTE *)v140 + 24))
        {
          *(_QWORD *)v155 = 0;
          v156 = v155;
          v157 = 0x2020000000;
          LOBYTE(v158) = 1;
          v121[0] = MEMORY[0x24BDAC760];
          v121[1] = 3221225472;
          v121[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_6;
          v121[3] = &unk_24D0EBA00;
          v68 = v8;
          v122 = v68;
          v123 = v155;
          objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v121);
          v69 = v156[24];
          *((_BYTE *)v140 + 24) = v69;
          if (v69)
          {
            +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v70, "writeData:toFile:", v71, v68);
            *((_BYTE *)v140 + 24) = v72;

            v73 = *((_BYTE *)v140 + 24) == 0;
            _Block_object_dispose(v155, 8);
            if (!v73)
            {
LABEL_43:
              v74 = (void *)_SISchedulerCopyDump();
              if (v74)
              {
                +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "description");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "dataUsingEncoding:", 4);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v75, "writeData:toFile:", v77, v8);
                *((_BYTE *)v140 + 24) = v78;

                if (!*((_BYTE *)v140 + 24))
                  goto LABEL_65;
                +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("\n\n"), "dataUsingEncoding:", 4);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = objc_msgSend(v79, "writeData:toFile:", v80, v8);
                *((_BYTE *)v140 + 24) = v81;

                if (!*((_BYTE *)v140 + 24))
                {
LABEL_65:

                  goto LABEL_73;
                }
              }

LABEL_47:
              +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "stringByAppendingString:", CFSTR("\n"));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "dataUsingEncoding:", 4);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v82, "writeData:toFile:", v84, v8);
              *((_BYTE *)v140 + 24) = v85;

              if (*((_BYTE *)v140 + 24))
              {
                v86 = v116 + 1;
                if (v116 + 1 <= 0x3FF)
                {
                  bzero(v155, 0x400uLL);
                  __strcpy_chk();
                  v155[v116] = 47;
                  v155[v86] = 0;
                  v87 = opendir(v155);
                  if (v87)
                  {
                    while (1)
                    {
                      v88 = readdir(v87);
                      if (!v88)
                        break;
                      d_type = v88->d_type;
                      if (d_type != 4 && d_type != 10 && v86 + v88->d_namlen <= 0x3FE)
                      {
                        d_name = v88->d_name;
                        strcpy(&v155[v86], v88->d_name);
                        memset(&v120, 0, sizeof(v120));
                        if (!stat(v155, &v120))
                        {
                          v153 = 0u;
                          v154 = 0u;
                          *(_OWORD *)v151 = 0u;
                          v152 = 0u;
                          v149 = 0u;
                          v150 = 0u;
                          *(_OWORD *)v147 = 0u;
                          v148 = 0u;
                          v145 = 0u;
                          v146 = 0u;
                          *(_OWORD *)v143 = 0u;
                          v144 = 0u;
                          memset(&v119, 0, sizeof(v119));
                          localtime_r(&v120.st_birthtimespec.tv_sec, &v119);
                          strftime(v151, 0x40uLL, "%F %T", &v119);
                          localtime_r(&v120.st_ctimespec.tv_sec, &v119);
                          strftime(v147, 0x40uLL, "%F %T", &v119);
                          localtime_r(&v120.st_mtimespec.tv_sec, &v119);
                          strftime(v143, 0x40uLL, "%F %T", &v119);
                          v92 = open(v155, 0x8000);
                          v93 = v92;
                          if (v92 == -1)
                          {
                            v94 = 0;
                          }
                          else
                          {
                            v94 = fcntl(v92, 63);
                            close(v93);
                          }
                          +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t%s\t%ld\t%d\t%s\t%s\t%s\n"), d_name, v120.st_size, v94, v151, v147, v143);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v96, "dataUsingEncoding:", 4);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          v98 = objc_msgSend(v95, "writeData:toFile:", v97, v8);
                          *((_BYTE *)v140 + 24) = v98;

                          if (!*((_BYTE *)v140 + 24))
                            goto LABEL_73;
                        }
                      }
                    }
                    closedir(v87);
                    +[SPConcreteCoreSpotlightIndexer dumpCrashStates:toFile:](SPConcreteCoreSpotlightIndexer, "dumpCrashStates:toFile:", v115, v8);
                  }
                }
                +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("===\n\n"), "dataUsingEncoding:", 4);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = objc_msgSend(v99, "writeData:toFile:", v100, v8);
                *((_BYTE *)v140 + 24) = v101;

                if (*((_BYTE *)v140 + 24))
                {
                  SPLogDirectory();
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "stringByAppendingString:", CFSTR(".log"));
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "stringByAppendingPathComponent:", v104);
                  v105 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v117, "stringByAppendingPathComponent:", CFSTR("activityJournal.1"));
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "removeItemAtPath:error:", v105, 0);
                  objc_msgSend(v107, "copyItemAtPath:toPath:error:", v106, v105, 0);

                  v24 = 1;
LABEL_74:

                  goto LABEL_75;
                }
              }
LABEL_73:
              v24 = 0;
              goto LABEL_74;
            }
          }
          else
          {

            _Block_object_dispose(v155, 8);
          }
        }

        goto LABEL_73;
      }
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[time_t description](v114, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dataUsingEncoding:", 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v25, "writeData:toFile:", v27, v8);
      *((_BYTE *)v140 + 24) = v28;

      if (!*((_BYTE *)v140 + 24))
        goto LABEL_72;
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("\n\n"), "dataUsingEncoding:", 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "writeData:toFile:", v30, v8);
      *((_BYTE *)v140 + 24) = v31;

      if (!*((_BYTE *)v140 + 24))
      {
LABEL_72:

        goto LABEL_73;
      }
      if (!objc_msgSend(v9, "length"))
        goto LABEL_39;
      -[time_t objectForKeyedSubscript:](v114, "objectForKeyedSubscript:", CFSTR("GroupAssignments"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v32;

      if (!v33)
        goto LABEL_36;
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("com.apple.searchd"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_36;
      v35 = dispatch_group_create();
      dispatch_group_enter(v35);
      *(_QWORD *)v155 = 0;
      v156 = v155;
      v157 = 0x3032000000;
      v158 = __Block_byref_object_copy_;
      v159 = __Block_byref_object_dispose_;
      v160 = 0;
      index = self->_index;
      v134[0] = MEMORY[0x24BDAC760];
      v134[1] = 3221225472;
      v134[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_2;
      v134[3] = &unk_24D0EB988;
      v135 = v9;
      v137 = v155;
      v37 = v35;
      v136 = v37;
      SISynchedOpWithBlock((uint64_t)index, 3, v134);
      dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      v110 = v37;
      if (objc_msgSend(*((id *)v156 + 5), "count"))
      {
        objc_msgSend(*((id *)v156 + 5), "objectForKeyedSubscript:", *MEMORY[0x24BDC1A98]);
        v38 = objc_claimAutoreleasedReturnValue();
        v109 = (void *)v38;
        if (!v38)
          goto LABEL_23;
        +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n   AttributeChangeDate = %@\n"), v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dataUsingEncoding:", 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v39, "writeData:toFile:", v41, v8);
        *((_BYTE *)v140 + 24) = v42;

        v43 = (void *)v38;
        if (!*((_BYTE *)v140 + 24))
        {
LABEL_69:

        }
        else
        {
LABEL_23:
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          obj = *((id *)v156 + 5);
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v161, 16);
          if (v44)
          {
            v113 = *(time_t **)v131;
            while (2)
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(time_t **)v131 != v113)
                  objc_enumerationMutation(obj);
                v46 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * i);
                objc_msgSend(*((id *)v156 + 5), "objectForKeyedSubscript:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v47, 4);
                  if (!objc_msgSend(v48, "length"))
                  {
                    objc_msgSend(v47, "description");
                    v49 = objc_claimAutoreleasedReturnValue();

                    v48 = (void *)v49;
                  }
                  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                  v50 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("   %@ = %@\n"), v46, v48);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "dataUsingEncoding:", 4);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = objc_msgSend((id)v50, "writeData:toFile:", v52, v8);
                  *((_BYTE *)v140 + 24) = v53;

                  LOBYTE(v50) = *((_BYTE *)v140 + 24) == 0;
                  if ((v50 & 1) != 0)
                  {

                    v43 = v109;
                    goto LABEL_69;
                  }
                }

              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v161, 16);
              if (v44)
                continue;
              break;
            }
          }

          +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("\n\n"), "dataUsingEncoding:", 4);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "writeData:toFile:", v55, v8);
          *((_BYTE *)v140 + 24) = v56;

          v57 = *((_BYTE *)v140 + 24) == 0;
          if (!v57)
            goto LABEL_35;
        }

        _Block_object_dispose(v155, 8);
LABEL_71:

        goto LABEL_72;
      }
LABEL_35:

      _Block_object_dispose(v155, 8);
LABEL_36:
      if (!v118)
        goto LABEL_38;
      v58 = dispatch_group_create();
      dispatch_group_enter(v58);
      v124[0] = MEMORY[0x24BDAC760];
      v124[1] = 3221225472;
      v124[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_4;
      v124[3] = &unk_24D0EB9D8;
      v124[4] = self;
      v125 = v9;
      v126 = v118;
      v129 = &v139;
      v127 = v8;
      v59 = v58;
      v128 = v59;
      v60 = (void *)MEMORY[0x2199C2F34](v124);
      v61 = sIndexQueue;
      _setup_block(v60, 0, 5586);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v61, v62);

      dispatch_group_wait(v59, 0xFFFFFFFFFFFFFFFFLL);
      v63 = *((_BYTE *)v140 + 24) == 0;

      if (!v63)
      {
LABEL_38:

        goto LABEL_39;
      }
      goto LABEL_71;
    }
  }
  v24 = 0;
LABEL_75:
  _Block_object_dispose(&v139, 8);

  return v24;
}

uint64_t __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id v4;
  __int128 v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = *(_OWORD *)(a1 + 40);
    v4 = (id)v5;
    if (SIGetCSAttributes())
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

  }
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a2)
  {
    v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      if ((unint64_t)objc_msgSend(v4, "count") >= 2)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

        }
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_5;
  v5[3] = &unk_24D0EB9B0;
  v8 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "attributesForBundleId:identifier:completion:", v3, v4, v5);

}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemSDBInfo = %@\n\n"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "writeData:toFile:", v6, *(_QWORD *)(a1 + 32));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_6(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v14 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tbundleID: %@\n"), v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "writeData:toFile:", v10, *(_QWORD *)(a1 + 32));

    if ((v11 & 1) != 0)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_7;
      v15[3] = &unk_24D0EBA00;
      v12 = *(id *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v16 = v12;
      v17 = v13;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        *a4 = 1;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

void __70__SPConcreteCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier___block_invoke_7(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    if (!v8)
    {
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t\t%@: %@\n"), v13, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "writeData:toFile:", v11, *(_QWORD *)(a1 + 32));

    if ((v12 & 1) == 0)
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }

  }
}

- (void)dropBackgroundAssertions:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *dataclass;
  const char *v7;
  __SI *index;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  SPConcreteCoreSpotlightIndexer *v13;
  BOOL v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_hasAssertion)
  {
    v3 = a3;
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      v7 = "YES";
      if (!self->_suspended)
        v7 = "NO";
      *(_DWORD *)buf = 138412546;
      v16 = dataclass;
      v17 = 2080;
      v18 = v7;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "Dropping bg assertion on unlock, dataclass:%@, suspended:%s", buf, 0x16u);
    }

    self->_hasAssertion = 0;
    index = self->_index;
    if (index)
    {
      if (v3)
      {
        v9 = dispatch_group_create();
        dispatch_group_enter(v9);
        index = self->_index;
      }
      else
      {
        v9 = 0;
      }
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke;
      v11[3] = &unk_24D0EBA50;
      v14 = v3;
      v10 = v9;
      v12 = v10;
      v13 = self;
      SISynchedOpWithBlock((uint64_t)index, 3, v11);
      if (v3)
        dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      self->_assertionEndTime = 0.0;
    }
  }
}

void __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t v10;

  if (a3)
  {
    if (*(_BYTE *)(a1 + 48))
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke_2;
    v8[3] = &unk_24D0EBA28;
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    SIBackgroundOpBlock(a2, 0, v8);
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (*(_BYTE *)(a1 + 48))
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

void __59__SPConcreteCoreSpotlightIndexer_dropBackgroundAssertions___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    SISetBgAssertionFlag();
    if (CFAbsoluteTimeGetCurrent() <= *(double *)(*(_QWORD *)(a1 + 40) + 80))
    {
      v4 = SIDropAssertion();
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = 0;
      logForCSLogCategoryIndex();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
        v7 = 138412546;
        v8 = v6;
        v9 = 1024;
        v10 = v4;
        _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "dataclass:%@, SIDropAssertion returned: %d", (uint8_t *)&v7, 0x12u);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)closeIndex
{
  NSObject *v3;
  NSString *dataclass;
  const char *v5;
  void *v6;
  NSObject *v7;
  NSString *v8;
  id v9;
  int v10;
  NSString *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_index)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      dataclass = self->_dataclass;
      v5 = "YES";
      if (!self->_suspended)
        v5 = "NO";
      v10 = 138412546;
      v11 = dataclass;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Closing index, dataclass:%@, suspended:%s", (uint8_t *)&v10, 0x16u);
    }

    -[SPConcreteCoreSpotlightIndexer _cancelIdleTimer](self, "_cancelIdleTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_suspended)
    {
      if (!self->_softSuspended && !self->_hasAssertion)
        SIResumeIndex();
      *(_WORD *)&self->_suspended = 0;
    }
    SICloseIndex();
    self->_index = 0;
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = self->_dataclass;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Closed index, dataclass:%@", (uint8_t *)&v10, 0xCu);
    }

    v9 = (id)objc_opt_self();
  }
}

- (void)resumeIndex
{
  NSObject *v3;
  NSString *dataclass;
  const char *v5;
  __SI *index;
  __SI *v7;
  NSObject *v8;
  NSString *v9;
  NSObject *v10;
  NSString *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dataclass = self->_dataclass;
    v5 = "YES";
    if (!self->_suspended)
      v5 = "NO";
    *(_DWORD *)buf = 138412546;
    v14 = dataclass;
    v15 = 2080;
    v16 = v5;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Resuming index, dataclass:%@, suspended:%s", buf, 0x16u);
  }

  if (self->_jwlIndex)
  {
    SICloseJWLIndex();
    self->_jwlIndex = 0;
  }
  if (self->_index && !SIValidIndex() && self->_index && !SIValidIndex())
  {
    -[SPConcreteCoreSpotlightIndexer closeIndex](self, "closeIndex");
    -[SPConcreteCoreSpotlightIndexer openIndex:](self, "openIndex:", 1);
    return;
  }
  if (!self->_suspended)
    return;
  if (self->_softSuspended)
  {
    index = self->_index;
  }
  else
  {
    index = self->_index;
    if (!self->_hasAssertion)
    {
      SIResumeIndex();
      goto LABEL_19;
    }
  }
  if (index)
  {
    SIBackgroundOpBlock((uint64_t)index, 9, &__block_literal_global_739);
LABEL_19:
    v7 = self->_index;
    if (v7)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke_2;
      v12[3] = &unk_24D0EAE40;
      v12[4] = self;
      SIBackgroundOpBlock((uint64_t)v7, 0, v12);
      if (_os_feature_enabled_impl())
      {
        if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDD0CD0]))
          SISyncIndex();
      }
    }
  }
  -[SPConcreteCoreSpotlightIndexer dropBackgroundAssertions:](self, "dropBackgroundAssertions:", SIIsLockedIndexingMode());
  *(_WORD *)&self->_suspended = 0;
  if (self->_index && SIIsLockedIndexingMode())
  {
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "reopening index as it was opened for locked indexing, dataclass:%@", buf, 0xCu);
    }

    -[SPConcreteCoreSpotlightIndexer closeIndex](self, "closeIndex");
    -[SPConcreteCoreSpotlightIndexer openIndex:](self, "openIndex:", 0);
  }
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_dataclass;
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "Resumed index, dataclass:%@", buf, 0xCu);
  }

}

uint64_t __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (a2)
  {
    if (!a3)
      return _SICooldownIndexFilesForMerge();
  }
  return result;
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_resumeIndex__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  if (!a3)
  {
    v3 = result;
    if (_os_feature_enabled_impl())
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 168), "isEqualToString:", *MEMORY[0x24BDD0CD0]))
        SIReleaseJournalAssertion();
    }
    SISetLockedJournalingState();
    return _SISetAssertedJournalNum();
  }
  return result;
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_readyIndex___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  if (!a3)
  {
    v3 = result;
    if (_os_feature_enabled_impl())
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 168), "isEqualToString:", *MEMORY[0x24BDD0CD0]))
        SIReleaseJournalAssertion();
    }
    SISetLockedJournalingState();
    return _SISetAssertedJournalNum();
  }
  return result;
}

- (void)ensureOpenIndexFiles:(id)a3
{
  id v4;

  if (self->_index)
  {
    v4 = a3;
    _SIOpenIndexFilesForMerge();
    -[SPConcreteCoreSpotlightIndexer commitUpdates:](self, "commitUpdates:", v4);

  }
}

- (void)suspendIndexForDeviceLock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *dataclass;
  double Current;
  NSObject *v17;
  int v18;
  NSString *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSString *v25;
  const char *v26;
  double v27;
  NSObject *v28;
  int v29;
  NSString *v30;
  _BOOL4 suspended;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  _BYTE v38[18];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (SIIndexIsInPlayback())
  {
LABEL_10:
    if (!self->_suspended)
    {
      logForCSLogCategoryIndex();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        dataclass = self->_dataclass;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v38 = dataclass;
        _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_INFO, "Maintenance mode, dataclass:%@", buf, 0xCu);
      }

      if (self->_index)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current >= self->_assertionEndTime)
        {
          v20 = 0;
        }
        else
        {
          logForCSLogCategoryIndex();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = (int)(self->_assertionEndTime - Current);
            v19 = self->_dataclass;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v38 = v18;
            *(_WORD *)&v38[4] = 2112;
            *(_QWORD *)&v38[6] = v19;
            _os_log_impl(&dword_213CF1000, v17, OS_LOG_TYPE_INFO, "Holding assertion for: %d seconds dataclass:%@ as the device is locking", buf, 0x12u);
          }

          SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_741);
          v20 = 1;
        }
        self->_hasAssertion = v20;
        dispatch_get_global_queue(2, 2uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2;
        v35[3] = &unk_24D0EBAB8;
        v35[4] = self;
        v36 = v4;
        dispatch_apply(2uLL, v21, v35);

      }
      *(_WORD *)&self->_suspended = 257;
    }
    goto LABEL_21;
  }
  -[SPConcreteCoreSpotlightIndexer outstandingMaintenance](self, "outstandingMaintenance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = (_QWORD *)MEMORY[0x24BDD0CD0];
  if (!v6 && !atomic_load(&self->_maintenanceOperations))
  {

    goto LABEL_25;
  }
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)*v7)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == (void *)*MEMORY[0x24BDD0CD8])
  {

    goto LABEL_9;
  }
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BDD0CE8];

  if (v12 == v13)
    goto LABEL_10;
LABEL_25:
  if (!self->_index)
    goto LABEL_21;
  logForCSLogCategoryIndex();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = self->_dataclass;
    v26 = "YES";
    if (!self->_suspended)
      v26 = "NO";
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v38 = v25;
    *(_WORD *)&v38[8] = 2080;
    *(_QWORD *)&v38[10] = v26;
    _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_INFO, "Suspending index, dataclass:%@, suspended:%s", buf, 0x16u);
  }

  if (self->_suspended)
    goto LABEL_43;
  self->_suspending = 1;
  v27 = CFAbsoluteTimeGetCurrent();
  if (v27 >= self->_assertionEndTime)
  {
    self->_hasAssertion = 0;
    if (_os_feature_enabled_impl()
      && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *v7))
    {
      SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_746);
    }
    self->_suspended = SIFlushAndSuspendIndex() != 0;
    if (_os_feature_enabled_impl()
      && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *v7))
    {
      SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_748);
    }
    suspended = self->_suspended;
    *(_WORD *)&self->_softSuspended = 0;
    if (!suspended)
      goto LABEL_43;
  }
  else
  {
    logForCSLogCategoryIndex();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (int)(self->_assertionEndTime - v27);
      v30 = self->_dataclass;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = v30;
      _os_log_impl(&dword_213CF1000, v28, OS_LOG_TYPE_INFO, "Holding assertion for: %d seconds dataclass:%@ as the device is locking", buf, 0x12u);
    }

    SIBackgroundOpBlock((uint64_t)self->_index, 0, &__block_literal_global_744);
    self->_hasAssertion = 1;
    *(_WORD *)&self->_suspended = 1;
    self->_suspending = 0;
  }
  v32 = -[SPConcreteCoreSpotlightIndexer _cancelIdleTimer](self, "_cancelIdleTimer");
LABEL_43:
  -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*v7;

  if (v33 == v34)
    _SITemporarilyChangeProtectionClass();
LABEL_21:
  logForCSLogCategoryIndex();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v38 = 0;
    *(_WORD *)&v38[8] = 2112;
    *(_QWORD *)&v38[10] = v23;
    _os_log_impl(&dword_213CF1000, v22, OS_LOG_TYPE_DEFAULT, "Releasing assertion %@ (%@)", buf, 0x16u);

  }
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (!a3)
    return SISetBgAssertionFlag();
  return result;
}

void __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(v3 + 128);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3;
    v8[3] = &unk_24D0EBA28;
    v8[4] = v3;
    v9 = v4;
    SIBackgroundOpBlock(v5, 9, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dataclass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x24BDD0CD0];

    if (v6 == v7)
      _SITemporarilyChangeProtectionClass();
  }
}

void __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ensureOpenIndexFiles:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_743(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (!a3)
    return SISetBgAssertionFlag();
  return result;
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_2_745(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (!a3)
    return SICreateAssertedJournalFile();
  return result;
}

uint64_t __60__SPConcreteCoreSpotlightIndexer_suspendIndexForDeviceLock___block_invoke_3_747(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (!a3)
    return SISetLockedJournalingState();
  return result;
}

- (void)processDecryptsForBundleID:(id)a3 persona:(id)a4 infos:(id)a5 group:(id)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *group;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE buf[12];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v21 = a4;
  v10 = a5;
  group = a6;
  if (self->_readOnly)
  {
    logForCSLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, "processDecryptsForBundleID failed: index is readOnly", buf, 2u);
    }
  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "decryptInfo", v20, v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v11, "addObject:", v18);

          objc_msgSend(v17, "externalID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Process decrypts for  %@", buf, 0xCu);
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    if (group)
      dispatch_group_enter(group);
    v23 = v12;
    objc_copyWeak(&v27, (id *)buf);
    v24 = v20;
    v25 = v21;
    v26 = group;
    _MDItemDecrypt();

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
}

void __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t *WeakRetained;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = a3;
    _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Process decrypts (%@, %@)", buf, 0x16u);
  }
  v6 = a3;
  WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 8);
  v8 = WeakRetained;
  v9 = WeakRetained[16];
  if (!v9)
    v9 = WeakRetained[17];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke_749;
  v11[3] = &unk_24D0EBB40;
  objc_copyWeak(&v17, a1 + 8);
  v12 = a1[5];
  v13 = a1[4];
  v10 = v6;
  v14 = v10;
  v15 = a1[6];
  v16 = a1[7];
  SIBackgroundOpBlock(v9, 9, v11);

  objc_destroyWeak(&v17);
}

void __81__SPConcreteCoreSpotlightIndexer_processDecryptsForBundleID_persona_infos_group___block_invoke_749(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id WeakRetained;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v2, "beginArray");
  v25 = a1;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = v3;
  v6 = v4;
  v29 = v2;
  obj = v5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    v28 = *MEMORY[0x24BDBD430];
    v27 = *MEMORY[0x24BDC2290];
    v11 = 0x24BDBC000uLL;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9 + i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        logForCSLogCategoryDefault();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "description");
          v16 = v8;
          v17 = v10;
          v18 = v6;
          v19 = v11;
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = objc_msgSend(v20, "UTF8String");
          *(_DWORD *)buf = 138412546;
          v36 = v13;
          v37 = 2080;
          v38 = v21;
          _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_INFO, "Updated attributeSet: %@ %s\n", buf, 0x16u);

          v11 = v19;
          v6 = v18;
          v10 = v17;
          v8 = v16;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v14)
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v14);
          else
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("_kMDItemEncryptedData"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("_kMDItemExternalID"));
          objc_msgSend(v22, "removeObjectForKey:", v27);
          objc_msgSend(v29, "beginArray");
          objc_msgSend(v29, "encodeString:", "__class:CSSearchableItemAttributeSet");
          objc_msgSend(v29, "encodeInt64:", 8);
          objc_msgSend(v29, "encodeObject:", v22);
          objc_msgSend(v29, "endArray");

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v9 += i;
    }
    while (v8);
  }

  objc_msgSend(v29, "endArray");
  objc_msgSend(v29, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SISetCodedAttributes();
  v24 = *(NSObject **)(v25 + 64);
  if (v24)
    dispatch_group_leave(v24);

}

- (void)processImportForBundleID:(id)a3 withURLs:(id)a4 contentTypes:(id)a5 sandboxExtensions:(id)a6 andIdentifiers:(id)a7 options:(int64_t)a8 inGroup:(id)a9 additionalAttributes:(id)a10 computeUpdaterAttributesAfterImport:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  int *v24;
  int *v25;
  uint64_t i;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int *v55;
  void *v56;
  int *v57;
  id v58;
  SPConcreteCoreSpotlightIndexer *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  int *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint8_t buf[16];
  __int128 v78;
  _QWORD __compar[4];
  id v80;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v68 = a6;
  v19 = a7;
  v20 = v17;
  v21 = a9;
  v67 = a10;
  if (v20 && v19)
  {
    if (self->_readOnly)
    {
      logForCSLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CF1000, v22, OS_LOG_TYPE_DEFAULT, "processImportForBundleID failed: index is readOnly", buf, 2u);
      }
    }
    else
    {
      v66 = v20;
      objc_msgSend(MEMORY[0x24BDC24E0], "sharedManager");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject loadExtensions](v22, "loadExtensions");
      v23 = objc_msgSend(v19, "count");
      v24 = (int *)malloc_type_malloc(4 * v23, 0x100004052888210uLL);
      v25 = v24;
      if (v23 >= 1)
      {
        for (i = 0; i != v23; ++i)
          v24[i] = i;
      }
      __compar[0] = MEMORY[0x24BDAC760];
      __compar[1] = 3221225472;
      __compar[2] = __187__SPConcreteCoreSpotlightIndexer_processImportForBundleID_withURLs_contentTypes_sandboxExtensions_andIdentifiers_options_inGroup_additionalAttributes_computeUpdaterAttributesAfterImport___block_invoke;
      __compar[3] = &unk_24D0EBB90;
      v65 = v18;
      v80 = v65;
      qsort_b(v25, v23, 4uLL, __compar);
      if (v23 < 1)
      {
        v54 = 0;
        v53 = 0;
        v75 = 0;
        v50 = 0;
        v56 = 0;
        v55 = v25;
        v20 = v66;
      }
      else
      {
        v59 = self;
        v60 = v22;
        v61 = v21;
        v62 = v16;
        v58 = v18;
        v27 = 0;
        v73 = 0;
        v74 = 0;
        v75 = 0;
        v69 = 0;
        v70 = 0;
        v28 = v23;
        v29 = 0x24BDC2000;
        v57 = v25;
        v64 = v19;
        do
        {
          v30 = *v25;
          v72 = v25 + 1;
          objc_msgSend(v66, "objectAtIndexedSubscript:", v30, v57, v58);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectAtIndexedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v30);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectAtIndexedSubscript:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v69, "isEqual:", v32);
          if ((v27 & 1) != 0 || !v34)
          {
            v36 = v70;
            if (v70)
            {
              objc_msgSend(v75, "endArray");
              objc_msgSend(v75, "data");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)objc_msgSend(v37, "copy");
              objc_msgSend(v70, "setImportData:", v38);

              v36 = v70;
              objc_msgSend(v70, "setFileAttributeSets:", v74);
              processItemsForImport(v59, v62, v60, v70, v73, v61, a11);
            }
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 13, a8);

            objc_msgSend(v39, "setFileType:", v32);
            v40 = v32;

            v41 = objc_alloc_init(MEMORY[0x24BDC23B8]);
            objc_msgSend(v41, "beginArray");
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v42 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v43 = objc_claimAutoreleasedReturnValue();

            v69 = v40;
            v70 = v39;
            v35 = v41;
            v73 = (void *)v43;
            v74 = (void *)v42;
            v29 = 0x24BDC2000uLL;
          }
          else
          {
            v35 = v75;
          }
          v75 = v35;
          objc_msgSend(v35, "encodeNSString:", v33);
          v44 = (void *)objc_msgSend(objc_alloc(*(Class *)(v29 + 1152)), "initWithItemContentType:", v32);
          objc_msgSend(v44, "setContentURL:", v31);
          *(_OWORD *)buf = 0u;
          v78 = 0u;
          objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v32);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          v46 = CSGetDiskVersionForContentURL(v31, v45, (uint64_t)buf, &v76);
          v47 = v76;
          if (v46)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)&buf[8]);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setAttribute:forKey:", v48, CFSTR("_kMDItemContentURLFileVersion"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)buf);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setAttribute:forKey:", v49, CFSTR("_kMDItemContentURLFileID"));

          }
          objc_msgSend(v44, "addAttributesFromDictionary:", v67);
          objc_msgSend(v74, "addObject:", v44);
          objc_msgSend(v73, "addObject:", v71);

          v27 = 1;
          --v28;
          v19 = v64;
          v25 = v72;
        }
        while (v28);
        v20 = v66;
        v50 = v70;
        if (v70)
        {
          objc_msgSend(v75, "endArray");
          objc_msgSend(v75, "data");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v51, "copy");
          objc_msgSend(v70, "setImportData:", v52);

          v53 = v74;
          objc_msgSend(v70, "setFileAttributeSets:", v74);
          v22 = v60;
          v21 = v61;
          v16 = v62;
          v54 = v73;
          processItemsForImport(v59, v62, v60, v70, v73, v61, a11);
          v55 = v57;
          v18 = v58;
        }
        else
        {
          v21 = v61;
          v16 = v62;
          v55 = v57;
          v18 = v58;
          v22 = v60;
          v54 = v73;
          v53 = v74;
        }
        v56 = v69;
      }
      free(v55);

    }
  }

}

uint64_t __187__SPConcreteCoreSpotlightIndexer_processImportForBundleID_withURLs_contentTypes_sandboxExtensions_andIdentifiers_options_inGroup_additionalAttributes_computeUpdaterAttributesAfterImport___block_invoke(uint64_t a1, int *a2, int *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (void)checkAdmission:(id)a3 background:(BOOL)a4 didBeginThrottle:(BOOL *)a5 didEndThrottle:(BOOL *)a6 live:(BOOL *)a7 slow:(BOOL *)a8 memoryPressure:(BOOL *)a9
{
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  if (v15
    && !a4
    && (-[SPConcreteCoreSpotlightIndexer owner](self, "owner"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isForegroundFileProviderBundleID:", v15),
        v16,
        (v17 & 1) != 0))
  {
    logForCSLogCategoryIndex();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = v15;
      _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_INFO, "Skipping admission check for foreground file provider %@", (uint8_t *)&v29, 0xCu);
    }

  }
  else
  {
    v19 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple."));
    if (a4)
    {
      v20 = 0;
    }
    else
    {
      v21 = objc_msgSend((id)buckets, "valueForKey:", v15);
      v20 = v21 < bulk_budget_threshold;
    }
    *a7 = v20;
    if (v19)
      v22 = v20 | 2u;
    else
      v22 = v20;
    if (CFAbsoluteTimeGetCurrent() - check_admission_time[v22] > (double)budget_check_threshold_delay
      || check_admission[v22])
    {
      logForCSLogCategoryIndex();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v29 = 138412290;
        v30 = v15;
        _os_log_impl(&dword_213CF1000, v23, OS_LOG_TYPE_INFO, "Running admission check for bundle id %@", (uint8_t *)&v29, 0xCu);
      }

      check_admission_time[v22] = CFAbsoluteTimeGetCurrent();
      check_admission[v22] = 0;
      if (s_last_memory_pressure_status != 1)
        *a9 = 1;
      if (sTurboMode
        || (objc_msgSend(MEMORY[0x24BE2E230], "sharedInstance"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("indexing"), *MEMORY[0x24BE2E2A0], 0), v24, v25))
      {
        logForCSLogCategoryIndex();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v29 = 138412546;
          v30 = v15;
          v31 = 2048;
          v32 = v22;
          _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_INFO, "Passed admission, bundleID:%@, budgetIndex:%ld", (uint8_t *)&v29, 0x16u);
        }

        if (slow_admission[v22])
          *a6 = 1;
        v27 = 0;
        slow_admission[v22] = 0;
      }
      else
      {
        logForCSLogCategoryIndex();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = 138412546;
          v30 = v15;
          v31 = 2048;
          v32 = v22;
          _os_log_impl(&dword_213CF1000, v28, OS_LOG_TYPE_INFO, "Failed admission, bundleID:%@, budgetIndex:%ld - slowing replies", (uint8_t *)&v29, 0x16u);
        }

        if (!slow_admission[v22])
          *a5 = 1;
        v27 = 1;
        slow_admission[v22] = 1;
      }
    }
    else
    {
      v27 = slow_admission[v22];
    }
    *a8 = v27;
  }

}

void __149__SPConcreteCoreSpotlightIndexer_completeIndexingItemFor_delegate_didBeginThrottle_didEndThrottle_error_live_queue_slow_startTime_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 4, 0);
      objc_msgSend(*(id *)(a1 + 40), "indexRequestsPerformJob:forBundle:completionHandler:", v2, *(_QWORD *)(a1 + 48), 0);

    }
  }
}

- (void)indexFromBundle:(id)a3 personaID:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 clientState:(id)a8 expectedClientState:(id)a9 clientStateName:(id)a10 deletes:(id)a11 canCreateNewIndex:(BOOL)a12 completionHandler:(id)a13
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  char v56;
  BOOL v57;

  v17 = a3;
  v42 = a4;
  v44 = a6;
  v35 = a7;
  v36 = a8;
  v18 = a10;
  v19 = a11;
  v41 = a13;
  if (a9)
  {
    v20 = (void *)MEMORY[0x24BDBCE50];
    v21 = objc_retainAutorelease(a9);
    v22 = objc_msgSend(v21, "bytes");
    v23 = objc_msgSend(v21, "length");

    objc_msgSend(v20, "dataWithBytes:length:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;
  if ((a5 & 0x20) != 0)
  {
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
      || (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      v26 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.usernotificationsd"));
    }
  }
  else
  {
    v26 = 0;
  }
  v27 = sIndexQueue;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke;
  v45[3] = &unk_24D0EBDF0;
  v56 = v26;
  v57 = a12;
  v45[4] = self;
  v46 = v17;
  v47 = v18;
  v48 = v44;
  v55 = a5;
  v49 = v25;
  v50 = v36;
  v51 = v42;
  v52 = v19;
  v53 = v35;
  v54 = v41;
  v40 = v35;
  v38 = v19;
  v43 = v42;
  v28 = v36;
  v29 = v25;
  v30 = v44;
  v31 = v18;
  v32 = v17;
  v33 = v41;
  _setup_block(v45, v26, 7939);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v27, v34);

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  _BYTE *v4;
  CFAbsoluteTime v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  CFAbsoluteTime Current;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44[4];
  char v45;
  char v46;
  uint8_t v47[16];
  _BYTE buf[12];
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_6();

  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", *(unsigned __int8 *)(a1 + 121));
  v4 = *(_BYTE **)(a1 + 32);
  if (*((_QWORD *)v4 + 16))
  {
    if (!v4[97])
      goto LABEL_5;
LABEL_36:
    logForCSLogCategoryIndex();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1();

    v22 = *(_QWORD *)(a1 + 104);
    if (v22)
      goto LABEL_56;
    return;
  }
  if (*((_QWORD *)v4 + 17))
  {
    if (v4[97])
      goto LABEL_36;
    goto LABEL_12;
  }
  if (!v4[96] || v4[97])
    goto LABEL_36;
  if (!_os_feature_enabled_impl()
    || (objc_msgSend(*((id *)*v3 + 21), "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) == 0)
  {
    logForCSLogCategoryIndex();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5();

    v22 = *(_QWORD *)(a1 + 104);
    if (v22)
      goto LABEL_56;
    return;
  }
  objc_msgSend(*v3, "openJWLIndex");
  v4 = *v3;
  if (!*((_QWORD *)*v3 + 17))
  {
    logForCSLogCategoryIndex();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2();

    v22 = *(_QWORD *)(a1 + 104);
    if (v22)
      goto LABEL_56;
    return;
  }
  if (!*((_QWORD *)v4 + 16))
  {
LABEL_12:
    if (*((_QWORD *)v4 + 17))
      goto LABEL_13;
LABEL_57:
    __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_3();
  }
LABEL_5:
  if (*((_QWORD *)v4 + 17))
    goto LABEL_57;
  if (!v4[24] || v4[72] && (v5 = CFAbsoluteTimeGetCurrent(), v4 = *v3, v5 <= *((double *)*v3 + 10)))
  {
    v6 = 0;
LABEL_18:
    if (v4[24] && v4[72])
    {
      logForCSLogCategoryIndex();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        v49 = 2112;
        v50 = v12;
        _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "Allowing indexing activity while locked for bundle: %@, dataclass:%@", buf, 0x16u);
      }

      v4 = *v3;
    }
    objc_msgSend(v4, "dataclass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (char *)SDTraceAdd(3, v13, -1, *(void **)(a1 + 40), *(void **)(a1 + 48), 0.0);
    Current = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v16 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
    logForCSLogCategoryIndex();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_213CF1000, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "IndexLatency", (const char *)&unk_213D89001, v47, 2u);
    }

    v19 = *((_QWORD *)*v3 + 16);
    if (!v19)
      v19 = *((_QWORD *)*v3 + 17);
    if (*(_BYTE *)(a1 + 120))
      v20 = qos_class_self();
    else
      v20 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766;
    v32[3] = &unk_24D0EBDC8;
    objc_copyWeak(v44, (id *)buf);
    v24 = *(id *)(a1 + 104);
    v45 = v6;
    v25 = *(_QWORD *)(a1 + 32);
    v43 = v24;
    v32[4] = v25;
    v33 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 40);
    v27 = *(void **)(a1 + 112);
    v34 = v26;
    v44[1] = v27;
    v35 = *(id *)(a1 + 48);
    v36 = *(id *)(a1 + 64);
    v46 = *(_BYTE *)(a1 + 120);
    v28 = v16;
    v37 = v28;
    v38 = *(id *)(a1 + 72);
    v39 = *(id *)(a1 + 80);
    v40 = *(id *)(a1 + 88);
    v41 = *(id *)(a1 + 96);
    v29 = v13;
    v42 = v29;
    v44[2] = v14;
    v44[3] = *(id *)&Current;
    SIBackgroundOpBlock(v19, v20, v32);

    objc_destroyWeak(v44);
    objc_destroyWeak((id *)buf);
    goto LABEL_42;
  }
LABEL_13:
  if (_os_feature_enabled_impl()
    && (objc_msgSend(*((id *)*v3 + 21), "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      v49 = 2112;
      v50 = v9;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Allowing journaling only while locked for bundle: %@, dataclass:%@", buf, 0x16u);
    }

    v4 = *v3;
    v6 = 1;
    goto LABEL_18;
  }
  logForCSLogCategoryIndex();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1();

  v22 = *(_QWORD *)(a1 + 104);
  if (v22)
  {
LABEL_56:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v29);
LABEL_42:

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int Count;
  int v18;
  BOOL v19;
  uint64_t IntValue;
  NSObject *v21;
  int PlistObjectType;
  int v23;
  int v24;
  NSObject *v25;
  id v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  id v34;
  CSDecryptInfo *v35;
  CSDecryptInfo *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  CSImportInfo *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  dispatch_group_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  const void *v81;
  int v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  NSObject *v93;
  void *v94;
  const void *v95;
  uint64_t Bytes;
  uint64_t v97;
  CFAbsoluteTime Current;
  id v99;
  void *v100;
  id v101;
  id v102;
  unsigned __int8 *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i;
  void *v112;
  uint64_t v113;
  int v114;
  int v115;
  NSObject *v116;
  id v117;
  BOOL v118;
  int v119;
  unsigned __int8 *v120;
  unsigned int v121;
  int v122;
  int locked;
  int v124;
  void *v125;
  int v126;
  _QWORD *v127;
  _QWORD *v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  void *v135;
  NSObject *v136;
  NSObject *v137;
  os_signpost_id_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  CFTypeRef cf;
  void *v164;
  uint64_t v165;
  id *from;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  unsigned int v179;
  id v180;
  unsigned __int8 *v181;
  _QWORD v182[4];
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[4];
  id v189;
  id v190;
  uint64_t v191;
  id v192;
  id v193;
  _QWORD *v194;
  _QWORD *v195;
  id v196[3];
  unsigned __int8 v197;
  char v198;
  char v199;
  _QWORD v200[5];
  id v201;
  _QWORD v202[4];
  id v203;
  id v204;
  _QWORD v205[4];
  NSObject *v206;
  _QWORD v207[4];
  id v208;
  uint64_t *v209;
  uint8_t *v210;
  uint64_t v211;
  CFTypeRef v212;
  int v213;
  _QWORD block[4];
  id v215;
  id v216;
  id v217;
  id v218;
  uint64_t v219;
  __int128 v220;
  uint64_t v221;
  __int128 v222;
  uint64_t v223;
  __int128 v224;
  uint64_t v225;
  __int128 v226;
  uint64_t v227;
  __int128 v228;
  uint64_t v229;
  __int128 v230;
  uint64_t v231;
  __int128 v232;
  uint64_t v233;
  __int128 v234;
  uint64_t v235;
  __int128 v236;
  uint64_t v237;
  __int128 v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t *v241;
  uint64_t v242;
  char v243;
  __int128 v244;
  uint64_t v245;
  _QWORD v246[3];
  char v247[8];
  _QWORD v248[3];
  char v249[13];
  char v250;
  __int16 v251;
  _BYTE v252[128];
  uint64_t v253;
  _QWORD v254[2];
  _QWORD v255[7];
  uint8_t v256[4];
  uint64_t v257;
  __int128 v258;
  uint64_t v259;
  uint8_t v260[32];
  __int128 v261;
  uint64_t v262;
  uint8_t buf[24];
  uint64_t (*v264)(uint64_t, uint64_t);
  __int128 v265;
  char v266[24];
  uint64_t v267;

  v267 = *MEMORY[0x24BDAC8D0];
  if (a3)
    goto LABEL_2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  from = (id *)(a1 + 128);
  if (objc_msgSend(WeakRetained, "index") == a2)
  {

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 128));
    v8 = objc_msgSend(v7, "jwlIndex");

    if (v8 != a2)
    {
LABEL_2:
      v4 = *(_QWORD *)(a1 + 120);
      if (!v4)
        return;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v180 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      goto LABEL_4;
    }
  }
  if (*(_BYTE *)(a1 + 160) && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    SISetBgAssertionFlag();
    SIDeleteBgAssertionFile();
    v9 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v9 + 25))
    {
      SIFlushAndSuspendIndex();
      v9 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v9 + 72) = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) == a2
    || !*(_QWORD *)(a1 + 40)
    || !*(_QWORD *)(a1 + 48)
    || (*(_BYTE *)(a1 + 136) & 0x10) == 0
    || SIGetAccumulatedSizeForGroup() < 134217729)
  {
    v181 = (unsigned __int8 *)a1;
    v165 = a2;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend((id)objc_opt_class(), "_stateInfoAttributeNameWithClientStateName:", *(_QWORD *)(a1 + 56));
      v173 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v173 = 0;
    }
    if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
    {
      v11 = (const void *)SICopyCachedCSClientState();
      v12 = v11;
      if (!v11 || !CFEqual(v11, *(CFTypeRef *)(a1 + 64)))
      {
        v142 = *(_QWORD *)(a1 + 120);
        if (v142)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1006, 0);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v142 + 16))(v142, v143);

        }
        if (v12)
          CFRelease(v12);
        goto LABEL_253;
      }
      CFRelease(v12);
    }
    v251 = 0;
    v250 = 0;
    v248[0] = 0;
    v248[1] = v248;
    v248[2] = 0x2020000000;
    v249[0] = 0;
    v246[0] = 0;
    v246[1] = v246;
    v246[2] = 0x2020000000;
    v247[0] = 0;
    if ((*(_BYTE *)(a1 + 136) & 0x20) != 0)
    {
      logForCSLogCategoryDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "Skipped admission check on critical index job for %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "checkAdmission:background:didBeginThrottle:didEndThrottle:live:slow:memoryPressure:", *(_QWORD *)(a1 + 48), 0, v249, v247, &v251, (char *)&v251 + 1, &v250);
    }
    logForCSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766_cold_2(objc_msgSend(*(id *)(a1 + 40), "length"), a1, (uint64_t)v266, v15);

    v174 = *(id *)(a1 + 40);
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    v16 = _MDPlistContainerCreateWithBytes();
    if (v16)
    {
      v244 = 0uLL;
      v245 = 0;
      _MDPlistGetRootPlistObjectFromPlist();
      memset(buf, 0, sizeof(buf));
      if (_MDPlistGetPlistObjectType() == 240)
      {
        *(_OWORD *)buf = v244;
        *(_QWORD *)&buf[16] = v245;
        Count = _MDPlistArrayGetCount();
      }
      else
      {
        Count = 0;
      }
      cf = (CFTypeRef)v16;
      v240 = 0;
      v241 = &v240;
      v242 = 0x2020000000;
      v243 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v264 = __Block_byref_object_copy_;
      *(_QWORD *)&v265 = __Block_byref_object_dispose_;
      *((_QWORD *)&v265 + 1) = 0;
      if (Count)
      {
        v179 = Count;
        v18 = 0;
        v164 = 0;
        v167 = 0;
        v175 = 0;
        v19 = 1;
        v160 = *MEMORY[0x24BDC1BF8];
        v159 = *MEMORY[0x24BDC1AA0];
        v157 = *MEMORY[0x24BDC2140];
        v158 = *MEMORY[0x24BDC1FE8];
        v156 = *MEMORY[0x24BDC2158];
        v152 = *MEMORY[0x24BDC22E8];
        v153 = *MEMORY[0x24BDC1BE8];
        v151 = *MEMORY[0x24BDC1950];
        while (1)
        {
          v238 = 0uLL;
          v239 = 0;
          v236 = v244;
          v237 = v245;
          _MDPlistArrayGetPlistObjectAtIndex();
          v236 = v238;
          v237 = v239;
          if (_MDPlistGetPlistObjectType() != 240
            || (v236 = v238, v237 = v239, _MDPlistArrayGetCount() < 3))
          {
            logForCSLogCategoryDefault();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v236 = v238;
              v237 = v239;
              PlistObjectType = _MDPlistGetPlistObjectType();
              v236 = v238;
              v237 = v239;
              v23 = _MDPlistArrayGetCount();
              LODWORD(v261) = 67109376;
              DWORD1(v261) = PlistObjectType;
              WORD4(v261) = 1024;
              *(_DWORD *)((char *)&v261 + 10) = v23;
              _os_log_impl(&dword_213CF1000, v21, OS_LOG_TYPE_DEFAULT, "Unexpected PlistBytes %d %d", (uint8_t *)&v261, 0xEu);
            }

            goto LABEL_52;
          }
          v236 = 0uLL;
          v237 = 0;
          v261 = v238;
          v262 = v239;
          _MDPlistArrayGetPlistObjectAtIndex();
          v261 = v236;
          v262 = v237;
          if (_MDPlistGetPlistObjectType() == 241)
            break;
LABEL_52:
          v19 = ++v18 < v179;
          if (v179 == v18)
            goto LABEL_186;
        }
        v261 = 0uLL;
        v262 = 0;
        v234 = v236;
        v235 = v237;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          v234 = v261;
          v235 = v262;
          IntValue = _MDPlistNumberGetIntValue();
        }
        else
        {
          IntValue = 0;
        }
        v234 = 0uLL;
        v235 = 0;
        v232 = v236;
        v233 = v237;
        if (_MDPlistDictionaryGetPlistObjectForKey()
          && (v232 = v234,
              v233 = v235,
              v24 = _MDPlistGetPlistObjectType(),
              v25 = MEMORY[0x24BDACB70],
              v24 == 246))
        {
          v26 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v232) = 0;
            _os_log_impl(&dword_213CF1000, v25, OS_LOG_TYPE_DEFAULT, "Found _kMDItemEncryptedData", (uint8_t *)&v232, 2u);
          }

          v27 = IntValue == 0;
          v28 = 1;
        }
        else
        {
          if (!IntValue)
            goto LABEL_81;
          v27 = 0;
          v28 = 0;
        }
        v232 = 0uLL;
        v233 = 0;
        *(_OWORD *)v260 = v236;
        *(_QWORD *)&v260[16] = v237;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          *(_OWORD *)v260 = v232;
          *(_QWORD *)&v260[16] = v233;
          if (_MDPlistGetPlistObjectType() == 244
            || (*(_OWORD *)v260 = v232, *(_QWORD *)&v260[16] = v233, _MDPlistGetPlistObjectType() == 245))
          {
            *(_OWORD *)v260 = v232;
            *(_QWORD *)&v260[16] = v233;
            v29 = _MDPlistContainerCopyObject();
            v30 = (void *)v29;
            if (v29)
              v31 = v28;
            else
              v31 = 0;
            v32 = (void *)v29;
            if (v31 == 1)
            {
              v33 = MEMORY[0x24BDACB70];
              v34 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v260 = 138412290;
                *(_QWORD *)&v260[4] = v30;
                _os_log_impl(&dword_213CF1000, v33, OS_LOG_TYPE_DEFAULT, "Matched _kMDItemEncryptedData with id %@", v260, 0xCu);
              }

              v35 = [CSDecryptInfo alloc];
              *(_OWORD *)v260 = v234;
              *(_QWORD *)&v260[16] = v235;
              v36 = -[CSDecryptInfo initWithPlistObject:externalID:](v35, "initWithPlistObject:externalID:", v260, v32);
              if (v36)
              {
                v37 = v167;
                if (!v167)
                  v37 = (void *)objc_opt_new();
                v167 = v37;
                objc_msgSend(v37, "addObject:", v36);
              }

              v30 = v32;
            }
            if (v27)
            {
              v169 = 0;
              v170 = 0;
              v168 = 0;
            }
            else
            {
              memset(v260, 0, 24);
              v230 = 0uLL;
              v231 = 0;
              v228 = 0uLL;
              v229 = 0;
              v258 = v236;
              v259 = v237;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && (v258 = *(_OWORD *)v260,
                    v259 = *(_QWORD *)&v260[16],
                    _MDPlistGetPlistObjectType() == 247))
              {
                v258 = *(_OWORD *)v260;
                v259 = *(_QWORD *)&v260[16];
                v170 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                v170 = 0;
              }
              v258 = v236;
              v259 = v237;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && ((v258 = v230, v259 = v231, _MDPlistGetPlistObjectType() == 244)
                 || (v258 = v230, v259 = v231, _MDPlistGetPlistObjectType() == 245)))
              {
                v258 = v230;
                v259 = v231;
                v169 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                v169 = 0;
              }
              v258 = v236;
              v259 = v237;
              if (_MDPlistDictionaryGetPlistObjectForKey()
                && ((v258 = v228, v259 = v229, _MDPlistGetPlistObjectType() == 244)
                 || (v258 = v228, v259 = v229, _MDPlistGetPlistObjectType() == 245)))
              {
                v258 = v228;
                v259 = v229;
                v168 = (void *)_MDPlistContainerCopyObject();
              }
              else
              {
                v168 = 0;
              }
              if (!v175)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v175 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v30, *((_QWORD *)v181 + 6));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v170 && v169 && v168 && v30)
              {
                v40 = objc_alloc_init(CSImportInfo);
                -[CSImportInfo setContentURL:](v40, "setContentURL:", v170);
                -[CSImportInfo setContentType:](v40, "setContentType:", v169);
                -[CSImportInfo setSandboxExtension:](v40, "setSandboxExtension:", v168);
                -[CSImportInfo setExternalID:](v40, "setExternalID:", v30);
                objc_msgSend(v175, "setObject:forKey:", v40, v39);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "setObject:forKey:", v41, v39);

                logForCSLogCategoryDefault();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v258) = 138412290;
                  *(_QWORD *)((char *)&v258 + 4) = v170;
                  _os_log_error_impl(&dword_213CF1000, v42, OS_LOG_TYPE_ERROR, "RequiresImport missing: URL:%@", (uint8_t *)&v258, 0xCu);
                }

                logForCSLogCategoryDefault();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v258) = 138412290;
                  *(_QWORD *)((char *)&v258 + 4) = v169;
                  _os_log_error_impl(&dword_213CF1000, v43, OS_LOG_TYPE_ERROR, "RequiresImport missing: ContentType:%@", (uint8_t *)&v258, 0xCu);
                }

                logForCSLogCategoryDefault();
                v40 = (CSImportInfo *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v40->super, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v258) = 138412290;
                  *(_QWORD *)((char *)&v258 + 4) = v168;
                  _os_log_error_impl(&dword_213CF1000, &v40->super, OS_LOG_TYPE_ERROR, "RequiresImport missing: SBX:%@", (uint8_t *)&v258, 0xCu);
                }
              }

              v30 = v32;
            }
LABEL_110:
            v232 = 0uLL;
            v233 = 0;
            *(_OWORD *)v260 = v236;
            *(_QWORD *)&v260[16] = v237;
            if (_MDPlistDictionaryGetPlistObjectForKey()
              || (*(_OWORD *)v260 = v236,
                  *(_QWORD *)&v260[16] = v237,
                  _MDPlistDictionaryGetPlistObjectForKey()))
            {
              *(_OWORD *)v260 = v232;
              *(_QWORD *)&v260[16] = v233;
              v176 = (void *)_MDPlistContainerCopyObject();
            }
            else
            {
              v176 = 0;
            }
            if (objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.MobileSMS")))
            {
              if (v176)
              {
                memset(v260, 0, 24);
                v230 = 0uLL;
                v231 = 0;
                v228 = 0uLL;
                v229 = 0;
                v258 = 0uLL;
                v259 = 0;
                v226 = 0uLL;
                v227 = 0;
                v224 = 0uLL;
                v225 = 0;
                v222 = 0uLL;
                v223 = 0;
                v44 = (void *)objc_opt_new();
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  v220 = *(_OWORD *)v260;
                  v221 = *(_QWORD *)&v260[16];
                  v45 = (void *)_MDPlistContainerCopyObject();
                  if (v45)
                    objc_msgSend(v44, "setObject:forKey:", v45, v160);
                }
                else
                {
                  v45 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  v220 = v230;
                  v221 = v231;
                  v56 = _MDPlistContainerCopyObject();
                  if (v56)
                    objc_msgSend(v44, "setObject:forKey:", v56, v159);
                }
                else
                {
                  v56 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey()
                  && (v220 = v228, v221 = v229, (v172 = (void *)_MDPlistContainerCopyObject()) != 0))
                {
                  objc_msgSend(v44, "setObject:forKey:", v172, v158);
                }
                else
                {
                  v172 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey()
                  && (v220 = v258, v221 = v259, (v162 = (void *)_MDPlistContainerCopyObject()) != 0))
                {
                  objc_msgSend(v44, "setObject:forKey:", v162, v157);
                }
                else
                {
                  v162 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  v220 = v226;
                  v221 = v227;
                  v57 = (void *)_MDPlistContainerCopyObject();
                  if (v57)
                    objc_msgSend(v44, "setObject:forKey:", v57, v156);
                }
                else
                {
                  v57 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  v220 = v224;
                  v221 = v225;
                  v58 = (void *)_MDPlistContainerCopyObject();
                  if (v58)
                    objc_msgSend(v44, "setObject:forKey:", v58, CFSTR("kMDItemCollaborationSourceChat"));
                }
                else
                {
                  v58 = 0;
                }
                v220 = v236;
                v221 = v237;
                if (_MDPlistDictionaryGetPlistObjectForKey())
                {
                  v220 = v222;
                  v221 = v223;
                  v59 = (void *)_MDPlistContainerCopyObject();

                  if (v59)
                    objc_msgSend(v44, "setObject:forKey:", v59, CFSTR("kMDItemCollaborationSourceMessage"));
                }
                else
                {
                  v59 = v30;
                }
                v155 = (void *)v56;
                if (kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueueOnce != -1)
                  dispatch_once(&kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueueOnce, &__block_literal_global_791);
                v60 = kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue;
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2;
                block[3] = &unk_24D0EA988;
                v215 = v176;
                v61 = v44;
                v216 = v61;
                v62 = v59;
                v217 = v62;
                v63 = v45;
                v64 = *((_QWORD *)v181 + 4);
                v218 = v63;
                v219 = v64;
                dispatch_async(v60, block);

                v30 = v62;
              }
            }
            else if (v176)
            {
              if ((objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0|| (objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0|| objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(_kMDItemBundleID = '%@') && (FPCollaborationIdentifier == '%@' || _kMDItemCollaborationIdentifier == '%@')"), CFSTR("com.apple.MobileSMS"), v176, v176);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_alloc_init(MEMORY[0x24BDC2468]);
                v255[0] = v160;
                v255[1] = v159;
                v255[2] = v158;
                v255[3] = v157;
                v255[4] = v156;
                v255[5] = v153;
                v255[6] = v152;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v255, 7);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setFetchAttributes:", v47);
                v171 = v30;
                objc_msgSend(v46, "fetchAttributes");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "count");

                v207[0] = MEMORY[0x24BDAC760];
                v207[1] = 3221225472;
                v207[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_807;
                v207[3] = &unk_24D0EBC98;
                v211 = v49;
                v209 = &v240;
                v154 = v47;
                v208 = v154;
                v210 = buf;
                v212 = cf;
                v213 = v18;
                v50 = (void *)MEMORY[0x2199C2F34](v207);
                v51 = dispatch_group_create();
                +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v205[0] = MEMORY[0x24BDAC760];
                v205[1] = 3221225472;
                v205[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4_809;
                v205[3] = &unk_24D0EB060;
                v53 = v51;
                v206 = v53;
                objc_msgSend(v52, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v161, v46, 0, v50, v205);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  objc_msgSend(v54, "setCritical:", v181[161]);
                  dispatch_group_enter(v53);
                  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "startQueryTask:", v54);

                  dispatch_group_wait(v53, 0xFFFFFFFFFFFFFFFFLL);
                }
                else
                {
                  v65 = *((_QWORD *)v181 + 15);
                  if (v65)
                  {
                    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v151, -1000, 0);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    (*(void (**)(uint64_t, void *))(v65 + 16))(v65, v66);

                  }
                  CFRelease(cf);
                }

                if (!v54)
                {
                  v72 = 0;
                  goto LABEL_183;
                }
                v30 = v171;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend(v176, "isEqual:", v73);

                if ((v74 & 1) == 0)
                {
                  logForCSLogCategoryDefault();
                  v75 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    v79 = *((_QWORD *)v181 + 6);
                    *(_DWORD *)v260 = 138412546;
                    *(_QWORD *)&v260[4] = v176;
                    *(_WORD *)&v260[12] = 2112;
                    *(_QWORD *)&v260[14] = v79;
                    _os_log_error_impl(&dword_213CF1000, v75, OS_LOG_TYPE_ERROR, "Got collaboration identifier for item that isn't Messages or FileProvider: %@ bundleID:%@", v260, 0x16u);
                  }

                }
              }
            }
            v171 = v30;
            if (objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.shortcuts")))
            {
              *(_OWORD *)v260 = v238;
              *(_QWORD *)&v260[16] = v239;
              if (_MDPlistArrayGetCount() >= 4)
              {
                memset(v260, 0, 24);
                v230 = v238;
                v231 = v239;
                _MDPlistArrayGetPlistObjectAtIndex();
                v230 = *(_OWORD *)v260;
                v231 = *(_QWORD *)&v260[16];
                if (_MDPlistGetPlistObjectType() == 241)
                {
                  v230 = 0uLL;
                  v231 = 0;
                  v228 = *(_OWORD *)v260;
                  v229 = *(_QWORD *)&v260[16];
                  if (_MDPlistDictionaryGetPlistObjectForKey())
                  {
                    v228 = v230;
                    v229 = v231;
                    if (_MDPlistGetPlistObjectType() == 240)
                    {
                      v228 = v230;
                      v229 = v231;
                      if (_MDPlistArrayGetCount())
                      {
                        v228 = 0uLL;
                        v229 = 0;
                        v258 = v230;
                        v259 = v231;
                        _MDPlistArrayGetPlistObjectAtIndex();
                        v258 = v228;
                        v259 = v229;
                        v67 = (void *)_MDPlistContainerCopyObject();
                        v68 = v67;
                        if (v67)
                        {
                          v69 = objc_msgSend(v67, "BOOLValue");

                          if ((v69 & 1) != 0)
                          {
                            v228 = 0uLL;
                            v229 = 0;
                            v258 = v236;
                            v259 = v237;
                            if (_MDPlistDictionaryGetPlistObjectForKey())
                            {
                              v258 = v228;
                              v259 = v229;
                              v70 = (void *)_MDPlistContainerCopyObject();
                              if (v70)
                              {
                                v71 = v164;
                                if (!v164)
                                {
                                  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                                }
                                v164 = v71;
                                objc_msgSend(v71, "addObject:", v70);
                              }
                            }
                            else
                            {
                              v70 = 0;
                            }

                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            memset(v260, 0, 24);
            v230 = v236;
            v231 = v237;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              v230 = *(_OWORD *)v260;
              v231 = *(_QWORD *)&v260[16];
              v76 = (void *)_MDPlistContainerCopyObject();
              v230 = 0uLL;
              v231 = 0;
              v228 = v236;
              v229 = v237;
              if (_MDPlistDictionaryGetPlistObjectForKey())
              {
                v228 = v230;
                v229 = v231;
                v77 = (void *)_MDPlistContainerCopyObject();
                objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "addAppContainerOID:forBundle:fpBundle:", v77, *((_QWORD *)v181 + 6), v76);

              }
            }
            v72 = 1;
LABEL_183:

            if ((v72 & 1) == 0)
              goto LABEL_197;
            goto LABEL_52;
          }
        }
        logForCSLogCategoryDefault();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766_cold_1(v256, &v257, v38);

LABEL_81:
        v169 = 0;
        v170 = 0;
        v168 = 0;
        v30 = 0;
        goto LABEL_110;
      }
      v175 = 0;
      v167 = 0;
      v164 = 0;
LABEL_186:
      v80 = objc_msgSend(*((id *)v181 + 6), "isEqualToString:", CFSTR("com.apple.shortcuts"));
      v81 = cf;
      if (v164)
        v82 = v80;
      else
        v82 = 0;
      if (v82 == 1 && objc_msgSend(v164, "count"))
      {
        v83 = objc_alloc_init(MEMORY[0x24BDC2468]);
        objc_msgSend(v83, "setInternal:", 1);
        objc_msgSend(v83, "setLowPriority:", 0);
        v84 = *MEMORY[0x24BDC1DC8];
        v254[0] = *MEMORY[0x24BDC1D50];
        v254[1] = v84;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v254, 2);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setFetchAttributes:", v85);

        v253 = *MEMORY[0x24BDD0CE0];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v253, 1);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setProtectionClasses:", v86);

        objc_msgSend(v83, "setBundleIDs:", &unk_24D0FCFD0);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v202[0] = MEMORY[0x24BDAC760];
        v202[1] = 3221225472;
        v202[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_823;
        v202[3] = &unk_24D0EBCE8;
        v203 = v164;
        v88 = v87;
        v204 = v88;
        v89 = (void *)MEMORY[0x2199C2F34](v202);
        +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v200[0] = MEMORY[0x24BDAC760];
        v200[1] = 3221225472;
        v200[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_827;
        v200[3] = &unk_24D0EBD30;
        v200[4] = *((_QWORD *)v181 + 4);
        v91 = v88;
        v201 = v91;
        objc_msgSend(v90, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", CFSTR("(true)"), v83, 0, v89, v200);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        logForCSLogCategoryDefault();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v238) = 0;
          _os_log_impl(&dword_213CF1000, v93, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] indexFromBundle start", (uint8_t *)&v238, 2u);
        }

        +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "startQueryTask:", v92);

        v81 = cf;
      }
      if (*((_BYTE *)v241 + 24))
      {
        v95 = (const void *)_MDPlistContainerCreateWithObject();
        Bytes = _MDPlistContainerGetBytes();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", Bytes, _MDPlistContainerGetLength());
        v97 = objc_claimAutoreleasedReturnValue();

        CFRelease(v95);
        v174 = (id)v97;
        v81 = cf;
      }
      CFRelease(v81);
      v19 = 0;
LABEL_197:

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v240, 8);
      if (v19)
        goto LABEL_252;
    }
    else
    {
      v175 = 0;
      v167 = 0;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v188[0] = MEMORY[0x24BDAC760];
    v188[1] = 3221225472;
    v188[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_830;
    v188[3] = &unk_24D0EBD58;
    objc_copyWeak(v196, from);
    v175 = v175;
    v189 = v175;
    v197 = v181[160];
    v99 = *((id *)v181 + 6);
    v100 = (void *)*((_QWORD *)v181 + 17);
    v190 = v99;
    v196[1] = v100;
    v101 = *((id *)v181 + 15);
    v191 = *((_QWORD *)v181 + 4);
    v193 = v101;
    v194 = v248;
    v195 = v246;
    v198 = v251;
    v192 = *((id *)v181 + 9);
    v199 = HIBYTE(v251);
    v196[2] = *(id *)&Current;
    v102 = (id)objc_msgSend(v188, "copy");

    v103 = v181;
    if (*((_QWORD *)v181 + 5))
    {
      if ((v181[137] & 1) != 0)
      {
        v104 = objc_msgSend(*((id *)v181 + 4), "_interestedAttributesMaskForBundleID:", *((_QWORD *)v181 + 6));
        if (v104)
        {
          v105 = objc_msgSend(objc_alloc(MEMORY[0x24BDC23D0]), "initWithData:", v174);
          v186 = 0u;
          v187 = 0u;
          v184 = 0u;
          v185 = 0u;
          v106 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2488]), "initWithItems:itemsContent:", v105, 0);
          v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v184, v252, 16);
          v177 = (void *)v105;
          v178 = v102;
          v108 = 0;
          v109 = 0;
          if (v107)
          {
            v110 = *(_QWORD *)v185;
            do
            {
              for (i = 0; i != v107; ++i)
              {
                if (*(_QWORD *)v185 != v110)
                  objc_enumerationMutation(v106);
                v112 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
                v113 = objc_msgSend((id)objc_opt_class(), "checkItemOfInterest:mask:", v112, v104);
                v114 = objc_msgSend(v112, "isUpdate");
                if (v113)
                  v115 = v114;
                else
                  v115 = 0;
                if (v115 == 1)
                {
                  if (!v108)
                    v108 = (void *)objc_opt_new();
                  objc_msgSend(v108, "addObject:", v112);
                  v109 |= v113;
                }
              }
              v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v184, v252, 16);
            }
            while (v107);
          }

          v102 = v178;
          objc_msgSend(*((id *)v181 + 4), "notifyClientForItemUpdates:updatedItems:batchMask:", *((_QWORD *)v181 + 6), v108, v109);

          v103 = v181;
        }
      }
    }
    logForCSLogCategoryIndex();
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
    {
      v145 = v102;
      v147 = *((_QWORD *)v103 + 6);
      v146 = *((_QWORD *)v103 + 7);
      v148 = objc_msgSend(*((id *)v103 + 10), "length");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v147;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v146;
      *(_WORD *)&buf[22] = 2048;
      v264 = (uint64_t (*)(uint64_t, uint64_t))v148;
      _os_log_debug_impl(&dword_213CF1000, v116, OS_LOG_TYPE_DEBUG, "SISetCodedAttributes, bundleID:%@, state:\"%@\"(%ld bytes)", buf, 0x20u);
      v102 = v145;
    }

    v117 = v102;
    if (v175)
      v118 = 0;
    else
      v118 = v250 == 0;
    if (v118)
      v119 = 0;
    else
      v119 = 4;
    v120 = v181;
    v121 = v119 & 0xFFFFFFFE | (*((_DWORD *)v181 + 34) >> 8) & 1 | (*((_DWORD *)v181 + 34) >> 14) & 2;
    if (v181[161])
      v122 = v121;
    else
      v122 = v121 | 8;
    locked = SIGetLockedJournalingState();
    v124 = locked;
    if (v181[160] && !locked)
      SISetLockedJournalingState();
    v150 = v117;
    LODWORD(v149) = v122;
    v125 = v167;
    v126 = SISetCodedAttributes();
    if (v181[160]
      && *(_QWORD *)(*((_QWORD *)v181 + 4) + 136) != v165
      && (int)SIGetLockedJournalingState() >> 1 != v124 >> 1)
    {
      v182[0] = MEMORY[0x24BDAC760];
      v182[1] = 3221225472;
      v182[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_833;
      v182[3] = &unk_24D0EBDA0;
      objc_copyWeak(&v183, from);
      v127 = v182;
      v128 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
      v129 = (void *)objc_msgSend(v127, "copy", v149, blockRoutine, v150);

      v130 = v129;
      *v128 = v165;
      v128[1] = v130;
      _SIScheduleOperationPostIndexUpdate();

      objc_destroyWeak(&v183);
      v120 = v181;
      v125 = v167;
    }
    if (objc_msgSend(v125, "count", v149))
      objc_msgSend(*((id *)v120 + 4), "processDecryptsForBundleID:persona:infos:group:", *((_QWORD *)v120 + 6), *((_QWORD *)v120 + 11), v125, 0);
    if (!v126)
    {
      v131 = (void *)*((_QWORD *)v120 + 14);
      v132 = *((_QWORD *)v120 + 18);
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      SDTraceAdd(3, v131, v132, *((void **)v120 + 6), *((void **)v120 + 7), v133 - *((double *)v120 + 19));
      v134 = *((_QWORD *)v120 + 15);
      if (v134)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v134 + 16))(v134, v135);

        v120 = v181;
      }
    }
    logForCSLogCategoryIndex();
    v136 = objc_claimAutoreleasedReturnValue();
    v137 = v136;
    v138 = *((_QWORD *)v120 + 18);
    if (v138 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v136))
    {
      v139 = objc_msgSend(objc_retainAutorelease(*((id *)v120 + 6)), "UTF8String");
      v140 = (void *)*((_QWORD *)v181 + 5);
      if (v140)
        v141 = objc_msgSend(v140, "length");
      else
        v141 = 0;
      v144 = (void *)*((_QWORD *)v181 + 12);
      if (v144)
        v144 = (void *)objc_msgSend(v144, "length");
      *(_DWORD *)buf = 136446979;
      *(_QWORD *)&buf[4] = v139;
      *(_WORD *)&buf[12] = 2081;
      *(_QWORD *)&buf[14] = "indexFromBundle";
      *(_WORD *)&buf[22] = 2050;
      v264 = (uint64_t (*)(uint64_t, uint64_t))v141;
      LOWORD(v265) = 2050;
      *(_QWORD *)((char *)&v265 + 2) = v144;
      _os_signpost_emit_with_name_impl(&dword_213CF1000, v137, OS_SIGNPOST_INTERVAL_END, v138, "IndexLatency", "BundleID=%{public, signpost.telemetry:string1}s Method=%{private, signpost.telemetry:string2}s AddLength=%{public, signpost.telemetry:number1}lu DeleteLength=%{public, signpost.telemetry:number2}lu  enableTelemetry=YES ", buf, 0x2Au);
    }

    objc_destroyWeak(v196);
LABEL_252:

    _Block_object_dispose(v246, 8);
    _Block_object_dispose(v248, 8);
LABEL_253:

    return;
  }
  v10 = *(_QWORD *)(a1 + 120);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1004, 0);
    v180 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);
LABEL_4:

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_790()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.corespotlight.collaborationquery", v0);
  v2 = (void *)kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue;
  kSPReindexAllCompletedBundleIDs_block_invoke_4_sQueryQueue = (uint64_t)v1;

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(_kMDItemBundleID='com.apple.CloudDocs.MobileDocumentsFileProvider' || _kMDItemBundleID='com.apple.CloudDocs.iCloudDriveFileProvider' ||  _kMDItemBundleID='com.apple.CloudDocs.iCloudDriveFileProviderManaged') && (FPCollaborationIdentifier='%@' || _kMDItemCollaborationIdentifier='%@') && kMDItemCollaborationSourceChat!=* && kMDItemCollaborationSourceMessage!=*"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDC2468]);
  v19[0] = *MEMORY[0x24BDC2108];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v4);
  v5 = objc_msgSend(v4, "count");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3;
  v12[3] = &unk_24D0EBC28;
  v18 = v5;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v15 = v6;
  v16 = v7;
  v17 = *(id *)(a1 + 32);
  v8 = (void *)MEMORY[0x2199C2F34](v12);
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v2, v3, 0, v8, &__block_literal_global_800);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startQueryTask:", v10);

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  if (!a2)
  {
    v19 = v5;
    v20 = v6;
    v9 = *(_QWORD *)(a1 + 72);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4;
    v13[3] = &unk_24D0EBC00;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 64);
    v16 = v10;
    v17 = v11;
    v18 = v12;
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", v9, 0, v13);

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4(uint64_t a1, id *a2)
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x2199C2D78]();
  v5 = (objc_class *)MEMORY[0x24BDC2480];
  v6 = *a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAttributes:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
  objc_msgSend(v8, "setIsUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 56), "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5;
  v11[3] = &unk_24D0EB060;
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v9, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v10, 0, 0, v6, CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), 0, v11);

  objc_autoreleasePoolPop(v4);
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5_cold_1();

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_807(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  if (!a2)
  {
    v18 = v5;
    v19 = v6;
    v9 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3_808;
    v13[3] = &unk_24D0EBC70;
    v12 = *(_OWORD *)(a1 + 32);
    v10 = (id)v12;
    v14 = v12;
    v11 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = v11;
    v17 = *(_DWORD *)(a1 + 72);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", v9, 0, v13);

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_3_808(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *context;

  context = (void *)MEMORY[0x2199C2D78]();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = 0;
    v6 = *MEMORY[0x24BDC1BE8];
    v7 = *MEMORY[0x24BDC22E8];
    do
    {
      v8 = *(id *)(a2 + 8 * v5);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        if (-[__CFString isEqualToString:](v9, "isEqualToString:", v6))
        {
          v11 = v4;
          v12 = v8;
          v13 = CFSTR("kMDItemCollaborationSourceChat");
        }
        else if (-[__CFString isEqualToString:](v10, "isEqualToString:", v7))
        {
          v11 = v4;
          v12 = v8;
          v13 = CFSTR("kMDItemCollaborationSourceMessage");
        }
        else
        {
          v11 = v4;
          v12 = v8;
          v13 = v10;
        }
        objc_msgSend(v11, "setObject:forKey:", v12, v13);
      }

      ++v5;
    }
    while (v5 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v14)
  {
    v15 = (void *)_MDPlistContainerCopyRootObject();
    v16 = objc_msgSend(v15, "mutableCopy");
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v14, "objectAtIndex:", *(unsigned int *)(a1 + 64));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:atIndexedSubscript:", v20, *(unsigned int *)(a1 + 64));
  objc_msgSend(v20, "objectAtIndex:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  objc_msgSend(v20, "setObject:atIndexedSubscript:", v22, 2);
  objc_msgSend(v22, "addEntriesFromDictionary:", v4);

  objc_autoreleasePoolPop(context);
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_4_809(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_823(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (!a2)
  {
    v12 = v5;
    v13 = v6;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_824;
    v9[3] = &unk_24D0EBCC0;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", 2, 0, v9);

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_824(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v5 = a2[1];
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v7 = 0;
    if (!v4)
      goto LABEL_9;
  }
  if (((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) ^ 1 | v7) & 1) == 0)
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] set flag for %@", buf, 0xCu);
    }

    v12 = CFSTR(":EA:_kMDItemHasTopHitAppShortcuts");
    v13 = *MEMORY[0x24BDBD270];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2480]), "initWithAttributes:", v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v4, 0, v10);
    objc_msgSend(v11, "setBundleID:", CFSTR("com.apple.application"));
    objc_msgSend(v11, "setIsUpdate:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
LABEL_9:

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_827(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v2, 0, 0, *MEMORY[0x24BDD0CE0], CFSTR("com.apple.application"), 0, &__block_literal_global_829);

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_828(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_828_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] indexFromBundle complete", v5, 2u);
  }

}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_830(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = WeakRetained;
  if (!v3)
    objc_msgSend(WeakRetained, "dirty:", 0);
  if (*(_QWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_SIFilterValidatedCSImports();
    if (objc_msgSend(v10, "count"))
    {
      v26 = a1;
      v27 = v5;
      v28 = v3;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v25 = v10;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "contentURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

            objc_msgSend(v16, "contentType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

            objc_msgSend(v16, "sandboxExtension");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v19);

            objc_msgSend(v16, "externalID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v20);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v13);
      }

      a1 = v26;
      v5 = v27;
      LOBYTE(v24) = 1;
      objc_msgSend(v27, "processImportForBundleID:withURLs:contentTypes:sandboxExtensions:andIdentifiers:options:inGroup:additionalAttributes:computeUpdaterAttributesAfterImport:", *(_QWORD *)(v26 + 40), v6, v7, v8, v9, *(_QWORD *)(v26 + 96), 0, MEMORY[0x24BDBD1B8], v24);
      v3 = v28;
      v10 = v25;
    }

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "owner");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v23) = *(_BYTE *)(a1 + 114);
    objc_msgSend(*(id *)(a1 + 48), "completeIndexingItemFor:delegate:didBeginThrottle:didEndThrottle:error:live:queue:slow:startTime:completionHandler:", *(_QWORD *)(a1 + 40), v22, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v3, *(unsigned __int8 *)(a1 + 113), *(double *)(a1 + 104), *(_QWORD *)(a1 + 56), v23, *(_QWORD *)(a1 + 64));

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_833(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *group;

  if (!a3)
  {
    group = dispatch_group_create();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "restartAttachmentImport:maxCount:", group, 256);

    v5 = sIndexQueue;
    _setup_block(&__block_literal_global_835, 0, 7907);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(group, v5, v6);

  }
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_834()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "restartAttachmentImport journalingOnly notify done", v1, 2u);
  }

}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 forBundleID:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", a3, a4, 0, 0, 0, a6, a7, a8);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, void *);
  _BOOL4 readOnly;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *queue;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void (**v39)(id, void *);
  uint64_t v40;
  uint64_t v41;
  int64_t v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = (void (**)(id, void *))a10;
  readOnly = self->_readOnly;
  logForCSLogCategoryIndex();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
  if (readOnly)
  {
    if (v25)
      -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:].cold.2();

    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v26);

    }
  }
  else
  {
    if (v25)
      -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:].cold.1();

    v27 = objc_msgSend(v16, "count");
    v28 = objc_msgSend(v17, "count");
    if (v27 | v28)
    {
      v29 = v28;
      queue = sIndexQueue;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke;
      v32[3] = &unk_24D0EBEA8;
      v32[4] = self;
      v39 = v22;
      v33 = v21;
      v40 = v29;
      v41 = v27;
      v42 = a9;
      v34 = v19;
      v35 = v20;
      v36 = v17;
      v37 = v18;
      v38 = v16;
      _setup_block(v32, 0, 8231);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(queue, v30);

    }
    else if (v22)
    {
      v22[2](v22, 0);
    }
  }

}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  os_signpost_id_t v28;
  uint8_t buf[16];

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 1);
  v3 = (_BYTE *)*v2;
  if (!*(_QWORD *)(*v2 + 128) || v3[97])
    goto LABEL_3;
  if (!v3[24])
  {
LABEL_17:
    logForCSLogCategoryIndex();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    logForCSLogCategoryIndex();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_213CF1000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "IndexLatency", (const char *)&unk_213D89001, buf, 2u);
    }

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_837;
    v17[3] = &unk_24D0EBE80;
    v25 = *(id *)(a1 + 88);
    v26 = *(_OWORD *)(a1 + 96);
    v15 = *(id *)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 112);
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 72);
    v24 = *(id *)(a1 + 80);
    v28 = v11;
    SIBackgroundOpBlock(v14, 0, v17);

    v6 = v25;
    goto LABEL_7;
  }
  if (v3[72])
  {
    Current = CFAbsoluteTimeGetCurrent();
    v8 = *v2;
    if (Current <= *(double *)(*v2 + 80))
    {
      if (*(_BYTE *)(v8 + 24) && *(_BYTE *)(v8 + 72))
      {
        logForCSLogCategoryIndex();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_2();

      }
      goto LABEL_17;
    }
  }
LABEL_3:
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 88);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_7:

  }
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_837(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  const void *v12;
  const void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  char *v59;
  char *v60;
  unsigned int v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  char *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  os_signpost_id_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  _QWORD *v93;
  id obj;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  _QWORD *v102;
  uint64_t v103;
  void *context;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  NSObject *v113;
  _QWORD v114[5];
  _QWORD v115[5];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[9];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _QWORD v128[2];
  _QWORD v129[2];
  uint8_t buf[4];
  uint64_t v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  uint64_t v138;

  v3 = a1;
  v138 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v120[5] = MEMORY[0x24BDAC760];
    v120[6] = 3221225472;
    v120[7] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2;
    v120[8] = &unk_24D0EBE18;
    v5 = a1 + 12;
    v122 = *((_OWORD *)a1 + 6);
    v102 = a1 + 4;
    v121 = (id)a1[4];
    AnalyticsSendEventLazy();
    if (v3[13] && *v102 && (v3[14] & 0x10) != 0 && SIGetAccumulatedSizeForGroup() >= 134217729)
    {
      v86 = v3[11];
      if (!v86)
        goto LABEL_136;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1004, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v86 + 16))(v86, v8);
    }
    else
    {
      if (*v5)
      {
        v6 = *(_QWORD *)(v3[5] + 168);
        v129[0] = CFSTR("delete");
        v129[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        SDTransactionCreate(v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      if (v3[13])
      {
        v9 = *(_QWORD *)(v3[5] + 168);
        v128[0] = CFSTR("add");
        v128[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SDTransactionCreate(v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
      if (v3[6])
      {
        v12 = (const void *)SICopyCachedCSClientState();
        if (!v12)
        {
          v62 = v3[11];
          v63 = (void *)MEMORY[0x24BDD1540];
          v64 = *MEMORY[0x24BDC1950];
          v65 = -1006;
LABEL_108:
          objc_msgSend(v63, "errorWithDomain:code:userInfo:", v64, v65, 0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v62 + 16))(v62, v66);

          goto LABEL_134;
        }
        v13 = v12;
        if (!CFEqual(v12, (CFTypeRef)v3[6]))
        {
          v67 = v3[11];
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1006, 0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v67 + 16))(v67, v68);

          CFRelease(v13);
          goto LABEL_134;
        }
        CFRelease(v13);
      }
      if (!*v5)
      {
LABEL_23:
        if (!v3[13])
          goto LABEL_130;
        v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)v3[10], "count"));
        v92 = (void *)objc_opt_new();
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        obj = (id)v3[10];
        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
        if (!v103)
        {
          v61 = 0;
          goto LABEL_113;
        }
        v89 = v11;
        v90 = v8;
        LOBYTE(v16) = 0;
        v99 = *(_QWORD *)v117;
        v107 = (void *)*MEMORY[0x24BDBD430];
        v109 = (void *)*MEMORY[0x24BDC2290];
        v17 = (void *)*MEMORY[0x24BDC1DA8];
        v18 = (void *)*MEMORY[0x24BDC1DB0];
        v110 = (void *)*MEMORY[0x24BDC1BA0];
        v95 = *MEMORY[0x24BDC1B90];
        v91 = *MEMORY[0x24BDC1760];
        v93 = v3;
        v19 = v100;
        while (1)
        {
          for (i = 0; i != v103; ++i)
          {
            if (*(_QWORD *)v117 != v99)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
            context = (void *)MEMORY[0x2199C2D78]();
            if (objc_msgSend(v21, "isUpdate")
              && objc_msgSend((id)objc_opt_class(), "checkItemOfInterest:mask:", v21, 0))
            {
              objc_msgSend(v92, "addObject:", v21);
            }
            if ((v16 & 1) != objc_msgSend(v21, "isUpdate", v89, v90) && objc_msgSend(v19, "count"))
            {
              v115[0] = MEMORY[0x24BDAC760];
              v115[1] = 3221225472;
              v115[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2_851;
              v115[3] = &unk_24D0EB060;
              v115[4] = v3[5];
              v22 = (id)objc_msgSend(v115, "copy");

              if (!SISetCSAttributes())
                CFRelease(v22);
              v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

              v19 = v23;
            }
            v16 = objc_msgSend(v21, "isUpdate");
            v24 = (void *)*v102;
            v25 = v21;
            v26 = v24;
            logForCSLogCategoryIndex();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v131 = (uint64_t)v25;
              _os_log_debug_impl(&dword_213CF1000, v27, OS_LOG_TYPE_DEBUG, "creating dictionary for %@", buf, 0xCu);
            }

            v106 = v25;
            objc_msgSend(v25, "uniqueIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v105 = v26;
            if (!v26 || !v28)
            {
              logForCSLogCategoryIndex();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v25, "uniqueIdentifier");
                v60 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v131 = (uint64_t)v105;
                v132 = 2112;
                v133 = v60;
                _os_log_debug_impl(&dword_213CF1000, v35, OS_LOG_TYPE_DEBUG, "Failure for %@ / %@", buf, 0x16u);

              }
              v36 = 0;
              goto LABEL_94;
            }
            objc_msgSend(v25, "attributeSet");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v26, CFSTR("_kMDItemBundleID"));
            objc_msgSend(v106, "uniqueIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("_kMDItemExternalID"));

            objc_msgSend(v106, "uniqueIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v32, "length");

            objc_msgSend(v30, "setObject:forKey:", v107, CFSTR("_kMDItemWillModify"));
            -[NSObject textContent](v29, "textContent");
            v33 = objc_claimAutoreleasedReturnValue();
            v101 = v19;
            v98 = v16;
            v97 = i;
            v111 = v30;
            v113 = v29;
            if (v33)
            {
              v96 = (void *)v33;
              v34 = v109;
              objc_msgSend(v30, "setObject:forKey:", v33, v109);
            }
            else
            {
              -[NSObject HTMLContentData](v29, "HTMLContentData");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (v37
                && (objc_msgSend(v37, "length"),
                    _MDPlainTextFromHTMLData(),
                    (v39 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v96 = (void *)v39;
                objc_msgSend(v30, "setObject:forKey:", v39, v109);
              }
              else
              {
                v96 = 0;
              }

              v34 = v109;
            }
            -[NSObject attributeDictionary](v29, "attributeDictionary");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0;
            do
            {
              v125 = 0u;
              v126 = 0u;
              v123 = 0u;
              v124 = 0u;
              v42 = v40;
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
              if (!v43)
                goto LABEL_84;
              v44 = v43;
              v45 = *(_QWORD *)v124;
              do
              {
                for (j = 0; j != v44; ++j)
                {
                  if (*(_QWORD *)v124 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
                  if ((v41 & 1) != 0)
                  {
                    objc_msgSend(v47, "keyName");
                    v48 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v48 = v47;
                  }
                  v49 = v48;
                  if ((objc_msgSend(v17, "isEqualToString:", v48) & 1) == 0
                    && (objc_msgSend(v18, "isEqualToString:", v49) & 1) == 0
                    && (objc_msgSend(v49, "hasSuffix:", CFSTR("Dictionary")) & 1) == 0
                    && (objc_msgSend(v49, "hasSuffix:", CFSTR("ContactProperties")) & 1) == 0
                    && (objc_msgSend(v49, "hasSuffix:", CFSTR("Persons")) & 1) == 0)
                  {
                    if (objc_msgSend(v34, "isEqualToString:", v49))
                    {
                      -[NSObject textContent](v113, "textContent");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "setObject:forKeyedSubscript:", v50, v34);
                    }
                    else
                    {
                      v51 = objc_msgSend(v110, "isEqualToString:", v49);
                      -[NSObject attributeForKey:](v113, "attributeForKey:", v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v51)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v50, "absoluteString");
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v111, "setObject:forKeyedSubscript:", v52, v110);

                        }
                        else
                        {
                          objc_msgSend(v111, "setObject:forKeyedSubscript:", v50, v110);
                        }
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v50, "localizedStrings");
                          v53 = objc_claimAutoreleasedReturnValue();

                          v50 = (void *)v53;
                        }
                        v34 = v109;
                        if (v50)
                        {
                          objc_msgSend(v111, "setObject:forKey:", v50, v49);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v108 += objc_msgSend(v50, "length");
                          }
                          goto LABEL_81;
                        }
                        objc_msgSend(v42, "objectForKeyedSubscript:", v49);
                        v54 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v54 == v107)
                          objc_msgSend(v111, "setObject:forKey:");
                        v50 = 0;
                      }
                      v34 = v109;
                    }
LABEL_81:

                  }
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
              }
              while (v44);
LABEL_84:

              if ((v41 & 1) != 0)
                goto LABEL_87;
              -[NSObject customAttributeDictionary](v113, "customAttributeDictionary");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = 1;
            }
            while (v40);
            v42 = 0;
LABEL_87:
            v3 = v93;
            objc_msgSend(v111, "objectForKeyedSubscript:", v95);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v101;
            v16 = v98;
            i = v97;
            if (v55)
            {

            }
            else if (objc_msgSend(v105, "isEqualToString:", CFSTR("com.apple.mobilemail")))
            {
              objc_msgSend(v111, "setObject:forKeyedSubscript:", v91, v95);
            }
            if ((objc_msgSend(v106, "isUpdate") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v108);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "setObject:forKey:", v56, CFSTR("_kMDItemStorageSize"));

            }
            v36 = (const char *)v111;
            v35 = v113;
LABEL_94:

            logForCSLogCategoryIndex();
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
            if (v36)
            {
              if (v58)
              {
                *(_DWORD *)buf = 138412546;
                v131 = (uint64_t)v106;
                v132 = 2112;
                v133 = v36;
                _os_log_debug_impl(&dword_213CF1000, v57, OS_LOG_TYPE_DEBUG, "Got metadata for %@: %@", buf, 0x16u);
              }

              v59 = (char *)v36;
              objc_msgSend(v19, "addObject:", v36);
            }
            else
            {
              if (v58)
              {
                *(_DWORD *)buf = 138412290;
                v131 = (uint64_t)v106;
                _os_log_debug_impl(&dword_213CF1000, v57, OS_LOG_TYPE_DEBUG, "No dictionary for %@; skipping",
                  buf,
                  0xCu);
              }

              v59 = 0;
            }

            objc_autoreleasePoolPop(context);
          }
          v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
          if (!v103)
          {
            v100 = v19;
            if (v16)
              v61 = 0x20000;
            else
              v61 = 0;
            v11 = v89;
            v8 = v90;
LABEL_113:

            if (objc_msgSend((id)v3[5], "_shouldNotifyForSearchableItemUpdates:", v3[4])
              && objc_msgSend(v92, "count"))
            {
              v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 17);
              objc_msgSend(v69, "setUpdatedItems:", v92);
              logForCSLogCategoryDefault();
              v70 = (char *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEBUG))
                -[SPConcreteCoreSpotlightIndexer notifyClientForItemUpdates:updatedItems:batchMask:].cold.1(v92, v70);

              +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v3[4];
              objc_msgSend((id)v3[5], "dataclass");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v72) = objc_msgSend(v71, "handleJob:bundleID:protectionClass:completionHandler:", v69, v72, v73, &__block_literal_global_853);

              if ((v72 & 1) == 0)
              {
                +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "extensionDelegate");
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                if (v75)
                  objc_msgSend(v75, "indexRequestsPerformDataJob:forBundle:completionHandler:", v69, *v102, &__block_literal_global_855);

              }
            }
            logForCSLogCategoryIndex();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              v87 = v3[4];
              v88 = (const char *)v3[13];
              *(_DWORD *)buf = 138412802;
              v131 = v87;
              v132 = 2048;
              v133 = v88;
              v134 = 2048;
              v135 = v61;
              _os_log_debug_impl(&dword_213CF1000, v76, OS_LOG_TYPE_DEBUG, "SISetCSAttributes, bundleID:%@, adds:%ld, flags:0x%08lx", buf, 0x20u);
            }

            v114[0] = MEMORY[0x24BDAC760];
            v114[1] = 3221225472;
            v114[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_856;
            v114[3] = &unk_24D0EB060;
            v114[4] = v3[5];
            v77 = (id)objc_msgSend(v114, "copy");

            if (SISetCSAttributes())
            {
              setClientStateForIndexing((void *)v3[5], (void *)v3[4], (void *)v3[9], (void *)v3[7], (void *)v3[11], v11);
            }
            else
            {
              v78 = v3[11];
              if (v78)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *))(v78 + 16))(v78, v79);

              }
              CFRelease(v77);
            }

LABEL_130:
            logForCSLogCategoryIndex();
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = v80;
            v82 = v3[15];
            if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
            {
              v83 = objc_msgSend(objc_retainAutorelease((id)v3[4]), "UTF8String");
              v85 = v3[12];
              v84 = v3[13];
              *(_DWORD *)buf = 136446979;
              v131 = v83;
              v132 = 2081;
              v133 = "indexSearchableItems";
              v134 = 2050;
              v135 = v84;
              v136 = 2050;
              v137 = v85;
              _os_signpost_emit_with_name_impl(&dword_213CF1000, v81, OS_SIGNPOST_INTERVAL_END, v82, "IndexLatency", "BundleID=%{public, signpost.telemetry:string1}s Method=%{private, signpost.telemetry:string2}s AddCount=%{public, signpost.telemetry:number1}lu DeleteCount=%{public, signpost.telemetry:number2}lu  enableTelemetry=YES ", buf, 0x2Au);
            }

            goto LABEL_134;
          }
        }
      }
      logForCSLogCategoryIndex();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_837_cold_2();

      v15 = v3[5];
      if (v3[13])
      {
        SIDeleteCSAttributes();
        goto LABEL_23;
      }
      v120[0] = MEMORY[0x24BDAC760];
      v120[1] = 3221225472;
      v120[2] = __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_850;
      v120[3] = &unk_24D0EB060;
      v120[4] = v15;
      objc_msgSend(v120, "copy");
      if (SIDeleteCSAttributes())
      {
        setClientStateForIndexing((void *)v3[5], (void *)v3[4], (void *)v3[9], (void *)v3[7], (void *)v3[11], v8);
        goto LABEL_134;
      }
      v62 = v3[11];
      if (v62)
      {
        v63 = (void *)MEMORY[0x24BDD1540];
        v64 = *MEMORY[0x24BDC1950];
        v65 = -1;
        goto LABEL_108;
      }
LABEL_134:

    }
LABEL_136:

    return;
  }
  v4 = a1[11];
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v112 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
}

id __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("deleteCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("addCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("bundleID");
  v4 = a1[4];
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_850(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_2_851(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_852(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1();
  }

}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_854(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_1();
  }

}

uint64_t __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_856(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty");
}

- (void)validateConcreteIndexer:(BOOL)a3 outFileDescriptor:(int)a4
{
  dispatch_group_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  BOOL v22;
  _QWORD v23[5];
  NSObject *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[3];
  char v35;

  if ((a4 & 0x80000000) == 0)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 1;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy_;
    v32[4] = __Block_byref_object_dispose_;
    v33 = 0;
    v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy_;
    v30[4] = __Block_byref_object_dispose_;
    v31 = 0;
    v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = dispatch_group_create();
    v8 = sIndexQueue;
    v9 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke;
    v23[3] = &unk_24D0EBF68;
    v23[4] = self;
    v28 = a4;
    v10 = v7;
    v29 = a3;
    v24 = v10;
    v25 = v32;
    v26 = v30;
    v27 = v34;
    _setup_block(v23, 0, 8371);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_async(v10, v8, v11);

    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = sIndexQueue;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_869;
    v16[3] = &unk_24D0EBF90;
    v21 = a4;
    v22 = a3;
    v16[4] = self;
    v18 = v34;
    v19 = v32;
    v20 = v30;
    v14 = v12;
    v17 = v14;
    _setup_block(v16, 0, 8402);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v10, v13, v15);

    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v30, 8);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);
  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  int v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 128);
  if (!v3 || *(_BYTE *)(v2 + 24) || *(_BYTE *)(v2 + 26))
  {
    v4 = *(_DWORD *)(a1 + 72);
    if (v4 < 0)
    {
      logForCSLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(v6 + 128);
        v8 = *(unsigned __int8 *)(v6 + 24);
        v9 = *(unsigned __int8 *)(v6 + 26);
        LODWORD(v6) = *(unsigned __int8 *)(v6 + 97);
        *(_DWORD *)buf = 134218752;
        v22 = v7;
        v23 = 1024;
        v24 = v8;
        v25 = 1024;
        v26 = v9;
        v27 = 1024;
        v28 = v6;
        _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d", buf, 0x1Eu);
      }

    }
    else
    {
      dprintf(v4, "Validate concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d\n", v3, *(unsigned __int8 *)(v2 + 24), *(unsigned __int8 *)(v2 + 26), *(unsigned __int8 *)(v2 + 97));
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v10 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_859;
    v14[3] = &unk_24D0EBF40;
    v12 = v10;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v20 = *(_BYTE *)(a1 + 76);
    v19 = *(_DWORD *)(a1 + 72);
    v17 = *(_OWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 64);
    SIBackgroundOpBlock(v11, 0, v14);

  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_859(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a3)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v4 = *(id *)(a1 + 32);
    _SIValidateActivityJournal();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_2(uint64_t a1, const __CFString *a2, uint64_t *a3, unint64_t a4)
{
  __CFString *Copy;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  __CFString *v29;
  id v30;
  __int128 v31;
  void *v32;
  unint64_t v33;
  void *v34;
  int v35;
  char v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  Copy = (__CFString *)CFStringCreateCopy(0, a2);
  if ((-[__CFString isEqualToString:](Copy, "isEqualToString:", CFSTR("com.apple.searchd")) & 1) == 0)
  {
    v8 = malloc_type_calloc(1uLL, (a4 >> 3) + 1, 0xED4DF6A9uLL);
    v9 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
    v10 = v9;
    if (a4)
    {
      v11 = a4;
      v12 = v9;
      do
      {
        v13 = *a3++;
        *v12++ = v13;
        --v11;
      }
      while (v11);
    }
    v14 = *(_DWORD *)(a1 + 72);
    if (v14 < 0)
    {
      logForCSLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(a1 + 76))
          v17 = "Deletes";
        else
          v17 = "Items";
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
        *(_DWORD *)buf = 136315906;
        v39 = v17;
        v40 = 2112;
        v41 = v18;
        v42 = 2080;
        v43 = -[__CFString UTF8String](objc_retainAutorelease(Copy), "UTF8String");
        v44 = 1024;
        v45 = a4;
        _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validate %s %@ %s BatchCount:%d\n", buf, 0x26u);
      }

    }
    else
    {
      if (*(_BYTE *)(a1 + 76))
        v15 = "Deletes";
      else
        v15 = "Items";
      dprintf(v14, "### Validate %s %s %s BatchCount:%d\n", v15, (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "UTF8String"), (const char *)-[__CFString UTF8String](objc_retainAutorelease(Copy), "UTF8String"), a4);
    }
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", Copy);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v21, Copy);

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_863;
    v28[3] = &unk_24D0EBEF0;
    v32 = v10;
    v33 = a4;
    v34 = v8;
    v36 = *(_BYTE *)(a1 + 76);
    v35 = *(_DWORD *)(a1 + 72);
    v22 = Copy;
    v29 = v22;
    v31 = *(_OWORD *)(a1 + 56);
    v30 = *(id *)(a1 + 40);
    v23 = (void *)MEMORY[0x2199C2F34](v28);
    v24 = *(_QWORD **)(a1 + 32);
    v25 = v24[16];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), *MEMORY[0x24BDC1AE8], v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDC1E50];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = objc_msgSend(v24, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", v25, v26, v27, v23);

    if ((v24 & 1) == 0)
    {
      free(v8);
      free(v10);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }

  }
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_863(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t i;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t j;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3 == 1)
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (*(_BYTE *)(a1 + 92))
    {
      if (v6)
      {
        for (i = 0; i < v6; ++i)
        {
          if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 80) + (i >> 3)) >> (i & 7)) & 1) != 0)
          {
            v8 = *(_DWORD *)(a1 + 88);
            if (v8 < 0)
            {
              logForCSLogCategoryDefault();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              {
                v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * i);
                v15 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
                *(_DWORD *)buf = 134218498;
                v26 = v14;
                v27 = 2048;
                v28 = v14;
                v29 = 2080;
                v30 = v15;
                _os_log_error_impl(&dword_213CF1000, v10, OS_LOG_TYPE_ERROR, "Validate concrete indexer: ### Error - Missed delete oid: 0x%llx (%lld) for bundle %s\n", buf, 0x20u);
              }

            }
            else
            {
              v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * i);
              dprintf(v8, "### Error - Missed delete oid: 0x%llx (%lld) for bundle %s\n", v9, v9, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
            }
            v11 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 32));

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            v6 = *(_QWORD *)(a1 + 72);
          }
        }
      }
    }
    else if (v6)
    {
      for (j = 0; j < v6; ++j)
      {
        if (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 80) + (j >> 3)) >> (j & 7)) & 1) == 0)
        {
          v17 = *(_DWORD *)(a1 + 88);
          if (v17 < 0)
          {
            logForCSLogCategoryDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * j);
              v24 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
              *(_DWORD *)buf = 134218498;
              v26 = v23;
              v27 = 2048;
              v28 = v23;
              v29 = 2080;
              v30 = v24;
              _os_log_error_impl(&dword_213CF1000, v19, OS_LOG_TYPE_ERROR, "Validate concrete indexer: ### Error - Missing oid: 0x%llx (%lld) for bundle %s\n", buf, 0x20u);
            }

          }
          else
          {
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * j);
            dprintf(v17, "### Error - Missing oid: 0x%llx (%lld) for bundle %s\n", v18, v18, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
          }
          v20 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "intValue") + 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v22, *(_QWORD *)(a1 + 32));

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          v6 = *(_QWORD *)(a1 + 72);
        }
      }
    }
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 64));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    _MDStoreOIDArrayGetVectorCount();
    _MDStoreOIDArrayApplyBlock();
  }

}

_QWORD *__76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_2_864(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (a5 >= 2)
  {
    for (i = 1; i != a5; ++i)
    {
      v6 = result[5];
      if ((v6 & 0x8000000000000000) == 0)
      {
        v7 = 0;
        v8 = *(_QWORD *)(a4 + 8 * i);
        while (1)
        {
          v9 = v7 + (uint64_t)(v6 - v7) / 2;
          v10 = *(_QWORD *)(result[4] + 8 * v9);
          if (v10 == v8)
            break;
          if (v10 <= v8)
          {
            v7 = v9 + 1;
            v9 = v6;
          }
          else if (v9 == v6)
          {
            goto LABEL_14;
          }
          v6 = v9;
          if (v7 > (uint64_t)v9)
            goto LABEL_14;
        }
        if ((v9 & 0x8000000000000000) == 0)
          *(_BYTE *)(result[6] + (v9 >> 3)) |= 1 << (v9 & 7);
      }
LABEL_14:
      ;
    }
  }
  return result;
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_869(uint64_t a1)
{
  int v2;
  const char *v3;
  const char *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  int v24;
  const char *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  int v35;
  id obj;
  int v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  _BYTE v44[40];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 72);
  if (v2 < 0)
  {
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
        if (*(_BYTE *)(a1 + 76))
          v10 = "Deletes";
        else
          v10 = "Items";
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          v11 = "Success";
        else
          v11 = "Failed";
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v44 = v9;
        *(_WORD *)&v44[8] = 2080;
        *(_QWORD *)&v44[10] = v10;
        *(_WORD *)&v44[18] = 2080;
        *(_QWORD *)&v44[20] = v11;
        _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "### Validation Complete for PC %@ validating %s: Result - %s\n", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_869_cold_1();
    }

  }
  else
  {
    v3 = (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "UTF8String");
    v4 = "Deletes";
    if (!*(_BYTE *)(a1 + 76))
      v4 = "Items";
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v5 = "Success";
    else
      v5 = "Failed";
    dprintf(v2, "PC %s validating %s: Result - %s\n", v3, v4, v5);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v12)
  {
    v13 = v12;
    v38 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v38)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        v18 = *(_DWORD *)(a1 + 72);
        if (v17 < 1)
        {
          if (v18 < 0)
          {
            logForCSLogCategoryDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_45;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v26, "intValue");
            v33 = "Deletes";
            if (!*(_BYTE *)(a1 + 76))
              v33 = "Items";
            v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v44 = v32;
            *(_WORD *)&v44[4] = 2080;
            *(_QWORD *)&v44[6] = v33;
            *(_WORD *)&v44[14] = 2112;
            *(_QWORD *)&v44[16] = v34;
            *(_WORD *)&v44[24] = 2112;
            *(_QWORD *)&v44[26] = v15;
            _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validation Complete %d %s %@ bundle: %@\n", buf, 0x26u);
            goto LABEL_44;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v15);
          v19 = objc_claimAutoreleasedReturnValue();
          v24 = -[NSObject intValue](v19, "intValue");
          if (*(_BYTE *)(a1 + 76))
            v25 = "Deletes";
          else
            v25 = "Items";
          dprintf(v18, "### Validation Complete %d %s %s bundle: %s\n", v24, v25, (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        }
        else
        {
          if (v18 < 0)
          {
            logForCSLogCategoryDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_45;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "intValue");
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v15);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "intValue");
            v30 = "Deletes";
            if (!*(_BYTE *)(a1 + 76))
              v30 = "Items";
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v44 = v27;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v29;
            *(_WORD *)&v44[10] = 2080;
            *(_QWORD *)&v44[12] = v30;
            *(_WORD *)&v44[20] = 2112;
            *(_QWORD *)&v44[22] = v31;
            *(_WORD *)&v44[30] = 2112;
            *(_QWORD *)&v44[32] = v15;
            _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_DEFAULT, "Validate concrete indexer: ### Validation Error %d of %d %s %@ bundle: %@\n", buf, 0x2Cu);

LABEL_44:
            goto LABEL_45;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v15);
          v19 = objc_claimAutoreleasedReturnValue();
          v37 = -[NSObject intValue](v19, "intValue");
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v13;
          v22 = objc_msgSend(v20, "intValue");
          if (*(_BYTE *)(a1 + 76))
            v23 = "Deletes";
          else
            v23 = "Items";
          v35 = v22;
          v13 = v21;
          dprintf(v18, "### Validation Error %d of %d %s %s bundle: %s\n", v37, v35, v23, (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));

        }
LABEL_45:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v13);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)validateVectors:(int)a3
{
  dispatch_group_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[5];
  dispatch_group_t v17;
  int v18;

  if ((a3 & 0x80000000) == 0)
  {
    v5 = dispatch_group_create();
    v6 = sIndexQueue;
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke;
    v16[3] = &unk_24D0EAB38;
    v18 = a3;
    v16[4] = self;
    v17 = v5;
    v8 = v5;
    _setup_block(v16, 0, 8441);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_async(v8, v6, v9);

    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = sIndexQueue;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_2;
    v14[3] = &unk_24D0EA758;
    v15 = v10;
    v12 = v10;
    _setup_block(v14, 0, 8448);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v8, v11, v13);

    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 128);
  if (!v3 || *(_BYTE *)(v2 + 24) || *(_BYTE *)(v2 + 26))
  {
    v4 = *(_DWORD *)(a1 + 48);
    if (v4 < 0)
    {
      logForCSLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(v6 + 128);
        v8 = *(unsigned __int8 *)(v6 + 24);
        v9 = *(unsigned __int8 *)(v6 + 26);
        LODWORD(v6) = *(unsigned __int8 *)(v6 + 97);
        *(_DWORD *)buf = 134218752;
        v17 = v7;
        v18 = 1024;
        v19 = v8;
        v20 = 1024;
        v21 = v9;
        v22 = 1024;
        v23 = v6;
        _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Validate vectors for concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d", buf, 0x1Eu);
      }

    }
    else
    {
      dprintf(v4, "Validate vectors for concrete indexer skipped: index:%p suspended:%d suspending:%d readOnly:%d\n", v3, *(unsigned __int8 *)(v2 + 24), *(unsigned __int8 *)(v2 + 26), *(unsigned __int8 *)(v2 + 97));
    }
  }
  else
  {
    v10 = *(_DWORD *)(a1 + 48);
    if ((v10 & 0x80000000) == 0)
      dprintf(v10, "Validate vectors for concrete indexer pc: %s\n", (const char *)objc_msgSend(*(id *)(v2 + 168), "UTF8String"));
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_877;
    v13[3] = &unk_24D0EBFB8;
    v14 = v11;
    v15 = *(_DWORD *)(a1 + 48);
    SIBackgroundOpBlock(v12, 0, v13);

  }
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_877(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
    _SIValidateVectors();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __50__SPConcreteCoreSpotlightIndexer_validateVectors___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)prepareIndexingWhileLocked:(id)a3 holdAssertionFor:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  v10 = sIndexQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __96__SPConcreteCoreSpotlightIndexer_prepareIndexingWhileLocked_holdAssertionFor_completionHandler___block_invoke;
  v14[3] = &unk_24D0EBFE0;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v14[4] = self;
  v11 = v8;
  v12 = v9;
  _setup_block(v14, 0, 8496);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v10, v13);

}

void __96__SPConcreteCoreSpotlightIndexer_prepareIndexingWhileLocked_holdAssertionFor_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 128);
    v5 = *(unsigned __int8 *)(v3 + 24);
    v6 = *(unsigned __int8 *)(v3 + 26);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 97);
    v9 = 134218752;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "prepareIndexingWhileLocked failed: index:%p suspended:%d suspending:%d readOnly:%d", (uint8_t *)&v9, 0x1Eu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

- (void)finishIndexingWhileLocked:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sIndexQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__SPConcreteCoreSpotlightIndexer_finishIndexingWhileLocked_completionHandler___block_invoke;
  v12[3] = &unk_24D0EC008;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v9 = v6;
  v10 = v7;
  _setup_block(v12, 0, 8545);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v11);

}

void __78__SPConcreteCoreSpotlightIndexer_finishIndexingWhileLocked_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 128);
    v5 = *(unsigned __int8 *)(v3 + 24);
    v6 = *(unsigned __int8 *)(v3 + 26);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 97);
    v9 = 134218752;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "finishIndexingWhileLocked failed: index:%p suspended:%d suspending:%d readOnly:%d", (uint8_t *)&v9, 0x1Eu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = sIndexQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke;
    v13[3] = &unk_24D0EC058;
    v13[4] = self;
    v16 = v10;
    v14 = v8;
    v15 = v9;
    _setup_block(v13, 0, 8687);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v12);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke(id *a1)
{
  id *v2;
  _BYTE *v3;
  NSObject *v4;
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = a1 + 4;
  objc_msgSend(a1[4], "readyIndex:", 1);
  v3 = *v2;
  if (!*((_QWORD *)*v2 + 16) || v3[24] || v3[97])
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1();

    v5 = (void (**)(id, void *))a1[7];
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v6);

    }
  }
  else if (objc_msgSend(v3, "denyOperationOnAssertedIndex:", "willModifySearchableItemsWithIdentifier"))
  {
    v7 = *MEMORY[0x24BDC1950];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void (**)(id, void *))a1[7];
    if (v9)
    {
      v12 = v8;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, -1000, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v10);

      v8 = v12;
    }

  }
  else
  {
    v11 = *((_QWORD *)a1[4] + 16);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_888;
    v13[3] = &unk_24D0EAF08;
    v16 = a1[7];
    v14 = a1[5];
    v15 = a1[6];
    SIBackgroundOpBlock(v11, 0, v13);

  }
}

void __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_888(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const void *v15;
  void (**v16)(id, void *);
  void *v17;
  id v18;
  id *v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    }
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = (id *)a1;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      v10 = *MEMORY[0x24BDC22E8];
      v11 = MEMORY[0x24BDBD1C8];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v26[0] = CFSTR("_kMDItemWillModify");
          v26[1] = v10;
          v27[0] = v11;
          v27[1] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v8);
    }

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_2;
    v20[3] = &unk_24D0EB898;
    v21 = v19[6];
    v15 = (const void *)objc_msgSend(v20, "copy");
    if (!SISetCSAttributes())
    {
      v16 = (void (**)(id, void *))v19[6];
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v17);

      }
      CFRelease(v15);
    }

  }
}

uint64_t __105__SPConcreteCoreSpotlightIndexer_willModifySearchableItemsWithIdentifiers_forBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_backgroundDeleteItems:(id)a3 bundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __SI *index;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(id, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer _backgroundDeleteItems:bundleID:completionHandler:].cold.1();

  if (self->_index && !self->_readOnly)
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "_backgroundDeleteItems"))
    {
      v13 = *MEMORY[0x24BDC1950];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v13, -1000, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v14);

      }
    }
    else
    {
      index = self->_index;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke;
      v16[3] = &unk_24D0EAF08;
      v19 = v10;
      v17 = v9;
      v18 = v8;
      SIBackgroundOpBlock((uint64_t)index, 0, v16);

      v12 = v19;
    }
    goto LABEL_7;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);
LABEL_7:

  }
}

void __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);

    }
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke_2;
    v10[3] = &unk_24D0EB898;
    v11 = *(id *)(a1 + 48);
    v5 = (id)objc_msgSend(v10, "copy");
    v6 = SIDeleteCSAttributes();

    if (!v6)
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      }
    }

  }
}

uint64_t __84__SPConcreteCoreSpotlightIndexer__backgroundDeleteItems_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteItemsForQuery:(id)a3 bundleID:(id)a4 fromClient:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  NSObject *v14;
  __SI *index;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD block[4];
  void (**v30)(id, void *, _QWORD);
  uint64_t *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  SPConcreteCoreSpotlightIndexer *v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  uint8_t buf[8];
  _QWORD v43[4];
  _QWORD v44[3];
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  logForCSLogCategoryIndex();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:].cold.2();

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  index = self->_index;
  if (index)
  {
    if (!self->_readOnly)
    {
      if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "deleteItemsForQuery"))
      {
        v16 = *MEMORY[0x24BDC1950];
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v16, -1000, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v18, 0);
      }
      else
      {
        v26 = dispatch_group_create();
        dispatch_group_enter(v26);
        v27 = MEMORY[0x24BDAC760];
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke;
        v34[3] = &unk_24D0EC0F8;
        v40 = &v46;
        v17 = v26;
        v35 = v17;
        v36 = self;
        v37 = v12;
        v38 = v11;
        v39 = v10;
        v41 = v43;
        SIBackgroundOpBlock((uint64_t)index, 0, v34);
        dispatch_get_global_queue(9, 2uLL);
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = v27;
        block[1] = 3221225472;
        block[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_5;
        block[3] = &unk_24D0EC120;
        v31 = &v46;
        v32 = v44;
        v30 = v13;
        v33 = v43;
        dispatch_group_notify(v17, v28, block);

        v18 = v35;
      }

      goto LABEL_18;
    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:].cold.1();

    if (!self->_readOnly)
      goto LABEL_14;
  }
  logForCSLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForQuery because the index is read-only", buf, 2u);
  }

LABEL_14:
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "fileExistsAtPath:isDirectory:", v22, 0);

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v47[5];
    v47[5] = v24;

    v13[2](v13, (void *)v47[5], 0);
  }
LABEL_19:
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int8x16_t v21;
  _QWORD v22[4];
  int8x16_t v23;
  id v24;
  int8x16_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    return;
  }
  v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  v19 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String");
  v20 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String");
  v18 = v8;
  SILogActivity();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_2;
  v22[3] = &unk_24D0EC0D0;
  v26 = a2;
  v21 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v21.i64[0];
  v23 = vextq_s8(v21, v21, 8uLL);
  v24 = *(id *)(a1 + 56);
  v25 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  v10 = (void *)MEMORY[0x2199C2F34](v22);
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 64);
  if (!*(_QWORD *)(a1 + 56))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", a2, *(_QWORD *)(a1 + 64), MEMORY[0x24BDBD1A8], 0, v10, v18, v19, v20) & 1) != 0)goto LABEL_6;
    goto LABEL_5;
  }
  v27[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", a2, v12, MEMORY[0x24BDBD1A8], v13, v10);

  if ((v14 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
LABEL_6:

}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  const void *v20;

  v8 = a2;
  if (a3 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "index") != *(_QWORD *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 72))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    CFRetain(a5);
    v9 = *(_QWORD *)(a1 + 72);
    v10 = qos_class_self();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_3;
    v16[3] = &unk_24D0EC0A8;
    v20 = a5;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v17 = v11;
    v19 = v12;
    v18 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v9, v10, v16);

  }
}

void __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    _MDStoreOIDArrayGetVectorCount();
    v3 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();

  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t result;

  v6 = (a5 - 1);
  result = SIDeleteCSItems();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;
  return result;
}

uint64_t __92__SPConcreteCoreSpotlightIndexer_deleteItemsForQuery_bundleID_fromClient_completionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[5] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
  return result;
}

- (void)deleteItemsForEnumerator:(id)a3 traceID:(int64_t)a4 bundleID:(id)a5 fromClient:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  SPConcreteCoreSpotlightIndexer *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[16];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (self->_index)
  {
    if (!self->_readOnly)
    {
      objc_msgSend(v12, "nextObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v23 = MEMORY[0x24BDAC760];
        v24 = 3221225472;
        v25 = __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke;
        v26 = &unk_24D0EC170;
        v31 = v15;
        v27 = self;
        v28 = v12;
        v32 = a4;
        v17 = v13;
        v29 = v17;
        v18 = v14;
        v30 = v18;
        v19 = (void *)MEMORY[0x2199C2F34](&v23);
        -[SPConcreteCoreSpotlightIndexer deleteItemsForQuery:bundleID:fromClient:completionHandler:](self, "deleteItemsForQuery:bundleID:fromClient:completionHandler:", v16, v17, v18, v19, v23, v24, v25, v26, v27);

      }
      else
      {
        -[SPConcreteCoreSpotlightIndexer dataclass](self, "dataclass");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        SDTraceAdd(3, CFSTR("deleteItemsForEnumerator complete"), a4, v22, v13, 0.0);

        if (v15)
          (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
      }
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  logForCSLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForEnumerator because index is null", buf, 2u);
  }

  if (self->_readOnly)
  {
LABEL_8:
    logForCSLogCategoryDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v21, OS_LOG_TYPE_DEFAULT, "Cannot delete in deleteItemsForEnumerator because index is read-only", buf, 2u);
    }

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v16);
LABEL_13:

  }
}

void __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = sIndexQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke_2;
    v10[3] = &unk_24D0EC148;
    v6 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 72);
    v11 = v7;
    v15 = v8;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    _setup_block(v10, 0, 8850);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v9);

  }
}

uint64_t __105__SPConcreteCoreSpotlightIndexer_deleteItemsForEnumerator_traceID_bundleID_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteItemsForEnumerator:traceID:bundleID:fromClient:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 forBundleID:(id)a4 fromClient:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSString *dataclass;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  logForCSLogCategoryIndex();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138413058;
    v29 = v13;
    v30 = 2112;
    v31 = dataclass;
    v32 = 2048;
    v33 = objc_msgSend(v12, "count");
    v34 = 2048;
    v35 = a6;
    _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "deleteSearchableItemsWithDomainIdentifiers, bundleID:%@, protectionClass:%@, domainIdentifiers:%lu, reason:%lu", buf, 0x2Au);
  }

  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithDomainIdentifiers:forBundleID:fromClient:reason:completionHandler:].cold.1();

  if (objc_msgSend(v13, "length"))
  {
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logWithBundleID:indexOperation:itemCount:code:", v13, 2, objc_msgSend(v12, "count"), a6);

      v20 = sIndexQueue;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke;
      v23[3] = &unk_24D0EC2A8;
      v23[4] = self;
      v27 = v15;
      v24 = v13;
      v25 = v12;
      v26 = v14;
      _setup_block(v23, 0, 8991);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v20, v21);

    }
    else if (v15)
    {
      (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v22);

  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  id location;

  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 128) && !*(_BYTE *)(v2 + 24))
  {
    location = 0;
    objc_initWeak(&location, (id)v2);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(v7 + 128);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2;
    v12[3] = &unk_24D0EC280;
    v12[4] = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v17[1] = v9;
    objc_copyWeak(v17, &location);
    v10 = (void (**)(void))MEMORY[0x2199C2F34](v12);
    v10[2]();

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

    v6 = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v20 = SDTraceAdd(3, CFSTR("DeleteDomainIdentifiers start"), -1, *(void **)(*(_QWORD *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  v21 = a1;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v24 = v2;
  v25 = v3;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_msgSend(v25, "count");
  if (v4 >= 1)
  {
    v5 = 0;
    v22 = *MEMORY[0x24BDC1BF8];
    v23 = v4;
    do
    {
      v27 = v5;
      objc_msgSend(v25, "subarrayWithRange:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      v29 = v6;
      v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      if (objc_msgSend(v29, "count"))
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("%@ = %@ && FieldMatch(%@, "), CFSTR("_kMDItemBundleID"), v28, v22);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v8 = v29;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v36;
          v11 = 1;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v36 != v10)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((v11 & 1) == 0)
                objc_msgSend(v7, "appendString:", CFSTR(", "));
              objc_msgSend(v7, "appendFormat:", CFSTR("\"%@\"), v13);
              objc_msgSend(v7, "appendFormat:", CFSTR(", \"%@.*\"), v13);
              v11 = 0;
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            v11 = 0;
          }
          while (v9);
        }

        objc_msgSend(v7, "appendString:", CFSTR(")"));
      }

      objc_msgSend(v26, "addObject:", v7);
      v5 = v27 + 64;
    }
    while (v27 + 64 < v23);
  }

  objc_msgSend(v26, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v21 + 32);
  v15 = *(_QWORD *)(v21 + 40);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3;
  v30[3] = &unk_24D0EC258;
  v17 = *(_QWORD *)(v21 + 56);
  v33 = *(id *)(v21 + 64);
  v18 = *(id *)(v21 + 40);
  v19 = *(void **)(v21 + 80);
  v31 = v18;
  v34[1] = v19;
  objc_copyWeak(v34, (id *)(v21 + 72));
  v32 = *(_QWORD *)(v21 + 32);
  objc_msgSend(v16, "deleteItemsForEnumerator:traceID:bundleID:fromClient:completionHandler:", v14, v20, v15, v17, v30);
  objc_destroyWeak(v34);

}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (v3)
  {
LABEL_2:
    v4 = v3;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (!v5)
    {
      logForCSLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_2;
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_902;
    v8[3] = &unk_24D0EC230;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v8[4] = *(_QWORD *)(a1 + 40);
    SIBackgroundOpBlock(v5, 0, v8);
    objc_destroyWeak(&v9);
  }
  v4 = 0;
LABEL_7:
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);

}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_902(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[8];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = objc_msgSend(WeakRetained, "index");

    if (v6 == a2)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x24BDC2468]);
      objc_msgSend(v9, "setInternal:", 1);
      objc_msgSend(v9, "setLowPriority:", 0);
      v30[0] = *MEMORY[0x24BDC2160];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFetchAttributes:", v10);

      v29 = *MEMORY[0x24BDD0CE0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProtectionClasses:", v11);

      objc_msgSend(v9, "setBundleIDs:", &unk_24D0FD000);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=1"), *MEMORY[0x24BDC21C8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2_905;
      v27[3] = &unk_24D0EC198;
      v14 = v8;
      v28 = v14;
      v15 = (void *)MEMORY[0x2199C2F34](v27);
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_4;
      v23[3] = &unk_24D0EC208;
      v24 = v7;
      v25 = v14;
      v26 = *(_QWORD *)(a1 + 32);
      v17 = v14;
      v18 = v7;
      objc_msgSend(v16, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v12, v9, 0, v15, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      logForCSLogCategoryDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteSearchableItems start", buf, 2u);
      }

      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startQueryTask:", v19);

    }
  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_2_905(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = v5;
    v11 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_906;
    v8[3] = &unk_24D0EB150;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v8);

  }
}

uint64_t __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_906(uint64_t result, _QWORD *a2)
{
  if (*a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_4(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v2 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_5;
  v14[3] = &unk_24D0EC198;
  v15 = a1[4];
  v3 = (void *)MEMORY[0x2199C2F34](v14);
  v7 = v2;
  v8 = 3221225472;
  v9 = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_7;
  v10 = &unk_24D0EC208;
  v11 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v12 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x2199C2F34](&v7);
  objc_msgSend(a1[6], "deleteHasTopHitAppShortcutsWithResultsHandler:completionHandler:", v3, v6, v7, v8, v9, v10);

}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = v5;
    v11 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_6;
    v8[3] = &unk_24D0EB150;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v8);

  }
}

uint64_t __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_6(uint64_t result, _QWORD *a2)
{
  if (*a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_8;
  v6[3] = &unk_24D0EC1C0;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v5 = v2;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v5, 0, 0, *MEMORY[0x24BDD0CE0], CFSTR("com.apple.application"), 0, &__block_literal_global_909);

  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] void flag for %@", buf, 0xCu);
    }

    v8 = *MEMORY[0x24BDC1DC8];
    v9 = *MEMORY[0x24BDBD430];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2480]), "initWithAttributes:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v3, 0, v6);
    objc_msgSend(v7, "setBundleID:", CFSTR("com.apple.application"));
    objc_msgSend(v7, "setIsUpdate:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_908(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_908_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteSearchableItems complete", v5, 2u);
  }

}

- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithPersonaIds:completionHandler:].cold.1();

  v9 = sIndexQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke;
  v13[3] = &unk_24D0EC008;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v10 = v6;
  v11 = v7;
  _setup_block(v13, 0, 9069);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, v12);

}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  objc_msgSend(a1[4], "readyIndex:", 0);
  v2 = a1[4];
  if (v2[16] && !*((_BYTE *)v2 + 24))
  {
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2;
    v16[3] = &unk_24D0EB758;
    v16[4] = v2;
    v17 = a1[5];
    v18 = a1[6];
    v8 = (void *)MEMORY[0x2199C2F34](v16);
    v9 = *((_QWORD *)a1[4] + 16);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_3;
    v13[3] = &unk_24D0EC2F8;
    v10 = a1[6];
    v13[4] = a1[4];
    v14 = v10;
    v15 = v8;
    v11 = v8;
    SISynchedOpWithBlock(v9, 2, v13);

  }
  else if (a1[6])
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

    v6 = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v6;
    (*((void (**)(void))a1[6] + 2))();

  }
}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v16 = SDTraceAdd(3, CFSTR("DeletePersonas start"), -1, *(void **)(*(_QWORD *)(a1 + 32) + 168), 0, 0.0);
  v17 = a1;
  v19 = *(id *)(a1 + 40);
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2 = objc_msgSend(v19, "count");
  if (v2 >= 1)
  {
    v3 = v2;
    v4 = 0;
    v18 = v2;
    do
    {
      if (v3 - v4 >= 64)
        v5 = 64;
      else
        v5 = v3 - v4;
      objc_msgSend(v19, "subarrayWithRange:", v4, v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      if (objc_msgSend(v6, "count"))
      {
        v22 = v4;
        objc_msgSend(v7, "appendFormat:", CFSTR("FieldMatch(_kMDItemPersonaID, "));
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = v6;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          v12 = 1;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
              if ((v12 & 1) == 0)
                objc_msgSend(v7, "appendString:", CFSTR(", "));
              objc_msgSend(v7, "appendFormat:", CFSTR("\"%@\"), v14);
              objc_msgSend(v7, "appendFormat:", CFSTR(", \"%@.*\"), v14);
              v12 = 0;
              ++v13;
            }
            while (v10 != v13);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            v12 = 0;
          }
          while (v10);
        }

        objc_msgSend(v7, "appendString:", CFSTR(")"));
        v3 = v18;
        v6 = v21;
        v4 = v22;
      }

      objc_msgSend(v20, "addObject:", v7);
      v4 += 64;
    }
    while (v4 < v3);
  }

  objc_msgSend(v20, "objectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v17 + 32), "deleteItemsForEnumerator:traceID:bundleID:fromClient:completionHandler:", v15, v16, 0, 0, *(_QWORD *)(v17 + 48));

}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v4 = sIndexQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_4;
  v7[3] = &unk_24D0EC2D0;
  v10 = a3;
  v5 = *(id *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  _setup_block(v7, 0, 9067);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v6);

}

void __88__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 56)
    || (objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0), v3 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v3 + 128))
    || *(_BYTE *)(v3 + 24))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer deleteSearchableItemsWithFileProviderDomains:completionHandler:].cold.1();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke;
  v14[3] = &unk_24D0EC008;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = (void *)MEMORY[0x2199C2F34](v14);
  v12 = sIndexQueue;
  _setup_block(v11, 0, 9173);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v12, v13);

}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 128) || *(_BYTE *)(v2 + 24) || *(_BYTE *)(v2 + 97))
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v4 + 128);
      v6 = *(unsigned __int8 *)(v4 + 24);
      LODWORD(v4) = *(unsigned __int8 *)(v4 + 97);
      *(_DWORD *)buf = 134218496;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v27 = 1024;
      v28 = v4;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "deleteSearchableItemsWithFileProviderDomains failed: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

      v10 = 0;
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else if (objc_msgSend((id)v2, "denyOperationOnAssertedIndex:", "deleteSearchableItemsWithFileProviderDomains"))
  {
    v11 = *MEMORY[0x24BDC1950];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v19 = v12;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, -1000, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

      v12 = v19;
    }

  }
  else
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_913;
    v20[3] = &unk_24D0EAF08;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v22 = v16;
    v20[4] = v17;
    v21 = v18;
    SISynchedOpWithBlock(v15, 2, v20);

  }
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_913(uint64_t a1, uint64_t a2, char a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2;
  v10[3] = &unk_24D0EC348;
  v13 = a3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v4;
  v10[4] = v5;
  v11 = v6;
  v7 = (void *)MEMORY[0x2199C2F34](v10);
  v8 = sIndexQueue;
  _setup_block(v7, 0, 9170);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v9);

}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56)
    || (objc_msgSend(*(id *)(a1 + 32), "readyIndex:", 0), v3 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v3 + 128))
    || *(_BYTE *)(v3 + 24))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    }
  }
  else
  {
    v20 = SDTraceAdd(3, CFSTR("DeleteFileProviderDomains start"), -1, *(void **)(v3 + 168), 0, 0.0);
    v24 = (id)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = a1;
    obj = *(id *)(a1 + 40);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v30;
      v7 = *MEMORY[0x24BDC1AE8];
      v8 = *MEMORY[0x24BDC1D70];
      v9 = *MEMORY[0x24BDC1BF8];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("((%@==\"%@\")&&(%@==\"%@\")&&(%@==\"%@\"))"), v7, v12, v8, v13, v9, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v15);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v5);
    }

    objc_msgSend(v24, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v21 + 32);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3;
    v25[3] = &unk_24D0EC320;
    v28 = *(id *)(v21 + 48);
    v18 = *(id *)(v21 + 40);
    v19 = *(_QWORD *)(v21 + 32);
    v26 = v18;
    v27 = v19;
    objc_msgSend(v17, "deleteItemsForEnumerator:traceID:bundleID:fromClient:completionHandler:", v16, v20, 0, CFSTR("com.apple.searchd"), v25);

  }
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v25 = 0;
    v29 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v5)
    {
      v6 = v5;
      v28 = *(_QWORD *)v34;
      v27 = *MEMORY[0x24BDBD430];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v25);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("com.apple.FileProvider"), "stringByAppendingPathComponent:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "_stateInfoAttributeNameWithClientStateName:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_alloc(MEMORY[0x24BDC2480]);
          v37 = v14;
          v38 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithAttributes:", v16);

          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v9, 0, v17);
          objc_msgSend(v18, "setIsUpdate:", 1);
          objc_msgSend(v29, "addObject:", v18);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v6);
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
    if (v19)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_920;
      v30[3] = &unk_24D0EAF08;
      v20 = *(id *)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 40);
      v32 = v20;
      v30[4] = v21;
      v31 = v29;
      SIBackgroundOpBlock(v19, 0, v30);

      v22 = v32;
    }
    else
    {
      logForCSLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3_cold_1();

      v24 = *(_QWORD *)(a1 + 48);
      if (!v24)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v22);
    }

LABEL_18:
    v3 = v25;
    goto LABEL_19;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
LABEL_19:

}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_920(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (a3)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);

    }
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2_921;
    v7[3] = &unk_24D0EB898;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:forBundleID:options:completionHandler:", v5, 0, 0, CFSTR("com.apple.searchd"), 0, v7);

  }
}

uint64_t __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2_921(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SPConcreteCoreSpotlightIndexer deleteAllUserActivities:fromClient:completionHandler:].cold.1();

  if (objc_msgSend(v8, "length"))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke;
    v16[3] = &unk_24D0EC058;
    v16[4] = self;
    v19 = v10;
    v17 = v9;
    v18 = v8;
    v12 = (void *)MEMORY[0x2199C2F34](v16);
    v13 = sIndexQueue;
    _setup_block(v12, 0, 9215);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v13, v14);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);

  }
}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void (**v7)(void);
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "readyIndex:", 0);
  v2 = a1[4];
  if (v2[16] && !*((_BYTE *)v2 + 24))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2;
    v9[3] = &unk_24D0EB708;
    v9[4] = v2;
    v10 = a1[5];
    v11 = a1[6];
    v12 = a1[7];
    v7 = (void (**)(void))MEMORY[0x2199C2F34](v9);
    v7[2]();

  }
  else if (a1[7])
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

    v6 = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v6;
    (*((void (**)(void))a1[7] + 2))();

  }
}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "UTF8String");
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  v9 = v2;
  SILogActivity();
  v4 = SDTraceAdd(3, CFSTR("deleteAllUserActivities start"), -1, *(void **)(*(_QWORD *)(a1 + 32) + 168), *(void **)(a1 + 48), 0.0);
  v5 = CFSTR("_kMDItemUserActivityType=\"*\" && _kMDItemUserActivityEligibleForPublicIndexing=\"*\");
  if (objc_msgSend(*(id *)(a1 + 48), "length", v9, v3, v10))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\" && (%@)"), *(_QWORD *)(a1 + 48), CFSTR("_kMDItemUserActivityType=\"*\" && _kMDItemUserActivityEligibleForPublicIndexing=\"*\"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3;
  v11[3] = &unk_24D0EC370;
  v14 = v4;
  v11[4] = v8;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v8, "deleteItemsForQuery:bundleID:fromClient:completionHandler:", v5, v12, v7, v11);

}

void __87__SPConcreteCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  SDTraceAdd(3, CFSTR("deleteAllUserActivities complete"), *(_QWORD *)(a1 + 56), *(void **)(*(_QWORD *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)_scheduleStringsCleanupForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *dataclass;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = dataclass;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling strings cleanup for bundleID:%@, dataclass:%@", buf, 0x16u);
  }

  v7 = sIndexQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke;
  v9[3] = &unk_24D0EA758;
  v9[4] = self;
  _setup_block(v9, 0, 9249);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v8);

}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 27))
  {
    *(_BYTE *)(v1 + 27) = 1;
    v3 = dispatch_time(0, 10000000000);
    dispatch_get_global_queue(9, 2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_2;
    block[3] = &unk_24D0EA758;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, v4, block);

  }
}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, void *, uint64_t, void *);
  void *v6;
  id v7;
  id location;

  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_3;
  v6 = &unk_24D0EC398;
  objc_copyWeak(&v7, &location);
  v2 = (void *)objc_msgSend(&v3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "scheduleMaintenance:description:forDarkWake:", v2, CFSTR("com.apple.searchd.strings.cleanup"), 1, v3, v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__SPConcreteCoreSpotlightIndexer__scheduleStringsCleanupForBundleID___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  _BYTE *WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[27] = 0;
    if (objc_msgSend(WeakRetained, "index") == a2)
    {
      logForCSLogCategoryIndex();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "dataclass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEFAULT, "Running strings cleanup for dataclass:%@", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(v12, "cleanupStringsWithActivity:group:shouldDefer:flags:", v9, v10, a4, 0);
    }
  }

}

- (void)zombifyAllContactItems:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  NSObject *v10;

  v4 = a3;
  dispatch_group_enter(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke;
  v9[3] = &unk_24D0EA9D8;
  v9[4] = self;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199C2F34](v9);
  v7 = sIndexQueue;
  _setup_block(v6, 0, 9299);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v8);

}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, uint64_t, uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = MEMORY[0x24BDAC760];
  v10 = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_2;
  v11 = &unk_24D0EC3C0;
  v2 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v9 = 3221225472;
  v13 = v2;
  v3 = (void *)MEMORY[0x2199C2F34](&v8);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[16];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), *MEMORY[0x24BDC1AE8], CFSTR("com.apple.MobileAddressBook"), v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x24BDC22E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v5, v6, v7, &unk_24D0FD018, v3);

  if ((v4 & 1) == 0)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v9 = a2;
  if (a3 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", _MDStoreOIDArrayGetVectorCount());
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 43200.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_3;
    v20[3] = &unk_24D0EBCC0;
    v13 = v11;
    v21 = v13;
    v14 = v10;
    v22 = v14;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v20);
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v15 + 128) && *(_QWORD *)(v15 + 152))
    {
      v16 = sIndexQueue;
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_4;
      v18[3] = &unk_24D0EA9D8;
      v18[4] = v15;
      v19 = v14;
      _setup_block(v18, 0, 9283);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v16, v17);

    }
  }

}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  void *v4;
  id v5;

  if (*a2)
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setObject:forKey:", *a2, *MEMORY[0x24BDC22E8]);
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDC1D40]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BDC1EC8]);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  if (v1)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_5;
    v2[3] = &unk_24D0EAE40;
    v3 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v1, 0, v2);

  }
}

void __57__SPConcreteCoreSpotlightIndexer_zombifyAllContactItems___block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "clearOutContactItems canceled", v4, 2u);
    }

  }
  else
  {
    SISetCSAttributes();
  }
}

- (void)restartAttachmentImport:(id)a3 maxCount:(unint64_t)a4
{
  NSObject *v6;
  __SI *v7;
  __SI *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  dispatch_group_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __SI *index;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  _BOOL4 v24;
  int64_t v25;
  dispatch_time_t v26;
  NSObject *indexQueue;
  __int16 v28[8];
  _QWORD v29[5];
  NSObject *v30;
  NSObject *v31;
  id *v32;
  _QWORD *v33;
  id v34[2];
  _QWORD v35[4];
  id from[4];
  id location;
  _QWORD block[4];
  NSObject *v39;
  id v40[2];
  _QWORD v41[7];

  v41[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[SPConcreteCoreSpotlightIndexer index](self, "index");
  if (v7 && !self->_readOnly && !self->_suspended)
  {
    v8 = v7;
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer restartAttachmentImport:maxCount:].cold.2();

    objc_msgSend(MEMORY[0x24BE2E230], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("indexing"), *MEMORY[0x24BE2E2A0], 0);

    if ((v11 & 1) != 0)
    {
      logForCSLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer restartAttachmentImport:maxCount:].cold.1();

      v13 = dispatch_group_create();
      location = 0;
      objc_initWeak(&location, self);
      from[0] = 0;
      from[1] = from;
      from[2] = (id)0x2020000000;
      from[3] = 0;
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      v29[0] = MEMORY[0x24BDAC760];
      v35[3] = 0;
      v29[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_938;
      v29[3] = &unk_24D0EC488;
      v29[1] = 3221225472;
      objc_copyWeak(v34, &location);
      v34[1] = v8;
      v32 = from;
      v33 = v35;
      v29[4] = self;
      v14 = v6;
      v30 = v14;
      v15 = v13;
      v31 = v15;
      v16 = (void *)MEMORY[0x2199C2F34](v29);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemRequiresImport==1 && _kMDItemImportHasSandboxExtension==1"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v14);
      index = self->_index;
      v19 = *MEMORY[0x24BDC22E8];
      v41[0] = CFSTR("_kMDItemBundleID");
      v41[1] = v19;
      v20 = *MEMORY[0x24BDC1B90];
      v41[2] = *MEMORY[0x24BDC1BA0];
      v41[3] = v20;
      v41[4] = *MEMORY[0x24BDC1E10];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:", index, v17, v21, 0, a4, v16);

      if (!v22)
      {
        logForCSLogCategoryDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v28[0] = 0;
          _os_log_impl(&dword_213CF1000, v23, OS_LOG_TYPE_INFO, "restartAttachmentImport done (never started)", (uint8_t *)v28, 2u);
        }

        dispatch_group_leave(v14);
      }

      objc_destroyWeak(v34);
      _Block_object_dispose(v35, 8);
      _Block_object_dispose(from, 8);
      objc_destroyWeak(&location);

    }
    else
    {
      v24 = gIsSystemOnBattery == 0;
      from[0] = 0;
      objc_initWeak(from, self);
      dispatch_group_enter(v6);
      if (v24)
        v25 = 0x6FC23B000;
      else
        v25 = 0x45D9648000;
      v26 = dispatch_time(0, v25);
      indexQueue = self->_indexQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke;
      block[3] = &unk_24D0EC3E8;
      objc_copyWeak(v40, from);
      v39 = v6;
      v40[1] = (id)a4;
      dispatch_after(v26, indexQueue, block);

      objc_destroyWeak(v40);
      objc_destroyWeak(from);
    }
  }

}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "restartAttachmentImport:maxCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t VectorCount;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (a3 == 1)
  {
    logForCSLogCategoryDefault();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v62 = v29;
      _os_log_impl(&dword_213CF1000, v28, OS_LOG_TYPE_INFO, "==== Completed restartAttachmentImport query finished) %ld", buf, 0xCu);
    }

    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 256)
    {
      logForCSLogCategoryDefault();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        v62 = v35;
        _os_log_impl(&dword_213CF1000, v34, OS_LOG_TYPE_INFO, "==== Completed restartAttachmentImport query (%ld processed)", buf, 0xCu);
      }

      v36 = sIndexQueue;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_951;
      v39[3] = &unk_24D0EACF8;
      v41 = *(_QWORD *)(a1 + 64);
      v37 = *(NSObject **)(a1 + 48);
      v40 = *(id *)(a1 + 40);
      _setup_block(v39, 0, 9452);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v37, v36, v38);

      v33 = v40;
    }
    else
    {
      v30 = sIndexQueue;
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_950;
      v42[3] = &unk_24D0EABC8;
      v44 = *(_QWORD *)(a1 + 64);
      v42[4] = v11;
      v31 = *(NSObject **)(a1 + 48);
      v43 = *(id *)(a1 + 40);
      _setup_block(v42, 0, 9446);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v31, v30, v32);

      v33 = v43;
    }

  }
  else if (!a3 && objc_msgSend(WeakRetained, "index") == *(_QWORD *)(a1 + 80))
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v62 = a4;
      _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_INFO, "==== restartAttachmentImport query results %ld", buf, 0xCu);
    }

    VectorCount = _MDStoreOIDArrayGetVectorCount();
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_939;
    v53[3] = &unk_24D0EC410;
    v58 = *(_QWORD *)(a1 + 56);
    v19 = v14;
    v54 = v19;
    v20 = v15;
    v55 = v20;
    v21 = v16;
    v56 = v21;
    v22 = v17;
    v23 = *(_QWORD *)(a1 + 64);
    v57 = v22;
    v59 = v23;
    v60 = VectorCount;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 5, 0, v53);
    v24 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v24 + 128) && *(_QWORD *)(v24 + 152))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v25 = sIndexQueue;
      v45[0] = v18;
      v45[1] = 3221225472;
      v45[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_940;
      v45[3] = &unk_24D0EC460;
      v26 = *(void **)(a1 + 40);
      v45[4] = *(_QWORD *)(a1 + 32);
      v46 = v26;
      v47 = v19;
      v48 = v20;
      v49 = v21;
      v50 = v22;
      v51 = v11;
      v52 = *(id *)(a1 + 48);
      _setup_block(v45, 0, 9437);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v25, v27);

    }
  }

}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_939(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (*(_QWORD *)a2 && *(_QWORD *)(a2 + 8) && *(_QWORD *)(a2 + 16) && *(_QWORD *)(a2 + 24) && *(_QWORD *)(a2 + 32))
  {
    v4 = *(id *)a2;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));

      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v4);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v4);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v4);
      v6 = (void *)v9;
      v7 = (void *)v10;
      v8 = (void *)v11;
    }
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a2 + 8));
    v12 = *(id *)(a2 + 16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    objc_msgSend(v6, "addObject:", v12);
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a2 + 24));
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a2 + 32));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(a2 + 8);
      v16 = *(_QWORD *)(a2 + 24);
      v17 = *(_QWORD *)(a2 + 32);
      v18 = 138413058;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_debug_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEBUG, "~~ restartAttachmentImport id:%@ url:%@ uti:%@ se:%@", (uint8_t *)&v18, 0x2Au);
    }

  }
  else
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_939_cold_1();
  }

}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_940(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_2;
    v6[3] = &unk_24D0EC438;
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    v3 = *(id *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    v5 = *(void **)(a1 + 88);
    v11 = v3;
    v12 = v4;
    v13 = v5;
    SIBackgroundOpBlock(v2, 0, v6);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "==== restartAttachmentImport canceled", buf, 2u);
    }
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      obj = v4;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          logForCSLogCategoryDefault();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v10;
            _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_INFO, "==== restartAttachmentImport import! items %@", buf, 0xCu);
          }

          LOBYTE(v15) = 0;
          objc_msgSend(*(id *)(a1 + 72), "processImportForBundleID:withURLs:contentTypes:sandboxExtensions:andIdentifiers:options:inGroup:additionalAttributes:computeUpdaterAttributesAfterImport:", v9, v11, v12, v13, v10, 0x8000, *(_QWORD *)(a1 + 80), &unk_24D0FD310, v15);

        }
        v4 = obj;
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v6);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_950(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "==== restartAttachmentImport (recursive!) %ld", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "restartAttachmentImport:maxCount:", *(_QWORD *)(a1 + 40), 256);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_951(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "==== Done restarting importers (%ld processed)", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)removeSandboxExtensions:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  __SI *index;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  SPConcreteCoreSpotlightIndexer *v18;
  NSObject *v19;
  uint8_t buf[8];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "==== removeSandboxExtensions enter", buf, 2u);
  }

  dispatch_group_enter(v4);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke;
  v17 = &unk_24D0EC3C0;
  v18 = self;
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x2199C2F34](&v14);
  index = self->_index;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemRequiresImport==1 && _kMDItemImportHasSandboxExtension==1"), v14, v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDC22E8];
  v21[0] = CFSTR("_kMDItemBundleID");
  v21[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:resultsHandler:", index, v9, v11, v7);

  if (!v12)
  {
    logForCSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "removeSandboxExtensions done", buf, 2u);
    }

    dispatch_group_leave(v6);
  }

}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  uint64_t VectorCount;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[8];
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;

  v9 = a2;
  if (a3 == 1)
  {
    logForCSLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_INFO, "removeSandboxExtensions done", v19, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3)
  {
    VectorCount = _MDStoreOIDArrayGetVectorCount();
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_2;
    v23[3] = &unk_24D0EC4B0;
    v13 = v11;
    v24 = v13;
    v25 = VectorCount;
    objc_msgSend(a6, "enumerateQueryResults:stringCache:usingBlock:", 2, 0, v23);
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 128) && *(_QWORD *)(v14 + 152))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v15 = sIndexQueue;
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_3;
      v20[3] = &unk_24D0EA8C0;
      v16 = *(void **)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v16;
      v22 = v13;
      _setup_block(v20, 0, 9527);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v17);

    }
  }

}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  if (*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
    }
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKey:", a2[1], *MEMORY[0x24BDC22E8]);
    v5 = *MEMORY[0x24BDBD430];
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDBD430], *MEMORY[0x24BDC1E10]);
    objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BDC1E08]);
    objc_msgSend(v6, "addObject:", v4);

  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  id v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  if (v1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_4;
    v3[3] = &unk_24D0EBA28;
    v4 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    SIBackgroundOpBlock(v1, 0, v3);

  }
}

void __58__SPConcreteCoreSpotlightIndexer_removeSandboxExtensions___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "removeSandboxExtensions canceled", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v16;
      *(_QWORD *)&v7 = 138412546;
      v14 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11, v14, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          logForCSLogCategoryDefault();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            v21 = 2112;
            v22 = v12;
            _os_log_debug_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEBUG, "removeSandboxExtensions %@ %@", buf, 0x16u);
          }

          SISetCSAttributes();
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v8);
    }

  }
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 fromClient:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *v13;
  NSString *dataclass;
  const char *v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  char v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char v35;
  uint64_t v36;
  NSObject *group;
  _QWORD v38[5];
  id v39;
  void (**v40)(id, void *);
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[4];
  id v46;
  NSObject *v47;
  SPConcreteCoreSpotlightIndexer *v48;
  _BYTE *v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  SPConcreteCoreSpotlightIndexer *v53;
  NSObject *v54;
  id v55;
  _BYTE *v56;
  char v57;
  _QWORD v58[3];
  char v59;
  _QWORD v60[3];
  char v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v7 = a5;
  v66 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  logForCSLogCategoryIndex();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    v15 = "NO";
    *(_DWORD *)buf = 138412802;
    if (v7)
      v15 = "YES";
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = dataclass;
    *(_WORD *)&buf[22] = 2080;
    v63 = (uint64_t (*)(uint64_t, uint64_t))v15;
    _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_DEFAULT, "deleteAllSearchableItemsForBundleID, bundleID:%@, protectionClass:%@, shouldGC:%s", buf, 0x20u);
  }

  if (self->_readOnly)
  {
    logForCSLogCategoryIndex();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "Cannot delete items because the index is read-only. dataclass:%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v18);

  }
  else if (self->_hasAssertion)
  {
    logForCSLogCategoryIndex();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_INFO, "Cannot deleteAllSearchableItemsForBundleID on asserted index when device is locked. dataclass:%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v12[2](v12, v21);

  }
  else
  {
    v22 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.spotlight.contacts"));
    v36 = SDTraceAdd(3, CFSTR("DeleteAll start"), -1, self->_dataclass, v10, 0.0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v63 = __Block_byref_object_copy_;
    v64 = __Block_byref_object_dispose_;
    v65 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v61 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v59 = 0;
    group = dispatch_group_create();
    v23 = v7 & ~v22;
    v35 = v23;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
    {
      v24 = MEMORY[0x24BDAC760];
      -[SPConcreteCoreSpotlightIndexer zombifyAllContactItems:](self, "zombifyAllContactItems:", group);
    }
    else
    {
      v25 = sIndexQueue;
      v24 = MEMORY[0x24BDAC760];
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke;
      v51[3] = &unk_24D0EC570;
      v52 = v10;
      v53 = self;
      v56 = buf;
      v26 = group;
      v54 = v26;
      v55 = v11;
      v57 = v23;
      _setup_block(v51, 0, 9676);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_async(v26, v25, v27);

    }
    v28 = dispatch_group_create();
    dispatch_group_enter(v28);
    v29 = sIndexQueue;
    v45[0] = v24;
    v45[1] = 3221225472;
    v45[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_967;
    v45[3] = &unk_24D0EC598;
    v49 = buf;
    v50 = v60;
    v30 = v10;
    v46 = v30;
    v31 = v28;
    v47 = v31;
    v48 = self;
    _setup_block(v45, 0, 9716);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(group, v29, v32);

    v33 = sIndexQueue;
    v38[0] = v24;
    v38[1] = 3221225472;
    v38[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_969;
    v38[3] = &unk_24D0EC608;
    v43 = v36;
    v38[4] = self;
    v39 = v30;
    v41 = buf;
    v40 = v12;
    v42 = v58;
    v44 = v35;
    _setup_block(v38, 0, 9775);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v31, v33, v34);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id obj;
  char v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    logForCSLogCategoryIndex();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "#index wipe, dataclass:%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "closeIndex");
    objc_msgSend(*(id *)(a1 + 40), "_indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v28);

    if ((v6 & 1) != 0)
    {
      logForCSLogCategoryIndex();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v4;
        _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Removing index at %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v9 + 40);
      objc_msgSend(v8, "removeItemAtPath:error:", v4, &obj);
      objc_storeStrong((id *)(v9 + 40), obj);

      goto LABEL_14;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "readyIndex:", 0);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(v10 + 128);
  if (!v11)
  {
    objc_msgSend((id)v10, "_indexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, buf);

    if ((v16 & 1) == 0)
      return;
    goto LABEL_13;
  }
  if (*(_BYTE *)(v10 + 24))
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
    goto LABEL_14;
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_958;
  v19[3] = &unk_24D0EC548;
  v24 = *(_QWORD *)(a1 + 64);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 40);
  v20 = v12;
  v21 = v13;
  v22 = *(id *)(a1 + 56);
  v26 = *(_BYTE *)(a1 + 72);
  v23 = *(id *)(a1 + 32);
  v25 = v11;
  SISynchedOpWithBlock(v11, 3, v19);

  v4 = v20;
LABEL_14:

}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_958(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2;
    v13[3] = &unk_24D0EC548;
    v18 = *(_QWORD *)(a1 + 64);
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v14 = v8;
    v15 = v9;
    v16 = v10;
    v20 = *(_BYTE *)(a1 + 80);
    v11 = *(id *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 72);
    v17 = v11;
    v19 = v12;
    SIBackgroundOpBlock(a2, 0, v13);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  int v17;
  NSObject *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int8x16_t v29;
  _QWORD v30[4];
  int8x16_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t v36[4];
  char *v37;
  uint8_t buf[4104];
  uint64_t v39;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v0;
  v39 = *MEMORY[0x24BDAC8D0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    dispatch_group_leave(*(dispatch_group_t *)(v2 + 32));
  }
  else
  {
    v7 = v1;
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 40) + 168), "UTF8String");
    v9 = objc_msgSend(objc_retainAutorelease(*(id *)(v2 + 48)), "UTF8String");
    v27 = *(unsigned __int8 *)(v2 + 80);
    v28 = objc_msgSend(objc_retainAutorelease(*(id *)(v2 + 56)), "UTF8String");
    SILogActivity();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3;
    v30[3] = &unk_24D0EC500;
    v34 = *(_QWORD *)(v2 + 72);
    v29 = *(int8x16_t *)(v2 + 32);
    v10 = (id)v29.i64[0];
    v31 = vextq_s8(v29, v29, 8uLL);
    v11 = *(id *)(v2 + 56);
    v12 = *(_QWORD *)(v2 + 64);
    v32 = v11;
    v33 = v12;
    v13 = (void *)MEMORY[0x2199C2F34](v30);
    v14 = *(void **)(v2 + 56);
    if (v14
      && ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobilemail"), v8, v9, v27, v28) & 1) != 0
       || objc_msgSend(*(id *)(v2 + 56), "isEqualToString:", CFSTR("com.apple.mail"))))
    {
      logForCSLogCategoryIndex();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_DEFAULT, "Attempting text store deletion by predicate", buf, 2u);
      }

      bzero(buf, 0x1000uLL);
      if (objc_msgSend(*(id *)(v2 + 56), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 0, 0, 4, 0, 0, objc_msgSend(*(id *)(v2 + 56), "length"), 0))
      {
        v16 = si_text_store_delete_by_predicate();
        if (v16)
        {
          v17 = v16;
          logForCSLogCategoryIndex();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = strerror(-v17);
            *(_DWORD *)v36 = 136315138;
            v37 = v19;
            _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_DEFAULT, "*warn* si_text_store_delete_by_predicate: %s", v36, 0xCu);
          }

        }
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_kMDItemBundleID = \"%@\"), *(_QWORD *)(v2 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(v2 + 40);
    v35 = *(_QWORD *)(v2 + 56);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", v7, v20, 0, v22, v13);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      dispatch_group_leave(*(dispatch_group_t *)(v2 + 32));
    }

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  const void *v17;

  v8 = a2;
  if (a3 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "index") != *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a3 && objc_msgSend(*(id *)(a1 + 32), "index") == *(_QWORD *)(a1 + 64))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    CFRetain(a5);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = qos_class_self();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_4;
    v14[3] = &unk_24D0EC4D8;
    v17 = a5;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    SIBackgroundOpBlock(v9, v10, v14);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a2 && !a3)
  {
    _MDStoreOIDArrayGetVectorCount();
    v4 = *(id *)(a1 + 32);
    _MDStoreOIDArrayApplyBlock();

  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_5()
{
  return SIDeleteCSItems();
}

BOOL __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_962(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 32) == HIDWORD(a2);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_967(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  char v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0),
        v2 = objc_claimAutoreleasedReturnValue(),
        v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        v4 = *(void **)(v3 + 40),
        *(_QWORD *)(v3 + 40) = v2,
        v4,
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    || !objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "readyIndex:", 0);
  v5 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v5 + 128))
  {
    if (!*(_BYTE *)(v5 + 24))
    {
      SIDeleteCSClientStateCache();
      v6 = *(void **)(a1 + 48);
      v19[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_968;
      v15[3] = &unk_24D0EB7A8;
      v17 = *(_QWORD *)(a1 + 56);
      v16 = *(id *)(a1 + 40);
      v8 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v6, "_backgroundDeleteItems:bundleID:completionHandler:", v7, CFSTR("com.apple.searchd"), v8);

      return;
    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 48), "_indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, &v18);

  if ((v11 & 1) != 0)
  {

LABEL_11:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    return;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_968(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_969(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  SDTraceAdd(3, CFSTR("DeleteAll complete"), *(_QWORD *)(a1 + 72), *(void **)(*(_QWORD *)(a1 + 32) + 168), *(void **)(a1 + 40), 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {
    if (v2)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_972;
      v8[3] = &unk_24D0EC5E0;
      v8[4] = *(_QWORD *)(a1 + 32);
      v8[5] = v2;
      SIBackgroundOpBlock(v2, 0, v8);
    }
    else
    {
      logForCSLogCategoryDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_969_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 80))
      return objc_msgSend(*(id *)(a1 + 32), "_scheduleStringsCleanupForBundleID:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_972(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (!a3)
  {
    v22 = v6;
    v23 = v5;
    v24 = v3;
    v25 = v4;
    if (*(_QWORD *)(a1 + 40) == a2)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_973;
      v20[3] = &unk_24D0EC198;
      v10 = v8;
      v21 = v10;
      v11 = (void *)MEMORY[0x2199C2F34](v20);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_975;
      v17[3] = &unk_24D0EBD30;
      v12 = *(_QWORD *)(a1 + 32);
      v18 = v10;
      v19 = v12;
      v13 = v10;
      v14 = (void *)MEMORY[0x2199C2F34](v17);
      logForCSLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] deleteAllSearchableItems start", v16, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "deleteHasTopHitAppShortcutsWithResultsHandler:completionHandler:", v11, v14);
    }
  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_973(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = v5;
    v11 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_974;
    v8[3] = &unk_24D0EB150;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v8);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_974(uint64_t a1, id *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  if (v3)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "[TopHitAppShortcuts] void flag for %@", buf, 0xCu);
    }

    v8 = *MEMORY[0x24BDC1DC8];
    v9 = *MEMORY[0x24BDBD430];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2480]), "initWithAttributes:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v3, 0, v6);
    objc_msgSend(v7, "setBundleID:", CFSTR("com.apple.application"));
    objc_msgSend(v7, "setIsUpdate:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_975(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0, *MEMORY[0x24BDD0CE0], CFSTR("com.apple.application"), 0, &__block_literal_global_977, v5);

  }
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_976(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_976_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "[TopHitAppShortcuts] deleteAllSearchableItems complete", v5, 2u);
  }

}

void __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_981(uint64_t a1, void *a2, int a3)
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[3];

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v12);

    }
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __101__SPConcreteCoreSpotlightIndexer__deleteSearchableItemsMatchingQuery_forBundleIds_completionHandler___block_invoke_2;
    v13[3] = &unk_24D0EC630;
    objc_copyWeak(v15, (id *)(a1 + 64));
    v15[1] = a2;
    v6 = *(id *)(a1 + 56);
    v7 = *(void **)(a1 + 72);
    v14 = v6;
    v15[2] = v7;
    v8 = (void *)MEMORY[0x2199C2F34](v13);
    v11 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    SILogActivity();
    if ((objc_msgSend(*(id *)(a1 + 32), "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:resultsHandler:", a2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), v8, v11) & 1) == 0)
    {
      v9 = *(_QWORD *)(a1 + 56);
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      }
    }

    objc_destroyWeak(v15);
  }
}

- (void)deleteSearchableItemsSinceDate:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("_kMDItemBundleID = \"%@\" && kMDItemCreationDate>=$time.absolute(%f)"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPConcreteCoreSpotlightIndexer _deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:](self, "_deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:", v12, v13, v9);
}

- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("_kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\" && kMDItemContentCreationDate<$time.absolute(%f)"), *(_QWORD *)&a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SPConcreteCoreSpotlightIndexer _deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:](self, "_deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:", v8, 0, v7);

}

- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("_kMDItemUserActivityType=* && kMDItemContentType=\"com.apple.siri.*\" && FieldMatch(kMDItemIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "appendFormat:", CFSTR(", \"%@\"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "appendString:", CFSTR(")"));
    -[SPConcreteCoreSpotlightIndexer _deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:](self, "_deleteSearchableItemsMatchingQuery:forBundleIds:completionHandler:", v8, 0, v7);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

  }
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forBundleID:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a4 == 2)
    -[SPConcreteCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", 0, a3, 0, 0, 0, a5, 0, 0, v5, v6);
}

- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, void *);
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD, void *))a8;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v17)
      goto LABEL_5;
  }
  else
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "fetchAttributes"))
    {
      v19 = *MEMORY[0x24BDC1950];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v19, -1000, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2](v17, 0, v20);

      }
      goto LABEL_6;
    }
    v21 = (void *)MEMORY[0x2199C2D78]();
    if (self->_index && objc_msgSend(v14, "length"))
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __103__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completionHandler___block_invoke;
      v23[3] = &unk_24D0EC6D0;
      v17 = v17;
      v24 = v17;
      v22 = (void *)MEMORY[0x2199C2F34](v23);
      if (!SIGetCSAttributes())
      {

        v17 = 0;
      }

    }
    objc_autoreleasePoolPop(v21);
    if (v17)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, v18);
LABEL_6:

    }
  }

}

uint64_t __103__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAttributes:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(int)a7 completion:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a5;
  v16 = a8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __96__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completion___block_invoke;
  v20[3] = &unk_24D0EC6F8;
  v21 = v15;
  v22 = v14;
  v23 = v16;
  v17 = v16;
  v18 = v14;
  v19 = v15;
  -[SPConcreteCoreSpotlightIndexer fetchAttributes:bundleID:identifiers:userCtx:flags:completionHandler:](self, "fetchAttributes:bundleID:identifiers:userCtx:flags:completionHandler:", v18, a4, v19, a6, v9, v20);

}

void __96__SPConcreteCoreSpotlightIndexer_fetchAttributes_bundleID_identifiers_userCtx_flags_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = 0;
  if (a2 && !a3)
  {
    v4 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    v12 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (objc_msgSend(v4, "count") - 1 == v5)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v5);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 40), "count");
        if (v5)
        {
          v7 = v6;
          v8 = 0;
          do
          {
            v9 = v8 + 1;
            objc_msgSend(v4, "objectAtIndexedSubscript:", v8 + 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v7 == objc_msgSend(v10, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);

            }
            v8 = v9;
          }
          while (v5 != v9);
        }
      }
      else
      {
        v12 = 0;
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)attributesForBundleId:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(id, _QWORD);
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "Fetching all the attributes for identifier:%@, bundleID:%@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v12 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v11 = (void (**)(id, _QWORD))v9;
    if (SIGetCSAttributes())
      v11[2](v11, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __78__SPConcreteCoreSpotlightIndexer_attributesForBundleId_identifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (!a2 || (v3 = _MDPlistBytesCopyPlistAtIndex()) == 0)
  {
    v7 = 0;
LABEL_10:
    v4 = 0;
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_12;
  }
  v7 = (id)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)objc_msgSend(v7, "count") < 2)
    goto LABEL_10;
  objc_msgSend(v7, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v4, "count"))
    goto LABEL_11;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

LABEL_12:
}

- (void)powerStateChanged
{
  NSObject *v3;
  void *v4;
  NSObject *group;

  if (!gIsSystemOnBattery)
  {
    group = dispatch_group_create();
    -[SPConcreteCoreSpotlightIndexer revokeExpiredItems:](self, "revokeExpiredItems:", group);
    v3 = sIndexQueue;
    _setup_block(&__block_literal_global_1010, 0, 10117);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(group, v3, v4);

  }
}

void __51__SPConcreteCoreSpotlightIndexer_powerStateChanged__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryIndex();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "Revoke completed.", v1, 2u);
  }

}

- (BOOL)_shouldNotifyForSearchableItemUpdates:(id)a3
{
  id v3;
  char v4;
  char v5;
  int v6;
  char v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    v4 = _os_feature_enabled_impl();
  else
    v4 = 0;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    v5 = _os_feature_enabled_impl();
  else
    v5 = 0;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.usernotificationsd"));
  if (v6)
    LOBYTE(v6) = _os_feature_enabled_impl();
  if ((v4 & 1) != 0)
    v7 = 1;
  else
    v7 = v5 | v6;

  return v7;
}

- (BOOL)_startInternalQueryWithIndex:(__SI *)a3 query:(id)a4 fetchAttributes:(id)a5 resultsHandler:(id)a6
{
  return -[SPConcreteCoreSpotlightIndexer _startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:](self, "_startInternalQueryWithIndex:query:fetchAttributes:forBundleIds:maxCount:resultsHandler:", a3, a4, a5, 0, 0, a6);
}

- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  __SI *index;
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  if (!v7)
    -[SPConcreteCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:].cold.1();
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 1);
  index = self->_index;
  if (index && !self->_suspended)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __92__SPConcreteCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke;
    v11[3] = &unk_24D0EC768;
    v11[4] = self;
    v13 = v8;
    v12 = v6;
    SIBackgroundOpBlock((uint64_t)index, 0, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

void __92__SPConcreteCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (!a3 && objc_msgSend(*(id *)(a1 + 32), "index") == a2)
  {
    if (SIGetAccumulatedStorageSizeForBundleId())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

+ (id)_setOfTokensToCorrect:(id)a3 tokenMatchInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[SPConcreteCoreSpotlightIndexer _lastTokenWithQueryString:tokenMatchInfo:](SPConcreteCoreSpotlightIndexer, "_lastTokenWithQueryString:tokenMatchInfo:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v8 = v7;
  if (v6)
  {
    v19 = v7;
    v22 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObject:", v6);
    objc_msgSend(v10, "addObject:", v6);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v21 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[SPConcreteCoreSpotlightIndexer _spellingCorrectionConditional:isSingleToken:isPreviousTokenCorrected:isLastToken:tokenLength:](SPConcreteCoreSpotlightIndexer, "_spellingCorrectionConditional:isSingleToken:isPreviousTokenCorrected:isLastToken:tokenLength:", objc_msgSend(v16, "intValue"), v22 == 1, v13 & 1, objc_msgSend(v15, "isEqualToString:", v6), objc_msgSend(v15, "length")))
          {
            objc_msgSend(v19, "addObject:", v15);
            v13 = 1;
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    v8 = v19;
    v17 = (id)objc_msgSend(v19, "copy");

  }
  else
  {
    v17 = v7;
  }

  return v17;
}

+ (id)_tokensMaxCountFromMatchInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v3, "count"))
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\"(\\S+)\"cdw"), 1, &v33);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    v25 = v3;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (!v5)
      goto LABEL_19;
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v26 = v4;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v4, "firstMatchInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = objc_msgSend(v10, "rangeAtIndex:", 1);
          objc_msgSend(v9, "substringWithRange:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length"))
          {
            if (objc_msgSend(v14, "characterAtIndex:", objc_msgSend(v14, "length") - 1) != 42)
              goto LABEL_12;
            if (objc_msgSend(v14, "length") != 1)
            {
              objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 1);
              v15 = objc_claimAutoreleasedReturnValue();

              v14 = (void *)v15;
LABEL_12:
              v16 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v27, "objectForKeyedSubscript:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "intValue");

              objc_msgSend(obj, "objectForKeyedSubscript:", v9);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "intValue");

              if ((int)v18 <= (int)v20)
                v21 = v20;
              else
                v21 = v18;
              objc_msgSend(v16, "numberWithInt:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v14);

              v4 = v26;
            }
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (!v6)
      {
LABEL_19:

        v3 = v25;
        break;
      }
    }
  }

  return v27;
}

+ (id)_sharedSynonyms
{
  if (_sharedSynonyms_onceToken != -1)
    dispatch_once(&_sharedSynonyms_onceToken, &__block_literal_global_1018);
  return (id)_sharedSynonyms_synonyms;
}

void __49__SPConcreteCoreSpotlightIndexer__sharedSynonyms__block_invoke()
{
  SDPommesSynonyms *v0;
  void *v1;

  v0 = objc_alloc_init(SDPommesSynonyms);
  v1 = (void *)_sharedSynonyms_synonyms;
  _sharedSynonyms_synonyms = (uint64_t)v0;

}

+ (id)_stringWithRewriteType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("None");
  else
    return off_24D0EDA90[a3 - 1];
}

+ (id)_descriptionWithTokenRewrites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{\n"));
  CSRedactString(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v25 = v7;
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        objc_msgSend(v8, "originalToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CSRedactString(v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("  %@ -->\n"), v10);

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v8, "variations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v16, "variation");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              CSRedactString(v17, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_stringWithRewriteType:", objc_msgSend(v16, "type"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              CSRedactString(v19, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("    %@ (%@)\n"), v18, v20);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v13);
        }

        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  objc_msgSend(v6, "appendString:", CFSTR("}"));
  return v6;
}

+ (BOOL)_spellingCorrectionConditional:(int)a3 isSingleToken:(BOOL)a4 isPreviousTokenCorrected:(BOOL)a5 isLastToken:(BOOL)a6 tokenLength:(unint64_t)a7
{
  BOOL v7;
  BOOL v8;

  v7 = a3 < 3 && a6;
  v8 = v7 & ~(a4 || a5);
  if (a7 <= 3)
    v8 = 0;
  return !a3 || v8;
}

+ (id)_lastTokenWithQueryString:(id)a3 tokenMatchInfo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v5, "length"))
  {
    v7 = objc_msgSend(v5, "length");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v6;
    objc_msgSend(v6, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v23;
      v12 = -1;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(v5, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "rangeOfString:options:range:", v14, 4, 0, v7);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v16 > v12)
          {
            v17 = v14;

            v10 = v17;
            v12 = v16;
          }
          v18 = objc_msgSend(v14, "length") + v16;
          if (v18 >= objc_msgSend(v5, "length"))
            break;
        }
        if (v9 == ++v13)
        {
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v9)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      v10 = 0;
    }

    v6 = v20;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_indexIndependentTokenRewritesWithMatchInfo:(id)a3 queryID:(int64_t)a4 setOfTokensToCorrect:(id)a5
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __107__SPConcreteCoreSpotlightIndexer__indexIndependentTokenRewritesWithMatchInfo_queryID_setOfTokensToCorrect___block_invoke;
  v10[3] = &unk_24D0EC7B0;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v8;
}

void __107__SPConcreteCoreSpotlightIndexer__indexIndependentTokenRewritesWithMatchInfo_queryID_setOfTokensToCorrect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  SDPommesStemWord(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") >= 3)
  {
    v6 = objc_alloc(MEMORY[0x24BE66728]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@*"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1060320051;
    v9 = (void *)objc_msgSend(v6, "initWithVariation:type:confidence:", v7, 3, v8);

    objc_msgSend(v4, "addObject:", v9);
  }
  +[SPConcreteCoreSpotlightIndexer _sharedSynonyms](SPConcreteCoreSpotlightIndexer, "_sharedSynonyms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getSecondPassSynonymsForWord:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
        v18 = objc_alloc(MEMORY[0x24BE66728]);
        LODWORD(v19) = 1050253722;
        v20 = (void *)objc_msgSend(v18, "initWithVariation:type:confidence:", v17, 4, v19);
        objc_msgSend(v4, "addObject:", v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v4, "count"))
  {
    v21 = *(void **)(a1 + 32);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66720]), "initWithOriginalToken:variations:", v3, v4);
    objc_msgSend(v21, "addObject:", v22);

  }
}

+ (id)_getBundleIndexesFrom:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  uint64_t i;
  const char *v10;
  int v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  int v22;
  int v24;
  int v25;
  unint64_t v26;
  int v27;
  unsigned int v28;
  CFStringRef v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v10 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i)), "cStringUsingEncoding:", 4);
        v11 = strlen(v10);
        v12 = v11 + 1;
        if (v11 >= -1)
          v13 = v11 + 1;
        else
          v13 = v11 + 4;
        v14 = &v10[v13 & 0xFFFFFFFC];
        if ((v11 + 4) >= 7)
        {
          v18 = -(v13 >> 2);
          v19 = -1789642873;
          v20 = 718793509;
          v17 = -1759636613;
          do
          {
            v19 = 5 * v19 + 2071795100;
            v20 = 5 * v20 + 1808688022;
            HIDWORD(v21) = v19 * *(_DWORD *)&v14[4 * v18];
            LODWORD(v21) = HIDWORD(v21);
            v22 = (v21 >> 21) * v20;
            HIDWORD(v21) = v17;
            LODWORD(v21) = v17;
            v17 = v22 ^ (5 * (v21 >> 19) + 1390208809);
          }
          while (!__CFADD__(v18++, 1));
          v16 = 5 * v19 + 2071795100;
          v15 = 5 * v20 + 1808688022;
        }
        else
        {
          v15 = 1107688271;
          v16 = 1713515327;
          v17 = -1759636613;
        }
        v24 = 0;
        v25 = v12 & 3;
        if (v25 != 1)
        {
          if (v25 != 2)
          {
            if (v25 != 3)
              goto LABEL_21;
            v24 = *((unsigned __int8 *)v14 + 2) << 16;
          }
          v24 |= *((unsigned __int8 *)v14 + 1) << 8;
        }
        HIDWORD(v26) = (v24 ^ *(unsigned __int8 *)v14) * v16;
        LODWORD(v26) = HIDWORD(v26);
        v27 = (v26 >> 21) * v15;
        HIDWORD(v26) = v17;
        LODWORD(v26) = v17;
        v17 = v27 ^ (5 * (v26 >> 19) + 1390208809);
LABEL_21:
        v28 = -1028477387 * ((-2048144789 * (v17 ^ v12)) ^ ((-2048144789 * (v17 ^ v12)) >> 13));
        v29 = CFStringCreateWithFormat(v8, 0, CFSTR("%d"), v28 & 0x7FFFFFFF ^ HIWORD(v28));
        objc_msgSend(v4, "addObject:", v29);
        CFRelease(v29);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_indexDependentTokenRewritesWithMatchInfo:(id)a3 topK:(id)a4 setOfTokensToCorrect:(id)a5 queryID:(int64_t)a6 bundleIds:(id)a7 clientBundleId:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a8;
  v16 = a3;
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[SPConcreteCoreSpotlightIndexer _indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:].cold.1();

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __135__SPConcreteCoreSpotlightIndexer__indexDependentTokenRewritesWithMatchInfo_topK_setOfTokensToCorrect_queryID_bundleIds_clientBundleId___block_invoke;
  v27[3] = &unk_24D0EC7D8;
  v28 = v13;
  v29 = v14;
  v30 = v12;
  v31 = v15;
  v19 = v18;
  v32 = v19;
  v20 = v15;
  v21 = v12;
  v22 = v14;
  v23 = v13;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v27);

  v24 = v32;
  v25 = v19;

  return v25;
}

void __135__SPConcreteCoreSpotlightIndexer__indexDependentTokenRewritesWithMatchInfo_topK_setOfTokensToCorrect_queryID_bundleIds_clientBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      +[SPConcreteCoreSpotlightIndexer _getBundleIndexesFrom:](SPConcreteCoreSpotlightIndexer, "_getBundleIndexesFrom:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "count"))
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v7);
      else
        v5 = 0;

    }
    v8 = *(void **)(a1 + 56);
    if (v8 && !objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.spotlight")))
      v28 = 0;
    else
      v28 = &unk_24D0FD228;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v5;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v29)
    {
      v27 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(obj);
          v10 = a1;
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v3;
          objc_msgSend(v3, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SDPommesCorrectionsWithTopKAndToken(v11, v13, v28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v31;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v31 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19);
                v21 = objc_alloc(MEMORY[0x24BE66728]);
                LODWORD(v22) = 1057132380;
                v23 = (void *)objc_msgSend(v21, "initWithVariation:type:confidence:", v20, 2, v22);
                objc_msgSend(v4, "addObject:", v23);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v17);
          }

          ++v9;
          v3 = v12;
          a1 = v10;
        }
        while (v9 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v29);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = *(void **)(a1 + 64);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66720]), "initWithOriginalToken:variations:", v3, v4);
    objc_msgSend(v24, "addObject:", v25);

  }
}

- (void)indexDependentTokenRewritesWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 setOfTokensToCorrect:(id)a6 tokenRewritesHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSString *dataclass;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v13, "queryID");
  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    dataclass = self->_dataclass;
    CSRedactString(v12, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = dataclass;
    v30 = 2048;
    v31 = v17;
    v32 = 2112;
    v33 = v24;
    _os_log_debug_impl(&dword_213CF1000, v18, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld rewriteQueryWithQueryString=%@", buf, 0x20u);

  }
  -[SPConcreteCoreSpotlightIndexer index](self, "index");
  v25 = v13;
  v26 = v15;
  v27 = v14;
  v19 = v16;
  v20 = v14;
  v21 = v15;
  v22 = v13;
  SIFetchTopKTerms();

}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[24];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v31 = (id)objc_opt_new();
  if (a2)
  {
    memset(buf, 0, sizeof(buf));
    _MDPlistGetRootPlistObjectFromPlist();
    if (_MDPlistGetPlistObjectType() == 241)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIDs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPConcreteCoreSpotlightIndexer _getBundleIndexesFrom:](SPConcreteCoreSpotlightIndexer, "_getBundleIndexesFrom:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v5;
      v25 = *(id *)(a1 + 40);
      _MDPlistDictionaryIterate();

    }
  }
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    v18 = *(_QWORD *)(a1 + 72);
    v19 = objc_msgSend((id)v27[5], "count");
    v20 = v33[3];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    v37 = v19;
    v38 = 2048;
    v39 = v20;
    _os_log_debug_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld number of topK terms that are inflated in memory from plist: bundleCount=%lu, termCount=%lu", buf, 0x2Au);
  }

  v7 = *(_QWORD *)(a1 + 56);
  v8 = v27[5];
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(*(id *)(a1 + 32), "queryID");
  objc_msgSend(*(id *)(a1 + 32), "bundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPConcreteCoreSpotlightIndexer _indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:](SPConcreteCoreSpotlightIndexer, "_indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:", v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    v22 = *(_QWORD *)(a1 + 72);
    v23 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2048;
    v37 = v23;
    _os_log_debug_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEBUG, "[rewrite][%@] qid=%ld indexDependentTokenRewritesWithQueryString found %lu rewrites", buf, 0x20u);
  }

  (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v13, v15, v16);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  void *v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    v10 = *a4;
    v11 = *((_QWORD *)a4 + 2);
    if (_MDPlistGetPlistObjectType() == 241)
    {
      *(_QWORD *)&v10 = 0;
      *((_QWORD *)&v10 + 1) = &v10;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy_;
      v13 = __Block_byref_object_dispose_;
      v14 = 0;
      v14 = (id)objc_opt_new();
      v9 = *(id *)(a1 + 40);
      v7 = *a4;
      v8 = *((_QWORD *)a4 + 2);
      _MDPlistDictionaryIterate();
      if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 40), "count", v7, v8))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 40), v6);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 40), "count");
      }

      _Block_object_dispose(&v10, 8);
    }
  }

}

void __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  if (a2 && verifyCandidateLength(a3))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_4;
    v11[3] = &unk_24D0EC800;
    v11[4] = &v12;
    v11[5] = a2;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
    if (*((_BYTE *)v13 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", _MDPlistNumberGetIntValue(), *a4, a4[1], a4[2]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    }
    _Block_object_dispose(&v12, 8);
  }
}

BOOL __137__SPConcreteCoreSpotlightIndexer_indexDependentTokenRewritesWithQueryString_context_matchInfo_setOfTokensToCorrect_tokenRewritesHandler___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = isCandidate(*(char **)(a1 + 40), a2);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)transferDeleteJournalsToDirectory:(int)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  __SI *index;
  _BOOL4 suspended;
  _BOOL4 readOnly;
  void *v11;
  uint64_t v12;
  void *v13;
  __SI *v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  int v17;
  uint8_t buf[4];
  __SI *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index || self->_suspended || self->_readOnly)
  {
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      index = self->_index;
      suspended = self->_suspended;
      readOnly = self->_readOnly;
      *(_DWORD *)buf = 134218496;
      v19 = index;
      v20 = 1024;
      v21 = suspended;
      v22 = 1024;
      v23 = readOnly;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "transferDeleteJournalsToDirectory failed: index:%p suspended:%d readOnly:%d", buf, 0x18u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }
  else
  {
    if (!-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "transferDeleteJournalsToDirectory"))
    {
      v14 = self->_index;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke;
      v15[3] = &unk_24D0EC8C8;
      v16 = v6;
      v17 = a3;
      SIBackgroundOpBlock((uint64_t)v14, 0, v15);

      goto LABEL_8;
    }
    v12 = *MEMORY[0x24BDC1950];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -1000, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13);

    }
  }

LABEL_8:
}

void __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v5 = *(id *)(a1 + 32);
    SITransferDeletionJournals();

  }
}

void __86__SPConcreteCoreSpotlightIndexer_transferDeleteJournalsToDirectory_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (id)purgeableIndexTouchFilePath
{
  void *v2;
  void *v3;

  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("purgeableIndexMarker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_createPurgeableTouchFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_53();
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, v2, "Failed to create touch file %@. errno=%d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_11();
}

- (BOOL)_removePurgeableTouchFile
{
  id v2;
  int v3;
  int v4;
  const std::__fs::filesystem::path *v5;
  std::error_code *v6;
  NSObject *v7;

  -[SPConcreteCoreSpotlightIndexer purgeableIndexTouchFilePath](self, "purgeableIndexTouchFilePath");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = open((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0, 438);
  v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    v5 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation");
    if (remove(v5, v6))
    {
      logForCSLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SPConcreteCoreSpotlightIndexer _removePurgeableTouchFile].cold.1();

    }
  }

  return v4 >= 0;
}

- (BOOL)_hasPurgeableTouchFile
{
  void *v2;
  void *v3;
  char v4;

  -[SPConcreteCoreSpotlightIndexer purgeableIndexTouchFilePath](self, "purgeableIndexTouchFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  return v4;
}

- (int64_t)getIndexDirectorySize:(id)a3
{
  id v4;
  DIR *v5;
  NSObject *v6;
  NSObject *v7;
  dirent *v8;
  int64_t i;
  const char *d_name;
  int v11;
  void *v12;
  void *v13;
  off_t st_size;
  NSObject *v15;
  int *v16;
  char *v17;
  stat v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v5 = opendir((const char *)objc_msgSend(v4, "UTF8String"));
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:].cold.2();

    v8 = readdir(v5);
    for (i = 0; v8; v8 = readdir(v5))
    {
      d_name = v8->d_name;
      if (strcmp(v8->d_name, ".") && strcmp(d_name, ".."))
      {
        memset(&v19, 0, sizeof(v19));
        v11 = dirfd(v5);
        if (fstatat(v11, d_name, &v19, 32) < 0)
        {
          logForCSLogCategoryIndex();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = __error();
            v17 = strerror(*v16);
            *(_DWORD *)buf = 136315394;
            v21 = d_name;
            v22 = 2080;
            v23 = v17;
            _os_log_error_impl(&dword_213CF1000, v15, OS_LOG_TYPE_ERROR, "Failed to obtain index file info:%s (%s)", buf, 0x16u);
          }

        }
        else
        {
          if ((v19.st_mode & 0xF000) == 0x4000)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", d_name);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "stringByAppendingPathComponent:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            st_size = -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:](self, "getIndexDirectorySize:", v13);
          }
          else
          {
            st_size = v19.st_size;
          }
          i += st_size;
        }
      }
    }
    closedir(v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:].cold.1();

    i = 0;
  }

  return i;
}

- (BOOL)_shouldPurge
{
  void *v3;
  int64_t v4;

  -[SPConcreteCoreSpotlightIndexer _indexPath](self, "_indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:](self, "getIndexDirectorySize:", v3);

  return v4 > 3221225471;
}

- (void)markAllFilesPurgeable:(id)a3 purgeableOrNot:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DIR *v7;
  NSObject *v8;
  NSObject *v9;
  dirent *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *d_name;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int *v19;
  char *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  int v24;
  int v25;
  _BOOL8 v26;
  SPConcreteCoreSpotlightIndexer *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  int *v32;
  char *v33;
  int *v34;
  char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  stat v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  char *v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(a3);
  v7 = opendir((const char *)objc_msgSend(v6, "UTF8String"));
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SPConcreteCoreSpotlightIndexer markAllFilesPurgeable:purgeableOrNot:].cold.2(v4);

    v10 = readdir(v7);
    if (v10)
    {
      if (v4)
        v11 = 98317;
      else
        v11 = 0;
      v12 = "clear";
      if (v4)
        v12 = "mark";
      v36 = v12;
      v13 = "Cleared";
      if (v4)
        v13 = "Marked";
      v37 = v13;
      v38 = v11;
      while (1)
      {
        d_name = v10->d_name;
        if (!strcmp(v10->d_name, ".") || !strcmp(d_name, ".."))
          goto LABEL_31;
        memset(&v40, 0, sizeof(v40));
        v15 = dirfd(v7);
        if (fstatat(v15, d_name, &v40, 32) < 0)
          break;
        if ((v40.st_mode & 0xF000) != 0x4000)
        {
          v23 = dirfd(v7);
          v24 = openat(v23, d_name, 0x8000);
          if ((v24 & 0x80000000) == 0)
          {
            v25 = v24;
            v26 = v4;
            v27 = self;
            v39 = v38;
            v28 = ffsctl(v24, 0xC0084A44uLL, &v39, 0);
            logForCSLogCategoryIndex();
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v28)
            {
              self = v27;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v31 = v39;
                v32 = __error();
                v33 = strerror(*v32);
                *(_DWORD *)buf = 136315906;
                v42 = v36;
                v43 = 2080;
                v44 = (void *)d_name;
                v45 = 2048;
                v46 = v31;
                self = v27;
                v47 = 2080;
                v48 = v33;
                _os_log_error_impl(&dword_213CF1000, v30, OS_LOG_TYPE_ERROR, "Failed to %s index file purgable:%s flags:0x%llx (%s)", buf, 0x2Au);
              }
            }
            else
            {
              self = v27;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v42 = v37;
                v43 = 2080;
                v44 = (void *)d_name;
                v45 = 2048;
                v46 = v39;
                _os_log_impl(&dword_213CF1000, v30, OS_LOG_TYPE_DEFAULT, "%s index file purgable:%s flags:0x%llx", buf, 0x20u);
              }
            }

            close(v25);
            v4 = v26;
            goto LABEL_31;
          }
          logForCSLogCategoryIndex();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v34 = __error();
            v35 = strerror(*v34);
            *(_DWORD *)buf = 136315394;
            v42 = d_name;
            v43 = 2080;
            v44 = v35;
            v21 = v18;
            v22 = "Failed to open index file:%s (%s)";
LABEL_26:
            _os_log_error_impl(&dword_213CF1000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
          }
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", d_name);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[SPConcreteCoreSpotlightIndexer markAllFilesPurgeable:purgeableOrNot:](self, "markAllFilesPurgeable:purgeableOrNot:", v17, v4);
LABEL_31:
        v10 = readdir(v7);
        if (!v10)
          goto LABEL_32;
      }
      logForCSLogCategoryIndex();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = __error();
        v20 = strerror(*v19);
        *(_DWORD *)buf = 136315394;
        v42 = d_name;
        v43 = 2080;
        v44 = v20;
        v21 = v18;
        v22 = "Failed to obtain index file info:%s (%s)";
        goto LABEL_26;
      }
LABEL_27:

      goto LABEL_31;
    }
LABEL_32:
    closedir(v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SPConcreteCoreSpotlightIndexer getIndexDirectorySize:].cold.1();

  }
}

- (void)closeCache:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  __SI *index;
  _QWORD v7[5];
  void (**v8)(id, _QWORD, void *);

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "closeCache"))
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2006, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v5);

      }
    }
    else
    {
      index = self->_index;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke;
      v7[3] = &unk_24D0EC8F0;
      v7[4] = self;
      v8 = v4;
      SISynchedOpWithBlock((uint64_t)index, 2, v7);

    }
  }

}

void __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2007, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v8);

    }
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke_2;
    v9[3] = &unk_24D0EB060;
    v9[4] = *(_QWORD *)(a1 + 32);
    v5 = (const void *)objc_msgSend(v9, "copy");
    if (!SICloseCache())
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2008, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

      }
      CFRelease(v5);
    }
  }
}

uint64_t __45__SPConcreteCoreSpotlightIndexer_closeCache___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
}

- (void)cacheEntryForKeys:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  NSObject *v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v13)
      goto LABEL_5;
  }
  else
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "cacheEntryForKeys"))
    {
      if (!v13)
        goto LABEL_7;
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDC1950];
      v16 = -2006;
      goto LABEL_6;
    }
    v18 = (void *)MEMORY[0x2199C2D78]();
    if (self->_index && objc_msgSend(v11, "length"))
    {
      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __95__SPConcreteCoreSpotlightIndexer_cacheEntryForKeys_bundleID_protectionClass_completionHandler___block_invoke;
      v25 = &unk_24D0EC918;
      v13 = v13;
      v27 = v13;
      v20 = v19;
      v26 = v20;
      v21 = (void *)MEMORY[0x2199C2F34](&v22);
      if (!SIGetCacheEntry())
      {

        v13 = 0;
      }
      dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

    }
    objc_autoreleasePoolPop(v18);
    if (v13)
    {
LABEL_5:
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDC1950];
      v16 = -2008;
LABEL_6:
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, 0, v22, v23, v24, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v17);

    }
  }
LABEL_7:

}

void __95__SPConcreteCoreSpotlightIndexer_cacheEntryForKeys_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (!a2)
    goto LABEL_7;
  v4 = (id)_MDPlistBytesCopyPlistAtIndex();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v4, "count"))
  {

    goto LABEL_7;
  }
  if (!v4)
  {
LABEL_7:
    v3 = 0;
    v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)cacheInsertForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  __SI *index;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SPConcreteCoreSpotlightIndexer *v21;
  void (**v22)(id, _QWORD, void *);

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a7;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "cacheInsertForKey"))
    {
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2006, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, 0, v15);

      }
    }
    else
    {
      index = self->_index;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke;
      v17[3] = &unk_24D0EC940;
      v22 = v14;
      v18 = v13;
      v19 = v12;
      v20 = v11;
      v21 = self;
      SISynchedOpWithBlock((uint64_t)index, 2, v17);

    }
  }

}

void __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a1[8];
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2007, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

    }
  }
  else
  {
    v5 = &stru_24D0EF078;
    v6 = a1[5];
    if (a1[4])
      v5 = (const __CFString *)a1[4];
    v14[0] = CFSTR("_kMDItemBundleID");
    v14[1] = v6;
    v7 = a1[6];
    v15[0] = v5;
    v15[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2;
    v13[3] = &unk_24D0EB060;
    v13[4] = a1[7];
    v9 = (const void *)objc_msgSend(v13, "copy");
    if (!SISetCacheEntry())
    {
      v10 = a1[8];
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2008, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

      }
      CFRelease(v9);
    }

  }
}

uint64_t __101__SPConcreteCoreSpotlightIndexer_cacheInsertForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
}

- (void)cacheDeleteForKey:(id)a3 value:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  __SI *index;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SPConcreteCoreSpotlightIndexer *v21;
  void (**v22)(id, _QWORD, void *);

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a7;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (self->_index && !self->_suspended && !self->_suspending)
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "cacheDeleteForKey"))
    {
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2006, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, 0, v15);

      }
    }
    else
    {
      index = self->_index;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke;
      v17[3] = &unk_24D0EC940;
      v22 = v14;
      v18 = v13;
      v19 = v12;
      v20 = v11;
      v21 = self;
      SISynchedOpWithBlock((uint64_t)index, 2, v17);

    }
  }

}

void __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a1[8];
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2007, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

    }
  }
  else
  {
    v5 = &stru_24D0EF078;
    v6 = a1[5];
    if (a1[4])
      v5 = (const __CFString *)a1[4];
    v14[0] = CFSTR("_kMDItemBundleID");
    v14[1] = v6;
    v7 = a1[6];
    v15[0] = v5;
    v15[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2;
    v13[3] = &unk_24D0EB060;
    v13[4] = a1[7];
    v9 = (const void *)objc_msgSend(v13, "copy");
    if (!SIDeleteCacheEntry())
    {
      v10 = a1[8];
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2008, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

      }
      CFRelease(v9);
    }

  }
}

uint64_t __101__SPConcreteCoreSpotlightIndexer_cacheDeleteForKey_value_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
}

- (void)spotlightCacheFileDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int, int, int);
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;

  v6 = a3;
  v7 = a4;
  -[SPConcreteCoreSpotlightIndexer readyIndex:](self, "readyIndex:", 0);
  if (!self->_index || self->_suspended || self->_suspending)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    if (-[SPConcreteCoreSpotlightIndexer denyOperationOnAssertedIndex:](self, "denyOperationOnAssertedIndex:", "spotlightCacheFileDescriptor"))
    {
      if (!v7)
        goto LABEL_7;
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDC1950];
      v10 = -2006;
      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x2199C2D78]();
    if (self->_index)
    {
      xpc_dictionary_get_remote_connection(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = xpc_null_create();
      v15 = dispatch_group_create();
      dispatch_group_enter(v15);
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke;
      v23 = &unk_24D0EC968;
      v24 = v6;
      v16 = v14;
      v25 = v16;
      v17 = v13;
      v26 = v17;
      v18 = v15;
      v27 = v18;
      v19 = (void *)MEMORY[0x2199C2F34](&v20);
      if (!SIGetCacheFd())
      {

        v7 = 0;
      }
      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
LABEL_5:
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDC1950];
      v10 = -2008;
LABEL_6:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, 0, v20, v21, v22, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }
LABEL_7:

}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke(uint64_t a1, int fd, int a3, int a4)
{
  xpc_object_t v8;
  void *v9;
  NSObject *v10;
  xpc_object_t v11;
  void *v12;
  NSObject *v13;
  xpc_object_t v14;
  void *v15;
  NSObject *v16;

  if ((fd & 0x80000000) == 0)
  {
    v8 = xpc_fd_create(fd);
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      xpc_dictionary_set_value(v9, "cache-node-fd", v8);
    }
    else
    {
      xpc_dictionary_set_value(v9, "cache-node-fd", *(xpc_object_t *)(a1 + 40));
      logForCSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_3();

    }
    close(fd);

  }
  if ((a3 & 0x80000000) == 0)
  {
    v11 = xpc_fd_create(a3);
    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      xpc_dictionary_set_value(v12, "cache-container-fd", v11);
    }
    else
    {
      xpc_dictionary_set_value(v12, "cache-container-fd", *(xpc_object_t *)(a1 + 40));
      logForCSLogCategoryDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_2();

    }
    close(a3);

  }
  if ((a4 & 0x80000000) == 0)
  {
    v14 = xpc_fd_create(a4);
    v15 = *(void **)(a1 + 32);
    if (v14)
    {
      xpc_dictionary_set_value(v15, "cache-payload-fd", v14);
    }
    else
    {
      xpc_dictionary_set_value(v15, "cache-payload-fd", *(xpc_object_t *)(a1 + 40));
      logForCSLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_1();

    }
    close(a4);

  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void)setIndex:(__SI *)a3
{
  self->_index = a3;
}

- (__SI)jwlIndex
{
  return self->_jwlIndex;
}

- (void)setJwlIndex:(__SI *)a3
{
  self->_jwlIndex = a3;
}

- (__SIResultQueue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(__SIResultQueue *)a3
{
  self->_resultQueue = a3;
}

- (void)setIndexQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexQueue, a3);
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

- (void)setFirstUnlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockQueue, a3);
}

- (void)setDataclass:(id)a3
{
  objc_storeStrong((id *)&self->_dataclass, a3);
}

- (OS_dispatch_source)indexIdleTimer
{
  return self->_indexIdleTimer;
}

- (double)idleStartTime
{
  return self->_idleStartTime;
}

- (NSMutableArray)outstandingMaintenance
{
  return self->_outstandingMaintenance;
}

- (void)setOutstandingMaintenance:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingMaintenance, a3);
}

- (void)setKnownClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMapTable)checkedInClients
{
  return self->_checkedInClients;
}

- (unint64_t)dirtyTimeout
{
  return self->_dirtyTimeout;
}

- (void)setDirtyTimeout:(unint64_t)a3
{
  self->_dirtyTimeout = a3;
}

- (OS_os_transaction)dirtyTransaction
{
  return self->_dirtyTransaction;
}

- (void)setDirtyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyTransaction, a3);
}

- (BOOL)finishedDrainingJournal
{
  return self->_finishedDrainingJournal;
}

- (void)setFinishedDrainingJournal:(BOOL)a3
{
  self->_finishedDrainingJournal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyTransaction, 0);
  objc_storeStrong((id *)&self->_knownClients, 0);
  objc_storeStrong((id *)&self->_outstandingMaintenance, 0);
  objc_storeStrong((id *)&self->_indexIdleTimer, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_blocksToRunWhenFinishedDraining, 0);
  objc_storeStrong((id *)&self->_assertedBundleIds, 0);
  objc_storeStrong((id *)&self->_reindexAllDelegateBundleIDs, 0);
  objc_storeStrong((id *)&self->_checkedInClients, 0);
}

- (void)notifyClientForItemUpdates:(void *)a1 updatedItems:(char *)a2 batchMask:.cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_52(a1, a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_213CF1000, a2, v3, "Performing job task CSIndexNotifyForSearchableItemUpdates with %lu items", v4);
  OUTLINED_FUNCTION_11();
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "SpotlightDaemonServer done handling job.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "SpotlightDaemonServer done handling job with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "CSIndexExtensionDelegate done handling job.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __84__SPConcreteCoreSpotlightIndexer_notifyClientForItemUpdates_updatedItems_batchMask___block_invoke_149_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "CSIndexExtensionDelegate done handling job with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOn__block_invoke_165_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error deleting items for priority migration for default index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__SPConcreteCoreSpotlightIndexer_issuePriorityIndexFixupOff__block_invoke_176_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, (uint64_t)v0, "Failed to delete old priority index for priority migration at %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)issuePriorityIndexFixup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_38(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Need to perform priority migration OFF for index %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reindexAttributes:ofItemsMatchingQuery:indexAttrName:withVersion:perItemCompletionAttribute:force:postFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Cannot reindex attributes because the index is read-only. dataclass:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __143__SPConcreteCoreSpotlightIndexer_reindexAttributes_ofItemsMatchingQuery_indexAttrName_withVersion_perItemCompletionAttribute_force_postFilter___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Post fixup merged finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cancelIdleTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Index %@ timer canceled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__SPConcreteCoreSpotlightIndexer_dirty___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  CFAbsoluteTime Current;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 168);
  v5 = 138412546;
  v6 = v3;
  v7 = 2048;
  Current = CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_3(&dword_213CF1000, a2, v4, "Index %@ timer reset %g", (uint8_t *)&v5);
  OUTLINED_FUNCTION_11();
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_331_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  v2 = 138412546;
  v3 = v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v1, (uint64_t)v1, "Error udpdating items for checked in client (%@): %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __63__SPConcreteCoreSpotlightIndexer_indexFinishedDrainingJournal___block_invoke_334_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "dataclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_51();
  v8 = v5;
  OUTLINED_FUNCTION_3(&dword_213CF1000, a3, v6, "Complete wil modify fixup query for bundleID:%@ pc: %@", v7);

  OUTLINED_FUNCTION_7();
}

void __51__SPConcreteCoreSpotlightIndexer_fixupPathTimeouts__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_213CF1000, a2, v4, "Complete pathFixup query pc: %@", v5);

  OUTLINED_FUNCTION_11();
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_3(&dword_213CF1000, a4, a3, "Request reimport of %ld items for bundleID:%@ (expired items)", (uint8_t *)a2);
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_35();
  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_36(*v1);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v2, "Request reimport of %ld items for bundleID:%@ (expired items)", v3);
  OUTLINED_FUNCTION_11();
}

void __53__SPConcreteCoreSpotlightIndexer_revokeExpiredItems___block_invoke_346_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_36(*(_QWORD *)(v1 + 40));
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v2, "Done reimporting %ld items for bundleID:%@ (expired items)", v3);
  OUTLINED_FUNCTION_11();
}

- (void)writeIndexSuccessfulOpenDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_41();
  objc_msgSend((id)OUTLINED_FUNCTION_48(v1, v2), "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v4, "Error %@ writing index successful open date for %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)writeIndexDropAnalyticsDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_41();
  objc_msgSend((id)OUTLINED_FUNCTION_48(v1, v2), "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v4, "Error %@ writing index drop analytics date for %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)writeIndexCreationDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_41();
  objc_msgSend((id)OUTLINED_FUNCTION_48(v1, v2), "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v4, "Error %@ writing index creation date for %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)writeIndexCreationDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "Error fetching parent directory age: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)writeSDBObjectCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_41();
  objc_msgSend((id)OUTLINED_FUNCTION_48(v1, v2), "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v4, "Error %@ writing index object count for %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(void *)a1 size:(NSObject *)a2 openingInReadOnly:fullyCreated:forAnalytics:.cold.1(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "[IndexLoss] (%s) Failed to get volume path url", v5);

  OUTLINED_FUNCTION_11();
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:.cold.2()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_35();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "dataclass");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "UTF8String");
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v3, "[IndexLoss] (%s) Failed to get volume property flags, err:%@", v4);

  OUTLINED_FUNCTION_7();
}

- (void)indexLossAnalyticsDictWithPreviousIndexCreationDate:(NSObject *)a3 size:openingInReadOnly:fullyCreated:forAnalytics:.cold.3(void *a1, int a2, NSObject *a3)
{
  id v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  OUTLINED_FUNCTION_2_1();
  v8 = 1024;
  v9 = a2;
  OUTLINED_FUNCTION_24(&dword_213CF1000, a3, v6, "[IndexLoss] (%s) Failed to get FS info, err:%d", v7);

  OUTLINED_FUNCTION_7();
}

- (void)writeIndexLossEventToFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "[IndexLoss] Empty dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)writeIndexLossEventToFile:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "[IndexLoss] Event does not have a timestamp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)writeIndexLossEventToFile:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[IndexLoss] Over 100 drops with same timestamp %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeIndexLossEventToFile:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "[IndexLoss] Wrote to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeIndexLossEventToFile:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[IndexLoss] Failed to create file at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeIndexLossEventToFile:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[IndexLoss] Failed to create directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__SPConcreteCoreSpotlightIndexer_fetchItemForURL___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_50();
  v3 = v0;
  OUTLINED_FUNCTION_24(&dword_213CF1000, v1, (uint64_t)v1, "[%d] fetch error %@", v2);
  OUTLINED_FUNCTION_1();
}

void __76__SPConcreteCoreSpotlightIndexer_fetchParentsForItemID_recursively_timeout___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[10];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_50();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_213CF1000, v3, OS_LOG_TYPE_ERROR, "[%d] fetch parents for %@ error %@", v4, 0x1Cu);
  OUTLINED_FUNCTION_16_0();
}

void __57__SPConcreteCoreSpotlightIndexer__sendIndexDropABCEvent___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BEB3528]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Failed to auto-bug capture: %ld", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_saveCorruptIndexWithPath:shouldSendABC:fullyCreated:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, (uint64_t)v0, "Failed to move corrupt index to path:%@, error:%@", v1);
  OUTLINED_FUNCTION_1();
}

void __87__SPConcreteCoreSpotlightIndexer__saveCorruptIndexWithPath_shouldSendABC_fullyCreated___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_38(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Failed to open index at path:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openIndexForUpgradeSynchronous:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "[IndexLoss] Failed to create touchfile: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)openIndexForUpgradeSynchronous:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Can't upgrade dataclass:%@ - Not fully created", v5);

  OUTLINED_FUNCTION_11();
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "[IndexLoss] Failed to create touch file: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[IndexLoss] Failed to create new index directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openIndex:shouldReindexAll:readOnly:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "Failed to get properties of corrupted index, err: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)openIndex:(void *)a1 shouldReindexAll:(NSObject *)a2 readOnly:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Can't open dataclass:%@ - Not fully created", v5);

  OUTLINED_FUNCTION_11();
}

- (void)openIndex:(void *)a1 shouldReindexAll:(NSObject *)a2 readOnly:.cold.5(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataclass");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v4, "Attempting to create index for pc %s", v5);

  OUTLINED_FUNCTION_11();
}

void __70__SPConcreteCoreSpotlightIndexer_openIndex_shouldReindexAll_readOnly___block_invoke_617_cold_1()
{
  NSObject *v0;
  void *v1;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_35();
  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*v2, "timeIntervalSince1970");
  v4 = v3;
  objc_msgSend(v1, "timeIntervalSince1970");
  v7 = 134218240;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v6, "<= 5 seconds off! bootTime:%.0f vs. stored bootTime:%.0f", (uint8_t *)&v7);
}

- (void)openJWLIndex
{
  int v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  v3[0] = 67109378;
  v3[1] = v0;
  v4 = 2112;
  v5 = v1;
  OUTLINED_FUNCTION_24(&dword_213CF1000, v2, (uint64_t)v2, "JWL index open failed, result:%d, dataclass:%@", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

- (void)mergeWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer mergeWithCompletionHandler:]", "SPCoreSpotlightIndexer.m", 5063, "completionHandler");
}

- (void)cleanupStringsWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer cleanupStringsWithCompletionHandler:]", "SPCoreSpotlightIndexer.m", 5082, "completionHandler");
}

- (void)fixupMessageAttachmentsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Cannot fixup messages attachment because the index is read-only", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __79__SPConcreteCoreSpotlightIndexer_fixupMessageAttachmentsWithCompletionHandler___block_invoke_3_677_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_38(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "fixupMessageAttachments error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)dumpCrashStates:toFile:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, MEMORY[0x24BDACB70], v0, "Failed to open %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_25(&dword_213CF1000, v0, v1, "The index is unavailable, dataclass:%@, index:%p, suspended:%s, readOnly:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_16_0();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "JWL index open failed: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_3()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer indexFromBundle:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:canCreateNewIndex:completionHandler:]_block_invoke", "SPCoreSpotlightIndexer.m", 7083, "(_index && !_jwlIndex) || (!_index && _jwlIndex)");
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_25(&dword_213CF1000, v0, v1, "The index is unavailable (jwl FF off), dataclass:%@, index:%p, suspended:%s, readOnly:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_16_0();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[8];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_16();
  v6 = *MEMORY[0x24BDAC8D0];
  qos_class_self();
  OUTLINED_FUNCTION_23();
  v4 = 2080;
  v5 = v1;
  OUTLINED_FUNCTION_39(&dword_213CF1000, v0, v2, "QOS indexFromBundle %d %s", v3);
  OUTLINED_FUNCTION_11();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a3, (uint64_t)a3, "RequiresImport missing: UI:%@", a1);
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_766_cold_2(int a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 48);
  *(_DWORD *)a3 = 67109378;
  *(_DWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 8) = 2112;
  *(_QWORD *)(a3 + 10) = v4;
  OUTLINED_FUNCTION_39(&dword_213CF1000, a4, a3, "ABOUT TO DECODE 4 %d %@", (uint8_t *)a3);
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_5_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  v2 = 138412546;
  v3 = v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v1, (uint64_t)v1, "Error writing back collaboration attributes for %@: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __176__SPConcreteCoreSpotlightIndexer_indexFromBundle_personaID_options_items_itemsText_clientState_expectedClientState_clientStateName_deletes_canCreateNewIndex_completionHandler___block_invoke_2_828_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[TopHitAppShortcuts] indexFromBundle updating error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Index items, bundleID:%@, items:%@");
  OUTLINED_FUNCTION_1();
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_45(&dword_213CF1000, v0, v1, "Cannot index items because the index is read-only, dataclass:%@, index:%p, suspended:%s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_16_0();
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_25(&dword_213CF1000, v0, v1, "The index is unavailable, dataclass:%@, index:%p, suspended:%s, readonly:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_16_0();
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Allowing indexing activity while locked for bundle: %@, dataclass:%@");
  OUTLINED_FUNCTION_1();
}

void __178__SPConcreteCoreSpotlightIndexer_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_forBundleID_options_completionHandler___block_invoke_837_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_38(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "SIDeleteCSAttributes, bundleID:%@, deletes:%ld");
  OUTLINED_FUNCTION_1();
}

void __76__SPConcreteCoreSpotlightIndexer_validateConcreteIndexer_outFileDescriptor___block_invoke_869_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  v4 = 2080;
  v5 = v0;
  v6 = 2080;
  v7 = v1;
  _os_log_error_impl(&dword_213CF1000, v2, OS_LOG_TYPE_ERROR, "### Validation Error PC %@ validating %s: Result - %s\n", v3, 0x20u);
  OUTLINED_FUNCTION_16_0();
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.1()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]", "SPCoreSpotlightIndexer.m", 8549, "queryTask");
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.2()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]", "SPCoreSpotlightIndexer.m", 8553, "resultsQueue");
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.3()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]", "SPCoreSpotlightIndexer.m", 8555, "siResultsQueue");
}

- (void)_startQueryWithQueryTask:eventHandler:resultsHandler:.cold.4()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer _startQueryWithQueryTask:eventHandler:resultsHandler:]", "SPCoreSpotlightIndexer.m", 8557, "siQuery");
}

- (void)startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:.cold.1()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:]", "SPCoreSpotlightIndexer.m", 8615, "startHandler");
}

- (void)_backgroundDeleteItems:bundleID:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "_backgroundDeleteItems, bundleID:%@, identifiers:%@");
  OUTLINED_FUNCTION_1();
}

- (void)deleteItemsForQuery:bundleID:fromClient:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "NULL index in deleteItemsForQuery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)deleteItemsForQuery:bundleID:fromClient:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "deleteItemsForQuery, query:\"%@\", bundleID:%@");
  OUTLINED_FUNCTION_1();
}

- (void)deleteSearchableItemsWithDomainIdentifiers:forBundleID:fromClient:reason:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "domainIdentifiers:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Index ref nil when updating shortcuts in delete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __125__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithDomainIdentifiers_forBundleID_fromClient_reason_completionHandler___block_invoke_908_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[TopHitAppShortcuts] deleteSearchableItems updating error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteSearchableItemsWithPersonaIds:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v1, v2, "deleteSearchableItemsWithPersonaIds, protectionClass:%@, domainIdentifiers:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)deleteSearchableItemsWithFileProviderDomains:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_37(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v1, v2, "deleteSearchableItemsWithFileProviderDomains, protectionClass:%@, domains:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __97__SPConcreteCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Index ref nil in deleteWithFileProviderDomains", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)deleteAllUserActivities:fromClient:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "deleteAllUserActivities, bundleID:%@, protectionClass:%@");
  OUTLINED_FUNCTION_1();
}

- (void)restartAttachmentImport:maxCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "==== restartAttachmentImport GOOD TIME", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)restartAttachmentImport:maxCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "==== restartAttachmentImport enter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __67__SPConcreteCoreSpotlightIndexer_restartAttachmentImport_maxCount___block_invoke_939_cold_1()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[22];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_46();
  v6 = v0;
  v7 = v1;
  v8 = v0;
  v9 = v2;
  OUTLINED_FUNCTION_40(&dword_213CF1000, v3, v4, "~~ restartAttachmentImport missing fields! %p %p %p %p", v5);
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_3_969_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Index ref nil when updating shortcuts in deleteAll", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __108__SPConcreteCoreSpotlightIndexer_deleteAllSearchableItemsForBundleID_fromClient_shouldGC_completionHandler___block_invoke_2_976_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "[TopHitAppShortcuts] deleteAllSearchableItems updating error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchLastClientStateForBundleID:clientStateName:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "#index fetch state %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __100__SPConcreteCoreSpotlightIndexer_fetchLastClientStateForBundleID_clientStateName_completionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer fetchLastClientStateForBundleID:clientStateName:completionHandler:]_block_invoke", "SPCoreSpotlightIndexer.m", 9934, "(_index && !_jwlIndex) || (!_index && _jwlIndex)");
}

- (void)_fetchAccumulatedStorageSizeForBundleId:completionHandler:.cold.1()
{
  __assert_rtn("-[SPConcreteCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:]", "SPCoreSpotlightIndexer.m", 10212, "completionHandler");
}

+ (void)_indexDependentTokenRewritesWithMatchInfo:topK:setOfTokensToCorrect:queryID:bundleIds:clientBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_35();
  v5 = 134218240;
  v6 = v1;
  v7 = 2048;
  v8 = OUTLINED_FUNCTION_52(v2, v3);
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v4, "[rewrite] qid:%ld _queryTokenRewritesWithMatchInfo: called with |topK|:%lu", (uint8_t *)&v5);
  OUTLINED_FUNCTION_11();
}

- (void)_removePurgeableTouchFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_53();
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, v2, "Failed to remove touch file %@. errno=%d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_11();
}

- (void)getIndexDirectorySize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Failed to open path:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getIndexDirectorySize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Getting total size of all index files in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)markAllFilesPurgeable:(char)a1 purgeableOrNot:.cold.2(char a1)
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "Marking";
  if ((a1 & 1) == 0)
    v1 = "Clearing";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v2, v3, "%s all index files purgable under %@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! payload_fd: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! container_fd: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __81__SPConcreteCoreSpotlightIndexer_spotlightCacheFileDescriptor_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "spotlightCacheFileDescriptor failed to create FD! node_fd: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

@end
