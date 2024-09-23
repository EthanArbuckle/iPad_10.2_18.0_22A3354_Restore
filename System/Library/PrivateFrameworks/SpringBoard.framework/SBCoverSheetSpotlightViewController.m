@implementation SBCoverSheetSpotlightViewController

- (SBCoverSheetSpotlightViewController)initWithSpotlightViewController:(id)a3
{
  id v5;
  SBCoverSheetSpotlightViewController *v6;
  SBCoverSheetSpotlightViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetSpotlightViewController;
  v6 = -[SBCoverSheetSpotlightViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spotlightViewController, a3);

  return v7;
}

- (void)viewDidLoad
{
  SBSpotlightPresentableViewController *spotlightViewController;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSpotlightViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  spotlightViewController = self->_spotlightViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SBCoverSheetSpotlightViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E8EA0048;
  v4[4] = self;
  -[SBCoverSheetSpotlightViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", spotlightViewController, 0, v4);
}

void __50__SBCoverSheetSpotlightViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setAutoresizesSubviews:", 1);
  objc_msgSend(v6, "addSubview:", v5);
  v4[2](v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSpotlightViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSCoverSheetViewControllerBase setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSpotlightViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "coverSheetSpotlightViewControllerShouldDismiss:animated:", self, 0);

}

- (void)invalidate
{
  -[SBSpotlightPresentableViewController invalidate](self->_spotlightViewController, "invalidate");
}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (SBHHomePullToSearchSettings)searchTransitionSettings
{
  return -[SBSpotlightPresentableViewController searchTransitionSettings](self->_spotlightViewController, "searchTransitionSettings");
}

- (void)setSearchTransitionSettings:(id)a3
{
  -[SBSpotlightPresentableViewController setSearchTransitionSettings:](self->_spotlightViewController, "setSearchTransitionSettings:", a3);
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  SBSpotlightPresentableViewController *spotlightViewController;
  id v4;
  id v5;

  spotlightViewController = self->_spotlightViewController;
  v4 = a3;
  -[SBSpotlightPresentableViewController spotlightMultiplexingViewController](spotlightViewController, "spotlightMultiplexingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetDisplayConfiguration:", v4);

}

- (void)_updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  -[SBSpotlightPresentableViewController setTopOffset:](self->_spotlightViewController, "setTopOffset:", self->_topOffset);
  -[SBSpotlightPresentableViewController setMaxPresentationOffset:](self->_spotlightViewController, "setMaxPresentationOffset:", self->_maxPresentationOffset);
  -[SBSpotlightPresentableViewController updatePresentationProgress:withOffset:velocity:presentationState:](self->_spotlightViewController, "updatePresentationProgress:withOffset:velocity:presentationState:", a6, a3, a4, a5);
  -[SBCoverSheetSpotlightViewController updateComponentTransitionWithOffset:presentationState:](self, "updateComponentTransitionWithOffset:presentationState:", a6, a4);
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  return -[SBSpotlightPresentableViewController willBeginModifyingPresentationProgressForState:animated:needsInitialLayout:](self->_spotlightViewController, "willBeginModifyingPresentationProgressForState:animated:needsInitialLayout:", a3, a4, a5);
}

- (void)updateComponentTransitionWithOffset:(double)a3 presentationState:(int64_t)a4
{
  void *v7;
  CSProudLockComponent *proudLockComponent;
  CSDateViewComponent *dateViewComponent;
  CSContentComponent *contentComponent;
  CSWallpaperFloatingLayerComponent *wallpaperFloatingLayerComponent;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CSProudLockComponent *v17;
  CSProudLockComponent *v18;
  void *v19;
  void *v20;
  void *v21;
  CSDateViewComponent *v22;
  CSDateViewComponent *v23;
  void *v24;
  void *v25;
  void *v26;
  CSContentComponent *v27;
  CSContentComponent *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  -[SBCoverSheetSpotlightViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  CSComponentTransitionInputsMake();
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  CSComponentTransitionInputsMake();
  if (a4 == 1 && a3 == 0.0)
  {
    proudLockComponent = self->_proudLockComponent;
    self->_proudLockComponent = 0;

    dateViewComponent = self->_dateViewComponent;
    self->_dateViewComponent = 0;

    contentComponent = self->_contentComponent;
    self->_contentComponent = 0;

    wallpaperFloatingLayerComponent = self->_wallpaperFloatingLayerComponent;
    self->_wallpaperFloatingLayerComponent = 0;

    objc_msgSend(v7, "coverSheetSpotlightViewControllerRemoveContentView:", self);
  }
  else
  {
    CSComponentTransitionInputsMake();
    v35 = v29;
    v36 = v30;
    v37 = v31;
    CSComponentTransitionInputsMake();
    v32 = v29;
    v33 = v30;
    v34 = v31;
    objc_msgSend(v7, "coverSheetSpotlightViewControllerAddContentView:", self);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "priority:", 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transitionModifiers:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionInputs:", &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shouldResideInALowerSubview:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "optOutOfAlphaFadesForPageScroll:", 0);
    v17 = (CSProudLockComponent *)objc_claimAutoreleasedReturnValue();
    v18 = self->_proudLockComponent;
    self->_proudLockComponent = v17;

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "priority:", 40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transitionModifiers:", 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v32;
    v30 = v33;
    v31 = v34;
    objc_msgSend(v21, "transitionInputs:", &v29);
    v22 = (CSDateViewComponent *)objc_claimAutoreleasedReturnValue();
    v23 = self->_dateViewComponent;
    self->_dateViewComponent = v22;

    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "priority:", 40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transitionModifiers:", 8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v35;
    v30 = v36;
    v31 = v37;
    objc_msgSend(v26, "transitionInputs:", &v29);
    v27 = (CSContentComponent *)objc_claimAutoreleasedReturnValue();
    v28 = self->_contentComponent;
    self->_contentComponent = v27;

  }
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  id WeakRetained;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSpotlightViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    if (objc_msgSend(v4, "type") == 25)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "coverSheetSpotlightViewControllerShouldDismiss:animated:", self, 0);

    }
    v5 = 0;
  }

  return v5;
}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSpotlightViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setIdleTimerDuration:", 10, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setNotificationBehavior:", 2);

}

