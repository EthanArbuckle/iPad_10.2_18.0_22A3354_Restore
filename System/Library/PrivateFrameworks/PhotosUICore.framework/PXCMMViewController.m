@implementation PXCMMViewController

- (PXCMMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 125, CFSTR("%s is not available as initializer"), "-[PXCMMViewController initWithNibName:bundle:]");

  abort();
}

- (PXCMMViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 129, CFSTR("%s is not available as initializer"), "-[PXCMMViewController initWithCoder:]");

  abort();
}

- (PXCMMViewController)initWithSession:(id)a3
{
  id v6;
  PXCMMViewController *v7;
  PXCMMViewController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  uint64_t v13;
  PXUpdater *updater;
  PXCMMAssetsViewController *v15;
  PXCMMAssetsViewController *assetsViewController;
  void *v18;
  objc_super v19;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PXCMMViewController;
  v7 = -[PXCMMViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    objc_msgSend(v6, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:context:", v8, PXViewModelObservationContext_103785);

    objc_msgSend(v6, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerChangeObserver:context:", v8, PXDataSourceManagerObservationContext_103788);

    objc_msgSend(v6, "momentShareStatusPresentationWithPresentationStyle:", 2);
    v11 = objc_claimAutoreleasedReturnValue();
    momentShareStatusPresentation = v8->_momentShareStatusPresentation;
    v8->_momentShareStatusPresentation = (PXMomentShareStatusPresentation *)v11;

    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v8->_momentShareStatusPresentation, "registerChangeObserver:context:", v8, PXMomentShareStatusPresentationObservationContext_103786);
    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v8);
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateComponentsViewControllerLayout);
    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateActionProgress);
    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateTitle);
    -[PXUpdater setNeedsUpdateSelector:](v8->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
    v15 = -[PXCMMAssetsViewController initWithSession:]([PXCMMAssetsViewController alloc], "initWithSession:", v6);
    assetsViewController = v8->_assetsViewController;
    v8->_assetsViewController = v15;

    -[PXCMMAssetsViewController setDelegate:](v8->_assetsViewController, "setDelegate:", v8);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("finished"), PXProgressFinishedObservationContext_103769);
  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext_103771);
  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), PXProgressCancelledObservationContext_103770);
  v3.receiver = self;
  v3.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController dealloc](&v3, sel_dealloc);
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3)
    -[PXCMMViewController _performCancel](self, "_performCancel");
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  PXOneUpPresentation *v6;
  PXOneUpPresentation *oneUpPresentation;
  void *v8;
  PXCMMSpecManager *v9;
  PXCMMSpecManager *specManager;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  BOOL v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[UIViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  -[PXCMMViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sourceType");

  -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
  -[UIViewController px_barAppearance](self, "px_barAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __34__PXCMMViewController_viewDidLoad__block_invoke;
  v15[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
  v16 = v4 == 0;
  objc_msgSend(v5, "performChangesWithAnimationOptions:changes:", 0, v15);

  -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v6 = (PXOneUpPresentation *)objc_claimAutoreleasedReturnValue();
  oneUpPresentation = self->_oneUpPresentation;
  self->_oneUpPresentation = v6;

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v8, -[PXCMMSession activityType](self->_session, "activityType"));
  specManager = self->_specManager;
  self->_specManager = v9;

  -[PXCMMSpecManager registerChangeObserver:context:](self->_specManager, "registerChangeObserver:context:", self, PXSpecManagerObservationContext_103784);
  -[PXFeatureSpecManager spec](self->_specManager, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reviewBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[PXCMMViewController updater](self, "updater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsUpdateOf:", sel__updateComponentsViewControllerLayout);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PXCMMViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

  -[PXCMMViewController updater](self, "updater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateOf:", sel__updateComponentsViewControllerLayout);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PXCMMViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXCMMViewController _setupNavigationItem](self, "_setupNavigationItem");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  double v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[PXCMMViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "ppt_presentComposeRecipientView"))
    goto LABEL_4;
  v5 = -[PXCMMViewController _canPresentComposeRecipientViewController](self, "_canPresentComposeRecipientViewController");

  if (v5)
  {
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ppt_delay");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PXCMMViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
LABEL_4:

  }
  -[PXCMMViewController _startPreloadingTasksIfNeeded](self, "_startPreloadingTasksIfNeeded");
  -[PXCMMViewController _activateNotificationSuppressionIfNecessary](self, "_activateNotificationSuppressionIfNecessary");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PXCMMViewController _deactivateNotificationSuppressionIfNecessary](self, "_deactivateNotificationSuppressionIfNecessary");
}

