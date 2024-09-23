@implementation PKPassGroupsViewController

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (id)groupAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[PKPassGroupsViewController numberOfGroups](self, "numberOfGroups") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)numberOfGroups
{
  return -[PKGroupsController groupCount](self->_groupsController, "groupCount");
}

uint64_t __38__PKPassGroupsViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D66AE0], "createForMessages:", v2);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1232), v3);
  if (v2)

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateHeaderAndSubheaderViewsIfNecessary");
}

void __38__PKPassGroupsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PKPassGroupsViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  self->_viewAppeared = 1;
  -[PKPassGroupsViewController _updateFooterSuppressionAnimated:](self, "_updateFooterSuppressionAnimated:", v3);
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
  if (!self->_viewAppearedBefore)
  {
    v5 = -[PKGroupsController groupCount](self->_groupsController, "groupCount");
    -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
    if (!v5)
    {
      -[PKPassGroupStackView setModalGroupIndex:](self->_groupStackView, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
      self->_presentationState = 4;
    }
    -[PKPassGroupsViewController _applyPresentationState](self, "_applyPresentationState");
  }
  -[PKPassGroupStackView setPaused:](self->_groupStackView, "setPaused:", 0);
}

- (void)_updateFooterSuppressionAnimated:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  PKPassPresentationContext *v7;

  if (self->_persistentCardEmulationQueued)
  {
    v4 = a3;
    v7 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setPersistentCardEmulation:](v7, "setPersistentCardEmulation:", 1);
    -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v6, v7, v4, 0);

  }
  else
  {
    v7 = 0;
  }
  -[PKPassGroupsViewController _updateFooterSuppressionWithContext:](self, "_updateFooterSuppressionWithContext:", v7);

}

- (void)_updateFooterSuppressionWithContext:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = atomic_load(&FooterSuppressionCounter);
  if (v5 || self->_instanceFooterSuppressionCounter)
  {
    v6 = 1;
    v7 = 1;
  }
  else if (self->_viewAppeared)
  {
    v6 = 0;
    v7 = 0;
    self->_persistentCardEmulationQueued = 0;
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  -[PKPassGroupStackView setFooterSuppressed:withContext:](self->_groupStackView, "setFooterSuppressed:withContext:", v6, a3);
  -[PKPassGroupStackView setExternalFooterSuppressed:](self->_groupStackView, "setExternalFooterSuppressed:", v7);
}

- (void)_applyPresentationState
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[PKPassGroupStackView setPresentationState:animated:](self->_groupStackView, "setPresentationState:animated:", self->_presentationState, 0);
  v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKPassGroupsViewController__applyPresentationState__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

- (void)presentInitialState:(BOOL *)a3
{
  void *v5;
  BOOL v6;
  void *v7;

  if (self->_inFailForward)
    -[PKPassGroupsViewController _warnFailForward](self, "_warnFailForward");
  if ((unint64_t)(-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") - 1) > 2)
  {
    v6 = 0;
    if (a3)
LABEL_10:
      *a3 = v6;
  }
  else
  {
    -[PKPassGroupsViewController _passToPresent](self, "_passToPresent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    if (v5)
    {
      -[PKPassGroupsViewController presentOffscreenAnimated:split:withCompletionHandler:](self, "presentOffscreenAnimated:split:withCompletionHandler:", 0, 1, 0);
      objc_msgSend(v5, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v7, 1, 0);

    }
    else
    {
      -[PKPassGroupsViewController presentOnscreen:context:withCompletionHandler:](self, "presentOnscreen:context:withCompletionHandler:", 1, 0, 0);
    }

    if (a3)
      goto LABEL_10;
  }
}

- (void)presentOnscreen:(BOOL)a3 context:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  BOOL v18;

  v8 = a4;
  v9 = a5;
  v10 = -[PKPassGroupStackView modalGroupIndex](self->_groupStackView, "modalGroupIndex");
  v14[0] = MEMORY[0x1E0C809B0];
  v11 = 4;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    v11 = 5;
  v14[1] = 3221225472;
  v14[2] = __76__PKPassGroupsViewController_presentOnscreen_context_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E3E6C3B8;
  v14[4] = self;
  v15 = v8;
  v18 = a3;
  v16 = v9;
  v17 = v11;
  v12 = v9;
  v13 = v8;
  -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v14);

}

- (void)presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKPassGroupsViewController_presentOffscreenAnimated_split_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E3E6C3E0;
  v12 = a4;
  v13 = a3;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v10);

}

- (void)updatePassesIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSMutableArray *blocksQueuedForUpdateCompletion;
  void *v6;
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v7 = v4;
  if (self->_passesAreOutdated || self->_reloadingPasses)
  {
    if (v4)
    {
      blocksQueuedForUpdateCompletion = self->_blocksQueuedForUpdateCompletion;
      v6 = (void *)objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](blocksQueuedForUpdateCompletion, "addObject:", v6);

    }
    -[PKPassGroupsViewController reloadPasses](self, "reloadPasses");
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    v4[2](v4);
  }
  v4 = v7;
LABEL_7:

}

uint64_t __83__PKPassGroupsViewController_presentOffscreenAnimated_split_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = 2;
  if (*(_BYTE *)(a1 + 48))
    v1 = 3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088) = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setPresentationState:withContext:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088), 0, *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
}

uint64_t __76__PKPassGroupsViewController_presentOnscreen_context_withCompletionHandler___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088) = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setPresentationState:withContext:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

- (id)_passToPresent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[PKPassGroupsViewController _passPendingActivationToPresent](self, "_passPendingActivationToPresent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKPassGroupsViewController _passWithDeviceAssessmentEducationToPresent](self, "_passWithDeviceAssessmentEducationToPresent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v6)
      v7 = v6;

  }
  return v5;
}

- (id)_passWithDeviceAssessmentEducationToPresent
{
  void *v2;
  void *v3;
  void *v4;

  if ((PKHasSeenDeviceAssessmentEducation() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passesOfType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_331);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_passPendingActivationToPresent
{
  void *v2;
  void *v3;
  void *v4;

  if ((PKSharedCacheGetBoolForKey() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passesPendingActivation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharedCacheSetBoolForKey();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)groupStackView:(id)a3 wantsTopContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5
{
  self->_headerBackgroundVisibility = a4;
  if (self->_viewAppearedBefore)
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_headerBackground, "pkui_setVisibility:animated:", a5);
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69940];
  v13[0] = *MEMORY[0x1E0D698E8];
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D68FF8];
  v12[0] = *MEMORY[0x1E0D68C50];
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v6, v9);

  if (!self->_viewAppearedBefore)
  {
    self->_viewAppearedBefore = 1;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_headerBackground, "pkui_setVisibility:animated:", 1, self->_headerBackgroundVisibility);
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_footerBackground, "pkui_setVisibility:animated:", 1, self->_footerBackgroundVisibility);
  }
}

- (unint64_t)indexOfGroup:(id)a3
{
  return -[PKGroupsController indexOfGroup:](self->_groupsController, "indexOfGroup:", a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (PKPassGroupsViewController)initWithGroupsController:(id)a3 style:(int64_t)a4
{
  id v7;
  PKPassGroupsViewController *v8;
  PKPassGroupsViewController *v9;
  _BOOL4 inFailForward;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *blocksQueuedForUpdateCompletion;
  int v15;
  uint64_t v16;
  PKPassLibraryDataProvider *v17;
  PKPassLibraryDataProvider *passLibraryDataProvider;
  uint64_t v19;
  PKPeerPaymentService *peerPaymentService;
  uint64_t v21;
  PKDiscoveryDataSource *discoveryDataSource;
  PKContactAvatarManager *v23;
  void *v24;
  id v25;
  uint64_t v26;
  PKContactAvatarManager *avatarManager;
  PKInboxDataSource *v28;
  PKInboxDataSource *inboxDataSource;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 backgroundMode;
  objc_super v37;

  v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKPassGroupsViewController;
  v8 = -[PKPassGroupsViewController initWithNibName:bundle:](&v37, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (!v8)
    goto LABEL_15;
  v8->_style = a4;
  v8->_inFailForward = objc_msgSend(MEMORY[0x1E0D67630], "isInFailForward");
  if (!PKSecureElementIsAvailable())
  {
    v9->_hasSecureElement = 0;
    goto LABEL_6;
  }
  inFailForward = v9->_inFailForward;
  v9->_hasSecureElement = !inFailForward;
  if (inFailForward)
  {
LABEL_6:
    v9->_canAddSecureElementCards = 0;
    goto LABEL_7;
  }
  v11 = (void *)MEMORY[0x1E0D67248];
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_canAddSecureElementCards = objc_msgSend(v11, "_isPaymentSetupSupportedForWebService:", v12);

LABEL_7:
  objc_storeStrong((id *)&v9->_groupsController, a3);
  -[PKGroupsController setDelegate:](v9->_groupsController, "setDelegate:", v9);
  -[PKGroupsController loadGroupsSynchronously](v9->_groupsController, "loadGroupsSynchronously");
  v9->_presentationState = 1;
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  blocksQueuedForUpdateCompletion = v9->_blocksQueuedForUpdateCompletion;
  v9->_blocksQueuedForUpdateCompletion = v13;

  v9->_passesAreOutdated = 0;
  v9->_handleFieldDetection = 1;
  v15 = PKIsLowEndDevice();
  v16 = 512;
  if (!v15)
    v16 = 0;
  v9->_suppressedContent = v16;
  v17 = (PKPassLibraryDataProvider *)objc_alloc_init(MEMORY[0x1E0D66F18]);
  passLibraryDataProvider = v9->_passLibraryDataProvider;
  v9->_passLibraryDataProvider = v17;

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v19 = objc_claimAutoreleasedReturnValue();
  peerPaymentService = v9->_peerPaymentService;
  v9->_peerPaymentService = (PKPeerPaymentService *)v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66CF0]), "initWithDelegate:", v9);
  discoveryDataSource = v9->_discoveryDataSource;
  v9->_discoveryDataSource = (PKDiscoveryDataSource *)v21;

  v23 = [PKContactAvatarManager alloc];
  objc_msgSend(MEMORY[0x1E0D66C60], "defaultContactResolver");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0D67100]);
  v26 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v23, "initWithContactResolver:paymentDataProvider:", v24, v25);
  avatarManager = v9->_avatarManager;
  v9->_avatarManager = (PKContactAvatarManager *)v26;

  v28 = -[PKInboxDataSource initWithDelegate:]([PKInboxDataSource alloc], "initWithDelegate:", v9);
  inboxDataSource = v9->_inboxDataSource;
  v9->_inboxDataSource = v28;

  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupsViewController setRestorationIdentifier:](v9, "setRestorationIdentifier:", v31);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel__handleStatusBarChange_, *MEMORY[0x1E0DC4758], 0);
  objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel__handleFooterSupressionChange_, CFSTR("PKPassGroupsViewControllerFooterSupressionDidChange"), 0);
  objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel__handlePeerPaymentAccountDidChangeNotification_, *MEMORY[0x1E0D6B288], v9->_peerPaymentService);
  if ((PKRunningInRemoteContext() & 1) == 0)
    objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel__handleChildViewControllerRequestingServiceMode_, CFSTR("PKPDVCRequestedServiceMode"), 0);
  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    backgroundMode = (objc_msgSend(v33, "registerObserver:", v9) & 0x100) == 0;
    v9->_backgroundMode = backgroundMode;
  }
  else
  {
    backgroundMode = v9->_backgroundMode;
  }
  v9->_expressTransactionNotificationObserver = -1;
  -[PKPassGroupsViewController _registerForExpressTransactionNotifications:](v9, "_registerForExpressTransactionNotifications:", !backgroundMode);

LABEL_15:
  return v9;
}

uint64_t __73__PKPassGroupsViewController__passWithDeviceAssessmentEducationToPresent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D673C8];
  v3 = a2;
  objc_msgSend(v2, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "supportsDeviceAssessmentAccordingToService:", v4);

  return v5;
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[PKPassGroupsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)loadView
{
  UINavigationController *v3;
  UINavigationController *metricController;
  _PKVisibilityBackdropView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _PKVisibilityBackdropView *v10;
  _PKVisibilityBackdropView *headerBackground;
  _PKVisibilityBackdropView *v12;
  _PKVisibilityBackdropView *footerBackground;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  PKPassGroupStackView *v26;
  PKPassGroupStackView *v27;
  PKPassGroupStackView *groupStackView;
  NSObject *v29;
  PKPassGroupStackView *v30;
  void *v31;
  UINavigationController *v32;
  void *v33;
  int64_t style;
  uint64_t v35;
  void *v36;
  int64_t invalidationStatus;
  PKPaymentService *v38;
  PKPaymentService *paymentService;
  PKPaymentService *v40;
  _QWORD v41[5];
  CGRect slice;
  CGRect remainder;
  objc_super v44;
  uint8_t buf[4];
  PKPassGroupsViewController *v46;
  __int16 v47;
  PKPassGroupStackView *v48;
  uint64_t v49;
  CGRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController loadView](&v44, sel_loadView);
  if (self->_externalModalPresentationAllowed)
  {
    v3 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithNavigationBarClass:toolbarClass:", 0, 0);
    metricController = self->_metricController;
    self->_metricController = v3;

    -[PKPassGroupsViewController addChildViewController:](self, "addChildViewController:", self->_metricController);
    -[UINavigationController didMoveToParentViewController:](self->_metricController, "didMoveToParentViewController:", self);
  }
  v5 = [_PKVisibilityBackdropView alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v5, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E0C9D648], v7, v8, v9);
  headerBackground = self->_headerBackground;
  self->_headerBackground = v10;

  -[_UIBackdropView setAutoGroup:](self->_headerBackground, "setAutoGroup:", 1);
  v12 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v6, v7, v8, v9);
  footerBackground = self->_footerBackground;
  self->_footerBackground = v12;

  -[_UIBackdropView setAutoGroup:](self->_footerBackground, "setAutoGroup:", 1);
  -[_PKVisibilityBackdropView setHidden:](self->_footerBackground, "setHidden:", 1);
  -[_PKVisibilityBackdropView setDelegate:](self->_headerBackground, "setDelegate:", self);
  -[_PKVisibilityBackdropView setDelegate:](self->_footerBackground, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "statusBarFrame");
  v25 = v24;

  memset(&remainder, 0, sizeof(remainder));
  slice.origin.x = v16;
  slice.origin.y = v18;
  slice.size.width = v20;
  slice.size.height = v22;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  CGRectDivide(v50, &slice, &remainder, v25, CGRectMinYEdge);
  v26 = [PKPassGroupStackView alloc];
  v27 = -[PKPassGroupStackView initWithFrame:](v26, "initWithFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  groupStackView = self->_groupStackView;
  self->_groupStackView = v27;

  -[PKPassGroupStackView setScrollEnabled:](self->_groupStackView, "setScrollEnabled:", 0);
  -[PKPassGroupStackView setDelegate:](self->_groupStackView, "setDelegate:", self);
  -[PKPassGroupStackView setDatasource:](self->_groupStackView, "setDatasource:", self);
  -[PKPassGroupStackView setGroupsController:](self->_groupStackView, "setGroupsController:", self->_groupsController);
  -[PKPassGroupStackView setDiscoveryDatasource:](self->_groupStackView, "setDiscoveryDatasource:", self->_discoveryDataSource);
  PKLogFacilityTypeGetObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = self->_groupStackView;
    *(_DWORD *)buf = 134349312;
    v46 = self;
    v47 = 2050;
    v48 = v30;
    _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): created PKPassGroupStackView %{public}p.", buf, 0x16u);
  }

  -[PKPassGroupsViewController _updatePeerPaymentAccount](self, "_updatePeerPaymentAccount");
  -[PKPassGroupsViewController _prewarmSemanticTileInformation](self, "_prewarmSemanticTileInformation");
  -[PKPassGroupsViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAutoresizingMask:", 0);
  v32 = self->_metricController;
  if (v32)
  {
    -[UINavigationController view](v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", 1);
    objc_msgSend(v33, "setAutoresizingMask:", 0);
    objc_msgSend(v31, "addSubview:", v33);

  }
  objc_msgSend(v31, "addSubview:", self->_groupStackView);
  objc_msgSend(v31, "addSubview:", self->_headerBackground);
  objc_msgSend(v31, "addSubview:", self->_footerBackground);
  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(v31, "setOpaque:", 0);
    objc_msgSend(v31, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (style)
      goto LABEL_12;
    objc_msgSend(v31, "setOpaque:", 1);
    +[PKPassGroupStackView backgroundColor](PKPassGroupStackView, "backgroundColor");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v35;
  objc_msgSend(v31, "setBackgroundColor:", v35);

LABEL_12:
  invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus == 2)
  {
    -[PKPassGroupStackView setDelegate:](self->_groupStackView, "setDelegate:", 0);
    -[PKPassGroupStackView invalidate](self->_groupStackView, "invalidate");
    invalidationStatus = self->_invalidationStatus;
  }
  if (!invalidationStatus && PKSecureElementIsAvailable())
  {
    v38 = (PKPaymentService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", self);
    paymentService = self->_paymentService;
    self->_paymentService = v38;

    v40 = self->_paymentService;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __38__PKPassGroupsViewController_loadView__block_invoke;
    v41[3] = &unk_1E3E61E98;
    v41[4] = self;
    -[PKPaymentService applicationMessagesWithCompletion:](v40, "applicationMessagesWithCompletion:", v41);
  }

}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2)
    return 2030;
  else
    return 2010;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  UINavigationController *metricController;
  void *v17;
  CGRect v18;
  CGRect slice;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewWillLayoutSubviews](&v20, sel_viewWillLayoutSubviews);
  -[PKPassGroupsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  metricController = self->_metricController;
  if (metricController)
  {
    -[UINavigationController view](metricController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  }
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v13, CGRectMinYEdge);
  -[_PKVisibilityBackdropView frame](self->_headerBackground, "frame");
  if (!CGRectEqualToRect(v22, slice))
    -[_PKVisibilityBackdropView setFrame:](self->_headerBackground, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[PKPassGroupStackView frame](self->_groupStackView, "frame");
  if (!CGRectEqualToRect(v23, v18))
    -[PKPassGroupStackView setFrame:](self->_groupStackView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[PKPassGroupStackView setTopContentSeparatorHeight:](self->_groupStackView, "setTopContentSeparatorHeight:", v13);
  CGRectDivide(v18, &slice, &v18, v15, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setHidden:](self->_footerBackground, "setHidden:", slice.size.height <= 0.0, slice.size.height);
  -[_PKVisibilityBackdropView frame](self->_footerBackground, "frame");
  if (!CGRectEqualToRect(v24, slice))
    -[_PKVisibilityBackdropView setFrame:](self->_footerBackground, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

}

- (void)_updatePeerPaymentAccount
{
  -[PKPassGroupStackView updatePeerPaymentFooterViewIfNecessary](self->_groupStackView, "updatePeerPaymentFooterViewIfNecessary");
}

- (id)groupStackView:(id)a3 headerForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8;
  int v9;
  PKPaymentService *paymentService;
  void *v11;
  uint64_t v12;
  id *v13;
  PKGSVWalletHeaderView *WeakRetained;
  PKGSVWalletHeaderView *v15;
  PKGSVWalletHeaderView *v16;
  __int128 v17;
  _OWORD v19[2];

  v8 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      self = 0;
      goto LABEL_12;
    }
    v9 = 1040;
    paymentService = self->_paymentService;
    PKPendingProvisioningBackgroundProvisioningInBuddyTypes();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPaymentService hasPendingProvisioningsOfTypes:](paymentService, "hasPendingProvisioningsOfTypes:", v11);

LABEL_6:
    v13 = (id *)((char *)&self->super.super.super.isa + v9);
    WeakRetained = (PKGSVWalletHeaderView *)objc_loadWeakRetained(v13);
    if (WeakRetained)
    {
      v15 = WeakRetained;
      if (!-[PKGSVWalletHeaderView needsRemoval](WeakRetained, "needsRemoval"))
      {
LABEL_10:
        self = v15;

        goto LABEL_12;
      }

    }
    v16 = [PKGSVWalletHeaderView alloc];
    v17 = *((_OWORD *)&a5->var0 + 1);
    v19[0] = *(_OWORD *)&a5->var0.var0;
    v19[1] = v17;
    v15 = -[PKGSVWalletHeaderView initWithPassType:state:delegate:](v16, "initWithPassType:state:delegate:", a4, v19, self);
    objc_storeWeak(v13, v15);
    -[PKGSVWalletHeaderView setHeaderDelegate:](v15, "setHeaderDelegate:", self);
    -[PKGSVWalletHeaderView setShowBackgroundProvisioningHint:animated:](v15, "setShowBackgroundProvisioningHint:animated:", v12, 0);
    goto LABEL_10;
  }
  if (self)
  {
    v12 = 0;
    v9 = 1048;
    goto LABEL_6;
  }
LABEL_12:

  return self;
}

- (unint64_t)inboxBadgeCountForSectionHeaderView:(id)a3
{
  return -[PKInboxDataSource badgeCount](self->_inboxDataSource, "badgeCount", a3);
}

- (BOOL)groupStackView:(id)a3 willHaveHeaderViewForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8;
  __int128 v9;
  BOOL v10;
  _OWORD v12[2];

  v8 = a3;
  if (a4 == 1)
  {
    v10 = 1;
  }
  else if (a4 || (*((_BYTE *)a5 + 24) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v9 = *((_OWORD *)&a5->var0 + 1);
    v12[0] = *(_OWORD *)&a5->var0.var0;
    v12[1] = v9;
    v10 = -[PKPassGroupsViewController groupStackView:willHaveHeaderViewForPassType:withState:](self, "groupStackView:willHaveHeaderViewForPassType:withState:", v8, 1, v12);
  }

  return v10;
}

- (BOOL)supportsExternalPresentation
{
  return self->_externalModalPresentationAllowed;
}

- (unint64_t)indexOfSeparationGroup
{
  return -[PKGroupsController indexOfSeparationGroup](self->_groupsController, "indexOfSeparationGroup");
}

- (BOOL)groupStackViewShouldShowHeaderViews:(id)a3
{
  return self->_welcomeStateEnabled;
}

- (BOOL)groupStackView:(id)a3 willHaveSubheaderViewsWithState:(id *)a4
{
  id WeakRetained;
  void *v7;
  BOOL v8;
  PKDiscoveryDataSource *discoveryDataSource;
  __int128 v10;
  _OWORD v12[2];

  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
  v7 = WeakRetained;
  if (self->_messages || WeakRetained && !objc_msgSend(WeakRetained, "needsRemoval"))
  {
    v8 = 1;
  }
  else
  {
    discoveryDataSource = self->_discoveryDataSource;
    v10 = *((_OWORD *)&a4->var0 + 1);
    v12[0] = *(_OWORD *)&a4->var0.var0;
    v12[1] = v10;
    v8 = +[PKDiscoveryGalleryView isVisibleForSectionsState:dataSource:](PKDiscoveryGalleryView, "isVisibleForSectionsState:dataSource:", v12, discoveryDataSource);
  }

  return v8;
}

- (BOOL)areGroupsSeparated
{
  return -[PKGroupsController shouldSeparatePaymentPasses](self->_groupsController, "shouldSeparatePaymentPasses");
}

- (void)groupStackView:(id)a3 wantsBottomContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5
{
  self->_footerBackgroundVisibility = a4;
  if (self->_viewAppearedBefore)
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_footerBackground, "pkui_setVisibility:animated:", a5);
}

- (id)footerForGroupStackView:(id)a3
{
  int refreshed;
  PKPGSVFooterView *v5;
  PKPGSVFooterView *v6;
  void *v7;
  void *v8;

  refreshed = PKExpiredPassesRefreshEnabled();
  v5 = [PKPGSVFooterView alloc];
  v6 = -[PKPGSVFooterView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (refreshed)
    -[PKPGSVFooterView setExpiredSectionCount:](v6, "setExpiredSectionCount:", -[PKGroupsController expiredSectionPassesCount](self->_groupsController, "expiredSectionPassesCount"));
  -[PKPGSVFooterView setDelegate:](v6, "setDelegate:", self);
  -[PKPGSVFooterView sizeToFit](v6, "sizeToFit");
  -[PKPassGroupsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPGSVFooterView setOpaque:](v6, "setOpaque:", objc_msgSend(v7, "isOpaque"));
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPGSVFooterView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  return v6;
}

uint64_t __60__PKPassGroupsViewController_updateRegionSupportIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentSetupSupportedInRegion");
}

- (void)presentOffscreenAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  -[PKPassGroupsViewController presentOffscreenAnimated:split:withCompletionHandler:](self, "presentOffscreenAnimated:split:withCompletionHandler:", a3, 0, a4);
}

- (void)setExternalModalPresentationAllowed:(BOOL)a3
{
  self->_externalModalPresentationAllowed = a3;
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (PKPassGroupsViewController)init
{
  id v3;
  PKPassGroupsViewController *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D66DB8]);
  objc_msgSend(v3, "setShouldSeparatePaymentPasses:", 1);
  v4 = -[PKPassGroupsViewController initWithGroupsController:](self, "initWithGroupsController:", v3);

  return v4;
}

- (PKPassGroupsViewController)initWithGroupsController:(id)a3
{
  return -[PKPassGroupsViewController initWithGroupsController:style:](self, "initWithGroupsController:style:", a3, 0);
}

uint64_t __68__PKPassGroupsViewController_inboxDataSourceDidUpdateInboxMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateHeaderAndSubheaderViewsIfNecessary");
}

- (BOOL)passesAreOutdated
{
  return self->_passesAreOutdated;
}

