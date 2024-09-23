@implementation PUSlideshowViewController

- (PUSlideshowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PUSlideshowViewController initWithSession:](self, "initWithSession:", 0, a4);
}

- (PUSlideshowViewController)initWithCoder:(id)a3
{
  return -[PUSlideshowViewController initWithSession:](self, "initWithSession:", 0);
}

- (PUSlideshowViewController)initWithSession:(id)a3
{
  return -[PUSlideshowViewController initWithSession:mode:](self, "initWithSession:mode:", a3, 0);
}

- (PUSlideshowViewController)initWithSession:(id)a3 mode:(unint64_t)a4
{
  id v8;
  PUSlideshowViewController *v9;
  PUSlideshowViewController *v10;
  PUSlideshowViewControllerSpec *v11;
  PUSlideshowViewControllerSpec *spec;
  void *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowViewController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PUSlideshowViewController;
  v9 = -[PUSlideshowViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    v10->_mode = a4;
    v11 = -[PUSlideshowViewControllerSpec initWithMode:]([PUSlideshowViewControllerSpec alloc], "initWithMode:", a4);
    spec = v10->_spec;
    v10->_spec = v11;

    -[PUViewControllerSpec registerChangeObserver:](v10->_spec, "registerChangeObserver:", v10);
    -[PUSlideshowSession viewModel](v10->_session, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerChangeObserver:", v10);

    if (-[PUSlideshowViewControllerSpec shouldPauseWhenAppResignsActive](v10->_spec, "shouldPauseWhenAppResignsActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__handleAppWillResignActiveNotification_, *MEMORY[0x1E0DC4868], 0);

    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PUSlideshowViewController finishSession](self, "finishSession");
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUSlideshowViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  _QWORD v4[4];
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController viewDidLoad](&v6, sel_viewDidLoad);
  if (-[PUSlideshowViewControllerSpec shouldUseChromeBars](self->_spec, "shouldUseChromeBars"))
    -[PUSlideshowViewController _setupChromeBar](self, "_setupChromeBar");
  if (-[PUSlideshowViewControllerSpec shouldUseTapGesture](self->_spec, "shouldUseTapGesture"))
    -[PUSlideshowViewController _setupTapGesture](self, "_setupTapGesture");
  -[PUSlideshowSession viewModel](self->_session, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "currentState"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__PUSlideshowViewController_viewDidLoad__block_invoke;
    v4[3] = &unk_1E58ABD10;
    v5 = v3;
    objc_msgSend(v5, "performChanges:", v4);

  }
}

- (void)finishSession
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUSlideshowSession unregisterSlideshowDisplayContext:](self->_session, "unregisterSlideshowDisplayContext:", self);
  -[PUSlideshowSession viewModel](self->_session, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  -[PUViewControllerSpec unregisterChangeObserver:](self->_spec, "unregisterChangeObserver:", self);
  if (-[PUSlideshowViewControllerSpec shouldRegisterToAirplay](self->_spec, "shouldRegisterToAirplay"))
  {
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterContentProvider:", self);

    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterRouteObserver:", self);

  }
  if (-[PUSlideshowViewControllerSpec shouldPauseWhenAppResignsActive](self->_spec, "shouldPauseWhenAppResignsActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4868], 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  if (-[PUSlideshowViewControllerSpec shouldRegisterToAirplay](self->_spec, "shouldRegisterToAirplay"))
    -[PUSlideshowSession registerSlideshowDisplayContext:](self->_session, "registerSlideshowDisplayContext:", self);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[PUSlideshowViewControllerSpec shouldRegisterToAirplay](self->_spec, "shouldRegisterToAirplay"))
  {
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerContentProvider:", self);

  }
  else
  {
    -[PUSlideshowSession registerSlideshowDisplayContext:](self->_session, "registerSlideshowDisplayContext:", self);
  }
  -[PUSlideshowViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  PUSlideshowViewController *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[PUSlideshowSession viewModel](self->_session, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentState");
  LOBYTE(v2) = (v4 == 2) & ~-[PUSlideshowViewControllerSpec shouldShowChromeBars](v2->_spec, "shouldShowChromeBars");

  return (char)v2;
}

- (void)_setupChromeBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[PUSlideshowViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SLIDESHOW_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PUSlideshowViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 0, self, sel__settingsButtonTapped_);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 18, self, sel__playerStateButtonTapped_);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PUSlideshowViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v6);

  v15[0] = v11;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowViewController setToolbarItems:](self, "setToolbarItems:", v13);

  -[PUSlideshowViewController toolbarItems](self, "toolbarItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playerStateButtonItemIndex = objc_msgSend(v14, "indexOfObject:", v10);

}

- (void)_setupTapGesture
{
  UITapGestureRecognizer *v3;
  void *v4;
  UITapGestureRecognizer *tapGestureRecognizer;

  if (!self->_tapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapGesture_);
    -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 1);
    -[PUSlideshowViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v3);

    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v3;

  }
}

