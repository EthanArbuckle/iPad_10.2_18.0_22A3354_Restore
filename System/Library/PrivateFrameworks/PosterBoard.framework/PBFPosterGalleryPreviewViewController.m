@implementation PBFPosterGalleryPreviewViewController

- (void)dealloc
{
  objc_super v3;

  -[PRSceneViewController setForcesSceneForeground:](self->_loadingHeroEditingSceneViewController, "setForcesSceneForeground:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryPreviewViewController;
  -[PBFPosterGalleryPreviewViewController dealloc](&v3, sel_dealloc);
}

+ (void)configureSheetPresentationController:(id)a3
{
  id v3;

  v3 = a3;
  PRSheetCornerRadius();
  objc_msgSend(v3, "setPreferredCornerRadius:");
  objc_msgSend(v3, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v3, "setPrefersGrabberVisible:", 0);

}

- (id)galleryCollectionViewController
{
  return self->_collectionViewController;
}

- (void)setApplicationStateMonitor:(id)a3
{
  PBFApplicationStateMonitor **p_applicationStateMonitor;
  id v6;

  p_applicationStateMonitor = &self->_applicationStateMonitor;
  v6 = a3;
  if ((-[PBFApplicationStateMonitor isEqual:](*p_applicationStateMonitor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
    -[_PBFGalleryCollectionViewController setApplicationStateMonitor:](self->_collectionViewController, "setApplicationStateMonitor:", *p_applicationStateMonitor);
  }

}

- (void)viewDidLoad
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _PBFGalleryCollectionViewController *v12;
  _PBFGalleryCollectionViewController *collectionViewController;
  _PBFGalleryCollectionViewController *v14;
  void *v15;
  UINavigationController *navigationController;
  UINavigationController *v17;
  void *v18;
  void *v19;
  void *v20;
  UINavigationController *v21;
  void *v22;
  UINavigationController *v23;
  id v24;
  UINavigationController *v25;
  NSMutableSet *v26;
  NSMutableSet *displayedPreviewIdentifiers;
  NSMutableSet *v28;
  NSMutableSet *tappedPreviewIdentifiers;
  NSString *currentlyEditingPreviewIdentifier;
  NSString *addedPreviewIdentifier;
  _QWORD v32[4];
  UINavigationController *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PBFPosterGalleryPreviewViewController;
  -[PBFPosterGalleryPreviewViewController viewDidLoad](&v39, sel_viewDidLoad);
  v3 = MEMORY[0x1E0C809B0];
  if (!self->_collectionViewController)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    objc_msgSend(v4, "setScrollDirection:", 0);
    -[PBFPosterGalleryPreviewViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x1E0DC35D0]);
    v35[0] = v3;
    v35[1] = 3221225472;
    v35[2] = __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke;
    v35[3] = &unk_1E86F3FC8;
    objc_copyWeak(&v37, &location);
    v10 = v8;
    v36 = v10;
    v11 = (void *)objc_msgSend(v9, "initWithSectionProvider:configuration:", v35, v4);
    v12 = -[_PBFGalleryCollectionViewController initWithCollectionViewLayout:]([_PBFGalleryCollectionViewController alloc], "initWithCollectionViewLayout:", v11);
    collectionViewController = self->_collectionViewController;
    self->_collectionViewController = v12;

    v14 = self->_collectionViewController;
    -[PBFPosterGalleryPreviewViewController dataProvider](self, "dataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PBFGalleryCollectionViewController setDataProvider:](v14, "setDataProvider:", v15);

    -[_PBFGalleryCollectionViewController setDelegate:](self->_collectionViewController, "setDelegate:", self);
    -[_PBFGalleryCollectionViewController setHostingViewController:](self->_collectionViewController, "setHostingViewController:", self);
    -[_PBFGalleryCollectionViewController setApplicationStateMonitor:](self->_collectionViewController, "setApplicationStateMonitor:", self->_applicationStateMonitor);
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  if (!self->_navigationController)
  {
    v17 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_collectionViewController);
    -[_PBFGalleryCollectionViewController navigationItem](self->_collectionViewController, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLocalizedString(CFSTR("POSTER_GALLERY_PREVIEW_VIEW_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
    objc_msgSend(v18, "setRightBarButtonItem:", v20);
    v21 = self->_navigationController;
    self->_navigationController = v17;

  }
  -[PBFPosterGalleryPreviewViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_navigationController;
  v32[0] = v3;
  v32[1] = 3221225472;
  v32[2] = __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke_2;
  v32[3] = &unk_1E86F3FF0;
  v33 = v23;
  v34 = v22;
  v24 = v22;
  v25 = v23;
  -[PBFPosterGalleryPreviewViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v25, v24, 0, v32);
  v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  displayedPreviewIdentifiers = self->_displayedPreviewIdentifiers;
  self->_displayedPreviewIdentifiers = v26;

  v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  tappedPreviewIdentifiers = self->_tappedPreviewIdentifiers;
  self->_tappedPreviewIdentifiers = v28;

  currentlyEditingPreviewIdentifier = self->_currentlyEditingPreviewIdentifier;
  self->_currentlyEditingPreviewIdentifier = 0;

  addedPreviewIdentifier = self->_addedPreviewIdentifier;
  self->_addedPreviewIdentifier = 0;

  -[PBFPosterGalleryPreviewViewController _updatePreferredContentSizeForOrientation:](self, "_updatePreferredContentSizeForOrientation:", -[PBFPosterGalleryPreviewViewController layoutOrientation](self, "layoutOrientation"));
}

id __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_layoutSectionForSection:environment:galleryViewSpec:", a2, v6, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __52__PBFPosterGalleryPreviewViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("posterboard-gallery-view"));

  v6[2]();
}

- (id)_layoutSectionForSection:(int64_t)a3 environment:(id)a4 galleryViewSpec:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  double v14;
  double v15;
  __int128 v16;
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
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
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
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  _OWORD v66[12];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PBFPosterGalleryPreviewViewController dataProvider](self, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionIdentifierForIndex:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  memset(v66, 0, sizeof(v66));
  -[PBFPosterGalleryPreviewViewController metricsForEnvironment:](self, "metricsForEnvironment:", v8);
  v12 = objc_msgSend(v10, "sectionTypeForSectionWithIdentifier:", v11);
  v13 = (double *)&v66[v12];
  v14 = *v13;
  v15 = v13[1];
  v16 = v69;
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", *v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v17, v18);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", *(double *)&v16);
  v63 = v9;
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v11;
  switch(v12)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0DC3350];
      v73 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "horizontalGroupWithLayoutSize:subitems:", v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInterGroupSpacing:", *(double *)&v16);
      objc_msgSend(v23, "setOrthogonalScrollingBehavior:", 2);
      goto LABEL_10;
    case 1:
      v24 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v25, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0DC3350];
      v75[0] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "horizontalGroupWithLayoutSize:subitems:", v19, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setInterItemSpacing:", v64);
      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInterGroupSpacing:", *((double *)&v16 + 1));
      goto LABEL_10;
    case 2:
      v28 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sizeWithWidthDimension:heightDimension:", v29, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0DC3350];
      v74 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "horizontalGroupWithLayoutSize:subitems:", v19, v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setInterItemSpacing:", v64);
      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      v32 = objc_msgSend(v10, "numberOfItemsInSectionWithIdentifier:", v11);
      v33 = *((double *)&v67 + 1);
      v34 = *((double *)&v68 + 1);
      objc_msgSend(v9, "heroSpacingForOrientation:", -[PBFPosterGalleryPreviewViewController layoutOrientation](self, "layoutOrientation"));
      v36 = v35;
      v60 = v8;
      objc_msgSend(v8, "container");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "effectiveContentSize");
      v39 = v38 - v33 - v34;

      objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0DC3350];
      if (v36 * (double)(v32 - 1) + (double)v32 * v14 <= v39)
      {
        objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v19, v65, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setInterItemSpacing:", v42);

        objc_msgSend(MEMORY[0x1E0DC3378], "flexibleSpacing:", 0.0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3348], "spacingForLeading:top:trailing:bottom:", v59, 0, v59, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setEdgeSpacing:", v58);
        objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v57, v18);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0DC3350];
        v72 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "horizontalGroupWithLayoutSize:subitems:", v43, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v46);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v71 = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "horizontalGroupWithLayoutSize:subitems:", v19, v41);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setInterGroupSpacing:", v36);
        objc_msgSend(v23, "setOrthogonalScrollingBehavior:", 2);
      }
      v8 = v60;
