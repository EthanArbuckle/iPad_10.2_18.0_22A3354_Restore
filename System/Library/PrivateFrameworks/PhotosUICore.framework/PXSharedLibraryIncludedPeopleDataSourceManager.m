@implementation PXSharedLibraryIncludedPeopleDataSourceManager

- (PXSharedLibraryIncludedPeopleDataSourceManager)initWithViewModel:(id)a3
{
  id v5;
  PXSharedLibraryIncludedPeopleDataSourceManager *v6;
  NSMutableArray *v7;
  NSMutableArray *infos;
  NSMutableArray *v9;
  NSMutableArray *infosWithBothPeopleAndParticipants;
  NSMutableArray *v11;
  NSMutableArray *infosWithoutPeople;
  uint64_t v13;
  NSMutableSet *removedParticipants;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    infos = v6->_infos;
    v6->_infos = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    infosWithBothPeopleAndParticipants = v6->_infosWithBothPeopleAndParticipants;
    v6->_infosWithBothPeopleAndParticipants = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    infosWithoutPeople = v6->_infosWithoutPeople;
    v6->_infosWithoutPeople = v11;

    v13 = objc_opt_new();
    removedParticipants = v6->_removedParticipants;
    v6->_removedParticipants = (NSMutableSet *)v13;

    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v6->_viewModel, "registerChangeObserver:context:", v6, PXSharedLibraryAssistantViewModelObservationContext_157489);
  }

  return v6;
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  PXSharedLibraryIncludedPeopleInfo *v18;
  PXSharedLibraryIncludedPeopleInfo *v19;
  int *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  PXSharedLibraryIncludedPeopleDataSource *v26;
  void *v28;
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
  -[PXSharedLibraryIncludedPeopleDataSourceManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInPreview");

  if (v5)
  {
    objc_msgSend(v3, "personUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibraryIncludedPeopleDataSourceManager _infosForPersonIdentifiers:](self, "_infosForPersonIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = v3;
    if (objc_msgSend(v3, "mode") == 2)
    {
      objc_msgSend(v3, "sharedLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXSharedLibraryUIParticipantsForSharedLibrary(v9, 2u);
    }
    else
    {
      objc_msgSend(v3, "participantDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "participants");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          +[PXSharedLibraryIncludedPeopleInfo personForParticipant:](PXSharedLibraryIncludedPeopleInfo, "personForParticipant:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = [PXSharedLibraryIncludedPeopleInfo alloc];
          if (v17)
          {
            v19 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:](v18, "initWithParticipant:person:", v16, v17);
            v20 = &OBJC_IVAR___PXSharedLibraryIncludedPeopleDataSourceManager__infosWithBothPeopleAndParticipants;
          }
          else
          {
            v19 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:](v18, "initWithParticipant:", v16);
            v20 = &OBJC_IVAR___PXSharedLibraryIncludedPeopleDataSourceManager__infosWithoutPeople;
          }
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "addObject:", v19);
          objc_msgSend(v8, "addObject:", v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    v3 = v28;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        -[NSMutableArray addObject:](self->_infos, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  v26 = -[PXSharedLibraryIncludedPeopleDataSource initWithInfos:infosWithBothPeopleAndParticipants:infosWithoutPeople:]([PXSharedLibraryIncludedPeopleDataSource alloc], "initWithInfos:infosWithBothPeopleAndParticipants:infosWithoutPeople:", self->_infos, self->_infosWithBothPeopleAndParticipants, self->_infosWithoutPeople);
  return v26;
}

- (void)didCreateInitialDataSource
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  -[PXSectionedDataSourceManager didCreateInitialDataSource](&v3, sel_didCreateInitialDataSource);
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateViewModelInitially](self, "_updateViewModelInitially");
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryIncludedPeopleDataSourceManager;
  -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](&v5, sel_setDataSource_changeDetailsArray_, a3, a4);
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateViewModel](self, "_updateViewModel");
}