- (id)visibleAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUSlideshowSession presentationViewController](self->_session, "presentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleMediaObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectIdenticalTo:", v5);

  return v4;
}

- (void)_playerStateButtonTapped:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  -[PUSlideshowSession viewModel](self->_session, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentState");
  v5 = 2;
  if (v4 == 2)
    v5 = 3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PUSlideshowViewController__playerStateButtonTapped___block_invoke;
  v7[3] = &unk_1E58AACF0;
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)_tapGesture:(id)a3
{
  void *v4;
  char v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;

  if (!-[PUSlideshowViewControllerSpec isAirplayScreenAvailable](self->_spec, "isAirplayScreenAvailable", a3))
  {
    -[PUSlideshowSession viewModel](self->_session, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wantsChromeVisible");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PUSlideshowViewController__tapGesture___block_invoke;
    v7[3] = &unk_1E58AAD68;
    v8 = v4;
    v9 = v5;
    v6 = v4;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)_doneButtonTapped:(id)a3
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PUSlideshowSession viewModel](self->_session, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PUSlideshowViewController__doneButtonTapped___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_airplayButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0DC4308]);
  objc_msgSend(v10, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButtonItem:", v6);

  objc_msgSend(v10, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[PUSlideshowViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyDidPresentAirPlayRoutesFromSlideshow");

}

- (void)_settingsButtonTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  PUSlideshowSettingsViewController *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PUSlideshowViewController _slideshowSettingsViewController](self, "_slideshowSettingsViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PUSlideshowViewController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v5)
      goto LABEL_8;
  }
  else
  {
    v7 = -[PUSlideshowSettingsViewController initWithSession:]([PUSlideshowSettingsViewController alloc], "initWithSession:", self->_session);
    -[PUSlideshowSettingsViewController setDelegate:](v7, "setDelegate:", self);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    objc_msgSend(v5, "setModalPresentationStyle:", 7);
    -[PUSlideshowViewController _setSlideshowSettingsViewController:](self, "_setSlideshowSettingsViewController:", v5);

  }
  objc_msgSend(v5, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setBarButtonItem:", v9);
  -[PUSlideshowViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

LABEL_8:
}

- (void)_handleAppWillResignActiveNotification:(id)a3
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PUSlideshowSession viewModel](self->_session, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PUSlideshowViewController__handleAppWillResignActiveNotification___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_handleStateChange
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  -[PUSlideshowSession viewModel](self->_session, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentState");
  -[PUSlideshowViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  switch(v4)
  {
    case 1:
      v6 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke;
      v16[3] = &unk_1E58ABD10;
      v17 = v3;
      objc_msgSend(v17, "performChanges:", v16);
      -[PUSlideshowSession updatePresentationViewController](self->_session, "updatePresentationViewController");
      -[PUSlideshowSession viewModel](self->_session, "viewModel");
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_2;
      v14[3] = &unk_1E58ABD10;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v15;
      objc_msgSend(v7, "performChanges:", v14);

      v5 = v17;
      goto LABEL_7;
    case 2:
      -[OKPresentationViewController instantPlay](self->_currentPresentationController, "instantPlay");
      -[PUSlideshowViewController _updatePlayerButton](self, "_updatePlayerButton");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_3;
      v12[3] = &unk_1E58ABD10;
      v13 = v3;
      objc_msgSend(v13, "performChanges:", v12);
      v5 = v13;
      goto LABEL_7;
    case 3:
    case 5:
      -[OKPresentationViewController instantPause](self->_currentPresentationController, "instantPause");
      -[PUSlideshowViewController _updatePlayerButton](self, "_updatePlayerButton");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_4;
      v10[3] = &unk_1E58ABD10;
      v11 = v3;
      objc_msgSend(v11, "performChanges:", v10);
      v5 = v11;
      goto LABEL_7;
    case 4:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__PUSlideshowViewController__handleStateChange__block_invoke_5;
      v8[3] = &unk_1E58ABD10;
      v9 = v3;
      objc_msgSend(v9, "performChanges:", v8);
      v5 = v9;
LABEL_7:

      break;
    case 6:
      -[PUSlideshowViewController _dismissSlideshow](self, "_dismissSlideshow");
      break;
    default:
      break;
  }

}

- (void)_dismissSlideshow
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PUSlideshowViewController__dismissSlideshow__block_invoke;
  aBlock[3] = &unk_1E58ABD10;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PUSlideshowViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __46__PUSlideshowViewController__dismissSlideshow__block_invoke_2;
    v6[3] = &unk_1E58ABAC8;
    v7 = v4;
    -[PUSlideshowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)_installPresentationController:(id)a3
{
  OKPresentationViewController *v5;
  OKPresentationViewController **p_currentPresentationController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OKPresentationViewController *v14;

  v5 = (OKPresentationViewController *)a3;
  if (v5)
  {
    p_currentPresentationController = &self->_currentPresentationController;
    if (self->_currentPresentationController != v5)
    {
      v14 = v5;
      objc_storeStrong((id *)&self->_currentPresentationController, a3);
      -[OKPresentationViewController setDelegate:](*p_currentPresentationController, "setDelegate:", self);
      -[PUSlideshowViewController addChildViewController:](self, "addChildViewController:", *p_currentPresentationController);
      -[OKPresentationViewController view](*p_currentPresentationController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSlideshowViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v7, "setFrame:");

      -[OKPresentationViewController view](*p_currentPresentationController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAutoresizingMask:", 18);

      -[OKPresentationViewController view](*p_currentPresentationController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      -[PUSlideshowViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OKPresentationViewController view](*p_currentPresentationController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      -[OKPresentationViewController didMoveToParentViewController:](*p_currentPresentationController, "didMoveToParentViewController:", self);
      v5 = v14;
    }
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PUSlideshowViewController;
  -[PUSlideshowViewController viewWillLayoutSubviews](&v37, sel_viewWillLayoutSubviews);
  -[PUSlideshowSession settingsViewModel](self->_session, "settingsViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pluginIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("magazine"));

  if (v6)
  {
    -[PUSlideshowViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "px_peripheryInsets");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_firstKeyWindow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "px_peripheryInsets");
      v11 = v20;
      v13 = v21;
      v15 = v22;
      v17 = v23;

    }
    if (v13 != *(double *)(MEMORY[0x1E0DC49E8] + 8)
      || v11 != *MEMORY[0x1E0DC49E8]
      || v17 != *(double *)(MEMORY[0x1E0DC49E8] + 24)
      || v15 != *(double *)(MEMORY[0x1E0DC49E8] + 16))
    {
      -[PUSlideshowViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v13 + v28;
      v31 = v11 + v30;
      v33 = v32 - (v13 + v17);
      v35 = v34 - (v11 + v15);

      -[OKPresentationViewController view](self->_currentPresentationController, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setBounds:", v29, v31, v33, v35);

    }
  }

}

- (void)_removeCurrentPresentationController
{
  OKPresentationViewController *currentPresentationController;
  PUSlideshowViewController *v4;
  void *v5;
  OKPresentationViewController *v6;

  currentPresentationController = self->_currentPresentationController;
  if (currentPresentationController)
  {
    -[OKPresentationViewController parentViewController](currentPresentationController, "parentViewController");
    v4 = (PUSlideshowViewController *)objc_claimAutoreleasedReturnValue();

    if (v4 == self)
    {
      -[OKPresentationViewController willMoveToParentViewController:](self->_currentPresentationController, "willMoveToParentViewController:", 0);
      -[OKPresentationViewController view](self->_currentPresentationController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[OKPresentationViewController removeFromParentViewController](self->_currentPresentationController, "removeFromParentViewController");
      v6 = self->_currentPresentationController;
      self->_currentPresentationController = 0;

    }
  }
}

- (void)_removeSlideshowSettingsViewController
{
  void *v3;
  void *v4;
  char v5;

  -[PUSlideshowViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowViewController _slideshowSettingsViewController](self, "_slideshowSettingsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _removeSlideshowSettingsViewController_isDismissing;

  if (v3 == v4 && (v5 & 1) == 0)
  {
    _removeSlideshowSettingsViewController_isDismissing = 1;
    -[PUSlideshowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_88878);
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  PUSlideshowSession *session;
  id v7;
  id v8;
  id v9;

  v9 = a4;
  session = self->_session;
  v7 = a3;
  -[PUSlideshowSession viewModel](session, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    if (objc_msgSend(v9, "wantsChromeVisibleDidChange"))
    {
      -[PUSlideshowViewController _invalidateSpec](self, "_invalidateSpec");
      -[PUSlideshowViewController _updateIfNeeded](self, "_updateIfNeeded");
    }
    if (objc_msgSend(v9, "currentStateDidChange"))
      -[PUSlideshowViewController _handleStateChange](self, "_handleStateChange");
  }

}

- (void)_updateChromeVisibility
{
  -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 1, *MEMORY[0x1E0DC51A0]);
}

- (void)_updatePlayerButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUSlideshowSession viewModel](self->_session, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "currentState") == 2)
    v3 = 18;
  else
    v3 = 17;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", v3, self, sel__playerStateButtonTapped_);
  -[PUSlideshowViewController toolbarItems](self, "toolbarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", self->_playerStateButtonItemIndex, v4);
  -[PUSlideshowViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v6, 1);

}

- (void)_updateRouteObservation
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[PUSlideshowViewControllerSpec shouldObserveAirplayRoute](self->_spec, "shouldObserveAirplayRoute");
  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "registerRouteObserver:", self);
  else
    objc_msgSend(v4, "unregisterRouteObserver:", self);

  -[PUSlideshowViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateAirplayButton
{
  void *v3;
  id v4;

  if (-[PUSlideshowViewControllerSpec shouldShowAirplayButton](self->_spec, "shouldShowAirplayButton"))
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 111, self, sel__airplayButtonTapped_);
  else
    v4 = 0;
  -[PUSlideshowViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:animated:", v4, 1);

}

- (void)_updatePlaceholder
{
  _BOOL4 v3;
  PHPlaceholderView *v4;
  int v5;
  PHPlaceholderView *v6;
  void *v7;
  void *v8;
  PHPlaceholderView *v9;

  v3 = -[PUSlideshowViewControllerSpec shouldShowPlaceholder](self->_spec, "shouldShowPlaceholder");
  -[PUSlideshowViewController _slideshowPlaceholderView](self, "_slideshowPlaceholderView");
  v4 = (PHPlaceholderView *)objc_claimAutoreleasedReturnValue();
  v5 = !v3;
  if (v3 && !v4)
  {
    v6 = -[PHPlaceholderView initWithType:]([PHPlaceholderView alloc], "initWithType:", 1);
    -[PUSlideshowViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[PHPlaceholderView setFrame:](v6, "setFrame:");

    -[PHPlaceholderView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[PUSlideshowViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    v9 = v6;
LABEL_8:
    -[PUSlideshowViewController _setSlideshowPlaceHolderView:](self, "_setSlideshowPlaceHolderView:", v6);
    v4 = v9;
    goto LABEL_9;
  }
  if (!v4)
    v5 = 0;
  if (v5 == 1)
  {
    v9 = v4;
    -[PHPlaceholderView removeFromSuperview](v4, "removeFromSuperview");
    v6 = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUSlideshowViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUSlideshowViewController _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    if (-[PUSlideshowViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowViewController.m"), 452, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (void)_invalidateSpec
{
  -[PUSlideshowViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 1);
  -[PUSlideshowViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSpecIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  PUSlideshowViewControllerSpec *spec;
  _QWORD v10[5];
  char v11;
  BOOL v12;
  BOOL v13;

  if (-[PUSlideshowViewController _needsUpdateSpec](self, "_needsUpdateSpec"))
  {
    -[PUSlideshowViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 0);
    -[PUSlideshowSession viewModel](self->_session, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wantsChromeVisible");

    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "screenAvailability") != 0;

    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "routeAvailability") == 1;

    spec = self->_spec;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PUSlideshowViewController__updateSpecIfNeeded__block_invoke;
    v10[3] = &unk_1E58AA590;
    v10[4] = self;
    v11 = v4;
    v12 = v6;
    v13 = v8;
    -[PUViewControllerSpec performChanges:](spec, "performChanges:", v10);
  }
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  id v6;
  void *v7;
  PUSlideshowViewControllerSpec *v8;

  v8 = (PUSlideshowViewControllerSpec *)a3;
  v6 = a4;
  if (self->_spec == v8)
  {
    if (objc_msgSend(v6, "shouldShowChromeBarsChanged"))
    {
      -[PUSlideshowViewController _updateChromeVisibility](self, "_updateChromeVisibility");
      if (!-[PUSlideshowViewControllerSpec isChromeVisible](v8, "isChromeVisible"))
      {
        -[PUSlideshowViewController _slideshowSettingsViewController](self, "_slideshowSettingsViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          -[PUSlideshowViewController _removeSlideshowSettingsViewController](self, "_removeSlideshowSettingsViewController");
      }
      -[PUSlideshowViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    }
    if (objc_msgSend(v6, "shouldObserveAirplayRouteChanged"))
      -[PUSlideshowViewController _updateRouteObservation](self, "_updateRouteObservation");
    if (objc_msgSend(v6, "shouldShowAirplayButtonChanged"))
      -[PUSlideshowViewController _updateAirplayButton](self, "_updateAirplayButton");
    if (objc_msgSend(v6, "shouldShowPlaceholderChanged"))
      -[PUSlideshowViewController _updatePlaceholder](self, "_updatePlaceholder");
  }

}

- (BOOL)prefersStatusBarHidden
{
  return !-[PUSlideshowViewControllerSpec shouldShowChromeBars](self->_spec, "shouldShowChromeBars");
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return -[PUSlideshowViewControllerSpec shouldShowChromeBars](self->_spec, "shouldShowChromeBars");
}

- (BOOL)pu_wantsToolbarVisible
{
  return -[PUSlideshowViewControllerSpec shouldShowChromeBars](self->_spec, "shouldShowChromeBars");
}

- (BOOL)pu_wantsTabBarVisible
{
  return -[PUSlideshowViewControllerSpec shouldShowChromeBars](self->_spec, "shouldShowChromeBars");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_tapGestureRecognizer == a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (self->_tapGestureRecognizer == a3
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ancestorViewOfInstance:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)ancestorViewOfInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[PUSlideshowViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v4;
    if (v6 != v4)
    {
      objc_msgSend(v6, "ancestorViewOfInstance:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)couchPotatoPlaybackFinished
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PUSlideshowViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PUSlideshowViewController_couchPotatoPlaybackFinished__block_invoke;
  v5[3] = &unk_1E58ABD10;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  PUSlideshowViewController *v4;
  void *v5;

  -[PUSlideshowViewController _secondScreenBrowser](self, "_secondScreenBrowser", a3);
  v4 = (PUSlideshowViewController *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PUSlideshowViewController session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PUSlideshowViewController initWithSession:mode:]([PUSlideshowViewController alloc], "initWithSession:mode:", v5, 1);
    -[PUSlideshowViewController _setSecondScreenBrowser:](self, "_setSecondScreenBrowser:", v4);

  }
  return v4;
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  void *v4;

  if (!objc_msgSend(a3, "screenAvailability"))
  {
    -[PUSlideshowViewController _secondScreenBrowser](self, "_secondScreenBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishSession");

    -[PUSlideshowViewController _setSecondScreenBrowser:](self, "_setSecondScreenBrowser:", 0);
  }
  -[PUSlideshowViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)airPlayControllerRouteAvailabilityChanged:(id)a3
{
  -[PUSlideshowViewController _invalidateSpec](self, "_invalidateSpec", a3);
  -[PUSlideshowViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)slideshowSession:(id)a3 startDisplayingPresentationViewController:(id)a4
{
  -[PUSlideshowViewController _installPresentationController:](self, "_installPresentationController:", a4);
}

- (void)slideshowSession:(id)a3 stopDisplayingPresentationViewController:(id)a4
{
  if (self->_currentPresentationController == a4)
    -[PUSlideshowViewController _removeCurrentPresentationController](self, "_removeCurrentPresentationController", a3);
}

- (PUSlideshowSession)session
{
  return self->_session;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (PUSlideshowViewControllerDelegate)delegate
{
  return (PUSlideshowViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUSlideshowViewController)_secondScreenBrowser
{
  return self->__secondScreenBrowser;
}

- (void)_setSecondScreenBrowser:(id)a3
{
  objc_storeStrong((id *)&self->__secondScreenBrowser, a3);
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (PHPlaceholderView)_slideshowPlaceholderView
{
  return self->__slideshowPlaceholderView;
}

- (void)_setSlideshowPlaceHolderView:(id)a3
{
  objc_storeStrong((id *)&self->__slideshowPlaceholderView, a3);
}

- (UIViewController)_slideshowSettingsViewController
{
  return self->__slideshowSettingsViewController;
}

- (void)_setSlideshowSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->__slideshowSettingsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slideshowSettingsViewController, 0);
  objc_storeStrong((id *)&self->__slideshowPlaceholderView, 0);
  objc_storeStrong((id *)&self->__secondScreenBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
}

uint64_t __56__PUSlideshowViewController_couchPotatoPlaybackFinished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 5);
}

uint64_t __48__PUSlideshowViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setChromeVisible:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setAirplayScreenAvailable:", *(unsigned __int8 *)(a1 + 41));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setAirplayRouteAvailable:", *(unsigned __int8 *)(a1 + 42));
}

void __67__PUSlideshowViewController__removeSlideshowSettingsViewController__block_invoke()
{
  _removeSlideshowSettingsViewController_isDismissing = 0;
}

uint64_t __46__PUSlideshowViewController__dismissSlideshow__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1024));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1024));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "visibleAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slideshowViewControllerDidFinish:withVisibleAssets:", v5, v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishSession");
}

uint64_t __46__PUSlideshowViewController__dismissSlideshow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", 1);
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 2);
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", 0);
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", 1);
}

uint64_t __47__PUSlideshowViewController__handleStateChange__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", 1);
}

uint64_t __68__PUSlideshowViewController__handleAppWillResignActiveNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 3);
}

uint64_t __47__PUSlideshowViewController__doneButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 6);
}

uint64_t __41__PUSlideshowViewController__tapGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:changeReason:", *(_BYTE *)(a1 + 40) == 0, 1);
}

uint64_t __54__PUSlideshowViewController__playerStateButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__PUSlideshowViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 1);
}

@end
