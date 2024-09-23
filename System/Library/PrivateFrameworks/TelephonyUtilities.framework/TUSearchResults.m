@implementation TUSearchResults

- (TUSearchResults)initWithSearchTerm:(id)a3 shouldAddAdhocResults:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  TUSearchResults *v8;
  TUSearchResults *v9;
  BOOL v10;
  objc_super v12;

  v4 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUSearchResults;
  v8 = -[TUSearchResults init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchTerm, a3);
    if (MEMORY[0x19AEC8D00](v9->_searchTerm))
      v10 = !v4;
    else
      v10 = 1;
    if (!v10)
      -[TUSearchResults addAdhocResultGroup](v9, "addAdhocResultGroup");
  }

  return v9;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@: %li sections, %li total results"), objc_opt_class(), -[TUSearchResults numberOfSections](self, "numberOfSections"), -[TUSearchResults numberOfResults](self, "numberOfResults"));
  if (-[TUSearchResults numberOfSections](self, "numberOfSections") >= 1)
  {
    v4 = 0;
    do
    {
      -[TUSearchResults resultGroups](self, "resultGroups");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\nSection %@ (%li)"), v7, objc_msgSend(v8, "count"));

      objc_msgSend(v6, "results");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v9);

      ++v4;
    }
    while (v4 < -[TUSearchResults numberOfSections](self, "numberOfSections"));
  }
  return v3;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[TUSearchResults resultGroups](self, "resultGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfResults
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[TUSearchResults numberOfSections](self, "numberOfSections") < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    -[TUSearchResults resultGroups](self, "resultGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += objc_msgSend(v7, "count");

    ++v4;
  }
  while (v4 < -[TUSearchResults numberOfSections](self, "numberOfSections"));
  return v3;
}

- (id)resultGroupForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[TUSearchResults numberOfSections](self, "numberOfSections") <= a3)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = -[TUSearchResults numberOfSections](self, "numberOfSections") - 1;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Attempting to get section results with out of bounds range (%li) for actual range (0..%li)", (uint8_t *)&v9, 0x16u);
    }

    return 0;
  }
  else
  {
    -[TUSearchResults resultGroups](self, "resultGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (void)_clearCaches
{
  -[TUSearchResults setAllDataItemsCache:](self, "setAllDataItemsCache:", 0);
  -[TUSearchResults setAllSearchItemsCache:](self, "setAllSearchItemsCache:", 0);
}

- (void)finalizeSearchResults
{
  if (!-[TUSearchResults numberOfSections](self, "numberOfSections"))
    -[TUSearchResults addAdhocResultGroup](self, "addAdhocResultGroup");
  -[TUSearchResults removeDuplicateResults](self, "removeDuplicateResults");
}

- (void)removeDuplicateResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  TUSearchResults *v44;
  void *v45;
  id v46;
  id obj;
  id obja;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  -[TUSearchResults resultGroups](self, "resultGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("groupType=%d"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = self;
  -[TUSearchResults resultGroups](self, "resultGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("groupType=%d"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v6;
  v45 = v9;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v9;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (v52)
    {
      v50 = *(_QWORD *)v79;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v79 != v50)
            objc_enumerationMutation(obj);
          v54 = v11;
          v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v12, "results");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v75;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v75 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v18);
                v73[0] = MEMORY[0x1E0C809B0];
                v73[1] = 3221225472;
                v73[2] = __41__TUSearchResults_removeDuplicateResults__block_invoke;
                v73[3] = &unk_1E38A2F10;
                v73[4] = v19;
                if (objc_msgSend(v10, "indexOfObjectPassingTest:", v73) == 0x7FFFFFFFFFFFFFFFLL)
                  v20 = v10;
                else
                  v20 = v13;
                objc_msgSend(v20, "addObject:", v19);
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
            }
            while (v16);
          }

          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v21 = v13;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v70;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v70 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(v12, "removeSearchItem:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v25++));
              }
              while (v23 != v25);
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
            }
            while (v23);
          }

          v11 = v54 + 1;
        }
        while (v54 + 1 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      }
      while (v52);
    }

    v6 = v49;
    v9 = v45;
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v46 = v9;
    v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
    if (v51)
    {
      obja = *(id *)v66;
      do
      {
        v26 = 0;
        do
        {
          if (*(id *)v66 != obja)
            objc_enumerationMutation(v46);
          v53 = v26;
          v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v26);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v6, "results");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v62;
            do
            {
              v32 = 0;
              do
              {
                if (*(_QWORD *)v62 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v32);
                objc_msgSend(v27, "results");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v60[0] = MEMORY[0x1E0C809B0];
                v60[1] = 3221225472;
                v60[2] = __41__TUSearchResults_removeDuplicateResults__block_invoke_2;
                v60[3] = &unk_1E38A2F10;
                v60[4] = v33;
                v35 = objc_msgSend(v34, "indexOfObjectPassingTest:", v60);

                if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                  objc_msgSend(v55, "addObject:", v33);
                ++v32;
              }
              while (v30 != v32);
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
            }
            while (v30);
          }

          v26 = v53 + 1;
          v6 = v49;
        }
        while (v53 + 1 != v51);
        v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
      }
      while (v51);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v36 = v55;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v57;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(v6, "removeSearchItem:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v40++));
        }
        while (v38 != v40);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
      }
      while (v38);
    }

    v9 = v45;
  }
  if (v6)
  {
    objc_msgSend(v6, "results");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (!v42)
    {
      -[TUSearchResults resultGroups](v44, "resultGroups");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeObject:", v6);

    }
  }

}

