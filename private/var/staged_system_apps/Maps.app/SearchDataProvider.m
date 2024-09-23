@implementation SearchDataProvider

- (SearchDataProvider)init
{
  SearchDataProvider *v2;
  SearchDataProvider *v3;
  SearchBarSearchManager *v4;
  SearchBarSearchManager *localSearchManager;
  MKLocalSearchCompleter *v6;
  MKLocalSearchCompleter *searchCompleter;
  MKAutocompleteAnalyticsProvider *v8;
  MKAutocompleteAnalyticsProvider *autocompleteAnalyticsState;
  AutocompleteItemManager *v10;
  AutocompleteItemManager *deduplicator;
  PersonalizedItemAutocompleteFilter *v12;
  PersonalizedItemAutocompleteFilter *personalizedItemsFilter;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SearchDataProvider;
  v2 = -[SearchDataProvider init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_searchMode = 1;
    v2->_enableRAPIfAvailable = 1;
    v4 = -[SearchBarSearchManager initWithDelegate:]([SearchBarSearchManager alloc], "initWithDelegate:", v2);
    localSearchManager = v3->_localSearchManager;
    v3->_localSearchManager = v4;

    v6 = (MKLocalSearchCompleter *)objc_alloc_init((Class)MKLocalSearchCompleter);
    searchCompleter = v3->_searchCompleter;
    v3->_searchCompleter = v6;

    -[MKLocalSearchCompleter _setPrivateFilterType:](v3->_searchCompleter, "_setPrivateFilterType:", 1001);
    -[MKLocalSearchCompleter _setShouldPreloadTransitInfo:](v3->_searchCompleter, "_setShouldPreloadTransitInfo:", 1);
    -[MKLocalSearchCompleter setDelegate:](v3->_searchCompleter, "setDelegate:", v3);
    -[MKLocalSearchCompleter setStatefulQueriesEnabled:](v3->_searchCompleter, "setStatefulQueriesEnabled:", 1);
    v8 = (MKAutocompleteAnalyticsProvider *)objc_alloc_init((Class)MKAutocompleteAnalyticsProvider);
    autocompleteAnalyticsState = v3->_autocompleteAnalyticsState;
    v3->_autocompleteAnalyticsState = v8;

    -[MKLocalSearchCompleter setAnalyticsProvider:](v3->_searchCompleter, "setAnalyticsProvider:", v3->_autocompleteAnalyticsState);
    v10 = objc_alloc_init(AutocompleteItemManager);
    deduplicator = v3->_deduplicator;
    v3->_deduplicator = v10;

    v12 = objc_alloc_init(PersonalizedItemAutocompleteFilter);
    personalizedItemsFilter = v3->_personalizedItemsFilter;
    v3->_personalizedItemsFilter = v12;

    v3->_highlightType = 0;
    v3->_shouldEnableGrayscaleHighlighting = 0;
    -[PersonalizedItemManager addItemSource:](v3->_deduplicator, "addItemSource:", v3->_personalizedItemsFilter);
    -[PersonalizedItemManager addObserver:](v3->_deduplicator, "addObserver:", v3);
  }
  return v3;
}

- (void)setSearchMode:(unsigned int)a3
{
  if (self->_searchMode != a3)
  {
    self->_searchMode = a3;
    -[PersonalizedItemAutocompleteFilter setHasItemsWhenSearchStringIsEmpty:](self->_personalizedItemsFilter, "setHasItemsWhenSearchStringIsEmpty:", a3 == 2);
  }
}

- (void)setSearchCompletionFilterType:(int64_t)a3
{
  -[MKLocalSearchCompleter _setPrivateFilterType:](self->_searchCompleter, "_setPrivateFilterType:", a3);
}

- (void)setResultTypes:(unint64_t)a3
{
  if (self->_resultTypes != a3)
  {
    self->_resultTypes = a3;
    -[MKLocalSearchCompleter setResultTypes:](self->_searchCompleter, "setResultTypes:");
  }
}

- (void)setActive:(BOOL)a3
{
  AutocompleteContext *autocompleteInputContext;
  AutocompleteContext *autocompleteContext;

  self->_active = a3;
  if (-[SearchDataProvider isActive](self, "isActive"))
  {
    -[SearchDataProvider _dataChanged](self, "_dataChanged");
  }
  else
  {
    -[SearchDataProvider setLastTicket:](self, "setLastTicket:", 0);
    -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 0);
    -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", 0);
    autocompleteInputContext = self->_autocompleteInputContext;
    self->_autocompleteInputContext = 0;

    autocompleteContext = self->_autocompleteContext;
    self->_autocompleteContext = 0;

    -[AutocompleteItemManager setAutocompleteContext:](self->_deduplicator, "setAutocompleteContext:", 0);
    -[AutocompleteItemManager autocompleteSessionDidEnd](self->_deduplicator, "autocompleteSessionDidEnd");
    -[AutocompleteItemManager setTraits:](self->_deduplicator, "setTraits:", 0);
    -[SearchDataProvider updateAnalyticsStateWithContext:suggestionEntries:](self, "updateAnalyticsStateWithContext:suggestionEntries:", 0, &__NSArray0__struct);
  }
}

- (void)setMapPersonalizedItems:(id)a3
{
  PersonalizedItemManager *v5;
  PersonalizedItemManager *v6;

  v5 = (PersonalizedItemManager *)a3;
  if (self->_mapPersonalizedItems != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapPersonalizedItems, a3);
    -[PersonalizedItemAutocompleteFilter setInputItems:](self->_personalizedItemsFilter, "setInputItems:", self->_mapPersonalizedItems);
    v5 = v6;
  }

}