- (void)_activateNotificationSuppressionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PXCMMViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sourceType") != 1)
  {
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationSuppressionContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      PLSharingGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Adding CMM suppression contexts %@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNotificationSuppressionContexts:", v5);

    }
  }

}

- (void)_deactivateNotificationSuppressionIfNecessary
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSuppressionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Clearing CMM suppression contexts %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*v2, "notificationSuppressionContextManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotificationSuppressionContexts:", 0);

  }
}

- (void)_startPreloadingTasksIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_hasStartedPreloadingTasks)
  {
    self->_hasStartedPreloadingTasks = 1;
    -[PXCMMViewController session](self, "session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peopleSuggestionsDataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startLoading");

    -[PXCMMViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "startPreloadingTasksForCompleteMyMomentViewController:", self);

  }
}

- (void)setActionProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_actionProgress;
  NSProgress *actionProgress;
  void *v8;
  NSProgress *v9;

  v5 = (NSProgress *)a3;
  p_actionProgress = &self->_actionProgress;
  actionProgress = self->_actionProgress;
  if (actionProgress != v5)
  {
    v9 = v5;
    -[NSProgress removeObserver:forKeyPath:context:](actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("finished"), PXProgressFinishedObservationContext_103769);
    -[NSProgress removeObserver:forKeyPath:context:](*p_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext_103771);
    -[NSProgress removeObserver:forKeyPath:context:](*p_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), PXProgressCancelledObservationContext_103770);
    objc_storeStrong((id *)&self->_actionProgress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("finished"), 1, PXProgressFinishedObservationContext_103769);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, PXProgressFractionCompletedObservationContext_103771);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("cancelled"), 1, PXProgressCancelledObservationContext_103770);
    -[PXCMMViewController updater](self, "updater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateOf:", sel__updateActionProgress);

    v5 = v9;
  }

}

- (void)updateViewConstraints
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  -[PXCMMViewController standaloneNavigationBar](self, "standaloneNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXCMMViewController layoutConstraints](self, "layoutConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3718];
      -[PXCMMViewController layoutConstraints](self, "layoutConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deactivateConstraints:", v6);

    }
    -[PXCMMViewController standaloneNavigationBar](self, "standaloneNavigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController px_safeAreaInsets](self, "px_safeAreaInsets");
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    objc_msgSend(v7, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(v7, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
    -[PXCMMViewController setLayoutConstraints:](self, "setLayoutConstraints:", v15);

  }
  v21.receiver = self;
  v21.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController updateViewConstraints](&v21, sel_updateViewConstraints);
}

- (void)_setupNavigationItem
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
  UIBarButtonItem *v12;
  UIBarButtonItem *actionMenuButtonItem;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[PXCMMViewController didSetUpNavigationItem](self, "didSetUpNavigationItem"))
  {
    -[PXCMMViewController setDidSetUpNavigationItem:](self, "setDidSetUpNavigationItem:", 1);
    -[PXCMMViewController effectiveNavigationItem](self, "effectiveNavigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);
    objc_msgSend(v3, "px_setBackButtonDisplayMode:", 2);
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackButtonTitle:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXCMMViewController _shouldShowActionMenu](self, "_shouldShowActionMenu"))
    {
      -[PXCMMViewController _actionMenu](self, "_actionMenu");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageWithSymbolConfiguration:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:menu:", v11, v8);
        actionMenuButtonItem = self->_actionMenuButtonItem;
        self->_actionMenuButtonItem = v12;

        objc_msgSend(v7, "addObject:", self->_actionMenuButtonItem);
      }
      else
      {
        -[PXCMMViewController session](self, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;

        objc_msgSend(v15, "momentShare");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PLSharingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v19 = 138412290;
          v20 = v16;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Could not create a menu of actions for CMM: %@. Skipping the ••• action menu", (uint8_t *)&v19, 0xCu);
        }

      }
    }
    if (-[PXCMMViewController _shouldShowDismissButton](self, "_shouldShowDismissButton"))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel_closeButtonTapped_);
      objc_msgSend(v7, "insertObject:atIndex:", v18, 0);

    }
    objc_msgSend(v3, "setRightBarButtonItems:", v7);
    -[PXCMMViewController _updateTitle](self, "_updateTitle");

  }
}

