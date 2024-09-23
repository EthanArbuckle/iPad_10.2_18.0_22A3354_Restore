@implementation PXSharedLibrarySharingSuggestionsGadgetProvider

- (PXSharedLibrarySharingSuggestionsGadgetProvider)initWithLibraryFilterState:(id)a3
{
  id v5;
  PXSharedLibrarySharingSuggestionsGadgetProvider *v6;
  void *v7;
  PXSharedLibrarySharingSuggestionsDataSourceManager *v8;
  PXSharedLibrarySharingSuggestionsDataSourceManager *dataSourceManager;
  uint64_t v10;
  PXSharedLibrarySharingSuggestionsCountsManager *countsManager;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibrarySharingSuggestionsGadgetProvider;
  v6 = -[PXGadgetProvider init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_libraryFilterState, a3);
    v8 = -[PXSharedLibrarySharingSuggestionsDataSourceManager initWithPhotoLibrary:]([PXSharedLibrarySharingSuggestionsDataSourceManager alloc], "initWithPhotoLibrary:", v7);
    dataSourceManager = v6->_dataSourceManager;
    v6->_dataSourceManager = v8;

    -[PXSectionedDataSourceManager registerChangeObserver:context:](v6->_dataSourceManager, "registerChangeObserver:context:", v6, PXSharingSuggestionsDataSourceManagerObservationContext);
    objc_msgSend(v7, "px_sharedLibrarySharingSuggestionsCountsManager");
    v10 = objc_claimAutoreleasedReturnValue();
    countsManager = v6->_countsManager;
    v6->_countsManager = (PXSharedLibrarySharingSuggestionsCountsManager *)v10;

    -[PXSharedLibrarySharingSuggestionsCountsManager registerChangeObserver:context:](v6->_countsManager, "registerChangeObserver:context:", v6, PXSharingSuggestionsCountsManagerObservationContext);
    -[PXLibraryFilterState registerChangeObserver:context:](v6->_libraryFilterState, "registerChangeObserver:context:", v6, PXSharingSuggestionsLibraryFilterStateObservationContext);
    -[PXSharedLibrarySharingSuggestionsGadgetProvider _invalidateWantsGadget](v6, "_invalidateWantsGadget");

  }
  return v6;
}

- (PXSharedLibrarySharingSuggestionsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsGadgetProvider.m"), 58, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionsGadgetProvider initWithIdentifier:]");

  abort();
}

- (void)setWantsGadgets:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[4];
  void *v13;
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (self->_wantsGadgets != a3)
  {
    self->_wantsGadgets = a3;
    if (a3)
    {
      -[PXSharedLibrarySharingSuggestionsGadgetProvider feedGadget](self, "feedGadget");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[PXSharedLibrarySharingSuggestionsGadgetProvider dataSourceManager](self, "dataSourceManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __67__PXSharedLibrarySharingSuggestionsGadgetProvider_setWantsGadgets___block_invoke;
        v14[3] = &unk_1E5142478;
        v8 = (id *)v15;
        v15[0] = v11;
        v15[1] = self;
        v9 = v11;
        v10 = v14;
LABEL_8:
        -[PXGadgetProvider performChanges:](self, "performChanges:", v10);

        return;
      }
      if (self->_wantsGadgets)
        return;
    }
    -[PXSharedLibrarySharingSuggestionsGadgetProvider feedGadget](self, "feedGadget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    -[PXSharedLibrarySharingSuggestionsGadgetProvider feedGadget](self, "feedGadget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibrarySharingSuggestionsGadgetProvider setFeedGadget:](self, "setFeedGadget:", 0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__PXSharedLibrarySharingSuggestionsGadgetProvider_setWantsGadgets___block_invoke_2;
    v12[3] = &unk_1E5145360;
    v8 = &v13;
    v13 = v7;
    v9 = v7;
    v10 = v12;
    goto LABEL_8;
  }
}

- (void)_updateWantsGadget
{
  void *v3;
  id v4;

  -[PXSharedLibrarySharingSuggestionsGadgetProvider countsManager](self, "countsManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasAnySuggestions") & 1) != 0 || (objc_msgSend(v4, "needsParticipantSetup") & 1) != 0)
  {
    -[PXSharedLibrarySharingSuggestionsGadgetProvider libraryFilterState](self, "libraryFilterState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestionsGadgetProvider setWantsGadgets:](self, "setWantsGadgets:", objc_msgSend(v3, "viewMode") != 2);

  }
  else
  {
    -[PXSharedLibrarySharingSuggestionsGadgetProvider setWantsGadgets:](self, "setWantsGadgets:", 0);
  }

}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharingSuggestionsCountsManagerObservationContext == a5)
  {
    if ((v6 & 0x11) == 0)
      goto LABEL_10;
LABEL_9:
    -[PXSharedLibrarySharingSuggestionsGadgetProvider _invalidateWantsGadget](self, "_invalidateWantsGadget");
    goto LABEL_10;
  }
  if ((void *)PXSharingSuggestionsLibraryFilterStateObservationContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if ((void *)PXSharingSuggestionsDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsGadgetProvider.m"), 132, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    -[PXSharedLibrarySharingSuggestionsGadgetProvider feedGadget](self, "feedGadget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestionsGadgetProvider feedGadget](self, "feedGadget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gadget:didChange:", v12, 2);

  }
  if ((v6 & 2) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__PXSharedLibrarySharingSuggestionsGadgetProvider_observable_didChange_context___block_invoke;
    v14[3] = &unk_1E5145360;
    v14[4] = self;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v14);
  }
LABEL_10:

}

- (unint64_t)gadgetType
{
  return 20;
}

- (NSDate)mostRecentContentDate
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySharingSuggestionsGadgetProvider countsManager](self, "countsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "priorityDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)forYouContentIdentifier
{
  return 11;
}

- (PXSharedLibrarySharingSuggestionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)countsManager
{
  return self->_countsManager;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)wantsGadgets
{
  return self->_wantsGadgets;
}

- (PXFeedGadget)feedGadget
{
  return self->_feedGadget;
}

- (void)setFeedGadget:(id)a3
{
  objc_storeStrong((id *)&self->_feedGadget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGadget, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_countsManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

uint64_t __80__PXSharedLibrarySharingSuggestionsGadgetProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWantsGadgets:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWantsGadget");
}

void __67__PXSharedLibrarySharingSuggestionsGadgetProvider_setWantsGadgets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXSharedLibrarySharingSuggestionsFeedConfiguration *v4;
  PXFeedGadget *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[PXSharedLibrarySharingSuggestionsFeedConfiguration initWithDataSourceManager:]([PXSharedLibrarySharingSuggestionsFeedConfiguration alloc], "initWithDataSourceManager:", *(_QWORD *)(a1 + 32));
  v5 = -[PXFeedGadget initWithConfiguration:]([PXFeedGadget alloc], "initWithConfiguration:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setFeedGadget:", v5);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v6);

}

uint64_t __67__PXSharedLibrarySharingSuggestionsGadgetProvider_setWantsGadgets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeGadgets:", *(_QWORD *)(a1 + 32));
}

@end
