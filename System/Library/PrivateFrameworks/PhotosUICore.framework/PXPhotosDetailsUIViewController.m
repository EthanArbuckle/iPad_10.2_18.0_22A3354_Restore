@implementation PXPhotosDetailsUIViewController

- (PXPhotosDetailsUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 190, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsUIViewController initWithNibName:bundle:]");

  abort();
}

- (PXPhotosDetailsUIViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 194, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsUIViewController initWithCoder:]");

  abort();
}

- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 configuration:(id)a4
{
  id v8;
  id v9;
  PXPhotosDetailsUIViewController *v10;
  PXPhotosDetailsUIViewController *v11;
  id *p_context;
  uint64_t v13;
  uint64_t v14;
  PXViewControllerEventTracker *eventTracker;
  __int128 v16;
  uint64_t v17;
  NSMutableArray *widgetDisablingDimmingViews;
  void *v19;
  void *v20;
  PXPhotosDetailsSpecManager *v21;
  PXPhotosDetailsSpecManager *specManager;
  PXPhotosDetailsViewModel *v23;
  PXPhotosDetailsViewModel *viewModel;
  id v25;
  id *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id *v37;
  id v38;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v39.receiver = self;
  v39.super_class = (Class)PXPhotosDetailsUIViewController;
  v10 = -[PXPhotosDetailsUIViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    p_context = (id *)&v10->_context;
    objc_storeStrong((id *)&v10->_context, a3);
    objc_msgSend(*p_context, "registerChangeObserver:context:", v11, PXPhotosDetailsContextObservationContext_89342);
    if (v9)
      v13 = objc_msgSend(v9, "options");
    else
      v13 = 0;
    v11->_options = v13;
    PXViewControllerEventTrackerCreateWithPhotosDetailsContext(*p_context);
    v14 = objc_claimAutoreleasedReturnValue();
    eventTracker = v11->_eventTracker;
    v11->_eventTracker = (PXViewControllerEventTracker *)v14;

    v16 = *((_OWORD *)off_1E50B7FF8 + 1);
    *(_OWORD *)&v11->_contentEdgeInsets.top = *(_OWORD *)off_1E50B7FF8;
    *(_OWORD *)&v11->_contentEdgeInsets.bottom = v16;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    widgetDisablingDimmingViews = v11->__widgetDisablingDimmingViews;
    v11->__widgetDisablingDimmingViews = (NSMutableArray *)v17;

    -[PXPhotosDetailsUIViewController navigationItem](v11, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_setPreferredLargeTitleDisplayMode:", 2);

    -[UIViewController px_enableExtendedTraitCollection](v11, "px_enableExtendedTraitCollection");
    -[UIViewController px_extendedTraitCollection](v11, "px_extendedTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerChangeObserver:context:", v11, PXExtendedTraitCollectionObservationContext_89340);
    v21 = -[PXPhotosDetailsSpecManager initWithExtendedTraitCollection:detailsOptions:]([PXPhotosDetailsSpecManager alloc], "initWithExtendedTraitCollection:detailsOptions:", v20, v11->_options);
    specManager = v11->__specManager;
    v11->__specManager = v21;

    -[PXPhotosDetailsSpecManager registerChangeObserver:context:](v11->__specManager, "registerChangeObserver:context:", v11, PXSpecManagerObservationContext);
    v23 = objc_alloc_init(PXPhotosDetailsViewModel);
    viewModel = v11->__viewModel;
    v11->__viewModel = v23;

    -[PXPhotosDetailsViewModel registerChangeObserver:context:](v11->__viewModel, "registerChangeObserver:context:", v11, PXViewModelObservationContext_89341);
    v25 = *p_context;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __65__PXPhotosDetailsUIViewController_initWithContext_configuration___block_invoke;
    v36[3] = &unk_1E5124718;
    v26 = v11;
    v37 = v26;
    v27 = v9;
    v38 = v27;
    objc_msgSend(v25, "performChanges:", v36);
    objc_msgSend(v26, "_updateTitleAndSubtitle");
    v28 = (void *)objc_msgSend(v27, "barsControllerClass");
    if (!v28)
      v28 = (void *)objc_opt_class();
    objc_storeStrong(v26 + 138, v28);
    if ((objc_msgSend(v26[138], "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PXPhotosDetailsUIViewController.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[__barsControllerClass isSubclassOfClass:[PXPhotosDetailsBarsController class]]"));

    }
    objc_msgSend(v27, "unlockDeviceStatus");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v26[139];
    v26[139] = (id)v29;

    objc_msgSend(v27, "unlockDeviceHandlerWithActionType");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v26[140];
    v26[140] = (id)v31;

    objc_msgSend(v26, "px_enableOneUpPresentation");
  }

  return v11;
}

- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXPhotosDetailsConfiguration *v7;
  PXPhotosDetailsUIViewController *v8;

  v6 = a3;
  v7 = objc_alloc_init(PXPhotosDetailsConfiguration);
  -[PXPhotosDetailsConfiguration setOptions:](v7, "setOptions:", a4);
  v8 = -[PXPhotosDetailsUIViewController initWithContext:configuration:](self, "initWithContext:configuration:", v6, v7);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PXWidgetComposition setShouldUnloadAllWidgets:](self->_composition, "setShouldUnloadAllWidgets:", 1);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController dealloc](&v3, sel_dealloc);
}

- (PXDisplayAsset)presentedKeyAsset
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedKeyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAsset *)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  PXPhotosDetailsContext *context;
  PXPhotosDetailsViewModel *viewModel;
  void *v7;
  PXBarsController *v8;
  PXBarsController *barsController;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PXFeatureSpecManager spec](self->__specManager, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PXPhotosDetailsUIViewController options](self, "options") & 4) == 0
    && objc_msgSend(v3, "shouldInitializeBarsController"))
  {
    -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
    v4 = objc_alloc(self->__barsControllerClass);
    context = self->_context;
    viewModel = self->__viewModel;
    -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PXBarsController *)objc_msgSend(v4, "initWithContext:viewModel:extendedTraitCollection:", context, viewModel, v7);
    barsController = self->_barsController;
    self->_barsController = v8;

    -[PXBarsController setDelegate:](self->_barsController, "setDelegate:", self);
    -[PXBarsController setViewController:](self->_barsController, "setViewController:", self);
    -[PXBarsController setActionPerformerDelegate:](self->_barsController, "setActionPerformerDelegate:", self);
    -[PXPhotosDetailsUIViewController _updateBarSpec](self, "_updateBarSpec");
  }
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel__handleSpaceBar_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController addKeyCommand:](self, "addKeyCommand:", v10);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("."), 0, sel_favoriteAssets_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController addKeyCommand:](self, "addKeyCommand:", v11);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel_trashAssets_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController addKeyCommand:](self, "addKeyCommand:", v12);

}

- (void)_updateStatusBarTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  _BOOL4 IsEmpty;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;

  if (-[PXPhotosDetailsUIViewController shouldUpdateStatusBarTitle](self, "shouldUpdateStatusBarTitle"))
  {
    -[PXPhotosDetailsUIViewController barsController](self, "barsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXPhotosDetailsUIViewController barsController](self, "barsController");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contentTilingController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PXPhotosDetailsUIViewController _headerAssetWidgetTilingController](self, "_headerAssetWidgetTilingController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "currentLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentBounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v6, "currentLayout");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            v26.origin.x = v9,
            v26.origin.y = v11,
            v26.size.width = v13,
            v26.size.height = v15,
            IsEmpty = CGRectIsEmpty(v26),
            v17,
            !IsEmpty))
      {
        objc_msgSend(v7, "visibleRect");
        objc_msgSend(v6, "scrollController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "contentInset");
        PXEdgeInsetsInsetRect();
        v24 = v23;

        v27.origin.x = v9;
        v27.origin.y = v11;
        v27.size.width = v13;
        v27.size.height = v15;
        v20 = (CGRectGetMaxY(v27) - v24) / v15 < 0.379999995;
        v19 = v25;
        v21 = 1;
      }
      else
      {
        v19 = v25;
        v20 = 0;
        v21 = 0;
      }
      objc_msgSend(v19, "shouldShowTitleView:animated:", v20, v21);

    }
  }
}