- (void)setUserLocationSearchResult:(id)a3
{
  UserLocationSearchResult *v5;
  UserLocationSearchResult *v6;

  v5 = (UserLocationSearchResult *)a3;
  if (self->_userLocationSearchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userLocationSearchResult, a3);
    -[SearchDataProvider _dataChanged](self, "_dataChanged");
    v5 = v6;
  }

}

- (BOOL)hasResults
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_sections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "items", (_QWORD)v9));
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)populateContext
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSArray *obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableSearchDebug"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_sortedCombinedResults;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v21 = v5;
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v5);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autocompleteObject"));
              if (v13)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matchInfo"));
                v15 = objc_msgSend(v14, "copy");

                objc_msgSend(v15, "setShownToUser:", 0);
                if (v4)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _priorityFunction](self->_deduplicator, "_priorityFunction"));

                  if (v16)
                  {
                    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _priorityFunction](self->_deduplicator, "_priorityFunction"));
                    objc_msgSend(v15, "setSortPriorityDebug:", objc_msgSend(v17, "priorityForPersonalizedAutocompleteItem:", v12));

                  }
                }
                if (v15)
                  -[AutocompleteContext setMatchInfo:forObject:](self->_autocompleteContext, "setMatchInfo:forObject:", v15, v13);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v9);
        }

        v5 = v21 + 1;
      }
      while ((id)(v21 + 1) != v20);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

}

- (id)buildContent
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  id v17;
  void *v18;
  ReportASearchAutocompleteResult *v19;
  void *v20;
  ReportASearchAutocompleteResult *v21;
  void *v22;
  void *v23;
  SearchDataProvider *v25;
  NSArray *obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  ReportASearchAutocompleteResult *v36;
  _BYTE v37[128];
  _BYTE v38[128];

  -[SearchDataProvider populateContext](self, "populateContext");
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_sortedCombinedResults, "count")));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = self;
  obj = self->_sortedCombinedResults;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              if (*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j))
              {
                objc_msgSend(v10, "addObject:");
                ++v5;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v13);
        }

        if (objc_msgSend(v10, "count"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
          v17 = objc_msgSend(v10, "copy");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", v16, v17, objc_msgSend(v8, "isQuerySuggestionsSection")));
          objc_msgSend(v27, "addObject:", v18);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if (-[SearchDataProvider shouldShowRapCellWithResultsCount:](v25, "shouldShowRapCellWithResultsCount:", v5))
  {
    v19 = [ReportASearchAutocompleteResult alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteContext queryString](v25->_autocompleteContext, "queryString"));
    v21 = -[ReportASearchAutocompleteResult initWithTitle:](v19, "initWithTitle:", v20);
    v36 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", 0, v22, 0));
    objc_msgSend(v27, "addObject:", v23);

  }
  return v27;
}

- (BOOL)_shouldShowResults
{
  id v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v13;
  void *v14;

  if (self->_finishedLocalCompletions && self->_finishedServerCompletions)
  {
    v3 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = 1;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Client and Server results are done", (uint8_t *)&v13, 2u);
    }
  }
  else if (GEOConfigGetBOOL(MapsConfig_ShowLocalACResultsImmediatelyOnFirstCharacter, off_1014B3398)
         && self->_finishedLocalCompletions
         && (id)-[NSString length](self->_trimmedInputText, "length") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider localCompletionsItemSource](self, "localCompletionsItemSource"));
    v7 = objc_msgSend(v6, "count");
    v5 = v7 != 0;

    v8 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = NSStringFromBOOL(v7 != 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Should show results: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    v11 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Not showing autocomplete results since we are still processing or showing search results.", (uint8_t *)&v13, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)_dataChanged
{
  id v3;
  NSObject *v4;
  NSArray *v5;
  NSArray *sections;
  void *v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *autocompleteAnalyticsSuggestions;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSArray *sortedCombinedResults;
  NSArray *v21;
  void *v22;
  NSString *inputText;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Data changed", buf, 2u);
  }

  if (-[SearchDataProvider _shouldShowResults](self, "_shouldShowResults"))
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider buildContent](self, "buildContent"));
    sections = self->_sections;
    self->_sections = v5;

    -[SearchDataProvider refreshAnalyticsState](self, "refreshAnalyticsState");
    if (self->_hasShowAutocompleteClientSource)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SearchDataProvider showAutocompleteClientSource](self, "showAutocompleteClientSource")));
    else
      v7 = 0;
    if (self->_inputTextTimestamp <= 0.0)
    {
      v9 = 0;
    }
    else
    {
      v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (CFAbsoluteTimeGetCurrent() - self->_inputTextTimestamp) * 1000.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteContext queryString](self->_autocompleteContext, "queryString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteContext query](self->_autocompleteContext, "query"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queryTerms"));
    autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AutocompleteItemManager clientRankingScoreInfluencedResults](self->_deduplicator, "clientRankingScoreInfluencedResults")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_lastRequestIsRetainQuery));
    +[GEOAPPortal captureClientACResponseWithQuery:queryTokens:entries:shouldDifferentiateClientAndServerResults:overallLatencyInMs:isRerankerTriggered:isRetainedQuery:](GEOAPPortal, "captureClientACResponseWithQuery:queryTokens:entries:shouldDifferentiateClientAndServerResults:overallLatencyInMs:isRerankerTriggered:isRetainedQuery:", v10, v12, autocompleteAnalyticsSuggestions, v7, v9, v14, v15);

    v16 = sub_10043222C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteContext queryString](self->_autocompleteContext, "queryString"));
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "SearchDataProvider - Notify SearchDataSource of updated AC list for query %@", buf, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider delegate](self, "delegate"));
    objc_msgSend(v19, "searchDataProviderDidUpdate:", self);

    if (self->_inputText)
    {
      sortedCombinedResults = self->_sortedCombinedResults;
      if (!sortedCombinedResults)
        sortedCombinedResults = (NSArray *)&__NSArray0__struct;
      v21 = sortedCombinedResults;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      inputText = self->_inputText;
      v25[0] = CFSTR("SearchDataProviderQueryKey");
      v25[1] = CFSTR("SearchDataProviderQueryResultGroupsKey");
      v26[0] = inputText;
      v26[1] = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("SearchDataProviderDidChangeDataNotification"), self, v24);

    }
  }
}

- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4
{
  return -[SearchDataProvider autocompleteAnalyticsSuggestionsFromSections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:](self, "autocompleteAnalyticsSuggestionsFromSections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:", a3, a4, 0, 0);
}

- (id)autocompleteAnalyticsSuggestionsFromSections:(id)a3 context:(id)a4 selectedChildItemIndexPath:(id)a5 indexOfResultWithSelectedChildItem:(id)a6
{
  void *v7;
  uint64_t v9;

  v7 = &__NSArray0__struct;
  if (a3 && a4)
  {
    LOWORD(v9) = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper acSuggestionEntriesFromSections:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:traits:usedForLogging:shouldUseDistanceFeatureServerResults:placeSummaryMetadata:](MapsAnalyticsHelper, "acSuggestionEntriesFromSections:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:traits:usedForLogging:shouldUseDistanceFeatureServerResults:placeSummaryMetadata:", a6, self->_traits, v9, self->_placeSummaryMetadata));
  }
  return v7;
}

- (void)refreshAnalyticsState
{
  NSArray *v3;
  NSArray *autocompleteAnalyticsSuggestions;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteAnalyticsSuggestionsFromSections:context:](self, "autocompleteAnalyticsSuggestionsFromSections:context:", self->_sections, self->_autocompleteContext));
  autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
  self->_autocompleteAnalyticsSuggestions = v3;

  -[SearchDataProvider updateAnalyticsStateWithContext:suggestionEntries:](self, "updateAnalyticsStateWithContext:suggestionEntries:", self->_autocompleteContext, self->_autocompleteAnalyticsSuggestions);
}

- (void)autocompleteContext:(id)a3 didUpdateMatchInfo:(id)a4
{
  if (self->_autocompleteContext == a3)
    -[SearchDataProvider refreshAnalyticsState](self, "refreshAnalyticsState");
}

- (void)clearAutocompleteResults
{
  NSArray *sections;
  NSArray *sortedCombinedResults;
  AutocompleteContext *autocompleteContext;
  AutocompleteContext *autocompleteInputContext;
  void *v7;

  sections = self->_sections;
  self->_sections = (NSArray *)&__NSArray0__struct;

  sortedCombinedResults = self->_sortedCombinedResults;
  self->_sortedCombinedResults = (NSArray *)&__NSArray0__struct;

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = 0;

  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = 0;

  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  -[SearchDataProvider setLocalCompletionsItemSource:](self, "setLocalCompletionsItemSource:", 0);
  -[SearchDataProvider setServerCompletionsItemSource:](self, "setServerCompletionsItemSource:", 0);
  -[PersonalizedItemManager setClientRankingFunction:](self->_deduplicator, "setClientRankingFunction:", 0);
  -[AutocompleteItemManager setPriorityFunction:](self->_deduplicator, "setPriorityFunction:", 0);
  -[AutocompleteItemManager setCompletionSections:](self->_deduplicator, "setCompletionSections:", 0);
  -[AutocompleteItemManager setTopSectionIsQuerySuggestions:](self->_deduplicator, "setTopSectionIsQuerySuggestions:", 0);
  -[AutocompleteItemManager setShouldUseDistanceFeatureServerResults:](self->_deduplicator, "setShouldUseDistanceFeatureServerResults:", 0);
  -[AutocompleteItemManager setAutocompleteContext:](self->_deduplicator, "setAutocompleteContext:", 0);
  -[AutocompleteItemManager setTraits:](self->_deduplicator, "setTraits:", 0);
  self->_enableStructuredRAPAffordance = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider delegate](self, "delegate"));
  objc_msgSend(v7, "searchDataProviderDidUpdate:", self);

  -[SearchDataProvider updateAnalyticsStateWithContext:suggestionEntries:](self, "updateAnalyticsStateWithContext:suggestionEntries:", 0, &__NSArray0__struct);
}

- (void)incrementAutocompleteChangeCounter
{
  int *p_autocompleteChangeCounter;
  unsigned int v3;

  p_autocompleteChangeCounter = &self->_autocompleteChangeCounter;
  do
    v3 = __ldxr((unsigned int *)p_autocompleteChangeCounter);
  while (__stxr(v3 + 1, (unsigned int *)p_autocompleteChangeCounter));
}

- (int)exclusiveIncrementAutocompleteChangeCounter
{
  int *p_autocompleteChangeCounter;
  unsigned int v3;
  int result;

  p_autocompleteChangeCounter = &self->_autocompleteChangeCounter;
  do
  {
    v3 = __ldaxr((unsigned int *)p_autocompleteChangeCounter);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, (unsigned int *)p_autocompleteChangeCounter));
  return result;
}

- (int)autocompleteChangeCounter
{
  int *p_autocompleteChangeCounter;
  int result;

  p_autocompleteChangeCounter = &self->_autocompleteChangeCounter;
  do
    result = __ldxr((unsigned int *)p_autocompleteChangeCounter);
  while (__stxr(result, (unsigned int *)p_autocompleteChangeCounter));
  return result;
}

