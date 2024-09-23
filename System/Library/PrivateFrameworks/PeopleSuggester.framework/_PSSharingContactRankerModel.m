@implementation _PSSharingContactRankerModel

- (_PSSharingContactRankerModel)initWithInteractionStore:(id)a3 messageInteractionCache:(id)a4 shareInteractionCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PSSharingContactRankerModel *v12;
  _PSSharingContactRankerModel *v13;
  _PSSharingContactRankerMLModel *sharingContactRankerMLModel;
  _PSSharingContactFeatureExtraction *feaExtractionHandle;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[_PSSharingContactRankerModel init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interactionStore, a3);
    objc_storeStrong((id *)&v13->_messageInteractionCache, a4);
    objc_storeStrong((id *)&v13->_shareInteractionCache, a5);
    sharingContactRankerMLModel = v13->_sharingContactRankerMLModel;
    v13->_sharingContactRankerMLModel = 0;

    feaExtractionHandle = v13->_feaExtractionHandle;
    v13->_feaExtractionHandle = 0;

  }
  return v13;
}

- (void)updateModelProperties:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactRankerModel updateModelProperties:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSharingContactRankerMLModelInUse"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactRankerModel set_PSSharingContactRankerMLModelInUse:](self, "set_PSSharingContactRankerMLModelInUse:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_PSSharingContactRankerMLModelScoreThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &unk_1E442D048;
  objc_msgSend(v17, "doubleValue");
  -[_PSSharingContactRankerModel set_PSSharingContactRankerMLModelScoreThreshold:](self, "set_PSSharingContactRankerMLModelScoreThreshold:");

}

- (id)suggestionProxiesWithPredictionContext:(id)a3 supportedBundleIDs:(id)a4 behaviorRulesConsideringInTheContext:(id)a5 interactionModelSuggestions:(id)a6 ruleRankingMLModelScores:(id)a7
{
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  _PSSharingContactRankerScoredContact *v40;
  void *v41;
  void *v42;
  void *v43;
  _PSSharingContactRankerScoredContact *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  BOOL v60;
  void *v61;
  BOOL v62;
  _PSSuggestionProxy *v63;
  objc_class *v64;
  void *v65;
  _PSSuggestionProxy *v66;
  id v67;
  uint64_t v68;
  __objc2_class **v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v89 = a5;
  v11 = a6;
  v87 = a7;
  -[_PSSharingContactRankerModel loadMLModel](self, "loadMLModel");
  -[_PSSharingContactRankerModel sharingContactRankerMLModel](self, "sharingContactRankerMLModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_PSSharingContactRankerModel suggestionProxiesWithPredictionContext:supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:].cold.2(v89);

    -[_PSSharingContactRankerModel messageInteractionCache](self, "messageInteractionCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSharingContactRankerModel shareInteractionCache](self, "shareInteractionCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "interactions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSContactFillerDataCollectionUtilities getListOfContactsFromCashedMessagesInteraction:cashedShareInteractions:](_PSContactFillerDataCollectionUtilities, "getListOfContactsFromCashedMessagesInteraction:cashedShareInteractions:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_PSSharingContactRankerModel suggestionProxiesWithPredictionContext:supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:].cold.1(v18);

    v83 = v11;
    +[_PSContactFillerDataCollectionUtilities getInteractionModelScoreForSuggestions:forInteractionRecipients:](_PSContactFillerDataCollectionUtilities, "getInteractionModelScoreForSuggestions:forInteractionRecipients:", v11, v18);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v18;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v101 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSSharingContactRankerModel feaExtractionHandle](self, "feaExtractionHandle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "extractFeaturesInto:withPredictionContext:forContactId:forInteraction:behaviorRulesConsideringInTheContext:ruleRankingMLModelScores:interactionModelScores:", v25, v88, v24, v28, v89, v87, v85);

          objc_msgSend(v86, "addObject:", v25);
          objc_msgSend(v90, "addObject:", v24);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      }
      while (v21);
    }

    +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeatureDictArray:](_PSBehaviorRuleRankingUtilities, "reformatFeaturesInFeatureDictArray:", v86);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_PSSharingContactRankerModel sharingContactRankerMLModel](self, "sharingContactRankerMLModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)v29;
    objc_msgSend(v31, "scoresOnFeatures:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v32, "count"))
    {
      v33 = 0;
      do
      {
        objc_msgSend(v32, "objectAtIndexedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        v36 = v35;

        if (v36 != -1.0)
        {
          -[_PSSharingContactRankerModel sharingContactRankerMLModel](self, "sharingContactRankerMLModel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "scoreThreshold");
          v39 = v38;

          if (v36 >= v39)
          {
            v40 = [_PSSharingContactRankerScoredContact alloc];
            objc_msgSend(v90, "objectAtIndexedSubscript:", v33);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[_PSSharingContactRankerScoredContact initWithScore:interaction:](v40, "initWithScore:interaction:", v43, v36);
            objc_msgSend(v30, "addObject:", v44);

          }
        }
        ++v33;
      }
      while (objc_msgSend(v32, "count") > v33);
    }
    v80 = v32;
    v81 = v30;
    objc_msgSend(v30, "sortedArrayUsingComparator:", &__block_literal_global_42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v97 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
          objc_msgSend(v51, "interaction");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "bundleId");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v53, "isEqualToString:", v54);

          objc_msgSend(v51, "interaction");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (v55)
          {
            objc_msgSend(v56, "domainIdentifier");
            v58 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v56, "derivedIntentIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (v59)
              v60 = v53 == 0;
            else
              v60 = 1;
            if (v60)
            {
              v61 = 0;
              goto LABEL_37;
            }
            objc_msgSend(v51, "interaction");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "derivedIntentIdentifier");
            v58 = objc_claimAutoreleasedReturnValue();
          }
          v61 = (void *)v58;

          if (v53)
            v62 = v61 == 0;
          else
            v62 = 1;
          if (!v62)
          {
            v63 = [_PSSuggestionProxy alloc];
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v63, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v53, v61, 0, CFSTR("contact ranker model"), v65);

            objc_msgSend(v84, "addObject:", v66);
          }
LABEL_37:

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
      }
      while (v48);
    }
    v79 = v46;

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v67 = v84;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    v69 = off_1E43FD000;
    if (v68)
    {
      v70 = v68;
      v71 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v70; ++k)
        {
          if (*(_QWORD *)v93 != v71)
            objc_enumerationMutation(v67);
          v73 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
          -[__objc2_class coreBehaviorChannel](v69[8], "coreBehaviorChannel");
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v73, "interactionRecipients");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "bundleID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "reason");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v105 = v75;
            v106 = 2112;
            v107 = v76;
            v108 = 2112;
            v109 = v77;
            _os_log_impl(&dword_1A07F4000, v74, OS_LOG_TYPE_INFO, "CoreBehavior - People Suggester Suggestion proxy: %@ %@ %@", buf, 0x20u);

            v69 = off_1E43FD000;
          }

        }
        v70 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
      }
      while (v70);
    }

    v11 = v83;
  }
  else
  {
    v67 = (id)MEMORY[0x1E0C9AA60];
  }

  return v67;
}