uint64_t __53__PKPassGroupsViewController__applyPresentationState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "tilePassesEagerly:", 1);
}

- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPassGroupsViewController_inboxDataSourceDidUpdateInboxMessages___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  PKApplicationMessageView **p_applicationMessageView;
  id WeakRetained;
  id v14;
  id v15;

  v5 = a5;
  v15 = a3;
  if (v5)
  {
    -[PKPassGroupsViewController _clearPassViewedNotificationTimer](self, "_clearPassViewedNotificationTimer");
    if (a4 != 7)
    {
      if (a4 != 5)
      {
        if (a4 == 4
          && !-[PKPassGroupStackView isReordering](self->_groupStackView, "isReordering")
          && (-[PKPassGroupStackView isDragging](self->_groupStackView, "isDragging") & 1) == 0
          && (-[PKPassGroupStackView isDecelerating](self->_groupStackView, "isDecelerating") & 1) == 0)
        {
          -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
        }
        goto LABEL_12;
      }
      objc_msgSend(v15, "modalGroupFrontmostPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isIdentityPass");

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D66E70], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchRPIdentifierMappingDiscretionary:localOnly:completionHandler:", 0, 0, 0);

      }
    }
    -[PKPassGroupsViewController _startPassViewedNotificationTimer](self, "_startPassViewedNotificationTimer");
LABEL_12:
    -[PKPassGroupsViewController updateLockscreenIdleTimer](self, "updateLockscreenIdleTimer");
  }
  p_applicationMessageView = &self->_applicationMessageView;
  WeakRetained = objc_loadWeakRetained((id *)p_applicationMessageView);
  if (WeakRetained)
  {

    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 5)
    {
      v14 = objc_loadWeakRetained((id *)p_applicationMessageView);
      objc_msgSend(v14, "collapse");

    }
  }

}

- (id)itemIdentifierForFrontmostDiscoveryCard
{
  PKDiscoveryGalleryView **p_discoveryGalleryView;
  id v4;
  id WeakRetained;
  void *v6;

  if (-[PKPassGroupsViewController hasDiscoveryContent](self, "hasDiscoveryContent")
    && (p_discoveryGalleryView = &self->_discoveryGalleryView,
        v4 = objc_loadWeakRetained((id *)p_discoveryGalleryView),
        v4,
        v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
    objc_msgSend(WeakRetained, "frontmostItemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)hasDiscoveryContent
{
  void *v2;
  BOOL v3;

  -[PKDiscoveryDataSource articleLayouts](self->_discoveryDataSource, "articleLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)updateRegionSupportIfNecessary
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Updating region support", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D67248];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PKPassGroupsViewController_updateRegionSupportIfNecessary__block_invoke;
  v6[3] = &unk_1E3E646D0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "configureWebServiceIfNecessary:completion:", v5, v6);

}

- (void)setWelcomeStateEnabled:(BOOL)a3
{
  _BOOL4 welcomeStateEnabled;
  void *v5;
  void *v6;
  id v7;

  self->_welcomeStateEnabled = a3;
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
  welcomeStateEnabled = self->_welcomeStateEnabled;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (welcomeStateEnabled)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__localeDidChangeNotification_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__regionConfigurationDidChangeNotification, *MEMORY[0x1E0D6B838], 0);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0D6B838], 0);
  }

}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  NSObject *v4;
  int *v5;
  int *p_expressTransactionNotificationObserver;
  void *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  PKPassGroupsViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_invalidationStatus)
  {
    p_expressTransactionNotificationObserver = &self->_expressTransactionNotificationObserver;
    if (self->_expressTransactionNotificationObserver == -1)
    {
      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __74__PKPassGroupsViewController__registerForExpressTransactionNotifications___block_invoke;
      v16 = &unk_1E3E62660;
      objc_copyWeak(&v17, &location);
      v7 = _Block_copy(&v13);
      v8 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D6A610], "UTF8String", v13, v14, v15, v16);
      v9 = MEMORY[0x1E0C80D38];
      v10 = MEMORY[0x1E0C80D38];
      LODWORD(v9) = notify_register_dispatch(v8, &self->_expressTransactionNotificationObserver, v9, v7) == 0;

      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v9)
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349056;
          v20 = self;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): registered for express transaction handling.", buf, 0xCu);
        }

      }
      else
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349056;
          v20 = self;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): ERROR - failed to register for express transaction notifications!", buf, 0xCu);
        }

        *p_expressTransactionNotificationObserver = -1;
      }

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_expressTransactionNotificationObserver != -1)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v20 = self;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): unregistered for express transaction handling.", buf, 0xCu);
    }

    v5 = &self->_expressTransactionNotificationObserver;
    notify_cancel(*v5);
    *v5 = -1;
  }
}

+ (BOOL)isPerformingAction
{
  unint64_t v2;

  v2 = atomic_load(&ActionCounter);
  return v2 != 0;
}

+ (void)beginTrackingAction
{
  unint64_t v2;

  do
    v2 = __ldaxr(&ActionCounter);
  while (__stlxr(v2 + 1, &ActionCounter));
}

+ (void)endTrackingAction
{
  unint64_t v2;
  NSObject *v3;
  unint64_t v4;
  uint8_t v5[16];

  do
    v2 = __ldaxr(&ActionCounter);
  while (__stlxr(v2 - 1, &ActionCounter));
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to stop tracking a non-existent action.", v5, 2u);
    }

    do
      v4 = __ldaxr(&ActionCounter);
    while (__stlxr(v4 + 1, &ActionCounter));
  }
}

+ (void)beginSuppressingFooter
{
  unint64_t v2;

  do
    v2 = __ldaxr(&FooterSuppressionCounter);
  while (__stlxr(v2 + 1, &FooterSuppressionCounter));
  if (!v2)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_103);
}

void __52__PKPassGroupsViewController_beginSuppressingFooter__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PKPassGroupsViewControllerFooterSupressionDidChange"), 0);

}

+ (void)endSuppressingFooter
{
  unint64_t v2;
  NSObject *v3;
  unint64_t v4;
  uint8_t v5[16];

  do
    v2 = __ldaxr(&FooterSuppressionCounter);
  while (__stlxr(v2 - 1, &FooterSuppressionCounter));
  if (v2 == 1)
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_38);
  }
  else if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to end footer suppression when already stopped.", v5, 2u);
    }

    do
      v4 = __ldaxr(&FooterSuppressionCounter);
    while (__stlxr(v4 + 1, &FooterSuppressionCounter));
  }
}

void __50__PKPassGroupsViewController_endSuppressingFooter__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PKPassGroupsViewControllerFooterSupressionDidChange"), 0);

}

- (PKPassGroupsViewController)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKPassGroupsViewController init](self, "init");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  -[PKPassGroupsViewController _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);
  -[PKGroupsController setDelegate:](self->_groupsController, "setDelegate:", 0);
  -[PKPassGroupStackView setDatasource:](self->_groupStackView, "setDatasource:", 0);
  -[PKPassGroupStackView setDelegate:](self->_groupStackView, "setDelegate:", 0);
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  -[NSTimer invalidate](self->_allowDimmingTimer, "invalidate");
  -[NSTimer invalidate](self->_passViewedNotificationTimer, "invalidate");
  -[PKPassGroupsViewController invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v3 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69940];
  v14[0] = *MEMORY[0x1E0D698E8];
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D68F50];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v8;
  v9 = *MEMORY[0x1E0D68FF8];
  v13[0] = *MEMORY[0x1E0D68C58];
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subjects:sendEvent:", v7, v10);

  self->_viewAppeared = 0;
  -[PKPassGroupsViewController _updateFooterSuppressionAnimated:](self, "_updateFooterSuppressionAnimated:", v3);
  -[PKPassGroupStackView setPaused:](self->_groupStackView, "setPaused:", 1);
  v11.receiver = self;
  v11.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupsViewController;
  v4 = a3;
  -[PKPassGroupsViewController decodeRestorableStateWithCoder:](&v6, sel_decodeRestorableStateWithCoder_, v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modalUniqueID"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 0, 0);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController encodeRestorableStateWithCoder:](&v12, sel_encodeRestorableStateWithCoder_, v4);
  v5 = -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState");
  if (v5 == 7
    || ((v6 = v5,
         v7 = -[PKPassGroupsViewController _canPerformExternalModalPresentation](self, "_canPerformExternalModalPresentation"), v6 == 5)? (v8 = !v7): (v8 = 0), v8 || v6 == 4 && -[PKGroupsController groupCount](self->_groupsController, "groupCount") == 1))
  {
    -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (-[PKGroupsController groupCount](self->_groupsController, "groupCount"))
      {
        -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "passCount"))
        {
          objc_msgSend(v10, "passAtIndex:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }
    }
    objc_msgSend(v9, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("modalUniqueID"));

  }
}

- (void)finishedEditingExpiredPass
{
  -[PKPassGroupStackView updateFooterViewIfNecessary](self->_groupStackView, "updateFooterViewIfNecessary");
  -[PKPassGroupStackView setNeedsLayout](self->_groupStackView, "setNeedsLayout");
}

- (BOOL)hasDiscoveryCardWithItemIdentifier:(id)a3
{
  PKDiscoveryGalleryView **p_discoveryGalleryView;
  id v4;
  id WeakRetained;
  void *v6;

  p_discoveryGalleryView = &self->_discoveryGalleryView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
  objc_msgSend(WeakRetained, "cardViewForCardWithItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)featuredGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PKGroupsController *groupsController;
  void *v12;
  uint64_t v13;

  if (!PKRunningInViewService())
    return 0;
  -[PKPeerPaymentService account](self->_peerPaymentService, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "supportsCardBalancePromotion"))
    goto LABEL_4;
  objc_msgSend(v3, "cardBalancePromotionFeatureDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  if (v8 != 1)
  {
    groupsController = self->_groupsController;
    objc_msgSend(v3, "associatedPassUniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v12);

    -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (BOOL)groupStackView:(id)a3 requiresHeaderForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8;
  __int128 v10;
  uint64_t v11;

  v8 = a3;
  if (!a4)
  {
    if ((*((_BYTE *)a5 + 16) & 2) == 0)
    {
      v10 = *(_OWORD *)&a5->var0;
      v11 = *((_QWORD *)a5 + 2);
      LODWORD(self) = !-[PKPassGroupsViewController groupStackView:requiresHeaderForPassType:withState:](self, "groupStackView:requiresHeaderForPassType:withState:", v8, 1, &v10);
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(self) = 0;
    goto LABEL_7;
  }
  if (a4 != 1)
    goto LABEL_6;
  LOBYTE(self) = self->_hasSecureElement;
LABEL_7:

  return (char)self;
}

- (id)groupStackView:(id)a3 subheadersWithState:(id *)a4
{
  PKApplicationMessageView **p_applicationMessageView;
  id WeakRetained;
  PKApplicationMessageNodeMultipleGroupBranch *messages;
  PKApplicationMessageView *v9;
  PKApplicationMessageViewConfiguration *v10;
  PKApplicationMessageViewConfiguration *v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  PKDiscoveryDataSource *discoveryDataSource;
  __int128 v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  id v33;
  __int128 v35;
  __int128 v36;

  p_applicationMessageView = &self->_applicationMessageView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
  messages = self->_messages;
  if (!((unint64_t)messages | (unint64_t)WeakRetained))
  {
    v9 = 0;
    goto LABEL_10;
  }
  v9 = (PKApplicationMessageView *)WeakRetained;
  if (!WeakRetained)
    goto LABEL_5;
  if (objc_msgSend(WeakRetained, "needsRemoval"))
  {

    objc_storeWeak((id *)p_applicationMessageView, 0);
    messages = self->_messages;
LABEL_5:
    if (messages)
    {
      v10 = [PKApplicationMessageViewConfiguration alloc];
      +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
      v11 = -[PKApplicationMessageViewConfiguration initWithWidth:](v10, "initWithWidth:");
      v9 = -[PKApplicationMessageView initWithConfiguration:]([PKApplicationMessageView alloc], "initWithConfiguration:", v11);
      objc_storeWeak((id *)p_applicationMessageView, v9);

      v12 = *((_OWORD *)&a4->var0 + 1);
      v35 = *(_OWORD *)&a4->var0.var0;
      v36 = v12;
      -[PKApplicationMessageView setSectionsState:](v9, "setSectionsState:", &v35);
      -[PKApplicationMessageView setContent:animated:](v9, "setContent:animated:", self->_messages, 0);
      -[PKApplicationMessageView bounds](v9, "bounds");
      v14 = v13;
      v16 = v15;
      -[PKApplicationMessageView configuration](v9, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "width");
      v19 = v18;

      -[PKApplicationMessageView sizeThatFits:](v9, "sizeThatFits:", v19, 1.79769313e308);
      -[PKApplicationMessageView setBounds:](v9, "setBounds:", v14, v16, v20, v21);
      -[PKApplicationMessageView layoutIfNeededAnimated:](v9, "layoutIfNeededAnimated:", 0);
      -[PKApplicationMessageView setSubheaderDelegate:](v9, "setSubheaderDelegate:", self);
      -[PKApplicationMessageView setDelegate:](v9, "setDelegate:", self);
      goto LABEL_10;
    }
    v9 = 0;
  }
  v22 = *((_OWORD *)&a4->var0 + 1);
  v35 = *(_OWORD *)&a4->var0.var0;
  v36 = v22;
  -[PKApplicationMessageView setSectionsState:](v9, "setSectionsState:", &v35);
LABEL_10:
  discoveryDataSource = self->_discoveryDataSource;
  v24 = *((_OWORD *)&a4->var0 + 1);
  v35 = *(_OWORD *)&a4->var0.var0;
  v36 = v24;
  if (+[PKDiscoveryGalleryView isVisibleForSectionsState:dataSource:](PKDiscoveryGalleryView, "isVisibleForSectionsState:dataSource:", &v35, discoveryDataSource))
  {
    v25 = objc_loadWeakRetained((id *)&self->_discoveryGalleryView);
    if (v25)
    {
      v26 = (uint64_t)v25;
      if (!objc_msgSend(v25, "needsRemoval"))
      {
        v32 = *((_OWORD *)&a4->var0 + 1);
        v35 = *(_OWORD *)&a4->var0.var0;
        v36 = v32;
        objc_msgSend((id)v26, "setSectionsState:", &v35);
        v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v30 = v33;
        if (v9)
          objc_msgSend(v33, "addObject:", v9);
LABEL_24:
        objc_msgSend(v30, "addObject:", v26);

LABEL_25:
        v31 = (void *)objc_msgSend(v30, "copy");

        goto LABEL_26;
      }

      objc_storeWeak((id *)&self->_discoveryGalleryView, 0);
    }
    v27 = *((_OWORD *)&a4->var0 + 1);
    v35 = *(_OWORD *)&a4->var0.var0;
    v36 = v27;
    -[PKPassGroupsViewController _makeDiscoveryGalleryViewWithState:](self, "_makeDiscoveryGalleryViewWithState:", &v35);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_discoveryGalleryView, (id)v26);
    objc_msgSend((id)v26, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAnchorPoint:", 0.5, 0.0);

    objc_msgSend((id)v26, "setSubheaderDelegate:", self);
  }
  else
  {
    v26 = 0;
  }
  if ((unint64_t)v9 | v26)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = v29;
    if (v9)
      objc_msgSend(v29, "addObject:", v9);
    if (!v26)
      goto LABEL_25;
    goto LABEL_24;
  }
  v31 = 0;
LABEL_26:

  return v31;
}

- (id)_makeDiscoveryGalleryViewWithState:(id *)a3
{
  void *v5;
  PKDiscoveryGalleryView *v6;
  void *v7;
  PKDiscoveryGalleryView *v8;
  __int128 v9;
  _OWORD v11[2];

  -[PKDiscoveryDataSource articleLayouts](self->_discoveryDataSource, "articleLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PKDiscoveryGalleryView alloc];
  -[PKPassGroupsViewController _cardTemplateInformationForArticleLayouts:](self, "_cardTemplateInformationForArticleLayouts:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDiscoveryGalleryView initWithCardTemplateInformation:](v6, "initWithCardTemplateInformation:", v7);

  -[PKDiscoveryGalleryView setDataSource:](v8, "setDataSource:", self->_discoveryDataSource);
  -[PKDiscoveryGalleryView updateArticleLayouts:](v8, "updateArticleLayouts:", v5);
  v9 = *((_OWORD *)&a3->var0 + 1);
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v9;
  -[PKDiscoveryGalleryView setSectionsState:](v8, "setSectionsState:", v11);
  -[PKDiscoveryGalleryView sizeToFit](v8, "sizeToFit");

  return v8;
}

- (void)beginPinningExternalPresentationNavigationHeight
{
  unsigned int navigationHeightPinCounter;
  void *v4;
  double v5;

  navigationHeightPinCounter = self->_navigationHeightPinCounter;
  if (!navigationHeightPinCounter)
  {
    -[UINavigationController view](self->_metricController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(v4, "layoutIfNeeded");
    -[PKPassGroupsViewController externalPresentationNavigationHeight](self, "externalPresentationNavigationHeight");
    self->_pinnedNavigationHeight = v5;

    navigationHeightPinCounter = self->_navigationHeightPinCounter;
  }
  self->_navigationHeightPinCounter = navigationHeightPinCounter + 1;
}

- (void)endPinningExternalPresentationNavigationHeight
{
  --self->_navigationHeightPinCounter;
}

- (double)externalPresentationNavigationHeight
{
  double v3;
  UINavigationController *metricController;
  void *v5;
  double v6;
  double v7;
  PKPassGroupStackView *groupStackView;
  double v9;
  double v10;

  if (self->_navigationHeightPinCounter)
    return self->_pinnedNavigationHeight;
  v3 = 0.0;
  if (-[PKPassGroupsViewController isViewLoaded](self, "isViewLoaded"))
  {
    metricController = self->_metricController;
    if (metricController)
    {
      -[UINavigationController navigationBar](metricController, "navigationBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassGroupStackView bounds](self->_groupStackView, "bounds");
      v7 = v6;
      groupStackView = self->_groupStackView;
      objc_msgSend(v5, "bounds");
      -[PKPassGroupStackView convertRect:fromView:](groupStackView, "convertRect:fromView:", v5);
      v3 = v9 + v10 - v7;

    }
  }
  return v3;
}

- (BOOL)isInField
{
  return self->_inField;
}

- (void)viewTapped:(id)a3
{
  PKExpiredPassesNavigationController *v4;
  PKExpiredPassesNavigationController *v5;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68318], 0, a3);
  if (PKExpiredPassesRefreshEnabled())
    v4 = -[PKExpiredPassesNavigationController initWithExistingGroupsController:delegate:]([PKExpiredPassesNavigationController alloc], "initWithExistingGroupsController:delegate:", self->_groupsController, self);
  else
    v4 = -[PKEditPassesNavigationController initWithExistingGroupsController:]([PKEditPassesNavigationController alloc], "initWithExistingGroupsController:", self->_groupsController);
  v5 = v4;
  -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4
{
  PKGroupsController *groupsController;
  id v5;

  groupsController = self->_groupsController;
  objc_msgSend(a4, "uniqueID", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKGroupsController handleUserPassDelete:](groupsController, "handleUserPassDelete:", v5);

}

- (BOOL)groupStackViewShouldAllowReordering:(id)a3
{
  return -[PKGroupsController reorderingEnabled](self->_groupsController, "reorderingEnabled", a3);
}

- (void)groupStackViewDidBeginReordering:(id)a3
{
  -[PKGroupsController suppressRemoteUpdates:](self->_groupsController, "suppressRemoteUpdates:", 1);
}

- (void)groupStackViewDidEndReordering:(id)a3
{
  -[PKGroupsController enableRemoteUpdates](self->_groupsController, "enableRemoteUpdates", a3);
}

- (void)groupStackView:(id)a3 groupDidMoveFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  -[PKGroupsController moveGroupAtIndex:toIndex:](self->_groupsController, "moveGroupAtIndex:toIndex:", a4, a5);
}

- (void)allowIdleTimer
{
  void *v3;
  NSTimer *allowDimmingTimer;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdleTimerDisabled:", 0);

  -[NSTimer invalidate](self->_allowDimmingTimer, "invalidate");
  allowDimmingTimer = self->_allowDimmingTimer;
  self->_allowDimmingTimer = 0;

}

- (void)updateLockscreenIdleTimer
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  NSTimer *allowDimmingTimer;
  NSTimer *v8;
  NSTimer *v9;

  if ((PKRunningInRemoteContext() & 1) == 0)
  {
    if (-[PKPassGroupStackView isPresentingPassViewFront](self->_groupStackView, "isPresentingPassViewFront")
      && (-[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "passType") != 1;

    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdleTimerDisabled:", v5);

    -[NSTimer invalidate](self->_allowDimmingTimer, "invalidate");
    allowDimmingTimer = self->_allowDimmingTimer;
    self->_allowDimmingTimer = 0;

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_allowIdleTimer, 0, 0, 120.0);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v9 = self->_allowDimmingTimer;
      self->_allowDimmingTimer = v8;

    }
  }
}

- (void)_handleStatusBarChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  if (self->_viewAppeared)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applicationState") == 0;

  }
  else
  {
    v5 = 0;
  }
  -[PKPassGroupsViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");
  -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self->_groupStackView, "layoutContentForCurrentPresentationState:", v5);

}

- (void)_startPassViewedNotificationTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *passViewedNotificationTimer;
  id v6;

  -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__passViewedNotificationTimerFired, 0, 0, 5.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    passViewedNotificationTimer = self->_passViewedNotificationTimer;
    self->_passViewedNotificationTimer = v4;

    v3 = v6;
  }

}

- (void)_clearPassViewedNotificationTimer
{
  NSTimer *passViewedNotificationTimer;

  -[NSTimer invalidate](self->_passViewedNotificationTimer, "invalidate");
  passViewedNotificationTimer = self->_passViewedNotificationTimer;
  self->_passViewedNotificationTimer = 0;

}

- (void)_passViewedNotificationTimerFired
{
  void *v3;
  void *v4;
  NSTimer *passViewedNotificationTimer;
  id v6;

  -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifyPassUsedWithIdentifier:fromSource:", v4, 1);

  }
  passViewedNotificationTimer = self->_passViewedNotificationTimer;
  self->_passViewedNotificationTimer = 0;

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  unint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentService *paymentService;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4.var0;
  v6 = a3;
  if (!self->_backgroundMode != ((v4 >> 8) & 1))
  {
    self->_backgroundMode = (v4 & 0x100) == 0;
    -[PKPassGroupsViewController _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", (v4 & 0x100) != 0);
    if (self->_backgroundMode)
    {
      self->_passesAreOutdated = 1;
      -[PKPassGroupsViewController _clearPassViewedNotificationTimer](self, "_clearPassViewedNotificationTimer");
      -[PKPassGroupsViewController allowIdleTimer](self, "allowIdleTimer");
    }
    else
    {
      self->_inField = 0;
      -[PKPassGroupsViewController _passToPresent](self, "_passToPresent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "uniqueID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v9, 1, 0);

      }
      else
      {
        -[PKPassGroupsViewController _prewarmSemanticTileInformation](self, "_prewarmSemanticTileInformation");
      }
      if ((-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") & 0xFFFFFFFFFFFFFFFDLL) == 5)
      {
        -[PKPassGroupsViewController _clearPassViewedNotificationTimer](self, "_clearPassViewedNotificationTimer");
        -[PKPassGroupsViewController _startPassViewedNotificationTimer](self, "_startPassViewedNotificationTimer");
      }
      paymentService = self->_paymentService;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
      v11[3] = &unk_1E3E61E98;
      v11[4] = self;
      -[PKPaymentService applicationMessagesWithCompletion:](paymentService, "applicationMessagesWithCompletion:", v11);
      -[PKDiscoveryDataSource updateArticleLayouts](self->_discoveryDataSource, "updateArticleLayouts");
      -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");

    }
  }

}

void __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D66AE0], "createForMessages:", v2);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1232), v3);
  if (v2)

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1064));
  objc_msgSend(WeakRetained, "setContent:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232), 1);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateHeaderAndSubheaderViewsIfNecessary");
}

- (void)groupStackViewWantsPaymentPresentation:(id)a3 fromButton:(BOOL)a4
{
  -[PKPassGroupsViewController forcePaymentPresentationFromButton:](self, "forcePaymentPresentationFromButton:", a4);
}

- (void)groupStackViewDidChangeCoachingState:(id)a3
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134349056;
    v6 = objc_msgSend(a3, "coachingState");
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring coaching feedback: %{public}ld", (uint8_t *)&v5, 0xCu);
  }

}

- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5
{
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a4, "uniqueID", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PKPassGroupsViewController_passPersonalizationViewController_didFinishPersonalizingPass_success___block_invoke;
  v7[3] = &unk_1E3E62288;
  v7[4] = self;
  -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v6, 1, v7);

}

