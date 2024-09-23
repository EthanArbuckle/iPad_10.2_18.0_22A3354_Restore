@implementation PXPeoplePickerViewController

- (PXPeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 225, CFSTR("%s is not available as initializer"), "-[PXPeoplePickerViewController initWithNibName:bundle:]");

  abort();
}

- (PXPeoplePickerViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 229, CFSTR("%s is not available as initializer"), "-[PXPeoplePickerViewController initWithCoder:]");

  abort();
}

- (PXPeoplePickerViewController)initWithPersonIdentifiers:(id)a3 selectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 compactMode:(BOOL)a6 transparentBackground:(BOOL)a7 prompt:(id)a8 selectionCoordinator:(id)a9 library:(id)a10 wantsPets:(BOOL)a11
{
  _BOOL4 v13;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  PXPeoplePickerViewController *v26;
  PXPeoplePickerViewController *v27;
  uint64_t v28;
  void *personLocalIdentifiers;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PHFetchResult *people;
  UICollectionViewFlowLayout *v37;
  UICollectionViewFlowLayout *layout;
  uint64_t v39;
  NSArray *preselectedLocalIdentifiers;
  uint64_t v41;
  NSArray *disabledLocalIdentifiers;
  uint64_t v43;
  NSString *prompt;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v50;
  objc_class *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  id v56;
  void *v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;
  _QWORD aBlock[4];
  id v64;
  id location;
  _QWORD v66[2];
  _QWORD v67[5];

  v13 = a6;
  v67[3] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v59 = a5;
  v58 = a8;
  v56 = a9;
  v19 = a10;
  v57 = v19;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personLocalIdentifiers"));

    v19 = v57;
  }
  if (v18)
  {
    if (v19)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    if (v13)
      goto LABEL_6;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedLocalIdentifiers"));

  if (!v57)
    goto LABEL_8;
LABEL_5:
  if (v13)
  {
LABEL_6:
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke;
    aBlock[3] = &unk_1E513AF90;
    objc_copyWeak(&v64, &location);
    v20 = _Block_copy(aBlock);
    v21 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    objc_msgSend(v21, "setScrollDirection:", 1);
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:configuration:", v20, v21);

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
LABEL_9:
  v22 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v22, "setMinimumLineSpacing:", 25.0);
LABEL_10:
  v62.receiver = self;
  v62.super_class = (Class)PXPeoplePickerViewController;
  v26 = -[PXPeoplePickerViewController initWithCollectionViewLayout:](&v62, sel_initWithCollectionViewLayout_, v22);
  v27 = v26;
  if (v26)
  {
    v26->_compactMode = v13;
    v26->_transparentBackground = a7;
    if (objc_msgSend(v17, "count"))
    {
      v27->_dataType = 0;
      v28 = objc_msgSend(v17, "copy");
      personLocalIdentifiers = v27->_personLocalIdentifiers;
      v27->_personLocalIdentifiers = (NSArray *)v28;
    }
    else
    {
      objc_msgSend(v57, "librarySpecificFetchOptions");
      personLocalIdentifiers = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(personLocalIdentifiers, "setPersonContext:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v30;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v31;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(personLocalIdentifiers, "setSortDescriptors:", v33);

      if (a11)
      {
        objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(personLocalIdentifiers, "setIncludedDetectionTypes:", v34);

      }
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", personLocalIdentifiers);
      v35 = objc_claimAutoreleasedReturnValue();
      people = v27->_people;
      v27->_people = (PHFetchResult *)v35;

      v27->_dataType = 1;
    }

    if (v13)
      goto LABEL_20;
    v37 = (UICollectionViewFlowLayout *)v22;
    if (v37)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_19:
        layout = v27->_layout;
        v27->_layout = v37;

LABEL_20:
        v39 = objc_msgSend(v18, "copy");
        preselectedLocalIdentifiers = v27->_preselectedLocalIdentifiers;
        v27->_preselectedLocalIdentifiers = (NSArray *)v39;

        v41 = objc_msgSend(v59, "copy");
        disabledLocalIdentifiers = v27->_disabledLocalIdentifiers;
        v27->_disabledLocalIdentifiers = (NSArray *)v41;

        v43 = objc_msgSend(v58, "copy");
        prompt = v27->_prompt;
        v27->_prompt = (NSString *)v43;

        objc_storeStrong((id *)&v27->_selectionCoordinator, a9);
        objc_storeStrong((id *)&v27->_library, a10);
        -[PXPeoplePickerViewController collectionViewLayout](v27, "collectionViewLayout");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = objc_opt_class();
        v66[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke_2;
        v60[3] = &unk_1E513A9C0;
        v61 = v45;
        v47 = v45;
        v48 = (id)-[PXPeoplePickerViewController registerForTraitChanges:withHandler:](v27, "registerForTraitChanges:withHandler:", v46, v60);

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewFlowLayout px_descriptionForAssertionMessage](v37, "px_descriptionForAssertionMessage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("PXPeoplePickerViewController.m"), 285, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v52, v54);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("PXPeoplePickerViewController.m"), 285, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v52);
    }

    goto LABEL_19;
  }
LABEL_21:

  return v27;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  PXPeoplePickerViewController *v8;
  PXPeoplePickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *, uint64_t, uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PXPeoplePickerViewController;
  -[PXPeoplePickerViewController viewDidLoad](&v36, sel_viewDidLoad);
  PXLocalizedStringForPeoplePetsHomeTitle(-[PXPeoplePickerViewController _unverifiedPeopleVisibility](self, "_unverifiedPeopleVisibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController setTitle:](self, "setTitle:", v3);

  -[PXPeoplePickerViewController parentViewController](self, "parentViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[PXPeoplePickerViewController parentViewController](self, "parentViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    -[PXPeoplePickerViewController parentViewController](self, "parentViewController");
    v8 = (PXPeoplePickerViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = self;
  }
  v9 = v8;
  -[PXPeoplePickerViewController prompt](self, "prompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController navigationItem](v9, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrompt:", v10);

  -[PXPeoplePickerViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPeoplePickerViewController transparentBackground](self, "transparentBackground"))
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  v14 = -[PXPeoplePickerViewController transparentBackground](self, "transparentBackground");
  objc_msgSend(v12, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHitTestsAsOpaque:", v14);

  objc_msgSend(v12, "setAllowsSelection:", 1);
  -[PXPeoplePickerViewController selectionCoordinator](self, "selectionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsMultipleSelection:", v16 != 0);

  objc_msgSend(v12, "setDelegate:", self);
  if (-[PXPeoplePickerViewController compactMode](self, "compactMode"))
    -[UICollectionViewFlowLayout setScrollDirection:](self->_layout, "setScrollDirection:", 1);
  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E0DC35C8];
  v18 = objc_opt_class();
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __43__PXPeoplePickerViewController_viewDidLoad__block_invoke;
  v32[3] = &unk_1E513A9E8;
  objc_copyWeak(&v34, &location);
  v20 = v12;
  v33 = v20;
  objc_msgSend(v17, "registrationWithCellClass:configurationHandler:", v18, v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v27 = v19;
  v28 = 3221225472;
  v29 = __43__PXPeoplePickerViewController_viewDidLoad__block_invoke_2;
  v30 = &unk_1E513AA10;
  v23 = v21;
  v31 = v23;
  v24 = (void *)objc_msgSend(v22, "initWithCollectionView:cellProvider:", v20, &v27);
  -[PXPeoplePickerViewController setDataSource:](self, "setDataSource:", v24, v27, v28, v29, v30);

  -[PXPeoplePickerViewController _configureDataSourceManager](self, "_configureDataSourceManager");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__facesDidChange_, CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), v26);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char IsZero;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPeoplePickerViewController;
  -[PXPeoplePickerViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PXPeoplePickerViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[PXPeoplePickerViewController collectionViewSize](self, "collectionViewSize");
  if ((PXSizeApproximatelyEqualToSize() & 1) != 0)
    goto LABEL_4;
  -[PXPeoplePickerViewController collectionViewSize](self, "collectionViewSize");
  IsZero = PXPixelSizeAreaIsZero();

  if ((IsZero & 1) == 0)
  {
    -[PXPeoplePickerViewController collectionViewLayout](self, "collectionViewLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");
LABEL_4:

  }
  -[PXPeoplePickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[PXPeoplePickerViewController setCollectionViewSize:](self, "setCollectionViewSize:", v6, v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeoplePickerViewController;
  -[PXPeoplePickerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if ((-[PXPeoplePickerViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PXPeoplePickerViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[PXPeoplePickerViewController configControllerDelegate](self, "configControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerWillBePopped:", self);

  }
}

- (unint64_t)_unverifiedPeopleVisibility
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __int16 v7;

  -[PXPeoplePickerViewController library](self, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleSwiftUtilities fetchAddPeopleCandidatesIn:](PXPeopleSwiftUtilities, "fetchAddPeopleCandidatesIn:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  +[PXPeopleUtilities people:hasHumans:hasPets:](PXPeopleUtilities, "people:hasHumans:hasPets:", v3, (char *)&v7 + 1, &v7);
  v4 = 2;
  if (HIBYTE(v7))
    v4 = 3;
  if ((_BYTE)v7)
    v5 = v4;
  else
    v5 = 1;

  return v5;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _OWORD v9[4];

  v5 = a4;
  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  PXSimpleIndexPathFromIndexPath();

  memset(v9, 0, sizeof(v9));
  LODWORD(v6) = objc_msgSend(v7, "isItemDisabledAtIndexPath:", v9) ^ 1;

  return (char)v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPeoplePickerViewController _personAtIndexPath:](self, "_personAtIndexPath:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController _performAction:forPerson:](self, "_performAction:forPerson:", 0);
  -[PXPeoplePickerViewController selectionCoordinator](self, "selectionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_232443);

  }
  -[PXPeoplePickerViewController peoplePickerActionHandler](self, "peoplePickerActionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peoplePicker:didTapItem:", self, v8);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  -[PXPeoplePickerViewController _performAction:forPersonAtIndexPath:](self, "_performAction:forPersonAtIndexPath:", 1, a4);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  objc_msgSend(a3, "frame");
  -[PXPeoplePickerViewController _marginForLayoutWithCollectionViewSize:](self, "_marginForLayoutWithCollectionViewSize:", v6, v7);
  v9 = v8;
  v10 = v8;
  v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a3, "frame");
  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v6, v7);
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)deselectAllPeople
{
  id v2;

  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_241_232442);

}

- (id)_collectionViewLayoutSectionForEnvironment:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
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
  void *v22;
  double v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  v8 = v7;

  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v6, v8);
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3370];
  v16 = (void *)MEMORY[0x1E0DC3340];
  objc_msgSend(v11, "dimension");
  objc_msgSend(v16, "absoluteDimension:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithWidthDimension:heightDimension:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DC3350];
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "horizontalGroupWithLayoutSize:subitems:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInterGroupSpacing:", 25.0);
  -[PXPeoplePickerViewController _marginForLayoutWithCollectionViewSize:](self, "_marginForLayoutWithCollectionViewSize:", v6, v8);
  objc_msgSend(v22, "setContentInsets:", v23, v23, v23, v23);

  return v22;
}

- (CGSize)_sizeForItemWithCollectionViewSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[PXPeoplePickerViewController compactMode](self, "compactMode"))
  {
    +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"), width);
    v6 = height + v5 * -2.0;
    v7 = v6;
  }
  else
  {
    +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"), width);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)_marginForLayoutWithCollectionViewSize:(CGSize)a3
{
  double result;

  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3.width, a3.height), a3.width);
  return result;
}

