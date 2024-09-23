@implementation UIPrintPreviewViewController

- (UIPrintPreviewViewController)initWithScrollDirection:(int64_t)a3 printPanelViewController:(id)a4
{
  id v6;
  UIPrintPreviewViewController *v7;
  UIPrintPreviewViewController *v8;
  void *v9;
  uint64_t v10;
  UIPrintInfo *printInfo;
  UIPrintSheetController *v12;
  void *v13;
  void *v14;
  UIPrintSheetController *v15;
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
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, uint64_t);
  void *v43;
  id v44;
  id location;
  objc_super v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v46.receiver = self;
  v46.super_class = (Class)UIPrintPreviewViewController;
  v7 = -[UIPrintPreviewViewController init](&v46, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_printPanelViewController, v6);
    objc_msgSend(v6, "printInteractionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_printInteractionController, v9);

    v8->_previewScrollDirection = a3;
    objc_msgSend(v6, "printInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    printInfo = v8->_printInfo;
    v8->_printInfo = (UIPrintInfo *)v10;

    -[UIPrintPreviewViewController setPreviewLayoutType:](v8, "setPreviewLayoutType:", 0);
    v12 = [UIPrintSheetController alloc];
    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController printInteractionController](v8, "printInteractionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIPrintSheetController initWithPrintInfo:printPageImageDelegate:](v12, "initWithPrintInfo:printPageImageDelegate:", v13, v14);
    -[UIPrintPreviewViewController setPrintSheetController:](v8, "setPrintSheetController:", v15);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98758, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98678, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98778, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98638, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98798, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v8, 0x1E9D986D8, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98898, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v8, 0x1E9D988F8, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98918, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98938, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98958, 0, 0);

    -[UIPrintPreviewViewController printInfo](v8, "printInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:forKeyPath:options:context:", v8, 0x1E9D98618, 0, 0);

    v28 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[UIPrintPreviewViewController setCachedThumbnailImages:](v8, "setCachedThumbnailImages:", v28);

    -[UIPrintPreviewViewController cachedThumbnailImages](v8, "cachedThumbnailImages");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setEvictsObjectsWhenApplicationEntersBackground:", 0);

    objc_initWeak(&location, v8);
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __81__UIPrintPreviewViewController_initWithScrollDirection_printPanelViewController___block_invoke;
    v43 = &unk_1E9D975C8;
    objc_copyWeak(&v44, &location);
    v30 = (void *)objc_msgSend(&v40, "copy");
    -[UIPrintPreviewViewController setThumnailImageCompletionHandler:](v8, "setThumnailImageCompletionHandler:", v30, v40, v41, v42, v43);

    v31 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[UIPrintPreviewViewController setThumbnailOperationsQueue:](v8, "setThumbnailOperationsQueue:", v31);

    -[UIPrintPreviewViewController thumbnailOperationsQueue](v8, "thumbnailOperationsQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMaxConcurrentOperationCount:", 1);

    -[UIPrintPreviewViewController thumbnailOperationsQueue](v8, "thumbnailOperationsQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setName:", CFSTR("com.apple.UIKit.UIPrintPreviewViewController.thumbnailOperationsQueue"));

    -[UIPrintPreviewViewController printInteractionController](v8, "printInteractionController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v34, "usingWebKitFormatter");

    if ((_DWORD)v15)
    {
      -[UIPrintPreviewViewController printSheetController](v8, "printSheetController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "recalculateWebKitPageCount");

    }
    else
    {
      -[UIPrintPreviewViewController resetAllPages](v8, "resetAllPages");
    }
    objc_opt_self();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v37, sel_traitCollectionDidChange_previousTraitCollection_);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setTraitPreferredContentSizeChangeRegistration:](v8, "setTraitPreferredContentSizeChangeRegistration:", v38);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __81__UIPrintPreviewViewController_initWithScrollDirection_printPanelViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cachedThumbnailImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  objc_msgSend(WeakRetained, "cachedThumbnailImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v8);
  else
    objc_msgSend(v7, "removeObjectForKey:", v8);

  objc_sync_exit(v6);
}

- (void)dealloc
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98758);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D98678);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D98778);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, 0x1E9D98638);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, 0x1E9D98798);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forKeyPath:", self, 0x1E9D986D8);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:forKeyPath:", self, 0x1E9D98898);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:", self, 0x1E9D988F8);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:forKeyPath:", self, 0x1E9D98918);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:forKeyPath:", self, 0x1E9D98938);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:forKeyPath:", self, 0x1E9D98958);

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:forKeyPath:", self, 0x1E9D98618);

  -[UIPrintPreviewViewController thumbnailOperationsQueue](self, "thumbnailOperationsQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelAllOperations");

  -[UIPrintPreviewViewController traitPreferredContentSizeChangeRegistration](self, "traitPreferredContentSizeChangeRegistration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v16);

  v17.receiver = self;
  v17.super_class = (Class)UIPrintPreviewViewController;
  -[UIPrintPreviewViewController dealloc](&v17, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  _QWORD v8[4];
  id v9;
  UIPrintPreviewViewController *v10;
  _QWORD block[5];

  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", 0x1E9D98758))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v8[3] = &unk_1E9D96E78;
    v9 = v7;
    v10 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePageRange:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "updateLayoutControl");
}

uint64_t __79__UIPrintPreviewViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  void *v3;
  int v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98678) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98778) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98638) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98798) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986D8))
  {
    return objc_msgSend(*(id *)(a1 + 40), "resetAllPages");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D98898))
  {
    objc_msgSend(*(id *)(a1 + 40), "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "nUpActive");

    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "setPreviewLayoutType:", 1);
    objc_msgSend(*(id *)(a1 + 40), "updateLayoutControl");
  }
  return objc_msgSend(*(id *)(a1 + 40), "resetPrintPreview");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintPreviewViewController;
  -[UIPrintPreviewViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[UIPrintPreviewViewController setupCollectionView](self, "setupCollectionView");
  -[UIPrintPreviewViewController setupLayoutControl](self, "setupLayoutControl");
}

- (void)viewDidLayoutSubviews
{
  -[UIPrintPreviewViewController updatePreviewSize](self, "updatePreviewSize");
  -[UIPrintPreviewViewController updateHeaderFooters](self, "updateHeaderFooters");
}

- (void)setupCollectionView
{
  void *v3;
  UIPrintPreviewFlowLayout *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIPrintPreviewFlowLayout *v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(UIPrintPreviewFlowLayout);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 8.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", 8.0);
    -[UICollectionViewFlowLayout setScrollDirection:](v4, "setScrollDirection:", -[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection"));
    v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[UIPrintPreviewViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    -[UIPrintPreviewViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v48 = v4;
    v10 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, 0.0, 0.0, v8);
    -[UIPrintPreviewViewController setCollectionView:](self, "setCollectionView:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataSource:", self);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPrefetchingEnabled:", 1);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPrefetchDataSource:", self);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIPrintPreviewPageCell"));

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIPrintPreviewViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setCollectionViewTopConstraint:](self, "setCollectionViewTopConstraint:", v25);

    -[UIPrintPreviewViewController collectionViewTopConstraint](self, "collectionViewTopConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v47;
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v42;
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v28;
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPrintPreviewViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addConstraints:", v34);

    -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "printInteractionController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v37, "preventPDFCreation");

    if ((v27 & 1) == 0)
    {
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel_handlePinch_);
      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addGestureRecognizer:", v38);

    }
  }
}

