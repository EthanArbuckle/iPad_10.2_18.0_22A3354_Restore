@implementation WBSStartPageSectionManager

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

WBSStartPageSectionDescriptor *__53__WBSStartPageSectionManager_readAndValidateSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSStartPageSectionDescriptor *v3;

  v2 = a2;
  v3 = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:]([WBSStartPageSectionDescriptor alloc], "initWithIdentifier:enabled:", v2, 1);

  return v3;
}

void __53__WBSStartPageSectionManager_readAndValidateSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (id)_migrateUnknownSectionIdentifiersIntoCurrentSections:(id)a3 didChangeSections:(BOOL *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  WBSStartPageSectionDescriptor *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v36;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "allSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke;
  v67[3] = &unk_1E4B3FDB8;
  v8 = v5;
  v68 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v67);

  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = -1;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_2;
  v55[3] = &unk_1E4B3FDE0;
  v57 = &v63;
  v58 = &v59;
  v9 = v8;
  v56 = v9;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v55);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("suggestionsItemIdentifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && v64[3] != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("suggestionsItemIdentifier"));

  }
  os_unfair_lock_lock(&self->_lock);
  v11 = (void *)-[NSArray copy](self->_cachedSections, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_3;
  v53[3] = &unk_1E4B3FE08;
  v12 = v9;
  v54 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v53);
  objc_msgSend(v12, "keysSortedByValueUsingSelector:", sel_compare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v39, "mutableCopy");
  v36 = v11;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("suggestionsItemIdentifier")))
          v19 = *((unsigned __int8 *)v60 + 24);
        else
          v19 = 1;
        v20 = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:]([WBSStartPageSectionDescriptor alloc], "initWithIdentifier:enabled:", v18, v19 != 0);
        objc_msgSend(v12, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntValue");

        objc_msgSend(v14, "insertObject:atIndex:", v20, v22);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v28);

      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = v39;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v34);

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v69, 16);
    }
    while (v31);
  }

  *a4 = objc_msgSend(v23, "isEqualToSet:", v29) ^ 1;
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v24;
}