- (id)effectiveNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXCMMViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXCMMViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXCMMViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)closeButtonTapped:(id)a3
{
  -[PXCMMViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_shouldShowActionMenu
{
  void *v2;
  char v3;

  -[PXCMMViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hideActionMenu") ^ 1;

  return v3;
}

- (BOOL)_shouldShowDismissButton
{
  void *v2;
  BOOL v3;

  -[PXCMMViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_performCancel
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXCMMViewController actionProgress](self, "actionProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isCancellable") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionProgress.isCancellable"));

    }
    objc_msgSend(v7, "cancel");
    -[PXCMMViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", 0);
    -[PXCMMViewController setProgressButton:](self, "setProgressButton:", 0);
  }
  -[PXCMMViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didCancelCompleteMyMomentViewController:", self);

}

- (id)_menuController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  PXPhotoDetailsActionMenuController *v11;
  void *v12;
  void *v13;

  -[PXCMMViewController activeActionMenuController](self, "activeActionMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = objc_alloc((Class)off_1E50B4A40);
      objc_msgSend(v4, "dataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v9, "initWithDataSourceManager:", v10);

    }
    v11 = -[PXPhotoDetailsActionMenuController initWithSelectionManager:displayTitleInfo:blockActionManager:]([PXPhotoDetailsActionMenuController alloc], "initWithSelectionManager:displayTitleInfo:blockActionManager:", v8, 0, 0);
    objc_msgSend(v5, "disabledActionTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionMenuController setDisabledActionTypes:](v11, "setDisabledActionTypes:", v12);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PXAssetCollectionActionTypeMomentShare"), CFSTR("PXAssetCollectionActionTypeFavorite"), CFSTR("PXAssetCollectionActionTypeDeleteMemory"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionMenuController setExcludedActionTypes:](v11, "setExcludedActionTypes:", v13);
    -[PXPhotoDetailsActionMenuController setDelegate:](v11, "setDelegate:", self);
    -[PXCMMViewController setActiveActionMenuController:](self, "setActiveActionMenuController:", v11);

  }
  return -[PXCMMViewController activeActionMenuController](self, "activeActionMenuController");
}

- (id)_actionMenu
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PXCMMViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activityType");
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v9 = 0;
    v19 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = v4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 439, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("session"), v23);
LABEL_18:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 439, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("session"), v23, v25);

    goto LABEL_18;
  }
LABEL_4:
  objc_msgSend(v7, "momentShare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "pl_redactedShareURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v28 = v6;
      v29 = 2114;
      v30 = v12;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "CMM activity type is %ld, which means we are sharing an existing CMM link: %{public}@", buf, 0x16u);

    }
    -[PXCMMViewController _menuController](self, "_menuController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCMMViewController _shareCMMMenuItemForMomentShareURL:title:](self, "_shareCMMMenuItemForMomentShareURL:title:", v9, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v26 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Preparing a UIActivityViewController for sharing the CMM link", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v28 = v6;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "CMM activity type is %ld, which means we should have an existing CMM link, but it is nil.", buf, 0xCu);
    }
    v9 = 0;
    v19 = 0;
  }

LABEL_15:
  return v19;
}