uint64_t __99__PKPassGroupsViewController_passPersonalizationViewController_didFinishPersonalizingPass_success___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  if (!a4)
    -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
  objc_msgSend(v11, "contentOffset");
  v7 = v6;
  objc_msgSend(v11, "adjustedContentInset");
  v9 = -v8;
  if (v7 < v9 && v9 - v7 >= 66.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
    objc_msgSend(WeakRetained, "collapse");

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
  -[PKPassGroupStackView noteDidEndScrollingForTesting](self->_groupStackView, "noteDidEndScrollingForTesting");
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  -[PKPassGroupStackView tilePassesEagerly:](self->_groupStackView, "tilePassesEagerly:", 1);
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  if (-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState", a3, a4) != 6
    && (objc_msgSend((id)objc_opt_class(), "isPerformingAction") & 1) == 0)
  {
    -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
    -[PKPassGroupStackView stageGroupInPresentationState:atIndex:](self->_groupStackView, "stageGroupInPresentationState:atIndex:", 2, a5);
    -[PKPassGroupStackView setPresentationState:animated:](self->_groupStackView, "setPresentationState:animated:", -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState"), !self->_backgroundMode);
  }
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  id v7;

  v7 = a4;
  if (-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") != 6)
  {
    if (-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") == 7
      && -[PKPassGroupStackView modalGroupIndex](self->_groupStackView, "modalGroupIndex") == a5)
    {
      -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, 0);
    }
    -[PKPassGroupStackView deleteGroup:atIndex:](self->_groupStackView, "deleteGroup:atIndex:", v7, a5);
  }

}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v9;

  v9 = a4;
  if (-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") == 4
    && !self->_backgroundMode)
  {
    if (a5 != a6)
      -[PKPassGroupStackView moveGroup:fromIndex:toIndex:](self->_groupStackView, "moveGroup:fromIndex:toIndex:", v9, a5, a6);
  }
  else if (-[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") == 5
         || -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") == 7)
  {
    -[PKPassGroupStackView reloadData](self->_groupStackView, "reloadData");
    if (-[PKPassGroupStackView modalGroupIndex](self->_groupStackView, "modalGroupIndex") == a5)
      -[PKPassGroupStackView setModalGroupIndex:](self->_groupStackView, "setModalGroupIndex:", a6);
    -[PKPassGroupStackView setPresentationState:animated:](self->_groupStackView, "setPresentationState:animated:", -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState"), !self->_backgroundMode);
  }

}

- (id)groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:(id)a3
{
  return self->_passUniqueIDsToExcludeFromFiltering;
}

- (void)didUpdateApplicationMessages:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassGroupsViewController_didUpdateApplicationMessages___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __59__PKPassGroupsViewController_didUpdateApplicationMessages___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D66AE0], "createForMessages:", v2);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1232), v3);
  if (v2)

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1064));
  objc_msgSend(WeakRetained, "setContent:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232), 1);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateHeaderAndSubheaderViewsIfNecessary");
}

- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1240) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1243)
    && (!objc_msgSend(*(id *)(a1 + 40), "secondaryPropertiesRequired")
     || objc_msgSend(*(id *)(a1 + 40), "secondaryPropertiesAcquired")))
  {
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE53BB68))
    {
      if ((objc_msgSend(v2, "suppressFieldDetect") & 1) == 0)
        goto LABEL_18;
LABEL_14:
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Presented view controller supressed field detect", buf, 2u);
      }

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "topViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE53BB68)
        && objc_msgSend(v3, "suppressFieldDetect"))
      {

        goto LABEL_14;
      }
      objc_msgSend(v2, "viewControllers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v3 || (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE53BB68) & 1) == 0)
      {

      }
      else
      {
        v6 = objc_msgSend(v5, "suppressFieldDetect");

        if (v6)
          goto LABEL_14;
      }
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_156;
    v12[3] = &unk_1E3E6C318;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v8, "getMetadataForFieldWithProperties:withHandler:", v10, v12);

    v2 = v13;
LABEL_19:

  }
}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_156(int8x16_t *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  int8x16_t v8;
  _QWORD block[4];
  int8x16_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "shouldIgnoreField"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_157;
    block[3] = &unk_1E3E61400;
    v8 = a1[2];
    v7 = (id)v8.i64[0];
    v10 = vextq_s8(v8, v8, 8uLL);
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[2].i64[0];
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring entered field: %@", buf, 0xCu);
    }

  }
}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_157(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_2;
  v3[3] = &unk_1E3E61400;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "dismissPresentedVCsWithRequirements:animated:performAction:", 31, 1, v3);

}

uint64_t __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPassWithFieldProperties:fieldMetadata:animated:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)paymentDeviceDidExitField
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKPassGroupsViewController_paymentDeviceDidExitField__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__PKPassGroupsViewController_paymentDeviceDidExitField__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1240) = 0;
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B70], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF8], *MEMORY[0x1E0D68F50]);
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D69940];
  v5[0] = *MEMORY[0x1E0D698E8];
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjects:sendEvent:", v4, v1);

}

- (void)paymentServiceReceivedInterruption
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPassGroupsViewController_paymentServiceReceivedInterruption__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__PKPassGroupsViewController_paymentServiceReceivedInterruption__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1240) = 0;
  return result;
}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKPassGroupsViewController_didReceivePendingProvisioningUpdate___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __66__PKPassGroupsViewController_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));

  if (WeakRetained)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
    PKPendingProvisioningBackgroundProvisioningInBuddyTypes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hasPendingProvisioningsOfTypes:", v4);

    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));
    objc_msgSend(v6, "setShowBackgroundProvisioningHint:animated:", v5, 1);

  }
}

- (BOOL)presentingPass
{
  return -[PKPassGroupStackView isPresentingPassViewFront](self->_groupStackView, "isPresentingPassViewFront");
}

- (id)presentedPass
{
  void *v3;

  if (-[PKPassGroupsViewController presentingPass](self, "presentingPass"))
  {
    -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_presentGroupWithIndex:(unint64_t)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, uint64_t);
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  _QWORD v19[4];
  void (**v20)(id, uint64_t);
  _QWORD v21[4];
  id v22;
  void (**v23)(id, uint64_t);
  _QWORD aBlock[5];
  id v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;

  v7 = a5;
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a6;
  -[PKPassGroupsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v12 = -[PKPassGroupStackView canPerformPaymentForGroupAtIndex:](self->_groupStackView, "canPerformPaymentForGroupAtIndex:", a3);
  if ((objc_msgSend(v10, "isFieldDetect") & 1) != 0 || (objc_msgSend(v10, "wantsForcedPayment") & 1) != 0)
  {
    if (v12)
      goto LABEL_9;
  }
  else if ((objc_msgSend(v10, "wantsPersistentCardEmulation") & v12 & 1) != 0)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isPostPayment") & 1) == 0 && self->_externalModalPresentationAllowed)
  {
    v13 = 0;
    v14 = 7;
    goto LABEL_10;
  }
LABEL_9:
  v13 = 1;
  v14 = 5;
LABEL_10:
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11)
      v11[2](v11, 1);
  }
  else if (-[PKPassGroupStackView modalGroupIndex](self->_groupStackView, "modalGroupIndex") == a3
         && -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState") == v14
         && (objc_msgSend(v10, "isPostPayment") & 1) == 0
         && !objc_msgSend(v10, "wantsPersistentCardEmulation"))
  {
    if (v11)
      v11[2](v11, 0);
  }
  else
  {
    -[PKPassGroupStackView presentDiff:completion:](self->_groupStackView, "presentDiff:completion:", 0, 0);
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke;
    aBlock[3] = &unk_1E3E6C340;
    aBlock[4] = self;
    v26 = a3;
    v27 = v14;
    v25 = v10;
    v28 = v7;
    v16 = _Block_copy(aBlock);
    -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v17, "isBeingDismissed") & 1) == 0)
    {
      if (v13 && -[PKPassGroupStackView modalGroupIndex](self->_groupStackView, "modalGroupIndex") == a3)
        -[PKPassGroupStackView modalPresentationIsPending](self->_groupStackView, "modalPresentationIsPending");
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_3;
      v21[3] = &unk_1E3E6C368;
      v18 = &v22;
      v22 = v16;
      v23 = v11;
      -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v7, v21);

    }
    else
    {
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_5;
      v19[3] = &unk_1E3E614F0;
      v18 = (id *)&v20;
      v20 = v11;
      (*((void (**)(void *, _QWORD *))v16 + 2))(v16, v19);
    }

  }
}

void __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setModalGroupIndex:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 984);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_2;
  v10[3] = &unk_1E3E669E0;
  v10[4] = v4;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v6, "setPresentationState:withContext:animated:completion:", v7, v5, v8, v10);

}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "presentationState");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_4;
  v2[3] = &unk_1E3E614F0;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)forcePaymentPresentationFromButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  PKPassPresentationContext *v7;

  v3 = a3;
  if (-[PKPassGroupsViewController presentingPass](self, "presentingPass"))
  {
    if (-[PKPassGroupStackView presentedPassCanPerformPayment](self->_groupStackView, "presentedPassCanPerformPayment"))
    {
      if (!-[PKPassGroupStackView presentedPassIsPerformingPayment](self->_groupStackView, "presentedPassIsPerformingPayment"))
      {
        v7 = objc_alloc_init(PKPassPresentationContext);
        -[PKPassPresentationContext setForcePayment:](v7, "setForcePayment:", 1);
        -[PKPassPresentationContext setForcedFromButton:](v7, "setForcedFromButton:", v3);
        -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uniqueID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v6, v7, 1, 0);

      }
    }
  }
  else
  {
    -[PKPassGroupsViewController presentDefaultPaymentPassInPaymentPresentationFromButton:withAnimated:completionHandler:](self, "presentDefaultPaymentPassInPaymentPresentationFromButton:withAnimated:completionHandler:", v3, 1, 0);
  }
}

- (void)presentDefaultPaymentPassInPaymentPresentationFromButton:(BOOL)a3 withAnimated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  PKPassPresentationContext *v9;

  v5 = a3;
  v7 = a5;
  v9 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setForcePayment:](v9, "setForcePayment:", 1);
  -[PKPassPresentationContext setForcedFromButton:](v9, "setForcedFromButton:", v5);
  -[PKPaymentService defaultPaymentPassUniqueIdentifier](self->_paymentService, "defaultPaymentPassUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v8, v9, 1, v7);

}

- (void)presentPassWithUpdateUserNotificationIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPassGroupsViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v6);

}

void __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diffForPassUpdateUserNotificationWithIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke_2;
    v8[3] = &unk_1E3E619E0;
    v8[4] = v5;
    v9 = v3;
    objc_msgSend(v5, "presentPassWithUniqueID:animated:completionHandler:", v4, 1, v8);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Invalid bulletin URL specified. Ignoring.", v7, 2u);
    }

  }
}

uint64_t __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 984), "presentDiff:completion:", *(_QWORD *)(result + 40), 0);
  return result;
}

- (void)presentPassWithFieldProperties:(id)a3 fieldMetadata:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  int64_t v17;
  void *v18;
  id v19;

  v7 = a5;
  v19 = a3;
  v10 = a4;
  v11 = a6;
  -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v12 && objc_msgSend(v12, "passType") != 1 && PKValueAddedServicesEnabledForPass() == 0;
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  if (-[PKPassGroupStackView isModallyPresentedPassAuthorized](self->_groupStackView, "isModallyPresentedPassAuthorized")|| ((objc_msgSend(v16, "isFrontmostPassAuthorized") | v14) & 1) != 0)
  {
    v17 = -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState");
    self->_presentationState = v17;
    -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self->_groupStackView, "setPresentationState:withContext:animated:completion:", v17, 0, v7, v11);
  }
  else
  {
    objc_msgSend(v10, "associatedPassIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassWithFieldProperties:fieldPassUniqueIdentifiers:animated:completionHandler:](self, "presentPassWithFieldProperties:fieldPassUniqueIdentifiers:animated:completionHandler:", v19, v18, v7, v11);

  }
}

- (void)presentPassWithFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  PKPassGroupStackView *groupStackView;
  int64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  id v20;
  id v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PKPassGroupStackView isModallyPresentedPassAuthorized](self->_groupStackView, "isModallyPresentedPassAuthorized");
  groupStackView = self->_groupStackView;
  if (v13)
  {
    v15 = -[PKPassGroupStackView presentationState](groupStackView, "presentationState");
    self->_presentationState = v15;
    -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self->_groupStackView, "setPresentationState:withContext:animated:completion:", v15, 0, v7, v12);
  }
  else
  {
    -[PKPassGroupStackView modalGroupFrontmostPass](groupStackView, "modalGroupFrontmostPass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
    {
      v18 = -[PKPassGroupStackView presentationState](self->_groupStackView, "presentationState");
      self->_presentationState = v18;
      -[PKPassGroupStackView setPresentationState:animated:](self->_groupStackView, "setPresentationState:animated:", v18, v7);
    }

    v21 = 0;
    -[PKPassGroupsViewController presentationContextForFieldProperties:fieldPassUniqueIdentifiers:passUniqueIdentifierToPresent:](self, "presentationContextForFieldProperties:fieldPassUniqueIdentifiers:passUniqueIdentifierToPresent:", v10, v11, &v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    if (v19)
      -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v20, v19, v7, v12);
    else
      -[PKPassGroupsViewController presentOnscreen:context:withCompletionHandler:](self, "presentOnscreen:context:withCompletionHandler:", v7, 0, v12);

  }
}

- (id)presentationContextForFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 passUniqueIdentifierToPresent:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  id *v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id *v51;
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "style") == 8)
    goto LABEL_37;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B68], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF8], *MEMORY[0x1E0D68F50]);
  v13 = v12;
  v14 = v10;
  v15 = v14;
  if (v14)
    v16 = v13 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v51 = a5;
    v17 = objc_msgSend(v14, "passType");
    v18 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v17 + 1) >= 3)
      v19 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v19 = off_1E3E6D478[v17 + 1];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D69040]);

    v20 = objc_msgSend(v15, "style");
    if (v20 < 0xD && ((0x13FFu >> v20) & 1) != 0)
      v21 = off_1E3E6D490[v20];
    else
      v21 = (__CFString *)*v18;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D69038]);

    objc_msgSend(v15, "nfcPayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D69000]);

    v24 = v15;
    if (objc_msgSend(v24, "passType") == 1)
    {
      objc_msgSend(v24, "secureElementPass");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "cardType");
      if (v26 <= 4)
        v23 = (__CFString *)**((id **)&unk_1E3E6D4F8 + v26);

    }
    else
    {
      v23 = CFSTR("other");
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D69028]);
    objc_msgSend(v24, "secureElementPass");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isIdentityPass"))
    {
      v28 = objc_msgSend(v27, "identityType");
      if ((unint64_t)(v28 - 1) < 3)
      {
        v29 = off_1E3E6D520[v28 - 1];
        goto LABEL_25;
      }
    }
    else if (objc_msgSend(v27, "isAccessPass"))
    {
      v30 = objc_msgSend(v27, "accessType");
      if (v30 < 7)
      {
        v29 = off_1E3E6D538[v30];
        goto LABEL_25;
      }
    }
    v29 = (__CFString *)*v18;
LABEL_25:

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D69020]);
    objc_msgSend(v24, "secureElementPass");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "devicePaymentApplications");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D68940]);
    objc_msgSend(v24, "secureElementPass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)*MEMORY[0x1E0D69618];
    objc_msgSend(v34, "organizationName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "length"))
    {
      v37 = objc_msgSend(v34, "cardType");
      if (v37 == 4 || v37 == 2)
      {
        v38 = v36;

        v35 = v38;
      }
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D68D88]);
    a5 = v51;
  }

  v39 = v13;
  v40 = objc_msgSend(v8, "terminalType");
  if (v40 <= 5)
  {
    v41 = (_QWORD *)MEMORY[0x1E0D69398];
    if (((1 << v40) & 0x2D) == 0)
    {
      v42 = *MEMORY[0x1E0D69398];
      if (v40 != 1)
        objc_msgSend(v39, "setObject:forKeyedSubscript:", CFSTR("identity"), *MEMORY[0x1E0D69398]);
      objc_msgSend(v39, "setObject:forKeyedSubscript:", CFSTR("payment"), v42);
    }
    objc_msgSend(v39, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68EF0], *v41);
  }

  v43 = (void *)MEMORY[0x1E0D66A58];
  v44 = *MEMORY[0x1E0D69940];
  v52[0] = *MEMORY[0x1E0D698E8];
  v52[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "subjects:sendEvent:", v45, v39);

LABEL_37:
  if (v11 && (objc_msgSend(v9, "containsObject:", v11) & 1) != 0
    || (objc_msgSend(v9, "firstObject"),
        v46 = objc_claimAutoreleasedReturnValue(),
        v11,
        (v11 = (void *)v46) != 0))
  {
    v47 = objc_msgSend(v8, "valueAddedServiceMode");
    objc_msgSend(v9, "pk_arrayByRemovingObject:", v11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassPresentationContext contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:terminalType:](PKPassPresentationContext, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:terminalType:", (unint64_t)(v47 - 2) < 3, v48, 0, objc_msgSend(v8, "terminalType"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFieldDetect:", 1);
    if (a5)
      *a5 = objc_retainAutorelease(v11);

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (void)reloadPassesWithCompletion:(id)a3
{
  self->_passesAreOutdated = 1;
  -[PKPassGroupsViewController updatePassesIfNecessaryWithCompletion:](self, "updatePassesIfNecessaryWithCompletion:", a3);
}

- (void)reloadPasses
{
  PKGroupsController *groupsController;
  PKGroupsController *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_reloadingPasses)
  {
    groupsController = self->_groupsController;
    self->_reloadingPasses = groupsController != 0;
    if (groupsController)
    {
      v4 = self->_groupsController;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __42__PKPassGroupsViewController_reloadPasses__block_invoke;
      v15[3] = &unk_1E3E612E8;
      v15[4] = self;
      -[PKGroupsController reloadGroupsWithCompletion:](v4, "reloadGroupsWithCompletion:", v15);
    }
    else
    {
      v5 = (void *)-[NSMutableArray copy](self->_blocksQueuedForUpdateCompletion, "copy");
      -[NSMutableArray removeAllObjects](self->_blocksQueuedForUpdateCompletion, "removeAllObjects");
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v8);
      }

    }
  }
}

void __42__PKPassGroupsViewController_reloadPasses__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1242) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1131) = 0;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)queuePersistentCardEmulation
{
  self->_persistentCardEmulationQueued = 1;
}

- (void)presentPaymentSetupInMode:(int64_t)a3 referrerIdentifier:(id)a4 paymentNetwork:(id)a5 transitNetworkIdentifier:(id)a6 allowedFeatureIdentifiers:(id)a7 productIdentifiers:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD aBlock[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (self->_welcomeStateEnabled && !self->_inFailForward)
  {
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke;
    aBlock[3] = &unk_1E3E6C390;
    aBlock[4] = self;
    v28 = v16;
    v29 = v15;
    v33 = a3;
    v30 = v14;
    v31 = v17;
    v32 = v18;
    v20 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v21, "isBeingDismissed"))
      {
LABEL_9:

        goto LABEL_10;
      }
      -[PKPassGroupsViewController transitionCoordinator](self, "transitionCoordinator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23[0] = v19;
        v23[1] = 3221225472;
        v23[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_3;
        v23[3] = &unk_1E3E67BD0;
        v24 = v20;
        objc_msgSend(v22, "animateAlongsideTransition:completion:", 0, v23);

      }
      else
      {
        v20[2](v20);
      }
    }
    else
    {
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2;
      v25[3] = &unk_1E3E61590;
      v26 = v20;
      -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v25);
      v22 = v26;
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "headerForPassType:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  else
    v2 = 0;
  if (*(_QWORD *)(a1 + 48))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 48), 0);
  else
    v3 = 0;
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:", v4, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), v3, v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

uint64_t __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentPileOffscreen
{
  if (!-[PKPassGroupStackView pilingMode](self->_groupStackView, "pilingMode"))
    -[PKPassGroupStackView setPilingMode:](self->_groupStackView, "setPilingMode:", 1);
}

- (void)presentGroupTable
{
  -[PKPassGroupsViewController presentGroupTableAnimated:](self, "presentGroupTableAnimated:", 0);
}

- (void)presentGroupTableAnimated:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  -[PKPassGroupStackView setModalGroupIndex:](self->_groupStackView, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKPassGroupsViewController_presentGroupTableAnimated___block_invoke;
  v5[3] = &unk_1E3E64C10;
  v5[4] = self;
  v6 = a3;
  -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v5);
}

uint64_t __56__PKPassGroupsViewController_presentGroupTableAnimated___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 1088) = 4;
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 1129))
    return objc_msgSend(*(id *)(v1 + 984), "setPresentationState:animated:", *(_QWORD *)(v1 + 1088), *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[PKPassGroupStackView setTableModalPresentationEnabled:animated:](self->_groupStackView, "setTableModalPresentationEnabled:animated:", a3, a4);
}

- (void)presentPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", a3, 0, a4, a5);
}

- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  -[PKPassGroupsViewController presentPassDetailsWithUniqueID:animated:action:completionHandler:](self, "presentPassDetailsWithUniqueID:animated:action:completionHandler:", a3, a4, 0, a5);
}

- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 action:(unint64_t)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[PKPassGroupsViewController _passFromGroupsControllerWithUniqueIdentifier:](self, "_passFromGroupsControllerWithUniqueIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "passType");
  v14 = v13 == 1;
  if (v12 && (v13 != 1 || !self->_inFailForward))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_2;
    v16[3] = &unk_1E3E6C408;
    v20 = v8;
    v16[4] = self;
    v19 = a5;
    v18 = v11;
    v21 = v14;
    v17 = v12;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v10, v8, v16);

    v15 = v18;
    goto LABEL_7;
  }
  if (-[PKGroupsController containsExpiredPassWithUniqueID:](self->_groupsController, "containsExpiredPassWithUniqueID:", v10))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke;
    v22[3] = &unk_1E3E614F0;
    v23 = v11;
    -[PKPassGroupsViewController presentExpiredPassWithUniqueID:animated:completionHandler:](self, "presentExpiredPassWithUniqueID:animated:completionHandler:", v10, v8, v22);
    v15 = v23;
LABEL_7:

    goto LABEL_10;
  }
  if (v11)
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
LABEL_10:

}

uint64_t __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PKNavigationController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "presentPassDetailsAnimated:action:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
      goto LABEL_16;
    }
    v6 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 40), "paymentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_paymentPassDetailsViewControllerForPaymentPass:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_9:
        v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
        if (v4)
          objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
        v10 = *(void **)(a1 + 32);
        v11 = *(unsigned __int8 *)(a1 + 64);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_3;
        v13[3] = &unk_1E3E61590;
        v14 = *(id *)(a1 + 48);
        objc_msgSend(v10, "presentViewController:animated:completion:", v9, v11, v13);

LABEL_15:
LABEL_16:

        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_barcodePassDetailsViewControllerForBarcodePass:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_9;
    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
    goto LABEL_15;
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
}

uint64_t __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentISO18013DetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PKPassGroupsViewController presentPassDetailsWithUniqueID:animated:action:completionHandler:](self, "presentPassDetailsWithUniqueID:animated:action:completionHandler:", a3, a4, 3, a5);
}

- (void)presentImportSafariCardConsentAnimated:(BOOL)a3 referralSource:(unint64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  void (**v10)(_QWORD);
  PKVirtualCardPrivacyExplanationViewController *v11;
  PKVirtualCardPrivacyExplanationViewController *v12;
  PKNavigationController *v13;
  PKNavigationController *v14;
  _QWORD v15[5];
  PKNavigationController *v16;
  void (**v17)(id, _QWORD);
  BOOL v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD aBlock[4];
  id v22;
  id location;

  v6 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v22, &location);
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (PKSafariCredentialProvisioningConsented() == 1)
  {
    v10[2](v10);
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    v11 = [PKVirtualCardPrivacyExplanationViewController alloc];
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_2;
    v19[3] = &unk_1E3E614F0;
    v20 = v10;
    v12 = -[PKVirtualCardPrivacyExplanationViewController initWithContext:referralSource:resultCallback:](v11, "initWithContext:referralSource:resultCallback:", 0, a4, v19);
    v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v12);
    -[PKNavigationController setNavigationBarHidden:](v13, "setNavigationBarHidden:", 1);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_3;
    v15[3] = &unk_1E3E66EC8;
    v15[4] = self;
    v14 = v13;
    v16 = v14;
    v18 = v6;
    v17 = v8;
    -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, v6, v15);

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentPaymentSetupInMode:referrerIdentifier:paymentNetwork:transitNetworkIdentifier:allowedFeatureIdentifiers:productIdentifiers:", 0, 0, 0, 0, 0, 0);

}

uint64_t __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_4;
  v5[3] = &unk_1E3E61590;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentViewController:animated:completion:", v4, v3, v5);

}

uint64_t __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentSetupVirtualCardNumberForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  char v12;
  _QWORD v13[4];
  id v14;
  PKPassGroupsViewController *v15;
  void (**v16)(id, uint64_t);
  id v17;
  char v18;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  -[PKPassGroupsViewController _passFromGroupsControllerWithUniqueIdentifier:](self, "_passFromGroupsControllerWithUniqueIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (self->_inFailForward)
    {
      if (v9)
        v9[2](v9, 1);
    }
    else
    {
      if (objc_msgSend(v11, "supportsVirtualCardNumber"))
        v12 = objc_msgSend(v11, "hasActiveVirtualCard") ^ 1;
      else
        v12 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke;
      v13[3] = &unk_1E3E6C430;
      objc_copyWeak(&v17, &location);
      v18 = v12;
      v14 = v11;
      v15 = self;
      v16 = v9;
      -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v8, v6, v13);

      objc_destroyWeak(&v17);
    }
  }

  objc_destroyWeak(&location);
}

void __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_2;
    block[3] = &unk_1E3E68B98;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    v12 = *(_BYTE *)(a1 + 64);
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v11);
  }
}

