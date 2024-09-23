@implementation SUISpotlightController

- (SUISpotlightController)init
{
  SUISpotlightController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUISpotlightController;
  v2 = -[SUISpotlightController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SUISpotlightController setClientSession:](v2, "setClientSession:", v3);

  }
  return v2;
}

- (void)updateWithCommand:(id)a3 triggerEvent:(unint64_t)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }

}

- (void)updateWithSuggestionResult:(id)a3 triggerEvent:(unint64_t)a4 languages:(id)a5 currentKeyboardLanguage:(id)a6 queryId:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v21, "completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v21, "suggestion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suggestion");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v18 = &stru_24E743928;
  if (v16)
    v18 = v16;
  v19 = v18;

  -[SUISpotlightController searchFieldDelegate](self, "searchFieldDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateSearchString:", v19);

  -[SUISpotlightController startQueryTaskWithSearchString:queryOptions:sourceResult:triggerEvent:languages:currentKeyboardLanguage:queryId:](self, "startQueryTaskWithSearchString:queryOptions:sourceResult:triggerEvent:languages:currentKeyboardLanguage:queryId:", v19, 0, v21, a4, v13, v12, a7);
  -[SUISpotlightController setCurrentSearchString:](self, "setCurrentSearchString:", v19);

}

- (void)startQueryTaskWithSearchString:(id)a3 queryOptions:(int64_t)a4 sourceResult:(id)a5 triggerEvent:(unint64_t)a6 languages:(id)a7 currentKeyboardLanguage:(id)a8 queryId:(unint64_t)a9
{
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  dispatch_block_t v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;

  v13 = (__CFString *)a3;
  v14 = a5;
  v15 = a8;
  v16 = &stru_24E743928;
  if (v13)
    v16 = v13;
  v17 = v16;
  -[SUISpotlightController currentSearchString](self, "currentSearchString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v17);

  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.keystroke"), 0, a9);
    -[SUISpotlightController feedbackDelegate](self, "feedbackDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reportFeedback:queryId:", v20, a9);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v17, "stringByTrimmingCharactersInSet:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUISpotlightController searchFieldDelegate](self, "searchFieldDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      v32 = v20;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0280]), "initWithSearchString:", v17);
      objc_msgSend(v25, "setQueryIdent:", a9);
      objc_msgSend(v25, "setKeyboardLanguage:", v15);
      objc_msgSend(v25, "setAllowInternet:", 1);
      objc_msgSend(v25, "setWhyQuery:", a6);
      if (a6 == 8)
        v26 = 8;
      else
        v26 = 2;
      objc_msgSend(v25, "setQueryKind:", v26, v32);
      -[SUISpotlightController clientSession](self, "clientSession");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "queryTaskWithContext:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "willRunQueryTask:", v28);
      if (startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__onceToken != -1)
        dispatch_once(&startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__onceToken, &__block_literal_global_0);
      v29 = startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__dispatchQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke_2;
      block[3] = &unk_24E742C08;
      v35 = v28;
      v30 = v28;
      v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_async(v29, v31);

      v20 = v33;
    }
    else
    {
      objc_msgSend(v24, "updateSearchString:", 0);
      objc_msgSend(v24, "updateTokenWithString:symbol:", 0, 0);
      objc_msgSend(v24, "updateCompletionString:targetString:", 0, 0);
    }

  }
}

void __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("SUIQueryTaskDispatchQueue", 0);
  v1 = (void *)startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__dispatchQueue;
  startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__dispatchQueue = (uint64_t)v0;

}

uint64_t __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (SUISpotlightControllerSearchFieldDelegate)searchFieldDelegate
{
  return (SUISpotlightControllerSearchFieldDelegate *)objc_loadWeakRetained((id *)&self->_searchFieldDelegate);
}

- (void)setSearchFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchFieldDelegate, a3);
}

- (SUISpotlightControllerResultsViewDelegate)resultsViewDelegate
{
  return (SUISpotlightControllerResultsViewDelegate *)objc_loadWeakRetained((id *)&self->_resultsViewDelegate);
}

- (void)setResultsViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsViewDelegate, a3);
}

- (SUISpotlightControllerSearchAppDelegate)appDelegate
{
  return (SUISpotlightControllerSearchAppDelegate *)objc_loadWeakRetained((id *)&self->_appDelegate);
}

- (void)setAppDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appDelegate, a3);
}

- (SFFeedbackListener)feedbackDelegate
{
  return (SFFeedbackListener *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (NSString)currentSearchString
{
  return self->_currentSearchString;
}

- (void)setCurrentSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchString, a3);
}

- (SPClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
  objc_storeStrong((id *)&self->_clientSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_appDelegate);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);
  objc_destroyWeak((id *)&self->_searchFieldDelegate);
}

@end
