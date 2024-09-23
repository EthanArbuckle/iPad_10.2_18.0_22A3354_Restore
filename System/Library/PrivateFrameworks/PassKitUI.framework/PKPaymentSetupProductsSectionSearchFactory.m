@implementation PKPaymentSetupProductsSectionSearchFactory

+ (id)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "_filteredListItemsFromSearchFilter:withContext:listItems:outSectionIdentifierToSearchRankingMapping:", a3, a5, a4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  objc_msgSend(a1, "_createSortedSectionsListFromFilteredListItems:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_applySortToSectionList:usingSearchRankingMapping:", v8, v7);

  return v8;
}

+ (id)_filteredListItemsFromSearchFilter:(id)a3 withContext:(id)a4 listItems:(id)a5 outSectionIdentifierToSearchRankingMapping:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  PKProductSearchResult *v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  PKProductSectionSearchResult *v39;
  double v40;
  id v41;
  id *v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v43 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = v10;
  objc_msgSend(v10, "tokenizerCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v9;
  objc_msgSend(a1, "_cleanedSearchTermsFromString:usingTokenizerCharacterSet:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v52 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v20, "searchTerms", v43);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          objc_msgSend(a1, "_distanceBetweenTerms:andSearchTerms:", v21, v13);
          if (v22 < 1.0)
          {
            v23 = -[PKProductSearchResult initWithListItem:searchDistance:]([PKProductSearchResult alloc], "initWithListItem:searchDistance:", v20, v22);
            objc_msgSend(v14, "addObject:", v23);

          }
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v17);
  }

  objc_msgSend(v14, "sortUsingComparator:", &__block_literal_global_28);
  objc_msgSend(v14, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "searchDistance");
  v26 = v25 <= 0.3;

  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v28 = v14;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = dbl_19DF15040[v26];
    v32 = *(_QWORD *)v48;
LABEL_13:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v32)
        objc_enumerationMutation(v28);
      v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v33);
      objc_msgSend(v34, "searchDistance", v43);
      if (v35 > v31)
        break;
      v36 = v35;
      objc_msgSend(v34, "listItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v37);
      objc_msgSend(v37, "sectionIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", v38);
      v39 = (PKProductSectionSearchResult *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        v39 = objc_alloc_init(PKProductSectionSearchResult);
        objc_msgSend(v27, "setObject:forKey:", v39, v38);
      }
      -[PKProductSectionSearchResult searchDistance](v39, "searchDistance");
      -[PKProductSectionSearchResult setSearchDistance:](v39, "setSearchDistance:", v36 + v40);
      -[PKProductSectionSearchResult setNumberOfResults:](v39, "setNumberOfResults:", -[PKProductSectionSearchResult numberOfResults](v39, "numberOfResults") + 1);

      if (v30 == ++v33)
      {
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v30)
          goto LABEL_13;
        break;
      }
    }
  }

  v41 = objc_retainAutorelease(v27);
  *v43 = v41;

  return v46;
}

uint64_t __146__PKPaymentSetupProductsSectionSearchFactory__filteredListItemsFromSearchFilter_withContext_listItems_outSectionIdentifierToSearchRankingMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "searchDistance");
  v7 = v6;
  objc_msgSend(v5, "searchDistance");
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      objc_msgSend(v4, "listItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "listItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v13);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (id)_createSortedSectionsListFromFilteredListItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  PKPaymentSetupProductsSectionListSection *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "sectionIdentifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (PKPaymentSetupProductsSectionListSection *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = -[PKPaymentSetupProductsSectionListSection initWithIdentifier:]([PKPaymentSetupProductsSectionListSection alloc], "initWithIdentifier:", v11);
          objc_msgSend(v4, "setObject:forKey:", v12, v11);
        }
        -[PKPaymentSetupProductsSectionListSection sectionListItems](v12, "sectionListItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  return v15;
}

+ (void)_applySortToSectionList:(id)a3 usingSearchRankingMapping:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__PKPaymentSetupProductsSectionSearchFactory__applySortToSectionList_usingSearchRankingMapping___block_invoke;
  v7[3] = &unk_1E3E64520;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortUsingComparator:", v7);

}

uint64_t __96__PKPaymentSetupProductsSectionSearchFactory__applySortToSectionList_usingSearchRankingMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "normalizedSearchDistance");
  v11 = v10;
  objc_msgSend(v9, "normalizedSearchDistance");
  if (v11 < v12)
    v13 = -1;
  else
    v13 = v11 > v12;

  return v13;
}

+ (double)_distanceBetweenTerms:(id)a3 andSearchTerms:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = a4;
  v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v7 = *(_QWORD *)v34;
    v8 = 0.0;
    v9 = 0.0;
    v27 = v6;
    v28 = v5;
    v24 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v6);
        v26 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v10);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v12 = v5;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              v18 = objc_msgSend(v17, "length");
              objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v17, "rangeOfString:options:range:locale:", v11, 8, 0, v18, v19);

              if (v20 != 0x7FFFFFFFFFFFFFFFLL)
              {

                v6 = v27;
                v22 = 0.0;
                v5 = v28;
                goto LABEL_20;
              }
              v8 = v8 + 1.0;
              objc_msgSend(v17, "pk_normalizedLevenshteinDistanceFromString:decimalPlaces:", v11, 1);
              v9 = v9 + v21;
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v14)
              continue;
            break;
          }
        }

        v10 = v26 + 1;
        v6 = v27;
        v5 = v28;
        v7 = v24;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
  }

  v22 = v9 / v8;
LABEL_20:

  return v22;
}

+ (id)_cleanedSearchTermsFromString:(id)a3 usingTokenizerCharacterSet:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "localizedLowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

@end