- (unint64_t)_userEventSourceForDetailView:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  if ((-[PXPhotosDetailsUIViewController options](self, "options") & 2) != 0)
  {
    v6 = 5;
  }
  else
  {
    v5 = objc_msgSend(v4, "viewSourceOrigin");
    if ((unint64_t)(v5 - 2) > 5)
      v6 = 4;
    else
      v6 = qword_1A7C09758[v5 - 2];
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PXPhotosDetailsUIViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willViewDetailsWithCurrentContext:", v4);

  v6 = -[PXPhotosDetailsUIViewController _userEventSourceForDetailView:](self, "_userEventSourceForDetailView:", v4);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventSourceWillAppear:sender:", v6, self);

  -[PXPhotosDetailsUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, a3);
  -[PXFeatureSpecManager spec](self->__specManager, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void (**v57)(_QWORD);
  void *v58;
  _QWORD aBlock[5];
  _QWORD v60[4];
  NSObject *v61;
  PXPhotosDetailsUIViewController *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  PXPhotosDetailsUIViewController *v67;
  _QWORD v68[4];
  id v69;
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;
  CGRect v74;
  CGRect v75;

  v73 = *MEMORY[0x1E0C80C00];
  v70.receiver = self;
  v70.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewDidAppear:](&v70, sel_viewDidAppear_, a3);
  -[PXPhotosDetailsUIViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerAssetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didViewDetailsForAssetCollection:", v6);

  +[_PXPhotosDetailsPurger sharedPurger](_PXPhotosDetailsPurger, "sharedPurger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailsViewControllerDidAppear:", self);
  if ((self->_options & 0xA) == 0)
    objc_msgSend(v8, "purgeOldViewControllers");
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "px_isScrolledAtEdge:", 1))
  {
    -[PXPhotosDetailsUIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "safeAreaInsets");
    v21 = v13 + v20;
    v23 = v15 + v22;
    v25 = v17 - (v20 + v24);
    v27 = v19 - (v22 + v26);
    -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController context](self, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "regionOfInterestForContext:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rectInCoordinateSpace:", v31);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v74.origin.x = v21;
    v74.origin.y = v23;
    v74.size.width = v25;
    v74.size.height = v27;
    CGRectGetMaxY(v74);
    v75.origin.x = v33;
    v75.origin.y = v35;
    v75.size.width = v37;
    v75.size.height = v39;
    CGRectGetMaxY(v75);
    if (PXFloatEqualToFloatWithTolerance())
    {
      v40 = objc_msgSend(v10, "isScrollEnabled");

      if (v40)
        objc_msgSend(v10, "flashScrollIndicators");
    }
    else
    {

    }
  }
  if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
  {
    -[PXPhotosDetailsUIViewController siriActionActivity](self, "siriActionActivity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[PXPhotosDetailsUIViewController siriActionActivity](self, "siriActionActivity");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "becomeCurrent");
LABEL_23:

      goto LABEL_24;
    }
    if (objc_msgSend(v4, "viewSourceOrigin") == 5)
    {
      objc_msgSend(v6, "localizedTitle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v43;
      if (v43)
      {
        objc_msgSend(v43, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CA5920];
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke;
        v68[3] = &unk_1E5136628;
        v69 = v44;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2;
        v65[3] = &unk_1E5124740;
        v66 = v6;
        v67 = self;
        v46 = v44;
        objc_msgSend(v45, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.memory"), v68, v65);

      }
      else
      {
        PLUIGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v6;
          _os_log_impl(&dword_1A6789000, v46, OS_LOG_TYPE_ERROR, "No localized title found for memory: %@", buf, 0xCu);
        }
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "viewSourceOrigin") == 6)
    {
      objc_msgSend(v4, "people");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "fetchedObjects");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v42, "count") != 1)
        goto LABEL_23;
      objc_msgSend(v42, "firstObject");
      v46 = objc_claimAutoreleasedReturnValue();
      -[NSObject px_localizedName](v46, "px_localizedName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[PXPeopleUtilities isPersonHiddenFromPeopleHome:](PXPeopleUtilities, "isPersonHiddenFromPeopleHome:", v46)&& objc_msgSend(v48, "length"))
      {
        v49 = (void *)MEMORY[0x1E0CA5920];
        v50 = MEMORY[0x1E0C809B0];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_232;
        v63[3] = &unk_1E5136628;
        v64 = v48;
        v60[0] = v50;
        v60[1] = 3221225472;
        v60[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2_235;
        v60[3] = &unk_1E5124740;
        v61 = v46;
        v62 = self;
        objc_msgSend(v49, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.people"), v63, v60);

      }
LABEL_22:

      goto LABEL_23;
    }
  }
LABEL_24:
  -[PXPhotosDetailsUIViewController userActivityController](self, "userActivityController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[PXPhotosDetailsUIViewController eventTracker](self, "eventTracker");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "logViewControllerDidAppear:", self);

  if (!-[PXPhotosDetailsUIViewController didAppearOnce](self, "didAppearOnce"))
  {
    -[PXPhotosDetailsUIViewController setDidAppearOnce:](self, "setDidAppearOnce:", 1);
    v53 = objc_msgSend(v4, "contextHierarchyDepth");
    if (v53)
    {
      objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", v53, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20, 30, 50, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.photosDetailsNavigatedToDepth%@"), v54);
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v55, MEMORY[0x1E0C9AA70]);

    }
  }
  -[PXPhotosDetailsUIViewController initiallyPresentedAssetReference](self, "initiallyPresentedAssetReference");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_3;
    aBlock[3] = &unk_1E5149198;
    aBlock[4] = self;
    v57 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PXPhotosDetailsUIViewController presentedViewController](self, "presentedViewController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      -[PXPhotosDetailsUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v57);
    else
      v57[2](v57);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewDidDisappear:](&v25, sel_viewDidDisappear_, a3);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishViewingDetailsWithCurrentContext:", v5);

  -[PXPhotosDetailsUIViewController eventTracker](self, "eventTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logViewControllerDidDisappear:", self);

  -[PXPhotosDetailsUIViewController _setHasAppeared:](self, "_setHasAppeared:", 0);
  -[PXPhotosDetailsUIViewController _contextMenuInteraction](self, "_contextMenuInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeInteraction:", v8);

    -[PXPhotosDetailsUIViewController _setContextMenuInteraction:](self, "_setContextMenuInteraction:", 0);
  }
  -[PXPhotosDetailsUIViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPhotosDetailsUIViewController _userEventSourceForDetailView:](self, "_userEventSourceForDetailView:", v10);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventSourceDidDisappear:sender:", v11, self);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "contentViewDidDisappear");
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v15);
  }

  -[PXPhotosDetailsUIViewController siriActionActivity](self, "siriActionActivity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resignCurrent");

  -[PXPhotosDetailsUIViewController userActivityController](self, "userActivityController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 0);

  objc_msgSend(MEMORY[0x1E0CD1630], "clearCurrentMemoryForURLNavigation");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  if (!-[PXPhotosDetailsUIViewController _hasAppeared](self, "_hasAppeared")
    && -[UIViewController px_isVisible](self, "px_isVisible"))
  {
    -[PXPhotosDetailsUIViewController _setHasAppeared:](self, "_setHasAppeared:", 1);
    -[PXPhotosDetailsUIViewController _viewWillLayoutBeforeAppearing](self, "_viewWillLayoutBeforeAppearing");
  }
  -[PXPhotosDetailsUIViewController _updateScrollViewControllerContentInset](self, "_updateScrollViewControllerContentInset");
  -[PXPhotosDetailsUIViewController _updateWidgetsBackground](self, "_updateWidgetsBackground");
}

- (void)_viewWillLayoutBeforeAppearing
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  PXPhotosDetailsUIViewController *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsUIViewController _ensureScrollViewController](self, "_ensureScrollViewController");
  -[PXPhotosDetailsUIViewController _ensureComposition](self, "_ensureComposition");
  -[PXPhotosDetailsUIViewController composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLRelatedGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2112;
    v36 = v3;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "[%@] _viewWillLayoutBeforeAppearing composition=%@", buf, 0x16u);
  }

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "allowWidgetsContentLoading"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke;
    v30[3] = &unk_1E5149198;
    v31 = v3;
    objc_msgSend(v31, "performWidgetLoadingChange:", v30);
    objc_msgSend(v5, "defaultPriorityWidgetsLoadingDelay");
    v8 = v7;
    objc_initWeak((id *)buf, self);
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke_2;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v29, (id *)buf);
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
  -[PXPhotosDetailsUIViewController _updateStatusBarTitle](self, "_updateStatusBarTitle");
  -[PXPhotosDetailsUIViewController barsController](self, "barsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateIfNeeded");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
  -[PXPhotosDetailsUIViewController _setContextMenuInteraction:](self, "_setContextMenuInteraction:", v11);
  -[PXPhotosDetailsUIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addInteraction:", v11);

  +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "enableDetailsEffect");

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
    -[PXPhotosDetailsUIViewController _setPointerInteraction:](self, "_setPointerInteraction:", v15);
    -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addInteraction:", v15);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "contentViewWillAppear");
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController preferredContentSize](&v12, sel_preferredContentSize);
  v4 = v3;
  v6 = v5;
  if ((-[PXPhotosDetailsUIViewController options](self, "options") & 8) != 0)
  {
    -[PXPhotosDetailsUIViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v4 = v8;
    v6 = v9;

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)_dismissSelfIfSafeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  PXPhotosDetailsUIViewController *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  -[PXPhotosDetailsUIViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "visibleViewController");
    v7 = (PXPhotosDetailsUIViewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      v8 = (id)objc_msgSend(v6, "popViewControllerAnimated:", v3);
LABEL_9:
      v11 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    -[PXPhotosDetailsUIViewController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[PXPhotosDetailsUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
      goto LABEL_9;
    }
  }
  if (self->_delegateRespondsTo.requestDismissal)
  {
    -[PXPhotosDetailsUIViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "photosDetailsUIViewControllerRequestDismissal:", self);

  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (void)_updateScrollViewControllerContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[PXPhotosDetailsUIViewController contentEdgeInsets](self, "contentEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (PXEdgeInsetsIsNull())
  {
    -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 3)
    {
      v4 = *MEMORY[0x1E0DC49E8];
      v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    else
    {
      -[UIViewController px_safeAreaInsets](self, "px_safeAreaInsets");
      PXEdgeInsetsForEdges();
      v4 = v13;
      v6 = v14;
      v8 = v15;
      v10 = v16;
    }
  }
  -[PXPhotosDetailsUIViewController _scrollViewController](self, "_scrollViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInset:", v4, v6, v8, v10);

}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_contentEdgeInsets;
  void *v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_contentEdgeInsets = &self->_contentEdgeInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_contentEdgeInsets->top = top;
    p_contentEdgeInsets->left = left;
    p_contentEdgeInsets->bottom = bottom;
    p_contentEdgeInsets->right = right;
    -[PXPhotosDetailsUIViewController _scrollViewController](self, "_scrollViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PXPhotosDetailsUIViewController _updateScrollViewControllerContentInset](self, "_updateScrollViewControllerContentInset");
      -[PXPhotosDetailsUIViewController _updateWidgetsBackground](self, "_updateWidgetsBackground");
    }
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $C13B63C9D106B2E8FAA969CF8E5C47A3 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->requestDismissal = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->compositionDidChange = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)shouldUpdateStatusBarTitle
{
  return 1;
}

- (unint64_t)occludedContentEdges
{
  return 15;
}

- (BOOL)pu_handleSecondTabTap
{
  return -[PXPhotosDetailsUIViewController _scrollToBottomAnimated:](self, "_scrollToBottomAnimated:", 1);
}

- (BOOL)_scrollToBottomAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (!-[PXPhotosDetailsUIViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "px_isScrolledAtEdge:", 3);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v6, "px_scrollToEdge:animated:", 3, v3);
    v8 = (void *)MEMORY[0x1E0D09910];
    v14 = *MEMORY[0x1E0D09830];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.viewScrolledToBottom"), v11);

  }
  v12 = v7 ^ 1;

  return v12;
}

