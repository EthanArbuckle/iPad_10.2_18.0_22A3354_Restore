@implementation SKUIRedeemCameraViewController

- (SKUIRedeemCameraViewController)initWithRedeemCategory:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIRedeemCameraViewController *v13;
  SKUIRedeemCameraViewController *v14;
  objc_super v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIRedeemCameraViewController initWithRedeemCategory:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIRedeemCameraViewController;
  v13 = -[SKUIRedeemCameraViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    v13->_category = a3;
    v13->_fullscreen = 0;
    -[SKUIRedeemCameraViewController setEdgesForExtendedLayout:](v13, "setEdgesForExtendedLayout:", 0);
  }
  return v14;
}

- (SKUIRedeemCameraViewController)initWithRedeemCategoryFullscreen:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIRedeemCameraViewController *result;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIRedeemCameraViewController initWithRedeemCategoryFullscreen:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIRedeemCameraViewController;
  result = -[SKUIRedeemCameraViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (result)
  {
    result->_category = a3;
    result->_fullscreen = 1;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E73BC8F0, v4);

  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemCameraViewController;
  -[SKUIRedeemCameraViewController dealloc](&v5, sel_dealloc);
}

- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
  -[SKUIRedeemCameraViewController _performRedeemOperationWithCode:cameraRecognized:allowOverride:completion:](self, "_performRedeemOperationWithCode:cameraRecognized:allowOverride:completion:", a3, a4, 0, a5);
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *redeemButton;
  UIBarButtonItem *v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *activityBarButtonItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *flipButton;
  UIBarButtonItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SKUIFullscreenRedeemCameraView *v23;
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
  id v34;

  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemCameraViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v4, "setAction:", sel__cancelAction_);
  objc_msgSend(v4, "setTarget:", self);
  if (v34)
    objc_msgSend(v34, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_CANCEL_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_CANCEL_BUTTON"), 0, CFSTR("Redeem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v3, "setLeftBarButtonItem:", v4);
  v6 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DC34F0]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v6;

  -[UIBarButtonItem setAction:](self->_redeemButton, "setAction:", sel__redeemAction_);
  -[UIBarButtonItem setTarget:](self->_redeemButton, "setTarget:", self);
  v8 = self->_redeemButton;
  if (v34)
    objc_msgSend(v34, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_REDEEM_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_REDEEM_BUTTON"), 0, CFSTR("Redeem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v8, "setTitle:", v9, v3);

  -[UIBarButtonItem setStyle:](self->_redeemButton, "setStyle:", 2);
  -[UIBarButtonItem setEnabled:](self->_redeemButton, "setEnabled:", -[NSString length](self->_initialCode, "length") != 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
  objc_msgSend(v10, "startAnimating");
  v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v10);
  activityBarButtonItem = self->_activityBarButtonItem;
  self->_activityBarButtonItem = v11;

  if ((unint64_t)objc_msgSend(MEMORY[0x1E0D182F0], "isCRCodeRedeemerAvailable") >= 2)
  {
    v13 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DC34F0]);
    flipButton = self->_flipButton;
    self->_flipButton = v13;

    -[UIBarButtonItem setAction:](self->_flipButton, "setAction:", sel__flipAction_);
    -[UIBarButtonItem setTarget:](self->_flipButton, "setTarget:", self);
    v15 = self->_flipButton;
    v16 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("CameraFlip"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setImage:](v15, "setImage:", v18);

  }
  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 1);
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "landingImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_SKUIRedeemPreflightImagesDidLoad_, 0x1E73BC8F0, v22);

  if (self->_fullscreen)
  {
    v23 = -[SKUIFullscreenRedeemCameraView initWithClientContext:]([SKUIFullscreenRedeemCameraView alloc], "initWithClientContext:", v34);
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_TITLE"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_TITLE"), 0, CFSTR("Redeem"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v33;
    -[SKUIRedeemCameraViewController setTitle:](self, "setTitle:", v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v23 = -[SKUIIPadRedeemCameraView initWithClientContext:]([SKUIIPadRedeemCameraView alloc], "initWithClientContext:", v34);
      v28 = v33;
    }
    else
    {
      v23 = -[SKUIRedeemCameraView initWithClientContext:]([SKUIRedeemCameraView alloc], "initWithClientContext:", v34);
      v28 = v33;
      if (-[SKUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore"))
      {
        -[SKUIRedeemStepViewController configuration](self, "configuration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "ITunesPassConfiguration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIFullscreenRedeemCameraView setITunesPassConfiguration:](v23, "setITunesPassConfiguration:", v32);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIFullscreenRedeemCameraView setBackgroundColor:](v23, "setBackgroundColor:", v30);

  -[SKUIFullscreenRedeemCameraView setText:](v23, "setText:", self->_initialCode);
  -[SKUIFullscreenRedeemCameraView setImage:](v23, "setImage:", v20);
  -[SKUIFullscreenRedeemCameraView setDelegate:](v23, "setDelegate:", self);
  -[SKUIFullscreenRedeemCameraView start](v23, "start");
  -[SKUIRedeemCameraViewController setView:](self, "setView:", v23);

}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (id)contentScrollView
{
  return 0;
}

- (void)_cancelAction:(id)a3
{
  void *v4;
  id v5;

  -[SKUIRedeemCameraViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_redeemAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  -[SKUIRedeemCameraViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 2);
  -[SKUIRedeemCameraViewController _setEnabled:](self, "_setEnabled:", 0);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SKUIRedeemCameraViewController__redeemAction___block_invoke;
  v7[3] = &unk_1E73A3868;
  objc_copyWeak(&v8, &location);
  -[SKUIRedeemCameraViewController _performRedeemOperationWithCode:cameraRecognized:allowOverride:completion:](self, "_performRedeemOperationWithCode:cameraRecognized:allowOverride:completion:", v6, 0, 1, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __48__SKUIRedeemCameraViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_redeemDidFinish:error:", v6, v5);

}

- (void)_flipAction:(id)a3
{
  -[CRCodeRedeemerController toggleCamera](self->_camera, "toggleCamera", a3);
}

- (void)cancelRedeemerViewForSKUIRedeemCameraView:(id)a3
{
  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 1);
  -[CRCodeRedeemerController cancel](self->_camera, "cancel");
}

- (void)presentFullScreenCameraViewForSKUIRedeemCameraView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIRedeemViewControllerLegacy *v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (-[SKUIRedeemCameraViewController cameraOverrideDelegate](self, "cameraOverrideDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    -[SKUIRedeemCameraViewController cameraOverrideDelegate](self, "cameraOverrideDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__SKUIRedeemCameraViewController_presentFullScreenCameraViewForSKUIRedeemCameraView___block_invoke;
    v14[3] = &unk_1E73A3B60;
    v14[4] = self;
    objc_msgSend(v8, "overrideIPadRedeemCamera:completion:", self, v14);

  }
  else
  {
    v13 = -[SKUIRedeemViewControllerLegacy initWithRedeemCategory:]([SKUIRedeemViewControllerLegacy alloc], "initWithRedeemCategory:", 0);
    -[SKUIRedeemCameraViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemViewControllerLegacy setCameraDelegate:](v13, "setCameraDelegate:", v9);

    -[SKUIRedeemViewControllerLegacy setModalPresentationStyle:](v13, "setModalPresentationStyle:", 0);
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemViewControllerLegacy setClientContext:](v13, "setClientContext:", v10);

    -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemViewControllerLegacy setOperationQueue:](v13, "setOperationQueue:", v11);

    -[SKUIRedeemViewControllerLegacy setCameraRedeemVisible:](v13, "setCameraRedeemVisible:", 1);
    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemViewControllerLegacy setRedeemConfiguration:](v13, "setRedeemConfiguration:", v12);

    -[SKUIRedeemViewControllerLegacy setShouldPerformInitialOperationOnAppear:](v13, "setShouldPerformInitialOperationOnAppear:", 0);
    -[SKUIRedeemCameraViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

uint64_t __85__SKUIRedeemCameraViewController_presentFullScreenCameraViewForSKUIRedeemCameraView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "redeemCameraViewController:didFinishWithRedeem:", 0, a2);
}

- (id)redeemerViewForSKUIRedeemCameraView:(id)a3
{
  CRCodeRedeemerController *v4;
  CRCodeRedeemerController *camera;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 0);
  if (!self->_camera)
  {
    v4 = (CRCodeRedeemerController *)objc_alloc_init(MEMORY[0x1E0D182F0]);
    camera = self->_camera;
    self->_camera = v4;

    -[SKUIRedeemCameraViewController addChildViewController:](self, "addChildViewController:", self->_camera);
    -[CRCodeRedeemerController setDelegate:](self->_camera, "setDelegate:", self);
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_TITLE"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_TITLE"), 0, CFSTR("Redeem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemCameraViewController setTitle:](self, "setTitle:", v10);

  }
  return (id)-[CRCodeRedeemerController view](self->_camera, "view");
}

- (void)showITunesPassLearnMoreForSKUIRedeemCameraView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIRedeemITunesPassLearnMoreViewController *v8;

  v8 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreViewController);
  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v4);

  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v5);

  -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  -[SKUIRedeemCameraViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)SKUIRedeemCameraView:(id)a3 textFieldDidChange:(id)a4
{
  _BOOL4 v5;
  UIBarButtonItem *redeemButton;
  _BOOL8 v7;
  id v8;

  v8 = a4;
  v5 = -[SKUIRedeemCameraViewController _enabled](self, "_enabled");
  redeemButton = self->_redeemButton;
  v7 = v5 && objc_msgSend(v8, "length") != 0;
  -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", v7);

}