- (void)setLastTicket:(id)a3
{
  GEOMapServiceCompletionTicket *v5;
  double v6;
  GEOMapServiceCompletionTicket *v7;

  v5 = (GEOMapServiceCompletionTicket *)a3;
  v7 = v5;
  if (self->_lastTicket != v5)
  {
    objc_storeStrong((id *)&self->_lastTicket, a3);
    v5 = v7;
  }
  if (v5)
  {
    -[GEOMapServiceCompletionTicket retainSearchTime](v5, "retainSearchTime");
    v5 = v7;
    self->_lastTicketRetainSearchTime = v6;
  }

}

- (void)setFinishedLocalCompletions:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = NSStringFromBOOL(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished collecting local results: %@", (uint8_t *)&v9, 0xCu);

  }
  self->_finishedLocalCompletions = v3;
  -[SearchDataProvider incrementAutocompleteChangeCounter](self, "incrementAutocompleteChangeCounter");
}

- (void)setFinishedServerCompletions:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = NSStringFromBOOL(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished collecting server results: %@", (uint8_t *)&v9, 0xCu);

  }
  self->_finishedServerCompletions = v3;
  -[SearchDataProvider incrementAutocompleteChangeCounter](self, "incrementAutocompleteChangeCounter");
}

- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5
{
  -[SearchDataProvider setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:](self, "setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:", a3, 0, 0, a4, *(_QWORD *)&a5);
}

- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7
{
  uint64_t v7;
  NSString *v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  NSString *inputText;
  void *v20;
  NSString **p_trimmedInputText;
  AutocompleteContext *v22;
  const __CFString *v23;
  AutocompleteContext *v24;
  AutocompleteContext *autocompleteInputContext;
  const __CFString *trimmedInputText;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  unint64_t Integer;
  uint64_t *v33;
  int v34;
  NSString *v35;
  MKMapRect v36;
  MKCoordinateRegion v37;

  v7 = *(_QWORD *)&a7;
  v12 = (NSString *)a3;
  v13 = a4;
  v14 = a6;
  if (self->_inputText == v12)
  {
    if (!v13)
      goto LABEL_38;
  }
  else
  {
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:");
    if (!v13 && (v15 & 1) != 0)
      goto LABEL_38;
  }
  v16 = sub_10043222C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v34 = 138412290;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "SearchDataProvider starting collecting data for query %@", (uint8_t *)&v34, 0xCu);
  }

  self->_inputTextTimestamp = CFAbsoluteTimeGetCurrent();
  -[PersonalizedItemManager setUpdatesPaused:](self->_deduplicator, "setUpdatesPaused:", 1);
  self->_lastRequestIsRetainQuery = a5;
  -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 0);
  -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", 0);
  -[SearchBarSearchManager cancelCurrentSearch](self->_localSearchManager, "cancelCurrentSearch");
  v18 = (NSString *)-[NSString copy](v12, "copy");
  inputText = self->_inputText;
  self->_inputText = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString _maps_stringByTrimmingLeadingWhitespace](self->_inputText, "_maps_stringByTrimmingLeadingWhitespace"));
  if (!objc_msgSend(v20, "length"))
  {

    v20 = 0;
  }
  p_trimmedInputText = &self->_trimmedInputText;
  objc_storeStrong((id *)&self->_trimmedInputText, v20);
  v22 = [AutocompleteContext alloc];
  if (self->_inputText)
    v23 = (const __CFString *)self->_inputText;
  else
    v23 = &stru_1011EB268;
  v24 = -[AutocompleteContext initWithQueryString:](v22, "initWithQueryString:", v23);
  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = v24;

  -[SearchDataProvider updateAnalyticsStateWithContext:suggestionEntries:](self, "updateAnalyticsStateWithContext:suggestionEntries:", self->_autocompleteInputContext, self->_autocompleteAnalyticsSuggestions);
  -[SearchDataProvider ensureTraitsHaveDefaultValues:](self, "ensureTraitsHaveDefaultValues:", v14);
  objc_storeStrong((id *)&self->_traits, a6);
  if (-[NSString length](self->_trimmedInputText, "length"))
  {
    -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", self->_trimmedInputText == 0);
    -[MKLocalSearchCompleter setSource:](self->_searchCompleter, "setSource:", v7);
    -[MKLocalSearchCompleter setRetainedSearchMetadata:](self->_searchCompleter, "setRetainedSearchMetadata:", self->_retainedSearchMetadata);
    if (self->_trimmedInputText)
      trimmedInputText = (const __CFString *)self->_trimmedInputText;
    else
      trimmedInputText = &stru_1011EB268;
    -[MKLocalSearchCompleter setQueryFragment:](self->_searchCompleter, "setQueryFragment:", trimmedInputText);
    -[MKLocalSearchCompleter _setTappedQuerySuggestionCompletion:](self->_searchCompleter, "_setTappedQuerySuggestionCompletion:", v13);
    if (objc_msgSend(v14, "hasMapRegion"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapRegion"));
      v36.origin.x = GEOMapRectForMapRegion(v27, v28);
      v37 = MKCoordinateRegionForMapRect(v36);
      -[MKLocalSearchCompleter setRegion:](self->_searchCompleter, "setRegion:", v37.center.latitude, v37.center.longitude, v37.span.latitudeDelta, v37.span.longitudeDelta);

    }
    if (objc_msgSend(v14, "hasMode"))
    {
      v29 = objc_msgSend(v14, "mode") - 1;
      if (v29 > 3)
        v30 = 103;
      else
        v30 = qword_100E34D90[v29];
      -[MKLocalSearchCompleter setMapType:](self->_searchCompleter, "setMapType:", v30);
    }
    if (objc_msgSend(v14, "hasTimeSinceMapViewportChanged"))
      -[MKLocalSearchCompleter setTimeSinceLastInBoundingRegion:](self->_searchCompleter, "setTimeSinceLastInBoundingRegion:", (double)objc_msgSend(v14, "timeSinceMapViewportChanged"));
    if (objc_msgSend(v14, "hasSequenceNumber"))
      self->_searchRequestAnalyticsSequenceNumber = objc_msgSend(v14, "sequenceNumber");
    -[MKLocalSearchCompleter setTraits:](self->_searchCompleter, "setTraits:", v14);
    if ((objc_msgSend(v14, "autocompleteOriginationEditingServerWaypoints") & 1) != 0)
    {
      -[PersonalizedItemManager removeItemSource:](self->_deduplicator, "removeItemSource:", self->_personalizedItemsFilter);
      objc_storeStrong((id *)&self->_autocompleteContext, self->_autocompleteInputContext);
      -[AutocompleteContext setDelegate:](self->_autocompleteContext, "setDelegate:", self);
      -[AutocompleteItemManager setAutocompleteContext:](self->_deduplicator, "setAutocompleteContext:", self->_autocompleteContext);
      -[SearchDataProvider setLocalCompletionsItemSource:](self, "setLocalCompletionsItemSource:", 0);
      -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 1);
    }
    else
    {
      -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 0);
      -[PersonalizedItemManager addItemSource:](self->_deduplicator, "addItemSource:", self->_personalizedItemsFilter);
      Integer = GEOConfigGetInteger(MapsConfig_AutocompleteShortQueryMaxLength, off_1014B3058);
      if ((Integer & 0x8000000000000000) != 0
        || -[NSString length](*p_trimmedInputText, "length") > Integer
        || -[NSString _navigation_isCJK](*p_trimmedInputText, "_navigation_isCJK"))
      {
        v33 = &MapsConfig_AutocompleteLocalBackfillForLongQuery;
      }
      else
      {
        v33 = &MapsConfig_AutocompleteLocalBackfillForShortQuery;
      }
      -[SearchBarSearchManager searchName:forSearchMode:backfill:context:originationType:](self->_localSearchManager, "searchName:forSearchMode:backfill:context:originationType:", self->_inputText, self->_searchMode, GEOConfigGetInteger(*v33, v33[1]), self->_autocompleteInputContext, objc_msgSend(v14, "autocompleteOriginationType"));
    }
    -[SearchDataProvider updateDeduper](self, "updateDeduper");
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKAutocompleteAnalyticsProvider captureNewMetrics](self->_autocompleteAnalyticsState, "captureNewMetrics"));
    objc_msgSend(v31, "submitWithStatus:", 4);

  }
