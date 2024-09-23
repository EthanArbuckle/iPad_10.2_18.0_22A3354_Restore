@implementation PXSharedLibrarySuggestionsSettingsViewController

- (PXSharedLibrarySuggestionsSettingsViewController)initWithSharedLibraryStatusProvider:(id)a3
{
  PXSharedLibrarySuggestionsSettingsViewController *v6;
  PXSharedLibrarySuggestionsSettingsViewController *v7;
  uint64_t v8;
  NSMutableArray *sections;
  uint64_t v10;
  UISwitch *suggestionsEnabledSwitch;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  UICollectionView *peopleCollectionView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  UICollectionViewDiffableDataSource *peopleCollectionViewDataSource;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  _QWORD v42[4];
  id v43;
  objc_super v44;
  id location[3];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v39 = a3;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySuggestionsSettingsViewController.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

  }
  v44.receiver = self;
  v44.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  v6 = -[PXSharedLibrarySuggestionsSettingsViewController initWithNibName:bundle:](&v44, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedLibraryStatusProvider, a3);
    v8 = objc_opt_new();
    sections = v7->_sections;
    v7->_sections = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    suggestionsEnabledSwitch = v7->_suggestionsEnabledSwitch;
    v7->_suggestionsEnabledSwitch = (UISwitch *)v10;

    -[UISwitch setOn:](v7->_suggestionsEnabledSwitch, "setOn:", PLIsSharedLibrarySuggestionsEnabled());
    -[UISwitch addTarget:action:forControlEvents:](v7->_suggestionsEnabledSwitch, "addTarget:action:forControlEvents:", v7, sel_suggestionsEnabledChanged_, 4096);
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v38, v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 92.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v14, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3350];
    location[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", location, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "horizontalGroupWithLayoutSize:subitems:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInterGroupSpacing:", 12.0);
    objc_msgSend(v19, "setContentInsets:", 18.0, 18.0, 32.0, 18.0);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setScrollDirection:", 1);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:configuration:", v19, v20);
    v22 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v23 = objc_msgSend(v22, "initWithFrame:collectionViewLayout:", v21, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    peopleCollectionView = v7->_peopleCollectionView;
    v7->_peopleCollectionView = (UICollectionView *)v23;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v7->_peopleCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v7->_peopleCollectionView, "setBackgroundColor:", v25);

    -[UICollectionView setDelegate:](v7->_peopleCollectionView, "setDelegate:", v7);
    -[UICollectionView heightAnchor](v7->_peopleCollectionView, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", 150.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    objc_initWeak(location, v7);
    v28 = (void *)MEMORY[0x1E0DC35C8];
    v29 = objc_opt_class();
    v30 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke;
    v42[3] = &unk_1E511D708;
    objc_copyWeak(&v43, location);
    objc_msgSend(v28, "registrationWithCellClass:configurationHandler:", v29, v42);
    aBlock[0] = v30;
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke_2;
    aBlock[3] = &unk_1E511D730;
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v31;
    v32 = _Block_copy(aBlock);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", v7->_peopleCollectionView, v32);
    peopleCollectionViewDataSource = v7->_peopleCollectionViewDataSource;
    v7->_peopleCollectionViewDataSource = (UICollectionViewDiffableDataSource *)v33;

    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }

  return v7;
}

- (void)suggestionsEnabledChanged:(id)a3
{
  -[UISwitch isOn](self->_suggestionsEnabledSwitch, "isOn", a3);
  PXPreferencesSetSharedLibrarySuggestionsEnabled();
  -[PXSharedLibrarySuggestionsSettingsViewController _update](self, "_update");
}

- (void)removePerson:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySuggestionsSettingsViewController.m"), 160, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySuggestionsSettingsViewController.m"), 160, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v14);
  }

LABEL_3:
  -[UICollectionView indexPathForCell:](self->_peopleCollectionView, "indexPathForCell:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_peopleCollectionViewDataSource, "itemIdentifierForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PXSharedLibraryStatusProvider sharedLibrary](self->_sharedLibraryStatusProvider, "sharedLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__PXSharedLibrarySuggestionsSettingsViewController_removePerson___block_invoke;
    v17[3] = &unk_1E5148B78;
    v17[4] = self;
    objc_msgSend(v9, "removePersonUUIDsFromPersonCondition:completion:", v11, v17);

  }
}

- (void)addOtherPeople:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CD21E8]);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_PickerTitle_AddOthers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPurpose:", v4);

  objc_msgSend(v10, "setAllowsEditingCollection:", 1);
  -[PXSharedLibraryRulePeopleDataManager currentPersonIdentifiers](self->_peopleDataManager, "currentPersonIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisabledIdentifiers:", v5);

  v6 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PXSharedLibraryStatusProvider photoLibrary](self->_sharedLibraryStatusProvider, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPhotoLibrary:", v7);

  objc_msgSend(v8, "setSelectionLimit:", 0);
  objc_msgSend(v8, "_setSourceType:", 1);
  objc_msgSend(v8, "_setPeopleConfiguration:", v10);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v8);
  objc_msgSend(v9, "setDelegate:", self);
  -[PXSharedLibrarySuggestionsSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_addSectionWithConfigurationHandler:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  v5 = (id)objc_opt_new();
  v4[2](v4, v5);

  -[NSMutableArray addObject:](self->_sections, "addObject:", v5);
}

