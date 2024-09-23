@implementation SPKQuery

- (BOOL)needsIO
{
  return 0;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

+ (unsigned)searchDomain
{
  return 12;
}

- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4
{
  return -[SPKQuery initWithUserQuery:queryGroupId:options:queryContext:](self, "initWithUserQuery:queryGroupId:options:queryContext:", a3, a4, 0, 0);
}

- (SPKQuery)initWithUserQuery:(id)a3
{
  return -[SPKQuery initWithUserQuery:options:](self, "initWithUserQuery:options:", a3, 0);
}

- (SPKQuery)initWithUserQuery:(id)a3 options:(unint64_t)a4
{
  return -[SPKQuery initWithUserQuery:queryGroupId:options:queryContext:](self, "initWithUserQuery:queryGroupId:options:queryContext:", a3, 0, 0, 0);
}

- (SPKQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  id v11;
  id v12;
  SPKQuery *v13;
  SPKQuery *v14;
  void *v15;
  uint64_t v16;
  NSString *trimmedUserQueryString;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SPKQuery;
  v13 = -[SPKQuery init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_queryId = ++gQueryId;
    v13->_queryGroupId = a4;
    objc_storeStrong((id *)&v13->_userQueryString, a3);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    trimmedUserQueryString = v14->_trimmedUserQueryString;
    v14->_trimmedUserQueryString = (NSString *)v16;

    v14->_queryOptions = a5;
    v14->_queryStartTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v14->_queryContext, a6);
    v14->_wantsSuggestions = objc_msgSend(v12, "queryKind") == 2;
    v14->_queryState = 0;
  }

  return v14;
}

- (int)getQueryStatePtr
{
  return &self->_queryState;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPKQuery queryId](self, "queryId");
  v7 = -[SPKQuery queryState](self, "queryState");
  if (v7 > 6)
    v8 = CFSTR("unknown state");
  else
    v8 = off_1E6E42E40[v7];
  -[SPKQuery userQueryString](self, "userQueryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSRedactString(v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@>[%p] (%lu:%@ - %@)"), v5, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)unmodifiedUserQueryString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SPKQuery internalUnmodifiedUserQueryString](self, "internalUnmodifiedUserQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (id)responseHandler
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SPKQuery_responseHandler__block_invoke;
  v5[3] = &unk_1E6E42E20;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = (void *)MEMORY[0x1BCCB38DC](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __27__SPKQuery_responseHandler__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained || (objc_msgSend(WeakRetained, "isCanceled") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v14, "userQueryString");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "userQueryString");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "userQueryString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userQueryString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
      {
        v13 = objc_msgSend(v14, "isRewrite");

        if ((v13 & 1) == 0)
          goto LABEL_14;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  v11 = objc_msgSend(v14, "kind");
  if (v11)
  {
    if (v11 == 6 || v11 == 4)
      objc_msgSend(v4, "_queryDidComplete");
  }
  else
  {
    objc_msgSend(v4, "setQueryState:", 6);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryTask:gotResponse:", *(_QWORD *)(a1 + 32), v14);

LABEL_14:
}

- (NSArray)childQueries
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_childQueries, "copy");
}

- (void)addChildQuery:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *childQueries;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_childQueries)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    childQueries = self->_childQueries;
    self->_childQueries = v5;

    v4 = v7;
  }
  objc_msgSend(v4, "setParentQuery:", self);
  -[NSMutableArray addObject:](self->_childQueries, "addObject:", v7);

}

- (BOOL)isStarted
{
  return -[SPKQuery queryState](self, "queryState") != 0;
}

- (BOOL)isCompleted
{
  return -[SPKQuery queryState](self, "queryState") == 4;
}

- (BOOL)isCanceled
{
  return -[SPKQuery queryState](self, "queryState") == 5;
}

- (BOOL)isFinished
{
  return -[SPKQuery queryState](self, "queryState") > 3;
}

- (BOOL)completedGather
{
  return -[SPKQuery queryState](self, "queryState") > 2;
}

