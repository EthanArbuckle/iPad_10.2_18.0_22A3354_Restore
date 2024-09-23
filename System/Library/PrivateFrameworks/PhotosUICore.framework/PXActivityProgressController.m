@implementation PXActivityProgressController

- (PXActivityProgressController)init
{
  PXActivityProgressController *v2;
  PXActivityProgressViewController *v3;
  PXActivityProgressViewController *progressViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXActivityProgressController;
  v2 = -[PXActivityProgressController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXActivityProgressViewController);
    progressViewController = v2->_progressViewController;
    v2->_progressViewController = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PXActivityProgressController setProgress:](self, "setProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXActivityProgressController;
  -[PXActivityProgressController dealloc](&v3, sel_dealloc);
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = v5;
    -[NSProgress removeObserver:forKeyPath:context:](progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXActivityProgressControllerProgressObserverContext);
    -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("localizedDescription"), PXActivityProgressControllerProgressObserverContext);
    -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("localizedAdditionalDescription"), PXActivityProgressControllerProgressObserverContext);
    objc_storeStrong((id *)&self->_progress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, PXActivityProgressControllerProgressObserverContext);
    -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("localizedDescription"), 4, PXActivityProgressControllerProgressObserverContext);
    -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("localizedAdditionalDescription"), 4, PXActivityProgressControllerProgressObserverContext);
    v5 = v7;
  }

}

- (void)_updateFractionCompletedFromProgress
{
  id v3;

  -[PXActivityProgressController progress](self, "progress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  -[PXActivityProgressController setFractionCompleted:](self, "setFractionCompleted:");

}

- (void)setFractionCompleted:(double)a3
{
  BOOL v5;

  -[PXActivityProgressViewController setFractionCompleted:](self->_progressViewController, "setFractionCompleted:");
  if (-[PXActivityProgressController shouldAutoDisplay](self, "shouldAutoDisplay"))
  {
    v5 = a3 > 0.0 && a3 < 1.0;
    if (v5 && !-[PXActivityProgressController isCancelled](self, "isCancelled"))
      -[PXActivityProgressController showAnimated:allowDelay:](self, "showAnimated:allowDelay:", 1, 1);
    else
      -[PXActivityProgressController hideAnimated:allowDelay:](self, "hideAnimated:allowDelay:", 1, 1);
  }
}

- (BOOL)showCheckmarkOnCompletion
{
  return -[PXActivityProgressViewController showCheckmarkOnCompletion](self->_progressViewController, "showCheckmarkOnCompletion");
}

- (void)setShowCheckmarkOnCompletion:(BOOL)a3
{
  -[PXActivityProgressViewController setShowCheckmarkOnCompletion:](self->_progressViewController, "setShowCheckmarkOnCompletion:", a3);
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_title;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_title, a3);
      -[PXActivityProgressController _updatePrimaryText](self, "_updatePrimaryText");
    }
  }

}

- (void)setMessage:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_message;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_message, a3);
      -[PXActivityProgressController _updateSecondaryText](self, "_updateSecondaryText");
    }
  }

}

- (BOOL)isCancelled
{
  void *v2;
  BOOL v3;

  -[PXActivityProgressController cancellationHandler](self, "cancellationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setShouldUseProgressText:(BOOL)a3
{
  if (self->_shouldUseProgressText != a3)
  {
    self->_shouldUseProgressText = a3;
    -[PXActivityProgressController _updatePrimaryText](self, "_updatePrimaryText");
    -[PXActivityProgressController _updateSecondaryText](self, "_updateSecondaryText");
  }
}

- (void)_updatePrimaryText
{
  void *v3;
  id v4;

  if (-[PXActivityProgressController shouldUseProgressText](self, "shouldUseProgressText"))
  {
    -[PXActivityProgressController progress](self, "progress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivityProgressViewController setPrimaryText:](self->_progressViewController, "setPrimaryText:", v3);

  }
  else
  {
    -[PXActivityProgressController title](self, "title");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXActivityProgressViewController setPrimaryText:](self->_progressViewController, "setPrimaryText:");
  }

}

- (void)_updateSecondaryText
{
  void *v3;
  id v4;

  if (-[PXActivityProgressController shouldUseProgressText](self, "shouldUseProgressText"))
  {
    -[PXActivityProgressController progress](self, "progress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedAdditionalDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivityProgressViewController setSecondaryText:](self->_progressViewController, "setSecondaryText:", v3);

  }
  else
  {
    -[PXActivityProgressController message](self, "message");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXActivityProgressViewController setSecondaryText:](self->_progressViewController, "setSecondaryText:");
  }

}

- (id)_newProgressContainerView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_alertController, v3);
  objc_initWeak(&location, self);
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__PXActivityProgressController__newProgressContainerView__block_invoke;
  v10 = &unk_1E5148D30;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "_addActionWithTitle:style:handler:shouldDismissHandler:", v4, 1, &v7, &__block_literal_global_249780);

  objc_msgSend(v3, "setContentViewController:", self->_progressViewController, v7, v8, v9, v10);
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_cancel
{
  void (**v3)(_QWORD);

  -[PXActivityProgressController cancellationHandler](self, "cancellationHandler");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[PXActivityProgressController setCancellationHandler:](self, "setCancellationHandler:", 0);
  if (v3)
    v3[2](v3);
  if (-[PXActivityProgressController shouldAutoDisplay](self, "shouldAutoDisplay"))
    -[PXActivityProgressController hideAnimated:allowDelay:](self, "hideAnimated:allowDelay:", 1, 1);

}

