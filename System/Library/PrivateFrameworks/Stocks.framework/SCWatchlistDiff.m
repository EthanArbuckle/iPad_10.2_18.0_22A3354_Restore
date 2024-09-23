@implementation SCWatchlistDiff

- (SCWatchlistDiff)initWithOldStocks:(id)a3 newStocks:(id)a4
{
  id v6;
  id v7;
  SCWatchlistDiff *v8;
  SCWatchlistDiff *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  NSDictionary *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *stocksPreDiff;
  uint64_t v37;
  NSArray *stocksPostDiff;
  uint64_t v39;
  NSArray *addedStocks;
  NSDictionary *indexesOfAddedStocks;
  NSDictionary *v42;
  uint64_t v43;
  NSArray *removedStocks;
  uint64_t v45;
  NSArray *reorderedStocks;
  NSDictionary *indexesOfReorderedStocks;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  SCWatchlistDiff *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v67.receiver = self;
  v67.super_class = (Class)SCWatchlistDiff;
  v8 = -[SCWatchlistDiff init](&v67, sel_init);
  v9 = v8;
  if (v8)
  {
    v57 = v8;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v56, "minusSet:", v11);
    v53 = v11;
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    v54 = v10;
    objc_msgSend(v12, "minusSet:", v10);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "indexOfObject:", v18));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v19, v18);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v15);
    }

    v55 = v6;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minusSet:", v56);
    objc_msgSend(v20, "minusSet:", obj);
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minusSet:", v56);
    objc_msgSend(v21, "minusSet:", obj);
    objc_msgSend((id)objc_opt_class(), "reorderedStocksFrom:to:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v21;
    v52 = v20;
    objc_msgSend((id)objc_opt_class(), "reorderedStocksFrom:to:", v21, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "count");
    v49 = v23;
    v50 = v22;
    if (v24 >= objc_msgSend(v23, "count"))
      v25 = v23;
    else
      v25 = v22;
    v26 = v25;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v60 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "indexOfObject:", v33, v49, v50));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v27, "setObject:forKey:", v34, v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v30);
    }

    v6 = v55;
    v35 = objc_msgSend(v55, "copy");
    v9 = v57;
    stocksPreDiff = v57->_stocksPreDiff;
    v57->_stocksPreDiff = (NSArray *)v35;

    v37 = objc_msgSend(v7, "copy");
    stocksPostDiff = v57->_stocksPostDiff;
    v57->_stocksPostDiff = (NSArray *)v37;

    objc_msgSend(obj, "allObjects");
    v39 = objc_claimAutoreleasedReturnValue();
    addedStocks = v57->_addedStocks;
    v57->_addedStocks = (NSArray *)v39;

    indexesOfAddedStocks = v57->_indexesOfAddedStocks;
    v57->_indexesOfAddedStocks = v13;
    v42 = v13;

    objc_msgSend(v56, "allObjects");
    v43 = objc_claimAutoreleasedReturnValue();
    removedStocks = v57->_removedStocks;
    v57->_removedStocks = (NSArray *)v43;

    objc_msgSend(v28, "allObjects");
    v45 = objc_claimAutoreleasedReturnValue();
    reorderedStocks = v57->_reorderedStocks;
    v57->_reorderedStocks = (NSArray *)v45;

    indexesOfReorderedStocks = v57->_indexesOfReorderedStocks;
    v57->_indexesOfReorderedStocks = v27;

  }
  return v9;
}

+ (id)reorderedStocksFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  v10 = v9;
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "indexOfObject:", v11);
    if (v12)
      objc_msgSend(v7, "addObject:", v11);
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    objc_msgSend(v8, "removeObjectAtIndex:", v12);

    v9 = v10;
  }

  return v7;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[SCWatchlistDiff addedStocks](self, "addedStocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[SCWatchlistDiff removedStocks](self, "removedStocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[SCWatchlistDiff reorderedStocks](self, "reorderedStocks");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") == 0;

    }
  }

  return v4;
}

- (NSArray)addedStocks
{
  return self->_addedStocks;
}

- (NSDictionary)indexesOfAddedStocks
{
  return self->_indexesOfAddedStocks;
}

- (NSArray)removedStocks
{
  return self->_removedStocks;
}

- (NSArray)reorderedStocks
{
  return self->_reorderedStocks;
}

- (NSDictionary)indexesOfReorderedStocks
{
  return self->_indexesOfReorderedStocks;
}

- (NSArray)stocksPreDiff
{
  return self->_stocksPreDiff;
}

- (NSArray)stocksPostDiff
{
  return self->_stocksPostDiff;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stocksPostDiff, 0);
  objc_storeStrong((id *)&self->_stocksPreDiff, 0);
  objc_storeStrong((id *)&self->_indexesOfReorderedStocks, 0);
  objc_storeStrong((id *)&self->_reorderedStocks, 0);
  objc_storeStrong((id *)&self->_removedStocks, 0);
  objc_storeStrong((id *)&self->_indexesOfAddedStocks, 0);
  objc_storeStrong((id *)&self->_addedStocks, 0);
}

@end