- (void)setupLayoutControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIndicator:", 2);
    objc_msgSend(v4, "setTitleLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setLayoutPopupButton:](self, "setLayoutPopupButton:", v5);

    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Page View"), CFSTR("Page View"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke;
    v53[3] = &unk_1E9D975F0;
    objc_copyWeak(&v54, &location);
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v53);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setPagesPopupAction:](self, "setPagesPopupAction:", v10);

    v11 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Sheet View"), CFSTR("Sheet View"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v9;
    v51[1] = 3221225472;
    v51[2] = __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke_2;
    v51[3] = &unk_1E9D975F0;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v51);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setSheetsPopupAction:](self, "setSheetsPopupAction:", v14);

    v15 = (void *)MEMORY[0x1E0DC39D0];
    -[UIPrintPreviewViewController pagesPopupAction](self, "pagesPopupAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v16;
    -[UIPrintPreviewViewController sheetsPopupAction](self, "sheetsPopupAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "menuWithTitle:children:", &stru_1E9D97C98, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMenu:", v19);

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShowsMenuAsPrimaryAction:", 1);

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setChangesSelectionAsPrimaryAction:", 1);

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTintColor:", v24);

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 1);

    -[UIPrintPreviewViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v28);

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController headerHeight](self, "headerHeight");
    v34 = v33;
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, (v34 - v36) * 0.5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setLayoutPopupButtonTopConstraint:](self, "setLayoutPopupButtonTopConstraint:", v37);

    -[UIPrintPreviewViewController layoutPopupButtonTopConstraint](self, "layoutPopupButtonTopConstraint");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIPrintPreviewViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addConstraint:", v44);

    -[UIPrintPreviewViewController view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addConstraint:", v50);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);

  }
}

void __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutPopupButtonChanged:", 0);

}

void __50__UIPrintPreviewViewController_setupLayoutControl__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutPopupButtonChanged:", 1);

}

- (void)updateLayoutControl
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 == 1)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeValue");
    v11 = v10;

    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != objc_msgSend(v6, "pageCount");
  }
  else
  {
    v12 = (unint64_t)objc_msgSend(v7, "count") > 1;

  }
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "nUpActive");

  if ((v14 & 1) != 0)
    v15 = 1;
  else
    v15 = -[UIPrintPreviewViewController showPageRange](self, "showPageRange") && v12;
  -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15 ^ 1u);

  if ((v15 & 1) != 0)
  {
    v17 = -[UIPrintPreviewViewController showingPageView](self, "showingPageView");
    -[UIPrintPreviewViewController pagesPopupAction](self, "pagesPopupAction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setState:", v17);

    v19 = -[UIPrintPreviewViewController showingPageView](self, "showingPageView") ^ 1;
    -[UIPrintPreviewViewController sheetsPopupAction](self, "sheetsPopupAction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setState:", v19);

    v21 = (void *)MEMORY[0x1E0DC39D0];
    -[UIPrintPreviewViewController pagesPopupAction](self, "pagesPopupAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v22;
    -[UIPrintPreviewViewController sheetsPopupAction](self, "sheetsPopupAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuWithTitle:children:", &stru_1E9D97C98, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMenu:", v25);

  }
  else
  {
    -[UIPrintPreviewViewController setPreviewLayoutType:](self, "setPreviewLayoutType:", 0);
  }
  if (-[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection") == 1)
  {
    -[UIPrintPreviewViewController layoutPopupButtonTopConstraint](self, "layoutPopupButtonTopConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setConstant:", 8.0);
  }
  else
  {
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "collectionViewLayout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0.0;
    if ((v15 & 1) == 0)
    {
      -[UIPrintPreviewViewController headerHeight](self, "headerHeight");
      v29 = v30;
    }
    objc_msgSend(v27, "setHeaderReferenceSize:", 16.0, v29);
    -[UIPrintPreviewViewController headerHeight](self, "headerHeight");
    v32 = v31;
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = (v32 - v34) * 0.5;
    -[UIPrintPreviewViewController layoutPopupButtonTopConstraint](self, "layoutPopupButtonTopConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConstant:", v35);

  }
  v37 = 0.0;
  if (v15)
  {
    -[UIPrintPreviewViewController headerHeight](self, "headerHeight");
    v37 = v38;
  }
  -[UIPrintPreviewViewController collectionViewTopConstraint](self, "collectionViewTopConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setConstant:", v37);

}

- (void)layoutPopupButtonChanged:(int64_t)a3
{
  if (-[UIPrintPreviewViewController previewLayoutType](self, "previewLayoutType") != a3)
  {
    -[UIPrintPreviewViewController setPreviewLayoutType:](self, "setPreviewLayoutType:", a3);
    -[UIPrintPreviewViewController resetPrintPreview](self, "resetPrintPreview");
  }
}

- (void)resetAllPages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  UIPrintPreviewViewController *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[UIPrintPreviewViewController thumbnailOperationsQueue](self, "thumbnailOperationsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__UIPrintPreviewViewController_resetAllPages__block_invoke;
  v16[3] = &unk_1E9D97150;
  objc_copyWeak(&v17, &location);
  v5 = (void *)MEMORY[0x1D82A9A48](v16);
  v10 = v4;
  v11 = 3221225472;
  v12 = __45__UIPrintPreviewViewController_resetAllPages__block_invoke_2;
  v13 = &unk_1E9D97178;
  objc_copyWeak(&v15, &location);
  v14 = self;
  v6 = (void *)MEMORY[0x1D82A9A48](&v10);
  -[UIPrintPreviewViewController printInteractionController](self, "printInteractionController", v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usingWebKitFormatter");

  if (v8)
  {
    -[UIPrintPreviewViewController setShowWebKitGeneratingPreviewProgress:](self, "setShowWebKitGeneratingPreviewProgress:", 1);
    -[UIPrintPreviewViewController performSelector:withObject:](self, "performSelector:withObject:", sel_showWebkitGeneratingPreviewProgress, 0);
    -[UIPrintPreviewViewController printSheetController](self, "printSheetController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateWebKitThumbnailsWithCompletionBlock:", v6);

  }
  else
  {
    -[UIPrintPreviewViewController performThumbnailDispatchBlock:](self, "performThumbnailDispatchBlock:", v5);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "printPanelViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updatePageCount");

  objc_msgSend(WeakRetained, "printSheetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearPagesCache");

  objc_msgSend(WeakRetained, "resetPrintPreview");
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id WeakRetained;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setShowWebKitGeneratingPreviewProgress:", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__UIPrintPreviewViewController_resetAllPages__block_invoke_3;
    block[3] = &unk_1E9D96D90;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(WeakRetained, "resetPrintPreview");

  }
}

void __45__UIPrintPreviewViewController_resetAllPages__block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "webKitGeneratingPreviewProgressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "progressPresentationTime");
    v7 = v5 - v6;
    v8 = *(void **)(a1 + 32);
    if (v7 >= 1.0)
      objc_msgSend(v8, "hideWebkitGeneratingPreviewProgress");
    else
      objc_msgSend(v8, "performSelector:withObject:afterDelay:", sel_hideWebkitGeneratingPreviewProgress, 0, 1.0 - v7);
  }
}

- (void)resetPrintPreview
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__UIPrintPreviewViewController_resetPrintPreview__block_invoke;
  v2[3] = &unk_1E9D97150;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__UIPrintPreviewViewController_resetPrintPreview__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cachedThumbnailImages");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v1);
  objc_msgSend(WeakRetained, "cachedThumbnailImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(v1);
  objc_msgSend(WeakRetained, "printSheetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setNumberOfSheets:", objc_msgSend(v3, "numberOfSheets:", objc_msgSend(WeakRetained, "showingPageView")));

  objc_msgSend(WeakRetained, "updatePreviewSize");
  objc_msgSend(WeakRetained, "updateHeaderFooters");
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  objc_msgSend(WeakRetained, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)setScrollDirection:(int64_t)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  -[UIPrintPreviewViewController setPreviewScrollDirection:](self, "setPreviewScrollDirection:");
  -[UIPrintPreviewViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v13, "scrollDirection") == a3;
  v7 = v13;
  if (!v6)
  {
    objc_msgSend(v13, "setScrollDirection:", a3);
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3 == 1)
    {
      objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 1);

      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);

      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
    }
    objc_msgSend(v10, "setShowsVerticalScrollIndicator:", v12);

    v7 = v13;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPrintPreviewViewController;
  -[UIPrintPreviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[UIPrintPreviewViewController resetPrintPreview](self, "resetPrintPreview");
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "preferredContentSizeCategory", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[UIPrintPreviewViewController resetPrintPreview](self, "resetPrintPreview");
}

