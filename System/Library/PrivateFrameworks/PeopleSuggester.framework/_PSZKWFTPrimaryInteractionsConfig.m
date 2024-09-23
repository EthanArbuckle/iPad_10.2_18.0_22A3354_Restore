@implementation _PSZKWFTPrimaryInteractionsConfig

- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 mechanisms:(id)a5 interactionCountMaxDepths:(id)a6 interactionHistoryRelativeStartDates:(id)a7 bundleIds:(id)a8 modelType:(int64_t)a9 clusterPruneThreshold:(unint64_t)a10 maxSuggestions:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  _PSZKWFTPrimaryInteractionsConfig *v21;
  _PSZKWFTPrimaryInteractionsConfig *v22;
  objc_super v25;

  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_PSZKWFTPrimaryInteractionsConfig;
  v21 = -[_PSZKWFTPrimaryInteractionsConfig init](&v25, sel_init);
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

- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 modelType:(int64_t)a5
{
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _PSZKWFTPrimaryInteractionsConfig *v24;
  void *v26;
  void *v27;
  _BOOL4 v30;
  _QWORD v32[2];
  _QWORD v33[3];

  v30 = a3;
  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CD18);
  v26 = v5;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v27);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E442B378);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1500);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4294967293);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v23);
  v24 = -[_PSZKWFTPrimaryInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:mechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:maxSuggestions:](self, "initWithIsEnabled:defaultConfidenceCategory:mechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:maxSuggestions:", v30, a4, v26, v6, v7, v8, a5, 5, 12);

  return v24;
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
