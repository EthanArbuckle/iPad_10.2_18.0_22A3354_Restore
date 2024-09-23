@implementation PXSearchCPAnalyticsSession

- (PXSearchCPAnalyticsSession)initWithBeginType:(unint64_t)a3
{
  PXSearchCPAnalyticsSession *v4;
  PXSearchCPAnalyticsSession *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSearchCPAnalyticsSession;
  v4 = -[PXSearchCPAnalyticsSession init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_beginType = a3;
    v4->_isValid = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    v5->_startTime = v7;

  }
  return v5;
}

- (void)endAndInvalidateSession
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v28;
  void *v29;
  _QWORD v30[20];
  _QWORD v31[22];

  v31[20] = *MEMORY[0x1E0C80C00];
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    v5 = v4;

    +[PXSearchCPAnalyticsSession _stringForSessionBeginType:](PXSearchCPAnalyticsSession, "_stringForSessionBeginType:", -[PXSearchCPAnalyticsSession beginType](self, "beginType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalFirstOneUpInTopAssets](self, "timeIntervalFirstOneUpInTopAssets");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 != 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalFirstEnteredCollection](self, "timeIntervalFirstEnteredCollection");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 != 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _stringForResultType:](PXSearchCPAnalyticsSession, "_stringForResultType:", -[PXSearchCPAnalyticsSession firstEnteredCollectionResultType](self, "firstEnteredCollectionResultType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesUntilFirstSuccess](self, "numberOfSearchesUntilFirstSuccess"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesUntilFirstAssetAction](self, "numberOfSearchesUntilFirstAssetAction"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesUntilFirstOneUpInTopAssets](self, "numberOfSearchesUntilFirstOneUpInTopAssets"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesUntilFirstEnteredCollection](self, "numberOfSearchesUntilFirstEnteredCollection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesWithNoResults](self, "numberOfSearchesWithNoResults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfSearchesWithWordEmbeddings](self, "numberOfSearchesWithWordEmbeddings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfWordEmbeddingSelections](self, "numberOfWordEmbeddingSelections"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfNextTokenSelections](self, "numberOfNextTokenSelections"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchCPAnalyticsSession _cappedSearchCount:](PXSearchCPAnalyticsSession, "_cappedSearchCount:", -[PXSearchCPAnalyticsSession numberOfCompletionSelections](self, "numberOfCompletionSelections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession startTime](self, "startTime");
    +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:", v5 - v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalSuccess](self, "timeIntervalSuccess");
    +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalFirstAssetAction](self, "timeIntervalFirstAssetAction");
    +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalFirstOneUpInTopAssets](self, "timeIntervalFirstOneUpInTopAssets");
    +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchCPAnalyticsSession timeIntervalFirstEnteredCollection](self, "timeIntervalFirstEnteredCollection");
    +[PXSearchCPAnalyticsSession _bucketedTimeInterval:](PXSearchCPAnalyticsSession, "_bucketedTimeInterval:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXSearchCPAnalyticsSession successful](self, "successful"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("beginType");
    v30[1] = CFSTR("oneUpInTopAssets");
    v31[0] = v20;
    v31[1] = v29;
    v30[2] = CFSTR("enterCollectionResult");
    v30[3] = CFSTR("firstEnteredCollectionType");
    v31[2] = v28;
    v31[3] = v27;
    v30[4] = CFSTR("searchCount");
    v30[5] = CFSTR("searchCountUntilFirstSuccess");
    v31[4] = v26;
    v31[5] = v19;
    v30[6] = CFSTR("searchCountUntilFirstAssetAction");
    v30[7] = CFSTR("searchCountUntilFirstOneUpTopAssets");
    v31[6] = v25;
    v31[7] = v24;
    v30[8] = CFSTR("searchCountUntilFirstEnteredCollection");
    v30[9] = CFSTR("searchesWithNoResultsCount");
    v31[8] = v23;
    v31[9] = v22;
    v30[10] = CFSTR("searchesWithWordEmbeddingsCount");
    v30[11] = CFSTR("wordEmbeddingSelectionCount");
    v31[10] = v21;
    v31[11] = v18;
    v30[12] = CFSTR("nextTokenSelectionCount");
    v30[13] = CFSTR("completionSelectionCount");
    v31[12] = v17;
    v31[13] = v8;
    v30[14] = CFSTR("timeInterval");
    v30[15] = CFSTR("timeIntervalUntilSuccess");
    v31[14] = v10;
    v31[15] = v13;
    v30[16] = CFSTR("timeIntervalUntilFirstAssetInteraction");
    v30[17] = CFSTR("timeIntervalUntilFirstOneUpInTopAssets");
    v31[16] = v16;
    v31[17] = v15;
    v30[18] = CFSTR("timeIntervalUntilFirstEnteredCollection");
    v30[19] = CFSTR("success");
    v31[18] = v14;
    v31[19] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.search.session"), v12);
    -[PXSearchCPAnalyticsSession setIsValid:](self, "setIsValid:", 0);

  }
}