- (CGSize)maxThumbnailSize
{
  double v3;
  double v4;
  int64_t v5;
  double v6;
  double v7;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v5 = -[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection");
  -[UIPrintPreviewViewController previewSize](self, "previewSize");
  if (v5)
    v6 = v3;
  else
    v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)thumbnailSizeForSheetNum:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UIPrintPreviewViewController printSheetController](self, "printSheetController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeForSheetNum:showingPageView:", a3, -[UIPrintPreviewViewController showingPageView](self, "showingPageView"));
  v9 = v8;
  v11 = v10;

  -[UIPrintPreviewViewController maxThumbnailSize](self, "maxThumbnailSize");
  if (v11 > 0.0 && v9 > 0.0)
  {
    v14 = v9 / v11;
    if (v12 == 0.0)
    {
      v5 = v14 * v13;
      v6 = v13;
    }
    else
    {
      v5 = v12;
      v6 = v12 / v14;
    }
  }
  v15 = v5;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)headerHeight
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  if (-[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection") == 1)
  {
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
    if ((objc_msgSend(v3, "isHidden") & 1) == 0)
    {
      -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "frame");
      v4 = v6;

    }
  }
  else
  {
    -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "printOptionsNavController");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v4 = v10;

    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v11, "isHidden");

    if ((v8 & 1) == 0)
    {
      -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

      if (v4 < v14)
        return v14;
    }
  }
  return v4;
}

- (void)updateHeaderFooters
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  -[UIPrintPreviewViewController updateLayoutControl](self, "updateLayoutControl");
  v3 = (double *)MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection"))
  {
    -[UIPrintPreviewViewController previewSize](self, "previewSize");
    v6 = v5;
    -[UIPrintPreviewViewController thumbnailSizeForSheetNum:](self, "thumbnailSizeForSheetNum:", 1);
    v8 = (v6 - v7) * 0.5;
    if (v8 >= 0.0)
      v9 = v8;
    else
      v9 = 0.0;
    -[UIPrintPreviewViewController thumbnailSizeForSheetNum:](self, "thumbnailSizeForSheetNum:", -[UIPrintPreviewViewController numberOfSheets](self, "numberOfSheets"));
    v11 = (v6 - v10) * 0.5;
    if (v11 >= 0.0)
      v12 = v11;
    else
      v12 = 0.0;
    v13 = v4;
  }
  else
  {
    -[UIPrintPreviewViewController layoutPopupButton](self, "layoutPopupButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0.0;
    if (objc_msgSend(v14, "isHidden"))
    {
      -[UIPrintPreviewViewController headerHeight](self, "headerHeight");
      v13 = v15;
    }
    v12 = *v3;

    v9 = v12;
  }
  -[UIPrintPreviewViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionViewLayout");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setHeaderReferenceSize:", v9, v13);
  objc_msgSend(v17, "setFooterReferenceSize:", v12, v4);

}

- (void)updatePreviewSize
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = -[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection");
  -[UIPrintPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  if (v3 == 1)
  {
    v6 = v5 + -16.0;
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8 + -32.0;
  }
  else
  {
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v10 + -16.0 + -48.0;
  }

  v11 = v6 + -32.0;
  -[UIPrintPreviewViewController previewSize](self, "previewSize");
  if (vabdd_f64(v12, v11) > 3.0
    || (-[UIPrintPreviewViewController previewSize](self, "previewSize"), vabdd_f64(v13, v9) > 3.0))
  {
    -[UIPrintPreviewViewController setPreviewSize:](self, "setPreviewSize:", v11, v9);
    -[UIPrintPreviewViewController resetPrintPreview](self, "resetPrintPreview");
  }
}

- (void)updatePageRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController printSheetController](self, "printSheetController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSelectionPageMap");

  -[UIPrintPreviewViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

  if (-[UIPrintPreviewViewController showingPageView](self, "showingPageView"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[UIPrintPreviewViewController collectionView](self, "collectionView", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preparedCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "setInRange:animated:", -[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "pageIndex")), 1);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[UIPrintPreviewViewController resetPrintPreview](self, "resetPrintPreview");
  }
}

- (BOOL)showingPageView
{
  return -[UIPrintPreviewViewController previewLayoutType](self, "previewLayoutType") == 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item");
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIPrintPreviewPageCell"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrintPreviewDelegate:", self);
  -[UIPrintPreviewViewController cachedThumbnailImages](self, "cachedThumbnailImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[UIPrintPreviewViewController cachedThumbnailImages](self, "cachedThumbnailImages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v10);
  v14 = -[UIPrintPreviewViewController numberOfSheets](self, "numberOfSheets");
  LODWORD(v11) = -[UIPrintPreviewViewController showPageRange](self, "showPageRange");
  v15 = -[UIPrintPreviewViewController showingPageView](self, "showingPageView") & v11;
  objc_msgSend(v9, "addPageLabelAndImageView:", v15);
  v16 = (v15 & 1) == 0
     || -[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", objc_msgSend(v7, "row"));
  objc_msgSend(v9, "setInRange:animated:", v16, 0);
  -[UIPrintPreviewViewController thumbnailSizeForSheetNum:](self, "thumbnailSizeForSheetNum:", v8 + 1);
  objc_msgSend(v9, "setThumbnailSize:");
  objc_msgSend(v9, "setThumbnailImage:", v13);
  objc_msgSend(v9, "setPageCount:", v14);
  objc_msgSend(v9, "setPageIndex:", v8);
  if (!v13)
  {
    -[UIPrintPreviewViewController thumnailImageCompletionHandler](self, "thumnailImageCompletionHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController fetchThumnailImageInBackground:previewPageCell:completion:](self, "fetchThumnailImageInBackground:previewPageCell:completion:", v8, v9, v17);

  }
  return v9;
}

- (void)fetchThumnailImageInBackground:(int64_t)a3 previewPageCell:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke;
  v13[3] = &unk_1E9D97618;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v10 = v9;
  v15 = v10;
  v11 = v8;
  v14 = v11;
  v12 = (void *)MEMORY[0x1D82A9A48](v13);
  -[UIPrintPreviewViewController performThumbnailDispatchBlock:](self, "performThumbnailDispatchBlock:", v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "printSheetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForSheetNum:showingPageView:", *(_QWORD *)(a1 + 56) + 1, objc_msgSend(WeakRetained, "showingPageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *, _QWORD, BOOL))(v5 + 16))(v5, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32) == 0);
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke_2;
    v6[3] = &unk_1E9D96E78;
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __90__UIPrintPreviewViewController_fetchThumnailImageInBackground_previewPageCell_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[UIPrintPreviewViewController cachedThumbnailImages](self, "cachedThumbnailImages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "item"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = objc_msgSend(v10, "item");
          -[UIPrintPreviewViewController thumnailImageCompletionHandler](self, "thumnailImageCompletionHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintPreviewViewController fetchThumnailImageInBackground:previewPageCell:completion:](self, "fetchThumnailImageInBackground:previewPageCell:completion:", v14, 0, v15);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UIPrintPreviewViewController thumbnailSizeForSheetNum:](self, "thumbnailSizeForSheetNum:", objc_msgSend(a5, "item", a3, a4) + 1);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 16.0;
  v6 = 16.0;
  v7 = 16.0;
  v8 = 16.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)showPageRange
{
  void *v2;
  char v3;

  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowPageRange");

  return v3;
}

- (BOOL)canModifyPageRange
{
  return 1;
}

- (void)pageBadgeTapped:(int64_t)a3
{
  if (-[UIPrintPreviewViewController canRemovePage:forPageIndex:](self, "canRemovePage:forPageIndex:", self, a3))
  {
    -[UIPrintPreviewViewController removePage:forPageIndex:](self, "removePage:forPageIndex:", self, a3);
  }
  else if (-[UIPrintPreviewViewController canAddPage:forPageIndex:](self, "canAddPage:forPageIndex:", self, a3))
  {
    -[UIPrintPreviewViewController addPage:forPageIndex:](self, "addPage:forPageIndex:", self, a3);
  }
}

- (BOOL)pageIndexIsInRange:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIPrintPreviewViewController printInfo](self, "printInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "rangeValue");
        if (a3 >= v10 && a3 - v10 < v11)
        {
          v13 = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)canSetStartPage:(id)a3 forPageIndex:(int64_t)a4
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v6 = -[UIPrintPreviewViewController showPageRange](self, "showPageRange", a3);
  if (!v6)
    return v6;
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageRanges");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_12;
  }
  v9 = (void *)v8;
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pageRanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
LABEL_12:
    LOBYTE(v6) = 1;
    return v6;
  }
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pageRanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rangeValue");
  v18 = v17;

  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pageRanges");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  LOBYTE(v6) = v21 == 1 && v16 != a4 && v16 + v18 > (unint64_t)a4;
  return v6;
}

- (void)setStartPage:(id)a3 forPageIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController printInfo](self, "printInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "count"))
  {
    v15 = (void *)MEMORY[0x1E0CB3B18];
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueWithRange:", a4, objc_msgSend(v13, "pageCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPageRanges:", v16);

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeValue");
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, v11 - a4 + v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPrintPreviewViewController updatePageRange:](self, "updatePageRange:", v13);
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPageRanges:", v13);
LABEL_6:

  }
}

