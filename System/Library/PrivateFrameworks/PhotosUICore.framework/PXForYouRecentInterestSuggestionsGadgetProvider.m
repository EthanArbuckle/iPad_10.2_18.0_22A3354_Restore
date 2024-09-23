@implementation PXForYouRecentInterestSuggestionsGadgetProvider

- (PXForYouRecentInterestSuggestionsGadgetProvider)initWithLibraryFilterState:(id)a3
{
  id v4;
  void *v5;
  PXSuggestionsDataSourceManager *v6;
  PXForYouRecentInterestSuggestionsGadgetProvider *v7;
  objc_super v9;

  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("PXForYouRecentInterestSuggestionTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSuggestionsDataSourceManager initWithDataSourceType:libraryFilterState:]([PXSuggestionsDataSourceManager alloc], "initWithDataSourceType:libraryFilterState:", 2, v4);

  v9.receiver = self;
  v9.super_class = (Class)PXForYouRecentInterestSuggestionsGadgetProvider;
  v7 = -[PXForYouSuggestionsGadgetProvider initWithDataSourceManager:localizedTitle:](&v9, sel_initWithDataSourceManager_localizedTitle_, v6, v5);

  return v7;
}

- (PXForYouRecentInterestSuggestionsGadgetProvider)initWithDataSourceManager:(id)a3 localizedTitle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouRecentInterestSuggestionsGadgetProvider.m"), 71, CFSTR("%s is not available as initializer"), "-[PXForYouRecentInterestSuggestionsGadgetProvider initWithDataSourceManager:localizedTitle:]");

  abort();
}

- (PXForYouRecentInterestSuggestionsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouRecentInterestSuggestionsGadgetProvider.m"), 75, CFSTR("%s is not available as initializer"), "-[PXForYouRecentInterestSuggestionsGadgetProvider init]");

  abort();
}

- (BOOL)_prepareForOneUpPresentationForSuggestion:(id)a3 mediaProvider:(id)a4
{
  id v6;
  id v7;
  PXForYouSuggestionAssetsDataSourceManager *v8;
  void *v9;
  PXForYouSuggestionAssetsDataSourceManager *v10;
  PXForYouSuggestionAssetsDataSourceManager *oneUpDataSourceManager;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  PXAssetReference *v23;
  NSObject *oneUpInitialAssetReference;
  _QWORD v26[4];
  id v27;
  PXForYouRecentInterestSuggestionsGadgetProvider *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t v36[16];
  __int128 v37;
  __int128 buf;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [PXForYouSuggestionAssetsDataSourceManager alloc];
  -[PXForYouSuggestionsGadgetProvider dataSourceManager](self, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXForYouSuggestionAssetsDataSourceManager initWithSuggestionsDataSourceManager:](v8, "initWithSuggestionsDataSourceManager:", v9);
  oneUpDataSourceManager = self->_oneUpDataSourceManager;
  self->_oneUpDataSourceManager = v10;

  objc_storeStrong((id *)&self->_oneUpMediaProvider, a4);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__55474;
  v34 = __Block_byref_object_dispose__55475;
  v35 = 0;
  -[PXGadgetProvider gadgets](self, "gadgets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __107__PXForYouRecentInterestSuggestionsGadgetProvider__prepareForOneUpPresentationForSuggestion_mediaProvider___block_invoke;
  v26[3] = &unk_1E511E270;
  v13 = v6;
  v28 = self;
  v29 = &v30;
  v27 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

  if (v31[5])
  {
    -[PXSectionedDataSourceManager dataSource](self->_oneUpDataSourceManager, "dataSource");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc((Class)off_1E50B1688);
    v16 = v31[5];
    v17 = *((_OWORD *)off_1E50B8778 + 1);
    buf = *(_OWORD *)off_1E50B8778;
    v39 = v17;
    v18 = (void *)objc_msgSend(v15, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v16, 0, &buf);
    buf = 0u;
    v39 = 0u;
    if (v14)
    {
      -[NSObject indexPathForAssetReference:](v14, "indexPathForAssetReference:", v18);
      v19 = buf;
    }
    else
    {
      v19 = 0;
    }
    v20 = v19 != *(_QWORD *)off_1E50B7E98;
    if (v19 == *(_QWORD *)off_1E50B7E98)
    {
      PLUIGetLog();
      oneUpInitialAssetReference = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oneUpInitialAssetReference, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v36 = 138412290;
        *(_QWORD *)&v36[4] = v13;
        _os_log_impl(&dword_1A6789000, oneUpInitialAssetReference, OS_LOG_TYPE_ERROR, "Unable to present 1-Up for suggestion that was found in gadgets, because it could not be found in dataSource: %@", v36, 0xCu);
      }
    }
    else
    {
      v21 = objc_alloc((Class)off_1E50B1688);
      v22 = v31[5];
      *(_OWORD *)v36 = buf;
      v37 = v39;
      v23 = (PXAssetReference *)objc_msgSend(v21, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v22, 0, v36);
      oneUpInitialAssetReference = self->_oneUpInitialAssetReference;
      self->_oneUpInitialAssetReference = v23;
    }

  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Unable to present 1-Up for suggestion because it could not be found in the gadgets: %@", (uint8_t *)&buf, 0xCu);
    }
    v20 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v20;
}

