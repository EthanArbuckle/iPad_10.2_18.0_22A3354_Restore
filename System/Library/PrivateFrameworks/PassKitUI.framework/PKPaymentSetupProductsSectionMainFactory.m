@implementation PKPaymentSetupProductsSectionMainFactory

+ (void)generateSectionsWithDefaultSortingForItems:(id)a3 withContext:(id)a4 outSectionIdentifierToItemIdentifierMapping:(id *)a5 outOrderedSectionIdentifiers:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a4;
  v15 = (id)objc_msgSend(a3, "mutableCopy");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PKPaymentSetupProductsSectionNearbyFactory generateSectionWithDefaultSortingForItems:withContext:](PKPaymentSetupProductsSectionNearbyFactory, "generateSectionWithDefaultSortingForItems:withContext:", v15, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safelyAddObject:", v12);
  objc_msgSend(v12, "sectionListItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:", v13);

  +[PKPaymentSetupProductsSectionAlphabeticalFactory generateSectionWithDefaultSortingForItems:withContext:](PKPaymentSetupProductsSectionAlphabeticalFactory, "generateSectionWithDefaultSortingForItems:withContext:", v15, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObjectsFromArray:", v14);
  objc_msgSend(a1, "_buildSectionIdentifierToItemIdentifierMappingFromSections:", v11);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_31);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

uint64_t __172__PKPaymentSetupProductsSectionMainFactory_generateSectionsWithDefaultSortingForItems_withContext_outSectionIdentifierToItemIdentifierMapping_outOrderedSectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (void)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5 outSectionIdentifierToItemIdentifierMapping:(id *)a6 outOrderedSectionIdentifiers:(id *)a7
{
  id v10;

  +[PKPaymentSetupProductsSectionSearchFactory generateSectionsWithSearchFilter:forItems:withContext:](PKPaymentSetupProductsSectionSearchFactory, "generateSectionsWithSearchFilter:forItems:withContext:", a3, a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_buildSectionIdentifierToItemIdentifierMappingFromSections:", v10);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_arrayByApplyingBlock:", &__block_literal_global_11);
  *a7 = (id)objc_claimAutoreleasedReturnValue();

}

uint64_t __171__PKPaymentSetupProductsSectionMainFactory_generateSectionsWithSearchFilter_forItems_withContext_outSectionIdentifierToItemIdentifierMapping_outOrderedSectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)_buildSectionIdentifierToItemIdentifierMappingFromSections:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "sectionListItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v16, "setSectionIdentifier:", v9);
              objc_msgSend(v16, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v17);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v13);
        }

        objc_msgSend(v21, "setObject:forKey:", v10, v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

@end