- (id)_shareCMMMenuItemForMomentShareURL:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  PXCMMViewController *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXCompleteMyMomentShareActionMenuTitle"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PXCMMViewController__shareCMMMenuItemForMomentShareURL_title___block_invoke;
  v15[3] = &unk_1E5141778;
  v16 = v6;
  v17 = v7;
  v18 = self;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v8, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_updateComponentViewController:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (v9)
  {
    v14 = v9;
    objc_msgSend(v9, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[PXCMMViewController addChildViewController:](self, "addChildViewController:", v14);
      -[PXCMMViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

      objc_msgSend(v14, "didMoveToParentViewController:", self);
    }
    objc_msgSend(v14, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", x, y, width, height);

    v9 = v14;
  }

}

- (void)_setNeedsUpdate
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 516, CFSTR("%s must be called on the main thread"), "-[PXCMMViewController _setNeedsUpdate]");

  }
  -[PXCMMViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_updateComponentsViewControllerLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXCMMViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[PXCMMViewController standaloneNavigationBar](self, "standaloneNavigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  -[PXCMMViewController standaloneNavigationBar](self, "standaloneNavigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  -[PXCMMViewController assetsViewController](self, "assetsViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  PXRectRoundToPixel();
  -[PXCMMViewController _updateComponentViewController:frame:](self, "_updateComponentViewController:frame:", v7);

}

- (id)_localizedSelectionTitle
{
  void *v2;
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

  -[PXCMMViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v5, "selectedIndexPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "count") >= 1)
  {
    objc_msgSend(v8, "assetsAtIndexPaths:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSelectionMessageForAssets(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarSelectItemsTitle"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXCMMViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isSelecting"))
  {
    -[PXCMMViewController _localizedSelectionTitle](self, "_localizedSelectionTitle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PXCMMViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)_updateActionProgress
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[PXCMMViewController actionProgress](self, "actionProgress");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[PXCMMViewController effectiveNavigationItem](self, "effectiveNavigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isFinished") & 1) != 0 || (objc_msgSend(v17, "isCancelled") & 1) != 0)
    {
      -[PXCMMViewController activityIndicatorView](self, "activityIndicatorView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopAnimating");

      objc_msgSend(v3, "setRightBarButtonItem:", 0);
      v5 = 0;
    }
    else
    {
      -[PXCMMViewController activityIndicatorView](self, "activityIndicatorView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        -[PXCMMViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v10);

      }
      -[PXCMMViewController progressButton](self, "progressButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
        -[PXCMMViewController activityIndicatorView](self, "activityIndicatorView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithCustomView:", v13);
        -[PXCMMViewController setProgressButton:](self, "setProgressButton:", v14);

      }
      -[PXCMMViewController activityIndicatorView](self, "activityIndicatorView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startAnimating");

      -[PXCMMViewController progressButton](self, "progressButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRightBarButtonItem:", v16);

      v5 = 1;
    }
    -[PXCMMAssetsViewController setActionInProgress:](self->_assetsViewController, "setActionInProgress:", v5);

  }
  else
  {
    -[PXCMMViewController activityIndicatorView](self, "activityIndicatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAnimating");

    -[PXCMMViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "activityType");

    if (v8 == 2)
      -[PXCMMAssetsViewController setActionInProgress:](self->_assetsViewController, "setActionInProgress:", (unint64_t)(-[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentation, "state") - 3) < 2);
  }

}

- (void)_updateStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXCMMViewController specManager](self, "specManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reviewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (BOOL)_canPresentComposeRecipientViewController
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  -[PXCMMViewController session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityType");
  if (objc_msgSend(v2, "sourceType"))
    v4 = 0;
  else
    v4 = v3 == 1;
  v5 = v4;

  return v5;
}

- (void)_presentComposeRecipientViewController
{
  PXCMMComposeRecipientViewController *v3;
  void *v4;
  PXCMMComposeRecipientViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = [PXCMMComposeRecipientViewController alloc];
  -[PXCMMViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXCMMComposeRecipientViewController initWithSession:](v3, "initWithSession:", v4);

  -[PXCMMComposeRecipientViewController setActionDelegate:](v5, "setActionDelegate:", self);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleComposeRecipientCancelButton_);
  objc_msgSend(v6, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v7);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[PXCMMViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  v11 = (void *)MEMORY[0x1E0D09910];
  v15 = *MEMORY[0x1E0D09830];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.cmmSuggestionComposeFlowOpened"), v14);

}

- (void)_completePeopleSuggestionsLoading
{
  void *v3;
  id v4;

  -[PXCMMViewController setLoadingPeopleSuggestions:](self, "setLoadingPeopleSuggestions:", 0);
  -[PXCMMViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleSuggestionsDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unregisterChangeObserver:context:", self, PXPeopleSuggestionManagerObservationContext_103787);
  -[PXCMMViewController _presentComposeRecipientViewController](self, "_presentComposeRecipientViewController");

}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PXCMMViewController_setLoadingPeopleSuggestions___block_invoke;
    v6[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
    v7 = a3;
    objc_msgSend(v5, "performChanges:", v6);

  }
}

- (void)_handleActionButton
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[PXCMMViewController _canPresentComposeRecipientViewController](self, "_canPresentComposeRecipientViewController"))
  {
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peopleSuggestionsDataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isLoading"))
    {
      objc_msgSend(v5, "boostLoading");
      objc_msgSend(v5, "registerChangeObserver:context:", self, PXPeopleSuggestionManagerObservationContext_103787);
      -[PXCMMViewController setLoadingPeopleSuggestions:](self, "setLoadingPeopleSuggestions:", 1);
      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "peopleSuggestionsTimeout");
      v8 = v7;

      PLSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v21 = v8;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "PXCMMViewController: People Suggestions Loading in Progress(Timeout=%f)", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PXCMMViewController__handleActionButton__block_invoke;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v19, (id *)buf);
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[PXCMMViewController _presentComposeRecipientViewController](self, "_presentComposeRecipientViewController");
    }

  }
  else
  {
    -[PXCMMViewController actionDelegate](self, "actionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 673, CFSTR("actionDelegate in %@ is nil, save action will not work."), v16);

    }
    -[PXCMMViewController actionDelegate](self, "actionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completeMyMomentViewController:performActionForSession:", self, v13);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[PXCMMViewController setActionProgress:](self, "setActionProgress:", v17);
  }
}

