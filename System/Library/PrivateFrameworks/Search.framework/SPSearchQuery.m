@implementation SPSearchQuery

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (SPSearchQuery)initWithSearchQueryContext:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  SPSearchQuery *v9;
  SPSearchQuery *v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  NSString *keyboardLanguage;
  uint64_t v15;
  NSString *keyboardPrimaryLanguage;
  double v17;
  uint64_t v18;
  NSArray *disabledBundles;
  uint64_t v20;
  NSArray *disabledApps;
  double v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryQuery();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_213202000, v7, v8, "Started search on %@", buf, 0xCu);
  }

  v24.receiver = self;
  v24.super_class = (Class)SPSearchQuery;
  v9 = -[SPSearchQuery init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    do
      v11 = __ldaxr((unsigned int *)&initWithSearchQueryContext____queryIDIter);
    while (__stlxr(v11 + 1, (unsigned int *)&initWithSearchQueryContext____queryIDIter));
    v9->_queryID = v11;
    do
      v12 = __ldaxr(&initWithSearchQueryContext____queryIdentIter);
    while (__stlxr(v12 + 1, &initWithSearchQueryContext____queryIdentIter));
    v9->_queryIdent = v12;
    objc_storeStrong((id *)&v9->_queryContext, a3);
    objc_storeStrong((id *)&v10->_searchString, v6);
    objc_msgSend(v5, "keyboardLanguage");
    v13 = objc_claimAutoreleasedReturnValue();
    keyboardLanguage = v10->_keyboardLanguage;
    v10->_keyboardLanguage = (NSString *)v13;

    objc_msgSend(v5, "keyboardPrimaryLanguage");
    v15 = objc_claimAutoreleasedReturnValue();
    keyboardPrimaryLanguage = v10->_keyboardPrimaryLanguage;
    v10->_keyboardPrimaryLanguage = (NSString *)v15;

    objc_msgSend(v5, "scaleFactor");
    v10->_scaleFactor = v17;
    v10->_creationTime = CFAbsoluteTimeGetCurrent();
    v10->_creationStamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend(v5, "disabledBundles");
    v18 = objc_claimAutoreleasedReturnValue();
    disabledBundles = v10->_disabledBundles;
    v10->_disabledBundles = (NSArray *)v18;

    objc_msgSend(v5, "disabledApps");
    v20 = objc_claimAutoreleasedReturnValue();
    disabledApps = v10->_disabledApps;
    v10->_disabledApps = (NSArray *)v20;

    v10->_promoteLocalResults = objc_msgSend(v5, "promoteLocalResults");
    v10->_promoteParsecResults = objc_msgSend(v5, "promoteParsecResults");
    v10->_noTokenize = objc_msgSend(v5, "noTokenize");
    if (objc_msgSend(v5, "queryIdent"))
      v10->_queryIdent = objc_msgSend(v5, "queryIdent");
    v10->_internalValidation = objc_msgSend(v5, "internalValidation");
    v10->_internalDebug = objc_msgSend(v5, "internalDebug");
    objc_msgSend(v5, "currentTime");
    v10->_currentTime = v22;
  }

  return v10;
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (BOOL)cancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (void)cancel
{
  self->_cancellationTime = CFAbsoluteTimeGetCurrent();
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (void)execute:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (SPSearchQuery)initWithQuery:(id)a3 domains:(id)a4
{
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SPSearchQuery *v10;
  SPSearchQuery *v11;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BEB0280]);
  objc_msgSend(v5, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithSearchString:", v8);

  v10 = -[SPSearchQuery initWithSearchQueryContext:](self, "initWithSearchQueryContext:", v9);
  v11 = v10;
  if (v10)
  {
    v10->_queryID = v5[1];
    v10->_queryIdent = v5[16];
    v10->_creationTime = (double)v5[8];
    v10->_creationStamp = v5[10];
    v10->_currentTime = (double)v5[18];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  return self->_queryID == *((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  return self->_queryID;
}

- (BOOL)hasMarkedText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SPSearchQuery queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 3;

  return v4;
}

- (BOOL)plausiblyMatchesQuery:(id)a3
{
  id *v4;
  BOOL v5;

  v4 = (id *)a3;
  if (objc_msgSend(v4[2], "length") && -[NSString length](self->_searchString, "length"))
    v5 = (objc_msgSend(v4[2], "hasPrefix:", self->_searchString) & 1) != 0
      || -[NSString hasPrefix:](self->_searchString, "hasPrefix:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)grouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (NSArray)disabledBundles
{
  return self->_disabledBundles;
}

- (void)setDisabledBundles:(id)a3
{
  objc_storeStrong((id *)&self->_disabledBundles, a3);
}

- (NSArray)disabledApps
{
  return self->_disabledApps;
}

- (void)setDisabledApps:(id)a3
{
  objc_storeStrong((id *)&self->_disabledApps, a3);
}

- (BOOL)noTokenize
{
  return self->_noTokenize;
}

- (void)setNoTokenize:(BOOL)a3
{
  self->_noTokenize = a3;
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (BOOL)isWideScreen
{
  return self->_isWideScreen;
}

- (void)setIsWideScreen:(BOOL)a3
{
  self->_isWideScreen = a3;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
}

- (BOOL)promoteLocalResults
{
  return self->_promoteLocalResults;
}

- (void)setPromoteLocalResults:(BOOL)a3
{
  self->_promoteLocalResults = a3;
}

- (BOOL)promoteParsecResults
{
  return self->_promoteParsecResults;
}

- (void)setPromoteParsecResults:(BOOL)a3
{
  self->_promoteParsecResults = a3;
}

- (BOOL)internalDebug
{
  return self->_internalDebug;
}

- (void)setInternalDebug:(BOOL)a3
{
  self->_internalDebug = a3;
}

- (BOOL)internalValidation
{
  return self->_internalValidation;
}

- (void)setInternalValidation:(BOOL)a3
{
  self->_internalValidation = a3;
}

- (int64_t)contentFilters
{
  return self->_contentFilters;
}

- (void)setContentFilters:(int64_t)a3
{
  self->_contentFilters = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (double)cancellationTime
{
  return self->_cancellationTime;
}

- (unint64_t)creationStamp
{
  return self->_creationStamp;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledApps, 0);
  objc_storeStrong((id *)&self->_disabledBundles, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->markedTextArray, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