- (void)_handleWidgetsLoadingDelay
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (-[PXPhotosDetailsUIViewController _hasAppeared](self, "_hasAppeared"))
  {
    -[PXPhotosDetailsUIViewController composition](self, "composition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__PXPhotosDetailsUIViewController__handleWidgetsLoadingDelay__block_invoke;
    v5[3] = &unk_1E5149198;
    v6 = v3;
    v4 = v3;
    objc_msgSend(v4, "performWidgetLoadingChange:", v5);

  }
}

- (double)captionWidgetPreferredHeight
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[NSArray firstObject](self->__widgets, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPhotosDetailsUIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    objc_msgSend(v3, "preferredContentHeightForWidth:", v7);
    v4 = v8;
  }

  return v4;
}

- (double)captionWidgetCurrentContentHeight
{
  void *v2;
  double v3;
  double v4;

  -[NSArray firstObject](self->__widgets, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "currentContentHeight");
    v3 = v4;
  }

  return v3;
}

- (void)_ensureScrollViewController
{
  PXUIScrollViewController *v4;
  PXUIScrollViewController *v5;
  PXUIScrollViewController *scrollViewController;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  if (!self->__scrollViewController)
  {
    if ((-[PXPhotosDetailsUIViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 710, CFSTR("view not loaded"));

    }
    -[PXPhotosDetailsUIViewController view](self, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [PXUIScrollViewController alloc];
    objc_msgSend(v11, "bounds");
    v5 = -[PXUIScrollViewController initWithFrame:](v4, "initWithFrame:");
    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = v5;

    -[PXScrollViewController registerObserver:](self->__scrollViewController, "registerObserver:", self);
    -[PXUIScrollViewController setIgnoresSafeAreaInsets:](self->__scrollViewController, "setIgnoresSafeAreaInsets:", 1);
    -[PXUIScrollViewController scrollView](self->__scrollViewController, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "viewSourceOrigin") != 1;

    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(v11, "addSubview:", v7);
    -[PXUIScrollViewController setShowsVerticalScrollIndicator:](self->__scrollViewController, "setShowsVerticalScrollIndicator:", v9);
    -[PXPhotosDetailsUIViewController _updateScrollViewControllerContentInset](self, "_updateScrollViewControllerContentInset");

  }
}

- (void)_updateWidgetsBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
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
  double v27;
  void *v28;
  id v29;

  -[PXPhotosDetailsUIViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewSourceOrigin");

  -[PXPhotosDetailsUIViewController _widgetSpec](self, "_widgetSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sizeClass");

  if (v4 == 1 && v6 == 1)
  {
    -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollView");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsUIViewController widgetsBackgroundView](self, "widgetsBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colorWithAlphaComponent:", 0.6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v12);

      objc_msgSend(v10, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setZPosition:", -15000000.0);

      objc_msgSend(v29, "addSubview:", v10);
      -[PXPhotosDetailsUIViewController setWidgetsBackgroundView:](self, "setWidgetsBackgroundView:", v10);

    }
    objc_msgSend(v29, "contentSize");
    v15 = v14;
    objc_msgSend(v29, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PXPhotosDetailsUIViewController contentEdgeInsets](self, "contentEdgeInsets");
    if (v22 > 0.0)
    {
      -[PXPhotosDetailsUIViewController contentEdgeInsets](self, "contentEdgeInsets");
      v24 = v23;
      objc_msgSend(v29, "adjustedContentInset");
      v19 = v24 - v25;
    }
    objc_msgSend(v29, "bounds");
    v27 = v15 + v26 * 1.5;
    -[PXPhotosDetailsUIViewController widgetsBackgroundView](self, "widgetsBackgroundView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v17, v19, v21, v27);

  }
}

- (void)_loadComposition
{
  void *v4;
  PXWidgetComposition *v5;
  PXWidgetComposition *composition;
  void *v7;
  void *v8;
  PXTilingController *v9;
  PXTilingController *headerAssetWidgetTilingController;
  void *v11;
  void *v12;
  id v13;

  if (!self->_composition)
  {
    -[PXPhotosDetailsUIViewController _loadWidgets](self, "_loadWidgets");
    -[PXPhotosDetailsUIViewController _widgets](self, "_widgets");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController _scrollViewController](self, "_scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 768, CFSTR("missing scrollViewController"));

    }
    v5 = -[PXWidgetComposition initWithScrollViewController:]([PXWidgetComposition alloc], "initWithScrollViewController:", v4);
    composition = self->_composition;
    self->_composition = v5;

    -[PXPhotosDetailsUIViewController _updateCompositionSpec](self, "_updateCompositionSpec");
    -[PXWidgetComposition setDelegate:](self->_composition, "setDelegate:", self);
    -[PXWidgetComposition setWidgets:](self->_composition, "setWidgets:", v13);
    if (!-[PXPhotosDetailsUIViewController isEmpty](self, "isEmpty"))
      -[PXTilingControllerComposition setActive:](self->_composition, "setActive:", 1);
    -[PXPhotosDetailsUIViewController composition](self, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController _previewWidget](self, "_previewWidget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerTilingControllerForWidget:", v8);
    v9 = (PXTilingController *)objc_claimAutoreleasedReturnValue();
    headerAssetWidgetTilingController = self->__headerAssetWidgetTilingController;
    self->__headerAssetWidgetTilingController = v9;

    if (self->_delegateRespondsTo.compositionDidChange)
    {
      -[PXPhotosDetailsUIViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photosDetailsUIViewControllerCompositionDidChange:", self);

    }
  }
}

- (BOOL)_shouldShowMovieHeader
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXPhotosDetailsUIViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PXPhotosDetailsHeaderTileWidget canShowMovieHeaderForDataSource:](PXPhotosDetailsHeaderTileWidget, "canShowMovieHeaderForDataSource:", v3);

  return v4;
}

- (void)_loadWidgets
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void *, PXPhotosDetailsCaptionHashtagsWidget *, _QWORD);
  void *v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  PXPhotosDetailsCaptionHashtagsWidget *v49;
  id v50;
  PXPeopleCandidateWidget *v51;
  PXPeopleCandidateWidget *v52;
  id v53;
  _BOOL4 v54;
  _TtC12PhotosUICore31PhotosDetailsVisualLookupWidget *v55;
  id v56;
  _TtC12PhotosUICore23PhotosDetailsTimeWidget *v57;
  id v58;
  _TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget *v59;
  id v60;
  _TtC12PhotosUICore23PhotosDetailsEXIFWidget *v61;
  id v62;
  PXPhotosDetailsHeaderTileWidget *v63;
  PXPhotosDetailsHeaderTileWidget *v64;
  PXPhotosDetailsHeaderTileWidget *headerWidget;
  PXPhotosDetailsAssetsWidget *v66;
  PXUIWidget *v67;
  PXUIWidget *previewWidget;
  PXPeopleRelatedWidget *v69;
  id v70;
  PXUIMapWidget *v71;
  id v72;
  _TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget *v73;
  id v74;
  _TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget *v75;
  id v76;
  _TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget *v77;
  id v78;
  _TtC12PhotosUICore32PhotosDetailsSavedFromAppsWidget *v79;
  id v80;
  _TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget *v81;
  id v82;
  PXDemoTilingControllerWidget *v83;
  id v84;
  PXDemoViewWidget *v85;
  id v86;
  PXDemoDynamicViewWidget *v87;
  id v88;
  PXMemoriesLivingOnFeedbackWidget *v89;
  id v90;
  PXPhotosDetailsActionsUIWidget *v91;
  id v92;
  NSArray *v93;
  NSArray *widgets;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  os_signpost_id_t spid;
  unsigned int v99;
  int v100;
  int v101;
  id v102;
  NSObject *v103;
  unint64_t v104;
  int v105;
  _BOOL4 v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  _BOOL4 v112;
  int v113;
  int v114;
  id v115;
  void *v116;
  id v117;
  id obj;
  uint8_t v119[16];
  _QWORD v120[7];
  _QWORD v121[4];
  BOOL v122;
  _QWORD aBlock[5];
  id v124;
  id v125;
  id v126;
  uint8_t *v127;
  _QWORD *v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD v131[5];
  id v132;
  _QWORD v133[3];
  char v134;
  _QWORD v135[3];
  char v136;
  uint8_t buf[8];
  uint8_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;

  if (self->__widgets)
    return;
  v3 = os_log_create((const char *)*MEMORY[0x1E0D71100], "InfoPanelLoadWidgetsSignpost");
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InfoPanelWillLoadWidgets", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v138 = buf;
  v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__89371;
  v141 = __Block_byref_object_dispose__89372;
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v142 = (id)objc_claimAutoreleasedReturnValue();
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__89371;
  v131[4] = __Block_byref_object_dispose__89372;
  v132 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  obj = (id)objc_claimAutoreleasedReturnValue();
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v6;
  v104 = v4 - 1;
  spid = v4;
  -[PXPhotosDetailsUIViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke;
  aBlock[3] = &unk_1E5124768;
  aBlock[4] = self;
  v117 = v9;
  v124 = v117;
  v127 = buf;
  v115 = v7;
  v125 = v115;
  v102 = obj;
  v126 = v102;
  v128 = v135;
  v129 = v131;
  v130 = v133;
  v10 = (uint64_t (**)(void *, PXPhotosDetailsCaptionHashtagsWidget *, _QWORD))_Block_copy(aBlock);
  -[PXPhotosDetailsUIViewController _specManager](self, "_specManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spec");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PXPhotosDetailsUIViewController options](self, "options");
  v13 = objc_msgSend(v8, "showAssetsWidget");
  v14 = v12 & 2;
  if ((v12 & 2) != 0)
    v15 = 0;
  else
    v15 = v13;
  v114 = v15;
  v16 = 0;
  if ((objc_msgSend(v8, "showHeaderWidget") & ((v12 & 2) == 0)) == 1 && (v12 & 8) == 0)
  {
    v16 = -[PXPhotosDetailsUIViewController _shouldShowMovieHeader](self, "_shouldShowMovieHeader");
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_2;
    v121[3] = &__block_descriptor_33_e41_v16__0___PXMutablePhotosDetailsContext__8l;
    v122 = v16;
    objc_msgSend(v117, "performChanges:", v121);
  }
  v17 = objc_msgSend(v8, "showRelatedPeopleWidget");
  if ((v12 & 8) != 0)
    v18 = 0;
  else
    v18 = v17;
  v113 = v18;
  v19 = objc_msgSend(v8, "showPlacesWidget");
  if ((v12 & 8) != 0)
    v20 = 0;
  else
    v20 = v19;
  v111 = v20;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "canShowInternalUI");

  v23 = objc_msgSend(v8, "showSharedLibraryWidget");
  if ((v12 & 2) != 0)
    v24 = v23;
  else
    v24 = 0;
  v107 = v24;
  v25 = objc_msgSend(v8, "showAlbumAttributionWidget");
  if ((v12 & 2) != 0)
    v26 = v25;
  else
    v26 = 0;
  v106 = v26 == 1 && +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v27 = objc_msgSend(v8, "showAppAttributionWidget");
  v112 = v16;
  if ((v12 & 2) != 0)
    v28 = v27;
  else
    v28 = 0;
  v105 = v28;
  v29 = objc_msgSend(v8, "showVisualLookUpWidget");
  if ((v12 & 2) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = objc_msgSend(v8, "showTimeWidget");
  if ((v12 & 2) != 0)
    v32 = v31;
  else
    v32 = 0;
  v110 = v32;
  v33 = objc_msgSend(v8, "showEXIFWidget");
  if ((v12 & 2) != 0)
    v34 = v33;
  else
    v34 = 0;
  v108 = v34;
  if (v22)
  {
    v35 = objc_msgSend(v8, "showAssetDescriptionWidget");
    if ((v12 & 2) != 0)
      v36 = v35;
    else
      v36 = 0;
    v109 = v36;
  }
  else
  {
    v109 = 0;
  }
  +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "contentSyndicationIsAvailable"))
  {
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "showSyndicatedContentWidgetForSavedAssets");
    if ((v12 & 2) != 0)
      v40 = v39;
    else
      v40 = 0;
    v101 = v40;

  }
  else
  {
    v101 = 0;
  }

  if (objc_msgSend(v116, "enableActionsWidget"))
  {
    v41 = objc_msgSend(v8, "showActionsWidget");
    if ((v12 & 8) != 0)
      v42 = 0;
    else
      v42 = v41;
    v100 = v42;
  }
  else
  {
    v100 = 0;
  }
  v43 = objc_msgSend(v8, "showCaptionHashtagsWidget");
  if ((v12 & 2) != 0)
    v44 = v43;
  else
    v44 = 0;
  v45 = objc_msgSend(v8, "showPeopleInlineCandidateWidget");
  if ((v12 & 8) != 0)
    v46 = 0;
  else
    v46 = v45;
  if (v46 && (v12 & 2) == 0)
  {
    objc_msgSend(v117, "people");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v47, "count") == 1;

  }
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "enableMemoriesLivingOnFeedback"))
  {
    v99 = ((v12 & 8) == 0) & ~objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest");
    if (!v44)
      goto LABEL_67;
  }
  else
  {
    v99 = 0;
    if (!v44)
    {
LABEL_67:
      if (!v46)
        goto LABEL_74;
      goto LABEL_71;
    }
  }
  v49 = objc_alloc_init(PXPhotosDetailsCaptionHashtagsWidget);
  -[PXPhotosDetailsCaptionHashtagsWidget setWidgetEditingDelegate:](v49, "setWidgetEditingDelegate:", self);
  v50 = (id)v10[2](v10, v49, 0);

  if (!v46)
    goto LABEL_74;