- (BOOL)canSetEndPage:(id)a3 forPageIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;

  if (-[UIPrintPreviewViewController showPageRange](self, "showPageRange", a3))
  {
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageRanges");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[UIPrintPreviewViewController printInfo](self, "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pageRanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        return 1;
      -[UIPrintPreviewViewController printInfo](self, "printInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pageRanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rangeValue");
      v17 = v16;

      -[UIPrintPreviewViewController printInfo](self, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageRanges");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 != 1 || v15 > a4 || v17 + v15 - 1 == a4)
        return 0;
      -[UIPrintPreviewViewController printInfo](self, "printInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v6, "pageCount") - 1 > a4;
    }
    else
    {
      v21 = 1;
    }

    return v21;
  }
  return 0;
}

- (void)setEndPage:(id)a3 forPageIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController printInfo](self, "printInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPageRanges:", v12);

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeValue");

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, a4 - v9 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPrintPreviewViewController updatePageRange:](self, "updatePageRange:", v11);
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPageRanges:", v11);
LABEL_6:

  }
}

- (BOOL)canAddPage:(id)a3 forPageIndex:(int64_t)a4
{
  _BOOL4 v6;

  v6 = -[UIPrintPreviewViewController showPageRange](self, "showPageRange", a3);
  if (v6)
    LOBYTE(v6) = !-[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", a4);
  return v6;
}

- (void)addPage:(id)a3 forPageIndex:(int64_t)a4
{
  UIPrintPreviewViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  NSRange v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIPrintPreviewViewController *v31;
  int64_t range2;
  void *range2_8;
  _QWORD v34[2];
  NSRange v35;
  NSRange v36;
  NSRange v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;

  v5 = self;
  v34[1] = *MEMORY[0x1E0C80C00];
  -[UIPrintPreviewViewController printInfo](self, "printInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController printInfo](v5, "printInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPageRanges:", v29);

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
    goto LABEL_18;
  v31 = v5;
  range2 = a4;
  v9 = 0;
  v10 = 0;
  range2_8 = v8;
  do
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeValue");
    v14 = v13;

    v35.location = v12;
    v35.length = v14;
    v38.location = a4;
    v38.length = 1;
    v15 = NSUnionRange(v35, v38);
    if (v15.length == v14 + 1 && (v9 & 1) == 0)
    {
      if (objc_msgSend(v7, "count") <= v10 + 1)
        goto LABEL_12;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10 + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeValue");
      v19 = v18;

      v36.location = v17;
      v36.length = v19;
      v39.location = range2;
      v39.length = 1;
      if (NSUnionRange(v36, v39).length == v19 + 1)
      {
        v20 = (void *)MEMORY[0x1E0CB3B18];
        v37.location = v12;
        v37.length = v14;
        v40.location = v17;
        v40.length = v19;
        v21 = NSUnionRange(v37, v40);
        objc_msgSend(v20, "valueWithRange:", v21.location, v21.length);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
        ++v10;
      }
      else
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v15.location, v15.length);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
      }
      a4 = range2;
      goto LABEL_14;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_msgSend(v23, "rangeValue") <= (unint64_t)a4) | v9;

    if ((v24 & 1) != 0)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v8 = range2_8;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = range2_8;
    objc_msgSend(range2_8, "addObject:", v25);

    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
LABEL_16:
    objc_msgSend(v8, "addObject:", v22);

    ++v10;
  }
  while (v10 < objc_msgSend(v7, "count"));
  v5 = v31;
  if ((v9 & 1) == 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v26);

  }
  -[UIPrintPreviewViewController updatePageRange:](v5, "updatePageRange:", v8);
  -[UIPrintPreviewViewController printInfo](v5, "printInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPageRanges:", v8);

LABEL_21:
}

- (BOOL)canRemovePage:(id)a3 forPageIndex:(int64_t)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = -[UIPrintPreviewViewController showPageRange](self, "showPageRange", a3);
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIPrintPreviewViewController printInfo](self, "printInfo", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageRanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "rangeValue");
          v10 += v13;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
      v9 = v10 > 1;
    }

    LOBYTE(v6) = -[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", a4) & v9;
  }
  return v6;
}

