@implementation UIPrinterPickerViewController

- (UIPrinterPickerViewController)initWithPrinterPickerController:(id)a3 inParentController:(id)a4
{
  id v7;
  id v8;
  UIPrinterPickerViewController *v9;
  UIPrinterPickerViewController *v10;
  id v11;
  id v12;
  UIPrinterBrowserViewController *v13;
  UIPrinterBrowserViewController *printerBrowserViewController;
  uint64_t v15;
  UINavigationController *navigationController;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  UINavigationController *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIPrinterPickerViewController;
  v9 = -[UIPrinterPickerViewController init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printerPickerController, a3);
    v11 = objc_storeWeak((id *)&v10->_parentController, v8);
    v10->_userSelectedPrinter = 0;
    v12 = v11;
    v13 = -[UIPrinterBrowserViewController initWithOwnerViewController:printInfo:]([UIPrinterBrowserViewController alloc], "initWithOwnerViewController:printInfo:", v10, 0);
    printerBrowserViewController = v10->_printerBrowserViewController;
    v10->_printerBrowserViewController = v13;

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10->_printerBrowserViewController);
        navigationController = v10->_navigationController;
        v10->_navigationController = (UINavigationController *)v15;

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "viewControllers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
          goto LABEL_10;
      }
    }
    else
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10->_printerBrowserViewController);
      v20 = v10->_navigationController;
      v10->_navigationController = (UINavigationController *)v19;

    }
    -[UIPrinterBrowserViewController showCancelButton](v10->_printerBrowserViewController, "showCancelButton");
LABEL_10:

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterPickerViewController;
  -[UIPrinterPickerViewController dealloc](&v4, sel_dealloc);
}

- (void)_presentInParentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIViewController *v6;
  UIViewController *originalViewControllerInNav;
  void *v8;
  UIPrinterPickerController *printerPickerController;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_msgSend(WeakRetained, "_popoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_parentHasNoPopover = v5 == 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "topViewController");
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    originalViewControllerInNav = self->_originalViewControllerInNav;
    self->_originalViewControllerInNav = v6;

    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&self->_originalNavControllerDelegate, v8);

    objc_msgSend(WeakRetained, "setDelegate:", self);
    objc_msgSend(WeakRetained, "pushViewController:animated:", self->_printerBrowserViewController, v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self->_navigationController, v3, 0);
  }
  printerPickerController = self->_printerPickerController;
  if (v3)
    -[UIPrinterPickerController performSelector:withObject:afterDelay:](printerPickerController, "performSelector:withObject:afterDelay:", sel__printerPickerDidPresent, 0, 0.35);
  else
    -[UIPrinterPickerController _printerPickerDidPresent](printerPickerController, "_printerPickerDidPresent");

}

- (void)_presentWindow
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[9];
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[UIWindow frame](self->_window, "frame");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetHeight(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v13 = CGRectOffset(v12, 0.0, v7);
  -[UIWindow setFrame:](self->_window, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  v8 = 0.3;
  if (!self->_animated)
    v8 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__UIPrinterPickerViewController__presentWindow__block_invoke;
  v10[3] = &unk_1E9D97B28;
  v10[4] = self;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  *(CGFloat *)&v10[7] = width;
  *(CGFloat *)&v10[8] = height;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__UIPrinterPickerViewController__presentWindow__block_invoke_2;
  v9[3] = &unk_1E9D97330;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v9, v8);
}

uint64_t __47__UIPrinterPickerViewController__presentWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __47__UIPrinterPickerViewController__presentWindow__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v3 + 1034))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", *(_QWORD *)(v2 + 32), *MEMORY[0x1E0DC5668], 0);

      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 1034) = 0;
      v3 = *(_QWORD *)(v2 + 32);
    }
    return objc_msgSend(*(id *)(v3 + 976), "_printerPickerDidPresent");
  }
  return result;
}

- (void)_keyWindowWillRotate:(id)a3
{
  void *v4;

  if (self->_observingRotation)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5668], 0);

    self->_observingRotation = 0;
  }
  -[UIWindow _updateInterfaceOrientationFromDeviceOrientation:](self->_window, "_updateInterfaceOrientationFromDeviceOrientation:", 0);
  -[UIPrinterPickerViewController _presentWindow](self, "_presentWindow");
}