LABEL_71:
  v51 = objc_alloc_init(PXPeopleCandidateWidget);
  v52 = v51;
  if ((v12 & 2) != 0)
    -[PXPeopleCandidateWidget setLoadPeopleFromFirstAsset:](v51, "setLoadPeopleFromFirstAsset:", 1);
  v53 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v52, 0);

LABEL_74:
  v54 = (v12 & 2) == 0;
  if (v30)
  {
    v55 = objc_alloc_init(_TtC12PhotosUICore31PhotosDetailsVisualLookupWidget);
    v56 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v55, 0);

  }
  if (v110)
  {
    v57 = objc_alloc_init(_TtC12PhotosUICore23PhotosDetailsTimeWidget);
    v58 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v57, 0);

  }
  if (v109)
  {
    v59 = objc_alloc_init(_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget);
    v60 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v59, 0);

  }
  if (v108)
  {
    v61 = objc_alloc_init(_TtC12PhotosUICore23PhotosDetailsEXIFWidget);
    v62 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v61, 0);

  }
  if (v112)
  {
    v63 = objc_alloc_init(PXPhotosDetailsHeaderTileWidget);
    v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v63, 0);
    v64 = (PXPhotosDetailsHeaderTileWidget *)objc_claimAutoreleasedReturnValue();
    headerWidget = self->__headerWidget;
    self->__headerWidget = v64;

    v54 = (v12 & 2) == 0;
  }
  if (v114)
  {
    v66 = objc_alloc_init(PXPhotosDetailsAssetsWidget);
    -[PXPhotosDetailsAssetsWidget setWidgetOneUpDelegate:](v66, "setWidgetOneUpDelegate:", self);
    v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v66, 2);
    v67 = (PXUIWidget *)objc_claimAutoreleasedReturnValue();
    previewWidget = self->__previewWidget;
    self->__previewWidget = v67;

    v54 = (v12 & 2) == 0;
  }
  if ((v113 & v54) != 0)
  {
    v69 = -[PXPeopleRelatedWidget initWithViewType:]([PXPeopleRelatedWidget alloc], "initWithViewType:", v14 >> 1);
    v70 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v69, 0);

  }
  if (v111)
  {
    v71 = -[PXUIMapWidget initWithEnableCuratedThumbnails:]([PXUIMapWidget alloc], "initWithEnableCuratedThumbnails:", (v12 & 2) == 0);
    -[PXUIMapWidget setShowAddressLink:](v71, "setShowAddressLink:", v14 != 0);
    v72 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v71, 1);

  }
  if (v107)
  {
    v73 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget);
    v74 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v73, 0);

  }
  if (v106)
  {
    v75 = objc_alloc_init(_TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget);
    v76 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v75, 0);

  }
  if (v101)
  {
    v77 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget);
    v78 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v77, 0);

  }
  if (v105)
  {
    v79 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSavedFromAppsWidget);
    v80 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v79, 0);

