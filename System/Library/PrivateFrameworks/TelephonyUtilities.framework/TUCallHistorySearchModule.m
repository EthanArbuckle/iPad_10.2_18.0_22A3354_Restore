@implementation TUCallHistorySearchModule

- (void)searchForString:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, TUCallHistorySearchModule *, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  TUProxyRecentCall *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void (**v47)(id, TUCallHistorySearchModule *, uint64_t);
  id v48;
  TUCallHistorySearchModule *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, TUCallHistorySearchModule *, uint64_t))a4;
  -[TUCallHistorySearchModule setSearchComplete:](self, "setSearchComplete:", 0);
  v8 = objc_msgSend(v6, "length");
  if (v8
    && (-[TUCallHistorySearchModule previousSearchString](self, "previousSearchString"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[TUCallHistorySearchModule previousSearchString](self, "previousSearchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "rangeOfString:", v10);

    v12 = v11 != 0;
  }
  else
  {
    v12 = 1;
  }
  -[TUCallHistorySearchModule setPreviousSearchString:](self, "setPreviousSearchString:", v6);
  -[TUCallHistorySearchModule currentResultsList](self, "currentResultsList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0x1E0C99000uLL;
  v48 = v6;
  v49 = self;
  v47 = v7;
  if (!v13 || v12)
  {
    -[TUCallHistorySearchModule setCurrentResultsList:](self, "setCurrentResultsList:", 0, v7, v6);
    +[TUCallHistoryController sharedController](TUCallHistoryController, "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recentCalls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      -[TUCallHistorySearchModule setCurrentResultsList:](self, "setCurrentResultsList:", v17);

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v56 != v21)
              objc_enumerationMutation(v18);
            v23 = -[TUProxyRecentCall initWithRecentCall:]([TUProxyRecentCall alloc], "initWithRecentCall:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            -[TUCallHistorySearchModule searchController](v49, "searchController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUProxyRecentCall setSearchController:](v23, "setSearchController:", v24);

            -[TUCallHistorySearchModule currentResultsList](v49, "currentResultsList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v20);
      }

      v6 = v48;
      self = v49;
      v7 = v47;
      v14 = 0x1E0C99000;
    }
    else
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[TUCallHistorySearchModule setCurrentResultsList:](self, "setCurrentResultsList:", v26);

    }
  }
  if (v8)
  {
    if (!gPhoneSeparatorCharacterSet)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "phoneNumberSeparatorCharacterSet");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)gPhoneSeparatorCharacterSet;
      gPhoneSeparatorCharacterSet = v27;

    }
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v47, v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", &stru_1E38A53C8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowercaseString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = *(void **)(v14 + 3560);
    -[TUCallHistorySearchModule currentResultsList](self, "currentResultsList");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[TUCallHistorySearchModule currentResultsList](self, "currentResultsList");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v52 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v39, "callerId");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "componentsSeparatedByCharactersInSet:", gPhoneSeparatorCharacterSet);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "componentsJoinedByString:", &stru_1E38A53C8);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "lowercaseString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v43, "containsString:", v31))
          {
            objc_msgSend(v34, "addObject:", v39);
          }
          else
          {
            objc_msgSend(v39, "backingContact");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v39, "displayName");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "lowercaseString");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v46, "containsString:", v31))
                objc_msgSend(v34, "addObject:", v39);

            }
          }

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v36);
    }

    self = v49;
    -[TUCallHistorySearchModule setCurrentResultsList:](v49, "setCurrentResultsList:", v34);

    v7 = v47;
    v6 = v48;
  }
  -[TUCallHistorySearchModule setSearchComplete:](self, "setSearchComplete:", 1, v47, v48);
  if (v7)
    v7[2](v7, self, 1);

}

- (TUSearchResults)searchResults
{
  TUSearchResults *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  TUResultGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  TUResultGroup *v11;

  v3 = objc_alloc_init(TUSearchResults);
  -[TUCallHistorySearchModule searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSearchResults setSearchController:](v3, "setSearchController:", v4);

  -[TUCallHistorySearchModule currentResultsList](self, "currentResultsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = [TUResultGroup alloc];
    TUBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECENTS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallHistorySearchModule currentResultsList](self, "currentResultsList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TUResultGroup initWithTitle:results:](v7, "initWithTitle:results:", v9, v10);
    -[TUSearchResults addResultGroup:](v3, "addResultGroup:", v11);

  }
  return v3;
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (NSMutableArray)currentResultsList
{
  return self->_currentResultsList;
}

- (void)setCurrentResultsList:(id)a3
{
  objc_storeStrong((id *)&self->_currentResultsList, a3);
}

- (NSString)previousSearchString
{
  return self->_previousSearchString;
}

- (void)setPreviousSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSearchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchString, 0);
  objc_storeStrong((id *)&self->_currentResultsList, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

@end