- (void)presentPrinterPickerPanelAnimated:(BOOL)a3 hostingScene:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  UIPrinterPickerWindow *v10;
  UIWindow *window;
  UIWindow *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    -[UIPrinterPickerViewController _presentInParentAnimated:](self, "_presentInParentAnimated:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__keyWindowWillRotate_, *MEMORY[0x1E0DC5668], v7);

      self->_observingRotation = 1;
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_findUISceneForLegacyInterfaceOrientation");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = -[UIPrinterPickerWindow initWithWindowScene:]([UIPrinterPickerWindow alloc], "initWithWindowScene:", v14);
    window = self->_window;
    self->_window = &v10->super;

    -[UIWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x1E0DC49F0]);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_navigationController);
    v12 = self->_window;
    -[UINavigationController view](self->_navigationController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow addSubview:](v12, "addSubview:", v13);

    -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
    self->_animated = v4;
    -[UIPrinterPickerViewController _presentWindow](self, "_presentWindow");

  }
}

- (void)presentPrinterPickerPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  UIPopoverController *v12;
  UIPopoverController *poverController;
  UIPrinterPickerController *printerPickerController;
  id v15;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    -[UIPrinterPickerViewController _presentInParentAnimated:](self, "_presentInParentAnimated:", v5);
  }
  else
  {
    v12 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", self->_navigationController);
    poverController = self->_poverController;
    self->_poverController = v12;

    -[UIPopoverController setDelegate:](self->_poverController, "setDelegate:", self);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_poverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v15, 15, v5, x, y, width, height);
    printerPickerController = self->_printerPickerController;
    if (v5)
      -[UIPrinterPickerController performSelector:withObject:afterDelay:](printerPickerController, "performSelector:withObject:afterDelay:", sel__printerPickerDidPresent, 0, 0.35);
    else
      -[UIPrinterPickerController _printerPickerDidPresent](printerPickerController, "_printerPickerDidPresent");
  }

}

- (void)presentPrinterPickerPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  UIPopoverController *v7;
  UIPopoverController *poverController;
  UIPrinterPickerController *printerPickerController;
  id v10;

  v4 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    -[UIPrinterPickerViewController _presentInParentAnimated:](self, "_presentInParentAnimated:", v4);
  }
  else
  {
    v7 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", self->_navigationController);
    poverController = self->_poverController;
    self->_poverController = v7;

    -[UIPopoverController setDelegate:](self->_poverController, "setDelegate:", self);
    -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self->_poverController, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v10, 15, v4);
    printerPickerController = self->_printerPickerController;
    if (v4)
      -[UIPrinterPickerController performSelector:withObject:afterDelay:](printerPickerController, "performSelector:withObject:afterDelay:", sel__printerPickerDidPresent, 0, 0.35);
    else
      -[UIPrinterPickerController _printerPickerDidPresent](printerPickerController, "_printerPickerDidPresent");
  }

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_originalViewControllerInNav == a4)
    -[UIPrinterPickerController _printerPickerWillDismiss](self->_printerPickerController, "_printerPickerWillDismiss", a3);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id *p_originalNavControllerDelegate;
  id v7;
  id WeakRetained;

  if (self->_originalViewControllerInNav == a4)
  {
    self->_dismissed = 1;
    p_originalNavControllerDelegate = &self->_originalNavControllerDelegate;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained(p_originalNavControllerDelegate);
    objc_msgSend(v7, "setDelegate:", WeakRetained);

    -[UIPrinterPickerController _printerPickerDidDismiss](self->_printerPickerController, "_printerPickerDidDismiss");
  }
}