LABEL_38:

}

- (void)updateAnalyticsStateWithContext:(id)a3 suggestionEntries:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryString"));
  v8 = (void *)v7;
  v9 = &stru_1011EB268;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "query"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queryTerms"));
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &__NSArray0__struct;
  v15 = v14;

  if (v17)
    v16 = v17;
  else
    v16 = &__NSArray0__struct;
  -[MKAutocompleteAnalyticsProvider updateStateWithQuery:queryTokens:visibleSuggestionEntries:](self->_autocompleteAnalyticsState, "updateStateWithQuery:queryTokens:visibleSuggestionEntries:", v10, v15, v16);

}

- (void)updateDeduper
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchDataProvider - Dedupe if necessary", buf, 2u);
  }

  if (-[SearchDataProvider _shouldShowResults](self, "_shouldShowResults"))
  {
    v5 = sub_10043222C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SearchDataProvider - Dedupe results", v7, 2u);
    }

    -[PersonalizedItemAutocompleteFilter setSearchString:](self->_personalizedItemsFilter, "setSearchString:", self->_trimmedInputText);
    -[AutocompleteItemManager setTraits:](self->_deduplicator, "setTraits:", self->_traits);
    -[PersonalizedItemManager setUpdatesPaused:](self->_deduplicator, "setUpdatesPaused:", 0);
  }
}

- (void)reset
{
  NSArray *sortedCombinedResults;
  NSArray *sections;
  NSString *inputText;
  AutocompleteContext *autocompleteInputContext;
  AutocompleteContext *autocompleteContext;
  NSArray *autocompleteAnalyticsSuggestions;

  -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 0);
  -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", 0);
  sortedCombinedResults = self->_sortedCombinedResults;
  self->_sortedCombinedResults = (NSArray *)&__NSArray0__struct;

  sections = self->_sections;
  self->_sections = (NSArray *)&__NSArray0__struct;

  inputText = self->_inputText;
  self->_inputText = 0;

  autocompleteInputContext = self->_autocompleteInputContext;
  self->_autocompleteInputContext = 0;

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = 0;

  autocompleteAnalyticsSuggestions = self->_autocompleteAnalyticsSuggestions;
  self->_autocompleteAnalyticsSuggestions = (NSArray *)&__NSArray0__struct;

  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  -[SearchDataProvider setServerCompletionsItemSource:](self, "setServerCompletionsItemSource:", 0);
  -[SearchDataProvider setLocalCompletionsItemSource:](self, "setLocalCompletionsItemSource:", 0);
  -[PersonalizedItemManager setClientRankingFunction:](self->_deduplicator, "setClientRankingFunction:", 0);
  -[AutocompleteItemManager setPriorityFunction:](self->_deduplicator, "setPriorityFunction:", 0);
  -[AutocompleteItemManager setCompletionSections:](self->_deduplicator, "setCompletionSections:", 0);
  -[AutocompleteItemManager setTopSectionIsQuerySuggestions:](self->_deduplicator, "setTopSectionIsQuerySuggestions:", 0);
  -[AutocompleteItemManager setShouldUseDistanceFeatureServerResults:](self->_deduplicator, "setShouldUseDistanceFeatureServerResults:", 0);
  -[AutocompleteItemManager setAutocompleteContext:](self->_deduplicator, "setAutocompleteContext:", 0);
  -[AutocompleteItemManager setTraits:](self->_deduplicator, "setTraits:", 0);
  self->_enableStructuredRAPAffordance = 0;
  -[SearchDataProvider setLastTicket:](self, "setLastTicket:", 0);
  -[SearchDataProvider updateAnalyticsStateWithContext:suggestionEntries:](self, "updateAnalyticsStateWithContext:suggestionEntries:", 0, &__NSArray0__struct);
}