- (void)presentOneUpForSuggestion:(id)a3 withMediaProvider:(id)a4 animated:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  BOOL v16;

  if (-[PXForYouRecentInterestSuggestionsGadgetProvider _prepareForOneUpPresentationForSuggestion:mediaProvider:](self, "_prepareForOneUpPresentationForSuggestion:mediaProvider:", a3, a4))
  {
    -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:

        objc_msgSend(v14, "oneUpPresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDelegate:", self);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __104__PXForYouRecentInterestSuggestionsGadgetProvider_presentOneUpForSuggestion_withMediaProvider_animated___block_invoke;
        v15[3] = &__block_descriptor_33_e44_v16__0___PXOneUpPresentationConfiguration__8l;
        v16 = a5;
        objc_msgSend(v7, "startWithConfigurationHandler:", v15);

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v11);
    }

    goto LABEL_4;
  }
}

- (id)suggestionGadgetPreviewController:(id)a3 withMediaProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXForYouRecentInterestSuggestionsGadgetProvider _prepareForOneUpPresentationForSuggestion:mediaProvider:](self, "_prepareForOneUpPresentationForSuggestion:mediaProvider:", v8, v7);

  if (!v9)
  {
    v12 = 0;
    goto LABEL_6;
  }
  -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v17);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v17, v19);

    goto LABEL_9;
  }
LABEL_4:

  objc_msgSend(v10, "oneUpPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "previewViewControllerAllowingActions:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouRecentInterestSuggestionsGadgetProvider _insertRemoveSuggestionActionIntoPreview:forGadget:](self, "_insertRemoveSuggestionActionIntoPreview:forGadget:", v12, v6);
  -[PXForYouRecentInterestSuggestionsGadgetProvider _insertSyndicationReplyIntoPreview:forGadget:](self, "_insertSyndicationReplyIntoPreview:forGadget:", v12, v6);
  -[PXForYouRecentInterestSuggestionsGadgetProvider _insertSuggestLessPersonActionIntoPreview:forGadget:](self, "_insertSuggestLessPersonActionIntoPreview:forGadget:", v12, v6);
  -[PXForYouRecentInterestSuggestionsGadgetProvider _addTTRActionIntoPreview:forGadget:](self, "_addTTRActionIntoPreview:forGadget:", v12, v6);

LABEL_6:
  return v12;
}

- (void)suggestionGadget:(id)a3 commitViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:

  objc_msgSend(v13, "oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitPreviewViewController:", v5);

}

- (void)suggestionGadget:(id)a3 didDismissPreviewController:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v5 = a5;
  v7 = a4;
  -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:

  objc_msgSend(v15, "oneUpPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didDismissPreviewViewController:committing:", v7, v5);

}