- (void)removePage:(id)a3 forPageIndex:(int64_t)a4
{
  UIPrintPreviewViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  NSUInteger location;
  NSUInteger length;
  uint64_t v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  UIPrintPreviewViewController *v27;
  uint64_t v28;
  void *v29;
  NSRange v30;
  void *v31;
  void *v32;
  NSRange v33;
  void *v34;
  int64_t v35;
  NSUInteger v36;
  void *v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;
  NSRange v41;

  v5 = self;
  -[UIPrintPreviewViewController printInfo](self, "printInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageRanges");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v37;
  if (v37)
  {
    v8 = objc_msgSend(v37, "count");
    v7 = v37;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (objc_msgSend(v37, "count"))
      {
        v11 = v37;
        while (1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeValue");
          v15 = v14;

          if (a4 >= v13 && a4 - v13 < v15)
            break;
          ++v10;
          v16 = objc_msgSend(v37, "count");
          v11 = v37;
          if (v10 >= v16)
            goto LABEL_11;
        }
      }
      else
      {
        v15 = 0;
        v13 = 0;
      }
      v11 = v37;
LABEL_11:
      if (objc_msgSend(v11, "count"))
      {
        v17 = 0;
        v18 = v15 - 1;
        v19 = v15 - 1 + v13;
        v36 = v15 - 1;
        v35 = ~a4;
        do
        {
          if (v10 == v17 && v15 == 1)
            goto LABEL_25;
          if (v10 == v17 && v13 == a4)
          {
            v20 = (void *)MEMORY[0x1E0CB3B18];
            location = a4 + 1;
          }
          else
          {
            if (v10 != v17)
            {
              objc_msgSend(v37, "objectAtIndexedSubscript:", v17);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
            if (v19 != a4)
            {
              -[UIPrintPreviewViewController printInfo](v5, "printInfo");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v19;
              v27 = v5;
              v28 = objc_msgSend(v25, "pageCount");

              v29 = (void *)MEMORY[0x1E0CB3B18];
              v38.location = v13;
              v38.length = v15;
              v40.location = 0;
              v40.length = a4;
              v30 = NSIntersectionRange(v38, v40);
              objc_msgSend(v29, "valueWithRange:", v30.location, v30.length);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v31);

              v32 = (void *)MEMORY[0x1E0CB3B18];
              v41.length = v28 + v35;
              v5 = v27;
              v19 = v26;
              v18 = v36;
              v41.location = a4 + 1;
              v39.location = v13;
              v39.length = v15;
              v33 = NSIntersectionRange(v39, v41);
              location = v33.location;
              v20 = v32;
              length = v33.length;
              goto LABEL_19;
            }
            v20 = (void *)MEMORY[0x1E0CB3B18];
            location = v13;
          }
          length = v18;
LABEL_19:
          objc_msgSend(v20, "valueWithRange:", location, length, v35, v36);
          v23 = objc_claimAutoreleasedReturnValue();
LABEL_24:
          v24 = (void *)v23;
          objc_msgSend(v9, "addObject:", v23, v35, v36);

LABEL_25:
          ++v17;
        }
        while (v17 < objc_msgSend(v37, "count", v35, v36));
      }
      -[UIPrintPreviewViewController updatePageRange:](v5, "updatePageRange:", v9);
      -[UIPrintPreviewViewController printInfo](v5, "printInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPageRanges:", v9);

      v7 = v37;
    }
  }

}

- (BOOL)canAddAllPages:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;

  v4 = -[UIPrintPreviewViewController showPageRange](self, "showPageRange", a3);
  if (v4)
  {
    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pageCount");

    if (v6 < 1)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      do
      {
        if (!-[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", v7))
          v8 = 1;
        ++v7;
        -[UIPrintPreviewViewController printInfo](self, "printInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "pageCount");

      }
      while (v10 > v7);
      LOBYTE(v4) = v8;
    }
  }
  return v4;
}

- (void)addAllPages:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[UIPrintPreviewViewController printInfo](self, "printInfo", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithRange:", 0, objc_msgSend(v5, "pageCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPreviewViewController updatePageRange:](self, "updatePageRange:", v7);
  -[UIPrintPreviewViewController printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPageRanges:", v7);

}

- (void)gotoFirstPage:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[UIPrintPreviewViewController collectionView](self, "collectionView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection"))
    v5 = 8;
  else
    v5 = 1;
  objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, v5, 1);

}

- (void)gotoLastPage:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[UIPrintPreviewViewController collectionView](self, "collectionView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[UIPrintPreviewViewController numberOfSheets](self, "numberOfSheets") - 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPrintPreviewViewController previewScrollDirection](self, "previewScrollDirection"))
    v5 = 32;
  else
    v5 = 4;
  objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, v5, 1);

}

- (BOOL)canShowMenuBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[UIPrintPreviewViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[UIPrintPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isDescendantOfView:", v7);

  return v8;
}

- (id)printPagePreviewViewControllerForItemAtPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideMenu");

  -[UIPrintPreviewViewController longPressImageViewController](self, "longPressImageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UIPrintPreviewViewController cachedThumbnailImages](self, "cachedThumbnailImages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v9, "size");
    v12 = v11;
    objc_msgSend(v9, "size");
    v14 = (void *)objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v12, v13);
    objc_msgSend(v14, "setContentMode:", 2);
    objc_msgSend(v14, "setImage:", v9);
    v15 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    -[UIPrintPreviewViewController setLongPressImageViewController:](self, "setLongPressImageViewController:", v15);

    -[UIPrintPreviewViewController longPressImageViewController](self, "longPressImageViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setView:", v14);

    objc_msgSend(v9, "size");
    v18 = v17;
    v20 = v19;
    -[UIPrintPreviewViewController longPressImageViewController](self, "longPressImageViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPreferredContentSize:", v18, v20);

  }
  return -[UIPrintPreviewViewController longPressImageViewController](self, "longPressImageViewController");
}

- (id)printPagePreviewActionItemsWithPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52[2];
  _QWORD v53[4];
  id v54[2];
  _QWORD v55[4];
  id v56[2];
  _QWORD v57[4];
  id v58[2];
  id location[2];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  if (!-[UIPrintPreviewViewController showingPageView](self, "showingPageView"))
  {
    v35 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Go to First Page"), CFSTR("Go to First Page"), CFSTR("Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_6;
    v47[3] = &unk_1E9D97668;
    v33 = &v48;
    objc_copyWeak(&v48, location);
    v47[4] = self;
    objc_msgSend(v35, "actionWithTitle:image:identifier:handler:", v37, 0, 0, v47);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v39);

    v40 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Go to Last Page"), CFSTR("Go to Last Page"), CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v38;
    v45[1] = 3221225472;
    v45[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_7;
    v45[3] = &unk_1E9D97668;
    objc_copyWeak(&v46, location);
    v45[4] = self;
    objc_msgSend(v40, "actionWithTitle:image:identifier:handler:", v42, 0, 0, v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v43);

    objc_destroyWeak(&v46);
    goto LABEL_13;
  }
  if (-[UIPrintPreviewViewController canSetStartPage:forPageIndex:](self, "canSetStartPage:forPageIndex:", self, a3))
  {
    v6 = (void *)MEMORY[0x1E0DC3428];
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Start at Page %ld"), CFSTR("Start at Page %ld"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, a3 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke;
    v57[3] = &unk_1E9D97640;
    objc_copyWeak(v58, location);
    v58[1] = (id)a3;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    objc_destroyWeak(v58);
  }
  if (-[UIPrintPreviewViewController canSetEndPage:forPageIndex:](self, "canSetEndPage:forPageIndex:", self, a3))
  {
    v12 = (void *)MEMORY[0x1E0DC3428];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Stop after Page %ld"), CFSTR("Stop after Page %ld"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, a3 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_2;
    v55[3] = &unk_1E9D97640;
    objc_copyWeak(v56, location);
    v56[1] = (id)a3;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v55);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    objc_destroyWeak(v56);
  }
  if (-[UIPrintPreviewViewController canAddPage:forPageIndex:](self, "canAddPage:forPageIndex:", self, a3))
  {
    v18 = (void *)MEMORY[0x1E0DC3428];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Add Page %ld"), CFSTR("Add Page %ld"), CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v21, a3 + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_3;
    v53[3] = &unk_1E9D97640;
    objc_copyWeak(v54, location);
    v54[1] = (id)a3;
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v53);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    objc_destroyWeak(v54);
  }
  if (-[UIPrintPreviewViewController canRemovePage:forPageIndex:](self, "canRemovePage:forPageIndex:", self, a3))
  {
    v24 = (void *)MEMORY[0x1E0DC3428];
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Skip Page %ld"), CFSTR("Skip Page %ld"), CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v27, a3 + 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_4;
    v51[3] = &unk_1E9D97640;
    objc_copyWeak(v52, location);
    v52[1] = (id)a3;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v28, 0, 0, v51);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v29);

    objc_destroyWeak(v52);
  }
  if (-[UIPrintPreviewViewController canAddAllPages:](self, "canAddAllPages:", self))
  {
    v30 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Print All Pages"), CFSTR("Print All Pages"), CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_5;
    v49[3] = &unk_1E9D97668;
    v33 = &v50;
    objc_copyWeak(&v50, location);
    v49[4] = self;
    objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", v32, 0, 0, v49);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v34);

LABEL_13:
    objc_destroyWeak(v33);
  }
  objc_destroyWeak(location);
  return v5;
}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStartPage:forPageIndex:", WeakRetained, *(_QWORD *)(a1 + 40));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEndPage:forPageIndex:", WeakRetained, *(_QWORD *)(a1 + 40));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "addPage:forPageIndex:", WeakRetained, *(_QWORD *)(a1 + 40));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removePage:forPageIndex:", WeakRetained, *(_QWORD *)(a1 + 40));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addAllPages:", *(_QWORD *)(a1 + 32));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "gotoFirstPage:", *(_QWORD *)(a1 + 32));

}