uint64_t __41__TUSearchResults_removeDuplicateResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "backingContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backingContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __41__TUSearchResults_removeDuplicateResults__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "destinationId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "destinationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)addAdhocResultGroup
{
  void *v3;
  TUResultGroup *v4;
  void *v5;
  TUResultGroup *v6;
  TUAdhocResult *v7;

  if (-[NSString length](self->_searchTerm, "length"))
  {
    v7 = -[TUAdhocResult initWithString:]([TUAdhocResult alloc], "initWithString:", self->_searchTerm);
    -[TUSearchResults searchController](self, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAdhocResult setSearchController:](v7, "setSearchController:", v3);

    v4 = [TUResultGroup alloc];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUResultGroup initWithTitle:results:](v4, "initWithTitle:results:", 0, v5);

    -[TUSearchResults addResultGroup:](self, "addResultGroup:", v6);
  }
}

- (void)addResultGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUSearchResults resultGroups](self, "resultGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[TUSearchResults setResultGroups:](self, "setResultGroups:", v6);

  }
  -[TUSearchResults resultGroups](self, "resultGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[TUSearchResults _clearCaches](self, "_clearCaches");
}

- (void)addSearchResults:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "numberOfSections") >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v6, "resultGroupForSection:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUSearchResults addResultGroup:](self, "addResultGroup:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v6, "numberOfSections"));
  }
  -[TUSearchResults _clearCaches](self, "_clearCaches");

}

- (void)removeSearchItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TUSearchResults resultGroups](self, "resultGroups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "removeSearchItem:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[TUSearchResults allSearchItemsCache](self, "allSearchItemsCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  -[TUSearchResults allDataItemsCache](self, "allDataItemsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v4);

}

- (int64_t)numberOfTableViewRows
{
  void *v2;
  int64_t v3;

  -[TUSearchResults allSearchItems](self, "allSearchItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)allSearchItems
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[TUSearchResults allSearchItemsCache](self, "allSearchItemsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[TUSearchResults numberOfResults](self, "numberOfResults")+ -[TUSearchResults numberOfSections](self, "numberOfSections"));
    -[TUSearchResults setAllSearchItemsCache:](self, "setAllSearchItemsCache:", v4);

    if (-[TUSearchResults numberOfSections](self, "numberOfSections") >= 1)
    {
      v5 = 0;
      do
      {
        -[TUSearchResults resultGroups](self, "resultGroups");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[TUSearchResults allSearchItemsCache](self, "allSearchItemsCache");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

        }
        -[TUSearchResults allSearchItemsCache](self, "allSearchItemsCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "results");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        ++v5;
      }
      while (v5 < -[TUSearchResults numberOfSections](self, "numberOfSections"));
    }
  }
  return (NSArray *)-[TUSearchResults allSearchItemsCache](self, "allSearchItemsCache");
}

- (NSArray)allDataItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  TUAdhocResult *v7;
  void *v8;
  TUAdhocResult *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[TUSearchResults allDataItemsCache](self, "allDataItemsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[TUSearchResults numberOfResults](self, "numberOfResults"));
    -[TUSearchResults setAllDataItemsCache:](self, "setAllDataItemsCache:", v4);

    -[TUSearchResults searchTerm](self, "searchTerm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = [TUAdhocResult alloc];
      -[TUSearchResults searchTerm](self, "searchTerm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[TUAdhocResult initWithString:](v7, "initWithString:", v8);

      -[TUSearchResults searchController](self, "searchController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUAdhocResult setSearchController:](v9, "setSearchController:", v10);

      -[TUSearchResults allDataItemsCache](self, "allDataItemsCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v9);

    }
    if (-[TUSearchResults numberOfSections](self, "numberOfSections") >= 1)
    {
      v12 = 0;
      do
      {
        -[TUSearchResults resultGroups](self, "resultGroups");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUSearchResults allDataItemsCache](self, "allDataItemsCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v16);

        ++v12;
      }
      while (v12 < -[TUSearchResults numberOfSections](self, "numberOfSections"));
    }
  }
  return (NSArray *)-[TUSearchResults allDataItemsCache](self, "allDataItemsCache");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
    objc_storeWeak(v4 + 3, WeakRetained);

    objc_storeStrong(v4 + 1, self->_searchTerm);
    objc_storeStrong(v4 + 2, self->_resultGroups);
    objc_storeStrong(v4 + 4, self->_allSearchItemsCache);
    objc_storeStrong(v4 + 5, self->_allDataItemsCache);
  }
  return v4;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (NSMutableArray)resultGroups
{
  return self->_resultGroups;
}

- (void)setResultGroups:(id)a3
{
  objc_storeStrong((id *)&self->_resultGroups, a3);
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (NSMutableArray)allSearchItemsCache
{
  return self->_allSearchItemsCache;
}

- (void)setAllSearchItemsCache:(id)a3
{
  objc_storeStrong((id *)&self->_allSearchItemsCache, a3);
}

- (NSMutableArray)allDataItemsCache
{
  return self->_allDataItemsCache;
}

- (void)setAllDataItemsCache:(id)a3
{
  objc_storeStrong((id *)&self->_allDataItemsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDataItemsCache, 0);
  objc_storeStrong((id *)&self->_allSearchItemsCache, 0);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_resultGroups, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
}

@end