- (void)_handleComposeRecipientCancelButton:(id)a3
{
  -[PXCMMViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15[5];
  id v16[5];
  id v17[5];
  id v18;
  id location;

  v6 = a4;
  v9 = a3;
  objc_initWeak(&location, self);
  if ((void *)PXSpecManagerObservationContext_103784 == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_15;
    v17[1] = (id)MEMORY[0x1E0C809B0];
    v17[2] = (id)3221225472;
    v17[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke;
    v17[4] = &unk_1E5148D30;
    v11 = &v18;
    objc_copyWeak(&v18, &location);
    px_dispatch_on_main_queue();
LABEL_14:
    objc_destroyWeak(v11);
    goto LABEL_15;
  }
  if ((void *)PXViewModelObservationContext_103785 == a5)
  {
    if ((*(_QWORD *)&v6 & 0x10600) == 0)
      goto LABEL_15;
    v16[1] = (id)MEMORY[0x1E0C809B0];
    v16[2] = (id)3221225472;
    v16[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke_2;
    v16[4] = &unk_1E5148D30;
    v11 = v17;
    objc_copyWeak(v17, &location);
    px_dispatch_on_main_queue();
    goto LABEL_14;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_103786 == a5)
  {
    if ((v6 & 0x3000) == 0)
      goto LABEL_15;
    v15[1] = (id)MEMORY[0x1E0C809B0];
    v15[2] = (id)3221225472;
    v15[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke_3;
    v15[4] = &unk_1E5148D30;
    v11 = v16;
    objc_copyWeak(v16, &location);
    px_dispatch_on_main_queue();
    goto LABEL_14;
  }
  if ((void *)PXPeopleSuggestionManagerObservationContext_103787 == a5)
  {
    v11 = v15;
    objc_copyWeak(v15, &location);
    px_dispatch_on_main_queue();
    goto LABEL_14;
  }
  if ((void *)PXDataSourceManagerObservationContext_103788 == a5)
  {
    -[PXCMMViewController session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "numberOfSections") <= 0)
      px_dispatch_on_main_queue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMViewController.m"), 725, CFSTR("unknown observation context"));

  }
LABEL_15:
  objc_destroyWeak(&location);

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BOOL)shouldShowAddMoreButtonForAssetsViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  -[PXCMMViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[PXCMMViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activityType");

  return v5 & (v7 == 1);
}

- (void)didTapAddMoreButtonForAssetsViewController:(id)a3
{
  void *v4;
  id v5;

  -[PXCMMViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXCMMViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completeMyMomentViewController:showPhotoPickerForSession:", self, v4);

  }
}

- (void)didPerformDeletionActionForAssetsViewController:(id)a3
{
  id v4;

  -[PXCMMViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didCancelCompleteMyMomentViewController:", self);

}

- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXCMMViewController actionDelegate](self, "actionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeMyMomentViewController:performActionForSession:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_presentViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXCMMViewController actionMenuButtonItem](self, "actionMenuButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setBarButtonItem:", v5);
    objc_msgSend(v4, "setDelegate:", self);

  }
  -[PXCMMViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_dismissViewControllerWithCompletionHandler:(id)a3
{
  -[PXCMMViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a3);
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5
{
  -[PXCMMViewController _presentViewController:](self, "_presentViewController:", a5, a4);
  return 1;
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6
{
  -[PXCMMViewController _dismissViewControllerWithCompletionHandler:](self, "_dismissViewControllerWithCompletionHandler:", a6, a4, a5);
  return 1;
}

- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  if (a5 == 20)
  {
    v18 = v5;
    v19 = v6;
    objc_msgSend(a4, "actionType", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeTrashMomentShare")))
    {
      -[PXCMMViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "didCancelCompleteMyMomentViewController:", self);

    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeCreateMemory")))
    {
      -[PXCMMViewController session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v11, "disabledActionTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addObject:", CFSTR("PXAssetCollectionActionTypeCreateMemory"));
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__PXCMMViewController_actionMenu_actionPerformer_didChangeState___block_invoke;
      v16[3] = &unk_1E5140490;
      v17 = v14;
      v15 = v14;
      objc_msgSend(v11, "performChanges:", v16);

    }
  }
}

- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[PXCMMViewController moviePresenter](self, "moviePresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v7)
  {
    +[PXMoviePresenter moviePresenterWithPresentingViewController:](PXMoviePresenter, "moviePresenterWithPresentingViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMViewController setMoviePresenter:](self, "setMoviePresenter:", v7);
  }
  objc_msgSend(v7, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v8, 0, 1);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didPlayMovieForAssetCollection:", v8);

  v10 = (void *)MEMORY[0x1E0D09910];
  v11 = *MEMORY[0x1E0D09818];
  v17[0] = v8;
  v12 = *MEMORY[0x1E0D09830];
  v16[0] = v11;
  v16[1] = v12;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionMoviePlayed"), v15);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id *v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20[5];
  id v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  if ((void *)PXProgressFinishedObservationContext_103769 == a6
    || PXProgressCancelledObservationContext_103770 == (_QWORD)a6)
  {
    v20[1] = (id)MEMORY[0x1E0C809B0];
    v20[2] = (id)3221225472;
    v20[3] = __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20[4] = &unk_1E5148D30;
    v14 = &v21;
    objc_copyWeak(&v21, &location);
    px_dispatch_on_main_queue();
LABEL_10:
    objc_destroyWeak(v14);
    goto LABEL_11;
  }
  if ((void *)PXProgressFractionCompletedObservationContext_103771 == a6)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v19 = &unk_1E5148D30;
    v14 = v20;
    objc_copyWeak(v20, &location);
    px_dispatch_on_main_queue();
    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_11:
  objc_destroyWeak(&location);

}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  -[PXCMMViewController _presentViewController:](self, "_presentViewController:", a4);
  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  -[PXCMMViewController _dismissViewControllerWithCompletionHandler:](self, "_dismissViewControllerWithCompletionHandler:", a5, a4);
  return 1;
}

- (void)ppt_setSelecting:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  -[PXCMMViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXCMMViewController_ppt_setSelecting___block_invoke;
  v6[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
  v7 = a3;
  objc_msgSend(v5, "performChanges:", v6);

}

- (PXCMMSession)session
{
  return self->_session;
}

- (PXCMMViewControllerDelegate)delegate
{
  return (PXCMMViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCMMActionControllerDelegate)actionDelegate
{
  return (PXCMMActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (PXCMMSpecManager)specManager
{
  return self->_specManager;
}

- (UINavigationBar)standaloneNavigationBar
{
  return self->_standaloneNavigationBar;
}

- (void)setStandaloneNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_standaloneNavigationBar, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (PXCMMAssetsViewController)assetsViewController
{
  return self->_assetsViewController;
}

- (BOOL)showTitleInNavigationBar
{
  return self->_showTitleInNavigationBar;
}

- (void)setShowTitleInNavigationBar:(BOOL)a3
{
  self->_showTitleInNavigationBar = a3;
}

- (BOOL)didSetUpNavigationItem
{
  return self->_didSetUpNavigationItem;
}

- (void)setDidSetUpNavigationItem:(BOOL)a3
{
  self->_didSetUpNavigationItem = a3;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UIBarButtonItem)progressButton
{
  return self->_progressButton;
}

- (void)setProgressButton:(id)a3
{
  objc_storeStrong((id *)&self->_progressButton, a3);
}

- (UIBarButtonItem)actionMenuButtonItem
{
  return self->_actionMenuButtonItem;
}

- (void)setActionMenuButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuButtonItem, a3);
}

- (PXPhotoDetailsActionMenuController)activeActionMenuController
{
  return self->_activeActionMenuController;
}

- (void)setActiveActionMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_activeActionMenuController, a3);
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setMoviePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_moviePresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_activeActionMenuController, 0);
  objc_storeStrong((id *)&self->_actionMenuButtonItem, 0);
  objc_storeStrong((id *)&self->_progressButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetsViewController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_standaloneNavigationBar, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

uint64_t __40__PXCMMViewController_ppt_setSelecting___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", *(unsigned __int8 *)(a1 + 32));
}

void __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateActionProgress);

}

void __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateActionProgress);

}

uint64_t __65__PXCMMViewController_actionMenu_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisabledActionTypes:", *(_QWORD *)(a1 + 32));
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStyle");

}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateTitle);

}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateActionProgress);

}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleSuggestionsDataSourceManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfItemsInSection:", 0) >= 1)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "_completePeopleSuggestionsLoading");

  }
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didCancelCompleteMyMomentViewController:", *(_QWORD *)(a1 + 32));

}