- (void)_updateSections
{
  uint64_t v3;
  char v4;
  _QWORD v5[4];
  char v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke;
  v8[3] = &unk_1E511D780;
  v8[4] = self;
  -[PXSharedLibrarySuggestionsSettingsViewController _addSectionWithConfigurationHandler:](self, "_addSectionWithConfigurationHandler:", v8);
  if (-[UISwitch isOn](self->_suggestionsEnabledSwitch, "isOn"))
  {
    if (-[UICollectionView numberOfSections](self->_peopleCollectionView, "numberOfSections") < 1
      || -[UICollectionView numberOfItemsInSection:](self->_peopleCollectionView, "numberOfItemsInSection:", 0) < 1)
    {
      v4 = 0;
    }
    else
    {
      v7[0] = v3;
      v7[1] = 3221225472;
      v7[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_3;
      v7[3] = &unk_1E511D780;
      v7[4] = self;
      -[PXSharedLibrarySuggestionsSettingsViewController _addSectionWithConfigurationHandler:](self, "_addSectionWithConfigurationHandler:", v7);
      v4 = 1;
    }
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_5;
    v5[3] = &__block_descriptor_33_e41_v16__0___PXSharedLibrarySettingsSection_8l;
    v6 = v4;
    -[PXSharedLibrarySuggestionsSettingsViewController _addSectionWithConfigurationHandler:](self, "_addSectionWithConfigurationHandler:", v5);
  }
}

- (void)_update
{
  -[PXSharedLibrarySuggestionsSettingsViewController _updateSections](self, "_updateSections");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updateCollectionViewCell:(id)a3 forRulePerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "minusButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  objc_msgSend(v7, "setRemoveTarget:", self);
  objc_msgSend(v7, "setRemoveAction:", sel_removePerson_);
  objc_msgSend(v6, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImagePerson:", v9);

  objc_msgSend(v6, "displayName");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v11);
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  UITableView *tableView;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setLayoutMarginsFollowReadableWidth:](self->_tableView, "setLayoutMarginsFollowReadableWidth:", 1);
  -[UITableView _setSectionContentInsetFollowsLayoutMargins:](self->_tableView, "_setSectionContentInsetFollowsLayoutMargins:", 1);
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DefaultCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CustomCell"));
  -[PXSharedLibrarySuggestionsSettingsViewController setView:](self, "setView:", self->_tableView);
}

