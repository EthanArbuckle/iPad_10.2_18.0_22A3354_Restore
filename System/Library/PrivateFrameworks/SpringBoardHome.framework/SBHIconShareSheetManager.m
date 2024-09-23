@implementation SBHIconShareSheetManager

- (BOOL)areAnyAppIconShareSheetsShowing
{
  void *v2;
  BOOL v3;

  -[SBHIconShareSheetManager shareSheetViewController](self, "shareSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIViewController)shareSheetViewController
{
  return self->_shareSheetViewController;
}

- (SBHIconShareSheetManager)initWithIconManager:(id)a3
{
  id v4;
  SBHIconShareSheetManager *v5;
  SBHIconShareSheetManager *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconShareSheetManager;
  v5 = -[SBHIconShareSheetManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__appIconForceTouchControllerDidDismissNotification_, CFSTR("SBIconViewDidDismissContextMenuNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHIconShareSheetManager;
  -[SBHIconShareSheetManager dealloc](&v4, sel_dealloc);
}

- (void)dismissIconShareSheetsIfNecessaryAndCleanUp
{
  void *v3;
  void *v4;
  id v5;

  -[SBHIconShareSheetManager fakeSourceView](self, "fakeSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[SBHIconShareSheetManager setFakeSourceView:](self, "setFakeSourceView:", 0);
  -[SBHIconShareSheetManager shareSheetViewController](self, "shareSheetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SBHIconShareSheetManager setShareSheetViewController:](self, "setShareSheetViewController:", 0);
  -[SBHIconShareSheetManager setIconView:](self, "setIconView:", 0);

}

- (void)presentShareSheetForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHIconShareSheetActivityItemProvider *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id from;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHIconShareSheetManager iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHIconShareSheetActivityItemProvider initWithIconManager:icon:]([SBHIconShareSheetActivityItemProvider alloc], "initWithIconManager:icon:", v5, v6);
  v8 = objc_alloc(MEMORY[0x1E0D96D28]);
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

  if (objc_msgSend(v5, "isFloatingDockSupported"))
  {
    -[SBHIconShareSheetManager _createFakeSourceViewForIconView:](self, "_createFakeSourceViewForIconView:", v4);
    -[SBHIconShareSheetManager fakeSourceView](self, "fakeSourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceView:", v11);
    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "setSourceRect:");
    objc_msgSend(v12, "setPermittedArrowDirections:", 15);
    objc_msgSend(v12, "setCanOverlapSourceViewRect:", 1);

  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__SBHIconShareSheetManager_presentShareSheetForIconView___block_invoke;
  v16 = &unk_1E8D89AA0;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &location);
  objc_msgSend(v10, "setCompletionWithItemsHandler:", &v13);
  -[SBHIconShareSheetManager _queueShareSheetPresentation:forIconView:](self, "_queueShareSheetPresentation:forIconView:", v10, v4, v13, v14, v15, v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __57__SBHIconShareSheetManager_presentShareSheetForIconView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "dismissIconShareSheetsIfNecessaryAndCleanUp");

  }
}

- (void)hideIconShareSheetsIfAnyForRotationAnimation
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[SBHIconShareSheetManager areAnyAppIconShareSheetsShowing](self, "areAnyAppIconShareSheetsShowing");
  v4 = -[SBHIconShareSheetManager iconShareSheetsAreHiddenForRotation](self, "iconShareSheetsAreHiddenForRotation");
  if (v3 || !v4)
  {
    -[SBHIconShareSheetManager setIconShareSheetsAreHiddenForRotation:](self, "setIconShareSheetsAreHiddenForRotation:", 1);
    -[SBHIconShareSheetManager iconView](self, "iconView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconShareSheetManager setIconWithShareSheetHidingForRotationAnimation:](self, "setIconWithShareSheetHidingForRotationAnimation:", v5);
    -[SBHIconShareSheetManager setLocationOfIconWithShareSheetHiddenForRotationAnimation:](self, "setLocationOfIconWithShareSheetHiddenForRotationAnimation:", v6);
    -[SBHIconShareSheetManager fakeSourceView](self, "fakeSourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFrame:", -10000.0, -10000.0, 100.0, 100.0);

  }
}

- (void)showIconShareSheetsIfAnyWereHiddenForRotationAnimation
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[SBHIconShareSheetManager areAnyAppIconShareSheetsShowing](self, "areAnyAppIconShareSheetsShowing");
  v4 = -[SBHIconShareSheetManager iconShareSheetsAreHiddenForRotation](self, "iconShareSheetsAreHiddenForRotation");
  if (v3 || v4)
  {
    -[SBHIconShareSheetManager setIconShareSheetsAreHiddenForRotation:](self, "setIconShareSheetsAreHiddenForRotation:", 0);
    -[SBHIconShareSheetManager iconManager](self, "iconManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHIconShareSheetManager iconWithShareSheetHidingForRotationAnimation](self, "iconWithShareSheetHidingForRotationAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconShareSheetManager locationOfIconWithShareSheetHiddenForRotationAnimation](self, "locationOfIconWithShareSheetHiddenForRotationAnimation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconViewForIcon:location:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SBHIconShareSheetManager setIconView:](self, "setIconView:", v7);
      -[SBHIconShareSheetManager fakeSourceView](self, "fakeSourceView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconShareSheetManager _iconViewFrameInScreenCoordinateSpace:](self, "_iconViewFrameInScreenCoordinateSpace:", v7);
      objc_msgSend(v8, "setFrame:");

      -[SBHIconShareSheetManager setIconWithShareSheetHidingForRotationAnimation:](self, "setIconWithShareSheetHidingForRotationAnimation:", 0);
      -[SBHIconShareSheetManager setLocationOfIconWithShareSheetHiddenForRotationAnimation:](self, "setLocationOfIconWithShareSheetHiddenForRotationAnimation:", 0);
    }
    else
    {
      -[SBHIconShareSheetManager dismissIconShareSheetsIfNecessaryAndCleanUp](self, "dismissIconShareSheetsIfNecessaryAndCleanUp");
    }

  }
}

- (id)_shareSheetPresentationViewControllerForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBHIconShareSheetManager iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFloatingDockSupported"))
  {
    objc_msgSend(v5, "floatingDockViewControllerForView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }

  return v6;
}

- (void)_queueShareSheetPresentation:(id)a3 forIconView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBHIconShareSheetManager setShareSheetViewController:](self, "setShareSheetViewController:", v8);
  -[SBHIconShareSheetManager setIconView:](self, "setIconView:", v6);
  -[SBHIconShareSheetManager iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isFloatingDockSupported")
    && objc_msgSend(v7, "isShowingIconContextMenu"))
  {
    -[SBHIconShareSheetManager setQueuedToPresentShareSheet:](self, "setQueuedToPresentShareSheet:", 1);
  }
  else
  {
    -[SBHIconShareSheetManager _presentShareSheet:forIconView:](self, "_presentShareSheet:forIconView:", v8, v6);
  }

}

- (void)_appIconForceTouchControllerDidDismissNotification:(id)a3
{
  void *v4;
  id v5;

  if (-[SBHIconShareSheetManager queuedToPresentShareSheet](self, "queuedToPresentShareSheet", a3))
  {
    -[SBHIconShareSheetManager setQueuedToPresentShareSheet:](self, "setQueuedToPresentShareSheet:", 0);
    -[SBHIconShareSheetManager shareSheetViewController](self, "shareSheetViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHIconShareSheetManager iconView](self, "iconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconShareSheetManager _presentShareSheet:forIconView:](self, "_presentShareSheet:forIconView:", v5, v4);

  }
}

- (void)_presentShareSheet:(id)a3 forIconView:(id)a4
{
  id v6;
  void *v7;
  id v8;
  CGRect v9;

  v8 = a3;
  v6 = a4;
  -[SBHIconShareSheetManager _iconViewFrameInScreenCoordinateSpace:](self, "_iconViewFrameInScreenCoordinateSpace:", v6);
  if (CGRectIsEmpty(v9))
  {
    -[SBHIconShareSheetManager dismissIconShareSheetsIfNecessaryAndCleanUp](self, "dismissIconShareSheetsIfNecessaryAndCleanUp");
  }
  else
  {
    -[SBHIconShareSheetManager _shareSheetPresentationViewControllerForIconView:](self, "_shareSheetPresentationViewControllerForIconView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_createFakeSourceViewForIconView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SBHIconShareSheetManager _iconViewFrameInScreenCoordinateSpace:](self, "_iconViewFrameInScreenCoordinateSpace:", v4);
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
  -[SBHIconShareSheetManager _shareSheetPresentationViewControllerForIconView:](self, "_shareSheetPresentationViewControllerForIconView:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);
  -[SBHIconShareSheetManager setFakeSourceView:](self, "setFakeSourceView:", v11);

}

- (CGRect)_iconViewFrameInScreenCoordinateSpace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Height;
  void *v13;
  void *v14;
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
  CGRect v27;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "iconImageFrame");
  Height = CGRectGetHeight(v27);
  objc_msgSend(v3, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toCoordinateSpace:", v14, v7, v9, v11, Height);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (SBIconView)iconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (SBIcon)iconWithShareSheetHidingForRotationAnimation
{
  return (SBIcon *)objc_loadWeakRetained((id *)&self->_iconWithShareSheetHidingForRotationAnimation);
}

- (void)setIconWithShareSheetHidingForRotationAnimation:(id)a3
{
  objc_storeWeak((id *)&self->_iconWithShareSheetHidingForRotationAnimation, a3);
}

- (NSString)locationOfIconWithShareSheetHiddenForRotationAnimation
{
  return self->_locationOfIconWithShareSheetHiddenForRotationAnimation;
}

- (void)setLocationOfIconWithShareSheetHiddenForRotationAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)fakeSourceView
{
  return self->_fakeSourceView;
}

- (void)setFakeSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_fakeSourceView, a3);
}

- (void)setShareSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetViewController, a3);
}

- (BOOL)queuedToPresentShareSheet
{
  return self->_queuedToPresentShareSheet;
}

- (void)setQueuedToPresentShareSheet:(BOOL)a3
{
  self->_queuedToPresentShareSheet = a3;
}

- (BOOL)iconShareSheetsAreHiddenForRotation
{
  return self->_iconShareSheetsAreHiddenForRotation;
}

- (void)setIconShareSheetsAreHiddenForRotation:(BOOL)a3
{
  self->_iconShareSheetsAreHiddenForRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareSheetViewController, 0);
  objc_storeStrong((id *)&self->_fakeSourceView, 0);
  objc_storeStrong((id *)&self->_locationOfIconWithShareSheetHiddenForRotationAnimation, 0);
  objc_destroyWeak((id *)&self->_iconWithShareSheetHidingForRotationAnimation);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end
