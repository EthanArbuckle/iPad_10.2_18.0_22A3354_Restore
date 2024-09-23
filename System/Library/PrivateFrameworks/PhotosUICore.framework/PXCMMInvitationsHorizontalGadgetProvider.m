@implementation PXCMMInvitationsHorizontalGadgetProvider

- (PXCMMInvitationsHorizontalGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsHorizontalGadgetProvider.m"), 54, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationsHorizontalGadgetProvider init]");

  abort();
}

- (PXCMMInvitationsHorizontalGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsHorizontalGadgetProvider.m"), 58, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationsHorizontalGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXCMMInvitationsHorizontalGadgetProvider)initWithWorkflowPresenter:(id)a3 libraryFilterState:(id)a4
{
  id v8;
  id v9;
  PXCMMInvitationsHorizontalGadgetProvider *v10;
  PXCMMInvitationsHorizontalGadgetProvider *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsHorizontalGadgetProvider.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowPresenter"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXCMMInvitationsHorizontalGadgetProvider;
  v10 = -[PXGadgetProvider init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workflowPresenter, a3);
    objc_storeStrong((id *)&v11->_libraryFilterState, a4);
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addDeferredKeyObserver:", v11);

    -[PXLibraryFilterState registerChangeObserver:context:](v11->_libraryFilterState, "registerChangeObserver:context:", v11, PXLibraryFilterStateObservationContext_266611);
  }

  return v11;
}

- (void)_configureDataSourceManager
{
  void *v3;
  uint64_t v4;
  PXCMMInvitationsDataSourceManager *v5;
  PXCMMInvitationsDataSourceManager *dataSourceManager;
  PXCMMInvitationsDataSourceManager *v7;

  -[PXCMMInvitationsHorizontalGadgetProvider libraryFilterState](self, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  if (v4 == 2)
    +[PXCMMInvitationsDataSourceManager emptyDataSourceManager](PXCMMInvitationsDataSourceManager, "emptyDataSourceManager");
  else
    +[PXCMMInvitationsDataSourceManager currentDataSourceManager](PXCMMInvitationsDataSourceManager, "currentDataSourceManager");
  v5 = (PXCMMInvitationsDataSourceManager *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_dataSourceManager, "unregisterChangeObserver:context:", self, PXDataSourceManagerObservationContext_266610);
  dataSourceManager = self->_dataSourceManager;
  self->_dataSourceManager = v5;
  v7 = v5;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, PXDataSourceManagerObservationContext_266610);
  -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_266629);
  -[PXCMMInvitationsHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)_updateGadgets
{
  void *v4;
  int v5;
  void *v6;
  PXHorizontalCollectionGadget *v7;
  void *v8;
  PXCMMInvitationsGadgetProvider *v9;
  PXHorizontalCollectionGadget *v10;
  void *v11;
  void *v12;
  PXHorizontalCollectionGadget *v13;
  _QWORD v14[4];
  PXHorizontalCollectionGadget *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (self->_didGenerateGadgets)
  {
    -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsAnyItems");

    if (v5)
    {
      -[PXGadgetProvider gadgets](self, "gadgets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsHorizontalGadgetProvider.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[horizontalGadget isKindOfClass:[PXHorizontalCollectionGadget class]]"));

        }
      }
      else
      {
        v9 = -[PXCMMInvitationsGadgetProvider initWithDataSourceManager:workflowPresenter:]([PXCMMInvitationsGadgetProvider alloc], "initWithDataSourceManager:workflowPresenter:", self->_dataSourceManager, self->_workflowPresenter);
        v10 = [PXHorizontalCollectionGadget alloc];
        v16[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[PXHorizontalCollectionGadget initWithProviders:](v10, "initWithProviders:", v11);

        -[PXHorizontalCollectionGadget setGadgetType:](v7, "setGadgetType:", 1);
        -[PXHorizontalCollectionGadget setDefaultColumnSpan:](v7, "setDefaultColumnSpan:", 2);
        -[PXHorizontalCollectionGadget setIsFixedHeight:](v7, "setIsFixedHeight:", 1);
        -[PXHorizontalCollectionGadget performChanges:](v7, "performChanges:", &__block_literal_global_142_266621);

      }
    }
    else
    {
      v7 = 0;
    }
    -[PXGadgetProvider gadgets](self, "gadgets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();

    if (v13 != v7)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__PXCMMInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke_2;
      v14[3] = &unk_1E5145360;
      v15 = v7;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v14);

    }
  }
}

- (unint64_t)gadgetType
{
  return 1;
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  unint64_t v3;

  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsAnyItems");

  return v3;
}

- (void)generateGadgets
{
  self->_didGenerateGadgets = 1;
  -[PXCMMInvitationsHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (NSDate)mostRecentContentDate
{
  return (NSDate *)+[PXCMMMomentShareInvitationsDataSourceManager mostRecentCreationDate](PXCMMMomentShareInvitationsDataSourceManager, "mostRecentCreationDate");
}

- (int64_t)forYouContentIdentifier
{
  return 9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXDataSourceManagerObservationContext_266610 == a5)
  {
    v11 = v9;
    -[PXCMMInvitationsHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");
    goto LABEL_6;
  }
  if ((void *)PXLibraryFilterStateObservationContext_266611 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsHorizontalGadgetProvider.m"), 174, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXCMMInvitationsHorizontalGadgetProvider _configureDataSourceManager](self, "_configureDataSourceManager");
LABEL_6:
    v9 = v11;
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("showIncomingShares")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("showOutgoingShares")) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("invitationsDataSourceType"));

      if ((v8 & 1) == 0)
        goto LABEL_7;
    }
    -[PXCMMInvitationsHorizontalGadgetProvider _configureDataSourceManager](self, "_configureDataSourceManager");
  }
  else
  {

  }
LABEL_7:

}

- (PXCMMWorkflowPresenting)workflowPresenter
{
  return self->_workflowPresenter;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_workflowPresenter, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

void __58__PXCMMInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = a2;
    objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addGadgets:", v4, v5, v6);

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "removeAllGadgets");
  }

}

void __58__PXCMMInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  PXLocalizedStringFromTable(CFSTR("PXCMMInvitationGadgetTitle"), CFSTR("PhotosUICore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionTitle:", v3);

}

uint64_t __71__PXCMMInvitationsHorizontalGadgetProvider__configureDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

@end
