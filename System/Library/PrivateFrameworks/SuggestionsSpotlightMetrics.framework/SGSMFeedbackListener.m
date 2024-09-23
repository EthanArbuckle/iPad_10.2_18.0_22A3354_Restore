@implementation SGSMFeedbackListener

- (void)_resetState
{
  SGSMMutableSearchState *previousState;
  SGSMMutableSearchState *v4;
  SGSMMutableSearchState *searchState;
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: resetting search state", v6, 2u);
  }
  previousState = self->_previousState;
  self->_previousState = 0;

  v4 = (SGSMMutableSearchState *)objc_opt_new();
  searchState = self->_searchState;
  self->_searchState = v4;

}

- (void)resultsDidBecomeVisible:(id)a3
{
  SGSMMutableSearchState *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  SGSMMutableSearchState *v18;
  void *v19;
  void *v20;
  double v21;
  NSCache *eventLastInteractionTime;
  void *v23;
  void *v24;
  int v25;
  SGSMMutableSearchState *v26;
  SGSMMutableSearchState *searchState;
  SGSMMutableSearchState *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  SGSMMutableSearchState *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _restoreStateIfUnset](self, "_restoreStateIfUnset");
  -[SGSMMutableSearchState resetJustEngaged](self->_searchState, "resetJustEngaged");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: resultsDidBecomeVisible: %@", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = v4;
  -[SGSMMutableSearchState results](v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v9 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "sectionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps"));

        if ((v13 & 1) == 0
          && -[SGSMMutableSearchState isFirstTimeSeeingResult:](self->_searchState, "isFirstTimeSeeingResult:", v11))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "resultBundleId");
            v26 = (SGSMMutableSearchState *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v26;
            _os_log_debug_impl(&dword_218DD8000, v9, OS_LOG_TYPE_DEBUG, "SGSM: resultsDidBecomeVisible.resultBundleId: %@", buf, 0xCu);

          }
          objc_msgSend(v11, "resultBundleId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

          if (v15)
          {
            -[SGSMMutableSearchState scoreAsContactOpportunity](self->_searchState, "scoreAsContactOpportunity");
LABEL_24:
            -[SGSMMutableSearchState scoreAsCuratedOrPseudoContactOpportunity](self->_searchState, "scoreAsCuratedOrPseudoContactOpportunity");
            continue;
          }
          objc_msgSend(v11, "resultBundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobilecal"));

          if (!v17)
          {
            objc_msgSend(v11, "resultBundleId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

            if (!v25)
              continue;
            goto LABEL_24;
          }
          -[SGSMFeedbackListener _eventIdentifierFromSearchResult:](self, "_eventIdentifierFromSearchResult:", v11);
          v18 = (SGSMMutableSearchState *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[NSCache objectForKey:](self->_eventLastInteractionTime, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (!v19 || (objc_msgSend(v19, "timeIntervalSinceNow"), v21 < -5.0))
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v18;
                _os_log_debug_impl(&dword_218DD8000, v9, OS_LOG_TYPE_DEBUG, "SGSM: scoring event with identifier = %@ as event shown.", buf, 0xCu);
              }
              -[SGSuggestionsServiceEventsProtocol logEventInteractionForEventWithExternalIdentifier:interface:actionType:](self->_suggestionsService, "logEventInteractionForEventWithExternalIdentifier:interface:actionType:", v18, 19, 4);
              eventLastInteractionTime = self->_eventLastInteractionTime;
              v23 = (void *)objc_opt_new();
              -[NSCache setObject:forKey:](eventLastInteractionTime, "setObject:forKey:", v23, v18);

              v9 = MEMORY[0x24BDACB70];
            }

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    *(_DWORD *)buf = 138412290;
    v35 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", buf, 0xCu);
  }

}