void __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  PKVirtualCardEnrollmentViewController *v4;
  PKNavigationController *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
  {
    PKDismissedKeyForPass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKSharedCacheSetBoolForKey();

    v4 = -[PKVirtualCardEnrollmentViewController initWithPaymentPass:context:delegate:]([PKVirtualCardEnrollmentViewController alloc], "initWithPaymentPass:context:delegate:", *(_QWORD *)(a1 + 32), 0, WeakRetained);
    v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
    -[PKNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_3;
    v8[3] = &unk_1E3E61590;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

uint64_t __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentExpressUpgradeDetailForPassUniqueID:(id)a3 assetIdentifier:(id)a4 hideDisableAction:(unint64_t)a5 reportingMetadata:(id)a6 animated:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  unint64_t v29;
  _BOOL4 v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  _QWORD aBlock[4];
  id v39;
  PKPassGroupsViewController *v40;
  id v41;
  BOOL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v9 = a7;
  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  -[PKPassGroupsViewController _passFromGroupsControllerWithUniqueIdentifier:](self, "_passFromGroupsControllerWithUniqueIdentifier:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "paymentPass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v29 = a5;
    v30 = v9;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v19, "devicePaymentApplications");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v44;
LABEL_4:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v24), "supportsExpress") & 1) != 0)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v22)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      if (self->_inFailForward)
        goto LABEL_12;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke;
      aBlock[3] = &unk_1E3E6C458;
      v25 = v19;
      v39 = v25;
      v40 = self;
      v42 = v30;
      v26 = v17;
      v41 = v26;
      v27 = _Block_copy(aBlock);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_3;
      v31[3] = &unk_1E3E6C4A8;
      v31[4] = self;
      v32 = v15;
      v37 = v29;
      v33 = v25;
      v34 = v16;
      v35 = v27;
      v36 = v26;
      v28 = v27;
      -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v14, v30, v31);

    }
    else
    {
LABEL_10:

LABEL_12:
      if (v17)
        (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
    }
  }

}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKNavigationController *v4;
  void *v5;
  void *v6;
  PKPaymentSetupMoreInfoViewController *v7;
  void *v8;
  PKPaymentSetupMoreInfoViewController *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(PKNavigationController);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PKPaymentSetupMoreInfoViewController alloc];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentSetupMoreInfoViewController initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:reportingSource:](v7, "initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:reportingSource:", v8, *(_QWORD *)(a1 + 32), v6, 0, 0, 1);

  -[PKNavigationController pushViewController:animated:](v4, "pushViewController:animated:", v9, 0);
  objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3E61590;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v10, "presentViewController:animated:completion:", v4, v11, v12);

}

uint64_t __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if ((a2 & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 72);
    if (v2)
      (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_4;
    v8[3] = &unk_1E3E6C480;
    v9 = *(id *)(a1 + 64);
    objc_msgSend(v3, "_setupItemForExpressUpgradeWithAsset:hideDisableAction:pass:reportingMetadata:completionHandler:", v4, v5, v6, v7, v8);

  }
}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_5;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_setupItemForExpressUpgradeWithAsset:(id)a3 hideDisableAction:(unint64_t)a4 pass:(id)a5 reportingMetadata:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD aBlock[4];
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  PKLogFacilityTypeGetObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: _setupItemForExpressUpgradeMarket: %@", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3E63218;
  v17 = v14;
  v28 = v17;
  v18 = _Block_copy(aBlock);
  if (v11)
  {
    v19 = a4 == 1;
    objc_msgSend(MEMORY[0x1E0D66E70], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke_2;
    v22[3] = &unk_1E3E6C4D0;
    v25 = v18;
    v26 = v19;
    v23 = v12;
    v24 = v13;
    objc_msgSend(v20, "fetchMarketNotificationAssetsForIdentifier:isDiscretionary:completionHandler:", v11, 0, v22);

    v21 = v25;
  }
  else
  {
    PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v18 + 2))(v18, v21);
  }

}

void __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (objc_class *)MEMORY[0x1E0D67308];
    v4 = a2;
    v5 = (id)objc_msgSend([v3 alloc], "initWithMoreInfoDictionary:", v4);

    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

void __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)presentExpiredPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  PKExpiredPassesNavigationController *v10;
  PKExpiredPassesNavigationController *v11;
  _QWORD v12[5];
  PKExpiredPassesNavigationController *v13;
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v10 = -[PKExpiredPassesNavigationController initWithExistingGroupsController:]([PKExpiredPassesNavigationController alloc], "initWithExistingGroupsController:", self->_groupsController);
  v11 = v10;
  if (v8 && v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke;
    v12[3] = &unk_1E3E6C4F8;
    v12[4] = self;
    v13 = v10;
    v16 = a4;
    v14 = v8;
    v15 = v9;
    -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v12);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

void __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  objc_initWeak(&location, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke_2;
  v6[3] = &unk_1E3E61B90;
  objc_copyWeak(&v9, &location);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "expiredPassesViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathOfExpiredPassWithUniqueID:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tableView:didSelectRowAtIndexPath:", v7, v6);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_7:
      v3 = v9;
      goto LABEL_8;
    }

    v3 = v9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)presentExpiredPassesAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  PKExpiredPassesNavigationController *v7;
  PKExpiredPassesNavigationController *v8;
  _QWORD v9[5];
  PKExpiredPassesNavigationController *v10;
  id v11;
  BOOL v12;

  v6 = a4;
  v7 = -[PKExpiredPassesNavigationController initWithExistingGroupsController:]([PKExpiredPassesNavigationController alloc], "initWithExistingGroupsController:", self->_groupsController);
  v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke;
    v9[3] = &unk_1E3E66EC8;
    v9[4] = self;
    v10 = v7;
    v12 = a3;
    v11 = v6;
    -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v9);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke_2;
  v6[3] = &unk_1E3E61590;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, v5, v6);

}

uint64_t __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentPassWithUniqueID:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSArray *v16;
  NSArray *passUniqueIDsToExcludeFromFiltering;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    if (-[PKGroupsController filteringEnabled](self->_groupsController, "filteringEnabled"))
    {
      -[PKGroupsController filteredPassUniqueIDs](self->_groupsController, "filteredPassUniqueIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v10);

      if (v15)
      {
        v23[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
        passUniqueIDsToExcludeFromFiltering = self->_passUniqueIDsToExcludeFromFiltering;
        self->_passUniqueIDsToExcludeFromFiltering = v16;

        self->_passesAreOutdated = 1;
      }
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke;
    v18[3] = &unk_1E3E6C4F8;
    v18[4] = self;
    v19 = v10;
    v22 = a5;
    v20 = v11;
    v21 = v13;
    -[PKPassGroupsViewController _presentWithUpdatedPasses:](self, "_presentWithUpdatedPasses:", v18);

  }
  else if (v12)
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
  }

}

void __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  char v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a1 + 32;
  v31 = 0;
  v31 = objc_msgSend(*(id *)(v3 + 1256), "groupIndexForPassUniqueID:", v2);
  v5 = *(void **)(*(_QWORD *)v4 + 1256);
  if (v29[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "groupAtIndex:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "passCount");
    v11 = v10 > 1;
    if (v10 >= 2)
      objc_msgSend(*(id *)(a1 + 32), "_beginSuppressingInstanceFooter");
    v12 = *(unsigned __int8 *)(a1 + 64);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_2;
    v21[3] = &unk_1E3E6C548;
    v14 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v25 = &v28;
    v21[4] = v14;
    v22 = v13;
    v23 = *(id *)(a1 + 48);
    v26 = *(_BYTE *)(a1 + 64);
    v27 = v11;
    v24 = *(id *)(a1 + 56);
    objc_msgSend(v14, "dismissPresentedVCsWithRequirements:animated:performAction:", 8, v12, v21);

    goto LABEL_7;
  }
  if (objc_msgSend(v5, "containsExpiredPassWithUniqueID:", *(_QWORD *)(a1 + 40)))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 64);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_4;
    v19[3] = &unk_1E3E614F0;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v6, "presentExpiredPassWithUniqueID:animated:completionHandler:", v7, v8, v19);
    v9 = v20;
LABEL_7:

    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v33 = v16;
    v34 = 2112;
    v35 = v17;
    _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%p): could not present pass %@ - does not exist.", buf, 0x16u);
  }

  v18 = *(_QWORD *)(a1 + 56);
  if (v18)
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, 1);
LABEL_8:
  _Block_object_dispose(&v28, 8);
}

void __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int16 v13;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "groupIndexForPassUniqueID:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 24);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_3;
  v7[3] = &unk_1E3E6C520;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v12 = v2;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v13 = *(_WORD *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v8, "_presentGroupWithIndex:context:animated:completionHandler:", v3, v6, v4, v7);

}

uint64_t __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t result;

  if ((a2 & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 73))
      goto LABEL_14;
    v4 = 0;
    v5 = (id *)(a1 + 32);
    goto LABEL_13;
  }
  v5 = (id *)(a1 + 32);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "modalGroupIndex");
  v7 = objc_msgSend(*((id *)*v5 + 157), "groupCount");
  if (v6 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    || (v6 == 0x7FFFFFFFFFFFFFFFLL ? (v8 = v7 == 1) : (v8 = 0), v8))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "presentPassWithUniqueID:withContext:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
  }
  if (*(_BYTE *)(a1 + 73))
  {
    v4 = *(_QWORD *)(a1 + 48);
LABEL_13:
    objc_msgSend(*v5, "_endSuppressingInstanceFooterWithContext:", v4);
  }
LABEL_14:
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentSearchWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "presentSearchWithCompletion:", v5);
  }
  else if (v5)
  {
    v5[2]();
  }

}

- (void)presentSearchWithQuery:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "presentSearchWithQuery:completion:", v8, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)presentFeatureSetupOrFeaturePass:(unint64_t)a3 referrerIdentifier:(id)a4 presentationContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26[2];
  _QWORD v27[5];
  id v28;
  id v29;
  void (**v30)(_QWORD);
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void (**v35)(_QWORD);
  id v36;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0C99E60];
  PKFeatureIdentifierToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      if (v12)
        v12[2](v12);
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke;
      v32[3] = &unk_1E3E6C5C0;
      v17 = &v36;
      objc_copyWeak(&v36, &location);
      v35 = v12;
      v33 = v10;
      v34 = v15;
      objc_msgSend(v16, "defaultAccountForFeature:completion:", 2, v32);
      v18 = (id *)&v35;

      v19 = v33;
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_4;
      v27[3] = &unk_1E3E6C660;
      v17 = &v31;
      objc_copyWeak(&v31, &location);
      v30 = v12;
      v27[4] = self;
      v28 = v10;
      v29 = v15;
      objc_msgSend(v20, "defaultAccountForFeature:completion:", 3, v27);
      v18 = (id *)&v30;

      v19 = v28;
      goto LABEL_7;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_11;
      v22[3] = &unk_1E3E6C6D8;
      v17 = v26;
      objc_copyWeak(v26, &location);
      v25 = v12;
      v23 = v11;
      v26[1] = (id)5;
      v24 = v10;
      objc_msgSend(v21, "defaultAccountForFeature:completion:", 5, v22);
      v18 = (id *)&v25;

      v19 = v23;
LABEL_7:

      objc_destroyWeak(v17);
      break;
    default:
      break;
  }

  objc_destroyWeak(&location);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_2;
  block[3] = &unk_1E3E6C598;
  objc_copyWeak(&v10, a1 + 7);
  v9 = a1[6];
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_3;
      v6[3] = &unk_1E3E6C570;
      objc_copyWeak(&v10, v2);
      v9 = *(id *)(a1 + 56);
      v7 = *(id *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v4, "presentCreditPassAnimated:completion:", 1, v6);

      objc_destroyWeak(&v10);
      goto LABEL_7;
    }
    objc_msgSend(WeakRetained, "presentPaymentSetupInMode:referrerIdentifier:paymentNetwork:transitNetworkIdentifier:allowedFeatureIdentifiers:productIdentifiers:", 4, *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48), 0);
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
LABEL_7:

}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  v7 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_msgSend(WeakRetained, "presentPaymentSetupInMode:referrerIdentifier:paymentNetwork:transitNetworkIdentifier:allowedFeatureIdentifiers:productIdentifiers:", 0, *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40), 0);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
    v5 = v7;
  }

}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_5;
  v8[3] = &unk_1E3E6C638;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v9 = v3;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v14);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && (v4 = *(void **)(a1 + 32)) != 0)
  {
    objc_msgSend(v4, "associatedPassUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "passWithUniqueID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_6;
      v14[3] = &unk_1E3E6C610;
      objc_copyWeak(&v19, v2);
      v18 = *(id *)(a1 + 64);
      v9 = *(id *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      v15 = v9;
      v16 = v10;
      v17 = v11;
      objc_msgSend(v8, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v14);

      objc_destroyWeak(&v19);
    }
    else
    {
      objc_msgSend(WeakRetained, "presentPaymentSetupInMode:referrerIdentifier:paymentNetwork:transitNetworkIdentifier:allowedFeatureIdentifiers:productIdentifiers:", 4, *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), 0);
      v13 = *(_QWORD *)(a1 + 64);
      if (v13)
        (*(void (**)(void))(v13 + 16))();
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }

}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained
    && (objc_msgSend(*(id *)(a1 + 32), "payLaterDetails"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasEligibleSpend"),
        v3,
        (v4 & 1) == 0))
  {
    +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:](PKPayLaterSetupFlowController, "defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 1192);
    *(_QWORD *)(v7 + 1192) = v6;

    objc_initWeak(&location, *(id *)(a1 + 40));
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1192);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_7;
    v10[3] = &unk_1E3E642D0;
    objc_copyWeak(&v12, &location);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v9, "fetchPayLaterDynamicContentWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_8;
  v8[3] = &unk_1E3E6C5E8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_8(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = *(_QWORD *)(a1 + 32) == 0;
    else
      v4 = 0;
    if (v4)
    {
      objc_msgSend(WeakRetained[149], "firstViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentedViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v6;
      else
        v8 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_10;
      v9[3] = &unk_1E3E61590;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, v9);

    }
    else
    {
      PKDisplayableErrorForCommonType();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      if (v6)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_9;
        v11[3] = &unk_1E3E61590;
        v12 = *(id *)(a1 + 40);
        objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, v11);

      }
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_12;
  v7[3] = &unk_1E3E6C688;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 48);
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(void **)(a1 + 64);
  v9 = v4;
  v12[1] = v5;
  v10 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v12);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_12(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4 && objc_msgSend(v4, "state") != 4)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_13;
      v15[3] = &unk_1E3E6C570;
      v6 = &v19;
      objc_copyWeak(&v19, v2);
      v18 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 32);
      v17 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "presentCreditPassAnimated:completion:", 1, v15);

      v9 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_15;
      v11[3] = &unk_1E3E6C6B0;
      v6 = v14;
      objc_copyWeak(v14, v2);
      v7 = *(id *)(a1 + 56);
      v8 = *(void **)(a1 + 72);
      v13 = v7;
      v14[1] = v8;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v5, "defaultAccountForFeature:completion:", 2, v11);

      v9 = v13;
    }

    objc_destroyWeak(v6);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }

}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_13(uint64_t a1, char a2, uint64_t a3)
{
  id WeakRetained;
  PKAccountViewInterfaceConfiguration *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a3 && (a2 & 1) == 0)
  {
    v7 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    -[PKAccountViewInterfaceConfiguration setAccount:](v7, "setAccount:", *(_QWORD *)(a1 + 32));
    -[PKAccountViewInterfaceConfiguration setDestination:](v7, "setDestination:", 0);
    -[PKAccountViewInterfaceConfiguration setViewStyle:](v7, "setViewStyle:", 0);
    objc_msgSend(WeakRetained, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_14;
      v12[3] = &unk_1E3E614F0;
      v9 = *(_QWORD *)(a1 + 40);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v8, "presentAccountWithConfiguration:presentationContext:animated:completion:", v7, v9, 1, v12);

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
        (*(void (**)(void))(v11 + 16))();
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }

}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_16;
  v11[3] = &unk_1E3E6C688;
  objc_copyWeak(v16, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v8 = *(void **)(a1 + 56);
  v15 = v7;
  v16[1] = v8;
  v14 = *(id *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(v16);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PKFeatureOnBoardingViewController *v12;
  void *v13;
  void *v14;
  PKFeatureOnBoardingViewController *v15;
  PKFeatureOnBoardingViewController *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  PKFeatureOnBoardingViewController *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_7:
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    goto LABEL_16;
  }
  v3 = *(void **)(a1 + 32);
  if (!v3 || *(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present feature apply, card account not here with error %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  objc_msgSend(v3, "redeemRewardsFeatureDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productForFeature:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithWebService:", v10);

    objc_msgSend(v11, "setReferrerIdentifier:", *(_QWORD *)(a1 + 48));
    v12 = [PKFeatureOnBoardingViewController alloc];
    objc_msgSend(v8, "onboardingItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKFeatureOnBoardingViewController initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:](v12, "initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:", 0, 0, 0, 0, 5, v11, v8, v14);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_182;
    v19[3] = &unk_1E3E65388;
    v20 = v15;
    v21 = WeakRetained;
    v22 = *(id *)(a1 + 56);
    v16 = v15;
    objc_msgSend(WeakRetained, "dismissPresentedVCsWithRequirements:animated:performAction:", 8, 1, v19);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Cannot retrieve feature product to present apply flow", buf, 2u);
    }

    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(void))(v18 + 16))();
  }

LABEL_16:
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_182(uint64_t a1)
{
  void *v2;
  PKNavigationController *v3;

  v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", *(_QWORD *)(a1 + 32));
  -[PKNavigationController setModalInPresentation:](v3, "setModalInPresentation:", 1);
  objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, *(_QWORD *)(a1 + 48));

}

- (void)presentInstallmentPlansForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  id location;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__25;
    v31[4] = __Block_byref_object_dispose__25;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__25;
    v29[4] = __Block_byref_object_dispose__25;
    v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__25;
    v27[4] = __Block_byref_object_dispose__25;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__25;
    v25[4] = __Block_byref_object_dispose__25;
    v26 = 0;
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke;
    v23[3] = &unk_1E3E6C728;
    v23[4] = v31;
    v23[5] = a3;
    objc_msgSend(v8, "addOperation:", v23);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_4;
    v22[3] = &unk_1E3E67E68;
    v22[4] = v31;
    v22[5] = v29;
    objc_msgSend(v8, "addOperation:", v22);
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_7;
    v21[3] = &unk_1E3E67E68;
    v21[4] = v31;
    v21[5] = v27;
    objc_msgSend(v8, "addOperation:", v21);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_10;
    v19[3] = &unk_1E3E6C778;
    objc_copyWeak(&v20, &location);
    v19[4] = v25;
    objc_msgSend(v8, "addOperation:", v19);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_13;
    v12[3] = &unk_1E3E6C7F0;
    objc_copyWeak(&v18, &location);
    v14 = v31;
    v13 = v7;
    v15 = v29;
    v16 = v27;
    v17 = v25;
    v11 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v10, v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    _Block_object_dispose(v25, 8);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v31, 8);
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }

}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_2;
  v13[3] = &unk_1E3E635E8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "defaultAccountForFeature:completion:", v10, v13);

}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_3;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_5;
    v11[3] = &unk_1E3E63660;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v12 = v6;
    objc_msgSend(v9, "accountUsersForAccountWithIdentifier:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_6;
  block[3] = &unk_1E3E6C750;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_8;
    v11[3] = &unk_1E3E63660;
    v14 = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v12 = v6;
    objc_msgSend(v9, "physicalCardsForAccountWithIdentifier:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_9;
  block[3] = &unk_1E3E6C750;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 134);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_11;
    v11[3] = &unk_1E3E63688;
    v14 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "familyMembersWithCompletion:", v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_12;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_12(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", a1[4]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_13(uint64_t a1)
{
  id v2;
  __int128 v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  id v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_14;
  block[3] = &unk_1E3E6C7C8;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  v4 = *(_OWORD *)(a1 + 32);
  v2 = (id)v4;
  v3 = *(_OWORD *)(a1 + 48);
  v6 = v4;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      objc_msgSend(v3, "creditDetails");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "installmentPlans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v6 == 1)
      {
        objc_msgSend(v7, "creditDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "installmentPlans");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "presentInstallmentPlanWithIdentifier:forAccountIdentifier:completion:", v12, v13, *(_QWORD *)(a1 + 32));

        }
      }
      else
      {
        objc_msgSend(v7, "associatedPassUniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = 3221225472;
        v18 = *(_OWORD *)(a1 + 32);
        v22 = *(_OWORD *)(a1 + 48);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_15;
        v19[3] = &unk_1E3E6C7A0;
        v19[4] = WeakRetained;
        v20 = v15;
        v23 = *(_QWORD *)(a1 + 64);
        v16 = (id)v18;
        v21 = v18;
        v17 = v15;
        objc_msgSend(WeakRetained, "presentPassDetailsWithUniqueID:animated:completionHandler:", v17, 1, v19);

      }
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
        (*(void (**)(void))(v14 + 16))();
    }
  }

}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_15(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  PKInstallmentPlansViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKInstallmentPlansViewController *v13;
  uint64_t result;
  void *v15;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "passWithUniqueID:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paymentPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v15);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v5);
      v7 = objc_alloc_init(MEMORY[0x1E0D67100]);
      v8 = [PKInstallmentPlansViewController alloc];
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKInstallmentPlansViewController initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:](v8, "initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:", v9, v10, v11, v12, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v7);

      objc_msgSend(v3, "pushViewController:animated:", v13, 1);
    }

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentInstallmentPlanWithIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke;
    v13[3] = &unk_1E3E6C818;
    objc_copyWeak(&v16, &location);
    v14 = v8;
    v15 = v11;
    objc_msgSend(v12, "accountWithIdentifier:completion:", v9, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }

}

void __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E3E689E0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "creditDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installmentPlanWithIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "associatedPassUniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_3;
      v7[3] = &unk_1E3E66EF0;
      v7[4] = WeakRetained;
      v8 = v4;
      v9 = *(id *)(a1 + 48);
      objc_msgSend(WeakRetained, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v7);

    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      if (v6)
        (*(void (**)(void))(v6 + 16))();
    }

  }
}

uint64_t __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_3(uint64_t a1, char a2)
{
  void *v3;
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "presentInstallmentPlan:", *(_QWORD *)(a1 + 40));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentInvitationsInboxAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_inboxDataSource)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke;
    v8[3] = &unk_1E3E66830;
    v8[4] = self;
    v10 = v4;
    v9 = v6;
    -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, v4, v8);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 1184);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_2;
  v4[3] = &unk_1E3E66830;
  v4[1] = 3221225472;
  v4[4] = v1;
  v6 = *(_BYTE *)(a1 + 48);
  v5 = v2;
  objc_msgSend(v3, "updateInboxWithCompletion:", v4);

}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD block[5];
  id v3;
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_3;
  block[3] = &unk_1E3E66830;
  v1 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[1] = 3221225472;
  v4 = *(_BYTE *)(a1 + 48);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_3(uint64_t a1)
{
  PKInboxViewController *v2;
  PKNavigationController *v3;
  uint64_t v4;
  void *v5;
  id v6;
  PKInboxViewController *v7;
  uint64_t v8;
  _QWORD v9[4];
  PKInboxViewController *v10;
  id v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "hasInboxMessages"))
  {
    v2 = -[PKInboxViewController initWithInboxDataSource:contactAvatarManager:context:]([PKInboxViewController alloc], "initWithInboxDataSource:contactAvatarManager:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224), 0);
    v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v2);
    v4 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_4;
    v9[3] = &unk_1E3E618A0;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v10 = v2;
    v11 = v6;
    v7 = v2;
    objc_msgSend(v5, "presentViewController:animated:completion:", v3, v4, v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
}

uint64_t __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentCreateAccountUserInvitationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:](PKAccountInvitationController, "presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:", v5, 0, 0, 0, 0, v4);

}

- (void)presentInvitationWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke;
    v12[3] = &unk_1E3E6C840;
    objc_copyWeak(&v15, &location);
    v13 = v8;
    v14 = v11;
    -[PKPassGroupsViewController presentPassWithAssociatedAccountIdentifier:animated:completion:](self, "presentPassWithAssociatedAccountIdentifier:animated:completion:", v9, 1, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }

}

void __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (!v5 || (a2 & 1) != 0)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      objc_msgSend(WeakRetained, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2;
        v11[3] = &unk_1E3E61590;
        v9 = *(_QWORD *)(a1 + 32);
        v12 = *(id *)(a1 + 40);
        objc_msgSend(v8, "presentInvitationWithIdentifier:completion:", v9, v11);

      }
    }
  }

}

uint64_t __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentAppStorePageForItemWithIdentifier:(id)a3
{
  id v4;
  PKStoreProductViewPresenter *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = -[PKStoreProductViewPresenter initWithProductDelegate:]([PKStoreProductViewPresenter alloc], "initWithProductDelegate:", 0);
  -[PKStoreProductViewPresenter loadProductForItemIdentifier:customProductPageIdentifier:](v5, "loadProductForItemIdentifier:customProductPageIdentifier:", v4, 0);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassGroupsViewController_presentAppStorePageForItemWithIdentifier___block_invoke;
  v6[3] = &unk_1E3E69E10;
  v6[4] = self;
  -[PKStoreProductViewPresenter presentStoreViewWithBlock:](v5, "presentStoreViewWithBlock:", v6);

}

void __71__PKPassGroupsViewController_presentAppStorePageForItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "pkui_frontMostViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, v5);

}

- (void)presentTransactionDetailsForTransactionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  PKPaymentService *paymentService;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !self->_inFailForward)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Presenting transaction details for transactionID %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke;
    v7[3] = &unk_1E3E6C890;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = self;
    -[PKPaymentService transactionWithTransactionIdentifier:completion:](paymentService, "transactionWithTransactionIdentifier:completion:", v4, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }

}

void __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 134);
    objc_msgSend(v3, "transactionSourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E3E6C868;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    objc_msgSend(v6, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v7, v8);

  }
}