- (void)_configureCellForCollectionView:(id)a3 cell:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
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
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  PXPeopleFaceCropFetchOptions *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v11);
  -[PXPeoplePickerViewController _personAtIndexPath:](self, "_personAtIndexPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "px_localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  if (-[PXPeoplePickerViewController transparentBackground](self, "transparentBackground"))
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  objc_msgSend(v8, "setFavorite:", objc_msgSend(v12, "type") == 1);
  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "localIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allSelectedLocalIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", objc_msgSend(v20, "containsObject:", v19));

  objc_msgSend(v18, "disabledLocalIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisabled:", objc_msgSend(v21, "containsObject:", v19));

  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_msgSend(v12, "px_localizedName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
    objc_msgSend(v12, "px_localizedName");
  else
    PXLocalizedStringForPersonOrPetAndVisibility(v12, 0, CFSTR("PXPeoplePickerUnkownPersonAccessibilityLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v24);

  if (objc_msgSend(v8, "isSelected"))
  {
    v25 = objc_msgSend(v8, "accessibilityTraits");
    v26 = *MEMORY[0x1E0DC46B0] | v25;
  }
  else
  {
    v27 = *MEMORY[0x1E0DC46B0];
    v26 = objc_msgSend(v8, "accessibilityTraits") & ~v27;
  }
  objc_msgSend(v8, "setAccessibilityTraits:", v26);
  objc_msgSend(v10, "px_screenScale");
  v29 = v28;
  objc_msgSend(v10, "frame");
  v31 = v30;
  v33 = v32;

  -[PXPeoplePickerViewController _sizeForItemWithCollectionViewSize:](self, "_sizeForItemWithCollectionViewSize:", v31, v33);
  v36 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, v34, v35, v29);
  -[PXPeopleFaceCropFetchOptions setUseLowMemoryMode:](v36, "setUseLowMemoryMode:", 1);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke;
  v39[3] = &unk_1E5146170;
  v40 = v8;
  v41 = v11;
  v38 = v8;
  objc_msgSend(v37, "requestFaceCropForOptions:resultHandler:", v36, v39);

}

- (void)_configureDataSourceManager
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  id *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[4];
  id v24;

  +[PXPeoplePickerDataSourceManager currentDataSourceManager](PXPeoplePickerDataSourceManager, "currentDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController people](self, "people");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController personLocalIdentifiers](self, "personLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPeoplePickerViewController dataType](self, "dataType");
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 525, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("people == nil"));

      if (v6)
        goto LABEL_8;
    }
    else if (v6)
    {
LABEL_8:
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_2;
      v21[3] = &unk_1E513AAC8;
      v9 = (id *)v22;
      v22[0] = v6;
      v22[1] = self;
      v10 = v21;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 526, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localIdentifiers != nil"));

    goto LABEL_8;
  }
  if (v7 == 1)
  {
    if (v5)
    {
      if (!v6)
      {
LABEL_5:
        v23[0] = v8;
        v23[1] = 3221225472;
        v23[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke;
        v23[3] = &unk_1E513AAA0;
        v9 = &v24;
        v24 = v5;
        v10 = v23;
LABEL_9:
        objc_msgSend(v4, "performChanges:", v10);

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("people != nil"));

      if (!v6)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localIdentifiers == nil"));

    goto LABEL_5;
  }
LABEL_10:
  -[PXPeoplePickerViewController preselectedLocalIdentifiers](self, "preselectedLocalIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController disabledLocalIdentifiers](self, "disabledLocalIdentifiers");
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_3;
  v18[3] = &unk_1E513AAC8;
  v19 = v11;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  v13 = v11;
  objc_msgSend(v4, "performChanges:", v18);
  objc_msgSend(v4, "registerChangeObserver:context:", self, PXPeopleDataSourceManagerObservationContext);
  -[PXPeoplePickerViewController setPersonDataSourceManager:](self, "setPersonDataSourceManager:", v4);
  -[PXPeoplePickerViewController _updatePersonDataSource](self, "_updatePersonDataSource");

}

- (id)_personAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];

  v4 = a3;
  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "identifier");
  v8 = objc_msgSend(v4, "section");
  v9 = objc_msgSend(v4, "item");

  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "personAtItemIndexPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_performAction:(int64_t)a3 forPersonAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];

  v6 = a4;
  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "identifier");
  v10 = objc_msgSend(v6, "item");

  v12[0] = v9;
  v12[1] = 0;
  v12[2] = v10;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v8, "personAtItemIndexPath:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerViewController _performAction:forPerson:](self, "_performAction:forPerson:", a3, v11);

}