- (void)_insertRemoveSuggestionActionIntoPreview:(id)a3 forGadget:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  PXLocalizedStringFromTable(CFSTR("PXForYouRecentInterestSuggestionRemoveActionTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__PXForYouRecentInterestSuggestionsGadgetProvider__insertRemoveSuggestionActionIntoPreview_forGadget___block_invoke;
  v14[3] = &unk_1E513C038;
  v15 = v5;
  v10 = v5;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributes:", 2);
  objc_msgSend(v6, "px_previewActionMenus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addObject:", v11);
  objc_msgSend(v6, "px_setPreviewActionMenus:", v13);

}

- (void)_insertSuggestLessPersonActionIntoPreview:(id)a3 forGadget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchKeyAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setPersonContext:](v11, "setPersonContext:", 5);
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      if (objc_msgSend(v12, "count") == 1)
        v13 = CFSTR("PXForYouRecentInterestSuggestionSuggestLessPersonActionTitle");
      else
        v13 = CFSTR("PXForYouRecentInterestSuggestionSuggestLessPeopleActionTitle");
      PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.minus"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0DC3428];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __103__PXForYouRecentInterestSuggestionsGadgetProvider__insertSuggestLessPersonActionIntoPreview_forGadget___block_invoke;
      v21[3] = &unk_1E5141778;
      v21[4] = self;
      v16 = v6;
      v22 = v16;
      v23 = v7;
      objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v20, v14, 0, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributes:", 2);
      objc_msgSend(v16, "px_previewActionMenus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v19, "addObject:", v17);
      objc_msgSend(v16, "px_setPreviewActionMenus:", v19);

    }
    goto LABEL_9;
  }
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "suggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Trying to create suggest less action for asset that is not PHAsset (%@). (Suggestion: %@) ", buf, 0x16u);
LABEL_9:

  }
}

- (void)_performSuggestLessPersonActionIntoPreview:(id)a3 forGadget:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXSuggestLessPeopleHelper *v9;
  PXSuggestLessPeopleHelper *suggestLessPeopleHelper;
  PXSuggestLessPeopleHelper *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchKeyAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_alloc_init(PXSuggestLessPeopleHelper);
    suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
    self->_suggestLessPeopleHelper = v9;

    -[PXSuggestLessPeopleHelper setDelegate:](self->_suggestLessPeopleHelper, "setDelegate:", self);
    v11 = self->_suggestLessPeopleHelper;
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__PXForYouRecentInterestSuggestionsGadgetProvider__performSuggestLessPersonActionIntoPreview_forGadget___block_invoke;
    v15[3] = &unk_1E5148B78;
    v16 = v5;
    -[PXSuggestLessPeopleHelper suggestLessPeopleFromAssets:completionHandler:](v11, "suggestLessPeopleFromAssets:completionHandler:", v12, v15);

    v13 = v16;
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "suggestion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Trying to perform suggest less action for asset that is not PHAsset (%@). (Suggestion: %@) ", buf, 0x16u);

    }
  }

}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__PXForYouRecentInterestSuggestionsGadgetProvider_suggestLessPeopleHelper_presentViewController___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  return 1;
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__PXForYouRecentInterestSuggestionsGadgetProvider_suggestLessPeopleHelper_dismissViewController_completionHandler___block_invoke;
  block[3] = &unk_1E5145688;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return 1;
}

- (void)_addTTRActionIntoPreview:(id)a3 forGadget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PXForYouRecentInterestSuggestionsGadgetProvider *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canShowInternalUI");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __86__PXForYouRecentInterestSuggestionsGadgetProvider__addTTRActionIntoPreview_forGadget___block_invoke;
    v18 = &unk_1E513F280;
    v19 = self;
    v20 = v7;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", CFSTR("File a Radar"), v11, 0, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAttributes:", 2, v15, v16, v17, v18, v19);
    objc_msgSend(v6, "px_previewActionMenus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "addObject:", v12);
    objc_msgSend(v6, "px_setPreviewActionMenus:", v14);

  }
}

- (void)_insertSyndicationReplyIntoPreview:(id)a3 forGadget:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "syndicationReplyAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v8, "px_previewActionMenus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addObject:", v5);
    objc_msgSend(v8, "px_setPreviewActionMenus:", v7);

  }
}

- (void)configureGadget:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXForYouRecentInterestSuggestionsGadgetProvider;
  v3 = a3;
  -[PXForYouSuggestionsGadgetProvider configureGadget:](&v4, sel_configureGadget_, v3);
  objc_msgSend(v3, "setShouldShowSyndicationAttributionView:", 1, v4.receiver, v4.super_class);

}

