@implementation SPSearchFeedbackProxy

+ (id)sharedProxy
{
  if (sharedProxy_onceToken != -1)
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_206);
  return (id)sharedProxy_sSharedProxy;
}

void __36__SPSearchFeedbackProxy_sharedProxy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedProxy_sSharedProxy;
  sharedProxy_sSharedProxy = v0;

  if (initFeedbackTables_onceToken != -1)
    dispatch_once(&initFeedbackTables_onceToken, &__block_literal_global_0);
}

- (SPSearchFeedbackProxy)init
{
  SPSearchFeedbackProxy *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  NSUserDefaults *v5;
  NSUserDefaults *defaultsCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPSearchFeedbackProxy;
  v2 = -[SPSearchFeedbackProxy init](&v8, sel_init);
  if (v2)
  {
    +[SPSearchFeedbackSender feedbackQueue](SPSearchFeedbackSender, "feedbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("SPUISearchFirstTimeShowCount"), 0, 0);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("SBSearchDisabledDomains"), 0, 0);
    defaultsCenter = v2->_defaultsCenter;
    v2->_defaultsCenter = v5;

    -[SPSearchFeedbackProxy updateParsecEnabled](v2, "updateParsecEnabled");
  }
  return v2;
}

- (void)updateParsecEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  SPGetDisabledDomainSet();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if ((objc_msgSend(v3, "containsObject:", CFSTR("DOMAIN_PARSEC")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSpotlightInternetResultsAllowed");

  }
  v6 = -[NSUserDefaults integerForKey:](self->_defaultsCenter, "integerForKey:", CFSTR("SPUISearchFirstTimeShowCount"));
  if (v6 > 0)
    v7 = v4;
  else
    v7 = 0;
  _permitParsecFeedback = v7;
  -[SPSearchFeedbackProxy setIsParsecEnabled:](self, "setIsParsecEnabled:", v4);
  +[SPCoreParsecInterface getSharedInstance](SPCoreParsecInterface, "getSharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParsecFeedbackAllowed:", _permitParsecFeedback);

  SPLogForSPLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    v15 = 134217984;
    v16 = v6;
    _os_log_impl(&dword_213202000, v9, v10, "[FEEDBACK-DEBUG] (_userPrefsChanged) firstTimeShowCount: %ld", (uint8_t *)&v15, 0xCu);
  }

  SPLogForSPLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v11, v12))
  {
    v15 = 67109120;
    LODWORD(v16) = v4 ^ 1;
    _os_log_impl(&dword_213202000, v11, v12, "[FEEDBACK-DEBUG] (_userPrefsChanged) DOMAIN_PARSEC disabled: %d", (uint8_t *)&v15, 8u);
  }

  SPLogForSPLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    v15 = 67109120;
    LODWORD(v16) = _permitParsecFeedback;
    _os_log_impl(&dword_213202000, v13, v14, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)&v15, 8u);
  }

  +[SPSearchFeedbackSender synchronizedBlock:](SPSearchFeedbackSender, "synchronizedBlock:", &__block_literal_global_215);
}