void __73__UIPrintPreviewViewController_printPagePreviewActionItemsWithPageIndex___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "gotoLastPage:", *(_QWORD *)(a1 + 32));

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[UIPrintPreviewViewController setLongPressImageViewController:](self, "setLongPressImageViewController:", 0);
  v9 = (void *)MEMORY[0x1E0DC36B8];
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
  v18[3] = &unk_1E9D97690;
  objc_copyWeak(&v20, &location);
  v11 = v8;
  v19 = v11;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
  v15[3] = &unk_1E9D976B8;
  objc_copyWeak(&v17, &location);
  v12 = v11;
  v16 = v12;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", v12, v18, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

id __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "printPagePreviewViewControllerForItemAtPageIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __96__UIPrintPreviewViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(WeakRetained, "printPagePreviewActionItemsWithPageIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menuWithTitle:children:", &stru_1E9D97C98, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[UIPrintPreviewViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v9);
  else
    v10 = 0;

  return v10;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[UIPrintPreviewViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v9);
  else
    v10 = 0;

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v14[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "printInteractionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "preventPDFCreation");

  if ((v13 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __105__UIPrintPreviewViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v14[3] = &unk_1E9D97150;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "addCompletion:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __105__UIPrintPreviewViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showQuickLookFromPreviewAction");
    WeakRetained = v2;
  }

}

- (void)showQuickLookFromPreviewAction
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id location;

  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Generating PDF"), CFSTR("Generating PDF"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, CFSTR("\n"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController setGeneratingPDFProgressController:](self, "setGeneratingPDFProgressController:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "startAnimating");
  -[UIPrintPreviewViewController generatingPDFProgressController](self, "generatingPDFProgressController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addSubview:", v8);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 9, 0, v10, 9, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v10, 4, 1.0, -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraint:", v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[UIPrintPreviewViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController generatingPDFProgressController](self, "generatingPDFProgressController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v14, 1, 0);

  objc_initWeak(&location, self);
  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke;
  v16[3] = &unk_1E9D97708;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  objc_msgSend(v15, "generateQuickLookPDFWithCompletionHandler:", v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  _QWORD block[6];
  id v11;
  char v12;

  v5 = a2;
  v6 = v5;
  if (a3)
  {

    v6 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke_2;
  block[3] = &unk_1E9D976E0;
  v7 = *(_QWORD *)(a1 + 32);
  block[4] = WeakRetained;
  block[5] = v7;
  v11 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __62__UIPrintPreviewViewController_showQuickLookFromPreviewAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "generatingPDFProgressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "progressPresentationTime");
    v6 = v4 - v5;
    v7 = *(void **)(a1 + 40);
    if (v6 >= 1.0)
      objc_msgSend(v7, "hideGeneratingPDFProgress:", *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v7, "performSelector:withObject:afterDelay:", sel_hideGeneratingPDFProgress_, *(_QWORD *)(a1 + 48), 1.0 - v6);
  }
  else if (*(_QWORD *)(a1 + 48) && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "showQuickLookDocumentInteractionController:");
  }
}

- (void)hideGeneratingPDFProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UIPrintPreviewViewController generatingPDFProgressController](self, "generatingPDFProgressController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIPrintPreviewViewController_hideGeneratingPDFProgress___block_invoke;
  v7[3] = &unk_1E9D96E78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __58__UIPrintPreviewViewController_hideGeneratingPDFProgress___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGeneratingPDFProgressController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showQuickLookDocumentInteractionController:", *(_QWORD *)(a1 + 40));
}

- (void)showQuickLookDocumentInteractionController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, int);
  void *v19;
  id v20;
  id location;

  v4 = a3;
  if (v4)
  {
    -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createShareablePDFFileURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v6;
    else
      v7 = v4;
    objc_msgSend(MEMORY[0x1E0D96D38], "interactionControllerWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController setDocumentInteractionController:](self, "setDocumentInteractionController:", v8);

    -[UIPrintPreviewViewController printInfo](self, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "jobName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPreviewViewController documentInteractionController](self, "documentInteractionController");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "setName:", v10);

    -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v12);

    -[UIPrintPreviewViewController documentInteractionController](self, "documentInteractionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __75__UIPrintPreviewViewController_showQuickLookDocumentInteractionController___block_invoke;
    v19 = &unk_1E9D97730;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v13, "_setCompletionWithItemsHandler:", &v16);

    -[UIPrintPreviewViewController documentInteractionController](self, "documentInteractionController", v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[UIPrintPreviewViewController setPresentingDocumentInteractionController:](self, "setPresentingDocumentInteractionController:", 1);
    -[UIPrintPreviewViewController documentInteractionController](self, "documentInteractionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v15, "presentPreviewAnimated:", 0);

    if ((v11 & 1) == 0)
    {
      NSLog(CFSTR("UIPrintPreviewViewController: Couldn't present UIDocumentInteractionController after 3D Touch commit."));
      -[UIPrintPreviewViewController setPresentingDocumentInteractionController:](self, "setPresentingDocumentInteractionController:", 0);
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __75__UIPrintPreviewViewController_showQuickLookDocumentInteractionController___block_invoke(uint64_t a1, void *a2, int a3)
{
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = _UIActivityOpenInApplicationTypeForActivityType();

  v7 = WeakRetained;
  if (a3 && WeakRetained && !v6)
  {
    objc_msgSend(WeakRetained, "cancelPrinting");
    v7 = WeakRetained;
  }

}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  -[UIPrintPreviewViewController setPresentingDocumentInteractionController:](self, "setPresentingDocumentInteractionController:", 0);
}

- (void)documentInteractionController:(id)a3 didEndSendingToApplication:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_printPanelViewController);
  objc_msgSend(WeakRetained, "cancelPrinting");

}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  return &unk_1E9DB0828;
}

- (void)animateCellAndPresentDocumentInteractionController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

  -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController pinchAnimationProgressView](self, "pinchAnimationProgressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController pinchGestureBeginningView](self, "pinchGestureBeginningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPreviewViewController setPinchAnimationView:](self, "setPinchAnimationView:", 0);
  -[UIPrintPreviewViewController setPinchGestureBeginningView:](self, "setPinchGestureBeginningView:", 0);
  -[UIPrintPreviewViewController setPinchAnimationProgressView:](self, "setPinchAnimationProgressView:", 0);
  objc_initWeak(&location, self);
  -[UIPrintPreviewViewController printPanelViewController](self, "printPanelViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke;
  v16[3] = &unk_1E9D97780;
  objc_copyWeak(&v20, &location);
  v9 = v6;
  v17 = v9;
  v10 = v4;
  v18 = v10;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v7, "generateQuickLookPDFWithCompletionHandler:", v16);

  if (v11 && v10)
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_3;
    v13[3] = &unk_1E9D96E78;
    v14 = v11;
    v15 = v10;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0x10000, v13, 0, 0.3, 0.0);

  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke(id *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = v5;
  if (a3)
  {

    v6 = 0;
  }
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_2;
  block[3] = &unk_1E9D97758;
  block[4] = WeakRetained;
  v10 = v6;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v7 = v6;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showQuickLookDocumentInteractionController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 64), "performSelector:withObject:afterDelay:", sel_removeFromSuperview, 0, 0.200000003);
}