- (void)didRankSections:(id)a3
{
  SGSMMutableSearchState *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  SGSMMutableSearchState *v18;
  SGSMMutableSearchState *searchState;
  SGSMMutableSearchState *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  SGSMMutableSearchState *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _resetState](self, "_resetState");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: didRankSections: %@", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v4;
  -[SGSMMutableSearchState sections](v4, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    v5 = MEMORY[0x24BDACB70];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v7, "results");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
              if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v13, "result");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "resultBundleId");
                v18 = (SGSMMutableSearchState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v36 = v18;
                _os_log_debug_impl(&dword_218DD8000, v5, OS_LOG_TYPE_DEBUG, "SGSM: didRankSections.resultBundleId: %@", buf, 0xCu);

              }
              objc_msgSend(v13, "result");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "resultBundleId");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

              if (v16)
                -[SGSMMutableSearchState scoreAsContactResult](self->_searchState, "scoreAsContactResult");
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);
        }

        v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    *(_DWORD *)buf = 138412290;
    v36 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", buf, 0xCu);
  }

}

- (void)_restoreStateIfUnset
{
  SGSMMutableSearchState **p_searchState;
  SGSMMutableSearchState *previousState;
  uint8_t v5[16];

  p_searchState = &self->_searchState;
  if (!self->_searchState)
  {
    previousState = self->_previousState;
    if (previousState)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: restoring search state", v5, 2u);
        previousState = self->_previousState;
      }
      objc_storeStrong((id *)p_searchState, previousState);
    }
  }
}

- (SGSMFeedbackListener)init
{
  SGSMFeedbackListener *v2;
  SGSMFeedbackListener *v3;
  uint64_t v4;
  SGSuggestionsServiceEventsProtocol *suggestionsService;
  uint64_t v6;
  NSCache *eventLastInteractionTime;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGSMFeedbackListener;
  v2 = -[SGSMFeedbackListener init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SGSMFeedbackListener _resetState](v2, "_resetState");
    objc_msgSend(MEMORY[0x24BE28608], "serviceForEvents");
    v4 = objc_claimAutoreleasedReturnValue();
    suggestionsService = v3->_suggestionsService;
    v3->_suggestionsService = (SGSuggestionsServiceEventsProtocol *)v4;

    v6 = objc_opt_new();
    eventLastInteractionTime = v3->_eventLastInteractionTime;
    v3->_eventLastInteractionTime = (NSCache *)v6;

    -[NSCache setCountLimit:](v3->_eventLastInteractionTime, "setCountLimit:", 4);
  }
  return v3;
}

- (void)_saveAndUnsetState
{
  SGSMMutableSearchState *searchState;
  SGSMMutableSearchState *v4;
  uint8_t v5[16];

  searchState = self->_searchState;
  if (searchState)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: saving search state", v5, 2u);
      searchState = self->_searchState;
    }
    objc_storeStrong((id *)&self->_previousState, searchState);
    -[SGSMMutableSearchState resetConversionCounts](self->_previousState, "resetConversionCounts");
    v4 = self->_searchState;
    self->_searchState = 0;

  }
}

- (id)_eventIdentifierFromSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "resultBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilecal"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
      v13 = v5;
    else
      v13 = 0;
    v8 = v13;
    goto LABEL_10;
  }