LABEL_10:

      v9 = v63;
      break;
    default:
      v23 = 0;
      break;
  }
  objc_msgSend(v23, "setContentInsets:", *(double *)&v66[2 * v12 + 6], *((double *)&v66[2 * v12 + 6] + 1), *(double *)&v66[2 * v12 + 7], *((double *)&v66[2 * v12 + 7] + 1));
  if (v12 != 3)
  {
    v47 = (void *)MEMORY[0x1E0DC3340];
    objc_msgSend(v9, "sectionHeaderTitleFont");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "lineHeight");
    objc_msgSend(v47, "estimatedDimension:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sizeWithWidthDimension:heightDimension:", v51, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v52, CFSTR("KGalleryHeaderElementKind"), 1, 0.0, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setZIndex:", 0);
    v70 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v54 = v8;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBoundarySupplementaryItems:", v55);

    v8 = v54;
    v9 = v63;

  }
  return v23;
}

- (void)setDataProvider:(id)a3
{
  PBFPosterGalleryDataProvider *v5;
  int v6;
  PBFPosterGalleryDataProvider *v7;

  v5 = (PBFPosterGalleryDataProvider *)a3;
  if (self->_dataProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_dataProvider, a3);
    v6 = -[PBFPosterGalleryPreviewViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[_PBFGalleryCollectionViewController setDataProvider:](self->_collectionViewController, "setDataProvider:", self->_dataProvider);
      v5 = v7;
    }
  }

}

- (int64_t)layoutOrientation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[PBFPosterGalleryPreviewViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "activeInterfaceOrientation");

  }
  if ((unint64_t)(v5 - 1) < 2)
    return 1;
  else
    return 4;
}

- (void)_updatePreferredContentSizeForOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  BSDispatchQueueAssertMain();
  -[PBFPosterGalleryPreviewViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    -[PBFPosterGalleryPreviewViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "gallerySizeForPadOrientation:", a3);
    -[PBFPosterGalleryPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (void)updatePreferredContentSizeForSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  BSDispatchQueueAssertMain();
  -[PBFPosterGalleryPreviewViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 1)
  {
    if (width < height)
      v10 = 1;
    else
      v10 = 4;
    -[PBFPosterGalleryPreviewViewController _updatePreferredContentSizeForOrientation:](self, "_updatePreferredContentSizeForOrientation:", v10);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__PBFPosterGalleryPreviewViewController_updatePreferredContentSizeForSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E86F4018;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __101__PBFPosterGalleryPreviewViewController_updatePreferredContentSizeForSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- ($93F1CD7DD39D62F1A27D2B4232824D31)metricsForEnvironment:(SEL)a3
{
  void *v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $2AC23ADCE56302ADF5FE8ABECF580C5C *p_metrics;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  CGFloat v38;
  _QWORD *p_trailing;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGSize v52;
  CGSize v53;
  $93F1CD7DD39D62F1A27D2B4232824D31 *result;
  double bottom;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGSize v61;
  CGSize v62;
  id v63;

  v63 = a4;
  objc_msgSend(v63, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  if (v8 != self->_environmentContainerContentSize.width || v7 != self->_environmentContainerContentSize.height)
    goto LABEL_14;
  objc_msgSend(v63, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInsets");
  v14 = v13;
  if (v15 != self->_environmentContainerContentInsets.leading
    || v11 != self->_environmentContainerContentInsets.top
    || v12 != self->_environmentContainerContentInsets.trailing)
  {

LABEL_14:
    goto LABEL_15;
  }
  bottom = self->_environmentContainerContentInsets.bottom;

  if (v14 == bottom)
  {
    v56 = *(_OWORD *)&self->_metrics.sectionContentInsets[3].bottom;
    *(_OWORD *)&retstr->var2[3].top = *(_OWORD *)&self->_metrics.sectionContentInsets[3].top;
    *(_OWORD *)&retstr->var2[3].bottom = v56;
    *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->_metrics.standardSpacing;
    v57 = *(_OWORD *)&self->_metrics.sectionContentInsets[1].bottom;
    *(_OWORD *)&retstr->var2[1].top = *(_OWORD *)&self->_metrics.sectionContentInsets[1].top;
    *(_OWORD *)&retstr->var2[1].bottom = v57;
    v58 = *(_OWORD *)&self->_metrics.sectionContentInsets[2].bottom;
    *(_OWORD *)&retstr->var2[2].top = *(_OWORD *)&self->_metrics.sectionContentInsets[2].top;
    *(_OWORD *)&retstr->var2[2].bottom = v58;
    v59 = *(_OWORD *)&self->_metrics.maximumNumberOfHorizontalItems[2];
    *(_OWORD *)retstr->var1 = *(_OWORD *)self->_metrics.maximumNumberOfHorizontalItems;
    *(_OWORD *)&retstr->var1[2] = v59;
    v60 = *(_OWORD *)&self->_metrics.sectionContentInsets[0].bottom;
    *(_OWORD *)&retstr->var2[0].top = *(_OWORD *)&self->_metrics.sectionContentInsets[0].top;
    *(_OWORD *)&retstr->var2[0].bottom = v60;
    v61 = self->_metrics.itemSizeForType[1];
    retstr->var0[0] = self->_metrics.itemSizeForType[0];
    retstr->var0[1] = v61;
    v62 = self->_metrics.itemSizeForType[3];
    retstr->var0[2] = self->_metrics.itemSizeForType[2];
    retstr->var0[3] = v62;
    goto LABEL_18;
  }
LABEL_15:
  p_metrics = &self->_metrics;
  self->_metrics.itemSizeForType[0] = 0u;
  self->_metrics.itemSizeForType[1] = 0u;
  self->_metrics.itemSizeForType[2] = 0u;
  self->_metrics.itemSizeForType[3] = 0u;
  *(_OWORD *)self->_metrics.maximumNumberOfHorizontalItems = 0u;
  *(_OWORD *)&self->_metrics.maximumNumberOfHorizontalItems[2] = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[0].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[0].bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[1].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[1].bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[2].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[2].bottom = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[3].top = 0u;
  *(_OWORD *)&self->_metrics.sectionContentInsets[3].bottom = 0u;
  *(_OWORD *)&self->_metrics.standardSpacing = 0u;
  -[PBFPosterGalleryPreviewViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "container");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "effectiveContentSize");

  v24 = -[PBFPosterGalleryPreviewViewController layoutOrientation](self, "layoutOrientation");
  +[PBFPosterGalleryPreviewCell contentSizeForCellWithTitle:interfaceOrientation:spec:](PBFPosterGalleryPreviewCell, "contentSizeForCellWithTitle:interfaceOrientation:spec:", 0, v24, v22);
  v26 = v25;
  v28 = v27;
  +[PBFPosterGalleryPreviewCell contentSizeForCellWithTitle:interfaceOrientation:spec:](PBFPosterGalleryPreviewCell, "contentSizeForCellWithTitle:interfaceOrientation:spec:", 1, v24, v22);
  v30 = v29;
  v32 = v31;
  +[PBFPosterGalleryPreviewCell heroContentSizeForCellWithTitle:interfaceOrientation:spec:](PBFPosterGalleryPreviewCell, "heroContentSizeForCellWithTitle:interfaceOrientation:spec:", 1, v24, v22);
  v34 = v33;
  v36 = v35;
  objc_msgSend(v22, "sectionHorizontalMargin");
  UIRoundToScreenScale();
  v37 = 0;
  p_metrics->itemSizeForType[1].width = v30;
  p_metrics->itemSizeForType[1].height = v32;
  p_metrics->itemSizeForType[0].width = v26;
  p_metrics->itemSizeForType[0].height = v28;
  p_metrics->itemSizeForType[3].width = v34;
  p_metrics->itemSizeForType[3].height = v36;
  p_metrics->itemSizeForType[2].width = v38;
  p_metrics->itemSizeForType[2].height = v28;
  *(int64x2_t *)p_metrics->maximumNumberOfHorizontalItems = vdupq_n_s64(3uLL);
  *(_OWORD *)&p_metrics->maximumNumberOfHorizontalItems[2] = xmmword_1CBB8E260;
  do
  {
    p_trailing = (_QWORD *)&p_metrics->sectionContentInsets[v37].trailing;
    objc_msgSend(v22, "sectionHorizontalMargin");
    v41 = v40;
    objc_msgSend(v22, "sectionVerticalMargin");
    v43 = v42;
    objc_msgSend(v22, "sectionHorizontalMargin");
    *(p_trailing - 3) = 0;
    *(p_trailing - 2) = v41;
    *(p_trailing - 1) = v43;
    *p_trailing = v44;
    ++v37;
  }
  while (v37 != 4);
  p_metrics->sectionContentInsets[3].top = 4.0;
  objc_msgSend(v22, "standardSpacing");
  p_metrics->standardSpacing = v45;
  objc_msgSend(v22, "groupSpacing");
  p_metrics->groupSpacing = v46;
  v47 = *(_OWORD *)&p_metrics->sectionContentInsets[3].bottom;
  *(_OWORD *)&retstr->var2[3].top = *(_OWORD *)&p_metrics->sectionContentInsets[3].top;
  *(_OWORD *)&retstr->var2[3].bottom = v47;
  v48 = *(_OWORD *)&p_metrics->sectionContentInsets[1].bottom;
  *(_OWORD *)&retstr->var2[1].top = *(_OWORD *)&p_metrics->sectionContentInsets[1].top;
  *(_OWORD *)&retstr->var2[1].bottom = v48;
  v49 = *(_OWORD *)&p_metrics->sectionContentInsets[2].bottom;
  *(_OWORD *)&retstr->var2[2].top = *(_OWORD *)&p_metrics->sectionContentInsets[2].top;
  *(_OWORD *)&retstr->var2[2].bottom = v49;
  v50 = *(_OWORD *)&p_metrics->maximumNumberOfHorizontalItems[2];
  *(_OWORD *)retstr->var1 = *(_OWORD *)p_metrics->maximumNumberOfHorizontalItems;
  *(_OWORD *)&retstr->var1[2] = v50;
  v51 = *(_OWORD *)&p_metrics->sectionContentInsets[0].bottom;
  *(_OWORD *)&retstr->var2[0].top = *(_OWORD *)&p_metrics->sectionContentInsets[0].top;
  *(_OWORD *)&retstr->var2[0].bottom = v51;
  v52 = p_metrics->itemSizeForType[1];
  retstr->var0[0] = p_metrics->itemSizeForType[0];
  retstr->var0[1] = v52;
  v53 = p_metrics->itemSizeForType[3];
  retstr->var0[2] = p_metrics->itemSizeForType[2];
  retstr->var0[3] = v53;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&p_metrics->standardSpacing;

LABEL_18:
  return result;
}

- (void)presentPreview:(id)a3 withMode:(int64_t)a4 fromView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *currentlyEditingPreviewIdentifier;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PBFGalleryEditingSceneViewController *v25;
  void *v26;
  void *v27;
  PBFGalleryEditingSceneViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  int64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "posterDescriptorLookupInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterDescriptorPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "posterDescriptorLookupInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterDescriptorExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D7F8C0];
  objc_msgSend(v13, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extensionInstanceForIdentity:instanceIdentifier:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v17)
  {
    if (a4 == 2)
    {
      v63 = v13;
      -[PBFPosterGalleryPreviewViewController setPresentingPreview:](self, "setPresentingPreview:", 1);
      objc_msgSend(v8, "previewUniqueIdentifier");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentlyEditingPreviewIdentifier = self->_currentlyEditingPreviewIdentifier;
      self->_currentlyEditingPreviewIdentifier = v18;

      -[PBFPosterGalleryPreviewViewController loadingHeroEditingSceneViewController](self, "loadingHeroEditingSceneViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "removeObserver:", self);
        objc_msgSend(v21, "setForcesSceneForeground:", 0);
        objc_msgSend(v21, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeFromSuperview");

        -[PBFPosterGalleryPreviewViewController setLoadingHeroEditingSceneViewController:](self, "setLoadingHeroEditingSceneViewController:", 0);
        -[PBFPosterGalleryPreviewViewController loadingHeroPreviewView](self, "loadingHeroPreviewView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setShowsLoadingIndicator:", 0);

        -[PBFPosterGalleryPreviewViewController setLoadingHeroPreviewView:](self, "setLoadingHeroPreviewView:", 0);
        -[PBFPosterGalleryPreviewViewController loadingHeroActivityIndicationTimer](self, "loadingHeroActivityIndicationTimer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "invalidate");

        -[PBFPosterGalleryPreviewViewController setLoadingHeroActivityIndicationTimer:](self, "setLoadingHeroActivityIndicationTimer:", 0);
      }
      v25 = [PBFGalleryEditingSceneViewController alloc];
      objc_msgSend(MEMORY[0x1E0D7FAD0], "pbf_configurableOptionsForPreview:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FAE0], "pbf_configuredPropertiesForPreview:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:](v25, "initWithProvider:contents:configurableOptions:configuredProperties:", v17, v11, v26, v27);

      objc_msgSend(v8, "previewUniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryEditingSceneViewController setGalleryPreviewUniqueIdentifier:](v28, "setGalleryPreviewUniqueIdentifier:", v29);

      objc_msgSend(v8, "galleryOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryEditingSceneViewController setGalleryOptions:](v28, "setGalleryOptions:", v30);

      objc_msgSend(MEMORY[0x1E0D7FB48], "modelObjectCacheForPath:", v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "galleryOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        -[PBFGalleryEditingSceneViewController setDescriptorGalleryOptions:](v28, "setDescriptorGalleryOptions:", v32);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadPosterDescriptorGalleryOptionsForPath:error:", v11, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFGalleryEditingSceneViewController setDescriptorGalleryOptions:](v28, "setDescriptorGalleryOptions:", v35);

      }
      objc_msgSend(v9, "posterPreviewFrame");
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(v9, "window");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:toCoordinateSpace:", v44, v37, v39, v41, v43);
      -[PBFGalleryEditingSceneViewController setGalleryPreviewFrame:](v28, "setGalleryPreviewFrame:");

      objc_msgSend(v9, "window");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "screen");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "posterCornerRadius");
      -[PBFGalleryEditingSceneViewController setGalleryPreviewCornerRadius:](v28, "setGalleryPreviewCornerRadius:");

      objc_msgSend(v9, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v21;
      if (v48)
        v49 = objc_msgSend(v8, "presentationStyle");
      else
        v49 = 1;
      -[PBFGalleryEditingSceneViewController setGalleryPreviewView:](v28, "setGalleryPreviewView:", v48);
      -[PBFGalleryEditingSceneViewController setGalleryPresentationStyle:](v28, "setGalleryPresentationStyle:", v49);
      objc_msgSend(v8, "type");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryEditingSceneViewController setGalleryPreviewType:](v28, "setGalleryPreviewType:", v50);

      objc_msgSend(v9, "makeComplicationsPortalView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFGalleryEditingSceneViewController setGalleryPreviewComplicationsView:](v28, "setGalleryPreviewComplicationsView:", v51);

      -[PREditingSceneViewController setDelegate:](v28, "setDelegate:", self);
      v34 = v49 != 1;
      if (v49 == 1)
      {
        v61 = v48;
        PBFLogCommon();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v63, "posterExtensionBundleIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v67 = v53;
          _os_log_impl(&dword_1CB9FA000, v52, OS_LOG_TYPE_DEFAULT, "Delaying the start of presentation for hero poster until it finishes loading: %@", buf, 0xCu);

        }
        -[PBFPosterGalleryPreviewViewController setLoadingHeroEditingSceneViewController:](self, "setLoadingHeroEditingSceneViewController:", v28);
        -[PREditingSceneViewController addObserver:](v28, "addObserver:", self);
        -[PREditingSceneViewController setShowsContentWhenReady:](v28, "setShowsContentWhenReady:", 1);
        -[PBFGalleryEditingSceneViewController view](v28, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setHidden:", 1);
        -[PBFPosterGalleryPreviewViewController view](self, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "window");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bounds");
        objc_msgSend(v54, "setFrame:");

        -[PBFPosterGalleryPreviewViewController view](self, "view");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addSubview:", v54);

        v58 = (void *)MEMORY[0x1E0C99E88];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __74__PBFPosterGalleryPreviewViewController_presentPreview_withMode_fromView___block_invoke;
        v64[3] = &unk_1E86F4040;
        v64[4] = self;
        v65 = v9;
        objc_msgSend(v58, "scheduledTimerWithTimeInterval:repeats:block:", 0, v64, 0.5);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterGalleryPreviewViewController setLoadingHeroActivityIndicationTimer:](self, "setLoadingHeroActivityIndicationTimer:", v59);
        -[PRSceneViewController setForcesSceneForeground:](v28, "setForcesSceneForeground:", 1);

        v48 = v61;
      }

      v13 = v63;
    }
    else
    {
      v28 = (PBFGalleryEditingSceneViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBA8]), "initWithProvider:contents:previewing:", v17, v11, a4 == 1);
      v34 = 1;
    }
    -[PBFGalleryEditingSceneViewController setModalPresentationStyle:](v28, "setModalPresentationStyle:", 5);
    -[PBFGalleryEditingSceneViewController setModalPresentationCapturesStatusBarAppearance:](v28, "setModalPresentationCapturesStatusBarAppearance:", 1);
    if (v34)
    {
      -[PBFPosterGalleryPreviewViewController navigationControllerForPresentingSceneViewController:](self, "navigationControllerForPresentingSceneViewController:", v28);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v60, 1, 0);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "processIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v67 = v8;
    v68 = 2048;
    v69 = a4;
    v70 = 2112;
    v71 = v11;
    v72 = 2112;
    v73 = v33;
    _os_log_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "cannot present preview %@ (with mode=%lli) due to invalid lookup info : path=%@ processIdentity=%@", buf, 0x2Au);

  }
}

