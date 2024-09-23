@implementation PXPeoplePickerDataSourceManager

- (PXPeoplePickerDataSourceManager)init
{
  PXPeoplePickerDataSourceManager *v2;
  NSMutableArray *v3;
  NSMutableArray *selectedLocalIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeoplePickerDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    selectedLocalIdentifiers = v2->_selectedLocalIdentifiers;
    v2->_selectedLocalIdentifiers = v3;

  }
  return v2;
}

- (id)createInitialDataSource
{
  PXPeoplePickerDataSource *v2;
  id v3;
  id v4;
  PXPeoplePickerDataSource *v5;

  v2 = [PXPeoplePickerDataSource alloc];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v5 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v2, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v3, v4);

  return v5;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeoplePickerDataSourceManager;
  -[PXPeoplePickerDataSourceManager performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setPeople:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *people;
  PHFetchResult *v7;
  void *v8;
  void *v9;
  PXPeoplePickerDataSource *v10;
  void *v11;
  NSMutableArray *selectedLocalIdentifiers;
  id v13;
  id v14;
  PXPeoplePickerDataSource *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = (PHFetchResult *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 168, CFSTR("%s must be called on the main thread"), "-[PXPeoplePickerDataSourceManager setPeople:]");

  }
  if (self->_people)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_people == nil"));

  }
  if (self->_suggestedLocalIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_suggestedLocalIdentifiers == nil"));

  }
  people = self->_people;
  self->_people = v5;
  v7 = v5;

  -[PHFetchResult photoLibrary](v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_registerChangeObserver:", self);

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PXPeoplePickerDataSource alloc];
  objc_msgSend(v9, "disabledLocalIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v15 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v10, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", v7, v11, selectedLocalIdentifiers, v13, v14);

  objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc((Class)off_1E50B4A18);
  v18 = objc_msgSend(v9, "identifier");
  v19 = -[PXPeoplePickerDataSource identifier](v15, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = &unk_1E53EB1D8;
  v27[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v17, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v18, v19, v20, v21, 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v15, v22);

}

- (void)setSuggestedLocalIdentifiers:(id)a3 withPhotoLibrary:(id)a4
{
  NSArray *v7;
  void *v8;
  id v9;
  NSArray *suggestedLocalIdentifiers;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPeoplePickerDataSource *v15;
  void *v16;
  NSMutableArray *selectedLocalIdentifiers;
  id v18;
  id v19;
  PXPeoplePickerDataSource *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = (NSArray *)a3;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a4;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 187, CFSTR("%s must be called on the main thread"), "-[PXPeoplePickerDataSourceManager setSuggestedLocalIdentifiers:withPhotoLibrary:]");

  }
  if (self->_people)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_people == nil"));

  }
  if (self->_suggestedLocalIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_suggestedLocalIdentifiers == nil"));

    suggestedLocalIdentifiers = self->_suggestedLocalIdentifiers;
  }
  else
  {
    suggestedLocalIdentifiers = 0;
  }
  self->_suggestedLocalIdentifiers = v7;
  v11 = v7;

  objc_msgSend(v9, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v12;
  objc_msgSend(v12, "setIncludedDetectionTypes:", v13);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v11, v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v11);
  objc_msgSend(v34, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1620]), "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v32, v9, 0, 0, 0, 0);

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [PXPeoplePickerDataSource alloc];
  objc_msgSend(v14, "disabledLocalIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v20 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v15, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", v31, v16, selectedLocalIdentifiers, v18, v19);

  objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc((Class)off_1E50B4A18);
  v23 = objc_msgSend(v14, "identifier");
  v24 = -[PXPeoplePickerDataSource identifier](v20, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = &unk_1E53EB1D8;
  v37[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(v22, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v23, v24, v25, v26, 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v20, v27);

}

- (void)setDisabledLocalIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXPeoplePickerDataSource *v8;
  NSMutableArray *selectedLocalIdentifiers;
  id v10;
  id v11;
  PXPeoplePickerDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  PXPeoplePickerDataSourceManager *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 212, CFSTR("%s must be called on the main thread"), "-[PXPeoplePickerDataSourceManager setDisabledLocalIdentifiers:]");

  }
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("disabledLocalIdentifiers.count > 0"));

  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PXPeoplePickerDataSource alloc];
  selectedLocalIdentifiers = self->_selectedLocalIdentifiers;
  v28 = self;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v12 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v8, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", v7, v5, selectedLocalIdentifiers, v10, v11);

  v29 = v5;
  v27 = v5;
  PXMap();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v7, "fetchedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerDataSource _fetchResult](v12, "_fetchResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchedObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v15, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc((Class)off_1E50B4A18);
  v20 = objc_msgSend(v6, "identifier");
  v21 = -[PXPeoplePickerDataSource identifier](v12, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = &unk_1E53EB1D8;
  v31[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v19, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v20, v21, v22, v23, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](v28, "setDataSource:changeDetails:", v12, v24);
}

