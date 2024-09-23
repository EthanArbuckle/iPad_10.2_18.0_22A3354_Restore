@implementation PKPaymentSetupProductsSectionAlphabeticalFactory

+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "_createSectionsListFromListItems:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_applyDefaultSortToSectionList:usingContext:", v7, v6);

  return v7;
}

+ (id)_createSectionsListFromListItems:(id)a3
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "sectionIdentifier");
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
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "sectionListItems", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sortUsingComparator:", &__block_literal_global_221);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v16;
}

uint64_t __85__PKPaymentSetupProductsSectionAlphabeticalFactory__createSectionsListFromListItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PKAddADifferentCardListItemIdentifier"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PKAddADifferentCardListItemIdentifier"));

    if ((v10 & 1) != 0)
    {
      v8 = -1;
    }
    else
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

    }
  }

  return v8;
}

+ (void)_applyDefaultSortToSectionList:(id)a3 usingContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "primaryCountryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryCountryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "isEqualToString:", v8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__PKPaymentSetupProductsSectionAlphabeticalFactory__applyDefaultSortToSectionList_usingContext___block_invoke;
  v12[3] = &unk_1E3E78E40;
  v15 = v9 ^ 1;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v6, "sortUsingComparator:", v12);

}

uint64_t __96__PKPaymentSetupProductsSectionAlphabeticalFactory__applyDefaultSortToSectionList_usingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
LABEL_4:
    v8 = 1;
    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
LABEL_9:
    v8 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v7);
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 48) && (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      goto LABEL_4;
    goto LABEL_9;
  }
LABEL_2:
  v8 = -1;
LABEL_10:

  return v8;
}

@end
