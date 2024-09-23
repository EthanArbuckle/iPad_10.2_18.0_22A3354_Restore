@implementation PXForYouMemoryGadgetProvider

- (PXForYouMemoryGadgetProvider)initWithLibraryFilterState:(id)a3
{
  id v5;
  PXForYouMemoryGadgetProvider *v6;
  PXForYouMemoryGadgetProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXForYouMemoryGadgetProvider;
  v6 = -[PXGadgetProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_libraryFilterState, a3);

  return v7;
}

- (PXForYouMemoryGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouMemoryGadgetProvider.m"), 67, CFSTR("%s is not available as initializer"), "-[PXForYouMemoryGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXForYouMemoryGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouMemoryGadgetProvider.m"), 71, CFSTR("%s is not available as initializer"), "-[PXForYouMemoryGadgetProvider init]");

  abort();
}

- (void)setWantsGadgets:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (self->_wantsGadgets != a3)
  {
    self->_wantsGadgets = a3;
    if (a3)
    {
      -[PXForYouMemoryGadgetProvider dataSourceManager](self, "dataSourceManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__PXForYouMemoryGadgetProvider_setWantsGadgets___block_invoke;
      v6[3] = &unk_1E5145360;
      v7 = v4;
      v5 = v4;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v6);

    }
    else
    {
      -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_254024);
    }
  }
}

- (void)_updateWantsGadget
{
  id v3;

  -[PXForYouMemoryGadgetProvider dataSourceManager](self, "dataSourceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXForYouMemoryGadgetProvider setWantsGadgets:](self, "setWantsGadgets:", objc_msgSend(v3, "hasAnyMemories"));

}

- (unint64_t)gadgetType
{
  return 5;
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)loadDataForGadgets
{
  PXStoryMemoryForYouDataSourceManager *v3;
  void *v4;
  PXStoryMemoryForYouDataSourceManager *v5;
  PXMemoryForYouDataSourceManager *dataSourceManager;
  id v7;

  if (!self->_dataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [PXStoryMemoryForYouDataSourceManager alloc];
    -[PXForYouMemoryGadgetProvider libraryFilterState](self, "libraryFilterState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXStoryMemoryForYouDataSourceManager initWithPhotoLibrary:libraryFilterState:](v3, "initWithPhotoLibrary:libraryFilterState:", v7, v4);

    -[PXSectionedDataSourceManager registerChangeObserver:context:](v5, "registerChangeObserver:context:", self, PXMemoriesDataSourceManagerObservationContext);
    dataSourceManager = self->_dataSourceManager;
    self->_dataSourceManager = (PXMemoryForYouDataSourceManager *)v5;

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXMemoriesDataSourceManagerObservationContext == a5)
    -[PXForYouMemoryGadgetProvider _invalidateWantsGadget](self, "_invalidateWantsGadget", a3);
}

- (NSDate)mostRecentContentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (int64_t)forYouContentIdentifier
{
  return 1;
}

- (PXMemoryForYouDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)wantsGadgets
{
  return self->_wantsGadgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __48__PXForYouMemoryGadgetProvider_setWantsGadgets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXStoryMemoryFeedConfiguration *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[PXStoryMemoryFeedConfiguration initWithMemoryForYouDataSourceManager:layoutKind:]([PXStoryMemoryFeedConfiguration alloc], "initWithMemoryForYouDataSourceManager:layoutKind:", *(_QWORD *)(a1 + 32), 2);
  +[PXStoryUIFactory feedGadgetWithConfiguration:](PXStoryUIFactory, "feedGadgetWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v6);

}

uint64_t __48__PXForYouMemoryGadgetProvider_setWantsGadgets___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

+ (unint64_t)maxMemoriesToFetch
{
  void *v2;
  unint64_t v3;

  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxMemoriesToFetch");

  return v3;
}

@end