void __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3;
  block[3] = &unk_1E3E63480;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentTransactionDetailsForTransaction:transactionSourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)presentPayLaterFinancingPlanWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !self->_inFailForward)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__25;
    v27[4] = __Block_byref_object_dispose__25;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__25;
    v25[4] = __Block_byref_object_dispose__25;
    v26 = 0;
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presenting pay later financing plan details for %@", buf, 0xCu);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke;
    v22[3] = &unk_1E3E64F70;
    v9 = v5;
    v23 = v9;
    v24 = v27;
    objc_msgSend(v7, "addOperation:", v22);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_4;
    v18[3] = &unk_1E3E63610;
    v10 = v9;
    v19 = v10;
    v11 = v4;
    v20 = v11;
    v21 = v25;
    objc_msgSend(v7, "addOperation:", v18);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_7;
    v14[3] = &unk_1E3E6C908;
    v16 = v27;
    v14[4] = self;
    v17 = v25;
    v15 = v11;
    v13 = (id)objc_msgSend(v7, "evaluateWithInput:completion:", v12, v14);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

  }
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_2;
  v12[3] = &unk_1E3E635E8;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "defaultAccountForFeature:completion:", 3, v12);

}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_3;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_5;
  v13[3] = &unk_1E3E6C8B8;
  v10 = a1[6];
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "financingPlanForPlanIdentifier:completion:", v9, v13);

}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_6;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  int8x16_t v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "associatedPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_8;
    v10[3] = &unk_1E3E6C8E0;
    objc_copyWeak(&v13, &location);
    v12 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v9, "presentPassWithUniqueID:animated:completionHandler:", v8, 1, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_8(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if ((a2 & 1) == 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && WeakRetained != 0)
  {
    if ((PKCanShowPayLaterPassItemsForAccount() & 1) != 0)
    {
      objc_msgSend(v5, "presentedViewController");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSObject presentPayLaterFinancingPlan:](v7, "presentPayLaterFinancingPlan:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: Cannot present loan details for %@ because of the account state.", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

- (void)presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  PKPaymentService *paymentService;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  PKPaymentService *v14;
  _QWORD v15[6];
  id v16;
  _QWORD v17[5];
  id v18;
  NSObject *v19;
  _BYTE *v20;
  _QWORD *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  _BYTE *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[4];
  id location;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !self->_inFailForward)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Presenting transaction details for serviceIdentifier %@, transactionSourceIdentifier %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__25;
    v35 = __Block_byref_object_dispose__25;
    v36 = 0;
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    paymentService = self->_paymentService;
    v11 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke;
      v27[3] = &unk_1E3E6C930;
      v12 = &v30;
      objc_copyWeak(&v30, &location);
      v29 = v31;
      v13 = v9;
      v28 = v13;
      -[PKPaymentService transactionSourceTypeForTransactionSourceIdentifier:completion:](paymentService, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v7, v27);
      dispatch_group_enter(v13);
      v14 = self->_paymentService;
      v23[0] = v11;
      v23[1] = 3221225472;
      v23[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2;
      v23[3] = &unk_1E3E6C958;
      objc_copyWeak(&v26, &location);
      v25 = buf;
      v24 = v13;
      -[PKPaymentService transactionWithServiceIdentifier:transactionSourceIdentifier:completion:](v14, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v6, v7, v23);

      objc_destroyWeak(&v26);
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3;
      v17[3] = &unk_1E3E6C980;
      v12 = &v22;
      objc_copyWeak(&v22, &location);
      v17[4] = self;
      v18 = 0;
      v20 = buf;
      v21 = v31;
      v19 = v9;
      -[PKPaymentService ambiguousTransactionWithServiceIdentifier:completion:](paymentService, "ambiguousTransactionWithServiceIdentifier:completion:", v6, v17);

    }
    objc_destroyWeak(v12);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5;
    v15[3] = &unk_1E3E6C9A8;
    objc_copyWeak(&v16, &location);
    v15[4] = buf;
    v15[5] = v31;
    dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v15);
    objc_destroyWeak(&v16);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v31, 8);
    objc_destroyWeak(&location);
  }

}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4;
  v8[3] = &unk_1E3E6C930;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v6, v8);

  objc_destroyWeak(&v11);
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_presentTransactionDetailsForTransaction:transactionSourceType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

- (void)presentTransactionDetailsForBankConnectTransaction:(id)a3 applePayPrimaryAccountIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  if (a3 && a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0D67370];
    v7 = a4;
    v8 = a3;
    v9 = (void *)objc_msgSend([v6 alloc], "initFromFKTransaction:", v8);

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "passWithFPANIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "paymentPass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __114__PKPassGroupsViewController_presentTransactionDetailsForBankConnectTransaction_applePayPrimaryAccountIdentifier___block_invoke;
      v15[3] = &unk_1E3E62E98;
      v15[4] = self;
      v16 = v9;
      v17 = v12;
      v14 = v12;
      -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v13, 0, 1, v15);

    }
  }
}

void __114__PKPassGroupsViewController_presentTransactionDetailsForBankConnectTransaction_applePayPrimaryAccountIdentifier___block_invoke(uint64_t a1, char a2)
{
  id v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "presentTransaction:forPaymentPass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_presentTransactionDetailsForTransaction:(id)a3 transactionSourceType:(unint64_t)a4
{
  id v6;
  void *v7;
  PKPaymentService *paymentService;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPaymentService *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  PKPassGroupsViewController *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    switch(a4)
    {
      case 0uLL:
        paymentService = self->_paymentService;
        objc_msgSend(v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke;
        v28[3] = &unk_1E3E672A8;
        v28[4] = self;
        v29 = v7;
        -[PKPaymentService passUniqueIdentifierForTransactionWithIdentifier:completion:](paymentService, "passUniqueIdentifierForTransactionWithIdentifier:completion:", v9, v28);

        break;
      case 1uLL:
        objc_msgSend(v6, "accountIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "peerPaymentAccountWithIdentifier:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          v15 = self->_paymentService;
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_202;
          v23[3] = &unk_1E3E6C9F8;
          v24 = v13;
          v25 = self;
          v26 = v12;
          v27 = v7;
          v16 = v12;
          v17 = v14;
          -[PKPaymentService familyMembersWithCompletion:](v15, "familyMembersWithCompletion:", v23);

          goto LABEL_6;
        }
        PKLogFacilityTypeGetObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        v20 = "Cannot find a peer payment account for transaction %@";
        goto LABEL_13;
      case 2uLL:
LABEL_6:
        objc_msgSend(v7, "accountIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "altDSID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_207;
          v21[3] = &unk_1E3E69B20;
          v21[4] = self;
          v22 = v7;
          objc_msgSend(v18, "accountWithIdentifier:completion:", v10, v21);

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v7;
            v20 = "There is no altDSID defined for account user on tranasction %@";
LABEL_13:
            _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          }
LABEL_14:

        }
        break;
      case 3uLL:
        -[PKPassGroupsViewController _presentAccountTransactionDetailsForTransaction:](self, "_presentAccountTransactionDetailsForTransaction:", v6);
        break;
      default:
        break;
    }
  }

}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPass");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_presentTransactionDetailsForTransaction:forPaymentPass:", *(_QWORD *)(a1 + 48), v3);
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_202(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_203;
  block[3] = &unk_1E3E62398;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_203(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  const char *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  id location[6];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v13 = a1[4];
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v13;
    v14 = "There is no altDSID defined for associated account %@";
    goto LABEL_22;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v4)
  {
LABEL_14:

LABEL_20:
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v2;
    v14 = "Cannot find a family member with altDSID %@";
LABEL_22:
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)location, 0xCu);
    goto LABEL_23;
  }
  v5 = *(_QWORD *)v27;
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v5)
      objc_enumerationMutation(v3);
    v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
    objc_msgSend(v7, "altDSID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v2;
    v10 = v9;
    if (v8 == v9)
      break;
    if (v8)
    {
      v11 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_18;
    }
    else
    {

    }
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v4)
        goto LABEL_4;
      goto LABEL_14;
    }
  }

LABEL_18:
  v15 = v7;

  if (!v15)
    goto LABEL_20;
  objc_initWeak(location, a1[6]);
  v16 = a1[6];
  objc_msgSend(a1[7], "associatedPassUniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_204;
  v20[3] = &unk_1E3E6C9D0;
  objc_copyWeak(&v25, location);
  v18 = a1[5];
  v19 = a1[6];
  v21 = v18;
  v22 = v19;
  v12 = v15;
  v23 = v12;
  v24 = a1[8];
  objc_msgSend(v16, "presentPassWithUniqueID:context:animated:completionHandler:", v17, 0, 1, v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
LABEL_23:

}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_204(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  PKPeerPaymentAssociatedAccountsController *v7;
  uint64_t v8;
  void *v9;
  PKPeerPaymentAssociatedAccountPresentationContext *v10;
  id v11;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      v11 = WeakRetained;
      objc_msgSend(WeakRetained, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
      v7 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:]([PKPeerPaymentAssociatedAccountsController alloc], "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1224), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1152), 0);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 1176);
      *(_QWORD *)(v8 + 1176) = v7;

      v10 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:transaction:]([PKPeerPaymentAssociatedAccountPresentationContext alloc], "initWithPKFamilyMember:transaction:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:", v10, v5);

      WeakRetained = v11;
    }

  }
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_208;
  block[3] = &unk_1E3E61400;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_208(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_passFromGroupsControllerWithUniqueIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentTransactionDetailsForTransaction:forPaymentPass:", *(_QWORD *)(a1 + 48), v6);
    v5 = v6;
  }

}

- (void)_presentAccountTransactionDetailsForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke;
  v8[3] = &unk_1E3E6CA48;
  v8[4] = self;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "accountWithIdentifier:completion:", v5, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "feature") == 5)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_2;
    v4[3] = &unk_1E3E685F8;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 48));
    v5 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v7);
  }

}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_3;
  v3[3] = &unk_1E3E6CA20;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentCreditPassAnimated:completion:", 1, v3);

  objc_destroyWeak(&v6);
}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v4, "presentTransaction:forAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

      WeakRetained = v5;
    }

  }
}

- (void)_presentTransactionDetailsForTransaction:(id)a3 forPaymentPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PKPassGroupsViewController *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v7);
    objc_msgSend(v8, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke;
    v12[3] = &unk_1E3E6CA70;
    v13 = v8;
    v14 = v6;
    v15 = self;
    v16 = v9;
    v11 = v9;
    -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v10, 0, 1, v12);

  }
}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke(id *a1, char a2)
{
  char v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);
  _QWORD aBlock[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = objc_msgSend(a1[4], "isTransitPass");
  if ((a2 & 1) == 0 && (v4 & 1) == 0 && objc_msgSend(a1[5], "hasBackingData"))
  {
    objc_initWeak(&location, a1[6]);
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_2;
    aBlock[3] = &unk_1E3E61EE8;
    objc_copyWeak(&v16, &location);
    v14 = a1[5];
    v15 = a1[4];
    v6 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(a1[4], "associatedAccountServiceAccountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "associatedAccountServiceAccountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_3;
      v10[3] = &unk_1E3E697D8;
      v11 = a1[7];
      v12 = v6;
      objc_msgSend(v8, "accountWithIdentifier:completion:", v9, v10);

    }
    else
    {
      v6[2](v6);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "presentTransaction:forPaymentPass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  _QWORD block[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", *(_QWORD *)(a1 + 32));
    v8 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayTransactionsForTransactionSourceCollection:withAccount:", v7, v5);

    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_4;
      block[3] = &unk_1E3E61590;
      v10 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentPeerPaymentTermsAcceptance
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke;
    v4[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v6, &location);
    v5 = v3;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v4);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  PKPeerPaymentTermsController *v11;
  void *v12;
  PKPeerPaymentTermsController *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  if ((a2 & 1) == 0)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained[145], "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "termsURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "termsIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "associatedPassUniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = [PKPeerPaymentTermsController alloc];
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v11, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v7, v8, v9, v12);

        objc_msgSend(WeakRetained, "pkui_frontMostViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke_2;
          v16[3] = &unk_1E3E6CA98;
          v17 = v14;
          -[PKPeerPaymentTermsController presentTermsOverController:showInterstitialViewController:withCompletionHandler:](v13, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", v17, 0, v16);

        }
      }

    }
  }
}

uint64_t __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke_2(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 1)
    return objc_msgSend(*(id *)(result + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return result;
}

- (void)presentPeerPaymentVerifyIdentity
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_inFailForward)
  {
    if (PKDeviceSupportsPeerPaymentIdentityVerification())
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __62__PKPassGroupsViewController_presentPeerPaymentVerifyIdentity__block_invoke;
      v3[3] = &unk_1E3E6CAC0;
      objc_copyWeak(&v4, &location);
      -[PKPassGroupsViewController presentPeerPaymentPassAnimated:completion:](self, "presentPeerPaymentPassAnimated:completion:", 1, v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __62__PKPassGroupsViewController_presentPeerPaymentVerifyIdentity__block_invoke(uint64_t a1, char a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;

  if (a3 && (a2 & 1) == 0)
  {
    v3 = (id *)(a1 + 32);
    v4 = a3;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D673D8]);
      objc_msgSend(v7, "setVerificationContext:", 1);
      objc_msgSend(WeakRetained, "_peerPaymentAccountResolutionController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentFlowForAccountResolution:configuration:completion:", 2, v7, 0);

    }
  }
}

- (void)presentPeerPaymentTopUp
{
  void *v3;
  _QWORD v4[4];
  id v5;
  PKPassGroupsViewController *v6;
  id v7;
  id location;

  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__PKPassGroupsViewController_presentPeerPaymentTopUp__block_invoke;
    v4[3] = &unk_1E3E63B10;
    objc_copyWeak(&v7, &location);
    v5 = v3;
    v6 = self;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v4);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __53__PKPassGroupsViewController_presentPeerPaymentTopUp__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_peerPaymentAccountResolutionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentFlowForAccountResolution:configuration:completion:", 5, 0, 0);

    }
  }
}

- (void)presentPeerPaymentSetupWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PKPassGroupsViewController_presentPeerPaymentSetupWithConfiguration___block_invoke;
    v6[3] = &unk_1E3E63B10;
    objc_copyWeak(&v9, &location);
    v7 = v5;
    v8 = v4;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v7, 1, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __71__PKPassGroupsViewController_presentPeerPaymentSetupWithConfiguration___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "_peerPaymentAccountResolutionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "peerPaymentPassIsProvisionedOnDevice");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "_peerPaymentAccountResolutionController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "presentFlowForAccountResolution:configuration:completion:", 1, *(_QWORD *)(a1 + 40), 0);

      }
    }

  }
}

- (void)presentPeerPaymentRecurringPaymentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__PKPassGroupsViewController_presentPeerPaymentRecurringPaymentWithIdentifier___block_invoke;
    v6[3] = &unk_1E3E63B10;
    objc_copyWeak(&v9, &location);
    v7 = v5;
    v8 = v4;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v7, 1, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __79__PKPassGroupsViewController_presentPeerPaymentRecurringPaymentWithIdentifier___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "presentPeerPaymentRecurringPaymentsWithIdentifier:completion:", *(_QWORD *)(a1 + 40), 0);

    }
  }
}

- (void)presentPeerPaymentTransferToBank
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__PKPassGroupsViewController_presentPeerPaymentTransferToBank__block_invoke;
    v4[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v6, &location);
    v5 = v3;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v4);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __62__PKPassGroupsViewController_presentPeerPaymentTransferToBank__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0D66F18]);
        objc_msgSend(v5, "presentPeerPaymentActionViewControllerForAction:pass:passLibraryDataProvider:", 2, v4, v6);

      }
    }

  }
}

- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPassLibraryDataProvider peerPaymentPassUniqueID](self->_passLibraryDataProvider, "peerPaymentPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__PKPassGroupsViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke;
    v9[3] = &unk_1E3E6CAE8;
    objc_copyWeak(&v13, &location);
    v10 = v8;
    v11 = v6;
    v12 = v7;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v10, 1, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __87__PKPassGroupsViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "devicePrimaryPaymentApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && objc_msgSend(v5, "state") == 1)
      {
        objc_msgSend(WeakRetained, "_peerPaymentAccountResolutionController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "currentPeerPaymentAccountResolution");

        if (v8)
        {
          objc_msgSend(WeakRetained, "_peerPaymentAccountResolutionController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "presentResolutionForCurrentAccountStateWithCompletion:", 0);
        }
        else
        {
          objc_msgSend(WeakRetained, "presentedViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "presentPeerPaymentDeviceTapWithInitialAmount:initialMemo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }

      }
    }

  }
}

- (void)presentAccountServiceSchedulePayment:(id)a3 billPayAmountType:(int64_t)a4 billPayAmount:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassPresentationContext *v13;
  _QWORD v14[4];
  id v15;
  PKPassGroupsViewController *v16;
  id v17;
  id v18;
  id v19[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setLimitServerLoad:](v13, "setLimitServerLoad:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke;
    v14[3] = &unk_1E3E6CB38;
    objc_copyWeak(v19, &location);
    v15 = v10;
    v16 = self;
    v19[1] = (id)a4;
    v17 = v11;
    v18 = v12;
    -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v15, v13, 1, v14);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }

}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v6);
    objc_msgSend(v5, "associatedAccountServiceAccountIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v5)
    {
      if (v8)
      {
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x3032000000;
        v32[3] = __Block_byref_object_copy__25;
        v32[4] = __Block_byref_object_dispose__25;
        v33 = 0;
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__25;
        v30[4] = __Block_byref_object_dispose__25;
        v31 = 0;
        v10 = objc_alloc_init(MEMORY[0x1E0D66B90]);
        v11 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_2;
        v27[3] = &unk_1E3E64F70;
        v12 = v9;
        v28 = v12;
        v29 = v32;
        objc_msgSend(v10, "addOperation:", v27);
        v24[0] = v11;
        v24[1] = 3221225472;
        v24[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_5;
        v24[3] = &unk_1E3E64F70;
        v25 = v12;
        v26 = v30;
        objc_msgSend(v10, "addOperation:", v24);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_8;
        v17[3] = &unk_1E3E6CB10;
        v17[4] = *(_QWORD *)(a1 + 40);
        v21 = v32;
        v22 = v30;
        v14 = v7;
        v15 = *(_QWORD *)(a1 + 72);
        v18 = v14;
        v23 = v15;
        v19 = *(id *)(a1 + 48);
        v20 = *(id *)(a1 + 56);
        v16 = (id)objc_msgSend(v10, "evaluateWithInput:completion:", v13, v17);

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(v32, 8);

      }
    }

  }
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_3;
  v13[3] = &unk_1E3E635E8;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "accountWithIdentifier:completion:", v10, v13);

}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_4;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_6;
  v13[3] = &unk_1E3E63660;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "accountUsersForAccountWithIdentifier:completion:", v10, v13);

}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_7;
  block[3] = &unk_1E3E6C750;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_8(_QWORD *a1)
{
  PKAccountServiceAccountResolutionController *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(a1[4] + 1208))
  {
    v2 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:]([PKAccountServiceAccountResolutionController alloc], "initWithAccount:accountUserCollection:transactionSourceCollection:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), a1[5]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 1208);
    *(_QWORD *)(v3 + 1208) = v2;

    objc_msgSend(*(id *)(a1[4] + 1208), "setDelegate:");
  }
  v5 = objc_alloc_init(MEMORY[0x1E0D668F0]);
  objc_msgSend(v5, "setBillPayAmountType:", a1[10]);
  objc_msgSend(v5, "setBillPayAmount:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 1208), "presentFlowForAccountResolution:configuration:completion:", 1, v5, a1[7]);

}

- (void)presentActionViewControllerWithUniqueID:(id)a3 actionType:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  PKPassGroupsViewController *v10;
  unint64_t v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke;
    v8[3] = &unk_1E3E6CB60;
    v10 = self;
    v11 = a4;
    v9 = v6;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v9, 1, v8);

  }
}

void __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  PKPerformActionViewController *v15;
  PKNavigationController *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passWithUniqueID:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "availableActions");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v12, "type") == *(_QWORD *)(a1 + 48))
            {
              v23 = 0;
              v24 = 0;
              v13 = objc_msgSend(v6, "canPerformAction:unableReason:displayableError:", v12, &v24, &v23);
              v14 = v23;
              if ((v13 & 1) != 0 || v24 == 2)
              {
                v15 = -[PKPerformActionViewController initWithPass:action:]([PKPerformActionViewController alloc], "initWithPass:action:", v6, v12);
                -[PKPerformActionViewController setDelegate:](v15, "setDelegate:", *(_QWORD *)(a1 + 40));
                v16 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v15);
                -[PKNavigationController setSupportedInterfaceOrientations:](v16, "setSupportedInterfaceOrientations:", 2);
                objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "presentViewController:animated:completion:", v16, 1, 0);

                PKLogFacilityTypeGetObject();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  PKPaymentPassActionTypeToString();
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v30 = v21;
                  _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Presented PKPerformActionViewController for actionType %@", buf, 0xCu);

                }
              }
              else
              {
                v22[0] = MEMORY[0x1E0C809B0];
                v22[1] = 3221225472;
                v22[2] = __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke_217;
                v22[3] = &unk_1E3E612E8;
                v22[4] = *(_QWORD *)(a1 + 40);
                +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:unavailableActionHandler:cancelActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:unavailableActionHandler:cancelActionHandler:", v24, v12, v14, v22, 0, 0);
                v15 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v15, 1, 0);
                PKLogFacilityTypeGetObject();
                v16 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v16->super.super.super.super, OS_LOG_TYPE_DEFAULT))
                {
                  PKPaymentPassActionTypeToString();
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v30 = v17;
                  v31 = 2112;
                  v32 = v14;
                  _os_log_impl(&dword_19D178000, &v16->super.super.super.super, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController unavailable for actionType %@, error: %@", buf, 0x16u);

                }
              }

              goto LABEL_22;
            }
          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_22:

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Cannot present payment pass action for non-payment pass %@", buf, 0xCu);
      }
    }

  }
}

uint64_t __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke_217(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPaymentSetupController");
}

- (void)presentAuxiliaryPassInformationItemDetailForItemIdentifier:(id)a3 informationIdentifier:(id)a4 forPassUniqueID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v12)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      v20 = v10;
      v21 = 2113;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: Presenting auxiliaryPassInformationItem with identifier %{private}@ in info %{private}@ for pass %{public}@", buf, 0x20u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke;
    v15[3] = &unk_1E3E6CB88;
    v18 = v13;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v12, 1, v15);

  }
}

void __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke_2;
      v9[3] = &unk_1E3E614F0;
      v10 = *(id *)(a1 + 56);
      objc_msgSend(v4, "presentAuxiliaryPassInformationItemWithIdentifier:informationIdentifier:completion:", v5, v6, v9);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Unable to present aux pass information item detail over %@", buf, 0xCu);
      }

      v8 = *(_QWORD *)(a1 + 56);
      if (v8)
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    }

  }
}

uint64_t __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a2 ^ 1u);
  return result;
}

- (void)presentPassForFeatureIdentifier:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke;
  v11[3] = &unk_1E3E6CBB0;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "defaultAccountForFeature:completion:", a3, v11);

}

void __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_2;
  v7[3] = &unk_1E3E66EC8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v7[1] = 3221225472;
  v11 = *(_BYTE *)(a1 + 48);
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "associatedPassUniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(unsigned __int8 *)(a1 + 56);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_3;
      v8[3] = &unk_1E3E61338;
      v5 = *(void **)(a1 + 40);
      v10 = *(id *)(a1 + 48);
      v9 = v3;
      objc_msgSend(v5, "presentPassWithUniqueID:animated:completionHandler:", v9, v4, v8);

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
  }
}

uint64_t __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentCreditPassAnimated:(BOOL)a3 completion:(id)a4
{
  -[PKPassGroupsViewController presentPassForFeatureIdentifier:animated:completion:](self, "presentPassForFeatureIdentifier:animated:completion:", 2, a3, a4);
}

- (void)presentAccountFeature:(unint64_t)a3 animated:(BOOL)a4 destination:(unint64_t)a5 fundingSourceIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  PKPassPresentationContext *v14;
  PKAccountViewInterfaceConfiguration *v15;
  id v16;
  uint64_t v17;
  id v18;
  PKAccountViewInterfaceConfiguration *v19;
  void *v20;
  id v21;
  PKAccountViewInterfaceConfiguration *v22;
  PKPassPresentationContext *v23;
  id v24;
  _QWORD v25[5];
  PKAccountViewInterfaceConfiguration *v26;
  PKPassPresentationContext *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  PKAccountViewInterfaceConfiguration *v32;
  _QWORD v33[4];
  PKAccountViewInterfaceConfiguration *v34;
  unint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  BOOL v39;
  id location[2];

  v12 = a6;
  v13 = a7;
  v14 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setPresentationSource:](v14, "setPresentationSource:", 5);
  v15 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  -[PKAccountViewInterfaceConfiguration setDestination:](v15, "setDestination:", a5);
  -[PKAccountViewInterfaceConfiguration setViewStyle:](v15, "setViewStyle:", 0);
  objc_initWeak(location, self);
  v16 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v17 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke;
  v36[3] = &unk_1E3E6CC28;
  v36[4] = self;
  v39 = a4;
  objc_copyWeak(&v38, location);
  v18 = v13;
  v37 = v18;
  objc_msgSend(v16, "addOperation:", v36);
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_4;
  v33[3] = &unk_1E3E6CC50;
  v35 = a3;
  v19 = v15;
  v34 = v19;
  objc_msgSend(v16, "addOperation:", v33);
  if (a5 == 12)
  {
    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_6;
    v30[3] = &unk_1E3E65A40;
    v31 = v12;
    v32 = v19;
    objc_msgSend(v16, "addOperation:", v30);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_8;
  v25[3] = &unk_1E3E6CCA0;
  v21 = v18;
  v28 = v21;
  objc_copyWeak(&v29, location);
  v25[4] = self;
  v22 = v19;
  v26 = v22;
  v23 = v14;
  v27 = v23;
  v24 = (id)objc_msgSend(v16, "evaluateWithInput:completion:", v20, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v38);

  objc_destroyWeak(location);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E3E6CC00;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  v17 = *(id *)(a1 + 40);
  objc_msgSend(v10, "presentCreditPassAnimated:completion:", v11, v14);

  objc_destroyWeak(&v18);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_2(id *a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E3E6CBD8;
  objc_copyWeak(&v8, a1 + 7);
  v6 = a1[5];
  v5 = a1[4];
  v7 = a1[6];
  v9 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_5;
  v13[3] = &unk_1E3E65F90;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v15 = v6;
  v16 = v7;
  v14 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "defaultAccountForFeature:completion:", v9, v13);

}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAccount:", v3);
  if (v3)
    objc_msgSend(v3, "state");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_7;
  v15[3] = &unk_1E3E6CC78;
  v12 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v7;
  v16 = v12;
  v13 = v6;
  v14 = v7;
  objc_msgSend(v8, "paymentFundingSourceForIdentifier:accountIdentifier:completion:", v9, v11, v15);

}