- (void)aggregateAppearance:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CSProudLockComponent *proudLockComponent;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBCoverSheetSpotlightViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v25, sel_aggregateAppearance_, v4);
  objc_msgSend(MEMORY[0x1E0D1BB88], "controlCenterGrabber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v7);

  objc_msgSend(MEMORY[0x1E0D1BB88], "footerCallToActionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hidden:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v12);

  objc_msgSend(MEMORY[0x1E0D1BB88], "homeAffordance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "priority:", 40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hidden:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v17);

  objc_msgSend(MEMORY[0x1E0D1BB88], "whitePoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "priority:", 40);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hidden:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v22);

  proudLockComponent = self->_proudLockComponent;
  if (proudLockComponent)
  {
    -[CSProudLockComponent shouldResideInALowerSubview:](proudLockComponent, "shouldResideInALowerSubview:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v24);

  }
  if (self->_dateViewComponent)
    objc_msgSend(v4, "addComponent:");
  if (self->_contentComponent)
    objc_msgSend(v4, "addComponent:");
  if (self->_wallpaperFloatingLayerComponent)
    objc_msgSend(v4, "addComponent:");

}

- (id)_newDisplayLayoutElement
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DAAE30]);
  v3 = (void *)objc_msgSend(v2, "initWithIdentifier:", *MEMORY[0x1E0DAB6A0]);
  objc_msgSend(v3, "setFillsDisplayBounds:", 1);
  objc_msgSend(v3, "setLayoutRole:", 6);
  return v3;
}

- (void)addGrabberView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    -[SBCoverSheetSpotlightViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[SBSpotlightPresentableViewController scalingContentView](self->_spotlightViewController, "scalingContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    objc_msgSend(v6, "setAutoHides:", 0);
  }

}

- (void)handleBottomEdgeGestureChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[SBCoverSheetSpotlightViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  -[SBCoverSheetSpotlightViewController _scaleGivenTranslation:](self, "_scaleGivenTranslation:", v7);
  -[SBCoverSheetSpotlightViewController _updateSpotlightScale:interactive:](self, "_updateSpotlightScale:interactive:", 1);
}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;

  v4 = a3;
  -[SBCoverSheetSpotlightViewController _updateSpotlightScale:interactive:](self, "_updateSpotlightScale:interactive:", 0, 1.0);
  -[SBCoverSheetSpotlightViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v5);
  v7 = v6;

  -[SBCoverSheetSpotlightViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v8);
  v10 = v9;

  -[SBCoverSheetSpotlightViewController _scaleGivenTranslation:](self, "_scaleGivenTranslation:", v10 + v7 / 1000.0 * *MEMORY[0x1E0CEBBA8] / (1.0 - *MEMORY[0x1E0CEBBA8]));
  if (v11 < 0.98)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "coverSheetSpotlightViewControllerShouldDismiss:animated:", self, 1);

  }
}

- (void)dismissForHomeButton
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "coverSheetSpotlightViewControllerShouldDismiss:animated:", self, 1);

}

- (double)_scaleGivenTranslation:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBCoverSheetSpotlightViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = a3 / (v5 * 0.5) + 1.0;

  BSUIConstrainValueWithRubberBand();
  if (v6 >= 1.0)
    v8 = v7 + 1.0;
  else
    v8 = 1.0 - v7;
  return fmin(fmax(v8, 0.0), 1.1);
}

- (void)_updateSpotlightScale:(double)a3 interactive:(BOOL)a4
{
  -[SBSpotlightPresentableViewController setSpotlightScale:interactive:](self->_spotlightViewController, "setSpotlightScale:interactive:", a4, a3);
}

- (SBCoverSheetSpotlightViewControllerDelegate)delegate
{
  return (SBCoverSheetSpotlightViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSpotlightPresentableViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void)setSpotlightViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightViewController, a3);
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->_maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->_maxPresentationOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerComponent, 0);
  objc_storeStrong((id *)&self->_contentComponent, 0);
  objc_storeStrong((id *)&self->_dateViewComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
}

@end