- (void)logSearch:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    -[PXSearchCPAnalyticsSession lastSearch](self, "lastSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_msgSend(v7, "copy");
      -[PXSearchCPAnalyticsSession setLastSearch:](self, "setLastSearch:", v6);

      -[PXSearchCPAnalyticsSession setNumberOfSearches:](self, "setNumberOfSearches:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches") + 1);
    }
  }

}

- (void)logActiveSearch:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    -[PXSearchCPAnalyticsSession lastActiveSearch](self, "lastActiveSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_msgSend(v7, "copy");
      -[PXSearchCPAnalyticsSession setLastActiveSearch:](self, "setLastActiveSearch:", v6);

      -[PXSearchCPAnalyticsSession setNumberOfSearches:](self, "setNumberOfSearches:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches") + 1);
    }
  }

}

- (void)logAssetAction:(unint64_t)a3 inResult:(unint64_t)a4
{
  double v7;
  void *v8;

  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    -[PXSearchCPAnalyticsSession timeIntervalFirstAssetAction](self, "timeIntervalFirstAssetAction");
    if (v7 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemUptime");
      -[PXSearchCPAnalyticsSession setTimeIntervalFirstAssetAction:](self, "setTimeIntervalFirstAssetAction:");

      -[PXSearchCPAnalyticsSession setNumberOfSearchesUntilFirstAssetAction:](self, "setNumberOfSearchesUntilFirstAssetAction:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches"));
      -[PXSearchCPAnalyticsSession _logSuccess](self, "_logSuccess");
    }
    if (!-[PXSearchCPAnalyticsSession firstAssetActionType](self, "firstAssetActionType"))
      -[PXSearchCPAnalyticsSession setFirstAssetActionType:](self, "setFirstAssetActionType:", a3);
    if (!-[PXSearchCPAnalyticsSession firstAssetActionResultType](self, "firstAssetActionResultType"))
      -[PXSearchCPAnalyticsSession setFirstAssetActionResultType:](self, "setFirstAssetActionResultType:", a4);
  }
}

- (void)logOneUpInTopAssets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    v5 = v4;

    -[PXSearchCPAnalyticsSession startTime](self, "startTime");
    v7 = v6;
    -[PXSearchCPAnalyticsSession timeIntervalFirstOneUpInTopAssets](self, "timeIntervalFirstOneUpInTopAssets");
    if (v8 == 0.0)
    {
      -[PXSearchCPAnalyticsSession setTimeIntervalFirstOneUpInTopAssets:](self, "setTimeIntervalFirstOneUpInTopAssets:", v5 - v7);
      -[PXSearchCPAnalyticsSession setNumberOfSearchesUntilFirstOneUpInTopAssets:](self, "setNumberOfSearchesUntilFirstOneUpInTopAssets:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches"));
      -[PXSearchCPAnalyticsSession _logSuccess](self, "_logSuccess");
    }
  }
}

- (void)logEnteredCollectionResult:(unint64_t)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    -[PXSearchCPAnalyticsSession timeIntervalFirstEnteredCollection](self, "timeIntervalFirstEnteredCollection");
    if (v5 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "systemUptime");
      v8 = v7;

      -[PXSearchCPAnalyticsSession startTime](self, "startTime");
      -[PXSearchCPAnalyticsSession setTimeIntervalFirstEnteredCollection:](self, "setTimeIntervalFirstEnteredCollection:", v8 - v9);
      -[PXSearchCPAnalyticsSession setNumberOfSearchesUntilFirstEnteredCollection:](self, "setNumberOfSearchesUntilFirstEnteredCollection:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches"));
      -[PXSearchCPAnalyticsSession setFirstEnteredCollectionResultType:](self, "setFirstEnteredCollectionResultType:", a3);
      -[PXSearchCPAnalyticsSession _logSuccess](self, "_logSuccess");
    }
  }
}