- (void)_updateViewModelInitially
{
  void *v3;
  _QWORD v4[5];

  -[PXSharedLibraryIncludedPeopleDataSourceManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModelInitially__block_invoke;
  v4[3] = &unk_1E5144D60;
  v4[4] = self;
  objc_msgSend(v3, "performInitialChanges:", v4);

}

- (void)_updateViewModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (-[PXSharedLibraryIncludedPeopleDataSourceManager viewModelSyncingDisabled](self, "viewModelSyncingDisabled"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allPersonUUIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXSharedLibraryIncludedPeopleDataSourceManager viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModel__block_invoke;
  v7[3] = &unk_1E5144D60;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performChanges:", v7);

}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PXSharedLibraryIncludedPeopleDataSourceManager *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[PXSharedLibraryAssistantViewModel participantDataSource](self->_viewModel, "participantDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet intersectSet:](self->_removedParticipants, "intersectSet:", v6);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItemsEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXFilter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v13, "minusSet:", self->_removedParticipants);
  objc_msgSend(v13, "minusSet:", v12);
  PXMap();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v15, "minusSet:", v6);
  v16 = MEMORY[0x1E0C809B0];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_4;
  v27 = &unk_1E5125B60;
  v28 = v9;
  v17 = v9;
  PXMap();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_6;
  v20[3] = &unk_1E5125B88;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = self;
  v23 = v14;
  v18 = v14;
  v19 = v21;
  -[PXSharedLibraryIncludedPeopleDataSourceManager performChanges:](self, "performChanges:", v20);

}

- (void)_resetIfNeeded
{
  void *v3;
  id v4;

  if (-[PXSharedLibraryAssistantViewModel autoSharePolicy](self->_viewModel, "autoSharePolicy") != 2)
  {
    -[NSMutableSet removeAllObjects](self->_removedParticipants, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_infos, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_infosWithBothPeopleAndParticipants, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_infosWithoutPeople, "removeAllObjects");
    -[PXSectionedDataSourceManager dataSourceIfExists](self, "dataSourceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXSharedLibraryIncludedPeopleDataSourceManager createInitialDataSource](self, "createInitialDataSource");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, 0);

    }
  }
}

- (void)_updateDataSourceWithItemChanges:(id)a3 fromDataSourceIdentifier:(int64_t)a4
{
  id v6;
  PXSharedLibraryIncludedPeopleDataSource *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PXSharedLibraryIncludedPeopleDataSource initWithInfos:infosWithBothPeopleAndParticipants:infosWithoutPeople:]([PXSharedLibraryIncludedPeopleDataSource alloc], "initWithInfos:infosWithBothPeopleAndParticipants:infosWithoutPeople:", self->_infos, self->_infosWithBothPeopleAndParticipants, self->_infosWithoutPeople);
  v8 = objc_alloc((Class)off_1E50B4A18);
  v9 = -[PXSharedLibraryIncludedPeopleDataSource identifier](v7, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = &unk_1E53ED050;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v8, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a4, v9, v10, v11, 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v7, v12);

}

- (id)_infosForPersonIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v15 = 0;
    goto LABEL_10;
  }
  -[PXSharedLibraryIncludedPeopleDataSourceManager viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceLibraryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (!v7)
    {
      v15 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v4, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v4);
    objc_msgSend(v9, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v7, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v13, 0, 0, 0, 0);

    PXMap();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v15 = 0;
  }

LABEL_8:
LABEL_10:

  return v15;
}

- (void)addSelectedPersonIdentifiers:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 409, CFSTR("%s must be called on the main thread"), "-[PXSharedLibraryIncludedPeopleDataSourceManager addSelectedPersonIdentifiers:]");

  }
  -[PXSharedLibraryIncludedPeopleDataSourceManager _infosForPersonIdentifiers:](self, "_infosForPersonIdentifiers:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    -[PXSharedLibraryIncludedPeopleDataSourceManager addInfos:](self, "addInfos:", v5);

}

- (void)setViewModelSyncingDisabled:(BOOL)a3
{
  if (self->_viewModelSyncingDisabled != a3)
  {
    self->_viewModelSyncingDisabled = a3;
    -[PXSharedLibraryIncludedPeopleDataSourceManager _updateViewModel](self, "_updateViewModel");
  }
}

- (void)removeAllItems
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 424, CFSTR("%s must be called on the main thread"), "-[PXSharedLibraryIncludedPeopleDataSourceManager removeAllItems]");

  }
  PXMap();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](self->_removedParticipants, "addObjectsFromArray:");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSections") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 429, CFSTR("Expected there to be only one section"));

  }
  v5 = -[NSMutableArray count](self->_infos, "count");
  -[NSMutableArray removeAllObjects](self->_infos, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_infosWithBothPeopleAndParticipants, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_infosWithoutPeople, "removeAllObjects");
  objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v6, objc_msgSend(v4, "identifier"));

}

- (void)addInfos:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v14 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 441, CFSTR("%s must be called on the main thread"), "-[PXSharedLibraryIncludedPeopleDataSourceManager addInfos:]");

  }
  if (!objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("infos.count > 0"));

  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfSections") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 445, CFSTR("Expected there to be only one section"));

  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v15;
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray count](self->_infos, "count");
  v9 = objc_msgSend(v7, "count");
  -[NSMutableArray addObjectsFromArray:](self->_infos, "addObjectsFromArray:", v7);
  -[NSMutableArray addObjectsFromArray:](self->_infosWithoutPeople, "addObjectsFromArray:", v6);
  objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v10, objc_msgSend(v5, "identifier"));

}

- (void)removeInfo:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 472, CFSTR("%s must be called on the main thread"), "-[PXSharedLibraryIncludedPeopleDataSourceManager removeInfo:]");

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("info != nil"));

  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfSections") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 476, CFSTR("Expected there to be only one section"));

  }
  objc_msgSend(v12, "participant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableSet addObject:](self->_removedParticipants, "addObject:", v6);
  v7 = -[NSMutableArray count](self->_infos, "count");
  -[NSMutableArray removeObject:](self->_infos, "removeObject:", v12);
  -[NSMutableArray removeObject:](self->_infosWithBothPeopleAndParticipants, "removeObject:", v12);
  -[NSMutableArray removeObject:](self->_infosWithoutPeople, "removeObject:", v12);
  objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v8, objc_msgSend(v5, "identifier"));

}