- (id)_gadgetForAssetReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "asset");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PXGadgetProvider gadgets](self, "gadgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "suggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXForYouSuggestionsGadgetProvider keyAssetForSuggestion:](self, "keyAssetForSuggestion:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v4 == v12)
        {

LABEL_13:
          v15 = v10;
          goto LABEL_14;
        }
        v13 = v12;
        v14 = objc_msgSend(v4, "isEqual:", v12);

        if ((v14 & 1) != 0)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  return v15;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 15;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return self->_oneUpDataSourceManager;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return self->_oneUpMediaProvider;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  -[PXForYouRecentInterestSuggestionsGadgetProvider _gadgetForAssetReference:](self, "_gadgetForAssetReference:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "Unable to find gadget to determine ROI of asset, some transition could be glitchy.", v8, 2u);
    }

  }
  objc_msgSend(v4, "regionOfInterestForOneUpTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  void *v4;
  void *v5;

  -[PXForYouRecentInterestSuggestionsGadgetProvider _gadgetForAssetReference:](self, "_gadgetForAssetReference:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_oneUpInitialAssetReference;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "valueForKeyPath:", CFSTR("asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXGadgetProvider gadgets](self, "gadgets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "suggestion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXForYouSuggestionsGadgetProvider keyAssetForSuggestion:](self, "keyAssetForSuggestion:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContentHidden:", objc_msgSend(v5, "containsObject:", v13));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "asset", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXGadgetProvider gadgets](self, "gadgets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "suggestion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXForYouSuggestionsGadgetProvider keyAssetForSuggestion:](self, "keyAssetForSuggestion:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v5)
        break;
      v14 = v13;
      v15 = objc_msgSend(v13, "isEqual:", v5);

      if ((v15 & 1) != 0)
        goto LABEL_12;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_14;
      }
    }

LABEL_12:
    v16 = v11;

    if (!v16)
      goto LABEL_15;
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rootNavigationHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "navigateToGadgetInHorizontalGadget:animated:", v16, 0);
    v6 = v16;
  }
LABEL_14:

LABEL_15:
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  PXAssetReference *v4;
  PXAssetReference *v5;
  void *v6;
  PXForYouSuggestionAssetsDataSourceManager *v7;
  void *v8;
  id v9;
  PXPhotoKitAssetActionManager *v10;
  _QWORD v12[4];
  id v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;

  v4 = self->_oneUpInitialAssetReference;
  v5 = v4;
  v15 = 0u;
  v16 = 0u;
  if (v4)
    -[PXAssetReference indexPath](v4, "indexPath");
  v14[0] = v15;
  v14[1] = v16;
  objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_oneUpDataSourceManager;
  v8 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PXForYouRecentInterestSuggestionsGadgetProvider_oneUpPresentationActionManagerForPreviewing___block_invoke;
  v12[3] = &unk_1E513C668;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "performChanges:", v12);
  v10 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v8);
  -[PXActionManager setPerformerDelegate:](v10, "setPerformerDelegate:", self);

  return v10;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 0;
}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  return 1;
}

- (id)_hostViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetViewControllerHostingGadget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_presentViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXForYouRecentInterestSuggestionsGadgetProvider _hostViewController](self, "_hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  return 1;
}

- (BOOL)_dismissViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return -[PXForYouRecentInterestSuggestionsGadgetProvider _presentViewController:](self, "_presentViewController:", a4);
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;

  v7 = a4;
  v8 = _Block_copy(a5);
  LOBYTE(self) = -[PXForYouRecentInterestSuggestionsGadgetProvider _dismissViewController:completion:](self, "_dismissViewController:completion:", v7, v8);

  return (char)self;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PXForYouRecentInterestSuggestionsGadgetProvider _hostViewController](self, "_hostViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PXForYouRecentInterestSuggestionsGadgetProvider _hostViewController](self, "_hostViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_fileRadarForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXFeedbackTapToRadarViewController *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXForYouSuggestionsGadgetProvider keyAssetForSuggestion:](self, "keyAssetForSuggestion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(PXFeedbackTapToRadarViewController);
    -[PXFeedbackTapToRadarViewController setRequestScreenshotPermission:](v7, "setRequestScreenshotPermission:", 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__PXForYouRecentInterestSuggestionsGadgetProvider__fileRadarForSuggestion___block_invoke;
    v10[3] = &unk_1E5147460;
    v11 = v4;
    v12 = v5;
    v13 = v6;
    v8 = v6;
    -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v7, "setFileRadarHandler:", v10);
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentGadgetViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    PLUIGetLog();
    v7 = (PXFeedbackTapToRadarViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super.super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1A6789000, &v7->super.super.super.super, OS_LOG_TYPE_ERROR, "TTR: key asset for sugestion is not PHAsset (%@). (Suggestion: %@) ", buf, 0x16u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpMediaProvider, 0);
}