void __42__PXCMMViewController__handleActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completePeopleSuggestionsLoading");

}

uint64_t __51__PXCMMViewController_setLoadingPeopleSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLoadingPeopleSuggestions:", *(unsigned __int8 *)(a1 + 32));
}

void __64__PXCMMViewController__shareCMMMenuItemForMomentShareURL_title___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D96D28];
  v4 = a2;
  v5 = [v3 alloc];
  v20[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  objc_msgSend(v4, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBarButtonItem:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0CC1130]);
  v11 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v11, "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v11, "setOriginalURL:", *(_QWORD *)(a1 + 32));
  PXLocalizedStringFromTable(CFSTR("PXCMMSharingHeaderSubtitleCloudLink"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v12);
  objc_msgSend(v10, "setStatus:", v13);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("link.icloud"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithSymbolConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v16);
  objc_msgSend(v11, "setSpecialization:", v10);
  v19 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlternateImages:", v18);

  objc_msgSend(v7, "setPhotosHeaderMetadata:", v11);
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v7, 1, 0);

}

uint64_t __37__PXCMMViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActionButton");
}

void __34__PXCMMViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", 1);
  objc_msgSend(v3, "setPrefersToolbarVisible:", 0);
  objc_msgSend(v3, "setPrefersTabBarVisible:", *(unsigned __int8 *)(a1 + 32));

}

@end