uint64_t __74__PBFPosterGalleryPreviewViewController_presentPreview_withMode_fromView___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadingHeroPreviewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsLoadingIndicator:", 0);

  objc_msgSend(*(id *)(a1 + 40), "setShowsLoadingIndicator:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingHeroPreviewView:", *(_QWORD *)(a1 + 40));
}

- (id)navigationControllerForPresentingSceneViewController:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3A40];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  objc_msgSend(v6, "setNavigationBarHidden:animated:", 1, 0);
  objc_msgSend(v6, "setModalPresentationStyle:", 5);
  objc_msgSend(v6, "setModalPresentationCapturesStatusBarAppearance:", 1);
  if (MEMORY[0x1D17A2F74](objc_msgSend(v6, "setTransitioningDelegate:", self)))
  {
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);

    objc_msgSend(v6, "_setClipsToBounds:", 0);
  }
  return v6;
}

- (void)presentRendererForPreview:(id)a3 fromView:(id)a4
{
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
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "posterDescriptorLookupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterDescriptorPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "posterDescriptorLookupInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterDescriptorExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D7F8C0];
  objc_msgSend(v9, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionInstanceForIdentity:instanceIdentifier:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBA8]), "initWithProvider:contents:", v13, v7);
    objc_msgSend(v14, "setModalPresentationStyle:", 0);
    -[PBFPosterGalleryPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "processIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "cannot present renderer for preview %@ due to invalid lookup info : path=%@ processIdentity=%@", (uint8_t *)&v16, 0x20u);

  }
}