LABEL_99:
    v81 = objc_alloc_init(_TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget);
    v82 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v81, 0);

    goto LABEL_100;
  }
  if ((v12 & 2) != 0)
    goto LABEL_99;
LABEL_100:
  if ((v12 & 0x800) != 0)
  {
    v83 = objc_alloc_init(PXDemoTilingControllerWidget);
    v84 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v83, 1);

    v85 = objc_alloc_init(PXDemoViewWidget);
    v86 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v85, 1);

    v87 = objc_alloc_init(PXDemoDynamicViewWidget);
    v88 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v87, 1);

  }
  if (v99)
  {
    v89 = objc_alloc_init(PXMemoriesLivingOnFeedbackWidget);
    v90 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v89, 0);

  }
  if (v100)
  {
    v91 = objc_alloc_init(PXPhotosDetailsActionsUIWidget);
    -[PXPhotosDetailsActionsUIWidget setAllowRevealInMomentAction:](v91, "setAllowRevealInMomentAction:", (v12 >> 4) & 1);
    -[PXPhotosDetailsActionsUIWidget setAllowCreateMemoryAction:](v91, "setAllowCreateMemoryAction:", (v12 & 2) == 0);
    -[PXPhotosDetailsActionsUIWidget setAllowInternalFileRadarAction:](v91, "setAllowInternalFileRadarAction:", (v12 >> 6) & 1);
    v92 = (id)v10[2](v10, (PXPhotosDetailsCaptionHashtagsWidget *)v91, 0);

  }
  v93 = (NSArray *)objc_msgSend(v115, "copy");
  widgets = self->__widgets;
  self->__widgets = v93;

  -[PXPhotosDetailsUIViewController setEmpty:](self, "setEmpty:", -[NSArray count](self->__widgets, "count") == 0);
  -[PXPhotosDetailsUIViewController _updateAllWidgetsSpec](self, "_updateAllWidgetsSpec");
  -[PXPhotosDetailsUIViewController _updateAllWidgetsSelectionState](self, "_updateAllWidgetsSelectionState");
  objc_storeStrong((id *)&self->__widgetOptions, obj);
  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_3;
  v120[3] = &unk_1E51247B0;
  v120[4] = v135;
  v120[5] = v131;
  v120[6] = v133;
  objc_msgSend(v95, "performChanges:", v120);

  v96 = v103;
  v97 = v96;
  if (v104 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
  {
    *(_WORD *)v119 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v97, OS_SIGNPOST_INTERVAL_END, spid, "InfoPanelWillLoadWidgets", ", v119, 2u);
  }

  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);
  _Block_object_dispose(buf, 8);

}

- (void)_setWidgetSpec:(id)a3
{
  PXWidgetSpec *v5;
  PXWidgetSpec *v6;

  v5 = (PXWidgetSpec *)a3;
  if (self->__widgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__widgetSpec, a3);
    -[PXPhotosDetailsUIViewController _updateAllWidgetsSpec](self, "_updateAllWidgetsSpec");
    v5 = v6;
  }

}

- (void)_updateAllWidgetsSpec
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsUIViewController _widgetSpec](self, "_widgetSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "setSpec:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_updateAllWidgetsSelectionState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelecting");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "setSelecting:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateAllWidgetsFaceModeState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFaceModeEnabled");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "setFaceModeEnabled:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (unint64_t)_optionsForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[PXPhotosDetailsUIViewController _widgetOptions](self, "_widgetOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "environmentDidUpdateFocusInContext:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosDetailsUIViewController;
  -[PXPhotosDetailsUIViewController traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PXPhotosDetailsUIViewController traitCollection](self, "traitCollection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "controllerTraitCollectionDidChangeFrom:to:", v4, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsUIViewController;
  v7 = a4;
  -[PXPhotosDetailsUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PXPhotosDetailsUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5148240;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)_updateTitleAndSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPhotosDetailsUIViewController context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3470, "defaultHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayableTextForTitle:intent:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsUIViewController setTitle:](self, "setTitle:", v5);
  -[UIViewController px_setSubtitle:](self, "px_setSubtitle:", v6);
  -[PXPhotosDetailsUIViewController barsController](self, "barsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateBars");

}

- (void)_updateWidgetDisablingWithAnimationOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  uint64_t v53;
  int v54;
  PXPhotosDetailsUIViewController *v55;
  void *v56;
  id obj;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  uint64_t v65;
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  double v74;
  double v75;
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;

  v85 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSelecting");

  -[PXPhotosDetailsUIViewController _widgetDisablingDimmingViews](self, "_widgetDisablingDimmingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v55 = self;
  v56 = v6;
  v54 = v5;
  if (v5)
  {
    -[PXPhotosDetailsUIViewController _scrollViewController](self, "_scrollViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController _specManager](self, "_specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    -[PXPhotosDetailsUIViewController _widgets](self, "_widgets");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v58 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v79 != v58)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v15, "supportsSelection") & 1) == 0)
          {
            -[PXPhotosDetailsUIViewController composition](self, "composition");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "frameForWidget:", v15);
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v24 = v23;

            objc_msgSend(v8, "scrollView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "contentCoordinateSpace");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v26, v18, v20, v22, v24);
            v28 = v27;
            v30 = v29;
            v32 = v31;
            v34 = v33;

            v86.origin.x = v28;
            v86.origin.y = v30;
            v86.size.width = v32;
            v86.size.height = v34;
            if (!CGRectIsEmpty(v86))
            {
              if (v13 == objc_msgSend(v7, "count"))
              {
                v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v28, v30, v32, v34);
                objc_msgSend(v10, "dimmingColor");
                v36 = v7;
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setBackgroundColor:", v37);

                objc_msgSend(v35, "setOpaque:", 1);
                objc_msgSend(v35, "setAlpha:", 0.0);
                v38 = v36;
                self = v55;
                objc_msgSend(v38, "addObject:", v35);
                objc_msgSend(v8, "addSubviewToScrollView:", v35);
              }
              else
              {
                objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v35, "layer");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setZPosition:", 10000000.0);

              v71[0] = MEMORY[0x1E0C809B0];
              v71[1] = 3221225472;
              v71[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke;
              v71[3] = &unk_1E5124FD0;
              v72 = v35;
              v73 = v10;
              v74 = v28;
              v75 = v30;
              v76 = v32;
              v77 = v34;
              v40 = v35;
              +[PXBasicUIViewTileAnimator animateWithOptions:animations:completion:](PXBasicUIViewTileAnimator, "animateWithOptions:animations:completion:", v59, v71, 0);
              ++v13;

              v7 = v56;
            }

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      }
      while (v12);
    }

  }
  else if (objc_msgSend(v6, "count"))
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v41 = v56;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v68;
      v45 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v68 != v44)
            objc_enumerationMutation(v41);
          v65 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          v66[0] = v45;
          v66[1] = 3221225472;
          v66[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_2;
          v66[3] = &unk_1E5149198;
          v66[4] = v65;
          v64[0] = v45;
          v64[1] = 3221225472;
          v64[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_3;
          v64[3] = &unk_1E5147360;
          +[PXBasicUIViewTileAnimator animateWithOptions:animations:completion:](PXBasicUIViewTileAnimator, "animateWithOptions:animations:completion:", v59, v66, v64);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
      }
      while (v43);
    }

    objc_msgSend(v41, "removeAllObjects");
    self = v55;
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v61 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (v54)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v53 = objc_msgSend(v52, "supportsSelection");
            else
              v53 = 0;
          }
          else
          {
            v53 = 1;
          }
          objc_msgSend(v52, "setUserInteractionEnabled:", v53);
        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    }
    while (v49);
  }

}

- (void)_handleDeviceDidUnlock
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "deviceDidBecomeUnlocked");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_handleSpaceBar:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "spaceBarWasPressed");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)requestExitEditModeWithChangeSavingMode:(int64_t)a3
{
  NSArray *widgets;
  _QWORD v4[7];

  widgets = self->__widgets;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PXPhotosDetailsUIViewController_requestExitEditModeWithChangeSavingMode___block_invoke;
  v4[3] = &unk_1E51247D8;
  v4[5] = a3;
  v4[6] = a2;
  v4[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](widgets, "enumerateObjectsUsingBlock:", v4);
}

- (void)informFirstWidgetAvailableVisibleRectInEditMode:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  id v6;

  height = a3.size.height;
  width = a3.size.width;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setMaxVisibleSizeInEditMode:", width, height);

}

