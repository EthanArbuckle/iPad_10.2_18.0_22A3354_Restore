@implementation SCWWatchlistDiff

- (SCWWatchlistDiff)initWithOldSymbols:(id)a3 newSymbols:(id)a4 updatedName:(id)a5 updatedSortState:(id)a6 updatedSortOrderState:(id)a7 updatedDisplayState:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SCWWatchlistDiff *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  id v37;
  NSDictionary *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSString *updatedName;
  uint64_t v48;
  NSArray *symbolsPreDiff;
  uint64_t v50;
  NSArray *symbolsPostDiff;
  uint64_t v52;
  NSArray *addedSymbols;
  NSDictionary *indexesOfAddedSymbols;
  uint64_t v55;
  NSArray *removedSymbols;
  uint64_t v57;
  NSArray *reorderedSymbols;
  NSDictionary *indexesOfReorderedSymbols;
  NSDictionary *v60;
  uint64_t v61;
  NSNumber *updatedSortState;
  uint64_t v63;
  NSNumber *updatedSortOrderState;
  uint64_t v65;
  NSNumber *updatedDisplayState;
  NSDictionary *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  SCWWatchlistDiff *v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  objc_super v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v90.receiver = self;
  v90.super_class = (Class)SCWWatchlistDiff;
  v20 = -[SCWWatchlistDiff init](&v90, sel_init);
  if (v20)
  {
    v75 = v19;
    v76 = v18;
    v78 = v17;
    v80 = v14;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v79, "minusSet:", v22);
    v73 = v22;
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    v74 = v21;
    objc_msgSend(v23, "minusSet:", v21);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v23;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v87 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v29));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v24, "setObject:forKey:", v30, v29);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v80);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minusSet:", v79);
    objc_msgSend(v31, "minusSet:", obj);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "minusSet:", v79);
    objc_msgSend(v32, "minusSet:", obj);
    objc_msgSend((id)objc_opt_class(), "reorderedSymbolsFrom:to:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v20;
    v71 = v32;
    v72 = v31;
    objc_msgSend((id)objc_opt_class(), "reorderedSymbolsFrom:to:", v32, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "count");
    v69 = v34;
    v70 = v33;
    if (v35 >= objc_msgSend(v34, "count"))
      v36 = v34;
    else
      v36 = v33;
    v37 = v36;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v83 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v44));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v38, "setObject:forKey:", v45, v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      }
      while (v41);
    }

    v46 = objc_msgSend(v16, "copy");
    updatedName = v77->_updatedName;
    v77->_updatedName = (NSString *)v46;

    v14 = v80;
    v48 = objc_msgSend(v80, "copy");
    symbolsPreDiff = v77->_symbolsPreDiff;
    v77->_symbolsPreDiff = (NSArray *)v48;

    v50 = objc_msgSend(v15, "copy");
    symbolsPostDiff = v77->_symbolsPostDiff;
    v77->_symbolsPostDiff = (NSArray *)v50;

    objc_msgSend(obj, "allObjects");
    v52 = objc_claimAutoreleasedReturnValue();
    addedSymbols = v77->_addedSymbols;
    v77->_addedSymbols = (NSArray *)v52;

    indexesOfAddedSymbols = v77->_indexesOfAddedSymbols;
    v77->_indexesOfAddedSymbols = v24;
    v68 = v24;

    objc_msgSend(v79, "allObjects");
    v55 = objc_claimAutoreleasedReturnValue();
    removedSymbols = v77->_removedSymbols;
    v77->_removedSymbols = (NSArray *)v55;

    objc_msgSend(v39, "allObjects");
    v57 = objc_claimAutoreleasedReturnValue();
    reorderedSymbols = v77->_reorderedSymbols;
    v77->_reorderedSymbols = (NSArray *)v57;

    indexesOfReorderedSymbols = v77->_indexesOfReorderedSymbols;
    v77->_indexesOfReorderedSymbols = v38;
    v60 = v38;

    v20 = v77;
    v17 = v78;
    v61 = objc_msgSend(v78, "copy");
    updatedSortState = v77->_updatedSortState;
    v77->_updatedSortState = (NSNumber *)v61;

    v18 = v76;
    v63 = objc_msgSend(v76, "copy");
    updatedSortOrderState = v77->_updatedSortOrderState;
    v77->_updatedSortOrderState = (NSNumber *)v63;

    v19 = v75;
    v65 = objc_msgSend(v75, "copy");
    updatedDisplayState = v77->_updatedDisplayState;
    v77->_updatedDisplayState = (NSNumber *)v65;

  }
  return v20;
}

+ (id)reorderedSymbolsFrom:(id)a3 to:(id)a4
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SCWWatchlistDiff addedSymbols](self, "addedSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[SCWWatchlistDiff removedSymbols](self, "removedSymbols");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[SCWWatchlistDiff reorderedSymbols](self, "reorderedSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 0;
      }
      else
      {
        -[SCWWatchlistDiff updatedName](self, "updatedName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          v4 = 0;
        }
        else
        {
          -[SCWWatchlistDiff updatedSortState](self, "updatedSortState");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 0;
          }
          else
          {
            -[SCWWatchlistDiff updatedSortOrderState](self, "updatedSortOrderState");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 0;
            }
            else
            {
              -[SCWWatchlistDiff updatedDisplayState](self, "updatedDisplayState");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = v10 == 0;

            }
          }

        }
      }

    }
  }

  return v4;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (NSArray)addedSymbols
{
  return self->_addedSymbols;
}

- (NSDictionary)indexesOfAddedSymbols
{
  return self->_indexesOfAddedSymbols;
}

- (NSArray)removedSymbols
{
  return self->_removedSymbols;
}

- (NSArray)reorderedSymbols
{
  return self->_reorderedSymbols;
}

- (NSDictionary)indexesOfReorderedSymbols
{
  return self->_indexesOfReorderedSymbols;
}

- (NSArray)symbolsPreDiff
{
  return self->_symbolsPreDiff;
}

- (NSArray)symbolsPostDiff
{
  return self->_symbolsPostDiff;
}

- (NSNumber)updatedSortState
{
  return self->_updatedSortState;
}

- (NSNumber)updatedSortOrderState
{
  return self->_updatedSortOrderState;
}

- (NSNumber)updatedDisplayState
{
  return self->_updatedDisplayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDisplayState, 0);
  objc_storeStrong((id *)&self->_updatedSortOrderState, 0);
  objc_storeStrong((id *)&self->_updatedSortState, 0);
  objc_storeStrong((id *)&self->_symbolsPostDiff, 0);
  objc_storeStrong((id *)&self->_symbolsPreDiff, 0);
  objc_storeStrong((id *)&self->_indexesOfReorderedSymbols, 0);
  objc_storeStrong((id *)&self->_reorderedSymbols, 0);
  objc_storeStrong((id *)&self->_removedSymbols, 0);
  objc_storeStrong((id *)&self->_indexesOfAddedSymbols, 0);
  objc_storeStrong((id *)&self->_addedSymbols, 0);
  objc_storeStrong((id *)&self->_updatedName, 0);
}

@end