uint64_t __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setFundingSource:", a2);
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "setDestination:", 4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  if (objc_msgSend(a4, "isCanceled"))
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_9;
    block[3] = &unk_1E3E6C598;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v12 = v6;
    block[4] = v7;
    v10 = v8;
    v11 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
  }
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_10;
    v6[3] = &unk_1E3E614F0;
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "presentAccountWithConfiguration:presentationContext:animated:completion:", v4, v5, 1, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_10(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a2 ^ 1u, 0);
  return result;
}

- (void)presentAppleBalanceAddMoneyAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKPassGroupsViewController_presentAppleBalanceAddMoneyAnimated_completion___block_invoke;
  v8[3] = &unk_1E3E6CCC8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[PKPassGroupsViewController presentPassForFeatureIdentifier:animated:completion:](self, "presentPassForFeatureIdentifier:animated:completion:", 4, v4, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __77__PKPassGroupsViewController_presentAppleBalanceAddMoneyAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v14 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentAddMoneyAppleBalance");
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
    }

    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
LABEL_11:
    v6 = v14;
  }

}

- (void)presentAppleBalanceAddMoneyInStoreTopUpAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPassGroupsViewController_presentAppleBalanceAddMoneyInStoreTopUpAnimated_completion___block_invoke;
  v8[3] = &unk_1E3E6CCC8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[PKPassGroupsViewController presentPassForFeatureIdentifier:animated:completion:](self, "presentPassForFeatureIdentifier:animated:completion:", 4, v4, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __89__PKPassGroupsViewController_presentAppleBalanceAddMoneyInStoreTopUpAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v14 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentAddMoneyAppleBalanceInStoreTopUp");
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
    }

    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
LABEL_11:
    v6 = v14;
  }

}

- (void)presentAppleBalanceAddMoneyDirectTopUpAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PKPassGroupsViewController_presentAppleBalanceAddMoneyDirectTopUpAnimated_completion___block_invoke;
  v8[3] = &unk_1E3E6CCC8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[PKPassGroupsViewController presentPassForFeatureIdentifier:animated:completion:](self, "presentPassForFeatureIdentifier:animated:completion:", 4, v4, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __88__PKPassGroupsViewController_presentAppleBalanceAddMoneyDirectTopUpAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v14 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentAddMoneyAppleBalanceDirectTopUp");
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
    }

    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
LABEL_11:
    v6 = v14;
  }

}

- (void)presentPayLaterPassAnimated:(BOOL)a3 completion:(id)a4
{
  -[PKPassGroupsViewController presentPassForFeatureIdentifier:animated:completion:](self, "presentPassForFeatureIdentifier:animated:completion:", 3, a3, a4);
}

- (void)presentPassWithAssociatedAccountIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke;
    v12[3] = &unk_1E3E6CBB0;
    v12[4] = self;
    v14 = a4;
    v13 = v10;
    objc_msgSend(v11, "accountWithIdentifier:completion:", v8, v12);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
  }

}

void __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_2;
  v7[3] = &unk_1E3E66EC8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v7[1] = 3221225472;
  v11 = *(_BYTE *)(a1 + 48);
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "associatedPassUniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(unsigned __int8 *)(a1 + 56);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_3;
      v8[3] = &unk_1E3E61338;
      v5 = *(void **)(a1 + 40);
      v10 = *(id *)(a1 + 48);
      v9 = v3;
      objc_msgSend(v5, "presentPassWithUniqueID:animated:completionHandler:", v9, v4, v8);

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
  }
}

uint64_t __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentPassDetailsAssociatedWithVirtualCardID:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D668E8];
  v10 = a3;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke;
  v13[3] = &unk_1E3E6CBB0;
  v15 = a4;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "accountWithVirtualCardIdentifier:completion:", v10, v13);

}

void __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_2;
  v7[3] = &unk_1E3E66EC8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v7[1] = 3221225472;
  v11 = *(_BYTE *)(a1 + 48);
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "associatedPassUniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(unsigned __int8 *)(a1 + 56);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_3;
      v8[3] = &unk_1E3E6D268;
      v5 = *(void **)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v10 = v5;
      v12 = *(_BYTE *)(a1 + 56);
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v9, "presentPassDetailsWithUniqueID:animated:completionHandler:", v3, v4, v8);

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

uint64_t __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t result;

  if ((_DWORD)a2 && PKSecureElementIsAvailable())
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_appleCardUpsellAlertWithAccount:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, *(unsigned __int8 *)(a1 + 56), 0);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)presentAccountServicePaymentWithReferenceIdentifier:(id)a3 forPassWithUniqueID:(id)a4
{
  -[PKPassGroupsViewController presentPassDetailsWithUniqueID:animated:completionHandler:](self, "presentPassDetailsWithUniqueID:animated:completionHandler:", a4, 1, 0);
}

- (void)presentSpendingSummaryForPassUniqueIdentifier:(id)a3 type:(unint64_t)a4 categorization:(unint64_t)a5 unit:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  PKPassPresentationContext *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v8 = a7;
  v14 = a8;
  v15 = a3;
  v16 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v16, "setLimitServerLoad:", 1);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke;
  v18[3] = &unk_1E3E6CCF0;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v18[4] = self;
  v19 = v14;
  v17 = v14;
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v15, v16, v8, v18);

}

void __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 64);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke_2;
      v9[3] = &unk_1E3E61590;
      v8 = *(_QWORD *)(a1 + 48);
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v4, "presentSpendingSummaryWithType:categorization:unit:completion:", v8, v6, v7, v9);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentBalanceDetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PKPassPresentationContext *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v10, "setLimitServerLoad:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E3E669E0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v9, v10, v5, v12);

}

void __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke_2;
      v6[3] = &unk_1E3E61590;
      v7 = *(id *)(a1 + 40);
      objc_msgSend(v4, "presentBalanceDetailsWithCompletion:", v6);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)showStatementForIdentifier:(id)a3 passUniqueIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassPresentationContext *v13;
  void *v14;
  PKPassPresentationContext *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PKPassGroupsViewController *v21;
  id v22;
  PKPassPresentationContext *v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v13, "setLimitServerLoad:", 1);
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke;
  v19[3] = &unk_1E3E6CD90;
  v23 = v13;
  v24 = v12;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v25 = a5;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v14, "accountForPassWithUniqueID:completion:", v16, v19);

}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_2;
    v10[3] = &unk_1E3E6CD68;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v11 = v6;
    v12 = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 56);
    v16 = *(_BYTE *)(a1 + 72);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v4, "creditStatementsForAccountIdentifier:completion:", v5, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
  }

}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__25;
  v23 = __Block_byref_object_dispose__25;
  v7 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_3;
  v16[3] = &unk_1E3E6CD18;
  v17 = *(id *)(a1 + 32);
  v18 = &v19;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  if (v20[5])
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 72);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_4;
    v13[3] = &unk_1E3E6CD40;
    v13[4] = v8;
    v15 = &v19;
    v11 = *(_QWORD *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v8, "presentPassWithUniqueID:context:animated:completionHandler:", v9, v11, v10, v13);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
  }

  _Block_object_dispose(&v19, 8);
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

      goto LABEL_9;
    }
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_10;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = v11;
  v5 = *(id *)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;
LABEL_9:

LABEL_10:
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_5;
      v8[3] = &unk_1E3E61590;
      v9 = v6;
      objc_msgSend(v4, "showStatement:completion:", v7, v8);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentDailyCashForPassUniqueIdentifier:(id)a3 dateComponents:(id)a4 redemptionType:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  PKPassPresentationContext *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19[2];
  id location;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (a5 >= 3)
  {
    if (a5 == 3)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_3;
      v16[3] = &unk_1E3E6CE08;
      v16[4] = self;
      objc_copyWeak(v19, &location);
      v18 = v14;
      v17 = v13;
      v19[1] = (id)3;
      dispatch_async(MEMORY[0x1E0C80D38], v16);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v15 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setLimitServerLoad:](v15, "setLimitServerLoad:", 1);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke;
    v21[3] = &unk_1E3E6CDB8;
    v21[4] = self;
    v22 = v13;
    v24 = a5;
    v23 = v14;
    -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v12, v15, v8, v21);

  }
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_2;
      v8[3] = &unk_1E3E61590;
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 56);
      v9 = *(id *)(a1 + 48);
      objc_msgSend(v4, "presentDailyCashForDateComponents:redemptionType:completion:", v6, v7, v8);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8[2];

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_4;
  v5[3] = &unk_1E3E6CDE0;
  objc_copyWeak(v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 64);
  v6 = v3;
  v8[1] = v4;
  objc_msgSend(v2, "presentCreditPassAnimated:completion:", 1, v5);

  objc_destroyWeak(v8);
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if ((a2 & 1) != 0 || !WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 56);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_5;
      v10[3] = &unk_1E3E61590;
      v8 = *(_QWORD *)(a1 + 32);
      v11 = *(id *)(a1 + 40);
      objc_msgSend(v6, "presentDailyCashForDateComponents:redemptionType:completion:", v8, v7, v10);

    }
    else
    {
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
    }

  }
}

uint64_t __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentRewardsHubForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PKPassPresentationContext *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v10, "setLimitServerLoad:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E3E669E0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v9, v10, v5, v12);

}

void __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke_2;
      v6[3] = &unk_1E3E61590;
      v7 = *(id *)(a1 + 40);
      objc_msgSend(v4, "presentRewardsHubWithCompletion:", v6);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentAccountPromotionForPassUniqueIdentifier:(id)a3 programIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PKPassPresentationContext *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v13, "setLimitServerLoad:", 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke;
  v16[3] = &unk_1E3E66EF0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v12, v13, v7, v16);

}

void __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke_2;
      v7[3] = &unk_1E3E61590;
      v6 = *(_QWORD *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v4, "presentAccountPromotionWithProgramIdentifier:completion:", v6, v7);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentRewardsHubMerchantsForPassUniqueIdentifier:(id)a3 privateIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PKPassPresentationContext *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setLimitServerLoad:](v13, "setLimitServerLoad:", 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke;
  v16[3] = &unk_1E3E66EF0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v12, v13, v7, v16);

}

void __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke_2;
      v7[3] = &unk_1E3E61590;
      v6 = *(_QWORD *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v4, "presentRewardsHubMerchantsWithPrivateIdentifier:completion:", v6, v7);

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }

  }
}

uint64_t __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_cardTemplateInformationForArticleLayouts:(id)a3
{
  id v4;
  id v5;
  PKDiscoveryCardViewTemplateInformation *v6;
  void *v7;
  char v8;
  _BOOL8 v9;

  v4 = a3;
  if (-[PKDiscoveryDataSource isMiniCardsAllowed](self->_discoveryDataSource, "isMiniCardsAllowed"))
  {
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      -[PKDiscoveryDataSource articleLayouts](self->_discoveryDataSource, "articleLayouts");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    v8 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_223);
    v9 = (PKDiscoveryForceIgnoreCEOCards() & 1) != 0
      || (v8 & 1) == 0
      && !-[PKPassGroupStackView discoveryGalleryHasWelcomeCards](self->_groupStackView, "discoveryGalleryHasWelcomeCards");
    v6 = -[PKDiscoveryCardViewTemplateInformation initWithCardSize:displayType:]([PKDiscoveryCardViewTemplateInformation alloc], "initWithCardSize:displayType:", v9, 0);

  }
  else
  {
    v6 = -[PKDiscoveryCardViewTemplateInformation initWithCardSize:displayType:]([PKDiscoveryCardViewTemplateInformation alloc], "initWithCardSize:displayType:", 0, 0);
  }

  return v6;
}

uint64_t __72__PKPassGroupsViewController__cardTemplateInformationForArticleLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "entitledToForceLargeCard"))
    v3 = objc_msgSend(v2, "hasHitMaxLargeViewCount") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (void)presentDiscoveryArticleForItemWithIdentifier:(id)a3 referrerIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  PKDiscoveryDataSource *discoveryDataSource;
  id v13;
  void *v14;
  PKDiscoveryArticleViewController *v15;
  void *v16;
  PKDiscoveryArticleViewController *v17;
  uint64_t v18;
  PKDiscoveryArticleViewController *v19;
  id v20;
  PKDiscoveryDataSource *v21;
  _QWORD v22[4];
  PKDiscoveryArticleViewController *v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];
  PKDiscoveryArticleViewController *v28;
  id v29;
  BOOL v30;
  BOOL v31;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  discoveryDataSource = self->_discoveryDataSource;
  v13 = a4;
  -[PKDiscoveryDataSource cachedDiscoveryArticleLayoutForItemWithIdentifier:](discoveryDataSource, "cachedDiscoveryArticleLayoutForItemWithIdentifier:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [PKDiscoveryArticleViewController alloc];
  -[PKPassGroupsViewController _cardTemplateInformationForArticleLayouts:](self, "_cardTemplateInformationForArticleLayouts:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKDiscoveryArticleViewController initWithArticleLayout:referrerIdentifier:cardTemplateInformation:](v15, "initWithArticleLayout:referrerIdentifier:cardTemplateInformation:", v14, v13, v16);

  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke;
  v27[3] = &unk_1E3E6CE70;
  v27[4] = self;
  v19 = v17;
  v28 = v19;
  v30 = v7;
  v31 = v14 == 0;
  v20 = v11;
  v29 = v20;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 8, v7, v27);
  if (!v14)
  {
    v21 = self->_discoveryDataSource;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_3;
    v22[3] = &unk_1E3E6CEC0;
    v23 = v19;
    v26 = v7;
    v24 = v10;
    v25 = v20;
    -[PKDiscoveryDataSource discoveryArticleLayoutForItemWithIdentifier:completion:](v21, "discoveryArticleLayoutForItemWithIdentifier:completion:", v24, v22);

  }
}

void __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_2;
  v5[3] = &unk_1E3E61A58;
  v7 = *(_BYTE *)(a1 + 57);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentViewController:animated:completion:", v4, v3, v5);

}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_4;
  v9[3] = &unk_1E3E6CE98;
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 || (v14 = *(_QWORD *)(a1 + 40)) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error presenting Discovery Article for itemIdentifier: %@ error: %@", buf, 0x16u);
    }

    PKLocalizedDiscoveryString(CFSTR("DISCOVERY_ARTICLE_CURRENTLY_UNAVAILABLE_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v8 != -1009)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_238;
        v16[3] = &unk_1E3E61D68;
        v17 = *(id *)(a1 + 48);
        objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v13);

        objc_msgSend(*(id *)(a1 + 48), "setIsDownloading:", 0);
        objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v10, 1, 0);

        goto LABEL_11;
      }
      PKLocalizedDiscoveryString(CFSTR("DISCOVERY_ARTICLE_OFFLINE_TITLE"));
      v9 = objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v7 = v6;
      v5 = (void *)v9;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 48), "setArticleLayout:animated:", v14, *(unsigned __int8 *)(a1 + 72));
LABEL_11:
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_238(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentSubcredentialInvitationWithIdentifier:(id)a3 remoteDeviceInvitationIdentifier:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  PKPaymentService *paymentService;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PKPassGroupsViewController *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  paymentService = self->_paymentService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke;
  v13[3] = &unk_1E3E6CF38;
  v14 = v8;
  v15 = self;
  v17 = a5;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[PKPaymentService subcredentialInvitationsWithCompletion:](paymentService, "subcredentialInvitationsWithCompletion:", v13);

}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;

  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_2;
  v13[3] = &unk_1E3E6CEE8;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(a2, "pk_anyObjectPassingTest:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_3;
  v8[3] = &unk_1E3E6CF10;
  v12 = *(_BYTE *)(a1 + 56);
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  return v3;
}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_4;
  v6[3] = &unk_1E3E6CF10;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v11 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, v2, v6);

}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v13 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(v13, "setIdentifier:", *(_QWORD *)(a1 + 40));
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "_presentSubcredentialInvitation:remoteInvite:isShareActivation:referralSource:animated:", v2, v13, 0, 0, *(unsigned __int8 *)(a1 + 64));

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "No invitation with ID %@", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("CARKEY_INVITATION_EXPIRED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    objc_msgSend(*(id *)(a1 + 48), "pkui_frontMostViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_presentSubcredentialInvitationFlowForPhoneInvitationMessage:(id)a3 isShareActivation:(BOOL)a4 referralSource:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  BOOL v21;
  BOOL v22;
  uint8_t buf[16];
  _QWORD v24[5];
  id v25;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D673C8], "remoteDeviceWebService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66AA0]), "initWithCrossPlatformInvitation:", v10);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__25;
  v24[4] = __Block_byref_object_dispose__25;
  v25 = 0;
  objc_msgSend(v10, "embeddedAddressForDeviceType:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v12)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Checking watch mailbox for watch invitation", buf, 2u);
    }

    objc_msgSend(v12, "targetDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke;
    v17[3] = &unk_1E3E6CF88;
    v20 = v24;
    v17[4] = self;
    v18 = v13;
    v21 = v8;
    v19 = v11;
    v22 = v6;
    objc_msgSend(v16, "retrieveShareInvitationForMailboxAddress:completion:", v14, v17);

  }
  else
  {
    -[PKPassGroupsViewController _presentSubcredentialInvitation:remoteInvite:isShareActivation:referralSource:animated:](self, "_presentSubcredentialInvitation:remoteInvite:isShareActivation:referralSource:animated:", v13, 0, v8, v11, v6);
  }

  _Block_object_dispose(v24, 8);
}

void __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  char v16;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0D66AA0];
    v5 = v3;
    v6 = objc_msgSend([v4 alloc], "initWithCrossPlatformInvitation:", v5);

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke_2;
  block[3] = &unk_1E3E6CF60;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v15 = *(_BYTE *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 48);
  v10 = (id)v11;
  v14 = v11;
  v16 = *(_BYTE *)(a1 + 65);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentSubcredentialInvitation:remoteInvite:isShareActivation:referralSource:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 65));
}

- (void)_presentSubcredentialInvitation:(id)a3 remoteInvite:(id)a4 isShareActivation:(BOOL)a5 referralSource:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PKSubcredentialInvitationFlowControllerContext *v17;
  void *v18;
  PKSubcredentialInvitationFlowControllerContext *v19;
  PKSubcredentialInvitationFlowController *v20;
  PKSubcredentialInvitationViewController *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;

  v8 = a5;
  v12 = (void *)MEMORY[0x1E0D673C8];
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "remoteDeviceWebService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PKSubcredentialInvitationFlowControllerContext alloc];
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PKSubcredentialInvitationFlowControllerContext initWithInvitation:localDeviceWebService:remoteDeviceWebService:](v17, "initWithInvitation:localDeviceWebService:remoteDeviceWebService:", v15, v18, v16);

  -[PKSubcredentialInvitationFlowControllerContext setRemoteDeviceInvitation:](v19, "setRemoteDeviceInvitation:", v14);
  -[PKSubcredentialInvitationFlowControllerContext setIsShareActivation:](v19, "setIsShareActivation:", v8);
  v20 = -[PKSubcredentialInvitationFlowController initWithDelegate:]([PKSubcredentialInvitationFlowController alloc], "initWithDelegate:", self);
  v21 = -[PKSubcredentialInvitationViewController initWithFlowController:context:]([PKSubcredentialInvitationViewController alloc], "initWithFlowController:context:", v20, v19);
  -[PKPassShareRedemptionViewController setReferralSource:](v21, "setReferralSource:", v13);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v21);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __117__PKPassGroupsViewController__presentSubcredentialInvitation_remoteInvite_isShareActivation_referralSource_animated___block_invoke;
  v24[3] = &unk_1E3E6CFB0;
  v24[4] = self;
  v25 = v22;
  v26 = a7;
  v23 = v22;
  -[PKSubcredentialInvitationViewController preflightWithCompletion:](v21, "preflightWithCompletion:", v24);

}

void __117__PKPassGroupsViewController__presentSubcredentialInvitation_remoteInvite_isShareActivation_referralSource_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);

}

- (BOOL)presentSubcredentialPairingFlowIfPossibleWithConfig:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  _BOOL4 v23;
  PKPassGroupsViewController *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentWebService:supportedRegionFeatureOfType:", v7, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v24 = self;
    v25 = v6;
    v23 = v4;
    -[NSObject issuerIdentifier](v6, "issuerIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v9, "supportedTerminals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
        objc_msgSend(v16, "partnerIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v10);

        if ((v18 & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v16;

      if (!v19)
        goto LABEL_14;
      v6 = v25;
      if (-[PKPassLibraryDataProvider canAddSecureElementPassWithConfiguration:](v24->_passLibraryDataProvider, "canAddSecureElementPassWithConfiguration:", v25))
      {
        -[PKPassGroupsViewController _presentSubcredentialPairingFlowWithConfig:flowType:animated:](v24, "_presentSubcredentialPairingFlowWithConfig:flowType:animated:", v25, 2, v23);
        v20 = 1;
        goto LABEL_23;
      }
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v25;
        _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Unable to start provisioning flow with config: %@", buf, 0xCu);
      }

    }
    else
    {
LABEL_10:

LABEL_14:
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      v6 = v25;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v10;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Subcredential pairing flow not supported with issuer: %@", buf, 0xCu);
      }
    }
    v20 = 0;
LABEL_23:

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Subcredential pairing flow not supported in region!", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (void)_presentSubcredentialPairingFlowWithConfig:(id)a3 flowType:(int64_t)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  BOOL v13;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke;
  v10[3] = &unk_1E3E6D000;
  v10[4] = self;
  v11 = v8;
  v13 = a5;
  v12 = a4;
  v9 = v8;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v10);

}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentSetupDismissibleNavigationController *v7;
  uint64_t v8;
  uint64_t v9;
  PKPaymentSetupDismissibleNavigationController *v10;
  void *v11;
  PKSubcredentialPairingFlowControllerContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKSubcredentialPairingFlowController *v18;
  _QWORD v19[4];
  PKPaymentSetupDismissibleNavigationController *v20;
  uint64_t v21;
  uint8_t buf[16];

  if (PKV2SharingFlowEnabled())
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Using v2 owner pairing flow", buf, 2u);
    }

    v3 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithWebService:", v4);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256));
    v7 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_257;
    v19[3] = &unk_1E3E6CFD8;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v20 = v7;
    v21 = v8;
    v10 = v7;
    +[PKProvisioningFlowBridge startInAppFlowWithNavController:context:addCarKeyConfiguration:completion:](PKProvisioningFlowBridge, "startInAppFlowWithNavController:context:addCarKeyConfiguration:completion:", v10, v6, v9, v19);
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, *(unsigned __int8 *)(a1 + 56), 0);

  }
  else
  {
    v18 = -[PKSubcredentialPairingFlowController initWithDelegate:]([PKSubcredentialPairingFlowController alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
    v12 = -[PKSubcredentialPairingFlowControllerContext initWithFlowType:referralSource:]([PKSubcredentialPairingFlowControllerContext alloc], "initWithFlowType:referralSource:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "referralSource"));
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialProvisioningFlowControllerContext setLocalDeviceWebService:](v12, "setLocalDeviceWebService:", v13);

    -[PKSubcredentialPairingFlowControllerContext setConfiguration:](v12, "setConfiguration:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0D673C8], "remoteDeviceWebService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialProvisioningFlowControllerContext setRemoteDeviceWebService:](v12, "setRemoteDeviceWebService:", v14);

    -[PKSubcredentialPairingFlowController startingViewControllerForContext:](v18, "startingViewControllerForContext:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v15);
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v16, *(unsigned __int8 *)(a1 + 56), 0);

  }
}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_257(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_2;
  v7[3] = &unk_1E3E61388;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v2, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentPassWithUniqueID:animated:completionHandler:", v4, 1, 0);

    v2 = v5;
  }

}