- (PXAssetSelectionUserActivityController)userActivityController
{
  PXAssetSelectionUserActivityController *userActivityController;
  PXAssetSelectionUserActivityController *v4;
  PXAssetSelectionUserActivityController *v5;

  userActivityController = self->_userActivityController;
  if (!userActivityController)
  {
    v4 = -[PXAssetSelectionUserActivityController initWithSelectionManager:]([PXAssetSelectionUserActivityController alloc], "initWithSelectionManager:", 0);
    v5 = self->_userActivityController;
    self->_userActivityController = v4;

    userActivityController = self->_userActivityController;
  }
  return userActivityController;
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isAnyItemSelected"))
  {
    -[PXPhotosDetailsUIViewController assetActionManager](self, "assetActionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetActionMenuBuilder menuElementsForActionManager:](PXAssetActionMenuBuilder, "menuElementsForActionManager:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)purgeIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PXPhotosDetailsHeaderTileWidget *headerWidget;
  PXUIWidget *previewWidget;
  NSMapTable *widgetOptions;
  PXTilingController *headerAssetWidgetTilingController;
  NSArray *widgets;
  UIContextMenuInteraction *contextMenuInteraction;
  UIPointerInteraction *pointerInteraction;
  PXWidgetComposition *composition;
  void *v19;
  PXUIScrollViewController *scrollViewController;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  PXPhotosDetailsUIViewController *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[UIViewController px_isVisible](self, "px_isVisible") && self->__scrollViewController)
  {
    PLMemoriesGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PXUIScrollViewController scrollView](self->__scrollViewController, "scrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = self;
      v28 = 2048;
      v29 = v4;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Purging contents of:%@ withScrollView:%p", buf, 0x16u);

    }
    -[PXPhotosDetailsUIViewController _widgets](self, "_widgets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "setWidgetDelegate:", 0);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
    headerWidget = self->__headerWidget;
    self->__headerWidget = 0;

    previewWidget = self->__previewWidget;
    self->__previewWidget = 0;

    widgetOptions = self->__widgetOptions;
    self->__widgetOptions = 0;

    headerAssetWidgetTilingController = self->__headerAssetWidgetTilingController;
    self->__headerAssetWidgetTilingController = 0;

    widgets = self->__widgets;
    self->__widgets = 0;

    contextMenuInteraction = self->__contextMenuInteraction;
    self->__contextMenuInteraction = 0;

    pointerInteraction = self->__pointerInteraction;
    self->__pointerInteraction = 0;

    -[PXWidgetComposition setShouldUnloadAllWidgets:](self->_composition, "setShouldUnloadAllWidgets:", 1);
    composition = self->_composition;
    self->_composition = 0;

    -[PXUIScrollViewController scrollView](self->__scrollViewController, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFromSuperview");

    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = 0;

  }
}

- (void)_updateCompositionSpec
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPhotosDetailsUIViewController _specManager](self, "_specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compositionSpec");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsUIViewController composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpec:", v6);

}

- (void)_updateWidgetSpec
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosDetailsUIViewController _specManager](self, "_specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetSpec");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsUIViewController _setWidgetSpec:](self, "_setWidgetSpec:", v5);
}

- (void)_updateBarSpec
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPhotosDetailsUIViewController _specManager](self, "_specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "barSpec");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsUIViewController barsController](self, "barsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarSpec:", v6);

}

- (int64_t)userInterfaceFeature
{
  return 6;
}

- (BOOL)widgetDeviceIsUnlocked:(id)a3
{
  void *v4;
  uint64_t (**v5)(void);
  char v6;

  -[PXPhotosDetailsUIViewController _unlockStatus](self, "_unlockStatus", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[PXPhotosDetailsUIViewController _unlockStatus](self, "_unlockStatus");
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v6 = v5[2]();

  return v6;
}

- (void)widget:(id)a3 performAfterUnlockingDeviceIfNecessary:(id)a4 failurehandler:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t (**v11)(void);
  char v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void (**v14)(_QWORD);
  void *v15;
  _QWORD aBlock[5];
  void (**v17)(_QWORD);
  id v18;

  v7 = (void (**)(_QWORD))a4;
  v8 = a5;
  -[PXPhotosDetailsUIViewController _unlockStatus](self, "_unlockStatus");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[PXPhotosDetailsUIViewController _unlockStatus](self, "_unlockStatus"),
        v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        v12 = v11[2](),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    -[PXPhotosDetailsUIViewController _unlockHandlerWithActionType](self, "_unlockHandlerWithActionType");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PXPhotosDetailsUIViewController_widget_performAfterUnlockingDeviceIfNecessary_failurehandler___block_invoke;
    aBlock[3] = &unk_1E5124800;
    aBlock[4] = self;
    v17 = v7;
    v14 = (void (**)(_QWORD))v8;
    v18 = v14;
    v15 = _Block_copy(aBlock);
    if (v13)
    {
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v15, 0);
    }
    else if (v14)
    {
      v14[2](v14);
    }

  }
  else
  {
    v7[2](v7);
  }

}

- (void)widget:(id)a3 didChangeEditingMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosDetailsUIViewController composition](self, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateFocusedTilingController");
    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "captionWidgetEnableVScrollingInEdit");

    objc_msgSend(v10, "setScrollEnabled:", v9);
  }
  else
  {
    objc_msgSend(v10, "setScrollEnabled:", 1);
  }
  -[PXPhotosDetailsUIViewController editingDidChange:](self, "editingDidChange:", v4);

}

- (BOOL)widgetCompositionHasContentAbove:(id)a3
{
  return (-[PXPhotosDetailsUIViewController options](self, "options", a3) >> 2) & 1;
}

- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  return -[PXPhotosDetailsUIViewController _dismissSelfIfSafeAnimated:](self, "_dismissSelfIfSafeAnimated:", a4);
}

- (BOOL)widgetComposition:(id)a3 shouldUseEdgeToEdgeLayoutForWidget:(id)a4
{
  return (-[PXPhotosDetailsUIViewController _optionsForWidget:](self, "_optionsForWidget:", a4) & 1) == 0;
}

- (int64_t)widgetComposition:(id)a3 loadingPriorityForWidget:(id)a4
{
  return (-[PXPhotosDetailsUIViewController _optionsForWidget:](self, "_optionsForWidget:", a4) >> 1) & 1;
}

- (BOOL)widgetComposition:(id)a3 widget:(id)a4 transitionToViewController:(id)a5 withTransitionType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 1472, CFSTR("undefined transition type"));

    goto LABEL_9;
  }
  if (a6 == 2)
  {
    -[PXPhotosDetailsUIViewController presentedViewController](self, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v15 = 1;
      -[PXPhotosDetailsUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (a6 != 1)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_13;
  }
  -[PXPhotosDetailsUIViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && -[UIViewController px_canPresentViewControllerAnimated:](self, "px_canPresentViewControllerAnimated:", 1))
  {
    v15 = 1;
    objc_msgSend(v14, "pushViewController:animated:", v13, 1);
  }
  else
  {
    v15 = 0;
  }

LABEL_13:
  return v15;
}

- (void)widgetComposition:(id)a3 widgetHasLoadedContentDataDidChange:(id)a4
{
  void *v5;

  if (self->_delegateRespondsTo.compositionDidChange)
  {
    -[PXPhotosDetailsUIViewController delegate](self, "delegate", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosDetailsUIViewControllerCompositionDidChange:", self);

  }
  -[PXPhotosDetailsUIViewController _ppt_informWidgetsLoadedHandlerIfNeeded](self, "_ppt_informWidgetsLoadedHandlerIfNeeded", a3, a4);
}

- (void)widgetComposition:(id)a3 didUpdateCompositionWithDefaultAnimationOptions:(id)a4
{
  id v5;
  id v6;
  id v7;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v6;
  }
  else
  {

    v5 = 0;
  }
  v7 = v5;
  -[PXPhotosDetailsUIViewController _updateWidgetDisablingWithAnimationOptions:](self, "_updateWidgetDisablingWithAnimationOptions:", v5);

}

- (id)presentationEnvironmentForWidgetComposition:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", self);
}

- (BOOL)shouldPresentOneUpForAssetReference:(id)a3
{
  return 1;
}

