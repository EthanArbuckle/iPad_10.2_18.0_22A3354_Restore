@implementation PUStorageTipListViewController

- (void)viewDidLoad
{
  PHPhotoLibrary *v3;
  PHPhotoLibrary *photoLibrary;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UICollectionView *v9;
  UICollectionView *collectionView;
  PUStorageTipCollectionViewDataSectionManager *v11;
  PUStorageTipCollectionViewDataSectionManager *dataSectionManager;
  PUStorageTipCollectionViewDataSection *v13;
  PUStorageTipCollectionViewDataSection *currentDataSection;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PUStorageTipListViewController;
  -[PUStorageTipListViewController viewDidLoad](&v22, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v3 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v3;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v5, "setFooterMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PUStorageTipListViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v6);
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUStorageTipCell"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("PUStorageTipFooter"));
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v11 = -[PUStorageTipCollectionViewDataSectionManager initWithPhotoLibrary:]([PUStorageTipCollectionViewDataSectionManager alloc], "initWithPhotoLibrary:", self->_photoLibrary);
  dataSectionManager = self->_dataSectionManager;
  self->_dataSectionManager = v11;

  -[PUStorageTipCollectionViewDataSectionManager registerChangeObserver:context:](self->_dataSectionManager, "registerChangeObserver:context:", self, PUStorageTipCollectionViewDataSectionObservationContext);
  -[PXDataSectionManager dataSection](self->_dataSectionManager, "dataSection");
  v13 = (PUStorageTipCollectionViewDataSection *)objc_claimAutoreleasedReturnValue();
  currentDataSection = self->_currentDataSection;
  self->_currentDataSection = v13;

  self->_storageRecovered = 0;
  PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_ALL_LIST_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipListViewController setTitle:](self, "setTitle:", v15);

  -[PUStorageTipListViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_collectionView);

  v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PXLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v18, 2, self, sel_dismiss);

  -[PUStorageTipListViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipListViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v21);

}

- (void)dismiss
{
  -[PUStorageTipListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)storageViewForTipType:(unint64_t)a3
{
  __objc2_class **v3;
  PUStorageTipListViewController *v5;
  void *v7;

  v3 = off_1E58858E0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_4;
    case 1uLL:
      v3 = off_1E5885E90;
      goto LABEL_4;
    case 2uLL:
      v3 = off_1E58859F8;
LABEL_4:
      self = (PUStorageTipListViewController *)objc_alloc_init(*v3);
      break;
    case 3uLL:
      v5 = self;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PUStorageTipListViewController.m"), 100, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      return self;
  }
  return self;
}

- (id)_noContentConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_ALL_LIST_EMPTY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryText:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTextProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  return v2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  -[PUStorageTipListViewController displayedItems](self, "displayedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PUStorageTipListViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipListViewController storageViewForTipType:](self, "storageViewForTipType:", objc_msgSend(v11, "storageTipType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUStorageTipListViewController displayedItems](self, "displayedItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PUStorageTipListViewController displayedItems](self, "displayedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUStorageTipCell"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v9, "systemImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v14);

  objc_msgSend(v9, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v15);

  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v9, "totalSizeInBytes"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryText:", v16);

  PLUIGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v9, "totalSizeInBytes"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_INFO, "Cloud Storage Recoverable for %@: %@", buf, 0x16u);

  }
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 10.0, 20.0, 10.0, 20.0);
  objc_msgSend(v10, "setContentConfiguration:", v11);
  v20 = objc_alloc(MEMORY[0x1E0DC3578]);
  v21 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringFromNumber:numberStyle:", v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithText:", v23);

  v25 = objc_alloc_init(MEMORY[0x1E0DC3568]);
  v28[0] = v25;
  v28[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessories:", v26);

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((id)*MEMORY[0x1E0DC48A0] != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStorageTipListViewController.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind == UICollectionElementKindSectionFooter"));

  }
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("PUStorageTipFooter"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultContentConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStorageTipListViewController displayedItems](self, "displayedItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_ALL_LIST_FOOTER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v15);

  }
  else
  {
    objc_msgSend(v13, "setText:", &stru_1E58AD278);
  }

  objc_msgSend(v12, "setContentConfiguration:", v13);
  return v12;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v8 = a3;
  if ((void *)PUStorageTipCollectionViewDataSectionObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStorageTipListViewController.m"), 183, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  -[PUStorageTipListViewController dataSectionManager](self, "dataSectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUStorageTipListViewController currentDataSection](self, "currentDataSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "totalStorageSize");

  if (v13 >= 1)
  {
    v14 = -[PUStorageTipListViewController storageRecovered](self, "storageRecovered");
    -[PUStorageTipListViewController currentDataSection](self, "currentDataSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStorageTipListViewController setStorageRecovered:](self, "setStorageRecovered:", objc_msgSend(v15, "totalStorageSize") + v14 - objc_msgSend(v11, "totalStorageSize"));

  }
  -[PUStorageTipListViewController setCurrentDataSection:](self, "setCurrentDataSection:", v11);
  -[PUStorageTipListViewController _updateDisplayedItems](self, "_updateDisplayedItems");
  -[PUStorageTipListViewController displayedItems](self, "displayedItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[PUStorageTipListViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
  }
  else
  {
    -[PUStorageTipListViewController _noContentConfiguration](self, "_noContentConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStorageTipListViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v18);

    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_INFO, "Cloud Storage Recommendation has no content available.", v22, 2u);
    }

  }
  -[PUStorageTipListViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadData");

}

- (void)_updateDisplayedItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUStorageTipListViewController currentDataSection](self, "currentDataSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      -[PUStorageTipListViewController currentDataSection](self, "currentDataSection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count") >= 1)
        objc_msgSend(v10, "addObject:", v7);

      ++v5;
      -[PUStorageTipListViewController currentDataSection](self, "currentDataSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v5 < v9);
  }
  -[PUStorageTipListViewController setDisplayedItems:](self, "setDisplayedItems:", v10);

}

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  void *v5;
  id preferenceValue;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  preferenceValue = self->_preferenceValue;
  self->_preferenceValue = v5;

}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (int64_t)storageRecovered
{
  return self->_storageRecovered;
}

- (void)setStorageRecovered:(int64_t)a3
{
  self->_storageRecovered = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)displayedItems
{
  return self->_displayedItems;
}

- (void)setDisplayedItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayedItems, a3);
}

- (PUStorageTipCollectionViewDataSectionManager)dataSectionManager
{
  return self->_dataSectionManager;
}

- (void)setDataSectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSectionManager, a3);
}

- (PUStorageTipCollectionViewDataSection)currentDataSection
{
  return self->_currentDataSection;
}

- (void)setCurrentDataSection:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSection, 0);
  objc_storeStrong((id *)&self->_dataSectionManager, 0);
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