- (void)presentConfiguratorForPreview:(id)a3 fromView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "posterDescriptorLookupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterDescriptorPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "posterDescriptorLookupInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterDescriptorExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D7F8C0];
  objc_msgSend(v9, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionInstanceForIdentity:instanceIdentifier:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D7FA40]);
    objc_msgSend(MEMORY[0x1E0D7FAD0], "pbf_configurableOptionsForPreview:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithProvider:contents:configurableOptions:", v13, v7, v15);

    -[PBFPosterGalleryPreviewViewController editingSceneDelegate](self, "editingSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v17);

    objc_msgSend(v16, "setModalPresentationStyle:", 0);
    -[PBFPosterGalleryPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "processIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v18;
    _os_log_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "cannot present configurator for preview %@ due to invalid lookup info : path=%@ processIdentity=%@", (uint8_t *)&v19, 0x20u);

  }
}

- (NSSet)displayedPreviewIdentifiers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_displayedPreviewIdentifiers, "copy");
}

- (NSSet)tappedPreviewIdentifiers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_tappedPreviewIdentifiers, "copy");
}

- (NSString)addedPreviewIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_addedPreviewIdentifier, "copy");
}

- (void)_closeButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  -[PBFPosterGalleryPreviewViewController activePresentationController](self, "activePresentationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__PBFPosterGalleryPreviewViewController__closeButtonTapped___block_invoke;
  v12 = &unk_1E86F2540;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, &v9);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "presentationControllerWillDismiss:", v8, v9, v10, v11, v12, v13);

}