- (void)logNoSearchResultsFound
{
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
    -[PXSearchCPAnalyticsSession setNumberOfSearchesWithNoResults:](self, "setNumberOfSearchesWithNoResults:", -[PXSearchCPAnalyticsSession numberOfSearchesWithNoResults](self, "numberOfSearchesWithNoResults") + 1);
}

- (void)logSearchWordEmbeddingsPresented
{
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
    -[PXSearchCPAnalyticsSession setNumberOfSearchesWithWordEmbeddings:](self, "setNumberOfSearchesWithWordEmbeddings:", -[PXSearchCPAnalyticsSession numberOfSearchesWithWordEmbeddings](self, "numberOfSearchesWithWordEmbeddings") + 1);
}

- (void)logSearchWordEmbeddingSelected
{
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
    -[PXSearchCPAnalyticsSession setNumberOfWordEmbeddingSelections:](self, "setNumberOfWordEmbeddingSelections:", -[PXSearchCPAnalyticsSession numberOfWordEmbeddingSelections](self, "numberOfWordEmbeddingSelections") + 1);
}

- (void)logSearchNextTokenSuggestionTapped
{
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
    -[PXSearchCPAnalyticsSession setNumberOfNextTokenSelections:](self, "setNumberOfNextTokenSelections:", -[PXSearchCPAnalyticsSession numberOfNextTokenSelections](self, "numberOfNextTokenSelections") + 1);
}

- (void)logSearchWordCompletionTapped
{
  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
    -[PXSearchCPAnalyticsSession setNumberOfCompletionSelections:](self, "setNumberOfCompletionSelections:", -[PXSearchCPAnalyticsSession numberOfCompletionSelections](self, "numberOfCompletionSelections") + 1);
}

- (void)_logSuccess
{
  void *v3;
  double v4;
  double v5;
  double v6;

  if (-[PXSearchCPAnalyticsSession isValid](self, "isValid"))
  {
    if (!-[PXSearchCPAnalyticsSession successful](self, "successful"))
    {
      -[PXSearchCPAnalyticsSession setSuccessful:](self, "setSuccessful:", 1);
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "systemUptime");
      v5 = v4;

      -[PXSearchCPAnalyticsSession startTime](self, "startTime");
      -[PXSearchCPAnalyticsSession setTimeIntervalSuccess:](self, "setTimeIntervalSuccess:", v5 - v6);
      -[PXSearchCPAnalyticsSession setNumberOfSearchesUntilFirstSuccess:](self, "setNumberOfSearchesUntilFirstSuccess:", -[PXSearchCPAnalyticsSession numberOfSearches](self, "numberOfSearches"));
    }
  }
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)userInteractedWithCurrentSearch
{
  return self->_userInteractedWithCurrentSearch;
}

- (void)setUserInteractedWithCurrentSearch:(BOOL)a3
{
  self->_userInteractedWithCurrentSearch = a3;
}

- (unint64_t)beginType
{
  return self->_beginType;
}

- (void)setBeginType:(unint64_t)a3
{
  self->_beginType = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)timeIntervalSuccess
{
  return self->_timeIntervalSuccess;
}

- (void)setTimeIntervalSuccess:(double)a3
{
  self->_timeIntervalSuccess = a3;
}

- (double)timeIntervalFirstAssetAction
{
  return self->_timeIntervalFirstAssetAction;
}

- (void)setTimeIntervalFirstAssetAction:(double)a3
{
  self->_timeIntervalFirstAssetAction = a3;
}

- (double)timeIntervalFirstOneUpInTopAssets
{
  return self->_timeIntervalFirstOneUpInTopAssets;
}

- (void)setTimeIntervalFirstOneUpInTopAssets:(double)a3
{
  self->_timeIntervalFirstOneUpInTopAssets = a3;
}

- (double)timeIntervalFirstEnteredCollection
{
  return self->_timeIntervalFirstEnteredCollection;
}

- (void)setTimeIntervalFirstEnteredCollection:(double)a3
{
  self->_timeIntervalFirstEnteredCollection = a3;
}

- (unint64_t)numberOfSearches
{
  return self->_numberOfSearches;
}

- (void)setNumberOfSearches:(unint64_t)a3
{
  self->_numberOfSearches = a3;
}

- (unint64_t)numberOfSearchesUntilFirstSuccess
{
  return self->_numberOfSearchesUntilFirstSuccess;
}

- (void)setNumberOfSearchesUntilFirstSuccess:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstSuccess = a3;
}