id __55__WBSStartPageSectionManager_enabledSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;

  v2 = a2;
  v3 = objc_msgSend(v2, "isEnabled");
  if (!objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
  {
    if (!v3)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v2, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("frequentlyVisitedItemIdentifier"));

  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 | objc_msgSend(v6, "isEqualToString:", CFSTR("exploreItemIdentifier"));

  objc_msgSend(v2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 & ((v7 | objc_msgSend(v8, "isEqualToString:", CFSTR("highlightsItemIdentifier"))) ^ 1);

  if ((v9 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v10 = 0;
LABEL_6:

  return v10;
}

+ (NSArray)allSections
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("favoritesItemIdentifier");
  v3[1] = CFSTR("suggestionsItemIdentifier");
  v3[2] = CFSTR("frequentlyVisitedItemIdentifier");
  v3[3] = CFSTR("highlightsItemIdentifier");
  v3[4] = CFSTR("privacyReportIdentifier");
  v3[5] = CFSTR("readingListItemIdentifier");
  v3[6] = CFSTR("recentlyClosedTabsInTabGroupItemIdentifier");
  v3[7] = CFSTR("cloudTabsItemIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (WBSStartPageSectionManager)initWithStorage:(id)a3
{
  WBSStartPageSectionManagerStorage *v4;
  WBSStartPageSectionManager *v5;
  WBSStartPageSectionManagerStorage *storage;
  WBSStartPageSectionManagerStorage *v7;
  objc_super v9;

  v4 = (WBSStartPageSectionManagerStorage *)a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSStartPageSectionManager;
  v5 = -[WBSStartPageSectionManager init](&v9, sel_init);
  v5->_lock._os_unfair_lock_opaque = 0;
  storage = v5->_storage;
  v5->_storage = v4;
  v7 = v4;

  -[WBSStartPageSectionManagerStorage addObserver:forKeyPath:options:context:](v5->_storage, "addObserver:forKeyPath:options:context:", v5, CFSTR("StartPageSections"), 0, kvoContext);
  return v5;
}

- (id)sectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[WBSStartPageSectionManager sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = indexOfSectionWithIdentifier(v5, v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSArray)enabledSectionIdentifiers
{
  void *v2;
  void *v3;

  -[WBSStartPageSectionManager sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_68_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)sections
{
  os_unfair_lock_s *p_lock;
  NSArray *cachedSections;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSections = self->_cachedSections;
  if (cachedSections)
  {
    v5 = (void *)-[NSArray copy](cachedSections, "copy");
  }
  else
  {
    ++self->_ignoreChanges;
    os_unfair_lock_unlock(p_lock);
    -[WBSStartPageSectionManager readAndValidateSections]((const os_unfair_lock *)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(p_lock);
    --self->_ignoreChanges;
    objc_storeStrong((id *)&self->_cachedSections, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (id)readAndValidateSections
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id *v16;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v1 = (id *)a1;
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 8);
    objc_msgSend(v1[1], "startPageSectionDescriptors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    if (v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __53__WBSStartPageSectionManager_readAndValidateSections__block_invoke;
      v19[3] = &unk_1E4B3FE30;
      v20 = v5;
      v21 = v4;
      v6 = v4;
      v7 = v5;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v19);
      objc_msgSend(v3, "removeObjectsAtIndexes:", v6);

      v18 = 0;
      objc_msgSend(v1, "_migrateUnknownSectionIdentifiersIntoCurrentSections:didChangeSections:", v3, &v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v18)
      {
        v10 = v8;

        if (v18)
          objc_msgSend(v1, "saveSections:andUpdateInMemoryCache:", v10, 0);
      }
      else
      {
        v10 = v3;
      }
      v16 = (id *)v10;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "allSections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_86);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      if (v1[1] == v14)
      {
        if (objc_msgSend(v14, "BOOLForKey:", CFSTR("HideFrequentlyVisitedSites")))
        {
          v15 = indexOfSectionWithIdentifier(v13, CFSTR("frequentlyVisitedItemIdentifier"));
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v13, "removeObjectAtIndex:", v15);
        }
      }
      objc_msgSend(v1, "saveSections:andUpdateInMemoryCache:", v13, 0);
      v16 = v13;
    }
    v1 = v16;

  }
  return v1;
}

- (void)saveSections:(id)a3 andUpdateInMemoryCache:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  NSArray *cachedSections;
  id v8;

  v4 = a4;
  v8 = a3;
  -[WBSStartPageSectionManagerStorage setStartPageSectionDescriptors:](self->_storage, "setStartPageSectionDescriptors:");
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    cachedSections = self->_cachedSections;
    self->_cachedSections = v6;

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[WBSStartPageSectionManagerStorage removeObserver:forKeyPath:context:](self->_storage, "removeObserver:forKeyPath:context:", self, CFSTR("StartPageSections"), kvoContext);
  v3.receiver = self;
  v3.super_class = (Class)WBSStartPageSectionManager;
  -[WBSStartPageSectionManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (WBSStartPageSectionManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_95);
  return (WBSStartPageSectionManager *)(id)defaultManager_defaultManager;
}

void __44__WBSStartPageSectionManager_defaultManager__block_invoke()
{
  WBSStartPageSectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSStartPageSectionManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (WBSStartPageSectionManager)init
{
  void *v3;
  WBSStartPageSectionManager *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSStartPageSectionManager initWithStorage:](self, "initWithStorage:", v3);

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)kvoContext == a6)
  {
    -[WBSStartPageSectionManager invalidateCache](self, "invalidateCache", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WBSStartPageSectionManager;
    -[WBSStartPageSectionManager observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSArray)suggestionsDataSourceSections
{
  void *v2;
  void *v3;

  -[WBSStartPageSectionManager sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_66_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __59__WBSStartPageSectionManager_suggestionsDataSourceSections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("frequentlyVisitedItemIdentifier")) & 1) != 0)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("highlightsItemIdentifier")))
      v4 = v2;
    else
      v4 = 0;

  }
  return v4;
}

- (NSArray)sectionIdentifiers
{
  void *v2;
  void *v3;

  -[WBSStartPageSectionManager sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_70_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __48__WBSStartPageSectionManager_sectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)cloudKitStartPageSectionOrder
{
  void *v2;
  void *v3;

  -[WBSStartPageSectionManager _updateCloudKitStartPageSectionOrderPreferenceKey](self);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", *MEMORY[0x1E0D89DC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_updateCloudKitStartPageSectionOrderPreferenceKey
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D89DC8];
    objc_msgSend(v2, "arrayForKey:", *MEMORY[0x1E0D89DC8]);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(a1, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __79__WBSStartPageSectionManager__updateCloudKitStartPageSectionOrderPreferenceKey__block_invoke;
      v10[3] = &unk_1E4B3FD40;
      v11 = v5;
      v12 = v9;
      v7 = v6;
      objc_msgSend(v4, "sortUsingComparator:", v10);

    }
    else
    {
      v4 = (void *)objc_msgSend(v5, "mutableCopy");
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v4, v3);

  }
}

uint64_t __79__WBSStartPageSectionManager__updateCloudKitStartPageSectionOrderPreferenceKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

- (void)resetToDefault
{
  -[WBSStartPageSectionManagerStorage setStartPageSectionDescriptors:](self->_storage, "setStartPageSectionDescriptors:", 0);
}

- (void)reorderSectionsToMatchOrderedIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9 + v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 += v11;
    }
    while (v8);
  }

  -[WBSStartPageSectionManager sections](self, "sections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__WBSStartPageSectionManager_reorderSectionsToMatchOrderedIdentifiers___block_invoke;
  v19[3] = &unk_1E4B3FD68;
  v16 = v5;
  v20 = v16;
  objc_msgSend(v15, "sortUsingComparator:", v19);
  if ((objc_msgSend(v14, "isEqualToArray:", v15) & 1) == 0)
  {
    v18 = 0;
    -[WBSStartPageSectionManager _migrateUnknownSectionIdentifiersIntoCurrentSections:didChangeSections:](self, "_migrateUnknownSectionIdentifiersIntoCurrentSections:didChangeSections:", v15, &v18);
    v17 = objc_claimAutoreleasedReturnValue();

    -[WBSStartPageSectionManager saveSections:andUpdateInMemoryCache:](self, "saveSections:andUpdateInMemoryCache:", v17, 1);
    v15 = (void *)v17;
  }

}

uint64_t __71__WBSStartPageSectionManager_reorderSectionsToMatchOrderedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v11)
      v12 = objc_msgSend(v8, "compare:", v11);
    else
      v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)setSectionsIdentifiers:(id)a3 enabledIndexes:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E20];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__WBSStartPageSectionManager_setSectionsIdentifiers_enabledIndexes___block_invoke;
  v15[3] = &unk_1E4B3FD90;
  v16 = v9;
  v17 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v8, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  -[WBSStartPageSectionManager _migrateUnknownSectionIdentifiersIntoCurrentSections:didChangeSections:](self, "_migrateUnknownSectionIdentifiersIntoCurrentSections:didChangeSections:", v12, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSStartPageSectionManager saveSections:andUpdateInMemoryCache:](self, "saveSections:andUpdateInMemoryCache:", v13, 1);
}

WBSStartPageSectionDescriptor *__68__WBSStartPageSectionManager_setSectionsIdentifiers_enabledIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  WBSStartPageSectionDescriptor *v6;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v6 = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:]([WBSStartPageSectionDescriptor alloc], "initWithIdentifier:enabled:", v5, objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3));
  }

  return v6;
}

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_2(_QWORD *a1, void *a2, unint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("frequentlyVisitedItemIdentifier"));

  objc_msgSend(v14, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("highlightsItemIdentifier"));

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
    v9 = (v6 | v8) == 0;
  else
    v9 = 1;
  if (!v9 && objc_msgSend(v14, "isEnabled"))
  {
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(_QWORD *)(v10 + 24);
    if (v11 >= a3)
      v11 = a3;
    *(_QWORD *)(v10 + 24) = v11;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  v12 = (void *)a1[4];
  objc_msgSend(v14, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

}

void __101__WBSStartPageSectionManager__migrateUnknownSectionIdentifiersIntoCurrentSections_didChangeSections___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v12 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v12, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
}

- (void)setSectionIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WBSStartPageSectionManager sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (-[WBSStartPageSectionManager ensureSection:enabled:inSectionData:]((uint64_t)self, v6, v4, v8))
  {
    -[WBSStartPageSectionManager saveSections:andUpdateInMemoryCache:](self, "saveSections:andUpdateInMemoryCache:", v8, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("WBSStartPageSectionManagerSectionUserInfoKey");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WBSStartPageSectionManagerSectionVisibilityChangedNotification"), self, v10);

  }
}

- (uint64_t)ensureSection:(uint64_t)a3 enabled:(void *)a4 inSectionData:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  WBSStartPageSectionDescriptor *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_9;
  }
  v10 = indexOfSectionWithIdentifier(v8, v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:]([WBSStartPageSectionDescriptor alloc], "initWithIdentifier:enabled:", v7, a3);
    objc_msgSend(v9, "addObject:", v11);
  }
  else
  {
    v12 = v10;
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v11 = (WBSStartPageSectionDescriptor *)objc_claimAutoreleasedReturnValue();
    if (-[WBSStartPageSectionDescriptor isEnabled](v11, "isEnabled") == (_DWORD)a3)
    {
      v14 = 0;
      goto LABEL_8;
    }
    -[WBSStartPageSectionDescriptor sectionWithEnabled:](v11, "sectionWithEnabled:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v13, v12);

  }
  v14 = 1;
LABEL_8:

LABEL_9:
  return v14;
}

- (void)invalidateCache
{
  os_unfair_lock_s *p_lock;
  NSArray *cachedSections;
  int64_t ignoreChanges;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSections = self->_cachedSections;
  self->_cachedSections = 0;

  ignoreChanges = self->_ignoreChanges;
  os_unfair_lock_unlock(p_lock);
  if (!ignoreChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("WBSStartPageSectionManagerSectionsDidChangeNotification"), self);

  }
}

@end
