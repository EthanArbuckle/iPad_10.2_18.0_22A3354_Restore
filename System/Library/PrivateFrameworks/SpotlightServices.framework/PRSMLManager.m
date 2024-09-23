@implementation PRSMLManager

+ (id)getSPMLSharedInstance
{
  void *v2;

  v2 = (void *)SPMLSharedInstance;
  if (!SPMLSharedInstance)
  {
    if (getSPMLSharedInstance_onceToken != -1)
      dispatch_once(&getSPMLSharedInstance_onceToken, &__block_literal_global_16);
    v2 = (void *)SPMLSharedInstance;
  }
  return v2;
}

void __37__PRSMLManager_getSPMLSharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PRSMLManager initManager]([PRSMLManager alloc], "initManager");
  v1 = (void *)SPMLSharedInstance;
  SPMLSharedInstance = (uint64_t)v0;

}

+ (id)createPathToSpotlightPrefFile
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v3);
  objc_msgSend(v4, "appendString:", CFSTR("/com.apple.spotlight/"));

  return v4;
}

- (id)initManager
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  PRSCoreDuet *v7;
  PRSCoreDuet *coreDuet;
  NSMutableDictionary *v9;
  NSMutableDictionary *dictCoreDuetInfo;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v20;
  char v21;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v21 = 0;
  +[PRSMLManager createPathToSpotlightPrefFile](PRSMLManager, "createPathToSpotlightPrefFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v21))
    v5 = v21 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v20 = 0;
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v20);
    v6 = v20;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[PRSCoreDuet initWithStreamName:]([PRSCoreDuet alloc], "initWithStreamName:", CFSTR("com.apple.spotlightviewer.events"));
  coreDuet = self->_coreDuet;
  self->_coreDuet = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  self->_dictCoreDuetInfo = v9;

  v11 = objc_msgSend(v4, "mutableCopy");
  v12 = (void *)pathToCoreDuetFlatFile;
  pathToCoreDuetFlatFile = v11;

  v13 = (void *)pathToCoreDuetFlatFile;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:", v15);

  if (objc_msgSend(v3, "fileExistsAtPath:", pathToCoreDuetFlatFile))
  {
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v17 = (NSMutableDictionary *)objc_msgSend(v16, "initWithContentsOfFile:", pathToCoreDuetFlatFile);
    v18 = self->_dictCoreDuetInfo;
    self->_dictCoreDuetInfo = v17;

  }
  return self;
}

- (void)addCategoryAndGroupNameToTrainCategories:(id)a3 groupName:(id)a4
{
  -[PRSCoreDuet addResultCategoryAndGroupToHistory:groupName:error:](self->_coreDuet, "addResultCategoryAndGroupToHistory:groupName:error:", a3, a4, 0);
}

- (id)getLastSavedCategoryRankings
{
  NSMutableDictionary *v3;
  NSMutableDictionary *dictCoreDuetInfo;
  void *v5;
  void *v6;
  void *v7;

  v3 = self->_dictCoreDuetInfo;
  objc_sync_enter(v3);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dictCoreDuetInfo, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v7;
}

- (unint64_t)getTotalResultsUsedCountForDuet
{
  NSMutableDictionary *v3;
  NSMutableDictionary *dictCoreDuetInfo;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = self->_dictCoreDuetInfo;
  objc_sync_enter(v3);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dictCoreDuetInfo, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_sync_exit(v3);
  return v8;
}

- (unint64_t)getCountForCategory:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = self->_dictCoreDuetInfo;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_dictCoreDuetInfo, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_dictCoreDuetInfo, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v5);

  return v8;
}

- (id)getRankedCategoriesAsDictionaryForDays:(int64_t)a3
{
  return -[PRSCoreDuet getRankedCategoriesDictionaryWithPredictionWindow:predictionInterval:](self->_coreDuet, "getRankedCategoriesDictionaryWithPredictionWindow:predictionInterval:", 86400.0, (double)a3 * 86400.0);
}

- (void)saveLastRankingForCategories:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *dictCoreDuetInfo;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self->_dictCoreDuetInfo;
    objc_sync_enter(v5);
    dictCoreDuetInfo = self->_dictCoreDuetInfo;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](dictCoreDuetInfo, "setObject:forKey:", v9, v8);

    objc_sync_exit(v5);
    v4 = v9;
  }

}

- (void)dumpPredictionStatsToFlatFiles
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PRSMLManager_dumpPredictionStatsToFlatFiles__block_invoke;
  block[3] = &unk_1E6E42FD8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__PRSMLManager_dumpPredictionStatsToFlatFiles__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v6, (_QWORD)v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          v10 = v7 == 0;
        else
          v10 = 1;
        if (!v10)
        {
          v11 = v8;
          objc_sync_enter(v11);
          objc_msgSend(v11, "writeToFile:atomically:", v7, 1);
          objc_sync_exit(v11);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  objc_sync_enter(v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "writeToFile:atomically:", pathToCoreDuetFlatFile, 1);
  objc_sync_exit(v12);

}

- (PRSCoreDuet)coreDuet
{
  return (PRSCoreDuet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoreDuet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)mapPredictionEnginesToClasses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMapPredictionEnginesToClasses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)mapPredictionEnginesToCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMapPredictionEnginesToCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)mapPredictionEnginesToCountFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMapPredictionEnginesToCountFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)mapPredictionEnginesToPredictedTopHit
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMapPredictionEnginesToPredictedTopHit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)dictCoreDuetInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDictCoreDuetInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)categoryList
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCategoryList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)combinedTopScoreOrder
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCombinedTopScoreOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)combinedBottomScoreOrder
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCombinedBottomScoreOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedBottomScoreOrder, 0);
  objc_storeStrong((id *)&self->_combinedTopScoreOrder, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_dictCoreDuetInfo, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToPredictedTopHit, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToCountFiles, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToCounts, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToClasses, 0);
  objc_storeStrong((id *)&self->_coreDuet, 0);
}

@end