- (unint64_t)numberOfSearchesUntilFirstAssetAction
{
  return self->_numberOfSearchesUntilFirstAssetAction;
}

- (void)setNumberOfSearchesUntilFirstAssetAction:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstAssetAction = a3;
}

- (unint64_t)numberOfSearchesUntilFirstOneUpInTopAssets
{
  return self->_numberOfSearchesUntilFirstOneUpInTopAssets;
}

- (void)setNumberOfSearchesUntilFirstOneUpInTopAssets:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstOneUpInTopAssets = a3;
}

- (unint64_t)numberOfSearchesUntilFirstEnteredCollection
{
  return self->_numberOfSearchesUntilFirstEnteredCollection;
}

- (void)setNumberOfSearchesUntilFirstEnteredCollection:(unint64_t)a3
{
  self->_numberOfSearchesUntilFirstEnteredCollection = a3;
}

- (unint64_t)numberOfSearchesWithNoResults
{
  return self->_numberOfSearchesWithNoResults;
}

- (void)setNumberOfSearchesWithNoResults:(unint64_t)a3
{
  self->_numberOfSearchesWithNoResults = a3;
}

- (unint64_t)numberOfSearchesWithWordEmbeddings
{
  return self->_numberOfSearchesWithWordEmbeddings;
}

- (void)setNumberOfSearchesWithWordEmbeddings:(unint64_t)a3
{
  self->_numberOfSearchesWithWordEmbeddings = a3;
}

- (unint64_t)numberOfWordEmbeddingSelections
{
  return self->_numberOfWordEmbeddingSelections;
}

- (void)setNumberOfWordEmbeddingSelections:(unint64_t)a3
{
  self->_numberOfWordEmbeddingSelections = a3;
}

- (unint64_t)numberOfNextTokenSelections
{
  return self->_numberOfNextTokenSelections;
}

- (void)setNumberOfNextTokenSelections:(unint64_t)a3
{
  self->_numberOfNextTokenSelections = a3;
}

- (unint64_t)numberOfCompletionSelections
{
  return self->_numberOfCompletionSelections;
}

- (void)setNumberOfCompletionSelections:(unint64_t)a3
{
  self->_numberOfCompletionSelections = a3;
}

- (unint64_t)firstAssetActionType
{
  return self->_firstAssetActionType;
}

- (void)setFirstAssetActionType:(unint64_t)a3
{
  self->_firstAssetActionType = a3;
}

- (unint64_t)firstAssetActionResultType
{
  return self->_firstAssetActionResultType;
}

- (void)setFirstAssetActionResultType:(unint64_t)a3
{
  self->_firstAssetActionResultType = a3;
}

- (unint64_t)firstEnteredCollectionResultType
{
  return self->_firstEnteredCollectionResultType;
}

- (void)setFirstEnteredCollectionResultType:(unint64_t)a3
{
  self->_firstEnteredCollectionResultType = a3;
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (PXSearchQuery)lastSearch
{
  return self->_lastSearch;
}

- (void)setLastSearch:(id)a3
{
  objc_storeStrong((id *)&self->_lastSearch, a3);
}

- (PXSearchActiveSearch)lastActiveSearch
{
  return self->_lastActiveSearch;
}

- (void)setLastActiveSearch:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveSearch, 0);
  objc_storeStrong((id *)&self->_lastSearch, 0);
}

+ (id)_stringForSessionBeginType:(unint64_t)a3
{
  if (a3 - 1 > 9)
    return CFSTR("none");
  else
    return off_1E5128FC0[a3 - 1];
}

+ (id)_stringForActionType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("none");
  else
    return off_1E5129010[a3 - 1];
}

+ (id)_stringForResultType:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("none");
  else
    return off_1E5129030[a3 - 1];
}

+ (id)_bucketedTimeInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = &unk_1E53ED5A8;
  v4 = &unk_1E53ED5C0;
  v5 = &unk_1E53ED5D8;
  v6 = &unk_1E53ED608;
  if (a3 < 60.0)
    v6 = &unk_1E53ED5F0;
  if (a3 >= 30.0)
    v5 = v6;
  if (a3 >= 10.0)
    v4 = v5;
  if (a3 >= 5.0)
    v3 = v4;
  if (a3 == 0.0)
    return &unk_1E53ED590;
  else
    return v3;
}

+ (id)_cappedSearchCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 <= 0x1E)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E53ED620;
  }
  return v5;
}

@end
