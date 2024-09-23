@implementation REContentRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  +[REFeature sentimentAnalysisFeature](REFeature, "sentimentAnalysisFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[REFeature negativeSentimentAnalysisFeature](REFeature, "negativeSentimentAnalysisFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[REFeature sentimentAnalysisCertaintyFeature](REFeature, "sentimentAnalysisCertaintyFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[REFeature portraitFeature](REFeature, "portraitFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  REMLSentimentAnalyzer *sentimentAnalyzer;
  void *v23;
  void *v24;
  int v25;
  float v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  double v31;
  id v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v33 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        +[REFeature portraitFeature](REFeature, "portraitFeature");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
          +[RESingleton sharedInstance](REPortraitPredictor, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "keywords");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "userAffinityToContent:", v19);
          +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        if (!v12)
        {
          sentimentAnalyzer = self->_sentimentAnalyzer;
          objc_msgSend(v7, "keywords");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMLSentimentAnalyzer sentimentForTokens:](sentimentAnalyzer, "sentimentForTokens:", v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[REFeature sentimentAnalysisFeature](REFeature, "sentimentAnalysisFeature");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v15, "isEqual:", v24);

        if (v25)
        {
          objc_msgSend(v12, "postivieSentiment");
LABEL_16:
          v31 = v26;
          goto LABEL_17;
        }
        +[REFeature negativeSentimentAnalysisFeature](REFeature, "negativeSentimentAnalysisFeature");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v15, "isEqual:", v27);

        if (v28)
        {
          objc_msgSend(v12, "negativeSentiment");
          goto LABEL_16;
        }
        +[REFeature sentimentAnalysisCertaintyFeature](REFeature, "sentimentAnalysisCertaintyFeature");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v15, "isEqual:", v29);

        v31 = 0.0;
        if (v30)
        {
          objc_msgSend(v12, "certainty", 0.0);
          goto LABEL_16;
        }
LABEL_17:
        +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        objc_msgSend(v9, "addObject:", v21);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v11)
        goto LABEL_22;
    }
  }
  v12 = 0;
LABEL_22:

  return v9;
}

- (BOOL)_suppportsPortarit
{
  void *v2;
  void *v3;
  char v4;

  -[RERelevanceProviderManager effectiveFeatures](self, "effectiveFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature portraitFeature](REFeature, "portraitFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)_suppportsSentimentAnalysis
{
  void *v2;
  void *v3;
  char v4;

  -[RERelevanceProviderManager effectiveFeatures](self, "effectiveFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature sentimentAnalysisFeature](REFeature, "sentimentAnalysisFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (-[REContentRelevanceProviderManager _suppportsPortarit](self, "_suppportsPortarit"))
  {
    +[RESingleton sharedInstance](REPortraitPredictor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", self);

  }
  if (-[REContentRelevanceProviderManager _suppportsSentimentAnalysis](self, "_suppportsSentimentAnalysis"))
  {
    -[RERelevanceProviderManager environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relevanceEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelManager");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v14;
    if (!v14)
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Model Manager should not be nil!"), v6, v7, v8, v9, v10, v11, v13);
      v12 = 0;
    }
    objc_msgSend(v12, "addObserver:", self);
    -[REContentRelevanceProviderManager modelManagerDidUpdateModel:](self, "modelManagerDidUpdateModel:", v14);

  }
}

- (void)pause
{
  void *v3;
  void *v4;
  void *v5;
  REMLSentimentAnalyzer *sentimentAnalyzer;
  id v7;

  if (-[REContentRelevanceProviderManager _suppportsPortarit](self, "_suppportsPortarit"))
  {
    +[RESingleton sharedInstance](REPortraitPredictor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  if (-[REContentRelevanceProviderManager _suppportsSentimentAnalysis](self, "_suppportsSentimentAnalysis"))
  {
    -[RERelevanceProviderManager environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relevanceEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObserver:", self);
    sentimentAnalyzer = self->_sentimentAnalyzer;
    self->_sentimentAnalyzer = 0;

  }
}

- (void)modelManagerDidUpdateModel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RERelevanceProviderManager _manager_queue](self, "_manager_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__REContentRelevanceProviderManager_modelManagerDidUpdateModel___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__REContentRelevanceProviderManager_modelManagerDidUpdateModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "sentimentAnalyzer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  v5 = *(void **)(a1 + 32);
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scheduleUpdate:", v6);

}

- (void)predictorDidUpdate:(id)a3
{
  id v4;

  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentimentAnalyzer, 0);
}

@end