- (void)SKUIRedeemCameraView:(id)a3 textFieldDidRedeem:(id)a4
{
  -[SKUIRedeemCameraViewController _redeemAction:](self, "_redeemAction:", 0, a4);
}

- (void)startRedeemerViewForSKUIRedeemCameraView:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 0);
  v4 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SKUIRedeemCameraViewController_startRedeemerViewForSKUIRedeemCameraView___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __75__SKUIRedeemCameraViewController_startRedeemerViewForSKUIRedeemCameraView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "startSession");
}

- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKUIRedeemResultsViewController *v10;

  v5 = a4;
  -[SKUIRedeemCameraViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v10 = -[SKUIRedeemResultsViewController initWithRedeem:]([SKUIRedeemResultsViewController alloc], "initWithRedeem:", v5);

  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setClientContext:](v10, "setClientContext:", v6);

  -[SKUIRedeemResultsViewController setRedeemCategory:](v10, "setRedeemCategory:", self->_category);
  -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setOperationQueue:](v10, "setOperationQueue:", v7);

  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setConfiguration:](v10, "setConfiguration:", v8);

  -[SKUIRedeemCameraViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SKUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke;
  v7[3] = &unk_1E739FD10;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __72__SKUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *MEMORY[0x1E0D182B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *MEMORY[0x1E0D182A8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3)
  {
    if (!v4)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v5);

    objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "showMessage:color:style:duration:", 0, 0, 1, 0.0);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__SKUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke_2;
    v11[3] = &unk_1E73A3868;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v8, "_performRedeemOperationWithCode:cameraRecognized:allowOverride:completion:", v5, 1, 1, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "code") != 1 && v5 && objc_msgSend(v3, "code") != 2)
    goto LABEL_8;