- (void)dismissPrinterPickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIWindow *window;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  UIPopoverController *poverController;
  UIPrinterPickerController *printerPickerController;
  void *v13;
  unint64_t v14;
  id v15;
  id WeakRetained;
  _QWORD v17[5];
  _QWORD v18[11];
  CGRect v19;

  v3 = a3;
  -[UIPrinterPickerController _printerPickerWillDismiss](self->_printerPickerController, "_printerPickerWillDismiss");
  self->_dismissed = 1;
  window = self->_window;
  if (window)
  {
    if (v3)
    {
      -[UIWindow frame](window, "frame");
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
      v10 = CGRectGetHeight(v19);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke;
      v18[3] = &unk_1E9D97308;
      v18[4] = self;
      *(CGFloat *)&v18[5] = x;
      *(CGFloat *)&v18[6] = y;
      *(CGFloat *)&v18[7] = width;
      *(CGFloat *)&v18[8] = height;
      v18[9] = 0;
      *(CGFloat *)&v18[10] = v10;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke_2;
      v17[3] = &unk_1E9D97330;
      v17[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v18, v17, 0.3);
      return;
    }
    -[UIWindow setHidden:](window, "setHidden:", 1);
    printerPickerController = self->_printerPickerController;
LABEL_8:
    -[UIPrinterPickerController _printerPickerDidDismiss](printerPickerController, "_printerPickerDidDismiss");
    return;
  }
  poverController = self->_poverController;
  if (poverController)
  {
    -[UIPopoverController dismissPopoverAnimated:](poverController, "dismissPopoverAnimated:", v3);
    printerPickerController = self->_printerPickerController;
    if (v3)
    {
      -[UIPrinterPickerController performSelector:withObject:afterDelay:](printerPickerController, "performSelector:withObject:afterDelay:", sel__printerPickerDidDismiss, 0, 0.35);
      return;
    }
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(WeakRetained, "viewControllers"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v14 >= 2))
  {
    v15 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(WeakRetained, "setViewControllers:", MEMORY[0x1E0C9AA60]);
    else
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", v3, 0);
  }
  -[UIPrinterPickerController _printerPickerDidDismiss](self->_printerPickerController, "_printerPickerDidDismiss");

}

uint64_t __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke(uint64_t a1)
{
  CGRect v3;

  v3 = CGRectOffset(*(CGRect *)(a1 + 40), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setFrame:", v3.origin.x, v3.origin.y, v3.size.width, v3.size.height);
}

uint64_t __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setHidden:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "_printerPickerDidDismiss");
}

- (void)cancelPrinting
{
  -[UIPrinterPickerViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)printerBrowserViewDidDisappear
{
  UIViewController **p_parentController;
  id WeakRetained;
  id v5;
  UINavigationController *v6;
  UIPrinterBrowserViewController *v7;
  UIPrinterBrowserViewController *printerBrowserViewController;
  UINavigationController *v9;

  if (!self->_dismissed)
  {
    p_parentController = &self->_parentController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)p_parentController);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = (UINavigationController *)objc_loadWeakRetained((id *)p_parentController);
      else
        v6 = self->_navigationController;
      v9 = v6;

      -[UINavigationController topViewController](v9, "topViewController");
      v7 = (UIPrinterBrowserViewController *)objc_claimAutoreleasedReturnValue();
      printerBrowserViewController = self->_printerBrowserViewController;

      if (v7 == printerBrowserViewController)
        -[UIPrinterPickerViewController dismissPrinterPickerAnimated:](self, "dismissPrinterPickerAnimated:", 0);

    }
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6)
    return 1;
  if (a3 == 2)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
    return 1;
  v7 = 1;
  objc_msgSend(MEMORY[0x1E0DC3F98], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "_isTextEffectsWindow", (_QWORD)v16) & 1) == 0
          && !objc_msgSend(v14, "_shouldAutorotateToInterfaceOrientation:", a3))
        {
          v7 = 0;
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
    v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 30;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
    return 26;
  objc_msgSend(MEMORY[0x1E0DC3F98], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    v5 = 26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "_isTextEffectsWindow") & 1) == 0)
          v5 &= objc_msgSend(v12, "_supportedInterfaceOrientationsForRootViewController");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v5 = 26;
  }

  return v5;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  -[UIPrinterPickerViewController dismissPrinterPickerAnimated:](self, "dismissPrinterPickerAnimated:", 1);
}

- (BOOL)filtersPrinters
{
  return -[UIPrinterPickerController _delegateFiltersPrinters](self->_printerPickerController, "_delegateFiltersPrinters");
}

- (BOOL)shouldShowPrinter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4 && (v5 = -[UIPrinter _initWithPrinter:]([UIPrinter alloc], "_initWithPrinter:", v4)) != 0)
  {
    v6 = v5;
    v7 = -[UIPrinterPickerController _shouldShowPrinter:](self->_printerPickerController, "_shouldShowPrinter:", v5);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (PKPrinter)printer
{
  return self->_printer;
}

- (void)setPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_printer, a3);
}

- (BOOL)userSelectedPrinter
{
  return self->_userSelectedPrinter;
}

- (void)setUserSelectedPrinter:(BOOL)a3
{
  self->_userSelectedPrinter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_poverController, 0);
  objc_destroyWeak(&self->_originalNavControllerDelegate);
  objc_storeStrong((id *)&self->_originalViewControllerInNav, 0);
  objc_storeStrong((id *)&self->_printerBrowserViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_printerPickerController, 0);
  objc_destroyWeak((id *)&self->_parentController);
}

@end