- (void)handleShowingProgressView
{
  UIViewController *v3;
  UIViewController *activityPresentingViewController;
  UIView *v5;
  UIView *progressContainerView;
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
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (!self->_didHide)
  {
    self->_whenDidShow = CFAbsoluteTimeGetCurrent();
    v3 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
    activityPresentingViewController = self->_activityPresentingViewController;
    self->_activityPresentingViewController = v3;

    v5 = -[PXActivityProgressController _newProgressContainerView](self, "_newProgressContainerView");
    progressContainerView = self->_progressContainerView;
    self->_progressContainerView = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIViewController view](self->_activityPresentingViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_progressContainerView);

    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIViewController view](self->_activityPresentingViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_progressContainerView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[UIViewController view](self->_activityPresentingViewController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_progressContainerView, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v18;
    -[UIViewController view](self->_activityPresentingViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_progressContainerView, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v11;
    -[UIViewController view](self->_activityPresentingViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_progressContainerView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_msgSend(WeakRetained, "showViewController:sender:", self->_activityPresentingViewController, 0);

  }
}

- (void)showAnimated:(BOOL)a3 allowDelay:(BOOL)a4
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIView *v19;
  UIView *containerView;
  UIView *v21;
  UIView *dimmingView;
  double v23;
  UIView *v24;
  void *v25;
  int64_t v26;
  dispatch_time_t v27;
  _QWORD v28[6];

  if (!self->_didShow && !self->_didHide)
  {
    v5 = a4;
    v6 = a3;
    self->_didShow = 1;
    -[PXActivityProgressController window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_firstKeyWindow");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v13, v15, v17);
    containerView = self->_containerView;
    self->_containerView = v19;

    -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](self->_containerView, "setAlpha:", 1.0);
    objc_msgSend(v9, "addSubview:", self->_containerView);
    v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v14, v16, v18);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v21;

    -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
    v23 = 0.0;
    -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
    v24 = self->_dimmingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_dimmingView);
    if (v6)
      v23 = 0.3;
    if (v5)
      v26 = 1000000000;
    else
      v26 = 0;
    v27 = dispatch_time(0, v26);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke;
    v28[3] = &unk_1E5144EB8;
    v28[4] = self;
    *(double *)&v28[5] = v23;
    dispatch_after(v27, MEMORY[0x1E0C80D38], v28);

  }
}

- (void)hideAnimated:(BOOL)a3 allowDelay:(BOOL)a4
{
  _BOOL4 v5;
  CFAbsoluteTime v6;
  double v7;
  BOOL v8;
  double v9;
  int64_t v10;
  double v11;
  dispatch_time_t v12;
  _QWORD v13[6];

  if (self->_didShow && !self->_didHide)
  {
    v5 = a3;
    self->_didHide = 1;
    if (a4 && self->_whenDidShow > 0.0)
    {
      v6 = CFAbsoluteTimeGetCurrent() - self->_whenDidShow;
      v7 = (1.0 - v6) * 1000000000.0;
      v8 = v6 < 1.0;
      v9 = 0.0;
      if (v8)
        v9 = v7;
      v10 = (uint64_t)v9;
    }
    else
    {
      v10 = 0;
    }
    if (v5)
      v11 = 0.3;
    else
      v11 = 0.0;
    v12 = dispatch_time(0, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke;
    v13[3] = &unk_1E5144EB8;
    v13[4] = self;
    *(double *)&v13[5] = v11;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);
  }
}

- (void)_didFinishHiding
{
  -[UIView removeFromSuperview](self->_containerView, "removeFromSuperview");
  *(_WORD *)&self->_didShow = 0;
  -[PXActivityProgressViewController reset](self->_progressViewController, "reset");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  PXActivityProgressController *v18;

  v10 = a3;
  v11 = v10;
  if ((void *)PXActivityProgressControllerProgressObserverContext == a6)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __79__PXActivityProgressController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16 = &unk_1E5148D08;
    v17 = v10;
    v18 = self;
    px_dispatch_on_main_queue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXActivityProgressController;
    -[PXActivityProgressController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)shouldAutoDisplay
{
  return self->_shouldAutoDisplay;
}

- (void)setShouldAutoDisplay:(BOOL)a3
{
  self->_shouldAutoDisplay = a3;
}

- (BOOL)shouldUseProgressText
{
  return self->_shouldUseProgressText;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityPresentingViewController, 0);
  objc_storeStrong((id *)&self->_progressContainerView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
}

void __79__PXActivityProgressController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(sel_fractionCompleted);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateFractionCompletedFromProgress");
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    NSStringFromSelector(sel_localizedDescription);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

    if ((_DWORD)v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_updatePrimaryText");
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      NSStringFromSelector(sel_localizedAdditionalDescription);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 40), "_updateSecondaryText");
    }
  }
}

void __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_2;
  v6[3] = &unk_1E5149198;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_3;
  v4[3] = &unk_1E5142510;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v4, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.0);
}

void __56__PXActivityProgressController_hideAnimated_allowDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinishHiding");

}

void __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _QWORD v9[5];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57))
  {
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
    v2 = objc_msgSend(*(id *)(a1 + 32), "_newProgressContainerView");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 9, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 9, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 10, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 10, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addConstraints:", v5);
    v8 = *(double *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke_2;
    v9[3] = &unk_1E5149198;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, v8);

  }
}

uint64_t __56__PXActivityProgressController_showAnimated_allowDelay___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 0.5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 1.0);
}

void __57__PXActivityProgressController__newProgressContainerView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

uint64_t __57__PXActivityProgressController__newProgressContainerView__block_invoke_2()
{
  return 0;
}

@end