- (void)setServerCompletionsItemSource:(id)a3
{
  AutocompleteItemSource *v5;
  AutocompleteItemSource *serverCompletionsItemSource;
  AutocompleteItemSource *v7;

  v5 = (AutocompleteItemSource *)a3;
  serverCompletionsItemSource = self->_serverCompletionsItemSource;
  v7 = v5;
  if (serverCompletionsItemSource != v5)
  {
    if (serverCompletionsItemSource)
      -[PersonalizedItemManager removeItemSource:](self->_deduplicator, "removeItemSource:");
    objc_storeStrong((id *)&self->_serverCompletionsItemSource, a3);
    if (self->_serverCompletionsItemSource)
      -[PersonalizedItemManager addItemSource:](self->_deduplicator, "addItemSource:");
  }

}

- (void)setLocalCompletionsItemSource:(id)a3
{
  AutocompleteItemSource *v5;
  AutocompleteItemSource *localCompletionsItemSource;
  AutocompleteItemSource *v7;

  v5 = (AutocompleteItemSource *)a3;
  localCompletionsItemSource = self->_localCompletionsItemSource;
  v7 = v5;
  if (localCompletionsItemSource != v5)
  {
    if (localCompletionsItemSource)
      -[PersonalizedItemManager removeItemSource:](self->_deduplicator, "removeItemSource:");
    objc_storeStrong((id *)&self->_localCompletionsItemSource, a3);
    if (self->_localCompletionsItemSource)
      -[PersonalizedItemManager addItemSource:](self->_deduplicator, "addItemSource:");
  }

}

- (double)retainSearchTime
{
  return self->_lastTicketRetainSearchTime;
}