- (void)_performAction:(int64_t)a3 forPerson:(id)a4
{
  id v6;
  void *v7;
  id *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  v6 = a4;
  if (a3 == 1)
  {
    -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke_2;
    v13 = &unk_1E513AAA0;
    v8 = &v14;
    v14 = v6;
    v9 = &v10;
    goto LABEL_5;
  }
  if (!a3)
  {
    -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke;
    v18 = &unk_1E513AAA0;
    v8 = &v19;
    v19 = v6;
    v9 = &v15;
LABEL_5:
    objc_msgSend(v7, "performChanges:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)_facesDidChange:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD block[5];
  id v14;

  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 582, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[notification.userInfo objectForKey:PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey]"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerViewController.m"), 582, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[notification.userInfo objectForKey:PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey]"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXPeoplePickerViewController__facesDidChange___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v14 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_updatePersonDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _OWORD v37[3];

  -[PXPeoplePickerViewController personDataSourceManager](self, "personDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "allSelectedLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
    objc_msgSend(v4, "firstItemIndexPath");
  else
    memset(v37, 0, 32);
  v10 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke;
  v32[3] = &unk_1E513AAF8;
  v33 = v4;
  v34 = v9;
  v35 = v7;
  v11 = v8;
  v36 = v11;
  v12 = v7;
  v13 = v9;
  v14 = v4;
  objc_msgSend(v14, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v37, 0, v32);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v15, "appendSectionsWithIdentifiers:", &unk_1E53EA9F8);
  objc_msgSend(v15, "appendItemsWithIdentifiers:", v13);
  -[PXPeoplePickerViewController setSnapshot:](self, "setSnapshot:", v15);
  -[PXPeoplePickerViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applySnapshot:animatingDifferences:", v15, 1);

  -[PXPeoplePickerViewController selectionCoordinator](self, "selectionCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "newlyDeselectedObjectIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "newlySelectedObjectIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "modifySelectionWithRemovedOIDs:insertedOIDs:", v18, v19);

  -[PXPeoplePickerViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indexPathsForSelectedItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_2;
  v29[3] = &unk_1E513AB20;
  v30 = v11;
  v22 = v20;
  v31 = v22;
  v23 = v11;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v29);
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_3;
  v26[3] = &unk_1E513AB48;
  v27 = v21;
  v28 = v22;
  v24 = v22;
  v25 = v21;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v26);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXPeopleDataSourceManagerObservationContext == a5)
    -[PXPeoplePickerViewController _updatePersonDataSource](self, "_updatePersonDataSource", a3);
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (PXPeoplePickerViewControllerActionHandler)peoplePickerActionHandler
{
  return (PXPeoplePickerViewControllerActionHandler *)objc_loadWeakRetained((id *)&self->_peoplePickerActionHandler);
}

- (void)setPeoplePickerActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_peoplePickerActionHandler, a3);
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  return (PXPeoplePickerConfigurationControllerDelegate *)objc_loadWeakRetained((id *)&self->_configControllerDelegate);
}