- (BOOL)shouldReturnEarly
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  -[SPKQuery queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend((id)objc_opt_class(), "searchDomain");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "containsObject:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)sendEmptyResponseIfNecessary
{
  void *v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  SPKResponse *v8;
  void (**v9)(_QWORD, _QWORD);

  if (-[SPKQuery shouldReturnEarly](self, "shouldReturnEarly"))
    goto LABEL_9;
  -[SPKQuery userQueryString](self, "userQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v4, "UTF8String"))
    {
      v5 = -[NSString length](self->_trimmedUserQueryString, "length");

      if (!v5)
        goto LABEL_9;
      return 0;
    }

  }
  else
  {
    v6 = -[NSString length](self->_trimmedUserQueryString, "length");

    if (v6)
      return 0;
  }
LABEL_9:
  v8 = -[SPKResponse initWithQueryID:sections:]([SPKResponse alloc], "initWithQueryID:sections:", -[SPKQuery queryGroupId](self, "queryGroupId"), 0);
  -[SPKQuery responseHandler](self, "responseHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, SPKResponse *))v9)[2](v9, v8);

  return 1;
}

- (void)start
{
  if (!-[SPKQuery isStarted](self, "isStarted"))
    -[SPKQuery _queryWillStart](self, "_queryWillStart");
}

- (void)cancel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SPKQuery setQueryState:](self, "setQueryState:", 5);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SPKQuery childQueries](self, "childQueries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (double)startTime
{
  return self->_startTime;
}

- (void)_queryWillStart
{
  double v3;

  -[SPKQuery setQueryState:](self, "setQueryState:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_startTime = v3;
}

- (void)_queryDidComplete
{
  -[SPKQuery setQueryState:](self, "setQueryState:", 4);
}

- (BOOL)isParsecQuery
{
  return 0;
}

- (BOOL)isURLQuery
{
  return 0;
}

- (BOOL)isDocumentQuery
{
  return 0;
}

- (BOOL)isCoreSpotlightQuery
{
  return 0;
}

- (BOOL)isApplicationQuery
{
  return 0;
}

- (BOOL)isCalculatorQuery
{
  return 0;
}

- (BOOL)supportsRefinement
{
  return 0;
}

- (BOOL)isDictionaryQuery
{
  return 0;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (void)setQueryOptions:(unint64_t)a3
{
  self->_queryOptions = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (unint64_t)queryGroupId
{
  return self->_queryGroupId;
}

- (NSString)userQueryString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)trimmedUserQueryString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)wantsSuggestions
{
  return self->_wantsSuggestions;
}

- (void)setWantsSuggestions:(BOOL)a3
{
  self->_wantsSuggestions = a3;
}

- (SPKQueryDelegate)delegate
{
  return (SPKQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRSRankingItemRanker)ranker
{
  return (PRSRankingItemRanker *)objc_getProperty(self, a2, 80, 1);
}

- (SPKQuery)parentQuery
{
  return (SPKQuery *)objc_loadWeakRetained((id *)&self->_parentQuery);
}

- (void)setParentQuery:(id)a3
{
  objc_storeWeak((id *)&self->_parentQuery, a3);
}

- (double)queryStartTime
{
  return self->_queryStartTime;
}

- (void)setQueryStartTime:(double)a3
{
  self->_queryStartTime = a3;
}

- (SPSearchQueryContext)queryContext
{
  return (SPSearchQueryContext *)objc_getProperty(self, a2, 104, 1);
}

- (int)queryState
{
  return self->_queryState;
}

- (void)setQueryState:(int)a3
{
  self->_queryState = a3;
}

- (BOOL)isExtensionQuery
{
  return self->_extensionQuery;
}

- (id)clientResponseHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setClientResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)internalUnmodifiedUserQueryString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInternalUnmodifiedUserQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUnmodifiedUserQueryString, 0);
  objc_storeStrong(&self->_clientResponseHandler, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_destroyWeak((id *)&self->_parentQuery);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trimmedUserQueryString, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_childQueries, 0);
}

@end