- (void)setLocalIdentifiers:(id)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, id);
  void (**v12)(void *, id);
  id v13;
  id v14;
  PXPeoplePickerDataSource *v15;
  void *v16;
  void *v17;
  PXPeoplePickerDataSource *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void (**v38)(void *, id);
  PXPeoplePickerDataSourceManager *v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[3];

  v4 = a4;
  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 231, CFSTR("%s must be called on the main thread"), "-[PXPeoplePickerDataSourceManager setLocalIdentifiers:selected:]");

  }
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localIdentifiers.count > 0"));

  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke;
  aBlock[3] = &unk_1E5119B40;
  v10 = v8;
  v43 = v10;
  v11 = (void (**)(void *, id))_Block_copy(aBlock);
  v12 = v11;
  v38 = v11;
  if (v4)
  {
    -[NSMutableArray addObjectsFromArray:](self->_selectedLocalIdentifiers, "addObjectsFromArray:", v7);
    v12[2](v12, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  }
  else
  {
    v11[2](v11, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsInArray:](self->_selectedLocalIdentifiers, "removeObjectsInArray:", v7);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  }
  v15 = [PXPeoplePickerDataSource alloc];
  objc_msgSend(v10, "_fetchResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disabledLocalIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v13;
  v18 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v15, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", v16, v17, self->_selectedLocalIdentifiers, v13, v14);

  objc_msgSend(v10, "_fetchResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_3;
  v40[3] = &unk_1E5119B68;
  v35 = v7;
  v41 = v35;
  v21 = objc_msgSend(v20, "indexOfObjectPassingTest:", v40);
  v39 = self;
  v37 = v14;
  if (v21 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXPeoplePickerDataSource _fetchResult](v18, "_fetchResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchedObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v20, v25, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc((Class)off_1E50B4A18);
  v28 = objc_msgSend(v10, "identifier");
  v29 = -[PXPeoplePickerDataSource identifier](v18, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = &unk_1E53EB1D8;
  v45 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v27, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v28, v29, v30, v31, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](v39, "setDataSource:changeDetails:", v18, v32);
}

- (void)deselectAllLocalIdentifiers
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 278, CFSTR("%s must be called on the main thread"), "-[PXPeoplePickerDataSourceManager deselectAllLocalIdentifiers]");

  }
  -[PXPeoplePickerDataSourceManager setLocalIdentifiers:selected:](self, "setLocalIdentifiers:selected:", self->_selectedLocalIdentifiers, 0);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__22029;
  v17 = __Block_byref_object_dispose__22030;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXPeoplePickerDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v5 = (void *)v14[5];
  v11 = 0;
  objc_msgSend(v5, "dataSourceUpdatedWithChange:changeDetails:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v14[5];
  v19[0] = CFSTR("currentDataSource");
  v19[1] = CFSTR("preparedDataSource");
  v20[0] = v8;
  v20[1] = v6;
  v19[2] = CFSTR("preparedChangeDetails");
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PXPeoplePickerDataSourceManager *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("currentDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedDataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedChangeDetails"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
    objc_msgSend(v8, "dataSourceUpdatedWithChange:changeDetails:", v6, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
  }
  v12 = v11;
  if (v10 != v8)
  {
    v20 = objc_alloc((Class)off_1E50B4A18);
    v13 = objc_msgSend(v8, "identifier");
    v14 = objc_msgSend(v10, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &unk_1E53EB1D8;
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = self;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v13, v14, v15, v18, 0);

    v6 = v17;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v16, "setDataSource:changeDetails:", v10, v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_suggestedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedLocalIdentifiers, 0);
}

void __64__PXPeoplePickerDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(*(id *)(a1 + 32), "_fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v6 = v3;
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithArray:", v7);

  return v8;
}

uint64_t __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __64__PXPeoplePickerDataSourceManager_setLocalIdentifiers_selected___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __63__PXPeoplePickerDataSourceManager_setDisabledLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", v4))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)currentDataSourceManager
{
  return objc_alloc_init(PXPeoplePickerDataSourceManager);
}

@end