uint64_t __60__PBFPosterGalleryPreviewViewController__closeButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "presentationControllerDidDismiss:", *(_QWORD *)(a1 + 40));
  return result;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  void *v6;
  CGPoint v7;
  CGSize v8;
  PREditingSceneViewControllerTopButtonLayout *result;
  id v10;

  v10 = a4;
  -[PBFPosterGalleryPreviewViewController editingSceneDelegate](self, "editingSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "topButtonLayoutForEditingSceneViewController:", v10);
    }
    else
    {
      retstr->trailingTopButtonFrame.origin = 0u;
      retstr->trailingTopButtonFrame.size = 0u;
      retstr->leadingTopButtonFrame.origin = 0u;
      retstr->leadingTopButtonFrame.size = 0u;
    }
  }
  else
  {
    v7 = (CGPoint)*MEMORY[0x1E0C9D648];
    v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    retstr->leadingTopButtonFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    retstr->leadingTopButtonFrame.size = v8;
    retstr->trailingTopButtonFrame.origin = v7;
    retstr->trailingTopButtonFrame.size = v8;
  }

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  id v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v12;
  NSClassFromString(CFSTR("PBFGalleryEditingSceneViewController"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.1(a2);
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3C5D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFGalleryEditingSceneViewControllerClass]"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.3(a2);
    goto LABEL_19;
  }

  v17 = 0x1EF9AF000uLL;
  if (a4 == 1)
  {
    objc_storeStrong((id *)&self->_addedPreviewIdentifier, self->_currentlyEditingPreviewIdentifier);
    v18 = v16;
    objc_msgSend(v18, "setGalleryDismissalAction:", 1);
    objc_msgSend(v18, "galleryOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modeSemanticTypeToCreate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2050000000;
      v21 = (void *)getDNDModeConfigurationServiceClass_softClass;
      v61 = getDNDModeConfigurationServiceClass_softClass;
      if (!getDNDModeConfigurationServiceClass_softClass)
      {
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __getDNDModeConfigurationServiceClass_block_invoke;
        v57[3] = &unk_1E86F2990;
        v57[4] = &v58;
        __getDNDModeConfigurationServiceClass_block_invoke((uint64_t)v57);
        v21 = (void *)v59[3];
      }
      v50 = v15;
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v58, 8);
      objc_msgSend(v22, "serviceForClientIdentifier:", CFSTR("com.apple.PosterBoard.gallery.MadeForFocus"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      objc_msgSend(v23, "createModeConfigurationUsingTemplateForModeSemanticType:error:", objc_msgSend(v20, "integerValue"), &v56);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v56;
      v52 = v24;
      if (v24)
      {
        v45 = v23;
        v25 = objc_alloc(MEMORY[0x1E0D7FB08]);
        objc_msgSend(v24, "mode");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "modeIdentifier");
        v48 = v13;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "mode");
        v46 = v20;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v47 = v18;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v25, "initWithActivityIdentifier:activityUUID:", v27, v29);

        v43 = objc_alloc(MEMORY[0x1E0D7FAE0]);
        objc_msgSend(v14, "titleStyleConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "complicationLayout");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "renderingConfiguration");
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "homeScreenConfiguration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "colorVariationsConfiguration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "quickActionsConfiguration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "suggestionMetadata");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "otherMetadata");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)v30;
        v44 = objc_msgSend(v43, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v49, v53, v42, v30, v31, v32, v33, v34, v35);

        v17 = 0x1EF9AF000;
        v13 = v48;

        v18 = v47;
        v20 = v46;

        v23 = v45;
        v37 = (void *)v53;
        v14 = (id)v44;
      }
      else
      {
        PBFLogCommon();
        v54 = objc_claimAutoreleasedReturnValue();
        v37 = v54;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[PBFPosterGalleryPreviewViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.2((uint64_t)v51, v54);
      }

      v15 = v50;
    }

  }
  -[PBFPosterGalleryPreviewViewController editingSceneDelegate](self, "editingSceneDelegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", v16, a4, v13, v14, v15);

  -[PBFPosterGalleryPreviewViewController setPresentingPreview:](self, "setPresentingPreview:", 0);
  v39 = *(int *)(v17 + 892);
  v40 = *(Class *)((char *)&self->super.super.super.isa + v39);
  *(Class *)((char *)&self->super.super.super.isa + v39) = 0;

}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBFPosterGalleryPreviewViewController loadingHeroEditingSceneViewController](self, "loadingHeroEditingSceneViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    PBFLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "contentsIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "provider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "Restarting of presentation for hero poster: %@", buf, 0xCu);

    }
    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");
    objc_msgSend(v9, "setHidden:", 0);
    -[PBFPosterGalleryPreviewViewController loadingHeroPreviewView](self, "loadingHeroPreviewView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryPreviewViewController navigationControllerForPresentingSceneViewController:](self, "navigationControllerForPresentingSceneViewController:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __91__PBFPosterGalleryPreviewViewController_editingSceneViewControllerDidFinishShowingContent___block_invoke;
    v17 = &unk_1E86F2540;
    v18 = v4;
    v19 = v10;
    v12 = v10;
    -[PBFPosterGalleryPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, &v14);
    -[PBFPosterGalleryPreviewViewController setLoadingHeroEditingSceneViewController:](self, "setLoadingHeroEditingSceneViewController:", 0, v14, v15, v16, v17);
    -[PBFPosterGalleryPreviewViewController setLoadingHeroPreviewView:](self, "setLoadingHeroPreviewView:", 0);
    -[PBFPosterGalleryPreviewViewController loadingHeroActivityIndicationTimer](self, "loadingHeroActivityIndicationTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    -[PBFPosterGalleryPreviewViewController setLoadingHeroActivityIndicationTimer:](self, "setLoadingHeroActivityIndicationTimer:", 0);
  }

}

