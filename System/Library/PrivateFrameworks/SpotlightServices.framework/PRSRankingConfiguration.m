@implementation PRSRankingConfiguration

- (PRSRankingConfiguration)init
{
  PRSRankingConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRSRankingConfiguration;
  v2 = -[PRSRankingConfiguration init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PRSRankingConfiguration setQueryDependentCategoryProbabilities:](v2, "setQueryDependentCategoryProbabilities:", v3);

    v4 = (void *)objc_opt_new();
    -[PRSRankingConfiguration setCepBlocklistSet:](v2, "setCepBlocklistSet:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    -[PRSRankingConfiguration setAllow_coreduet_influence:](v2, "setAllow_coreduet_influence:", objc_msgSend(v5, "integerForKey:", CFSTR("usedCount")) > 19);

    LODWORD(v6) = -1.0;
    -[PRSRankingConfiguration setNumAppsDeduped:](v2, "setNumAppsDeduped:", v6);
    v2->_mutex._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_mutex);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_mutex);
}

- (void)mergeWith:(id)a3
{
  void *v4;
  PRSRankingConfiguration *v5;
  void *v6;
  void *v7;
  PRSRankingConfiguration *v8;
  void *v9;
  void *v10;
  NSNumber *v11;
  NSNumber *localResultQualityThreshold;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PRSRankingConfiguration *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PRSRankingConfiguration *v27;

  v27 = (PRSRankingConfiguration *)a3;
  -[PRSRankingConfiguration rankingQueries](self, "rankingQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
    v5 = self;
  -[PRSRankingConfiguration rankingQueries](v5, "rankingQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingConfiguration setRankingQueries:](self, "setRankingQueries:", v6);

  -[PRSRankingConfiguration parsecCategoryOrder](self, "parsecCategoryOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  if (v7)
    v8 = self;
  -[PRSRankingConfiguration parsecCategoryOrder](v8, "parsecCategoryOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingConfiguration setParsecCategoryOrder:](self, "setParsecCategoryOrder:", v9);

  if (-[PRSRankingConfiguration disableResultTruncation](v27, "disableResultTruncation"))
    -[PRSRankingConfiguration setDisableResultTruncation:](self, "setDisableResultTruncation:", -[PRSRankingConfiguration disableResultTruncation](v27, "disableResultTruncation"));
  -[PRSRankingConfiguration sqfData](v27, "sqfData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PRSRankingConfiguration updateWithSQFData:](self, "updateWithSQFData:", v10);
    objc_msgSend(v10, "objectForKey:", CFSTR("local_result_quality_threshold"));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    localResultQualityThreshold = self->_localResultQualityThreshold;
    self->_localResultQualityThreshold = v11;

  }
  -[PRSRankingConfiguration serverFeatures](v27, "serverFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PRSRankingConfiguration serverFeatures](v27, "serverFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingConfiguration setServerFeatures:](self, "setServerFeatures:", v14);

  }
  -[PRSRankingConfiguration queryIndependentCategoryProbabilities](v27, "queryIndependentCategoryProbabilities");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[PRSRankingConfiguration queryIndependentCategoryProbabilities](self, "queryIndependentCategoryProbabilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[PRSRankingConfiguration queryIndependentCategoryProbabilities](v27, "queryIndependentCategoryProbabilities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingConfiguration setQueryIndependentCategoryProbabilities:](self, "setQueryIndependentCategoryProbabilities:", v18);

      -[PRSRankingConfiguration queryIndependentCategoryProbabilities](self, "queryIndependentCategoryProbabilities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "blocklist");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingConfiguration appendToExistingCEPBlocklist:](self, "appendToExistingCEPBlocklist:", v20);

    }
  }
  -[PRSRankingConfiguration numAppsDeduped](self, "numAppsDeduped");
  v21 = v27;
  if (v22 != -1.0)
    v21 = self;
  -[PRSRankingConfiguration numAppsDeduped](v21, "numAppsDeduped");
  -[PRSRankingConfiguration setNumAppsDeduped:](self, "setNumAppsDeduped:");
  -[PRSRankingConfiguration serverRelevanceScores](v27, "serverRelevanceScores");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PRSRankingConfiguration serverRelevanceScores](v27, "serverRelevanceScores");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingConfiguration setServerRelevanceScores:](self, "setServerRelevanceScores:", v24);

    -[PRSRankingConfiguration serverRelevanceScoreThreshold](v27, "serverRelevanceScoreThreshold");
    -[PRSRankingConfiguration setServerRelevanceScoreThreshold:](self, "setServerRelevanceScoreThreshold:");
  }
  -[PRSRankingConfiguration iFunScores](v27, "iFunScores");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PRSRankingConfiguration iFunScores](v27, "iFunScores");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingConfiguration setIFunScores:](self, "setIFunScores:", v26);

  }
}

- (void)appendToExistingCEPBlocklist:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PRSRankingConfiguration lock](self, "lock");
  -[PRSRankingConfiguration cepBlocklistSet](self, "cepBlocklistSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  -[PRSRankingConfiguration unlock](self, "unlock");
}