- (void)presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString:(id)a3 passThumbnailImageData:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  PKPassGroupsViewController *v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0D673C8];
  v10 = a3;
  objc_msgSend(v9, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v11);
  objc_msgSend(v10, "pk_decodeHexadecimal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v13, &v40);
  v15 = v40;
  if (v14)
    v16 = v15 == 0;
  else
    v16 = 0;
  if (!v16)
  {
    v17 = v15;
    objc_msgSend(v14, "finishDecoding");
    v18 = 0;
LABEL_12:
    PKLogFacilityTypeGetObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v29;
      _os_log_impl(&dword_19D178000, v28, OS_LOG_TYPE_DEFAULT, "Unable to decode encrypted provisioning target: %@", buf, 0xCu);

    }
    PKDisplayableErrorForCommonType();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = PKAlertForDisplayableErrorWithHandlers(v27, 0, 0, 0);
    if (v30)
      -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, 0);

    goto LABEL_17;
  }
  v31 = a5;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0CB2CD0];
  v39 = 0;
  objc_msgSend(v14, "decodeTopLevelObjectOfClasses:forKey:error:", v21, v22, &v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v39;

  objc_msgSend(v14, "finishDecoding");
  if (!v18)
    goto LABEL_12;
  if (!objc_msgSend(v18, "count"))
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  PKLogFacilityTypeGetObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v18;
    _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Presenting shareable credentials with encrypted provisioning targets: %@", buf, 0xCu);
  }

  v24 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke;
  v37[3] = &unk_1E3E6D028;
  v38 = v8;
  objc_msgSend(v18, "pk_arrayByApplyingBlock:", v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v32[1] = 3221225472;
  v32[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_2;
  v32[3] = &unk_1E3E6D050;
  v33 = v12;
  v34 = self;
  v35 = v25;
  v36 = v31;
  v26 = v25;
  objc_msgSend(v33, "validatePreconditions:", v32);

  v27 = v38;
LABEL_17:

}

id __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67340]), "initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:", v3, 0, *(_QWORD *)(a1 + 32));
  else
    v4 = 0;

  return v4;
}

void __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  PKPaymentSetupDismissibleNavigationController *v7;
  uint64_t v8;
  PKPaymentSetupDismissibleNavigationController *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __int16 v14[8];
  _QWORD v15[4];
  PKPaymentSetupDismissibleNavigationController *v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Present navigation controller for shareable credential failed: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "alertForDisplayableError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256));
    v7 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
    -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v7, "useStandardPlatformPresentationStyle");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    v8 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_265;
    v15[3] = &unk_1E3E66238;
    p_buf = &buf;
    v9 = v7;
    v16 = v9;
    +[PKProvisioningFlowBridge startShareableCredentialFlowWithNavController:context:credentials:completion:](PKProvisioningFlowBridge, "startShareableCredentialFlowWithNavController:context:credentials:completion:", v9, v6, v8, v15);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Failed to present shareable provisioning flow", (uint8_t *)v14, 2u);
      }

      PKDisplayableErrorForCommonType();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = PKAlertForDisplayableErrorWithHandlers(v11, 0, 0, 0);
      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v12, 1, 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v9, *(unsigned __int8 *)(a1 + 56), 0);
    }

    _Block_object_dispose(&buf, 8);
  }

}

uint64_t __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_265(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentAddShareablePassConfiguration:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKPassGroupsViewController *v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v7);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke;
  v11[3] = &unk_1E3E6D078;
  objc_copyWeak(&v15, &location);
  v9 = v8;
  v12 = v9;
  v13 = self;
  v10 = v6;
  v14 = v10;
  v16 = a4;
  objc_msgSend(v9, "validatePreconditionsAndRegister:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPaymentSetupDismissibleNavigationController *v8;
  uint64_t v9;
  PKPaymentSetupDismissibleNavigationController *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  PKPaymentSetupDismissibleNavigationController *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Present navigation controller for shareable configuration failed: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "alertForDisplayableError:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 7, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256));
      v8 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
      -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v8, "useStandardPlatformPresentationStyle");
      v9 = *(_QWORD *)(a1 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke_266;
      v13[3] = &unk_1E3E6C0F0;
      v14 = v8;
      v10 = v8;
      +[PKProvisioningFlowBridge startInAppFlowWithNavController:context:addPassConfiguration:completion:](PKProvisioningFlowBridge, "startInAppFlowWithNavController:context:addPassConfiguration:completion:", v10, v7, v9, v13);
      objc_msgSend(WeakRetained, "pkui_frontMostViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, *(unsigned __int8 *)(a1 + 64), 0);

    }
  }

}

uint64_t __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke_266(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentShareInvitationWithMailboxAddress:(id)a3 referralSource:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a4;
  v7 = v6;
  v8 = v9;
  PKSharingFetchInvitationFromMailboxAddress();

}

void __95__PKPassGroupsViewController_presentShareInvitationWithMailboxAddress_referralSource_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  if (a4)
  {
    v6 = PKAlertForDisplayableErrorWithHandlers(a4, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentShareRedemptionFlowWithInvitation:handle:referralSource:originalShareURL:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)_presentShareRedemptionFlowWithInvitation:(id)a3 handle:(id)a4 referralSource:(id)a5 originalShareURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke;
  v18[3] = &unk_1E3E62398;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v18);

}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  PKPaymentSetupDismissibleNavigationController *v6;
  PKPaymentSetupDismissibleNavigationController *v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  PKPaymentSetupDismissibleNavigationController *v12;
  uint64_t v13;

  v2 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithWebService:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256));
  v6 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_2;
  aBlock[3] = &unk_1E3E6D0C8;
  v11 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    +[PKProvisioningFlowBridge startShareRedemptionFlowWithNavController:context:invitation:referralSource:completion:](PKProvisioningFlowBridge, "startShareRedemptionFlowWithNavController:context:invitation:referralSource:completion:", v7, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v9);
  }
  else
  {
    +[PKProvisioningFlowBridge startCarKeyShareRedemptionFlowWithNavController:context:invitation:handle:originalShareURL:completion:](PKProvisioningFlowBridge, "startCarKeyShareRedemptionFlowWithNavController:context:invitation:handle:originalShareURL:completion:", v7, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_3;
  v7[3] = &unk_1E3E61388;
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v2, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentPassWithUniqueID:animated:completionHandler:", v4, 1, 0);

    v2 = v5;
  }

}

- (void)presentShareDetailsForPassUniqueIdentifier:(id)a3 shareIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke;
  v10[3] = &unk_1E3E62E98;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v9, 1, v10);

}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secureElementPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0D67688]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v8 = (void *)objc_msgSend(v5, "initWithPass:webService:paymentServiceProvider:queue:", v4, v6, v7, MEMORY[0x1E0C80D38]);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_2;
    v12[3] = &unk_1E3E61400;
    v13 = v8;
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v11 = v8;
    objc_msgSend(v11, "updateSharesWithCompletion:", v12);

  }
}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  PKPassSharesListViewController *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "shareForShareIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D67668]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_3;
    v8[3] = &unk_1E3E6CA70;
    v9 = v2;
    v10 = *(id *)(a1 + 32);
    v11 = v3;
    v12 = *(_QWORD *)(a1 + 48);
    v4 = v3;
    objc_msgSend(v4, "authorizeDeviceOwnerWithAuthHandler:completion:", 0, v8);

  }
  else
  {
    v5 = -[PKPassSharesListViewController initWithSharesController:]([PKPassSharesListViewController alloc], "initWithSharesController:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    objc_msgSend(*(id *)(a1 + 48), "pkui_frontMostViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  PKPassShareDetailsViewController *v5;

  if (a2)
  {
    v5 = -[PKPassShareDetailsViewController initWithShare:sharesController:authorizer:]([PKPassShareDetailsViewController alloc], "initWithShare:sharesController:authorizer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    objc_msgSend(*(id *)(a1 + 56), "pkui_frontMostViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (void)presentEntitlementDetailsForPassUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E3E619E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, v6);

}

void __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_passFromGroupsControllerWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secureElementPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0D67688]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v8 = (void *)objc_msgSend(v5, "initWithPass:webService:paymentServiceProvider:queue:", v4, v6, v7, MEMORY[0x1E0C80D38]);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke_2;
    v11[3] = &unk_1E3E61388;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    v10 = v8;
    objc_msgSend(v10, "updateEntitlementsWithCompletion:", v11);

  }
}

void __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke_2(uint64_t a1)
{
  PKPassShareEntitlementSelectionViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  PKPassShareEntitlementSelectionViewController *v6;

  v2 = [PKPassShareEntitlementSelectionViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "myEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPassShareEntitlementSelectionViewController initWithMyEntitlements:](v2, "initWithMyEntitlements:", v3);

  -[PKPassShareEntitlementSelectionViewController setShowDoneButton:](v6, "setShowDoneButton:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)presentShareActivationWithShareIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v6);

}

uint64_t __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1072);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_2;
  v5[3] = &unk_1E3E6D0F0;
  v5[4] = v2;
  return objc_msgSend(v3, "pendingShareActivationForShareIdentifier:completion:", v1, v5);
}

void __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_3;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PKPassShareActivationViewController *v5;
  PKNavigationController *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "originalInvitation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_presentSubcredentialInvitationFlowForPhoneInvitationMessage:isShareActivation:referralSource:animated:", v8, 1, 0, 1);
    }
    else
    {
      v5 = -[PKPassShareActivationViewController initWithPendingActivation:]([PKPassShareActivationViewController alloc], "initWithPendingActivation:", *(_QWORD *)(a1 + 32));
      v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)presentProvisioningForPendingProvisioningOfType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke;
  v10[3] = &unk_1E3E61400;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v10);

}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 1072);
  v5 = a1[6];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_2;
  v6[3] = &unk_1E3E6D188;
  v6[4] = v2;
  v7 = v3;
  v8 = (id)a1[6];
  objc_msgSend(v4, "retrievePendingProvisioningOfType:withUniqueIdentifier:completion:", v7, v5, v6);

}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "status") == 3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_3;
    v7[3] = &unk_1E3E62460;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentSetupDismissibleNavigationController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKPaymentSetupDismissibleNavigationController *v11;
  _QWORD v12[6];
  id v13;
  _QWORD v14[4];
  PKPaymentSetupDismissibleNavigationController *v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[3];
  char v21;
  id location;
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithWebService:", v4);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, v5, 0);
    v7 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
    objc_initWeak(&location, a1[5]);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v23[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_4;
    v14[3] = &unk_1E3E6D138;
    objc_copyWeak(&v19, &location);
    v18 = v20;
    v11 = v7;
    v15 = v11;
    v16 = a1[6];
    v17 = a1[7];
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_6;
    v12[3] = &unk_1E3E6D160;
    objc_copyWeak(&v13, &location);
    v12[4] = a1[5];
    v12[5] = v20;
    +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:](PKProvisioningFlowBridge, "startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:", v11, v6, v8, v9, v14, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v19);
    _Block_object_dispose(v20, 8);
    objc_destroyWeak(&location);

  }
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

    objc_msgSend(v4[134], "removePendingProvisioningOfType:withUniqueIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &__block_literal_global_277);
    WeakRetained = v4;
  }

}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v3;
  }

}

- (void)presentPeerPaymentPassAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke;
  v9[3] = &unk_1E3E6D1B0;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "accountWithCompletion:", v9);

}

void __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_2;
  v7[3] = &unk_1E3E66EC8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v7[1] = 3221225472;
  v11 = *(_BYTE *)(a1 + 48);
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "associatedPassUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_3;
    v6[3] = &unk_1E3E61338;
    v4 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v7 = v2;
    objc_msgSend(v4, "presentPassWithUniqueID:animated:completionHandler:", v7, v3, v6);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }

}

uint64_t __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentSecurePassSessionWithIssuerData:(id)a3 withSignature:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PKPassGroupsViewController_presentSecurePassSessionWithIssuerData_withSignature_animated___block_invoke;
  v12[3] = &unk_1E3E64E10;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v12);

}

void __92__PKPassGroupsViewController_presentSecurePassSessionWithIssuerData_withSignature_animated___block_invoke(uint64_t a1)
{
  PKServiceAddPassesViewController *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  v2 = objc_alloc_init(PKServiceAddPassesViewController);
  -[PKServiceAddPassesViewController setResultsDelegate:](v2, "setResultsDelegate:", *(_QWORD *)(a1 + 32));
  -[PKServiceAddPassesViewController ingestPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:](v2, "ingestPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:", 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2);
  if (v2
    && (-[PKServiceAddPassesViewController topViewController](v2, "topViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v2, *(unsigned __int8 *)(a1 + 56), 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Unable to present issuer binding view controller", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)presentApplicationWithIdentifier:(id)a3
{
  id v4;
  PKPaymentService *paymentService;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPassGroupsViewController *v9;

  v4 = a3;
  paymentService = self->_paymentService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke;
  v7[3] = &unk_1E3E6CFD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[PKPaymentService featureApplicationsForProvisioningWithCompletion:](paymentService, "featureApplicationsForProvisioningWithCompletion:", v7);

}

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  PKApplyControllerConfiguration *v12;
  PKApplyController *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2;
  v21[3] = &unk_1E3E65F68;
  v22 = *(id *)(a1 + 32);
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithWebService:", v10);

    v12 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", 0, 0, v11);
    -[PKApplyControllerConfiguration setFeatureApplication:](v12, "setFeatureApplication:", v8);
    -[PKApplyControllerConfiguration setFeature:](v12, "setFeature:", objc_msgSend(v8, "feature"));
    v13 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v12);
    v15 = *(_QWORD *)(a1 + 40);
    v14 = (id *)(a1 + 40);
    v16 = *(void **)(v15 + 1200);
    *(_QWORD *)(v15 + 1200) = v13;

    objc_initWeak(location, *v14);
    v17 = (void *)*((_QWORD *)*v14 + 150);
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_288;
    v19[3] = &unk_1E3E62598;
    objc_copyWeak(&v20, location);
    objc_msgSend(v17, "nextViewControllerWithCompletion:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(location);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "No application found with identifier %@", (uint8_t *)location, 0xCu);
    }
  }

}

uint64_t __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_288(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2_289;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2_289(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "pkui_frontMostViewController");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "No apply view returned with error: %@", (uint8_t *)&v6, 0xCu);
      }
    }

  }
}

- (void)presentPrecursorPassUpdateForPassUniqueIdentifier:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PKPassGroupsViewController_presentPrecursorPassUpdateForPassUniqueIdentifier___block_invoke;
  v3[3] = &unk_1E3E62288;
  v3[4] = self;
  -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", a3, 1, v3);
}

void __80__PKPassGroupsViewController_presentPrecursorPassUpdateForPassUniqueIdentifier___block_invoke(uint64_t a1, char a2)
{
  id v2;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v2, "isBeingDismissed") & 1) == 0)
      objc_msgSend(v2, "performPrecursorPassAction");

  }
}

- (void)viewController:(id)a3 ingestionDidFinishWithResult:(unint64_t)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, v5, 0);

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;

  v4 = a4;
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v4, 0);

  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  self->_peerPaymentAccountResolutionController = 0;

}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, v5, 0);

}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKPassGroupStackView)groupStackView
{
  -[PKPassGroupsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_groupStackView;
}

- (void)invalidate
{
  -[PKPassGroupsViewController _invalidateForType:](self, "_invalidateForType:", 2);
}

- (void)partiallyInvalidate
{
  -[PKPassGroupsViewController _invalidateForType:](self, "_invalidateForType:", 1);
}

- (void)_invalidateForType:(int64_t)a3
{
  int64_t invalidationStatus;
  NSObject *v6;
  PKPassGroupStackView *groupStackView;
  PKPaymentService *paymentService;
  NSObject *v9;
  PKPassGroupStackView *v10;
  int v11;
  PKPassGroupsViewController *v12;
  __int16 v13;
  PKPassGroupStackView *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus != a3)
  {
    self->_invalidationStatus = a3;
    if (a3 >= 1 && invalidationStatus <= 0)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        groupStackView = self->_groupStackView;
        v11 = 134349312;
        v12 = self;
        v13 = 2050;
        v14 = groupStackView;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p:%{public}p): partially invalidated.", (uint8_t *)&v11, 0x16u);
      }

      -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
      paymentService = self->_paymentService;
      self->_paymentService = 0;

      -[PKPassGroupsViewController _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);
    }
    if (a3 > 1 && invalidationStatus <= 1)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_groupStackView;
        v11 = 134349312;
        v12 = self;
        v13 = 2050;
        v14 = v10;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p:%{public}p): invalidated.", (uint8_t *)&v11, 0x16u);
      }

      -[PKPassGroupStackView setDelegate:](self->_groupStackView, "setDelegate:", 0);
      -[PKPassGroupStackView invalidate](self->_groupStackView, "invalidate");
    }
  }
}

- (void)startPaymentPreflight:(id)a3 withPaymentSetupMode:(int64_t)a4 referrerIdentifier:(id)a5 paymentNetworks:(id)a6 transitNetworkIdentifiers:(id)a7 allowedFeatureIdentifiers:(id)a8 productIdentifiers:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t *v22;
  void *v23;
  void (**v24)(void *, uint64_t);
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  int64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  _QWORD aBlock[5];
  id v43;
  void (**v44)(void *, uint64_t);
  int64_t v45;
  uint64_t v46;
  uint64_t v47;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  PKTimeProfileBegin();
  objc_opt_class();
  v34 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = MEMORY[0x1E0C809B0];
    v21 = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke;
    v22 = &v47;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = (void (**)(void *, uint64_t))&__block_literal_global_298;
      goto LABEL_7;
    }
    v46 = MEMORY[0x1E0C809B0];
    v21 = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2;
    v22 = &v46;
  }
  v22[1] = 3221225472;
  v22[2] = (uint64_t)v21;
  v22[3] = (uint64_t)&unk_1E3E62288;
  v22[4] = (uint64_t)v15;
  v23 = _Block_copy(v22);
  v24 = (void (**)(void *, uint64_t))objc_msgSend(v23, "copy");

LABEL_7:
  if ((objc_msgSend((id)objc_opt_class(), "isPerformingAction") & 1) == 0)
  {
    -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v24[2](v24, 1);
      objc_msgSend((id)objc_opt_class(), "beginTrackingAction");
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_setIdleTimerDisabled:forReason:", 1, CFSTR("SetupPayments"));

      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v33);
      objc_msgSend(v27, "setReferrerIdentifier:", v16);
      objc_msgSend(v27, "setAllowedFeatureIdentifiers:", v19);
      objc_msgSend(v27, "setAllowedProductIdentifiers:", v20);
      if (v17)
        objc_msgSend(v27, "setAllowedPaymentNetworks:", v17);
      if (v18)
        objc_msgSend(v27, "setRequiredTransitNetworkIdentifiers:", v18);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_4;
      aBlock[3] = &unk_1E3E6D218;
      aBlock[4] = self;
      v44 = v24;
      v28 = v27;
      v43 = v28;
      v45 = v34;
      v29 = _Block_copy(aBlock);
      -[PKPassGroupsViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_10;
      v35[3] = &unk_1E3E6D240;
      v30 = v28;
      v36 = v30;
      v41 = v34;
      v37 = v17;
      v38 = v18;
      v39 = v20;
      v40 = v29;
      v31 = v29;
      v32 = _Block_copy(v35);
      if (v34 == 2)
        objc_msgSend(v30, "preflightWithRequirements:completionRequirements:completion:", 495, 495, v32);
      else
        objc_msgSend(v30, "preflightWithCompletion:", v32);

    }
  }

}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowActivityIndicator:", a2);
}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowActivityIndicator:", a2);
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  uint64_t v27;
  _QWORD v28[5];
  PKPaymentSetupNavigationController *v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "endTrackingAction");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setIdleTimerDisabled:forReason:", 0, CFSTR("SetupPayments"));

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
    goto LABEL_14;
  }
  if (a2)
  {
    v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", *(_QWORD *)(a1 + 40), 0);
    -[PKPaymentSetupNavigationController setSetupDelegate:](v8, "setSetupDelegate:", *(_QWORD *)(a1 + 32));
    -[PKPaymentSetupNavigationController setPaymentSetupMode:](v8, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
    -[PKPaymentSetupNavigationController setGroupsController:](v8, "setGroupsController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_5;
    v28[3] = &unk_1E3E66EF0;
    v28[4] = *(_QWORD *)(a1 + 32);
    v29 = v8;
    v30 = *(id *)(a1 + 48);
    v9 = v8;
    -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v28);

    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v5, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (v11)
  {
    if (objc_msgSend(v5, "code") == 6)
    {
      v12 = (void *)MEMORY[0x1E0D66A58];
      v13 = *MEMORY[0x1E0D69900];
      v36[0] = *MEMORY[0x1E0D698F8];
      v36[1] = v13;
      v36[2] = *MEMORY[0x1E0D69950];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D68F50];
      v34[0] = *MEMORY[0x1E0D68AA0];
      v34[1] = v15;
      v16 = *MEMORY[0x1E0D696B8];
      v35[0] = *MEMORY[0x1E0D68C50];
      v35[1] = v16;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v35;
      v19 = v34;
LABEL_10:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subjects:sendEvent:", v14, v23);

      goto LABEL_11;
    }
    if (objc_msgSend(v5, "code") == 9)
    {
      v12 = (void *)MEMORY[0x1E0D66A58];
      v20 = *MEMORY[0x1E0D69900];
      v33[0] = *MEMORY[0x1E0D698F8];
      v33[1] = v20;
      v33[2] = *MEMORY[0x1E0D69950];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0D68F50];
      v31[0] = *MEMORY[0x1E0D68AA0];
      v31[1] = v21;
      v22 = *MEMORY[0x1E0D697D0];
      v32[0] = *MEMORY[0x1E0D68C50];
      v32[1] = v22;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v32;
      v19 = v31;
      goto LABEL_10;
    }
  }
LABEL_11:
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_7;
  v26[3] = &unk_1E3E612E8;
  v27 = *(_QWORD *)(a1 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_8;
  v25[3] = &unk_1E3E612E8;
  v25[4] = v27;
  PKAlertForDisplayableErrorWithHandlers(v5, 0, v26, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v24, 1, &__block_literal_global_303);

LABEL_14:
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_6;
    v5[3] = &unk_1E3E61590;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, v5);

  }
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_6(uint64_t a1)
{
  id v1;
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  PKLogFacilityTypeGetObject();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)PKTimeProfileEnd();

}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_9()
{
  id v0;
  id v1;

  PKLogFacilityTypeGetObject();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)PKTimeProfileEnd();

}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = CFSTR("SetupPayments");
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Enabling Idle Timer: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "paymentSetupProductModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allSetupProducts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2
    && *(_QWORD *)(a1 + 72) == 3
    && (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56))
    && objc_msgSend(v8, "count") == 1)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_304;
    v11[3] = &unk_1E3E61540;
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v9, "setupProductForProvisioning:includePurchases:withCompletionHandler:", v10, 1, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addVASPassWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  PKVASPassCacheDirectoryPath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", *MEMORY[0x1E0D6B358]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0D66EC8], "createWithFileURL:warnings:error:", v9, 0, &v16);
  v11 = v16;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Add VAS pass with identifier: %@", buf, 0xCu);

    }
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController _presentAddPassesControllerWithPasses:](self, "_presentAddPassesControllerWithPasses:", v13);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v4;
    v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_19D178000, v13, OS_LOG_TYPE_ERROR, "Failed to add VAS pass with identifier: %{public}@ %{public}@.", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeItemAtURL:error:", v9, 0);

}

- (void)presentOrderManagementAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD aBlock[5];
  id v12;
  BOOL v13;

  v4 = a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E3E66830;
  aBlock[4] = self;
  v13 = v4;
  v7 = v6;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isBeingDismissed") & 1) == 0)
  {
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE66E588))
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    else
      -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v8);
  }
  else
  {
    v8[2](v8);
  }

}

void __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  -[objc_class makeViewController](getFKOrderManagementViewControllerProviderClass(), "makeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke_2;
  v7[3] = &unk_1E3E618A0;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  objc_msgSend(v4, "presentViewController:animated:completion:", v6, v3, v7);

}