uint64_t __82__UIPrintPreviewViewController_animateCellAndPresentDocumentInteractionController__block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  CGAffineTransformMakeScale(&v5, 2.0, 2.0);
  v2 = *(void **)(a1 + 40);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

- (id)createGeneratingPDFProgressView:(CGRect)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAlpha:", 0.0);
  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Generating PDF"), CFSTR("Generating PDF"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v6);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 9, 0, v3, 9, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 10, 0, v3, 10, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v12);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v3, 9, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 0, v6, 4, 1.0, 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v14);

  objc_msgSend(v12, "startAnimating");
  return v3;
}

- (void)handlePinch:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  CGFloat v63;
  double v64;
  void *v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1 || self->_pinchGestureBeginningView)
  {
    if (objc_msgSend(v4, "state") == 1)
    {
      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v6);
      objc_msgSend(v5, "indexPathForItemAtPoint:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[UIPrintPreviewViewController pageIndexIsInRange:](self, "pageIndexIsInRange:", objc_msgSend(v7, "row")))
      {
        -[UIPrintPreviewViewController collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "thumbnailView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        -[UIPrintPreviewViewController createGeneratingPDFProgressView:](self, "createGeneratingPDFProgressView:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPreviewViewController setPinchAnimationProgressView:](self, "setPinchAnimationProgressView:", v12);

        -[UIPrintPreviewViewController pinchAnimationProgressView](self, "pinchAnimationProgressView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v13);

        -[UIPrintPreviewViewController pinchAnimationProgressView](self, "pinchAnimationProgressView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bringSubviewToFront:", v14);

        -[UIPrintPreviewViewController setPinchGestureBeginningView:](self, "setPinchGestureBeginningView:", v10);
        -[UIPrintPreviewViewController pinchGestureBeginningView](self, "pinchGestureBeginningView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAlpha:", 0.0);

        v16 = objc_alloc(MEMORY[0x1E0DC3890]);
        objc_msgSend(v10, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithImage:", v17);
        -[UIPrintPreviewViewController setPinchAnimationView:](self, "setPinchAnimationView:", v18);

        objc_msgSend(v10, "frame");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v10, "superview");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        objc_msgSend(v23, "convertPoint:toView:", v11);
        v25 = v24;
        v27 = v26;

        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFrame:", v25, v27, v20, v22);

        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v29);

        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bringSubviewToFront:", v30);

        -[UIPrintPreviewViewController setPinchGestureLastScale:](self, "setPinchGestureLastScale:", 1.0);
        -[UIPrintPreviewViewController pinchGestureBeginningView](self, "pinchGestureBeginningView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locationInView:", v31);
        -[UIPrintPreviewViewController setPinchGestureLastPoint:](self, "setPinchGestureLastPoint:");

      }
LABEL_6:

      goto LABEL_15;
    }
    if (objc_msgSend(v4, "state") == 3)
    {
      objc_msgSend(v4, "scale");
      if (v32 > 1.2)
      {
        -[UIPrintPreviewViewController animateCellAndPresentDocumentInteractionController](self, "animateCellAndPresentDocumentInteractionController");
        goto LABEL_15;
      }
      v33 = (void *)MEMORY[0x1E0DC3F10];
      v74[4] = self;
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke;
      v75[3] = &unk_1E9D96D90;
      v75[4] = self;
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_2;
      v74[3] = &unk_1E9D97330;
      v34 = v75;
      v35 = v74;
    }
    else
    {
      if (objc_msgSend(v4, "state") != 4 && objc_msgSend(v4, "state") != 5)
      {
        objc_msgSend(v4, "velocity");
        if (v36 > 2.0 || (objc_msgSend(v4, "scale"), v37 > 1.5))
        {
          -[UIPrintPreviewViewController animateCellAndPresentDocumentInteractionController](self, "animateCellAndPresentDocumentInteractionController");
          objc_msgSend(v4, "setEnabled:", 0);
          objc_msgSend(v4, "setEnabled:", 1);
          goto LABEL_15;
        }
        -[UIPrintPreviewViewController pinchGestureLastScale](self, "pinchGestureLastScale");
        v39 = v38;
        objc_msgSend(v4, "scale");
        v41 = v40;
        objc_msgSend(v4, "scale");
        -[UIPrintPreviewViewController setPinchGestureLastScale:](self, "setPinchGestureLastScale:");
        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locationInView:", v42);
        v44 = v43;
        v46 = v45;

        objc_msgSend(v4, "scale");
        if (v47 > 1.0)
        {
          v48 = v41 - v39 + 1.0;
          -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
            objc_msgSend(v49, "transform");
          else
            memset(&v70, 0, sizeof(v70));
          CGAffineTransformScale(&v71, &v70, v48, v48);
          -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v71;
          objc_msgSend(v51, "setTransform:", &v69);

          objc_msgSend(v4, "scale");
          v53 = 1.0 / v52;
          -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setAlpha:", v53);

          objc_msgSend(v4, "scale");
          v56 = v55;
          objc_msgSend(v4, "scale");
          v58 = 1.0 - 1.0 / (v56 * v57);
          -[UIPrintPreviewViewController pinchAnimationProgressView](self, "pinchAnimationProgressView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setAlpha:", v58);

        }
        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v60)
          objc_msgSend(v60, "transform");
        else
          memset(&v67, 0, sizeof(v67));
        -[UIPrintPreviewViewController pinchGestureLastPoint](self, "pinchGestureLastPoint");
        v63 = v44 - v62;
        -[UIPrintPreviewViewController pinchGestureLastPoint](self, "pinchGestureLastPoint");
        CGAffineTransformTranslate(&v68, &v67, v63, v46 - v64);
        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v68;
        objc_msgSend(v65, "setTransform:", &v66);

        -[UIPrintPreviewViewController pinchAnimationView](self, "pinchAnimationView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "locationInView:", v7);
        -[UIPrintPreviewViewController setPinchGestureLastPoint:](self, "setPinchGestureLastPoint:");
        goto LABEL_6;
      }
      v33 = (void *)MEMORY[0x1E0DC3F10];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_3;
      v73[3] = &unk_1E9D96D90;
      v73[4] = self;
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __44__UIPrintPreviewViewController_handlePinch___block_invoke_4;
      v72[3] = &unk_1E9D97330;
      v72[4] = self;
      v34 = v73;
      v35 = v72;
    }
    objc_msgSend(v33, "animateWithDuration:delay:options:animations:completion:", 0x20000, v34, v35, 0.2, 0.0);
  }
LABEL_15:

}

void __44__UIPrintPreviewViewController_handlePinch___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v15, v11, v13);
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationProgressView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 0.0);

}

uint64_t __44__UIPrintPreviewViewController_handlePinch___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationProgressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setPinchAnimationProgressView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPinchAnimationView:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPinchGestureBeginningView:", 0);
}