- (BOOL)photosDetailsAssetWidget:(id)a3 shouldPresentOneUpForAssetReference:(id)a4
{
  return -[PXPhotosDetailsUIViewController shouldPresentOneUpForAssetReference:](self, "shouldPresentOneUpForAssetReference:", a4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSpecManagerObservationContext != a5)
  {
    if ((void *)PXExtendedTraitCollectionObservationContext_89340 == a5)
    {
      if ((v6 & 0x14A) != 0)
      {
        v16 = v9;
        -[PXPhotosDetailsUIViewController _invalidateCompositionSpec](self, "_invalidateCompositionSpec");
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    v16 = v9;
    if ((void *)PXViewModelObservationContext_89341 != a5)
    {
      if ((void *)PXPhotosDetailsContextObservationContext_89342 != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsUIViewController.m"), 1550, CFSTR("unknown observation context"));

LABEL_19:
        v9 = v16;
        goto LABEL_20;
      }
      if ((v6 & 0x30) != 0)
      {
        -[PXPhotosDetailsUIViewController _updateTitleAndSubtitle](self, "_updateTitleAndSubtitle");
        -[PXPhotosDetailsUIViewController barsController](self, "barsController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateIfNeeded");

        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if ((v6 & 1) != 0)
    {
      -[PXPhotosDetailsUIViewController _updateAllWidgetsSelectionState](self, "_updateAllWidgetsSelectionState");
      +[PXBasicTileAnimationOptions defaultAnimationOptions](PXBasicTileAnimationOptions, "defaultAnimationOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsUIViewController _updateWidgetDisablingWithAnimationOptions:](self, "_updateWidgetDisablingWithAnimationOptions:", v12);

      -[PXPhotosDetailsUIViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");
      v9 = v16;
      if ((v6 & 0x10) == 0)
      {
LABEL_12:
        if ((v6 & 4) == 0)
          goto LABEL_20;
        goto LABEL_18;
      }
    }
    else if ((v6 & 0x10) == 0)
    {
      goto LABEL_12;
    }
    -[PXPhotosDetailsUIViewController _updateAllWidgetsFaceModeState](self, "_updateAllWidgetsFaceModeState");
    v9 = v16;
    if ((v6 & 4) == 0)
      goto LABEL_20;
LABEL_18:
    -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController userActivityController](self, "userActivityController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelectionManager:", v14);

    -[PXPhotosDetailsUIViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");
    goto LABEL_19;
  }
  if ((v6 & 1) != 0)
  {
    v16 = v9;
    -[PXPhotosDetailsUIViewController _invalidateCompositionSpec](self, "_invalidateCompositionSpec");
    -[PXPhotosDetailsUIViewController _invalidateWidgetSpec](self, "_invalidateWidgetSpec");
    -[PXPhotosDetailsUIViewController _invalidateBarSpec](self, "_invalidateBarSpec");
    goto LABEL_19;
  }
LABEL_20:

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "allowWidgetsContentLoading") & 1) != 0)
  {
    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "loadAllWidgetsContentOnScroll");

    if (v5)
    {
      -[PXPhotosDetailsUIViewController composition](self, "composition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__PXPhotosDetailsUIViewController_scrollViewControllerWillBeginScrolling___block_invoke;
      v9[3] = &unk_1E5149198;
      v10 = v6;
      v7 = v6;
      objc_msgSend(v7, "performWidgetLoadingChange:", v9);

    }
  }
  else
  {

  }
}

- (void)playMovieWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "Header widget (%@) is about to start playing Memories movie...", (uint8_t *)&v8, 0xCu);

  }
  -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playMovieWithCompletionHandler:", v4);

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  PXDiagnosticsItemProvider *v17;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDetailsUIViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v24, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE9B4260))
        {
          objc_msgSend(v15, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  if (!objc_msgSend(v9, "count"))
  {
    v17 = objc_alloc_init(PXDiagnosticsItemProvider);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PXPhotosDetailsUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v19[3] = &unk_1E5148158;
    v19[4] = self;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v17, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"), v19);
    objc_msgSend(v9, "addObject:", v17);

  }
  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "location");
  -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "location");
    objc_msgSend(v9, "imageViewBasicTileForPreviewingAtPoint:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v9, "cursorInteractionEnabled");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0DC3B28];
        objc_msgSend(v10, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        objc_msgSend(v14, "regionWithRect:identifier:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v14, "imageViewBasicTileForPreviewingAtPoint:", v11, v13),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "view"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isSelecting") ^ 1;

    -[PXPhotosDetailsUIViewController _previewViewControllerForLocation:](self, "_previewViewControllerForLocation:", x, y);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController _setPreviewViewController:](self, "_setPreviewViewController:", v19);
    v20 = (void *)MEMORY[0x1E0DC36B8];
    v21 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v28[3] = &unk_1E5135EB8;
    v29 = v19;
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v25[3] = &unk_1E5124828;
    v27 = v18;
    v26 = v29;
    v22 = v29;
    objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v28, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageViewBasicTileForPreviewingAtPoint:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v14);
  else
    v15 = 0;

  return v15;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a5;
  -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSelecting");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "previewViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[PXPhotosDetailsUIViewController _setPreviewCommitting:](self, "_setPreviewCommitting:", 1);
      objc_msgSend(v8, "setPreferredCommitStyle:", 1);
      -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "locationInView:", v13);
      -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __116__PXPhotosDetailsUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v16[3] = &unk_1E5148D08;
      v17 = v14;
      v18 = v11;
      v15 = v14;
      objc_msgSend(v8, "addCompletion:", v16);

    }
  }

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v14);
  v9 = v8;
  v11 = v10;

  -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v14, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXPhotosDetailsUIViewController _previewViewController](self, "_previewViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didDismissPreviewViewController:committing:", v13, -[PXPhotosDetailsUIViewController _previewCommitting](self, "_previewCommitting"));

  }
  -[PXPhotosDetailsUIViewController _setPreviewCommitting:](self, "_setPreviewCommitting:", 0);
  -[PXPhotosDetailsUIViewController _setPreviewViewController:](self, "_setPreviewViewController:", 0);

}

- (id)_widgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((PXPointIsNull() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(v12, "containsPoint:forCoordinateSpace:", v7, x, y))
          {
            v8 = v12;
            goto LABEL_14;
          }
        }
        v8 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v8;
}

- (id)_previewViewControllerForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentOffset");
  v9 = y + v8;
  -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v7, x, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewViewControllerAtLocation:fromSourceView:", v7, x, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_performAddToMemoriesAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosDetailsUIViewController tabBarController](self, "tabBarController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "px_canPerformAddToTabAnimationForTab:", 6))
  {
    -[PXPhotosDetailsUIViewController _headerWidget](self, "_headerWidget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createHeaderSnapshotViewForMemoryCreationAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "px_performAddToTabAnimation:withSnapshotView:", 6, v4);
  }

}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v3;
  PXBoopableItemsProvider *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXPhotosDetailsUIViewController boopableItemsProvider](self, "boopableItemsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PXBoopableItemsProvider);
    -[PXPhotosDetailsUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", v4);

    -[PXPhotosDetailsUIViewController _viewModel](self, "_viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsUIViewController boopableItemsProvider](self, "boopableItemsProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionManager:", v6);

  }
  return (UIActivityItemsConfigurationReading *)-[PXPhotosDetailsUIViewController boopableItemsProvider](self, "boopableItemsProvider");
}

- (void)invalidateBoopableItemsProvider
{
  -[PXPhotosDetailsUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", 0);
}

- (PXActionManager)assetActionManager
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "assetActionManager");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (PXActionManager *)v3;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  void *v5;
  _BOOL4 v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == 20)
  {
    objc_msgSend(v7, "actionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeCreateMemory")) & 1) != 0)
    {
      v6 = -[UIViewController px_isVisible](self, "px_isVisible");

      if (v6)
        -[PXPhotosDetailsUIViewController _performAddToMemoriesAnimation](self, "_performAddToMemoriesAnimation");
    }
    else
    {

    }
  }

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;

  v3 = a3;
  -[PXPhotosDetailsUIViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v5, "prepareForDismissingForced:", v3))
  {
    v6 = 0;
  }
  else
  {
    -[PXPhotosDetailsUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    v6 = 1;
  }

  return v6;
}

- (UIScrollView)ppt_scrollView
{
  void *v2;
  void *v3;

  -[PXPhotosDetailsUIViewController _scrollViewController](self, "_scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (void)ppt_toggleDiscloseWidgets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "localizedDisclosureTitle");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "length");

          if (v9)
            objc_msgSend(v7, "userDidSelectDisclosureControl");
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_ppt_setAllWidgetLoadingCompleteHandler:(id)a3
{
  void *v5;
  id ppt_allWidgetLoadingCompleteHandler;
  _QWORD block[5];

  v5 = _Block_copy(a3);
  ppt_allWidgetLoadingCompleteHandler = self->__ppt_allWidgetLoadingCompleteHandler;
  self->__ppt_allWidgetLoadingCompleteHandler = v5;

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PXPhotosDetailsUIViewController__ppt_setAllWidgetLoadingCompleteHandler___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_ppt_setVariationsWidgetLoadingCompleteHandler:(id)a3
{
  void *v5;
  id ppt_variationsWidgetLoadingCompleteHandler;
  _QWORD block[5];

  v5 = _Block_copy(a3);
  ppt_variationsWidgetLoadingCompleteHandler = self->__ppt_variationsWidgetLoadingCompleteHandler;
  self->__ppt_variationsWidgetLoadingCompleteHandler = v5;

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PXPhotosDetailsUIViewController__ppt_setVariationsWidgetLoadingCompleteHandler___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_ppt_informWidgetsLoadedHandlerIfNeeded
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsUIViewController _ppt_allWidgetLoadingCompleteHandler](self, "_ppt_allWidgetLoadingCompleteHandler");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_16;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPhotosDetailsUIViewController _widgets](self, "_widgets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {

LABEL_15:
    v3[2](v3);
    -[PXPhotosDetailsUIViewController _ppt_setAllWidgetLoadingCompleteHandler:](self, "_ppt_setAllWidgetLoadingCompleteHandler:", 0);
    goto LABEL_16;
  }
  v6 = v5;
  v7 = *(_QWORD *)v13;
  v8 = 1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      v11 = objc_opt_respondsToSelector();
      if ((v11 & v8 & 1) != 0)
        v8 = objc_msgSend(v10, "hasLoadedContentData");
      else
        v8 &= v11 ^ 1;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);

  if ((v8 & 1) != 0)
    goto LABEL_15;
LABEL_16:

}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXPhotosDetailsUIViewControllerDelegate)delegate
{
  return (PXPhotosDetailsUIViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXAssetReference)initiallyPresentedAssetReference
{
  return self->_initiallyPresentedAssetReference;
}

- (void)setInitiallyPresentedAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_initiallyPresentedAssetReference, a3);
}