- (void)updateQueryDependentProbabilityAndBlocklistSetWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  PRSRankingConfiguration *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PRSRankingConfiguration lock](self, "lock");
  v23 = v4;
  objc_msgSend(v4, "prs_dictionaryForKey:", CFSTR("stats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prs_arrayForKey:", CFSTR("cep_long"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v25)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("cid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PRSRankingConfiguration queryDependentCategoryProbabilities](self, "queryDependentCategoryProbabilities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("e"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, v11);

        objc_msgSend(v9, "objectForKey:", CFSTR("e"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        if (v15 < 0.0)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("cid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lowercaseString");
          v17 = v7;
          v18 = self;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple."));

          self = v18;
          v7 = v17;

          if ((v20 & 1) != 0)
            goto LABEL_10;
          -[PRSRankingConfiguration cepBlocklistSet](self, "cepBlocklistSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("cid"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lowercaseString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
LABEL_10:

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v25);
  }

  -[PRSRankingConfiguration unlock](self, "unlock");
}

- (float)engagementProbabilityForCategory:(id)a3
{
  double v3;
  float v4;
  BOOL v5;
  float result;

  -[PRSRankingConfiguration queryDependentProbabilityForCategory:](self, "queryDependentProbabilityForCategory:", a3);
  v4 = v3;
  v5 = v3 == -1.0;
  result = -1.0;
  if (!v5)
    return v4;
  return result;
}

- (double)queryDependentProbabilityForCategory:(id)a3
{
  id v4;
  NSMutableDictionary *queryDependentCategoryProbabilities;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  -[PRSRankingConfiguration lock](self, "lock");
  queryDependentCategoryProbabilities = self->_queryDependentCategoryProbabilities;
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](queryDependentCategoryProbabilities, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = -1.0;
  }
  -[PRSRankingConfiguration unlock](self, "unlock");

  return v9;
}

- (double)queryIndependentProbabilityForCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  -[SSPlistDataReader doubleValueForBundle:](self->_queryIndependentCategoryProbabilities, "doubleValueForBundle:", v4);
  v6 = v5;
  if (v5 < 0.0)
  {
    -[SSPlistDataReader doubleValueForKey:](self->_queryIndependentCategoryProbabilities, "doubleValueForKey:", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    if (v7 >= 0.0)
      v6 = v7;
    else
      v6 = -1.0;
  }

  return v6;
}

- (float)maxEngagementProbability
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PRSRankingConfiguration lock](self, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_queryDependentCategoryProbabilities, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = -1.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_queryDependentCategoryProbabilities, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "doubleValue");
          if (v11 > v7 && v11 >= 0.0)
            v7 = v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1.0;
  }

  -[PRSRankingConfiguration unlock](self, "unlock");
  return v7;
}

- (NSMutableDictionary)categoryEngagements
{
  return self->_categoryEngagements;
}

- (void)setCategoryEngagements:(id)a3
{
  objc_storeStrong((id *)&self->_categoryEngagements, a3);
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueries, a3);
}

- (NSMutableDictionary)queryDependentCategoryProbabilities
{
  return self->_queryDependentCategoryProbabilities;
}

- (void)setQueryDependentCategoryProbabilities:(id)a3
{
  objc_storeStrong((id *)&self->_queryDependentCategoryProbabilities, a3);
}

- (SSPlistDataReader)queryIndependentCategoryProbabilities
{
  return self->_queryIndependentCategoryProbabilities;
}

- (void)setQueryIndependentCategoryProbabilities:(id)a3
{
  objc_storeStrong((id *)&self->_queryIndependentCategoryProbabilities, a3);
}

- (NSNumber)localResultQualityThreshold
{
  return self->_localResultQualityThreshold;
}

- (void)setLocalResultQualityThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_localResultQualityThreshold, a3);
}

- (NSMutableOrderedSet)cepBlocklistSet
{
  return self->_cepBlocklistSet;
}

- (void)setCepBlocklistSet:(id)a3
{
  objc_storeStrong((id *)&self->_cepBlocklistSet, a3);
}

- (NSArray)parsecCategoryOrder
{
  return self->_parsecCategoryOrder;
}

- (void)setParsecCategoryOrder:(id)a3
{
  objc_storeStrong((id *)&self->_parsecCategoryOrder, a3);
}

- (NSString)shortcutSectionBundleID
{
  return self->_shortcutSectionBundleID;
}

- (void)setShortcutSectionBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutSectionBundleID, a3);
}

- (BOOL)allow_coreduet_influence
{
  return self->_allow_coreduet_influence;
}

- (void)setAllow_coreduet_influence:(BOOL)a3
{
  self->_allow_coreduet_influence = a3;
}

- (NSDictionary)sqfData
{
  return self->_sqfData;
}

- (void)setSqfData:(id)a3
{
  objc_storeStrong((id *)&self->_sqfData, a3);
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setServerFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_serverFeatures, a3);
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

- (IFunScores)iFunScores
{
  return self->_iFunScores;
}

- (void)setIFunScores:(id)a3
{
  objc_storeStrong((id *)&self->_iFunScores, a3);
}

- (BOOL)disableResultTruncation
{
  return self->_disableResultTruncation;
}

- (void)setDisableResultTruncation:(BOOL)a3
{
  self->_disableResultTruncation = a3;
}

- (float)numAppsDeduped
{
  return self->_numAppsDeduped;
}

- (void)setNumAppsDeduped:(float)a3
{
  self->_numAppsDeduped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFunScores, 0);
  objc_storeStrong((id *)&self->_serverRelevanceScores, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_sqfData, 0);
  objc_storeStrong((id *)&self->_shortcutSectionBundleID, 0);
  objc_storeStrong((id *)&self->_parsecCategoryOrder, 0);
  objc_storeStrong((id *)&self->_cepBlocklistSet, 0);
  objc_storeStrong((id *)&self->_localResultQualityThreshold, 0);
  objc_storeStrong((id *)&self->_queryIndependentCategoryProbabilities, 0);
  objc_storeStrong((id *)&self->_queryDependentCategoryProbabilities, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_categoryEngagements, 0);
}

@end