uint64_t __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentAuthorizationFlowAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke;
  v18 = &unk_1E3E6D2B8;
  v7 = v6;
  v19 = v7;
  objc_copyWeak(&v20, &location);
  v21 = v4;
  v8 = (void (**)(_QWORD))_Block_copy(&v15);
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController", v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isBeingDismissed") & 1) == 0)
  {
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE66E5E8))
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
    else
    {
      objc_msgSend(v10, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EE66E5E8);

      if (v12)
      {
        objc_msgSend(v10, "presentingViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v13);
      }
      else
      {
        objc_msgSend(v10, "childViewControllers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pk_firstObjectPassingTest:", &__block_literal_global_327);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          (*((void (**)(id, void *))v7 + 2))(v7, v13);
        }
        else
        {
          -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v8);
          v13 = 0;
        }
      }

    }
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CADCF8]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2;
  v3[3] = &unk_1E3E6D290;
  v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v6 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "authorizationSessionWithCompletion:", v3);
  objc_destroyWeak(&v5);

}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_321;
    v5[3] = &unk_1E3E6C5E8;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    v9 = *(_BYTE *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v5);

    objc_destroyWeak(&v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D178000, v4, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The auth session is nil!", buf, 2u);
    }

  }
}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_321(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D66F08]);
    objc_msgSend(*(id *)(a1 + 32), "fpanId");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          objc_msgSend(*(id *)(a1 + 32), "fpanId"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "passWithFPANIdentifier:", v6),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v7))
    {
      objc_msgSend(v7, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(unsigned __int8 *)(a1 + 56);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2_322;
      v10[3] = &unk_1E3E6D268;
      v10[4] = WeakRetained;
      v12 = *(id *)(a1 + 40);
      v11 = *(id *)(a1 + 32);
      v13 = *(_BYTE *)(a1 + 56);
      objc_msgSend(WeakRetained, "presentPassWithUniqueID:animated:completionHandler:", v8, v9, v10);

    }
    else
    {
      objc_msgSend(WeakRetained, "presentAuthorizationViewControllerWithSession:animated:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2_322(uint64_t a1, char a2)
{
  void *v3;
  char isKindOfClass;

  if ((a2 & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "presentAuthorizationViewControllerWithSession:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EE66E5E8);
}

- (void)presentAuthorizationViewControllerWithSession:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id location[2];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_initWeak(location, self);
  +[PKDismissalPreventionAssertionManager sharedInstance](PKDismissalPreventionAssertionManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acquireAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__25;
  v33 = __Block_byref_object_dispose__25;
  v34 = 0;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke;
  aBlock[3] = &unk_1E3E6D320;
  aBlock[1] = 3221225472;
  objc_copyWeak(&v27, location);
  v13 = v9;
  v26 = v13;
  v28 = v6;
  v14 = v11;
  v25 = v14;
  v15 = _Block_copy(aBlock);
  -[objc_class makeAuthorizationViewControllerForAuthorizationSession:completion:](getFKBankConnectAuthorizationViewControllerProviderClass(), "makeAuthorizationViewControllerForAuthorizationSession:completion:", v8, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v30[5];
  v30[5] = v16;

  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v30[5];
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke_2;
  v21[3] = &unk_1E3E69918;
  v20 = v13;
  v22 = v20;
  v23 = &v29;
  objc_msgSend(v18, "presentViewController:animated:completion:", v19, v6, v21);

  objc_destroyWeak(&v27);
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(location);
}

void __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 56), 0);
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)presentBackgroundRefreshConfirmationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPassGroupsViewController_presentBackgroundRefreshConfirmationAnimated___block_invoke;
  v8[3] = &unk_1E3E64C10;
  v8[4] = self;
  v9 = a3;
  v5 = (void (**)(_QWORD))_Block_copy(v8);
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isBeingDismissed") & 1) == 0)
    -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, v5);
  else
    v5[2](v5);

}

void __75__PKPassGroupsViewController_presentBackgroundRefreshConfirmationAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  -[objc_class makeViewController](getFKBankConnectBackgroundRefreshConfirmationViewControllerProviderClass(), "makeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, *(unsigned __int8 *)(a1 + 40), 0);
    v2 = v3;
  }

}

- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PKPassGroupsViewController *v14;
  id v15;

  v5 = a4;
  v7 = a5;
  v8 = v7;
  v9 = 0;
  if (v7 && v5)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __122__PKPassGroupsViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke;
    v13 = &unk_1E3E61388;
    v14 = self;
    v15 = v7;
    v9 = _Block_copy(&v10);

  }
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v9, v10, v11, v12, v13, v14);

}

uint64_t __122__PKPassGroupsViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPassWithUniqueID:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)_peerPaymentAccountResolutionController
{
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  PKPeerPaymentAccountResolutionController *v4;
  void *v5;
  void *v6;
  PKPeerPaymentAccountResolutionController *v7;
  PKPeerPaymentAccountResolutionController *v8;

  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  if (!peerPaymentAccountResolutionController)
  {
    v4 = [PKPeerPaymentAccountResolutionController alloc];
    -[PKPeerPaymentService account](self->_peerPaymentService, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v4, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v5, v6, 0, self, self->_passLibraryDataProvider);
    v8 = self->_peerPaymentAccountResolutionController;
    self->_peerPaymentAccountResolutionController = v7;

    peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  }
  return peerPaymentAccountResolutionController;
}

- (void)dismissVerificationPageForPassWithDeviceAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v4 = a3;
  -[PKPassGroupsViewController presentedPass](self, "presentedPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "deviceAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    objc_opt_class();
    -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }

}

- (void)_presentAddPassesControllerWithPasses:(id)a3
{
  id v4;
  PKAddPassesViewController *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  PKAddPassesViewController *v9;

  v4 = a3;
  v5 = -[PKAddPassesViewController initWithPasses:fromPresentationSource:]([PKAddPassesViewController alloc], "initWithPasses:fromPresentationSource:", v4, 1);

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PKPassGroupsViewController__presentAddPassesControllerWithPasses___block_invoke;
    v8[3] = &unk_1E3E61388;
    v8[4] = self;
    v9 = v5;
    -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v8);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't add passes", v7, 2u);
    }

  }
}

uint64_t __68__PKPassGroupsViewController__presentAddPassesControllerWithPasses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)presentPaymentSetupController
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithWebService:", v3);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke;
  v6[3] = &unk_1E3E625E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  objc_msgSend(v5, "validatePreconditionsAndRegister:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_2;
  v7[3] = &unk_1E3E625C0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = *(_QWORD *)(a1 + 32) == 0;
    else
      v4 = 0;
    if (v4)
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_3;
      v7[3] = &unk_1E3E619E0;
      v8 = v3;
      v9 = v5;
      v6 = v5;
      objc_msgSend(v6, "preflightWithCompletion:", v7);

    }
    else
    {
      objc_msgSend(WeakRetained, "_handleProvisioningError:");
    }
  }

}

uint64_t __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  -[PKPaymentSetupNavigationController setGroupsController:](v5, "setGroupsController:", self->_groupsController);
  return v5;
}

- (void)_handleProvisioningError:(id)a3
{
  id v4;

  +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)dismissPresentedVCsWithRequirements:(unint64_t)a3 animated:(BOOL)a4 performAction:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  char isKindOfClass;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  void (**v25)(_QWORD);

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  if ((PKRunningInRemoteContext() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "applicationState"),
        v9,
        (a3 & 1) == 0)
    || !v10)
  {
    if ((a3 & 4) == 0 || self->_paymentService)
    {
      -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        if (!objc_msgSend(v11, "isBeingDismissed")
          || (objc_msgSend(v12, "transitionCoordinator"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isCancelled"),
              v13,
              (v14 & 1) != 0))
        {
          if (!PresentationTrackingCounter)
          {
            v15 = 1;
            goto LABEL_13;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else if (!self->_viewAppeared)
      {
        goto LABEL_28;
      }
      v15 = 0;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0D6BFD8], "viewServiceBundleID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (!v12
        || !v16
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_msgSend(v12, "serviceBundleIdentifier"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", v17),
            v18,
            (a3 & 2) == 0)
        || (v19 & 1) == 0)
      {
        if (v15)
        {
          if (v12
            && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (a3 & 8) != 0)
            && (isKindOfClass & 1) != 0)
          {
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke_2;
            v22[3] = &unk_1E3E61590;
            v23 = v8;
            -[PKPassGroupsViewController _resetWithBackgroundAllowedVCs:animated:completion:](self, "_resetWithBackgroundAllowedVCs:animated:completion:", (a3 >> 4) & 1, v5, v22);
            v21 = v23;
          }
          else
          {
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke;
            v24[3] = &unk_1E3E61590;
            v25 = v8;
            -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, v24);
            v21 = v25;
          }

        }
        else if (v8)
        {
          v8[2](v8);
        }
      }

      goto LABEL_28;
    }
  }
LABEL_29:

}

uint64_t __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_resetWithBackgroundAllowedVCs:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  PKPassGroupsViewController *v9;
  PKPassGroupsViewController *v10;
  PKPassGroupsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  PKPassGroupsViewController *v22;
  id v23;
  void (**v24)(void *, void (**)(_QWORD));
  PKPassGroupsViewController *v25;
  PKPassGroupsViewController *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  void (**v30)(void *, void (**)(_QWORD));
  void (**v31)(_QWORD);
  _QWORD aBlock[4];
  PKPassGroupsViewController *v33;
  id v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v5 = a4;
  v6 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a5;
  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v9 = (PKPassGroupsViewController *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || v9 == self)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      -[PKPassGroupsViewController viewControllers](v11, "viewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[PKPassGroupsViewController viewControllers](v11, "viewControllers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              if (objc_msgSend(v19, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
              {
                v20 = v19;

                v13 = v20;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v16);
        }

      }
      v21 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke;
      aBlock[3] = &unk_1E3E6D388;
      v22 = v11;
      v33 = v22;
      v23 = v13;
      v34 = v23;
      v35 = v5;
      v24 = (void (**)(void *, void (**)(_QWORD)))_Block_copy(aBlock);
      -[PKPassGroupsViewController presentedViewController](v22, "presentedViewController");
      v25 = (PKPassGroupsViewController *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (!v25 || v25 == v22 || (-[PKPassGroupsViewController isBeingDismissed](v25, "isBeingDismissed") & 1) != 0)
      {
        v24[2](v24, v8);
      }
      else
      {
        v29[0] = v21;
        v29[1] = 3221225472;
        v29[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_2;
        v29[3] = &unk_1E3E6C368;
        v30 = v24;
        v31 = v8;
        -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](v22, "dismissViewControllerAnimated:completion:", v5, v29);

      }
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_3;
      v27[3] = &unk_1E3E61590;
      v28 = v8;
      -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, v27);

    }
  }

}

void __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  _BOOL8 v6;
  id v7;
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 48) != 0;
  v7 = *(id *)(a1 + 32);
  v8 = (void (**)(_QWORD))v3;
  v9 = (id)objc_msgSend(v7, "popToViewController:animated:", v4, v6);
  if (v8 && v5)
  {
    objc_msgSend(v7, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = ___PKUINavigationControllerPopToRootController_block_invoke;
      v11[3] = &unk_1E3E67BD0;
      v12 = v8;
      objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v11);

    }
    else
    {
      v8[2](v8);
    }

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

uint64_t __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_appleCardUpsellAlertWithAccount:(id)a3
{
  uint64_t v4;
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
  _QWORD v16[6];

  v4 = objc_msgSend(a3, "feature");
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("ADD_CARD"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__PKPassGroupsViewController__appleCardUpsellAlertWithAccount___block_invoke;
  v16[3] = &unk_1E3E6D3B0;
  v16[4] = self;
  v16[5] = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v11);
  objc_msgSend(v8, "addAction:", v14);

  return v8;
}

void __63__PKPassGroupsViewController__appleCardUpsellAlertWithAccount___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  PKFeatureIdentifierToString();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "presentPaymentSetupInMode:referrerIdentifier:paymentNetwork:transitNetworkIdentifier:allowedFeatureIdentifiers:productIdentifiers:", 4, 0, 0, 0, v2, 0);

}

- (void)_beginSuppressingInstanceFooter
{
  unint64_t instanceFooterSuppressionCounter;

  instanceFooterSuppressionCounter = self->_instanceFooterSuppressionCounter;
  self->_instanceFooterSuppressionCounter = instanceFooterSuppressionCounter + 1;
  if (!instanceFooterSuppressionCounter)
    -[PKPassGroupsViewController _updateFooterSuppressionAnimated:](self, "_updateFooterSuppressionAnimated:", 1);
}

- (void)_endSuppressingInstanceFooterWithContext:(id)a3
{
  id v4;
  unint64_t instanceFooterSuppressionCounter;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  instanceFooterSuppressionCounter = self->_instanceFooterSuppressionCounter;
  if (instanceFooterSuppressionCounter)
  {
    v6 = instanceFooterSuppressionCounter - 1;
    self->_instanceFooterSuppressionCounter = v6;
    if (!v6)
      -[PKPassGroupsViewController _updateFooterSuppressionWithContext:](self, "_updateFooterSuppressionWithContext:", v4);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to end footer suppression when already stopped.", v8, 2u);
    }

  }
}

- (id)_passFromGroupsControllerWithUniqueIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (v4
    && (v5 = -[PKGroupsController groupIndexForPassUniqueID:](self->_groupsController, "groupIndexForPassUniqueID:", v4),
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexForPassUniqueID:", v4);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v7, "passAtIndex:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  PKGroupsController *groupsController;
  id v5;
  void *v6;
  void *v7;
  id v8;
  PKPaymentPassDetailViewController *v9;
  PKGroupsController *v10;
  void *v11;
  void *v12;
  PKPaymentPassDetailViewController *v13;
  void *v14;

  if (a3)
  {
    groupsController = self->_groupsController;
    v5 = a3;
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroupsController groupAtIndex:](groupsController, "groupAtIndex:", -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v9 = [PKPaymentPassDetailViewController alloc];
    v10 = self->_groupsController;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:](v9, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v5, v7, v10, v11, v12, 0, self->_passLibraryDataProvider, v8);

    -[PKPaymentPassDetailViewController setShowDoneButton:](v13, "setShowDoneButton:", 1);
    -[PKPassGroupsViewController groupStackView](self, "groupStackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController setDeleteOverrider:](v13, "setDeleteOverrider:", v14);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  id v4;
  PKBarcodePassDetailViewController *v5;
  _BOOL8 v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = -[PKBarcodePassDetailViewController initWithPass:]([PKBarcodePassDetailViewController alloc], "initWithPass:", v4);

    v6 = (PKRunningInRemoteContext() & 1) != 0
      || -[PKPassGroupStackView isTableModalPresentation](self->_groupStackView, "isTableModalPresentation");
    -[PKBarcodePassDetailViewController setShowDoneButton:](v5, "setShowDoneButton:", v6);
    -[PKPassGroupsViewController groupStackView](self, "groupStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBarcodePassDetailViewController setDeleteOverrider:](v5, "setDeleteOverrider:", v7);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_warnFailForward
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
  NSString *v13;

  PDDeviceSpecificLocalizedStringKeyForKey();
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("FAIL_FORWARD_UPDATE_WALLET_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("FAIL_FORWARD_LEARN_MORE_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, &__block_literal_global_353);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("FAIL_FORWARD_DONE_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v12);
  objc_msgSend(v6, "setPreferredAction:", v12);
  -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

void __46__PKPassGroupsViewController__warnFailForward__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D69F48]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:configuration:completionHandler:", v1, 0, 0);

}

- (void)_prewarmSemanticTileInformation
{
  void *v2;
  uint64_t v3;
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
  -[PKGroupsController passes](self->_groupsController, "passes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        +[PKPassSemanticTileFactory sharedInstance](PKPassSemanticTileFactory, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "prewarmTileContentForPass:context:", v7, 1);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69950]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if ((PKAnalyticsSessionEnabled() & 1) == 0)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69950]);
  }
}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKPassGroupsViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __77__PKPassGroupsViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentAccount");
}

void __74__PKPassGroupsViewController__registerForExpressTransactionNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleExpressNotification");

}

- (void)_handleExpressNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  PKPassPresentationContext *v14;
  PKPassPresentationContext *v15;
  const char *v16;
  _QWORD v17[4];
  PKPassPresentationContext *v18;
  id v19;
  BOOL v20;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: handling outstanding express transaction...", (uint8_t *)buf, 2u);
  }

  -[PKPaymentService outstandingExpressTransactionState](self->_paymentService, "outstandingExpressTransactionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "passUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_23:

      goto LABEL_24;
    }
    if (!-[PKPassGroupStackView presentedPassIsPerformingPayment](self->_groupStackView, "presentedPassIsPerformingPayment"))
    {
      v13 = objc_msgSend(v5, "isIgnorable");
      goto LABEL_11;
    }
    -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      if (!v10)
      {

LABEL_18:
        if (objc_msgSend(v5, "isIgnorable"))
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            v16 = "PKPassGroupsViewController: skipping express notification because a transaction is already underway an"
                  "d the event is for a failure transaction";
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        v13 = 0;
LABEL_11:
        -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
        v3 = objc_claimAutoreleasedReturnValue();
        if (v3)
          -[PKPassGroupsViewController _beginSuppressingInstanceFooter](self, "_beginSuppressingInstanceFooter");
        v14 = objc_alloc_init(PKPassPresentationContext);
        -[PKPassPresentationContext setStandaloneTransactionType:](v14, "setStandaloneTransactionType:", objc_msgSend(v5, "standaloneTransactionType"));
        -[PKPassPresentationContext setPostPayment:](v14, "setPostPayment:", v13 ^ 1);
        -[PKPassPresentationContext setFieldDetect:](v14, "setFieldDetect:", v13);
        objc_initWeak(buf, self);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __56__PKPassGroupsViewController__handleExpressNotification__block_invoke;
        v17[3] = &unk_1E3E6D3F8;
        v20 = v3 != 0;
        objc_copyWeak(&v19, buf);
        v15 = v14;
        v18 = v15;
        -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v6, v15, 1, v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak(buf);

        goto LABEL_22;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v12 & 1) == 0)
        goto LABEL_18;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v16 = "PKPassGroupsViewController: skipping express notification because a transaction for same pass already underway";
LABEL_21:
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)buf, 2u);
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

}

void __56__PKPassGroupsViewController__handleExpressNotification__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if ((a2 & 1) != 0)
      v5 = 0;
    else
      v5 = *(_QWORD *)(a1 + 32);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_endSuppressingInstanceFooterWithContext:", v5);

  }
}

- (void)_handleChildViewControllerRequestingServiceMode:(id)a3
{
  void *v4;
  void *v5;
  PKPassPresentationContext *v6;

  v6 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setPersistentCardEmulation:](v6, "setPersistentCardEmulation:", 1);
  -[PKPassGroupStackView modalGroupFrontmostPass](self->_groupStackView, "modalGroupFrontmostPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](self, "presentPassWithUniqueID:context:animated:completionHandler:", v5, v6, 1, 0);

}

- (void)_localeDidChangeNotification:(id)a3
{
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary", a3);
}

- (void)_regionConfigurationDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPassGroupsViewController__regionConfigurationDidChangeNotification__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __71__PKPassGroupsViewController__regionConfigurationDidChangeNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Region configuration changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateHeaderAndSubheaderViewsIfNecessary");
}

- (void)_handleFooterSupressionChange:(id)a3
{
  -[PKPassGroupsViewController _updateFooterSuppressionAnimated:](self, "_updateFooterSuppressionAnimated:", 1);
}

- (BOOL)_canPerformExternalModalPresentation
{
  return self->_externalModalPresentationAllowed && !self->_inField;
}

- (void)invitationViewController:(id)a3 didFinishWithPass:(id)a4
{
  id v5;

  if (a4)
  {
    objc_msgSend(a4, "uniqueID", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v5, 1, 0);

  }
  else
  {
    -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  }
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with pass %@ and error %@", (uint8_t *)&v13, 0x16u);
  }

  if (v9)
  {
    objc_msgSend(v9, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v12, 1, 0);
  }
  else
  {
    -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled", v6, 2u);
  }

  -[PKPassGroupsViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)paymentSetupDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "provisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisionedPasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", v9, 1, 0);

    v10 = (void *)MEMORY[0x1E0D66A58];
    v11 = *MEMORY[0x1E0D69950];
    v12 = *MEMORY[0x1E0D68F50];
    v15[0] = *MEMORY[0x1E0D68AA0];
    v15[1] = v12;
    v13 = *MEMORY[0x1E0D69728];
    v16[0] = *MEMORY[0x1E0D68C50];
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subject:sendEvent:", v11, v14);

  }
  else
  {
    -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  -[PKPassGroupsViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");

}

- (void)paymentSetupRequestPresentPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](self, "presentPassWithUniqueID:animated:completionHandler:", a3, 1, a4);
}

- (void)discoveryDataSource:(id)a3 didUpdateArticleLayouts:(id)a4
{
  PKDiscoveryGalleryView **p_discoveryGalleryView;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;

  p_discoveryGalleryView = &self->_discoveryGalleryView;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "updateArticleLayouts:", v6);

  }
  else
  {
    v8 = objc_msgSend(v6, "count");

    if (v8)
      -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
  }

}

- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v4;

  objc_msgSend(a3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)applicationMessageViewNeedsSizeUpdate:(id)a3
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);

  if (WeakRetained == v15)
  {
    objc_msgSend(v15, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "width");
    v7 = v6;

    objc_msgSend(v15, "sizeThatFits:", v7, 1.79769313e308);
    v9 = v8;
    v11 = v10;
    objc_msgSend(v15, "bounds");
    if (v9 != v13 || v11 != v12)
    {
      objc_msgSend(v15, "setBounds:");
      objc_msgSend(v15, "layoutIfNeededAnimated:", 1);
      -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
    }
  }

}

- (void)applicationMessageViewNeedsRemoval:(id)a3
{
  PKApplicationMessageView **p_applicationMessageView;
  id v5;
  id WeakRetained;

  p_applicationMessageView = &self->_applicationMessageView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_applicationMessageView);

  if (WeakRetained == v5)
    -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary");
}

- (void)applicationMessageView:(id)a3 requestsContentDismissal:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  PKPaymentService *paymentService;
  void *v9;
  id v10;

  v10 = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D66AD8], "messageKeysForNode:localKeys:", a4, &v10);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7)
    {
      if (v7 == 1)
      {
        paymentService = self->_paymentService;
        objc_msgSend(v6, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentService removeApplicationMessageWithKey:](paymentService, "removeApplicationMessageWithKey:", v9);

      }
      else
      {
        -[PKPaymentService removeApplicationMessagesWithKeys:completion:](self->_paymentService, "removeApplicationMessagesWithKeys:completion:", v6, 0);
      }
    }
  }

}

- (void)applicationMessageView:(id)a3 tappedApplicationMessageWithKey:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "source"))
    -[PKPaymentService tappedApplicationMessageWithKey:](self->_paymentService, "tappedApplicationMessageWithKey:", v5);

}

- (void)setNeedsUpdateForGroupStackViewSectionSubheaderView:(id)a3
{
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary", a3);
}

- (void)groupStackViewSectionSubheaderView:(id)a3 transitionToViewController:(id)a4
{
  -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)setNeedsUpdateForGroupStackViewSectionHeaderView:(id)a3
{
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self->_groupStackView, "updateHeaderAndSubheaderViewsIfNecessary", a3);
}

- (void)presentPaymentSetupForHeaderView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69940];
  v6 = *MEMORY[0x1E0D68858];
  v11 = *MEMORY[0x1E0D68AA0];
  v12 = v6;
  v7 = *MEMORY[0x1E0D69328];
  v13 = *MEMORY[0x1E0D68B18];
  v14 = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", &v13, &v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v10);

  -[PKPassGroupsViewController startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:](self, "startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:", v9, 0, 0, 0, 0, 0, 0, v11, v12, v13, v14, v15);
}

- (id)passForSectionHeaderView:(id)a3
{
  void *v4;
  void *v5;

  if (-[PKGroupsController groupCount](self->_groupsController, "groupCount", a3) == 1
    && -[PKGroupsController indexOfSeparationGroup](self->_groupsController, "indexOfSeparationGroup") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passAtIndex:", objc_msgSend(v4, "frontmostPassIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)presentPassDetailsForHeaderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passAtIndex:", objc_msgSend(v7, "frontmostPassIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupsViewController presentPassDetailsWithUniqueID:animated:completionHandler:](self, "presentPassDetailsWithUniqueID:animated:completionHandler:", v6, 1, 0);

  }
}

- (void)presentInvitationsForHeaderView:(id)a3
{
  PKNavigationController *v4;
  PKInboxViewController *v5;

  v5 = -[PKInboxViewController initWithInboxDataSource:contactAvatarManager:context:]([PKInboxViewController alloc], "initWithInboxDataSource:contactAvatarManager:context:", self->_inboxDataSource, self->_avatarManager, 0);
  v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
  -[PKPassGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (BOOL)inboxVisibleForSectionHeaderView:(id)a3
{
  return -[PKInboxDataSource inboxVisible](self->_inboxDataSource, "inboxVisible", a3);
}

- (void)presentOrderManagementForHeaderView:(id)a3
{
  -[PKPassGroupsViewController presentOrderManagementAnimated:completion:](self, "presentOrderManagementAnimated:completion:", 1, &__block_literal_global_362);
}

void __66__PKPassGroupsViewController_presentOrderManagementForHeaderView___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D66A58];
  v1 = *MEMORY[0x1E0D69908];
  v2 = *MEMORY[0x1E0D68B18];
  v3 = *MEMORY[0x1E0D693B0];
  v6[0] = *MEMORY[0x1E0D68AA0];
  v6[1] = v3;
  v4 = *MEMORY[0x1E0D693E0];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E0D68D98];
  v7[2] = *MEMORY[0x1E0D68DA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "subject:sendEvent:", v1, v5);

}

- (int64_t)style
{
  return self->_style;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  self->_suppressedContent = a3;
}

- (void)setPassesAreOutdated:(BOOL)a3
{
  self->_passesAreOutdated = a3;
}

- (BOOL)handleFieldDetection
{
  return self->_handleFieldDetection;
}

- (void)setHandleFieldDetection:(BOOL)a3
{
  self->_handleFieldDetection = a3;
}

- (BOOL)isWelcomeStateEnabled
{
  return self->_welcomeStateEnabled;
}

- (BOOL)isExternalModalPresentationAllowed
{
  return self->_externalModalPresentationAllowed;
}

- (BOOL)assertExpressAvailable
{
  return self->_assertExpressAvailable;
}

- (void)setAssertExpressAvailable:(BOOL)a3
{
  self->_assertExpressAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_discoveryDataSource, 0);
  objc_storeStrong((id *)&self->_accountServiceAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_inboxDataSource, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_passUniqueIDsToExcludeFromFiltering, 0);
  objc_storeStrong((id *)&self->_blocksQueuedForUpdateCompletion, 0);
  objc_storeStrong((id *)&self->_passViewedNotificationTimer, 0);
  objc_storeStrong((id *)&self->_allowDimmingTimer, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_destroyWeak((id *)&self->_applicationMessageView);
  objc_destroyWeak((id *)&self->_discoveryGalleryView);
  objc_destroyWeak((id *)&self->_barcodeHeaderView);
  objc_destroyWeak((id *)&self->_paymentHeaderView);
  objc_storeStrong((id *)&self->_footerBackground, 0);
  objc_storeStrong((id *)&self->_headerBackground, 0);
  objc_storeStrong((id *)&self->_groupStackView, 0);
  objc_storeStrong((id *)&self->_metricController, 0);
}

@end
