@implementation PXPeopleOnboardingViewController

- (PXPeopleOnboardingViewController)initWithDataSource:(id)a3 progressManager:(id)a4 libraryFilterState:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleOnboardingViewController *v12;
  void *v13;
  uint64_t v14;
  PHPhotoLibrary *photoLibrary;
  uint64_t v16;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXPeopleOnboardingViewController;
  v12 = -[PXPeopleOnboardingViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v12)
  {
    objc_msgSend(v10, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photoLibrary");
    v14 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v12->_photoLibrary;
    v12->_photoLibrary = (PHPhotoLibrary *)v14;

    objc_storeStrong((id *)&v12->_libraryFilterState, a5);
    objc_storeStrong((id *)&v12->_progressManager, a4);
    objc_storeStrong((id *)&v12->_peopleDataSource, a3);
    -[PXPeopleProgressManager setUpdateInterval:](v12->_progressManager, "setUpdateInterval:", 30.0);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v12->_photoLibrary);
    v16 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v12->_sharedLibraryStatusProvider;
    v12->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v16;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v12->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v12, PXSharedLibraryStatusProviderObservationContext_49945);
    -[PXLibraryFilterState registerChangeObserver:context:](v12->_libraryFilterState, "registerChangeObserver:context:", v12, PXLibraryFilterStateObservationContext_49946);
  }

  return v12;
}

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleOnboardingViewController;
  -[PXPeopleOnboardingViewController viewDidLoad](&v12, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PXPeopleOnboardingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(v6, "px_peoplePetsHomeVisibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(v5, "px_setPreferredLargeTitleDisplayMode:", 2);
  -[PXPeopleOnboardingViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController _updateStatusViewForStatus:](self, "_updateStatusViewForStatus:", objc_msgSend(v8, "processingStatus"));

  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMonitoringProgress:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__progressChanged_, CFSTR("PXPeopleProgressDidChangeNotification"), v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleOnboardingViewController;
  -[PXPeopleOnboardingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMonitoringProgress:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleOnboardingViewController;
  -[PXPeopleOnboardingViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMonitoringProgress:", 0);

}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPeopleOnboardingViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSharedLibraryOrPreview"))
  {
    -[PXPeopleOnboardingViewController libraryFilterState](self, "libraryFilterState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibrarySwitchLibraryButtonItems(v3, objc_msgSend(v6, "hasPreview"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleOnboardingViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItems:", v4);

  }
  else
  {
    -[PXPeopleOnboardingViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItems:", 0);
  }

}

- (id)_textAttachmentImageForSystemImageNamed:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = a3;
  objc_msgSend(v3, "configurationWithWeight:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_emptyPlaceholderTextAttributesFromTextProperties:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a3;
  objc_msgSend(v3, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v4, "lineBreakMode"));
  v11[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v4, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v4, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = *MEMORY[0x1E0DC1178];
  v12[1] = v8;
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sharedLibraryEmptyPeopleAlbumTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController _emptyPlaceholderTextAttributesFromTextProperties:](self, "_emptyPlaceholderTextAttributesFromTextProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleOnboardingViewController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v6, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleEmptyTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v7, v5);
  return v8;
}

- (id)_sharedLibraryEmptyPeopleAlbumMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTextProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController _emptyPlaceholderTextAttributesFromTextProperties:](self, "_emptyPlaceholderTextAttributesFromTextProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleOnboardingViewController libraryFilterState](self, "libraryFilterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "viewMode");
  -[PXPeopleOnboardingViewController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryEmptyPeopleMessageForViewMode(v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateStatusViewSharedLibrary
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController _sharedLibraryEmptyPeopleAlbumTitle](self, "_sharedLibraryEmptyPeopleAlbumTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v3);

  -[PXPeopleOnboardingViewController _sharedLibraryEmptyPeopleAlbumMessage](self, "_sharedLibraryEmptyPeopleAlbumMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryAttributedText:", v4);

  -[PXPeopleOnboardingViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v5);
}

- (void)_updateStatusViewForStatus:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PXPeopleOnboardingViewController libraryFilterState](self, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewMode");

  if (v6)
  {
    -[PXPeopleOnboardingViewController _updateStatusViewSharedLibrary](self, "_updateStatusViewSharedLibrary");
  }
  else
  {
    switch(a3)
    {
      case 0:
      case 1:
      case 3:
        PXLocalizedStringFromTable(CFSTR("PXPeopleUpdatingTitle"), CFSTR("PhotosUICore"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("PXPeopleUpdatingMessage");
        goto LABEL_6;
      case 2:
        PXLocalizedStringFromTable(CFSTR("PXPeopleNoPeopleTitle"), CFSTR("PhotosUICore"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v7 = CFSTR("PXPeopleNoPeopleMessage");
LABEL_6:
        PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMonitoringProgress:", 0);

        -[PXPeopleOnboardingViewController _pushToPeopleHome](self, "_pushToPeopleHome");
        goto LABEL_8;
      default:
LABEL_8:
        v8 = 0;
        v11 = 0;
LABEL_9:
        objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setText:", v11);
        objc_msgSend(v10, "setSecondaryText:", v8);
        -[PXPeopleOnboardingViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v10);

        break;
    }
  }
}

- (void)_pushToPeopleHome
{
  void *v3;
  void *v4;
  PXPeopleCollectionViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPeopleCollectionViewController *v15;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PXPeopleProgressDidChangeNotification"), v4);

  v5 = [PXPeopleCollectionViewController alloc];
  -[PXPeopleOnboardingViewController peopleDataSource](self, "peopleDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleOnboardingViewController libraryFilterState](self, "libraryFilterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXPeopleCollectionViewController initWithDataSource:progressManager:libraryFilterState:](v5, "initWithDataSource:progressManager:libraryFilterState:", v6, v7, v8);

  -[PXPeopleCollectionViewController setProgressFooterAvailable:](v15, "setProgressFooterAvailable:", 1);
  -[PXPeopleOnboardingViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "px_hidesBackButtonInRegularWidth");
  -[PXPeopleCollectionViewController navigationItem](v15, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_setHidesBackButtonInRegularWidth:", v10);

  -[PXPeopleOnboardingViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObject:", self);
  objc_msgSend(v14, "addObject:", v15);
  objc_msgSend(v12, "setViewControllers:animated:", v14, 1);

}

- (void)_progressChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXPeopleOnboardingViewController__progressChanged___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 8)
  {
    objc_msgSend(v3, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "px_isPeopleVirtualCollection");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = a3;
  v8 = -[PXPeopleOnboardingViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", v7);
  objc_msgSend(v7, "sidebarBackNavigationRootDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_isPeopleVirtualCollection");

  if (v11)
  {
    -[PXPeopleOnboardingViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PXPeopleOnboardingViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_updateBackButtonVisibilityForTraitCollection:", v13);

  }
  if (v8 == 1)
    v14 = 1;
  else
    v14 = 2;
  v15[2](v15, v14, 0);

}

- (id)px_navigationDestination
{
  PXProgrammaticNavigationDestination *v3;
  void *v4;
  void *v5;
  void *v6;
  PXProgrammaticNavigationDestination *v7;

  v3 = [PXProgrammaticNavigationDestination alloc];
  -[PXPeopleOnboardingViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_virtualCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXProgrammaticNavigationDestination initWithObject:revealMode:](v3, "initWithObject:revealMode:", v6, 0);

  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_49945 == a5)
  {
    if ((v6 & 3) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((void *)PXLibraryFilterStateObservationContext_49946 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleOnboardingViewController.m"), 259, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
LABEL_4:
    v12 = v9;
    -[PXPeopleOnboardingViewController _updateNavigationBar](self, "_updateNavigationBar");
    -[PXPeopleOnboardingViewController progressManager](self, "progressManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleOnboardingViewController _updateStatusViewForStatus:](self, "_updateStatusViewForStatus:", objc_msgSend(v10, "processingStatus"));

    v9 = v12;
  }
LABEL_5:

}

- (PXPeopleProgressManager)progressManager
{
  return self->_progressManager;
}

- (PXPeopleSectionedDataSource)peopleDataSource
{
  return self->_peopleDataSource;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_peopleDataSource, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
}

void __53__PXPeopleOnboardingViewController__progressChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "progressManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateStatusViewForStatus:", objc_msgSend(v2, "processingStatus"));

}

@end