LABEL_4:
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)didEngageResult:(id)a3
{
  SGSMMutableSearchState *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  SGSMMutableSearchState *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  SGSMMutableSearchState *v18;
  SGSMMutableSearchState *searchState;
  int v20;
  SGSMMutableSearchState *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _restoreStateIfUnset](self, "_restoreStateIfUnset");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: didEngageResult: %@", (uint8_t *)&v20, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[SGSMMutableSearchState result](v4, "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resultBundleId");
    v18 = (SGSMMutableSearchState *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v18;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: didEngageResult.resultBundleId: %@", (uint8_t *)&v20, 0xCu);

  }
  -[SGSMMutableSearchState result](v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: scoring as contact conversion", (uint8_t *)&v20, 2u);
    }
    -[SGSMMutableSearchState scoreAsContactConversion](self->_searchState, "scoreAsContactConversion");
  }
  else
  {
    -[SGSMMutableSearchState result](v4, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal"));

    -[SGSMMutableSearchState result](v4, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      -[SGSMFeedbackListener _eventIdentifierFromSearchResult:](self, "_eventIdentifierFromSearchResult:", v11);
      v13 = (SGSMMutableSearchState *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v20 = 138412290;
          v21 = v13;
          _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: scoring event with identifier = %@ as event conversion.", (uint8_t *)&v20, 0xCu);
        }
        -[SGSuggestionsServiceEventsProtocol logEventInteractionForEventWithExternalIdentifier:interface:actionType:](self->_suggestionsService, "logEventInteractionForEventWithExternalIdentifier:interface:actionType:", v13, 19, 6);
      }

    }
    else
    {
      objc_msgSend(v11, "resultBundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        if (v16)
        {
          LOWORD(v20) = 0;
          _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: curated contact engaged, counting as a loss", (uint8_t *)&v20, 2u);
        }
        -[SGSMMutableSearchState scoreAsContactLoss](self->_searchState, "scoreAsContactLoss");
      }
      else
      {
        if (v16)
        {
          LOWORD(v20) = 0;
          _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: scoring as non opportunity", (uint8_t *)&v20, 2u);
        }
        -[SGSMMutableSearchState scoreAsOtherConversion](self->_searchState, "scoreAsOtherConversion");
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    v20 = 138412290;
    v21 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v20, 0xCu);
  }
  -[SGSMMutableSearchState commit](self->_searchState, "commit");
  -[SGSMMutableSearchState setJustEngaged](self->_searchState, "setJustEngaged");
  -[SGSMFeedbackListener _saveAndUnsetState](self, "_saveAndUnsetState");

}

- (void)didEngageSuggestion:(id)a3
{
  SGSMMutableSearchState *v4;
  SGSMMutableSearchState *searchState;
  int v6;
  SGSMMutableSearchState *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _restoreStateIfUnset](self, "_restoreStateIfUnset");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: didEngageSuggestion: %@", (uint8_t *)&v6, 0xCu);
  }
  -[SGSMMutableSearchState scoreAsOtherConversion](self->_searchState, "scoreAsOtherConversion");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    v6 = 138412290;
    v7 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  -[SGSMMutableSearchState commit](self->_searchState, "commit");
  -[SGSMMutableSearchState setJustEngaged](self->_searchState, "setJustEngaged");
  -[SGSMFeedbackListener _saveAndUnsetState](self, "_saveAndUnsetState");

}

- (void)didEngageCardSection:(id)a3
{
  SGSMMutableSearchState *v4;
  SGSMMutableSearchState *searchState;
  int v6;
  SGSMMutableSearchState *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _restoreStateIfUnset](self, "_restoreStateIfUnset");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: didEngageCardSection: %@", (uint8_t *)&v6, 0xCu);
  }
  -[SGSMMutableSearchState scoreAsOtherConversion](self->_searchState, "scoreAsOtherConversion");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    v6 = 138412290;
    v7 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  -[SGSMMutableSearchState commit](self->_searchState, "commit");
  -[SGSMMutableSearchState setJustEngaged](self->_searchState, "setJustEngaged");
  -[SGSMFeedbackListener _saveAndUnsetState](self, "_saveAndUnsetState");

}

- (void)searchViewDidDisappear:(id)a3
{
  SGSMMutableSearchState *v4;
  SGSMMutableSearchState *searchState;
  int v6;
  SGSMMutableSearchState *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (SGSMMutableSearchState *)a3;
  -[SGSMFeedbackListener _restoreStateIfUnset](self, "_restoreStateIfUnset");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: searchViewDidDisappear: %@", (uint8_t *)&v6, 0xCu);
  }
  if (!-[SGSMMutableSearchState justEngaged](self->_searchState, "justEngaged"))
  {
    -[SGSMMutableSearchState scoreAsNonOpportunity](self->_searchState, "scoreAsNonOpportunity");
    -[SGSMMutableSearchState commit](self->_searchState, "commit");
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    v6 = 138412290;
    v7 = searchState;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  -[SGSMFeedbackListener _saveAndUnsetState](self, "_saveAndUnsetState");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLastInteractionTime, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_searchState, 0);
}

@end
