@implementation PGSearchKeywordComputerKeywordAggregator

- (PGSearchKeywordComputerKeywordAggregator)init
{
  PGSearchKeywordComputerKeywordAggregator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *keywordsByCategoryMaskByDateIntervalByMomentUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGSearchKeywordComputerKeywordAggregator;
  v2 = -[PGSearchKeywordComputerKeywordAggregator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keywordsByCategoryMaskByDateIntervalByMomentUUID = v2->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
    v2->_keywordsByCategoryMaskByDateIntervalByMomentUUID = v3;

  }
  return v2;
}

- (NSDictionary)aggregatedKeywords
{
  return (NSDictionary *)self->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
}

- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentNode:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

  v12 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v7, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uuidFromLocalIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGSearchKeywordComputerKeywordAggregator aggregateKeywordsByCategoryMask:forMomentUUID:duringDateInterval:](self, "aggregateKeywordsByCategoryMask:forMomentUUID:duringDateInterval:", v8, v14, v15);
}

- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentUUID:(id)a4 duringDateInterval:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keywordsByCategoryMaskByDateIntervalByMomentUUID, "objectForKeyedSubscript:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keywordsByCategoryMaskByDateIntervalByMomentUUID, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", v14);
  }
  else
  {
    v13 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v9);

  }
}

- (void)aggregateKeywordArraysByCategoryMask:(id)a3 forMomentUUID:(id)a4 fromUniversalStartDate:(id)a5 toEndDate:(id)a6
{
  id v10;
  NSMutableDictionary *keywordsByCategoryMaskByDateIntervalByMomentUUID;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a3;
  v10 = a4;
  keywordsByCategoryMaskByDateIntervalByMomentUUID = self->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
  v12 = a6;
  v13 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](keywordsByCategoryMaskByDateIntervalByMomentUUID, "objectForKeyedSubscript:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keywordsByCategoryMaskByDateIntervalByMomentUUID, "setObject:forKeyedSubscript:", v14, v10);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v12);

  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v15);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __128__PGSearchKeywordComputerKeywordAggregator_aggregateKeywordArraysByCategoryMask_forMomentUUID_fromUniversalStartDate_toEndDate___block_invoke;
  v19[3] = &unk_1E842F880;
  v20 = v16;
  v17 = v16;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordsByCategoryMaskByDateIntervalByMomentUUID, 0);
}

void __128__PGSearchKeywordComputerKeywordAggregator_aggregateKeywordArraysByCategoryMask_forMomentUUID_fromUniversalStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  }
  else
  {
    v9 = objc_msgSend(v6, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);
    v6 = (id)v9;
  }

}

@end
