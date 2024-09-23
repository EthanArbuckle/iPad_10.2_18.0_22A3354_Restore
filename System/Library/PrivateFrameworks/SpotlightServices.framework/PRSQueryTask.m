@implementation PRSQueryTask

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("Query Decoding Queue", v4);
    v3 = (void *)decodingQueue;
    decodingQueue = (uint64_t)v2;

  }
}

+ (void)suspendDecoding
{
  NSObject *v2;
  uint8_t v3[16];

  PRSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B86C5000, v2, OS_LOG_TYPE_INFO, "Suspend decoding queue", v3, 2u);
  }

  dispatch_suspend((dispatch_object_t)decodingQueue);
}

+ (void)resumeDecoding
{
  NSObject *v2;
  uint8_t v3[16];

  PRSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B86C5000, v2, OS_LOG_TYPE_INFO, "Resume decoding queue", v3, 2u);
  }

  dispatch_resume((dispatch_object_t)decodingQueue);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *category_stats;
  id v5;

  category_stats = self->_category_stats;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category_stats, CFSTR("_category_stats"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_server_features, CFSTR("_server_features"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fbq, CFSTR("_fbq"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queryString, CFSTR("_queryString"));

}

- (PRSQueryTask)initWithCoder:(id)a3
{
  id v4;
  PRSQueryTask *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *category_stats;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *server_features;
  uint64_t v19;
  NSString *fbq;
  uint64_t v21;
  NSString *queryString;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PRSQueryTask;
  v5 = -[PRSQueryTask init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_category_stats"));
    v11 = objc_claimAutoreleasedReturnValue();
    category_stats = v5->_category_stats;
    v5->_category_stats = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_server_features"));
    v17 = objc_claimAutoreleasedReturnValue();
    server_features = v5->_server_features;
    v5->_server_features = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fbq"));
    v19 = objc_claimAutoreleasedReturnValue();
    fbq = v5->_fbq;
    v5->_fbq = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_queryString"));
    v21 = objc_claimAutoreleasedReturnValue();
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v21;

  }
  return v5;
}

- (PRSQueryTask)initWithSession:(id)a3 handler:(id)a4 queue:(id)a5 feedback:(id)a6 queryContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PRSQueryTask *v17;
  PRSQueryTask *v18;
  uint64_t v19;
  NSString *queryString;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PRSQueryTask;
  v17 = -[PRSQueryTask init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feedback, a6);
    objc_storeWeak((id *)&v18->_handler, v13);
    objc_storeStrong((id *)&v18->_queue, a5);
    objc_storeWeak((id *)&v18->_session, v12);
    objc_storeStrong((id *)&v18->_queryContext, a7);
    -[SPSearchQueryContext searchString](v18->_queryContext, "searchString");
    v19 = objc_claimAutoreleasedReturnValue();
    queryString = v18->_queryString;
    v18->_queryString = (NSString *)v19;

  }
  return v18;
}

- (void)resume
{
  self->_started = 1;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (void)invalidateHandler
{
  objc_storeWeak((id *)&self->_handler, 0);
}

- (int64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(int64_t)a3
{
  self->_queryId = a3;
}

- (NSDictionary)category_stats
{
  return self->_category_stats;
}

- (void)setCategory_stats:(id)a3
{
  objc_storeStrong((id *)&self->_category_stats, a3);
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
  objc_storeStrong((id *)&self->_server_features, a3);
}

- (NSArray)parsecCategoryOrder
{
  return self->_parsecCategoryOrder;
}

- (void)setParsecCategoryOrder:(id)a3
{
  objc_storeStrong((id *)&self->_parsecCategoryOrder, a3);
}

- (NSDictionary)serverRelevanceScores
{
  return self->_serverRelevanceScores;
}

- (void)setServerRelevanceScores:(id)a3
{
  objc_storeStrong((id *)&self->_serverRelevanceScores, a3);
}

- (float)serverRelevanceScoreThreshold
{
  return self->_serverRelevanceScoreThreshold;
}

- (void)setServerRelevanceScoreThreshold:(float)a3
{
  self->_serverRelevanceScoreThreshold = a3;
}

- (SFEngagementSignal)engagementSignal
{
  return self->_engagementSignal;
}

- (void)setEngagementSignal:(id)a3
{
  objc_storeStrong((id *)&self->_engagementSignal, a3);
}

- (id)representedObject
{
  return objc_loadWeakRetained(&self->_representedObject);
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeWeak(&self->_representedObject, a3);
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (PRSSearchFeedback)feedback
{
  return (PRSSearchFeedback *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFeedback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PRSSearchQueryHandler)handler
{
  return (PRSSearchQueryHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void)setHandler:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PRSSearchSession)session
{
  return (PRSSearchSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (NSString)fbq
{
  return self->_fbq;
}

- (void)setFbq:(id)a3
{
  objc_storeStrong((id *)&self->_fbq, a3);
}

- (BOOL)webSearch
{
  return self->_webSearch;
}

- (void)setWebSearch:(BOOL)a3
{
  self->_webSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_destroyWeak(&self->_representedObject);
  objc_storeStrong((id *)&self->_engagementSignal, 0);
  objc_storeStrong((id *)&self->_serverRelevanceScores, 0);
  objc_storeStrong((id *)&self->_parsecCategoryOrder, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_category_stats, 0);
}

@end
