@implementation PXSharingSuggestionSectionHeaderLayoutProvider

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  NSDateIntervalFormatter *dateIntervalFormatter;
  NSDateIntervalFormatter *v4;
  NSDateIntervalFormatter *v5;
  void *v6;

  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v4 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E0CB3590]);
    v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    -[NSDateIntervalFormatter px_dateTemplateForGranularity:abbreviated:](self->_dateIntervalFormatter, "px_dateTemplateForGranularity:abbreviated:", 8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](self->_dateIntervalFormatter, "setDateTemplate:", v6);

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

- (NSMutableSet)successfullySharedAssetCollections
{
  NSMutableSet *successfullySharedAssetCollections;
  NSMutableSet *v4;
  NSMutableSet *v5;

  successfullySharedAssetCollections = self->_successfullySharedAssetCollections;
  if (!successfullySharedAssetCollections)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_successfullySharedAssetCollections;
    self->_successfullySharedAssetCollections = v4;

    successfullySharedAssetCollections = self->_successfullySharedAssetCollections;
  }
  return successfullySharedAssetCollections;
}

- (BOOL)wantsTopHeaderForDataSource:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "containerCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0
    || objc_msgSend(v3, "numberOfSections") > 1;

  return v5;
}

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "containerCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_isSharedLibrarySharingSuggestionsSmartAlbum") ^ 1;

  return v5;
}

- (id)primaryTopHeaderTextForDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _OWORD v20[2];
  _OWORD v21[2];

  v4 = a3;
  PXLocalizedAssetCountForUsage(objc_msgSend(v4, "totalNumberOfItems"), 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "px_isSharedLibrarySharingSuggestionsSmartAlbum")
    && objc_msgSend(v4, "containsAnyItems"))
  {
    if (v4)
    {
      objc_msgSend(v4, "firstItemIndexPath");
      objc_msgSend(v4, "assetAtItemIndexPath:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastItemIndexPath");
    }
    else
    {
      memset(v21, 0, sizeof(v21));
      objc_msgSend(0, "assetAtItemIndexPath:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v20, 0, sizeof(v20));
    }
    objc_msgSend(v4, "assetAtItemIndexPath:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "startsAtEnd"))
      v10 = v7;
    else
      v10 = v9;
    objc_msgSend(v10, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "startsAtEnd"))
      v12 = v9;
    else
      v12 = v7;
    objc_msgSend(v12, "creationDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v8 = 0;
    if (v11 && v13)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v13);
      -[PXSharingSuggestionSectionHeaderLayoutProvider dateIntervalFormatter](self, "dateIntervalFormatter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDateInterval:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PXDisplayCollectionGetLocalizedSubtitleWithoutDelimiters(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "length"))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionHeaderMoveAllTitleFormat"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v5;
  }

  return v18;
}

- (id)secondaryTopHeaderTextForDataSource:(id)a3
{
  __CFString *v3;

  if (-[PXSharingSuggestionSectionHeaderLayoutProvider successfullySharedAll](self, "successfullySharedAll", a3))
    v3 = CFSTR("PXSharedLibrarySharingSuggestionHeaderMoveAllSuccessSubtitle");
  else
    v3 = CFSTR("PXSharedLibrarySharingSuggestionHeaderMoveAllSubtitle");
  PXLocalizedSharedLibraryString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  v4 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v4;
  objc_msgSend(a3, "assetCollectionAtSectionIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  v4 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v4;
  objc_msgSend(a3, "assetCollectionAtSectionIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4;
  int64_t v5;
  objc_super *v6;
  void *v7;
  int v8;
  PXSharingSuggestionSectionHeaderLayoutProvider *v10;
  objc_super v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isTopHeader"))
  {
    if (!objc_msgSend(v4, "isInSelectMode"))
    {
      v5 = 4;
      goto LABEL_11;
    }
    v10 = self;
    v6 = (objc_super *)&v10;
    goto LABEL_8;
  }
  if (!-[PXSharingSuggestionSectionHeaderLayoutProvider successfullySharedAll](self, "successfullySharedAll"))
  {
    -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInSelectMode");

    if (!v8)
    {
      v5 = 5;
      goto LABEL_11;
    }
    v11.receiver = self;
    v6 = &v11;
LABEL_8:
    v6->super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    v5 = (int64_t)-[objc_super actionTypeForHeaderLayout:](v6, sel_actionTypeForHeaderLayout_, v4, v10);
    goto LABEL_11;
  }
  v5 = 6;
LABEL_11:

  return v5;
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  __CFString *v15;
  void *v16;
  _OWORD v17[2];
  objc_super v18;

  v9 = a4;
  if ((unint64_t)a3 > 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharingSuggestionSectionHeaderLayoutProvider.m"), 145, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if (((1 << a3) & 0x7CF) != 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    v11 = *(_OWORD *)&a5->item;
    v17[0] = *(_OWORD *)&a5->dataSourceIdentifier;
    v17[1] = v11;
    -[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:](&v18, sel_actionTextForActionType_dataSource_sectionIndexPath_, a3, v9, v17);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 4)
      v15 = CFSTR("PXSharedLibrarySharingSuggestionHeaderMoveAction");
    else
      v15 = CFSTR("PXSharedLibrarySharingSuggestionHeaderMoveAllAction");
    PXLocalizedSharedLibraryString(v15);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  _BYTE *v31;
  id v32;
  id location;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  BOOL v39;
  _OWORD v40[2];
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4 == 5)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v10, "currentDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v8, "sectionIndexPath");
      else
        memset(v40, 0, sizeof(v40));
      objc_msgSend(v12, "assetCollectionAtSectionIndexPath:", v40);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke;
    v37[3] = &unk_1E5144348;
    v39 = a4 == 5;
    v15 = v8;
    v38 = v15;
    objc_msgSend(v13, "performChanges:", v37);
    objc_msgSend(v11, "assetActionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionPerformerForActionType:", CFSTR("PXAssetActionTypeMoveToSharedLibrary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = a4 == 5;
      objc_msgSend(v11, "dataSourceManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v42 = __Block_byref_object_copy__167615;
      v43 = __Block_byref_object_dispose__167616;
      v44 = 0;
      if (v18)
      {
        v34[0] = v14;
        v34[1] = 3221225472;
        v34[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_149;
        v34[3] = &unk_1E5145E98;
        v34[4] = buf;
        objc_msgSend(v19, "performChanges:", v34);
      }
      objc_initWeak(&location, self);
      v28[0] = v14;
      v28[1] = 3221225472;
      v28[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_2;
      v28[3] = &unk_1E5130F90;
      objc_copyWeak(&v32, &location);
      v29 = v26;
      v31 = buf;
      v21 = v20;
      v30 = v21;
      objc_msgSend(v17, "performActionWithCompletionHandler:", v28);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      PXAssertGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v13, "selectionSnapshot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "selectedIndexPaths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "itemCount");
        if (v15)
        {
          objc_msgSend(v15, "sectionIndexPath");
          v25 = *((_QWORD *)&v35 + 1);
        }
        else
        {
          v25 = 0;
          v35 = 0u;
          v36 = 0u;
        }
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v25;
        _os_log_fault_impl(&dword_1A6789000, v21, OS_LOG_TYPE_FAULT, "Unable to retrieve MoveToSharedLibrary action performer for %ld items in section %ld", buf, 0x16u);

      }
    }

    objc_msgSend(v13, "performChanges:", &__block_literal_global_167617);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)PXSharingSuggestionSectionHeaderLayoutProvider;
    -[PXActionableSectionHeaderLayoutProvider sectionHeader:didPressButtonForActionType:sender:](&v27, sel_sectionHeader_didPressButtonForActionType_sender_, v8, a4, v9);
  }

}

- (void)_handleShareAssetCollectionCompletion:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v6)
    {
LABEL_3:
      if (v9)
      {
        -[PXSharingSuggestionSectionHeaderLayoutProvider successfullySharedAssetCollections](self, "successfullySharedAssetCollections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v9);

      }
      else
      {
        -[PXSharingSuggestionSectionHeaderLayoutProvider setSuccessfullySharedAll:](self, "setSuccessfullySharedAll:", 1);
      }
      -[PXActionableSectionHeaderLayoutProvider topHeaderInvalidationDelegate](self, "topHeaderInvalidationDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photosSectionHeaderLayoutInvalidateConfiguredLayouts:", self);

      -[PXActionableSectionHeaderLayoutProvider invalidationDelegate](self, "invalidationDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "photosSectionHeaderLayoutInvalidateConfiguredLayouts:", self);

      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharingSuggestionSectionHeaderLayoutProvider.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSThread.isMainThread"));

    if (v6)
      goto LABEL_3;
  }
  PLSharedLibraryGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to move items to shared library in section %@, error:%@", buf, 0x16u);
  }

LABEL_11:
}

- (BOOL)successfullySharedAll
{
  return self->_successfullySharedAll;
}

- (void)setSuccessfullySharedAll:(BOOL)a3
{
  self->_successfullySharedAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successfullySharedAssetCollections, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _OWORD v5[2];

  v3 = a2;
  objc_msgSend(v3, "deselectAll");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "selectAllItems");
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
      objc_msgSend(v4, "sectionIndexPath");
    else
      memset(v5, 0, sizeof(v5));
    objc_msgSend(v3, "selectAllItemsInSection:", v5);
  }

}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("Sharing Suggestion"), 30.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  int64_t v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleShareAssetCollectionCompletion:success:error:", *(_QWORD *)(a1 + 32), a2, v6);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if ((_DWORD)a2)
      v8 = 2000000000;
    else
      v8 = 0;
    v9 = dispatch_time(0, v8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_3;
    v12[3] = &unk_1E5148AA8;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v14 = v11;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_4;
  v3[3] = &unk_1E5145E98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __99__PXSharingSuggestionSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

@end