- (void)setConfigControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configControllerDelegate, a3);
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXPeoplePickerDataSourceManager)personDataSourceManager
{
  return self->_personDataSourceManager;
}

- (void)setPersonDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_personDataSourceManager, a3);
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (NSArray)preselectedLocalIdentifiers
{
  return self->_preselectedLocalIdentifiers;
}

- (NSArray)disabledLocalIdentifiers
{
  return self->_disabledLocalIdentifiers;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CGSize)collectionViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collectionViewSize.width;
  height = self->_collectionViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCollectionViewSize:(CGSize)a3
{
  self->_collectionViewSize = a3;
}

- (BOOL)compactMode
{
  return self->_compactMode;
}

- (BOOL)transparentBackground
{
  return self->_transparentBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_disabledLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_preselectedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_personDataSourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_destroyWeak((id *)&self->_peoplePickerActionHandler);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  objc_msgSend(v4, "personAtItemIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

  }
}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deselectItemAtIndexPath:animated:", v3, 0);

}

void __55__PXPeoplePickerViewController__updatePersonDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "selectItemAtIndexPath:animated:scrollPosition:", v3, 0, 0);

}

void __48__PXPeoplePickerViewController__facesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "itemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intersectSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadItemsWithIdentifiers:", v5);

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v7, 1);

}