- (void)ensureTraitsHaveDefaultValues:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (!objc_msgSend(v3, "supportedAutocompleteResultCellTypesCount"))
  {
    objc_msgSend(v3, "addSupportedAutocompleteResultCellType:", 0);
    objc_msgSend(v3, "addSupportedAutocompleteResultCellType:", 3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedTraitsForCurrentGarageState:", v3));

}

- (BOOL)shouldShowRapCellWithResultsCount:(unint64_t)a3
{
  unsigned int IsEnabled_RAPSydney;

  IsEnabled_RAPSydney = _MKRAPIsAvailable(self);
  if (IsEnabled_RAPSydney)
  {
    IsEnabled_RAPSydney = -[SearchDataProvider shouldEnableRAPIfAvailable](self, "shouldEnableRAPIfAvailable");
    if (IsEnabled_RAPSydney)
    {
      IsEnabled_RAPSydney = MapsFeature_IsEnabled_RAPSydney();
      if (IsEnabled_RAPSydney)
      {
        LOBYTE(IsEnabled_RAPSydney) = -[SearchDataProvider enableStructuredRAPAffordance](self, "enableStructuredRAPAffordance");
        if (!a3)
          LOBYTE(IsEnabled_RAPSydney) = 0;
      }
    }
  }
  return IsEnabled_RAPSydney;
}

- (void)receivedSearchResults:(id)a3 forContext:(id)a4
{
  id v6;
  NSString *inputText;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  inputText = self->_inputText;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryString"));
  LODWORD(inputText) = -[NSString isEqualToString:](inputText, "isEqualToString:", v8);

  if ((_DWORD)inputText)
  {
    -[AutocompleteContext setDelegate:](self->_autocompleteContext, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_autocompleteContext, a4);
    -[AutocompleteContext setDelegate:](self->_autocompleteContext, "setDelegate:", self);
    -[AutocompleteItemManager setAutocompleteContext:](self->_deduplicator, "setAutocompleteContext:", self->_autocompleteContext);
    -[SearchDataProvider setFinishedLocalCompletions:](self, "setFinishedLocalCompletions:", 1);
    -[SearchDataProvider setLocalCompletionsItemSource:](self, "setLocalCompletionsItemSource:", v9);
    -[SearchDataProvider updateDeduper](self, "updateDeduper");
  }

}

- (void)completer:(id)a3 didUpdateResultsWithSections:(id)a4 forQueryFragment:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSString *inputText;
  const char *v14;
  uint64_t Log;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  AutocompleteItemManager **p_deduplicator;
  id v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  AutocompleteItemSource *v32;
  void *v33;
  _TtC4Maps20PlaceSummaryMetadata *v34;
  _TtC4Maps20PlaceSummaryMetadata *placeSummaryMetadata;
  GEOAutocompleteSessionData *v36;
  GEOAutocompleteSessionData *recentAutocompleteSessionData;
  unsigned __int8 v38;
  int v39;
  NSString *v40;
  __int16 v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (GEOConfigGetBOOL(MapsConfig_ShowOutOfDateACResultsWhileTyping, off_1014B33A8))
  {
    if (!v10 || !-[NSString hasPrefix:](self->_inputText, "hasPrefix:", v10))
    {
      v11 = sub_10043222C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        inputText = self->_inputText;
        v39 = 138412546;
        v40 = inputText;
        v41 = 2112;
        v42 = v10;
        v14 = "SearchDataProvider - Not showing results as they are too old. input text: %@, query: %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v39, 0x16u);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
LABEL_7:
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "SearchDataProvider");
    v16 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
      v39 = 134217984;
      v40 = (NSString *)objc_msgSend(v17, "count");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MKLocalSearchCompleter didUpdateResults: with %lu result(s)", (uint8_t *)&v39, 0xCu);

    }
    -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
    if (objc_msgSend(v18, "count") || self->_contentUpdatedOnNoResults)
    {

    }
    else
    {
      v38 = objc_msgSend(v8, "_shouldDisplayNoResults");

      if ((v38 & 1) == 0)
        goto LABEL_27;
    }
    v19 = objc_alloc((Class)NSMutableArray);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
    v12 = objc_msgSend(v19, "initWithArray:", v20);

    if (self->_searchMode == 2)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011AFB30));
      -[NSObject filterUsingPredicate:](v12, "filterUsingPredicate:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_clientRankingModel"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_clientRankingModel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemClientRankingFunction clientRankingFunctionForGEOClientRankingModel:](PersonalizedItemClientRankingFunction, "clientRankingFunctionForGEOClientRankingModel:", v23));
      p_deduplicator = &self->_deduplicator;
      -[PersonalizedItemManager setClientRankingFunction:](self->_deduplicator, "setClientRankingFunction:", v24);

    }
    else
    {
      p_deduplicator = &self->_deduplicator;
      -[PersonalizedItemManager setClientRankingFunction:](self->_deduplicator, "setClientRankingFunction:", 0);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_sortPriorityMapping"));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_sortPriorityMapping"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction priorityFunctionForGEOSortPriorityMapping:](PersonalizedItemPriorityFunction, "priorityFunctionForGEOSortPriorityMapping:", v29));
      -[AutocompleteItemManager setPriorityFunction:](*p_deduplicator, "setPriorityFunction:", v30);

    }
    else
    {
      -[AutocompleteItemManager setPriorityFunction:](*p_deduplicator, "setPriorityFunction:", 0);
    }

    v31 = objc_msgSend(v9, "copy");
    -[AutocompleteItemManager setCompletionSections:](self->_deduplicator, "setCompletionSections:", v31);

    -[AutocompleteItemManager setTopSectionIsQuerySuggestions:](self->_deduplicator, "setTopSectionIsQuerySuggestions:", objc_msgSend(v8, "_autocompleteTopSectionIsQuerySuggestions"));
    -[AutocompleteItemManager setShouldUseDistanceFeatureServerResults:](self->_deduplicator, "setShouldUseDistanceFeatureServerResults:", objc_msgSend(v8, "_shouldUseDistanceFeatureServerResults"));
    v32 = -[AutocompleteItemSource initWithServerCompletions:serverSections:]([AutocompleteItemSource alloc], "initWithServerCompletions:serverSections:", v12, v9);
    -[SearchDataProvider setServerCompletionsItemSource:](self, "setServerCompletionsItemSource:", v32);

    self->_showAutocompleteClientSource = objc_msgSend(v8, "_showAutocompleteClientSource");
    self->_hasShowAutocompleteClientSource = 1;
    self->_shouldEnableRAPForNoResults = objc_msgSend(v8, "_shouldEnableRAPForNoResults");
    self->_shouldEnableGrayscaleHighlighting = objc_msgSend(v8, "_shouldEnableGrayscaleHighlighting");
    self->_highlightType = (int64_t)objc_msgSend(v8, "_highlightType");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeSummaryLayoutMetadata"));
    if (v33)
    {
      v34 = -[PlaceSummaryMetadata initWithMetadata:]([_TtC4Maps20PlaceSummaryMetadata alloc], "initWithMetadata:", v33);
      placeSummaryMetadata = self->_placeSummaryMetadata;
      self->_placeSummaryMetadata = v34;

    }
    self->_enableStructuredRAPAffordance = objc_msgSend(v8, "_enableStructuredRAPAffordance");
    v36 = (GEOAutocompleteSessionData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_recentAutocompleteSessionData"));
    recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
    self->_recentAutocompleteSessionData = v36;

    -[SearchDataProvider updateDeduper](self, "updateDeduper");
    goto LABEL_26;
  }
  if (-[NSString isEqualToString:](self->_inputText, "isEqualToString:", v10))
    goto LABEL_7;
  v26 = sub_10043222C();
  v12 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v27 = self->_inputText;
    v39 = 138412546;
    v40 = v27;
    v41 = 2112;
    v42 = v10;
    v14 = "SearchDataProvider - Not showing results due to text mismatch. input text: %@, query: %@";
    goto LABEL_18;
  }
LABEL_26:

LABEL_27:
}