void __44__UIPrintPreviewViewController_handlePinch___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v15, v11, v13);
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationProgressView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 0.0);

}

uint64_t __44__UIPrintPreviewViewController_handlePinch___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pinchGestureBeginningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationProgressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "pinchAnimationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setPinchAnimationProgressView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPinchAnimationView:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPinchGestureBeginningView:", 0);
}

- (void)performThumbnailDispatchBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPrintPreviewViewController thumbnailOperationsQueue](self, "thumbnailOperationsQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperationWithBlock:", v4);

}

- (void)showWebkitGeneratingPreviewProgress
{
  void *v3;
  char v4;
  void *v5;
  UIPrintMessageAndSpinnerView *v6;
  void *v7;
  UIPrintMessageAndSpinnerView *v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (-[UIPrintPreviewViewController showWebKitGeneratingPreviewProgress](self, "showWebKitGeneratingPreviewProgress"))
  {
    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHidden");

    if ((v4 & 1) == 0)
    {
      -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v6 = [UIPrintMessageAndSpinnerView alloc];
        -[UIPrintPreviewViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        v8 = -[UIPrintMessageAndSpinnerView initWithFrame:](v6, "initWithFrame:");

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Loading Preview…"), CFSTR("Loading Preview…"), CFSTR("Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintMessageAndSpinnerView setMessageText:](v8, "setMessageText:", v10);

        -[UIPrintMessageAndSpinnerView setSpinnerHidden:](v8, "setSpinnerHidden:", 0);
        -[UIPrintMessageAndSpinnerView setSpinSpinner:](v8, "setSpinSpinner:", 1);
        -[UIPrintPreviewViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v8);

        -[UIPrintPreviewViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3718];
        -[UIPrintPreviewViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 9, 0, v14, 9, 1.0, 0.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3718];
        -[UIPrintPreviewViewController view](self, "view", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 10, 0, v17, 10, 1.0, 0.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v18;
        v19 = (void *)MEMORY[0x1E0CB3718];
        -[UIPrintPreviewViewController view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 7, -1, v20, 7, 1.0, 0.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addConstraints:", v22);

        -[UIPrintPreviewViewController setWebKitGeneratingPreviewProgressView:](self, "setWebKitGeneratingPreviewProgressView:", v8);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[UIPrintPreviewViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
      -[UIPrintPreviewViewController collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 1);

      -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", 0);

      -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSpinSpinner:", 1);

    }
  }
}

- (void)hideWebkitGeneratingPreviewProgress
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[UIPrintPreviewViewController webKitGeneratingPreviewProgressView](self, "webKitGeneratingPreviewProgressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSpinSpinner:", 0);

    -[UIPrintPreviewViewController collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

  }
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setCollectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (BOOL)presentingDocumentInteractionController
{
  return self->_presentingDocumentInteractionController;
}

- (void)setPresentingDocumentInteractionController:(BOOL)a3
{
  self->_presentingDocumentInteractionController = a3;
}

- (UIPrintSheetController)printSheetController
{
  return (UIPrintSheetController *)objc_getProperty(self, a2, 984, 1);
}

- (void)setPrintSheetController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (int64_t)previewLayoutType
{
  return self->_previewLayoutType;
}

- (void)setPreviewLayoutType:(int64_t)a3
{
  self->_previewLayoutType = a3;
}

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setPrintInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (int64_t)numberOfSheets
{
  return self->_numberOfSheets;
}

- (void)setNumberOfSheets:(int64_t)a3
{
  self->_numberOfSheets = a3;
}

- (NSCache)cachedThumbnailImages
{
  return (NSCache *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCachedThumbnailImages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (id)thumnailImageCompletionHandler
{
  return objc_getProperty(self, a2, 1024, 1);
}

- (void)setThumnailImageCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1024);
}

- (NSOperationQueue)thumbnailOperationsQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setThumbnailOperationsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (UIButton)layoutPopupButton
{
  return (UIButton *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setLayoutPopupButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSLayoutConstraint)layoutPopupButtonTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setLayoutPopupButtonTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (UIAction)pagesPopupAction
{
  return (UIAction *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPagesPopupAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (UIAction)sheetsPopupAction
{
  return (UIAction *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setSheetsPopupAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (CGSize)previewSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_previewSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_previewSize, &v3, 16, 1, 0);
}

- (NSLayoutConstraint)collectionViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCollectionViewTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (int64_t)previewScrollDirection
{
  return self->_previewScrollDirection;
}

- (void)setPreviewScrollDirection:(int64_t)a3
{
  self->_previewScrollDirection = a3;
}

- (UIDocumentInteractionController)documentInteractionController
{
  return (UIDocumentInteractionController *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setDocumentInteractionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (UIViewController)longPressImageViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setLongPressImageViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (UIView)pinchGestureBeginningView
{
  return (UIView *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setPinchGestureBeginningView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (UIImageView)pinchAnimationView
{
  return (UIImageView *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPinchAnimationView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (UIView)pinchAnimationProgressView
{
  return (UIView *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setPinchAnimationProgressView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (CGPoint)pinchGestureLastPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_pinchGestureLastPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPinchGestureLastPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_pinchGestureLastPoint, &v3, 16, 1, 0);
}

- (double)pinchGestureLastScale
{
  return self->_pinchGestureLastScale;
}

- (void)setPinchGestureLastScale:(double)a3
{
  self->_pinchGestureLastScale = a3;
}

- (UIAlertController)generatingPDFProgressController
{
  return (UIAlertController *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setGeneratingPDFProgressController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (UIPrintMessageAndSpinnerView)webKitGeneratingPreviewProgressView
{
  return (UIPrintMessageAndSpinnerView *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setWebKitGeneratingPreviewProgressView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (BOOL)showWebKitGeneratingPreviewProgress
{
  return self->_showWebKitGeneratingPreviewProgress;
}

- (void)setShowWebKitGeneratingPreviewProgress:(BOOL)a3
{
  self->_showWebKitGeneratingPreviewProgress = a3;
}

- (double)progressPresentationTime
{
  return self->_progressPresentationTime;
}

- (void)setProgressPresentationTime:(double)a3
{
  self->_progressPresentationTime = a3;
}

- (UITraitChangeRegistration)traitPreferredContentSizeChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setTraitPreferredContentSizeChangeRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_loadWeakRetained((id *)&self->_printPanelViewController);
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printPanelViewController, a3);
}

- (UIPrintInteractionController)printInteractionController
{
  return (UIPrintInteractionController *)objc_loadWeakRetained((id *)&self->_printInteractionController);
}

- (void)setPrintInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_printInteractionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printInteractionController);
  objc_destroyWeak((id *)&self->_printPanelViewController);
  objc_storeStrong((id *)&self->_traitPreferredContentSizeChangeRegistration, 0);
  objc_storeStrong((id *)&self->_webKitGeneratingPreviewProgressView, 0);
  objc_storeStrong((id *)&self->_generatingPDFProgressController, 0);
  objc_storeStrong((id *)&self->_pinchAnimationProgressView, 0);
  objc_storeStrong((id *)&self->_pinchAnimationView, 0);
  objc_storeStrong((id *)&self->_pinchGestureBeginningView, 0);
  objc_storeStrong((id *)&self->_longPressImageViewController, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_sheetsPopupAction, 0);
  objc_storeStrong((id *)&self->_pagesPopupAction, 0);
  objc_storeStrong((id *)&self->_layoutPopupButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutPopupButton, 0);
  objc_storeStrong((id *)&self->_thumbnailOperationsQueue, 0);
  objc_storeStrong(&self->_thumnailImageCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedThumbnailImages, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_printSheetController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