- (void)viewDidLoad
{
  PXSharedLibraryRulePeopleDataManager *v3;
  PXSharedLibraryRulePeopleDataManager *peopleDataManager;
  UICollectionViewDiffableDataSource *peopleCollectionViewDataSource;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  -[PXSharedLibrarySuggestionsSettingsViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = -[PXSharedLibraryRulePeopleDataManager initWithSharedLibraryStatusProvider:]([PXSharedLibraryRulePeopleDataManager alloc], "initWithSharedLibraryStatusProvider:", self->_sharedLibraryStatusProvider);
  peopleDataManager = self->_peopleDataManager;
  self->_peopleDataManager = v3;

  -[PXSharedLibraryRulePeopleDataManager setDelegate:](self->_peopleDataManager, "setDelegate:", self);
  peopleCollectionViewDataSource = self->_peopleCollectionViewDataSource;
  -[PXSharedLibraryRulePeopleDataManager currentSnapshot](self->_peopleDataManager, "currentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](peopleCollectionViewDataSource, "applySnapshot:animatingDifferences:", v6, 0);

  -[PXSharedLibrarySuggestionsSettingsViewController _update](self, "_update");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PXSharedLibrarySuggestionsSettingsViewController *v6;
  PXSharedLibrarySuggestionsSettingsViewController *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibrarySuggestionsSettingsViewController;
  -[PXSharedLibrarySuggestionsSettingsViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[PXSharedLibrarySuggestionsSettingsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (PXSharedLibrarySuggestionsSettingsViewController *)objc_claimAutoreleasedReturnValue();
  if (v6 == self)
  {
    objc_msgSend(v4, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v4)
      goto LABEL_5;
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PXLocalizedStringFromTable(CFSTR("PXDone"), CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PXSharedLibrarySuggestionsSettingsViewController *)objc_msgSend(v10, "initWithTitle:style:target:action:", v5, 2, self, sel__handleDoneAction_);
    -[PXSharedLibrarySuggestionsSettingsViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v7);

  }
  else
  {
    v7 = v6;
  }

LABEL_5:
}

- (void)_handleDoneAction:(id)a3
{
  -[PXSharedLibrarySuggestionsSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "customView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("CustomCell");
  else
    v13 = CFSTR("DefaultCell");
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v14, "viewWithTag:", 999);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 != v12)
    {
      v43 = v15;
      objc_msgSend(v15, "removeFromSuperview");
      objc_msgSend(v12, "setTag:", 999);
      objc_msgSend(v14, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v12);

      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v14, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v38;
      objc_msgSend(v14, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v33;
      objc_msgSend(v14, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v18;
      objc_msgSend(v14, "contentView");
      v42 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activateConstraints:", v23);

      v6 = v42;
      v15 = v43;
    }

  }
  else
  {
    objc_msgSend(v14, "defaultContentConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", v25);

    objc_msgSend(v11, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v26);

    if (objc_msgSend(v11, "action"))
    {
      objc_msgSend(v6, "tintColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setColor:", v27);

    }
    objc_msgSend(v14, "setContentConfiguration:", v24);
    objc_msgSend(v11, "accessoryView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessoryView:", v29);

  }
  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "caption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "item");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v10, "refusesSelection") ^ 1;
  return (char)v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "refusesSelection"))
    v10 = 0;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PXSharedLibrarySuggestionsSettingsViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "action"))
  {
    objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendAction:to:from:forEvent:", objc_msgSend(v10, "action"), self, v11, 0);

  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXSharedLibrarySuggestionsSettingsViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PXSharedLibrarySuggestionsSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (void)sharedLibraryRulePeopleControllerDidChangeCurrentSnapshot:(id)a3
{
  UICollectionViewDiffableDataSource *peopleCollectionViewDataSource;
  id v5;
  void *v6;
  _BOOL4 v7;
  UICollectionViewDiffableDataSource *v8;
  void *v9;
  void *v10;

  peopleCollectionViewDataSource = self->_peopleCollectionViewDataSource;
  v5 = a3;
  -[UICollectionViewDiffableDataSource snapshot](peopleCollectionViewDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems") < 1;

  v8 = self->_peopleCollectionViewDataSource;
  objc_msgSend(v5, "currentSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v8, "applySnapshot:animatingDifferences:", v9, 1);
  -[UICollectionViewDiffableDataSource snapshot](self->_peopleCollectionViewDataSource, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v10, "numberOfItems") > 0;

  if (((v7 ^ v5) & 1) == 0)
    -[PXSharedLibrarySuggestionsSettingsViewController _update](self, "_update");
}

- (NSArray)sections
{
  return &self->_sections->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleDataManager, 0);
  objc_storeStrong((id *)&self->_peopleCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_peopleCollectionView, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
}

void __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  PXMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "sharedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke_3;
  v4[3] = &unk_1E5148B78;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addPersonUUIDsToPersonCondition:completion:", v2, v4);

}

void __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error adding person to Shared Library rule: %@", (uint8_t *)&v10, 0xCu);
    }

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionAddPeopleFailureAlertTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXPresentFailureWithLocalizedTitle(v7, v8, 0, v5, v9, 0);

  }
}

id __76__PXSharedLibrarySuggestionsSettingsViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(a2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidFromLocalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_2;
  v4[3] = &unk_1E511D758;
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = a2;
  objc_msgSend(v2, "addItemWithConfigurationHandler:", v4);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsToggle_Footer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaption:", v3);

}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsPeople_Title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_4;
  v5[3] = &unk_1E511D758;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addItemWithConfigurationHandler:", v5);

}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v4[4];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_6;
  v4[3] = &__block_descriptor_33_e38_v16__0___PXSharedLibrarySettingsItem_8l;
  v5 = *(_BYTE *)(a1 + 32);
  v2 = a2;
  objc_msgSend(v2, "addItemWithConfigurationHandler:", v4);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_ButtonFooter"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaption:", v3);

}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_6(uint64_t a1, void *a2)
{
  __CFString *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 32))
    v2 = CFSTR("PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_AddOthers");
  else
    v2 = CFSTR("PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_Add");
  v5 = a2;
  PXLocalizedSharedLibraryString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(v5, "setAction:", sel_addOtherPeople_);
}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000);
  v3 = a2;
  objc_msgSend(v3, "setCustomView:", v2);
  objc_msgSend(v3, "setRefusesSelection:", 1);

}

void __67__PXSharedLibrarySuggestionsSettingsViewController__updateSections__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsToggle_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_msgSend(v4, "setAccessoryView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(v4, "setRefusesSelection:", 1);

}

void __65__PXSharedLibrarySuggestionsSettingsViewController_removePerson___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error removing person from Shared Library rule: %@", (uint8_t *)&v10, 0xCu);
    }

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionRemovePeopleFailureAlertTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXPresentFailureWithLocalizedTitle(v7, v8, 0, v5, v9, 0);

  }
}

void __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_updateCollectionViewCell:forRulePerson:", v7, v6);

}

uint64_t __88__PXSharedLibrarySuggestionsSettingsViewController_initWithSharedLibraryStatusProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

@end
