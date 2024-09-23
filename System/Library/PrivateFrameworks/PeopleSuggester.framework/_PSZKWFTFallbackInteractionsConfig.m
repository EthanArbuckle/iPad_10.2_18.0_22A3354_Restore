@implementation _PSZKWFTFallbackInteractionsConfig

- (_PSZKWFTFallbackInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 mechanisms:(id)a5 interactionCountMaxDepths:(id)a6 interactionHistoryRelativeStartDates:(id)a7 bundleIds:(id)a8 modelType:(int64_t)a9 clusterPruneThreshold:(unint64_t)a10 maxSuggestions:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  _PSZKWFTFallbackInteractionsConfig *v21;
  _PSZKWFTFallbackInteractionsConfig *v22;
  objc_super v25;

  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_PSZKWFTFallbackInteractionsConfig;
  v21 = -[_PSZKWFTFallbackInteractionsConfig init](&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_isEnabled = a3;
    v21->_defaultConfidenceCategory = a4;
    objc_storeStrong((id *)&v21->_mechanisms, a5);
    objc_storeStrong((id *)&v22->_interactionCountMaxDepths, a6);
    objc_storeStrong((id *)&v22->_interactionHistoryRelativeStartDates, a7);
    objc_storeStrong((id *)&v22->_bundleIds, a8);
    v22->_modelType = a9;
    v22->_maxSuggestions = a11;
    v22->_clusterPruneThreshold = a10;
  }

  return v22;
}

- (_PSZKWFTFallbackInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 modelType:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _PSZKWFTFallbackInteractionsConfig *v17;
  _BOOL4 v19;

  v19 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CD30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v16);
  v17 = -[_PSZKWFTFallbackInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:mechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:maxSuggestions:](self, "initWithIsEnabled:defaultConfidenceCategory:mechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:maxSuggestions:", v19, a4, v7, v8, v9, v10, a5, 5, 12);

  return v17;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)defaultConfidenceCategory
{
  return self->_defaultConfidenceCategory;
}

- (NSArray)mechanisms
{
  return self->_mechanisms;
}

- (NSArray)interactionCountMaxDepths
{
  return self->_interactionCountMaxDepths;
}

- (NSArray)interactionHistoryRelativeStartDates
{
  return self->_interactionHistoryRelativeStartDates;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (unint64_t)clusterPruneThreshold
{
  return self->_clusterPruneThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_interactionHistoryRelativeStartDates, 0);
  objc_storeStrong((id *)&self->_interactionCountMaxDepths, 0);
  objc_storeStrong((id *)&self->_mechanisms, 0);
}

@end