- (void)replaceInfo:(id)a3 withInfo:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *infosWithoutPeople;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 493, CFSTR("%s must be called on the main thread"), "-[PXSharedLibraryIncludedPeopleDataSourceManager replaceInfo:withInfo:]");

  }
  if (v25)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldInfo != nil"));

    if (v7)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newInfo != nil"));

LABEL_5:
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "numberOfSections") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 498, CFSTR("Expected there to be only one section"));

  }
  v9 = -[NSMutableArray indexOfObject:](self->_infos, "indexOfObject:", v25);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_infos, "replaceObjectAtIndex:withObject:", v9, v7);
  v10 = -[NSMutableArray indexOfObject:](self->_infosWithoutPeople, "indexOfObject:", v25);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    objc_msgSend(v7, "person");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    infosWithoutPeople = self->_infosWithoutPeople;
    if (v12)
      -[NSMutableArray removeObject:](infosWithoutPeople, "removeObject:", v25);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](infosWithoutPeople, "replaceObjectAtIndex:withObject:", v11, v7);
  }
  v14 = -[NSMutableArray indexOfObject:](self->_infosWithBothPeopleAndParticipants, "indexOfObject:", v25);
  objc_msgSend(v7, "person");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v15)
    {
      objc_msgSend(v7, "participant");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[NSMutableArray addObject:](self->_infosWithBothPeopleAndParticipants, "addObject:", v7);
    }
  }
  else if (v15
         && (objc_msgSend(v7, "participant"),
             v18 = (void *)objc_claimAutoreleasedReturnValue(),
             v18,
             v16,
             v18))
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_infosWithBothPeopleAndParticipants, "replaceObjectAtIndex:withObject:", v14, v7);
  }
  else
  {
    -[NSMutableArray removeObject:](self->_infosWithBothPeopleAndParticipants, "removeObject:", v25);
  }
  objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexRange:", v9, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSourceWithItemChanges:fromDataSourceIdentifier:](self, "_updateDataSourceWithItemChanges:fromDataSourceIdentifier:", v19, objc_msgSend(v8, "identifier"));

}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 532, CFSTR("Pausing changes is not supported in PXSharedLibraryIncludedPeopleDataSourceManager."));

  abort();
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 536, CFSTR("Resuming changes is not supported in PXSharedLibraryIncludedPeopleDataSourceManager."));

  abort();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_157489 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 550, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((v6 & 0x20) != 0)
  {
    -[PXSharedLibraryIncludedPeopleDataSourceManager _updateDataSource](self, "_updateDataSource");
    v9 = v11;
  }
  if (v6 < 0)
  {
    -[PXSharedLibraryIncludedPeopleDataSourceManager _resetIfNeeded](self, "_resetIfNeeded");
    v9 = v11;
  }

}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)viewModelSyncingDisabled
{
  return self->_viewModelSyncingDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_infosWithoutPeople, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_removedParticipants, 0);
}

id __59__PXSharedLibraryIncludedPeopleDataSourceManager_addInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "participant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_8:
        v4 = v3;

        goto LABEL_9;
      }
      v7 = (id *)(*(_QWORD *)(a1 + 32) + 136);
    }
    else
    {
      v7 = (id *)(a1 + 40);
    }
    objc_msgSend(*v7, "addObject:", v3);
    goto LABEL_8;
  }
  v4 = 0;
LABEL_9:

  return v4;
}

uint64_t __64__PXSharedLibraryIncludedPeopleDataSourceManager_removeAllItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "participant");
}

PXSharedLibraryIncludedPeopleInfo *__77__PXSharedLibraryIncludedPeopleDataSourceManager__infosForPersonIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXSharedLibraryIncludedPeopleInfo *v3;

  v2 = a2;
  v3 = -[PXSharedLibraryIncludedPeopleInfo initWithPerson:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithPerson:", v2);

  return v3;
}

id __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v5;

  v5 = a2;
  v2 = v5;
  PXFind();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_6(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[5], "removeInfo:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = objc_msgSend(a1[6], "count");
  if (result)
    return objc_msgSend(a1[5], "addInfos:", a1[6]);
  return result;
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXSharedLibraryIncludedPeopleInfo *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  +[PXSharedLibraryIncludedPeopleInfo personForParticipant:](PXSharedLibraryIncludedPeopleInfo, "personForParticipant:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXSharedLibraryIncludedPeopleInfo alloc];
  if (v3)
    v5 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:](v4, "initWithParticipant:person:", v2, v3);
  else
    v5 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:](v4, "initWithParticipant:", v2);
  v6 = (void *)v5;

  return v6;
}

uint64_t __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "participant");
}

BOOL __67__PXSharedLibraryIncludedPeopleDataSourceManager__updateDataSource__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __66__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersonUUIDs:", *(_QWORD *)(a1 + 32));
}

void __75__PXSharedLibraryIncludedPeopleDataSourceManager__updateViewModelInitially__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allPersonUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonUUIDs:", v4);

}

id __73__PXSharedLibraryIncludedPeopleDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