- (void)loadMLModel
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "sharingContactRankerModel - loadMLModel", a5, a6, a7, a8, 0);
}

- (BOOL)_PSSharingContactRankerMLModelInUse
{
  return self->__PSSharingContactRankerMLModelInUse;
}

- (void)set_PSSharingContactRankerMLModelInUse:(BOOL)a3
{
  self->__PSSharingContactRankerMLModelInUse = a3;
}

- (double)_PSSharingContactRankerMLModelScoreThreshold
{
  return self->__PSSharingContactRankerMLModelScoreThreshold;
}

- (void)set_PSSharingContactRankerMLModelScoreThreshold:(double)a3
{
  self->__PSSharingContactRankerMLModelScoreThreshold = a3;
}

- (_PSSharingContactRankerMLModel)sharingContactRankerMLModel
{
  return (_PSSharingContactRankerMLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSharingContactRankerMLModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (void)setMessageInteractionCache:(id)a3
{
  objc_storeStrong((id *)&self->_messageInteractionCache, a3);
}

- (_CDInteractionCache)shareInteractionCache
{
  return self->_shareInteractionCache;
}

- (void)setShareInteractionCache:(id)a3
{
  objc_storeStrong((id *)&self->_shareInteractionCache, a3);
}

- (_PSSharingContactFeatureExtraction)feaExtractionHandle
{
  return (_PSSharingContactFeatureExtraction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFeaExtractionHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feaExtractionHandle, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_sharingContactRankerMLModel, 0);
}

- (void)updateModelProperties:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "sharingContactRankerModel - updateModelProperties", a5, a6, a7, a8, 0);
}

- (void)suggestionProxiesWithPredictionContext:(void *)a1 supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v2, v3, "Number of recipients considering: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)suggestionProxiesWithPredictionContext:(void *)a1 supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v2, v3, "Number of behavior rules to consider for this share event: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

@end