void __44__SPSearchFeedbackProxy_updateParsecEnabled__block_invoke()
{
  NSObject *v0;
  os_log_type_t v1;
  void *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v0, v1))
  {
    v3[0] = 67109120;
    v3[1] = _permitParsecFeedback;
    _os_log_impl(&dword_213202000, v0, v1, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)v3, 8u);
  }

  +[SPCoreParsecInterface getSharedInstance](SPCoreParsecInterface, "getSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setParsecFeedbackAllowed:", _permitParsecFeedback);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SPUISearchFirstTimeShowCount")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("SBSearchDisabledDomains")))
  {
    -[SPSearchFeedbackProxy updateParsecEnabled](self, "updateParsecEnabled");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPSearchFeedbackProxy;
    if (-[SPSearchFeedbackProxy respondsToSelector:](&v14, sel_respondsToSelector_, sel_observeValueForKeyPath_ofObject_change_context_))
    {
      v13.receiver = self;
      v13.super_class = (Class)SPSearchFeedbackProxy;
      -[SPSearchFeedbackProxy observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
  }

}

- (void)sendFeedbackType:(int64_t)a3 feedback:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  SPSearchFeedbackProxy *v28;
  id v29;
  id v30;
  id v31[3];
  _BYTE buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  if ((unint64_t)(a3 - 1) > 0x19 || !v10)
  {
    SPLogForSPLogCategoryFeedback();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:].cold.2(a3, (uint64_t)v10, v25);
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SPLogForSPLogCategoryFeedback();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:].cold.1(a3, v10);
LABEL_19:

    goto LABEL_20;
  }
  if (sendFeedbackType_feedback_queryId_clientID__onceToken != -1)
    dispatch_once(&sendFeedbackType_feedback_queryId_clientID__onceToken, &__block_literal_global_220);
  if (a3 == 8)
  {
    if (sendFeedbackType_feedback_queryId_clientID__isInternal)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
        objc_msgSend(v12, "result");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.other:taptoradar"));

        if (v15)
        {
          +[SDFeedbackInterceptor sharedInstance](SDFeedbackInterceptor, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dumpTTRDebugFiles");

        }
      }
    }
  }
  SPLogForSPLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v17, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    v19 = sSPFeedbackTypeDescriptionTable[a3];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v19;
    _os_log_impl(&dword_213202000, v17, v18, "send feedback (%s)", buf, 0xCu);
  }

  v20 = (void *)os_transaction_create();
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223;
  block[3] = &unk_24CF63B80;
  objc_copyWeak(v31, (id *)buf);
  v22 = v10;
  v31[1] = (id)a3;
  v27 = v22;
  v28 = self;
  v23 = v11;
  v31[2] = (id)a5;
  v29 = v23;
  v30 = v20;
  v24 = v20;
  dispatch_async(queue, block);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);
LABEL_20:

}

