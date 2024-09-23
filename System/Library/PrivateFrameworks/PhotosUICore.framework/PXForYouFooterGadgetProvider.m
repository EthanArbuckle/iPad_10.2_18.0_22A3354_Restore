@implementation PXForYouFooterGadgetProvider

- (void)loadDataForGadgets
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[PXForYouFooterGadgetProvider _didProcessContentOvernight](self, "_didProcessContentOvernight"))
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(17, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__PXForYouFooterGadgetProvider_loadDataForGadgets__block_invoke;
    v4[3] = &unk_1E5148D30;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PXForYouFooterGadgetProvider setFooterState:](self, "setFooterState:", 1);
  }
}

- (unint64_t)estimatedNumberOfGadgets
{
  return self->_footerState == 1;
}

- (void)generateGadgets
{
  if (self->_footerState)
    -[PXForYouFooterGadgetProvider _generateFooterGadget](self, "_generateFooterGadget");
  else
    self->_attemptedToGenerateGadgets = 1;
}

- (void)setFooterState:(int64_t)a3
{
  void *v6;

  if (self->_footerState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouFooterGadgetProvider.m"), 81, CFSTR("Attempting to set footer state after it has been set"));

  }
  self->_footerState = a3;
  if (a3 == 1)
  {
    if (-[PXForYouFooterGadgetProvider attemptedToGenerateGadgets](self, "attemptedToGenerateGadgets"))
      -[PXForYouFooterGadgetProvider _generateFooterGadget](self, "_generateFooterGadget");
  }
}

- (id)_peaceMemoryFetchOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(creationDate >= %@) && (creationDate <= %@)"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(photosGraphVersion >> 48 & %d) >= %d"), 0xFFFFLL, 49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setInternalPredicate:", v11);
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(v3, "setShouldPrefetchCount:", 1);

  return v3;
}

- (BOOL)_didProcessContentOvernight
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXForYouFooterGadgetProvider _peaceMemoryFetchOptions](self, "_peaceMemoryFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1630], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_handleFaceProgressCompletionWithFacesCountDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location[18];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  v6 = v4;
  v7 = *MEMORY[0x1E0CD1830];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1830]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, location, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v16, "isEqualToString:", v7) & 1) == 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 += objc_msgSend(v17, "unsignedIntegerValue");

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, location, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (!v9)
  {

    goto LABEL_17;
  }

  if ((double)v13 / (double)v9 < 1.0)
  {
LABEL_17:
    objc_initWeak(location, self);
    dispatch_get_global_queue(17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__PXForYouFooterGadgetProvider__handleFaceProgressCompletionWithFacesCountDictionary___block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v20, location);
    dispatch_async(v18, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
    goto LABEL_18;
  }
LABEL_15:
  -[PXForYouFooterGadgetProvider setFooterState:](self, "setFooterState:", 1);
LABEL_18:

}

- (void)_handleSceneProgressCompletionWithUnprocessedCount:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PXForYouFooterGadgetProvider__handleSceneProgressCompletionWithUnprocessedCount___block_invoke;
  v3[3] = &unk_1E5144EB8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)_generateFooterGadget
{
  PXFooterViewModel *v3;
  PXForYouFooterGadget *v4;
  PXForYouFooterGadget *v5;
  _QWORD v6[4];
  PXForYouFooterGadget *v7;

  v3 = objc_alloc_init(PXFooterViewModel);
  -[PXFooterViewModel performChanges:](v3, "performChanges:", &__block_literal_global_198310);
  v4 = -[PXForYouFooterGadget initWithViewModel:]([PXForYouFooterGadget alloc], "initWithViewModel:", v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXForYouFooterGadgetProvider__generateFooterGadget__block_invoke_2;
  v6[3] = &unk_1E5145360;
  v7 = v4;
  v5 = v4;
  -[PXGadgetProvider performChanges:](self, "performChanges:", v6);

}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 12;
}

- (int64_t)footerState
{
  return self->_footerState;
}

- (BOOL)attemptedToGenerateGadgets
{
  return self->_attemptedToGenerateGadgets;
}

- (void)setAttemptedToGenerateGadgets:(BOOL)a3
{
  self->_attemptedToGenerateGadgets = a3;
}

void __53__PXForYouFooterGadgetProvider__generateFooterGadget__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

void __53__PXForYouFooterGadgetProvider__generateFooterGadget__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  PXLocalizedStringFromTable(CFSTR("PXForYouFooterTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  PXLocalizedStringFromTable(CFSTR("PXForYouFooterSubtitle"), CFSTR("PhotosUICore"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle1:", v4);

}

uint64_t __83__PXForYouFooterGadgetProvider__handleSceneProgressCompletionWithUnprocessedCount___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
    v3 = 1;
  else
    v3 = 2;
  return objc_msgSend(v1, "setFooterState:", v3);
}

void __86__PXForYouFooterGadgetProvider__handleFaceProgressCompletionWithFacesCountDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fetchCountOfAssetsWithScenesProcessed");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSceneProgressCompletionWithUnprocessedCount:", v3);

}

void __50__PXForYouFooterGadgetProvider_loadDataForGadgets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceAnalysisProgressCounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v5);
}

void __50__PXForYouFooterGadgetProvider_loadDataForGadgets__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleFaceProgressCompletionWithFacesCountDictionary:", *(_QWORD *)(a1 + 32));

}

@end