- (void)completer:(id)a3 didFailWithError:(id)a4 forQueryFragment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t Log;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  if (objc_msgSend(v11, "isEqualToString:", MKErrorDomain))
  {
    v12 = objc_msgSend(v9, "code");

    if (v12 == (id)3)
    {
      -[SearchDataProvider _completerWasThrottled:queryFragment:](self, "_completerWasThrottled:queryFragment:", v8, v10);
      goto LABEL_8;
    }
  }
  else
  {

  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "SearchDataProvider");
  v14 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    v16 = 138412290;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "MKLocalSearchCompleter didFailWithError: %@", (uint8_t *)&v16, 0xCu);

  }
  -[SearchDataProvider setFinishedServerCompletions:](self, "setFinishedServerCompletions:", 1);
  -[SearchDataProvider setServerCompletionsItemSource:](self, "setServerCompletionsItemSource:", 0);
  *(_WORD *)&self->_showAutocompleteClientSource = 0;
  self->_shouldEnableRAPForNoResults = 0;
  self->_shouldEnableGrayscaleHighlighting = 0;
  -[PersonalizedItemManager setClientRankingFunction:](self->_deduplicator, "setClientRankingFunction:", 0);
  -[AutocompleteItemManager setPriorityFunction:](self->_deduplicator, "setPriorityFunction:", 0);
  -[AutocompleteItemManager setCompletionSections:](self->_deduplicator, "setCompletionSections:", 0);
  -[AutocompleteItemManager setTopSectionIsQuerySuggestions:](self->_deduplicator, "setTopSectionIsQuerySuggestions:", 0);
  -[AutocompleteItemManager setShouldUseDistanceFeatureServerResults:](self->_deduplicator, "setShouldUseDistanceFeatureServerResults:", 0);
  self->_enableStructuredRAPAffordance = 0;
  self->_lastTicketRetainSearchTime = 0.0;
LABEL_8:

}

- (void)_completerWasThrottled:(id)a3 queryFragment:(id)a4
{
  id v6;
  id v7;
  uint64_t Log;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "SearchDataProvider");
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MKLocalSearchCompleter was throttled", v10, 2u);
  }

  if ((objc_opt_respondsToSelector(self, "completerDidUpdateResults:") & 1) != 0)
    -[SearchDataProvider completerDidUpdateResults:](self, "completerDidUpdateResults:", v6);
  if ((objc_opt_respondsToSelector(self, "completer:didUpdateResultsWithSections:forQueryFragment:") & 1) != 0)
    -[SearchDataProvider completer:didUpdateResultsWithSections:forQueryFragment:](self, "completer:didUpdateResultsWithSections:forQueryFragment:", v6, &__NSArray0__struct, v7);

}

- (void)clearMKLocalSearchCompleterQueryState
{
  -[MKLocalSearchCompleter clearQueryState](self->_searchCompleter, "clearQueryState");
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  -[SearchDataProvider _processNewAutocompleteItems:itemGroups:](self, "_processNewAutocompleteItems:itemGroups:", a4, a5);
}

- (void)_processNewAutocompleteItems:(id)a3 itemGroups:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = sub_10043222C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SearchDataProvider - process new AC list", buf, 2u);
  }

  v10 = -[SearchDataProvider exclusiveIncrementAutocompleteChangeCounter](self, "exclusiveIncrementAutocompleteChangeCounter");
  global_queue = dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002B5B44;
  v15[3] = &unk_1011AE330;
  v18 = v10;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, v15);

}

- (NSArray)sections
{
  return self->_sections;
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return self->_userLocationSearchResult;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSearchMetadata, a3);
}

- (BOOL)lastRequestIsRetainQuery
{
  return self->_lastRequestIsRetainQuery;
}

- (PersonalizedItemManager)mapPersonalizedItems
{
  return self->_mapPersonalizedItems;
}

- (GEOMapServiceCompletionTicket)lastTicket
{
  return self->_lastTicket;
}

- (unsigned)searchRequestAnalyticsSequenceNumber
{
  return self->_searchRequestAnalyticsSequenceNumber;
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (AutocompleteContext)autocompleteInputContext
{
  return self->_autocompleteInputContext;
}

- (BOOL)showAutocompleteClientSource
{
  return self->_showAutocompleteClientSource;
}

- (BOOL)hasShowAutocompleteClientSource
{
  return self->_hasShowAutocompleteClientSource;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (GEOAutocompleteSessionData)_recentAutocompleteSessionData
{
  return self->_recentAutocompleteSessionData;
}

- (SearchDataProviderDelegate)delegate
{
  return (SearchDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldEnableRAPIfAvailable
{
  return self->_enableRAPIfAvailable;
}

- (void)setEnableRAPIfAvailable:(BOOL)a3
{
  self->_enableRAPIfAvailable = a3;
}

- (BOOL)isContentUpdatedOnNoResults
{
  return self->_contentUpdatedOnNoResults;
}

- (void)setContentUpdatedOnNoResults:(BOOL)a3
{
  self->_contentUpdatedOnNoResults = a3;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (int64_t)highlightType
{
  return self->_highlightType;
}

- (BOOL)shouldEnableRAPForNoResults
{
  return self->_shouldEnableRAPForNoResults;
}

- (AutocompleteItemSource)serverCompletionsItemSource
{
  return self->_serverCompletionsItemSource;
}

- (AutocompleteItemSource)localCompletionsItemSource
{
  return self->_localCompletionsItemSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_lastTicket, 0);
  objc_storeStrong((id *)&self->_mapPersonalizedItems, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_userLocationSearchResult, 0);
  objc_storeStrong((id *)&self->_autocompleteAnalyticsSuggestions, 0);
  objc_storeStrong((id *)&self->_autocompleteAnalyticsState, 0);
  objc_storeStrong((id *)&self->_personalizedItemsFilter, 0);
  objc_storeStrong((id *)&self->_autocompleteContext, 0);
  objc_storeStrong((id *)&self->_sortedCombinedResults, 0);
  objc_storeStrong((id *)&self->_localCompletionsItemSource, 0);
  objc_storeStrong((id *)&self->_serverCompletionsItemSource, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_localSearchManager, 0);
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_autocompleteInputContext, 0);
  objc_storeStrong((id *)&self->_trimmedInputText, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