void __75__PXForYouRecentInterestSuggestionsGadgetProvider__fileRadarForSuggestion___block_invoke(_QWORD *a1, int a2, int a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Summary:\n-\n\nSteps To Reproduce:\n-\n\nResults:\n-\n\nRegression:\n-\n\nNotes:\n-\n\n"));
  objc_msgSend(v6, "appendString:", CFSTR("--- Featured Photos Gadget TTR ---\n"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Suggestion: %@\n\n"), a1[4]);
  objc_msgSend(v6, "appendFormat:", CFSTR("Suggested Asset: %@"), a1[5]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  if (a2)
  {
    +[PXFeedbackTapToRadarUtilities imageFileURLForAsset:](PXFeedbackTapToRadarUtilities, "imageFileURLForAsset:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "addObject:", v9);
    if (a1[6])
    {
      v14[0] = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    if (a3)
      goto LABEL_12;
  }
  else
  {
    v10 = 0;
    if (a3)
    {
LABEL_12:
      v13 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_13:
  LOWORD(v12) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", 0, v6, CFSTR("Other Bug"), CFSTR("1064134"), CFSTR("Photos Personalization"), CFSTR("all"), 0, v10, v7, v12, v11, 0);

}

uint64_t __95__PXForYouRecentInterestSuggestionsGadgetProvider_oneUpPresentationActionManagerForPreviewing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __86__PXForYouRecentInterestSuggestionsGadgetProvider__addTTRActionIntoPreview_forGadget___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "suggestion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_fileRadarForSuggestion:", v2);

}

void __115__PXForYouRecentInterestSuggestionsGadgetProvider_suggestLessPeopleHelper_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v1, "_dismissViewController:completion:", v2, v3);

}

uint64_t __97__PXForYouRecentInterestSuggestionsGadgetProvider_suggestLessPeopleHelper_presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", *(_QWORD *)(a1 + 40));
}

void __104__PXForYouRecentInterestSuggestionsGadgetProvider__performSuggestLessPersonActionIntoPreview_forGadget___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __104__PXForYouRecentInterestSuggestionsGadgetProvider__performSuggestLessPersonActionIntoPreview_forGadget___block_invoke_159;
    v9[3] = &unk_1E5149198;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "performChanges:completionHandler:", v9, &__block_literal_global_160_55444);

  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }
  }

}

void __104__PXForYouRecentInterestSuggestionsGadgetProvider__performSuggestLessPersonActionIntoPreview_forGadget___block_invoke_159(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markDeclined");
  if (objc_msgSend(*(id *)(a1 + 32), "featuredState") == 1)
    objc_msgSend(v2, "setFeaturedState:", 0);

}

void __104__PXForYouRecentInterestSuggestionsGadgetProvider__performSuggestLessPersonActionIntoPreview_forGadget___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable to retire and unfeature suggestion: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __103__PXForYouRecentInterestSuggestionsGadgetProvider__insertSuggestLessPersonActionIntoPreview_forGadget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSuggestLessPersonActionIntoPreview:forGadget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __102__PXForYouRecentInterestSuggestionsGadgetProvider__insertRemoveSuggestionActionIntoPreview_forGadget___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "suggestion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__PXForYouRecentInterestSuggestionsGadgetProvider__insertRemoveSuggestionActionIntoPreview_forGadget___block_invoke_2;
  v4[3] = &unk_1E5149198;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "performChanges:completionHandler:", v4, &__block_literal_global_55458);

}

void __102__PXForYouRecentInterestSuggestionsGadgetProvider__insertRemoveSuggestionActionIntoPreview_forGadget___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markDeclined");

}

void __102__PXForYouRecentInterestSuggestionsGadgetProvider__insertRemoveSuggestionActionIntoPreview_forGadget___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Could not decline featured photo suggestion: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __104__PXForYouRecentInterestSuggestionsGadgetProvider_presentOneUpForSuggestion_withMediaProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", *(unsigned __int8 *)(a1 + 32));
}

void __107__PXForYouRecentInterestSuggestionsGadgetProvider__prepareForOneUpPresentationForSuggestion_mediaProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "suggestion");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 32);
  if (v6 == v11)
  {

  }
  else
  {
    v7 = objc_msgSend(v6, "isEqual:", v11);

    if (!v7)
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "keyAssetForSuggestion:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *a4 = 1;
LABEL_6:

}

@end