void __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalIdentifiers:selected:", v5, 1);

}

void __57__PXPeoplePickerViewController__performAction_forPerson___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalIdentifiers:selected:", v5, 0);

}

uint64_t __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPeople:", *(_QWORD *)(a1 + 32));
}

void __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedLocalIdentifiers:withPhotoLibrary:", v2, v5);

}

void __59__PXPeoplePickerViewController__configureDataSourceManager__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v3, "setLocalIdentifiers:selected:", *(_QWORD *)(a1 + 32), 1);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v3, "setDisabledLocalIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v12 = v5;
  v11 = *(id *)(a1 + 32);
  v8 = v5;
  px_dispatch_on_main_queue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeoplePickerViewController: error requesting face crop: %@", buf, 0xCu);
    }

  }
}

void __79__PXPeoplePickerViewController__configureCellForCollectionView_cell_indexPath___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(double *)(a1 + 56);
    v3 = *(double *)(a1 + 64);
    v4 = *(double *)(a1 + 72);
    v5 = *(double *)(a1 + 80);
    objc_msgSend(v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsRect:", v2, v3, v4, v5);

    objc_msgSend(v7, "setImage:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __49__PXPeoplePickerViewController_deselectAllPeople__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAllLocalIdentifiers");
}

uint64_t __72__PXPeoplePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAllLocalIdentifiers");
}

void __43__PXPeoplePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureCellForCollectionView:cell:indexPath:", *(_QWORD *)(a1 + 32), v7, v6);

}

uint64_t __43__PXPeoplePickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

id __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_collectionViewLayoutSectionForEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __188__PXPeoplePickerViewController_initWithPersonIdentifiers_selectedLocalIdentifiers_disabledLocalIdentifiers_compactMode_transparentBackground_prompt_selectionCoordinator_library_wantsPets___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
}

@end