uint64_t __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  sendFeedbackType_feedback_queryId_clientID__isInternal = result;
  return result;
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    v21 = WeakRetained;
    if (v3)
    {
      v4 = (uint64_t *)(a1 + 72);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (*v4 == 7
          && (+[SDFeedbackInterceptor sharedInstance](SDFeedbackInterceptor, "sharedInstance"),
              (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_224;
          v26[3] = &unk_24CF63B58;
          v6 = WeakRetained;
          v7 = *v4;
          v27 = v6;
          v29 = v7;
          v28 = v3;
          objc_msgSend(v5, "annotateRankingFeedback:completion:", v28, v26);

        }
        else
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          +[SPSearchFeedbackSender feedbackListeners](SPSearchFeedbackSender, "feedbackListeners");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
                objc_msgSend(v14, "feedbackListener");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(*(id *)(a1 + 40), "clientID:supportsFeedbackListener:", *(_QWORD *)(a1 + 48), v15))
                {
                  v16 = objc_msgSend(v14, "supportsFeedbackType:", 21);
                  if (*v4 == 11)
                    v17 = 0;
                  else
                    v17 = v16;
                  if (v17 == 1)
                  {
LABEL_23:
                    objc_msgSend(v15, "reportFeedback:queryId:", v3, *(_QWORD *)(a1 + 80));
                  }
                  else if (objc_msgSend(v14, "supportsFeedbackType:"))
                  {
                    switch(*v4)
                    {
                      case 1:
                        objc_msgSend(v15, "didErrorOccur:", v3);
                        break;
                      case 2:
                        objc_msgSend(v15, "searchViewDidAppear:", v3);
                        break;
                      case 3:
                        objc_msgSend(v15, "searchViewDidDisappear:", v3);
                        break;
                      case 4:
                        objc_msgSend(v15, "cardViewDidDisappear:", v3);
                        break;
                      case 5:
                        objc_msgSend(v15, "didStartSearch:", v3);
                        break;
                      case 6:
                        objc_msgSend(v15, "didEndSearch:", v3);
                        break;
                      case 7:
                        objc_msgSend(v15, "didRankSections:", v3);
                        break;
                      case 8:
                        objc_msgSend(v15, "didEngageResult:", v3);
                        break;
                      case 9:
                        objc_msgSend(v15, "didEngageSuggestion:", v3);
                        break;
                      case 10:
                        objc_msgSend(v15, "didEngageCardSection:", v3);
                        break;
                      case 11:
                        objc_msgSend(v15, "sendCustomFeedback:", v3);
                        break;
                      case 12:
                        objc_msgSend(v15, "resultsDidBecomeVisible:", v3);
                        break;
                      case 13:
                        objc_msgSend(v15, "suggestionsDidBecomeVisible:", v3);
                        break;
                      case 14:
                        objc_msgSend(v15, "didReceiveResultsAfterTimeout:", v3);
                        break;
                      case 15:
                        objc_msgSend(v15, "didAppendLateSections:", v3);
                        break;
                      case 16:
                        objc_msgSend(v15, "didClearInput:", v3);
                        break;
                      case 17:
                        objc_msgSend(v15, "didEngageSection:", v3);
                        break;
                      case 18:
                        objc_msgSend(v15, "sectionHeaderDidBecomeVisible:", v3);
                        break;
                      case 19:
                        objc_msgSend(v15, "didGradeResultRelevancy:", v3);
                        break;
                      case 20:
                        objc_msgSend(v15, "cardViewDidAppear:", v3);
                        break;
                      case 21:
                        goto LABEL_23;
                      case 22:
                        objc_msgSend(v15, "didGoToSite:", v3);
                        break;
                      case 23:
                        objc_msgSend(v15, "didGoToSearch:", v3);
                        break;
                      case 24:
                        objc_msgSend(v15, "didGradeLookupHintRelevancy:", v3);
                        break;
                      case 25:
                        objc_msgSend(v15, "didReportUserResponseFeedback:", v3);
                        break;
                      case 26:
                        objc_msgSend(v15, "didPerformCommand:", v3);
                        break;
                      default:
                        SPLogForSPLogCategoryFeedback();
                        v18 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                        {
                          v19 = *v4;
                          *(_DWORD *)buf = 67109120;
                          LODWORD(v31) = v19;
                          _os_log_error_impl(&dword_213202000, v18, OS_LOG_TYPE_ERROR, "*** Error feedback type %d not handled", buf, 8u);
                        }

                        break;
                    }
                  }
                }

              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
            }
            while (v11);
          }

          v20 = (id)objc_opt_self();
        }
      }
      else
      {
        SPLogForSPLogCategoryFeedback();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223_cold_2((uint64_t)v4, v3);

      }
    }
    else
    {
      SPLogForSPLogCategoryFeedback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223_cold_1(a1, v8);

    }
    WeakRetained = v21;
  }

}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_224(_QWORD *a1)
{
  void *v1;
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v1 = (void *)a1[5];
  v2 = *(NSObject **)(a1[4] + 8);
  v3[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_2;
  v3[3] = &unk_24CF63B30;
  v3[1] = 3221225472;
  v5 = a1[6];
  v4 = v1;
  dispatch_async(v2, v3);

}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
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
  +[SPSearchFeedbackSender feedbackListeners](SPSearchFeedbackSender, "feedbackListeners", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "supportsFeedbackType:", *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(v7, "feedbackListener");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "didRankSections:", *(_QWORD *)(a1 + 32));

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (BOOL)clientID:(id)a3 supportsFeedbackListener:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PeopleViewService"));
  return v5 & 1 | ((isKindOfClass & 1) == 0);
}

- (void)sendCustomFeedback:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:](self, "sendFeedbackType:feedback:queryId:clientID:", 11, v7, objc_msgSend(v7, "queryId"), v6);

}

- (BOOL)isParsecEnabled
{
  return self->_isParsecEnabled;
}

- (void)setIsParsecEnabled:(BOOL)a3
{
  self->_isParsecEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendFeedbackType:(uint64_t)a1 feedback:(void *)a2 queryId:clientID:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_213202000, v3, v4, "*** invalid feedback class for (%s) %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)sendFeedbackType:(os_log_t)log feedback:queryId:clientID:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_213202000, log, OS_LOG_TYPE_ERROR, "invalid information for type %d feedback %p", (uint8_t *)v3, 0x12u);
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = sSPFeedbackTypeDescriptionTable[*(_QWORD *)(a1 + 72)];
  v3 = 136315138;
  v4 = v2;
  _os_log_error_impl(&dword_213202000, a2, OS_LOG_TYPE_ERROR, "no feedback (%s)", (uint8_t *)&v3, 0xCu);
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_223_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_213202000, v3, v4, "*** invalid feedback class for (%s) %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