LABEL_5:
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  if (v2)
    objc_msgSend(v2, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_UNABLE_TO_READ_CODE"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_UNABLE_TO_READ_CODE"), 0, CFSTR("Redeem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showMessage:color:style:duration:", v9, v10, 3, 1.0);

LABEL_11:
}

void __72__SKUIRedeemCameraViewController_codeRedeemerController_didEndWithInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_cameraRedeemDidFinish:error:", v6, v5);

}

- (void)codeRedeemerControllerDidDisplayMessage:(id)a3
{
  id v4;
  id v5;
  char v6;
  SKUIRedeemResultsViewController *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (self->_successfulRedeem)
  {
    v12 = v4;
    if (self->_fullscreen
      && (v5 = objc_loadWeakRetained((id *)&self->_delegate),
          v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) != 0))
    {
      WeakRetained = (SKUIRedeemResultsViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      -[SKUIRedeemResultsViewController redeemCameraViewController:didFinishWithRedeem:](WeakRetained, "redeemCameraViewController:didFinishWithRedeem:", self, self->_successfulRedeem);
    }
    else
    {
      WeakRetained = -[SKUIRedeemResultsViewController initWithRedeem:]([SKUIRedeemResultsViewController alloc], "initWithRedeem:", self->_successfulRedeem);
      -[SKUIRedeemStepViewController clientContext](self, "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIRedeemStepViewController setClientContext:](WeakRetained, "setClientContext:", v8);

      -[SKUIRedeemResultsViewController setRedeemCategory:](WeakRetained, "setRedeemCategory:", self->_category);
      -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIRedeemStepViewController setOperationQueue:](WeakRetained, "setOperationQueue:", v9);

      -[SKUIRedeemStepViewController configuration](self, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIRedeemStepViewController setConfiguration:](WeakRetained, "setConfiguration:", v10);

      -[SKUIRedeemCameraViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:animated:", WeakRetained, 1);

      UIKeyboardOrderOutAutomatic();
    }

    v4 = v12;
  }

}

- (void)SKUIRedeemPreflightImagesDidLoad:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SKUIRedeemCameraViewController view](self, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "landingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)_performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 allowOverride:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;
  SKUIRedeemOperation *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a5;
  v8 = a4;
  v16 = a3;
  v10 = a6;
  if (v7
    && (-[SKUIRedeemCameraViewController delegate](self, "delegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) != 0))
  {
    -[SKUIRedeemCameraViewController delegate](self, "delegate");
    v13 = (SKUIRedeemOperation *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemOperation overrideRedeemOperationWithCode:cameraRecognized:completion:](v13, "overrideRedeemOperationWithCode:cameraRecognized:completion:", v16, v8, v10);
  }
  else
  {
    v13 = -[SKUIRedeemOperation initWithCode:]([SKUIRedeemOperation alloc], "initWithCode:", v16);
    -[SKUIRedeemOperation setCameraRecognized:](v13, "setCameraRecognized:", v8);
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemOperation setClientContext:](v13, "setClientContext:", v14);

    -[SKUIRedeemOperation setResultBlock:](v13, "setResultBlock:", v10);
    -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v13);

  }
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIBarButtonItem *redeemButton;
  void *v7;
  id v8;

  v3 = a3;
  -[SKUIRedeemCameraViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setEnabled:", 1);
    redeemButton = self->_redeemButton;
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", objc_msgSend(v7, "length") != 0);

  }
  else
  {
    objc_msgSend(v5, "setEnabled:", 0);
    -[UIBarButtonItem setEnabled:](self->_redeemButton, "setEnabled:", 0);
  }

}

- (BOOL)_enabled
{
  void *v2;
  char v3;

  -[SKUIRedeemCameraViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)_cameraRedeemDidFinish:(id)a3 error:(id)a4
{
  id v7;
  CRCodeRedeemerController *camera;
  void *v9;
  void *v10;
  void *v11;
  CRCodeRedeemerController *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  if (v15)
  {
    camera = self->_camera;
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCodeRedeemerController showMessage:color:style:duration:](camera, "showMessage:color:style:duration:", 0, v9, 2, 1.0);

    objc_storeStrong((id *)&self->_successfulRedeem, a3);
  }
  else
  {
    -[SKUIRedeemCameraViewController _setEnabled:](self, "_setEnabled:", 1);
    if (v7
      && (objc_msgSend(v7, "userInfo"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "valueForKey:", CFSTR("hideError")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      v12 = self->_camera;
      objc_msgSend(v7, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCodeRedeemerController showMessage:color:style:duration:](v12, "showMessage:color:style:duration:", v13, v14, 3, 1.0);

    }
    else
    {
      -[CRCodeRedeemerController startSession](self->_camera, "startSession");
    }
  }
  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 0);

}

- (void)_redeemDidFinish:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKUIRedeemResultsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SKUIRedeemResultsViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SKUIRedeemCameraViewController *v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    UIKeyboardOrderOutAutomatic();
    v9 = -[SKUIRedeemResultsViewController initWithRedeem:]([SKUIRedeemResultsViewController alloc], "initWithRedeem:", v6);
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setClientContext:](v9, "setClientContext:", v10);

    -[SKUIRedeemResultsViewController setRedeemCategory:](v9, "setRedeemCategory:", self->_category);
    -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setOperationQueue:](v9, "setOperationQueue:", v11);

    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setConfiguration:](v9, "setConfiguration:", v12);

    -[SKUIRedeemCameraViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v9, 1);
  }
  else
  {
    if (!v7
      || (objc_msgSend(v7, "userInfo"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "valueForKey:", CFSTR("hideError")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      -[SKUIRedeemCameraViewController _setEnabled:](self, "_setEnabled:", 1);
      -[SKUIRedeemCameraViewController view](self, "view");
      v9 = (SKUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
      -[SKUIRedeemResultsViewController showKeyboard](v9, "showKeyboard");
      goto LABEL_7;
    }
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v16 = (SKUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v17 = (void *)MEMORY[0x1E0DC3450];
    if (v16)
      -[SKUIRedeemResultsViewController localizedStringForKey:inTable:](v16, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_ERROR_TITLE"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_ERROR_TITLE"), 0, CFSTR("Redeem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3448];
    if (v9)
      -[SKUIRedeemResultsViewController localizedStringForKey:inTable:](v9, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_OK_BUTTON"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_OK_BUTTON"), 0, CFSTR("Redeem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __57__SKUIRedeemCameraViewController__redeemDidFinish_error___block_invoke;
    v26 = &unk_1E73A3C28;
    v27 = v8;
    v28 = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, &v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v22, v23, v24, v25, v26);

    -[SKUIRedeemCameraViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

LABEL_7:
  -[SKUIRedeemCameraViewController _updateRightBarButtonItemsForRedeemInputState:](self, "_updateRightBarButtonItemsForRedeemInputState:", 1);

}

void __57__SKUIRedeemCameraViewController__redeemDidFinish_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  v3 = *(void **)(a1 + 40);
  if (v2 == 9518)
  {
    objc_msgSend(v3, "redeemStepDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redeemStepViewControllerShouldValidateNationalID:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "_setEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showKeyboard");
  }

}

- (void)_updateRightBarButtonItemsForRedeemInputState:(int64_t)a3
{
  void *v4;
  void *v5;
  UIBarButtonItem **p_redeemButton;
  UIBarButtonItem *activityBarButtonItem;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  UIBarButtonItem *redeemButton;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    -[SKUIRedeemCameraViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    activityBarButtonItem = self->_activityBarButtonItem;
    v10[0] = self->_redeemButton;
    v10[1] = activityBarButtonItem;
    v5 = (void *)MEMORY[0x1E0C99D20];
    p_redeemButton = (UIBarButtonItem **)v10;
    v8 = 2;
  }
  else
  {
    if (a3 == 1)
    {
      -[SKUIRedeemCameraViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      redeemButton = self->_redeemButton;
      v5 = (void *)MEMORY[0x1E0C99D20];
      p_redeemButton = &redeemButton;
    }
    else
    {
      if (a3)
        return;
      -[SKUIRedeemCameraViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = self->_flipButton;
      v5 = (void *)MEMORY[0x1E0C99D20];
      p_redeemButton = (UIBarButtonItem **)v12;
    }
    v8 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", p_redeemButton, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItems:", v9);

}

- (int64_t)category
{
  return self->_category;
}

- (SKUIRedeemCameraViewControllerDelegate)delegate
{
  return (SKUIRedeemCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (SKUIRedeemViewCameraOverrideDelegate)cameraOverrideDelegate
{
  return (SKUIRedeemViewCameraOverrideDelegate *)objc_loadWeakRetained((id *)&self->_cameraOverrideDelegate);
}

- (void)setCameraOverrideDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraOverrideDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraOverrideDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_successfulRedeem, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_activityBarButtonItem, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

- (void)initWithRedeemCategory:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRedeemCategoryFullscreen:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