- (PXViewControllerEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (NSArray)_widgets
{
  return self->__widgets;
}

- (NSMapTable)_widgetOptions
{
  return self->__widgetOptions;
}

- (PXPhotosDetailsHeaderTileWidget)_headerWidget
{
  return self->__headerWidget;
}

- (PXTilingController)_headerAssetWidgetTilingController
{
  return self->__headerAssetWidgetTilingController;
}

- (PXPhotosDetailsSpecManager)_specManager
{
  return self->__specManager;
}

- (NSMutableArray)_widgetDisablingDimmingViews
{
  return self->__widgetDisablingDimmingViews;
}

- (PXWidgetSpec)_widgetSpec
{
  return self->__widgetSpec;
}

- (BOOL)_hasAppeared
{
  return self->__hasAppeared;
}

- (void)_setHasAppeared:(BOOL)a3
{
  self->__hasAppeared = a3;
}

- (PXSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (void)_setSwipeSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->__swipeSelectionManager, a3);
}

- (Class)_barsControllerClass
{
  return self->__barsControllerClass;
}

- (id)_unlockStatus
{
  return self->__unlockStatus;
}

- (id)_unlockHandlerWithActionType
{
  return self->__unlockHandlerWithActionType;
}

- (PXUIWidget)_previewWidget
{
  return self->__previewWidget;
}

- (UIView)widgetsBackgroundView
{
  return self->_widgetsBackgroundView;
}

- (void)setWidgetsBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetsBackgroundView, a3);
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (id)_ppt_allWidgetLoadingCompleteHandler
{
  return self->__ppt_allWidgetLoadingCompleteHandler;
}

- (id)_ppt_variationsWidgetLoadingCompleteHandler
{
  return self->__ppt_variationsWidgetLoadingCompleteHandler;
}

- (UIContextMenuInteraction)_contextMenuInteraction
{
  return self->__contextMenuInteraction;
}

- (void)_setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__contextMenuInteraction, a3);
}

- (BOOL)_previewCommitting
{
  return self->__previewCommitting;
}

- (void)_setPreviewCommitting:(BOOL)a3
{
  self->__previewCommitting = a3;
}

- (UIViewController)_previewViewController
{
  return self->__previewViewController;
}

- (void)_setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->__previewViewController, a3);
}

- (UIPointerInteraction)_pointerInteraction
{
  return self->__pointerInteraction;
}

- (void)_setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__pointerInteraction, a3);
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (PXBarsController)barsController
{
  return self->_barsController;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXAssetCollectionActionPerformerDelegate)actionPerformerDelegate
{
  return (PXAssetCollectionActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
}

- (void)setActionPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionPerformerDelegate, a3);
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (PXWidgetComposition)composition
{
  return self->_composition;
}

- (void)setOccludedContentEdges:(unint64_t)a3
{
  self->_occludedContentEdges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->__pointerInteraction, 0);
  objc_storeStrong((id *)&self->__previewViewController, 0);
  objc_storeStrong((id *)&self->__contextMenuInteraction, 0);
  objc_storeStrong(&self->__ppt_variationsWidgetLoadingCompleteHandler, 0);
  objc_storeStrong(&self->__ppt_allWidgetLoadingCompleteHandler, 0);
  objc_storeStrong((id *)&self->_widgetsBackgroundView, 0);
  objc_storeStrong((id *)&self->__previewWidget, 0);
  objc_storeStrong(&self->__unlockHandlerWithActionType, 0);
  objc_storeStrong(&self->__unlockStatus, 0);
  objc_storeStrong((id *)&self->__barsControllerClass, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__widgetSpec, 0);
  objc_storeStrong((id *)&self->__widgetDisablingDimmingViews, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->__headerAssetWidgetTilingController, 0);
  objc_storeStrong((id *)&self->__headerWidget, 0);
  objc_storeStrong((id *)&self->__widgetOptions, 0);
  objc_storeStrong((id *)&self->__widgets, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_initiallyPresentedAssetReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
}

uint64_t __82__PXPhotosDetailsUIViewController__ppt_setVariationsWidgetLoadingCompleteHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_informWidgetsLoadedHandlerIfNeeded");
}

uint64_t __75__PXPhotosDetailsUIViewController__ppt_setAllWidgetLoadingCompleteHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_informWidgetsLoadedHandlerIfNeeded");
}

uint64_t __116__PXPhotosDetailsUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitPreviewViewController:", *(_QWORD *)(a1 + 40));
}

id __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "px_previewActionMenus");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __89__PXPhotosDetailsUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "assetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__PXPhotosDetailsUIViewController_scrollViewControllerWillBeginScrolling___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMinimumWidgetLoadingPriority:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setShouldLoadAllWidgets:", 1);
}

uint64_t __96__PXPhotosDetailsUIViewController_widget_performAfterUnlockingDeviceIfNecessary_failurehandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleDeviceDidUnlock");
    result = *(_QWORD *)(a1 + 40);
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (!result)
      return result;
  }
  return (*(uint64_t (**)(void))(result + 16))();
}

void __75__PXPhotosDetailsUIViewController_requestExitEditModeWithChangeSavingMode___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = objc_opt_respondsToSelector();
  v7 = v12;
  if ((v6 & 1) != 0)
  {
    v8 = objc_msgSend(v12, "isInEditMode");
    v7 = v12;
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = a1[5];
        if (v9 == 2)
          v10 = 2;
        else
          v10 = v9 == 1;
        objc_msgSend(v12, "requestExitEditWithChangesSavingMode:", v10);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXPhotosDetailsUIViewController.m"), 1216, CFSTR("requestExitEditWithChangesSavingMode: should be supported with isInEditMode"));

      }
      *a4 = 1;
      v7 = v12;
    }
  }

}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dimmingAlpha");
  objc_msgSend(v2, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __86__PXPhotosDetailsUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "composition");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidatePreferredContentHeightForAllWidgets");

}

id __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setWidgetUnlockDelegate:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setContext:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setWidgetInteractionDelegate:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EEA692E0)
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE9C46A0))
  {
    objc_msgSend(v5, "setOneUpPresentation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDelegate:", v5);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "hasContentForCurrentInput"))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    v8 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v5);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (*(_BYTE *)(v10 + 24))
    {
      v11 = 1;
    }
    else
    {
      v11 = objc_msgSend(v5, "supportsSelection");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(_BYTE *)(v10 + 24) = v11;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(v5, "selectionManager");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v15 + 24))
    {
      v16 = 1;
    }
    else
    {
      v16 = objc_msgSend(v5, "supportsFaceMode");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    }
    *(_BYTE *)(v15 + 24) = v16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setActionPerformerDelegate:", *(_QWORD *)(a1 + 32));
  return v5;
}

uint64_t __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldShowMovieHeader:", *(unsigned __int8 *)(a1 + 32));
}

void __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "setSupportsSelection:", v3);
  objc_msgSend(v4, "setSelectionManager:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(v4, "setSupportsFaceMode:", *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));

}

void __61__PXPhotosDetailsUIViewController__handleWidgetsLoadingDelay__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "setMinimumWidgetLoadingPriority:", 0);
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadAllWidgetsContentAfterDelay");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setShouldLoadAllWidgets:", 1);
}

uint64_t __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMinimumWidgetLoadingPriority:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setShouldLoadVisibleWidgets:", 1);
}

void __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleWidgetsLoadingDelay");

}

id __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return px_deferredLocalizedStringWithFormat(CFSTR("PXSiriActionsViewMemoryContainerTitle"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  v6 = CFSTR("identifier");
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUserInfoEntriesFromDictionary:", v5);

  objc_msgSend(v3, "px_setPersistentIdentifierFromAssetCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

id __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_232(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return px_deferredLocalizedStringWithFormat(CFSTR("PXSiriActionsViewPersonTitle"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2_235(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  v6 = CFSTR("identifier");
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUserInfoEntriesFromDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 40), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_previewWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_previewWidget");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "initiallyPresentedAssetReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentOneUpForAssetReference:animated:", v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "setInitiallyPresentedAssetReference:", 0);
  }
}

void __65__PXPhotosDetailsUIViewController_initWithContext_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024);
  v4 = a2;
  objc_msgSend(v4, "setViewModel:", v3);
  objc_msgSend(*(id *)(a1 + 40), "unlockDeviceStatus");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnlockDeviceStatus:", v5);

}

+ (void)preloadResources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXPhotosDetailsUIViewController_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadResources_onceToken != -1)
    dispatch_once(&preloadResources_onceToken, block);
}

uint64_t __51__PXPhotosDetailsUIViewController_preloadResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_preloadExtendedTraitCollection");
}

@end