uint64_t __91__PBFPosterGalleryPreviewViewController_editingSceneViewControllerDidFinishShowingContent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setForcesSceneForeground:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setShowsLoadingIndicator:", 0);
}

- (void)forwardAppearanceNotificationName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBFPosterGalleryPreviewViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v6;
  objc_msgSend(v6, "bs_filter:", &__block_literal_global_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        PBFLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = v4;
          v21 = 2114;
          v22 = v12;
          _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "Forwarding %{public}@ appearance notification to child view controller: %{public}@", buf, 0x16u);
        }

        objc_msgSend(v12, "forwardAppearanceNotificationName:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v9);
  }

}

uint64_t __75__PBFPosterGalleryPreviewViewController_forwardAppearanceNotificationName___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[_PBFGalleryCollectionViewController collectionView](self->_collectionViewController, "collectionView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v4, 1);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  PBFEditingZoomUpAnimationController *v14;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;

  v7 = a3;
  if (a5 == self
    && (objc_opt_self(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v7, "bottomViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v16 = v13;

    if (objc_msgSend(v16, "galleryPresentationStyle"))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v16, "galleryPreviewFrame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend(v16, "galleryPreviewCornerRadius");
      v26 = v25;
      objc_msgSend(v16, "galleryPreviewView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "galleryPreviewComplicationsView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomUpAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v27, v28, v18, v20, v22, v24, v26);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  PBFEditingZoomDownAnimationController *v3;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v40;
  CGRect v41;

  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v5, "bottomViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "galleryPreviewFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "galleryPreviewCornerRadius");
  v22 = v21;
  objc_msgSend(v12, "galleryPreviewView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "galleryPreviewComplicationsView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v12, "galleryPresentationStyle");
  if (!v25)
  {
    v40 = v22;
    objc_msgSend(v12, "galleryPreviewUniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PBFGalleryCollectionViewController previewFrameForScrollingPreviewWithIdentifierToVisible:](self->_collectionViewController, "previewFrameForScrollingPreviewWithIdentifierToVisible:", v26);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    if (!CGRectIsNull(v41))
    {
      -[_PBFGalleryCollectionViewController collectionView](self->_collectionViewController, "collectionView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "convertRect:toCoordinateSpace:", v32, x, y, width, height);
      v14 = v33;
      v16 = v34;
      v18 = v35;
      v20 = v36;

    }
    v3 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomDownAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v23, v24, v14, v16, v18, v20, v40);
    -[PBFPosterGalleryPreviewViewController delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v37, "galleryViewController:willUseAnimationController:forDismissingEditingViewControllerWithAction:", self, v3, objc_msgSend(v12, "galleryDismissalAction"));
      v38 = objc_claimAutoreleasedReturnValue();

      v3 = (PBFEditingZoomDownAnimationController *)v38;
    }

  }
  if (v25)
LABEL_14:
    v3 = 0;

  return v3;
}

- (void)galleryCollectionViewControllerWillDisplayPreview:(id)a3
{
  NSMutableSet *displayedPreviewIdentifiers;
  id v4;

  displayedPreviewIdentifiers = self->_displayedPreviewIdentifiers;
  objc_msgSend(a3, "previewUniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](displayedPreviewIdentifiers, "addObject:", v4);

}

- (void)galleryCollectionViewControllerDidSelectPreview:(id)a3 fromPreviewView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableSet *tappedPreviewIdentifiers;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PBFPosterGalleryPreviewViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "galleryViewController:didSelectPreview:fromPreviewView:", self, v7, v6);

  tappedPreviewIdentifiers = self->_tappedPreviewIdentifiers;
  objc_msgSend(v7, "previewUniqueIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](tappedPreviewIdentifiers, "addObject:", v10);
}

- (PBFPosterGalleryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (PBFPosterGalleryPreviewViewControllerDelegate)delegate
{
  return (PBFPosterGalleryPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditingSceneViewControllerDelegate)editingSceneDelegate
{
  return (PREditingSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingSceneDelegate);
}

- (void)setEditingSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editingSceneDelegate, a3);
}

- (BOOL)isPresentingPreview
{
  return self->_presentingPreview;
}

- (void)setPresentingPreview:(BOOL)a3
{
  self->_presentingPreview = a3;
}

- (PBFGalleryEditingSceneViewController)loadingHeroEditingSceneViewController
{
  return self->_loadingHeroEditingSceneViewController;
}

- (void)setLoadingHeroEditingSceneViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingHeroEditingSceneViewController, a3);
}

- (NSTimer)loadingHeroActivityIndicationTimer
{
  return self->_loadingHeroActivityIndicationTimer;
}

- (void)setLoadingHeroActivityIndicationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingHeroActivityIndicationTimer, a3);
}

- (PBFPosterGalleryPreviewView)loadingHeroPreviewView
{
  return self->_loadingHeroPreviewView;
}

- (void)setLoadingHeroPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingHeroPreviewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingHeroPreviewView, 0);
  objc_storeStrong((id *)&self->_loadingHeroActivityIndicationTimer, 0);
  objc_storeStrong((id *)&self->_loadingHeroEditingSceneViewController, 0);
  objc_destroyWeak((id *)&self->_editingSceneDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_addedPreviewIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyEditingPreviewIdentifier, 0);
  objc_storeStrong((id *)&self->_tappedPreviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayedPreviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

- (void)editingSceneViewController:(const char *)a1 userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)editingSceneViewController:(uint64_t)a1 userDidDismissWithAction:(NSObject *)a2 updatedConfiguration:updatedConfiguredProperties:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Could not create mode configuration on demand: %@", (uint8_t *)&v2, 0xCu);
}

- (void)editingSceneViewController:(const char *)a1 userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
