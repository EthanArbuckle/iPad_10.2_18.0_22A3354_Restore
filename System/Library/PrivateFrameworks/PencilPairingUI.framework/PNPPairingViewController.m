@implementation PNPPairingViewController

- (PNPPairingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PNPPairingViewController *v4;
  PNPPlatterTransitioningDelegate *v5;
  PNPPlatterTransitioningDelegate *platterTransitioningDelegate;
  PNPPlatterContainerView *v7;
  PNPPlatterContainerView *wizardPlatterContainerView;
  PNPPairingView *v9;
  PNPPairingView *pairingView;
  void *v11;
  PNPPlatterContainerView *v12;
  PNPPlatterContainerView *horizontalPencilPlatterContainerView;
  PNPPencilHorizontalPresentationContainerView *v14;
  PNPPencilHorizontalPresentationContainerView *horizontalPresentationPencilContainerView;
  PNPPencilView *v16;
  PNPPencilView *horizontalPencilView;
  PNPChargingStatusView *v18;
  PNPChargingStatusView *pairingChargingStatusView;
  PNPChargingStatusView *v20;
  PNPChargingStatusView *horizontalChargingStatusView;
  uint64_t v22;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PNPPairingViewController;
  v4 = -[PNPPairingViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  v5 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v5;

  -[PNPPairingViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4->_platterTransitioningDelegate);
  -[PNPPairingViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
  v7 = objc_alloc_init(PNPPlatterContainerView);
  wizardPlatterContainerView = v4->_wizardPlatterContainerView;
  v4->_wizardPlatterContainerView = v7;

  v9 = objc_alloc_init(PNPPairingView);
  pairingView = v4->_pairingView;
  v4->_pairingView = v9;

  -[PNPPairingView setDelegate:](v4->_pairingView, "setDelegate:", v4);
  -[PNPPairingView pencilView](v4->_pairingView, "pencilView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v4);

  v12 = objc_alloc_init(PNPPlatterContainerView);
  horizontalPencilPlatterContainerView = v4->_horizontalPencilPlatterContainerView;
  v4->_horizontalPencilPlatterContainerView = v12;

  v14 = objc_alloc_init(PNPPencilHorizontalPresentationContainerView);
  horizontalPresentationPencilContainerView = v4->_horizontalPresentationPencilContainerView;
  v4->_horizontalPresentationPencilContainerView = v14;

  v16 = -[PNPPencilView initWithVariant:]([PNPPencilView alloc], "initWithVariant:", 0);
  horizontalPencilView = v4->_horizontalPencilView;
  v4->_horizontalPencilView = v16;

  -[PNPPencilView setDelegate:](v4->_horizontalPencilView, "setDelegate:", v4);
  v18 = objc_alloc_init(PNPChargingStatusView);
  pairingChargingStatusView = v4->_pairingChargingStatusView;
  v4->_pairingChargingStatusView = v18;

  v20 = objc_alloc_init(PNPChargingStatusView);
  horizontalChargingStatusView = v4->_horizontalChargingStatusView;
  v4->_horizontalChargingStatusView = v20;

  -[PNPChargingStatusView setDelegate:](v4->_pairingChargingStatusView, "setDelegate:", v4);
  -[PNPChargingStatusView setDelegate:](v4->_horizontalChargingStatusView, "setDelegate:", v4);
  -[PNPPlatterContainerView setContentView:](v4->_wizardPlatterContainerView, "setContentView:", v4->_pairingView);
  -[PNPPlatterContainerView setContentView:](v4->_horizontalPencilPlatterContainerView, "setContentView:", v4->_horizontalPresentationPencilContainerView);
  -[PNPPencilHorizontalPresentationContainerView setPencilView:](v4->_horizontalPresentationPencilContainerView, "setPencilView:", v4->_horizontalPencilView);
  v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v4, sel__handlePanGesture_);
  panGestureRecognizer = v4->_panGestureRecognizer;
  v4->_panGestureRecognizer = (UIPanGestureRecognizer *)v22;

  -[PNPPairingViewController view](v4, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addGestureRecognizer:", v4->_panGestureRecognizer);

  -[PNPPairingViewController _offsetContainerViewsIfNecessary](v4, "_offsetContainerViewsIfNecessary");
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  PNPPairingViewControllerView *v3;

  v3 = objc_alloc_init(PNPPairingViewControllerView);
  -[PNPPairingViewController setView:](self, "setView:", v3);

}

- (void)_orientationChanged:(double)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;

  if (!-[PNPPairingView state](self->_pairingView, "state"))
  {
    -[PNPPairingViewController deviceState](self, "deviceState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "copy");

    v5 = -[PNPPairingViewController _edgeToStickToPort](self, "_edgeToStickToPort");
    v6 = v9;
    if (!v5)
    {
      if (objc_msgSend(v9, "edge") == 8 || objc_msgSend(v9, "edge") == 2)
      {
        v6 = v9;
      }
      else
      {
        v8 = objc_msgSend(v9, "edge") == 4;
        v6 = v9;
        if (!v8)
        {
          objc_msgSend(v9, "edge");
          v6 = v9;
        }
      }
    }
    objc_msgSend(v6, "setEdge:");
    -[PNPPairingViewController setDeviceState:](self, "setDeviceState:", v9);
    -[PNPPairingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (unint64_t)_edgeToStickToPort
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "statusBarOrientation");

  if (v3 == 1 || v5 == 1)
    return 8;
  if (v3 == 2 || v5 == 2)
    return 2;
  if (v3 == 3 || v5 == 3)
    return 1;
  if (v5 == 4 || v3 == 4)
    return 4;
  else
    return 0;
}

- (void)viewWillLayoutSubviews
{
  PNPPlatterContainerView *wizardPlatterContainerView;
  void *v4;
  PNPPlatterContainerView *horizontalPencilPlatterContainerView;
  void *v6;
  void *v7;
  double v8;
  PNPPlatterContainerView *v9;
  PNPPlatterContainerView *v10;
  _BOOL8 v11;
  _BOOL8 v12;

  wizardPlatterContainerView = self->_wizardPlatterContainerView;
  -[PNPPairingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PNPPlatterContainerView setFrame:](wizardPlatterContainerView, "setFrame:");

  horizontalPencilPlatterContainerView = self->_horizontalPencilPlatterContainerView;
  -[PNPPairingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[PNPPlatterContainerView setFrame:](horizontalPencilPlatterContainerView, "setFrame:");

  -[PNPPairingViewController _chargingStatusViewSetNeedsLayout](self, "_chargingStatusViewSetNeedsLayout");
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v7, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v8);

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v9 = (PNPPlatterContainerView *)objc_claimAutoreleasedReturnValue();
  v10 = self->_wizardPlatterContainerView;

  if (!self->_viewDidAppearCalled || (v11 = v9 == v10, v12 = v9 != v10, self->_viewRequestsDismissCalled))
  {
    v11 = 0;
    v12 = 0;
  }
  -[PNPPlatterContainerView setPresented:](self->_wizardPlatterContainerView, "setPresented:", v11);
  -[PNPPlatterContainerView setPresented:](self->_horizontalPencilPlatterContainerView, "setPresented:", v12);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PNPPairingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_horizontalPencilPlatterContainerView);

  -[PNPPairingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:belowSubview:", self->_wizardPlatterContainerView, self->_horizontalPencilPlatterContainerView);

}

- (void)_updateForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[PNPPlatterContainerView setFrame:](self->_wizardPlatterContainerView, "setFrame:", *MEMORY[0x24BDBF090], v7, a3.width, a3.height);
  -[PNPPlatterContainerView setFrame:](self->_horizontalPencilPlatterContainerView, "setFrame:", v6, v7, width, height);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (self->_inWizard)
  {
    -[PNPPairingViewController _wizardViewWillTransitionToSize:withTransitionCoordinator:](self, "_wizardViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }
  else if (self->_showingChargingUI)
  {
    -[PNPPairingViewController _chargingUIViewWillTransitionToSize:withTransitionCoordinator:](self, "_chargingUIViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }
  else
  {
    -[PNPPairingViewController _spinningPencilViewWillTransitionToSize:withTransitionCoordinator:](self, "_spinningPencilViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }
  v8.receiver = self;
  v8.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)_wizardViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  _QWORD v12[7];
  _QWORD v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    v9 = *((double *)&v14 + 1);
    v10 = *(double *)&v14;
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }
  v11 = atan2f(v9, v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__PNPPairingViewController__wizardViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_24F4E5A88;
  *(CGFloat *)&v13[5] = width;
  *(CGFloat *)&v13[6] = height;
  v13[4] = self;
  *(double *)&v13[7] = v11;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__PNPPairingViewController__wizardViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_24F4E50C8;
  *(CGFloat *)&v12[5] = width;
  *(CGFloat *)&v12[6] = height;
  v12[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v12);

}

uint64_t __86__PNPPairingViewController__wizardViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_orientationChanged:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setFrame:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setFrame:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setNeedsLayout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setNeedsLayout");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "layoutIfNeeded");
}

uint64_t __86__PNPPairingViewController__wizardViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setFrame:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setFrame:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setNeedsLayout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setNeedsLayout");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutIfNeeded");
}

- (void)_chargingUIViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  _QWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    v9 = *((double *)&v13 + 1);
    v10 = *(double *)&v13;
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }
  v11 = atan2f(v9, v10);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__PNPPairingViewController__chargingUIViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_24F4E5A88;
  *(CGFloat *)&v12[5] = width;
  *(CGFloat *)&v12[6] = height;
  v12[4] = self;
  *(double *)&v12[7] = v11;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v12, &__block_literal_global_13);

}

void __90__PNPPairingViewController__chargingUIViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_orientationChanged:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)_spinningPencilViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  _QWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    v9 = *((double *)&v13 + 1);
    v10 = *(double *)&v13;
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }
  v11 = atan2f(v9, v10);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__PNPPairingViewController__spinningPencilViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_24F4E5A88;
  *(CGFloat *)&v12[5] = width;
  *(CGFloat *)&v12[6] = height;
  v12[4] = self;
  *(double *)&v12[7] = v11;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v12, &__block_literal_global_20);

}

void __94__PNPPairingViewController__spinningPencilViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_orientationChanged:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (id)_currentPlatterContainerView
{
  void *v3;
  char v4;
  int *v5;

  if (self->_inWizard
    || self->_showingChargingUI
    || (-[PNPPairingViewController deviceState](self, "deviceState"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isOnLeftOrRightSide"),
        v3,
        (v4 & 1) == 0))
  {
    v5 = &OBJC_IVAR___PNPPairingViewController__wizardPlatterContainerView;
  }
  else
  {
    v5 = &OBJC_IVAR___PNPPairingViewController__horizontalPencilPlatterContainerView;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v5);
}

- (void)_updatePlatterContainerView:(id)a3 toPreferredCornerRadius:(double)a4 edge:(unint64_t)a5
{
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setPreferredCornerRadius:", a4);
  objc_msgSend(v8, "setEdge:", a5);
  -[PNPPairingViewController _updateSubviewDeviceStateForContainerView:](self, "_updateSubviewDeviceStateForContainerView:", v8);
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;

  v3 = a3;
  +[PencilSettings sharedPencilSettings](PencilSettings, "sharedPencilSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSettingsToBackboard");

  +[PencilSettings sharedPencilSettings](PencilSettings, "sharedPencilSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrateObsoletedAXOpaqueTouchSetting");

  v16.receiver = self;
  v16.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController viewDidAppear:](&v16, sel_viewDidAppear_, v3);
  -[PNPPairingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[PNPPairingViewController _updateForSize:](self, "_updateForSize:", v8, v9);

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v10, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v11);

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPresented:", 0);

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__PNPPairingViewController_viewDidAppear___block_invoke;
  v15[3] = &unk_24F4E50A0;
  v15[4] = self;
  PNPPlatterPresentPlatterContainerView(v14, v3, v15);

  self->_viewDidAppearCalled = 1;
}

uint64_t __42__PNPPairingViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "pairingViewControllerState");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_startConnectingUITimer");
  return result;
}

- (void)_startConnectingUITimer
{
  NSTimer *v3;
  NSTimer *initialTimer;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showConnectingAnimationUI, 0, 0, 0.8);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  initialTimer = self->_initialTimer;
  self->_initialTimer = v3;

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PNPPairingViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PNPPairingViewController appearanceDelegate](self, "appearanceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidDismiss:", self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_performAnimations:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDF6F90];
  v11 = v6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__PNPPairingViewController__performAnimations_completion___block_invoke;
  v12[3] = &unk_24F4E5188;
  v13 = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__PNPPairingViewController__performAnimations_completion___block_invoke_2;
  v10[3] = &unk_24F4E5240;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v12, v10, 0.6, 0.0, 0.85, 0.0);

}

uint64_t __58__PNPPairingViewController__performAnimations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PNPPairingViewController__performAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_transitionPairingViewToWizardByMovingPlatter
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[PNPPairingView prepareForTransitionToWizard](self->_pairingView, "prepareForTransitionToWizard");
  -[PNPPairingView wizardViewController](self->_pairingView, "wizardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController addChildViewController:](self, "addChildViewController:", v3);

  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke;
  v5[3] = &unk_24F4E50A0;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_2;
  v4[3] = &unk_24F4E50A0;
  -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v5, v4);
}

uint64_t __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "platterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterPreferencesChangedForViewController:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setState:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setDimmingState:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDimmingState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_centerContainerViews");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[121];
  objc_msgSend(v3, "preferredCornerRadius");
  objc_msgSend(v3, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v4, objc_msgSend(*(id *)(a1 + 32), "preferredEdge"), v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "transitionToWizard");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutIfNeeded");
}

uint64_t __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  _QWORD v4[5];

  v3 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_3;
  v4[3] = &unk_24F4E50A0;
  v4[4] = v3;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_4;
  v2[3] = &unk_24F4E50A0;
  return objc_msgSend(v3, "_performAnimations:completion:", v4, v2);
}

uint64_t __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setShowWizardContents:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutIfNeeded");
}

uint64_t __73__PNPPairingViewController__transitionPairingViewToWizardByMovingPlatter__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "wizardTransitionFinished");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutIfNeeded");
}

- (void)_transitionToWizardBySlideOutAndPresent
{
  void *v3;
  PNPPlatterContainerView *wizardPlatterContainerView;
  PNPPlatterContainerView *horizontalPencilPlatterContainerView;
  _QWORD v6[5];

  -[PNPPairingView prepareForTransitionToWizard](self->_pairingView, "prepareForTransitionToWizard");
  -[PNPPairingView wizardViewController](self->_pairingView, "wizardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController addChildViewController:](self, "addChildViewController:", v3);

  -[PNPPairingView unhideWizardIfNecessary](self->_pairingView, "unhideWizardIfNecessary");
  -[PNPPairingView setState:](self->_pairingView, "setState:", 1);
  -[PNPPairingView setShowWizardContents:](self->_pairingView, "setShowWizardContents:", 1);
  -[PNPPairingView wizardTransitionFinished](self->_pairingView, "wizardTransitionFinished");
  -[PNPPairingView layoutIfNeeded](self->_pairingView, "layoutIfNeeded");
  -[PNPPlatterContainerView setDimmingState:](self->_horizontalPencilPlatterContainerView, "setDimmingState:", 2);
  -[PNPPlatterContainerView setDimmingState:](self->_wizardPlatterContainerView, "setDimmingState:", 2);
  wizardPlatterContainerView = self->_wizardPlatterContainerView;
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", wizardPlatterContainerView, 0);
  horizontalPencilPlatterContainerView = self->_horizontalPencilPlatterContainerView;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__PNPPairingViewController__transitionToWizardBySlideOutAndPresent__block_invoke;
  v6[3] = &unk_24F4E50A0;
  v6[4] = self;
  PNPPlatterDismissPlatterContainerView(horizontalPencilPlatterContainerView, 1, v6);
  PNPPlatterPresentPlatterContainerView(self->_wizardPlatterContainerView, 1, 0);
}

uint64_t __67__PNPPairingViewController__transitionToWizardBySlideOutAndPresent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "removeFromSuperview");
}

- (void)_actuallyTransitionToWizard
{
  void *v3;
  int64_t v4;
  void *v5;
  id v6;

  -[PNPPairingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  self->_inWizard = 1;
  v4 = -[PNPPairingView deviceType](self->_pairingView, "deviceType");
  -[PNPPairingViewController deviceState](self, "deviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isOnLeftOrRightSide") & 1) != 0
    || -[PNPPairingView deviceType](self->_pairingView, "deviceType") == 1)
  {

  }
  else
  {

    if (v4 != 3)
    {
      -[PNPPairingViewController _transitionPairingViewToWizardByMovingPlatter](self, "_transitionPairingViewToWizardByMovingPlatter");
      goto LABEL_5;
    }
  }
  -[PNPPairingViewController _transitionToWizardBySlideOutAndPresent](self, "_transitionToWizardBySlideOutAndPresent");
LABEL_5:
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("PNPParingVCDidAppearNotification"), 0, 0, 1);
  -[PNPPairingViewController becomeFirstResponder](self, "becomeFirstResponder");

}

- (void)_chargingStatusViewHostsLayoutIfNeeded
{
  -[PNPPairingView layoutIfNeeded](self->_pairingView, "layoutIfNeeded");
  -[PNPPencilHorizontalPresentationContainerView layoutIfNeeded](self->_horizontalPresentationPencilContainerView, "layoutIfNeeded");
}

- (void)_chargingStatusViewHostsSetupChargingViews
{
  -[PNPPairingView setChargingStatusView:](self->_pairingView, "setChargingStatusView:", self->_pairingChargingStatusView);
  -[PNPPencilHorizontalPresentationContainerView setChargingStatusView:](self->_horizontalPresentationPencilContainerView, "setChargingStatusView:", self->_horizontalChargingStatusView);
}

- (void)_chargingStatusViewHostsTeardownChargingViews
{
  -[PNPPairingView setChargingStatusView:](self->_pairingView, "setChargingStatusView:", 0);
  -[PNPPencilHorizontalPresentationContainerView setChargingStatusView:](self->_horizontalPresentationPencilContainerView, "setChargingStatusView:", 0);
}

- (void)_chargingStatusViewHostsSetShowsChargingStatusView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PNPPairingView setShowsChargingStatusView:](self->_pairingView, "setShowsChargingStatusView:");
  -[PNPPencilHorizontalPresentationContainerView setShowsChargingStatusView:](self->_horizontalPresentationPencilContainerView, "setShowsChargingStatusView:", v3);
}

- (void)_chargingStatusViewSetShowCharging:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PNPChargingStatusView setShowsCharging:](self->_pairingChargingStatusView, "setShowsCharging:");
  -[PNPChargingStatusView setShowsCharging:](self->_horizontalChargingStatusView, "setShowsCharging:", v3);
}

- (void)_chargingStatusViewSetChargingState:(int64_t)a3
{
  -[PNPChargingStatusView updateChargingState:](self->_pairingChargingStatusView, "updateChargingState:");
  -[PNPChargingStatusView updateChargingState:](self->_horizontalChargingStatusView, "updateChargingState:", a3);
}

- (void)_chargingStatusViewSetIsTransitioningToBatteryUI:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PNPChargingStatusView setIsTransitioningToBatteryUI:](self->_pairingChargingStatusView, "setIsTransitioningToBatteryUI:");
  -[PNPChargingStatusView setIsTransitioningToBatteryUI:](self->_horizontalChargingStatusView, "setIsTransitioningToBatteryUI:", v3);
}

- (void)_chargingStatusViewSetNeedsLayout
{
  -[PNPChargingStatusView setNeedsLayout](self->_pairingChargingStatusView, "setNeedsLayout");
  -[PNPChargingStatusView setNeedsLayout](self->_horizontalChargingStatusView, "setNeedsLayout");
}

- (void)_chargingStatusViewLayoutIfNeeded
{
  -[PNPChargingStatusView layoutIfNeeded](self->_pairingChargingStatusView, "layoutIfNeeded");
  -[PNPChargingStatusView layoutIfNeeded](self->_horizontalChargingStatusView, "layoutIfNeeded");
}

- (void)_chargingStatusViewUpdateConstraints
{
  -[PNPChargingStatusView setNeedsUpdateConstraints](self->_pairingChargingStatusView, "setNeedsUpdateConstraints");
  -[PNPChargingStatusView setNeedsUpdateConstraints](self->_horizontalChargingStatusView, "setNeedsUpdateConstraints");
}

- (void)_chargingStatusViewSetDeviceState:(id)a3
{
  PNPChargingStatusView *pairingChargingStatusView;
  id v5;

  pairingChargingStatusView = self->_pairingChargingStatusView;
  v5 = a3;
  -[PNPChargingStatusView setDeviceState:](pairingChargingStatusView, "setDeviceState:", v5);
  -[PNPChargingStatusView setDeviceState:](self->_horizontalChargingStatusView, "setDeviceState:", v5);

}

- (void)_actuallyTransitionToCharging
{
  PNPPlatterContainerView *v3;
  PNPPlatterContainerView *horizontalPencilPlatterContainerView;

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v3 = (PNPPlatterContainerView *)objc_claimAutoreleasedReturnValue();
  horizontalPencilPlatterContainerView = self->_horizontalPencilPlatterContainerView;

  if (v3 == horizontalPencilPlatterContainerView)
    -[PNPPairingViewController _actuallyTransitionToChargingBySlideOutAndPresent](self, "_actuallyTransitionToChargingBySlideOutAndPresent");
  else
    -[PNPPairingViewController _actuallyTransitionToChargingByMovingPlatter](self, "_actuallyTransitionToChargingByMovingPlatter");
}

- (void)_actuallyTransitionToChargingBySlideOutAndPresent
{
  PNPPlatterContainerView *wizardPlatterContainerView;
  double v4;
  void *v5;
  PNPPlatterContainerView *v6;
  _QWORD v7[5];

  self->_showingChargingUI = 1;
  -[PNPPairingView setShowsChargingStatusView:](self->_pairingView, "setShowsChargingStatusView:", 1);
  -[PNPPairingView setChargingStatusView:](self->_pairingView, "setChargingStatusView:", self->_pairingChargingStatusView);
  -[PNPChargingStatusView setShowsCharging:](self->_pairingChargingStatusView, "setShowsCharging:", 1);
  -[PNPChargingStatusView setChargingState:](self->_pairingChargingStatusView, "setChargingState:", 2);
  -[PNPChargingStatusView setIsTransitioningToBatteryUI:](self->_pairingChargingStatusView, "setIsTransitioningToBatteryUI:", 1);
  -[PNPChargingStatusView setNeedsUpdateConstraints](self->_pairingChargingStatusView, "setNeedsUpdateConstraints");
  -[PNPPairingView layoutIfNeeded](self->_pairingView, "layoutIfNeeded");
  -[PNPPairingViewController _chargingStatusViewSetIsTransitioningToBatteryUI:](self, "_chargingStatusViewSetIsTransitioningToBatteryUI:", 0);
  -[PNPPairingViewController _chargingStatusViewUpdateConstraints](self, "_chargingStatusViewUpdateConstraints");
  wizardPlatterContainerView = self->_wizardPlatterContainerView;
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", wizardPlatterContainerView, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v4);
  -[PNPPairingViewController platterDelegate](self, "platterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterPreferencesChangedForViewController:", self);

  -[PNPPlatterContainerView setNeedsLayout](self->_wizardPlatterContainerView, "setNeedsLayout");
  -[PNPPlatterContainerView layoutIfNeeded](self->_wizardPlatterContainerView, "layoutIfNeeded");
  PNPPlatterDismissPlatterContainerView(self->_horizontalPencilPlatterContainerView, 1, 0);
  v6 = self->_wizardPlatterContainerView;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__PNPPairingViewController__actuallyTransitionToChargingBySlideOutAndPresent__block_invoke;
  v7[3] = &unk_24F4E50A0;
  v7[4] = self;
  PNPPlatterPresentPlatterContainerView(v6, 1, v7);
}

void __77__PNPPairingViewController__actuallyTransitionToChargingBySlideOutAndPresent__block_invoke(uint64_t a1)
{
  dispatch_block_t v1;
  dispatch_time_t v2;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__PNPPairingViewController__actuallyTransitionToChargingBySlideOutAndPresent__block_invoke_2;
  block[3] = &unk_24F4E50A0;
  block[4] = *(_QWORD *)(a1 + 32);
  v1 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v2 = dispatch_time(0, 1500000000);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v1);

}

uint64_t __77__PNPPairingViewController__actuallyTransitionToChargingBySlideOutAndPresent__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewRequestsDismiss:", 0);
}

- (void)_actuallyTransitionToChargingByMovingPlatter
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[PNPPairingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  self->_showingChargingUI = 1;
  -[PNPPairingViewController _chargingStatusViewHostsSetupChargingViews](self, "_chargingStatusViewHostsSetupChargingViews");
  -[PNPPairingViewController _chargingStatusViewHostsSetShowsChargingStatusView:](self, "_chargingStatusViewHostsSetShowsChargingStatusView:", 0);
  -[PNPPairingViewController _chargingStatusViewHostsLayoutIfNeeded](self, "_chargingStatusViewHostsLayoutIfNeeded");
  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke;
  v5[3] = &unk_24F4E50A0;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke_2;
  v4[3] = &unk_24F4E50A0;
  -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v5, v4);
}

void __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_centerContainerViews");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetShowCharging:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsSetShowsChargingStatusView:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetChargingState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetIsTransitioningToBatteryUI:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsLayoutIfNeeded");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_currentPlatterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preferredCornerRadius");
  objc_msgSend(v2, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v3, objc_msgSend(*(id *)(a1 + 32), "preferredEdge"), v4);

  objc_msgSend(*(id *)(a1 + 32), "platterDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterPreferencesChangedForViewController:", *(_QWORD *)(a1 + 32));

}

void __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke_2(uint64_t a1)
{
  dispatch_block_t v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetIsTransitioningToBatteryUI:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewUpdateConstraints");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke_3;
  block[3] = &unk_24F4E50A0;
  block[4] = *(_QWORD *)(a1 + 32);
  v2 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v3 = dispatch_time(0, 1500000000);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], v2);

}

uint64_t __72__PNPPairingViewController__actuallyTransitionToChargingByMovingPlatter__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewRequestsDismiss:", 0);
}

- (void)_centerContainerViews
{
  -[PNPPlatterContainerView setPencilOffset:](self->_horizontalPencilPlatterContainerView, "setPencilOffset:", 0.0);
  -[PNPPlatterContainerView setPencilOffset:](self->_wizardPlatterContainerView, "setPencilOffset:", 0.0);
}

- (void)_offsetContainerViewsIfNecessary
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 < 1000.0)
  {

    v8 = 12.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    if (v7 >= 1000.0)
      v8 = 0.0;
    else
      v8 = 12.0;
  }
  -[PNPPlatterContainerView setPencilOffset:](self->_wizardPlatterContainerView, "setPencilOffset:", v8);
  -[PNPPlatterContainerView setPencilOffset:](self->_horizontalPencilPlatterContainerView, "setPencilOffset:", v8);
}

- (id)_effectivePencilView
{
  void *v3;
  int v4;
  PNPPencilView *v5;

  -[PNPPairingViewController deviceState](self, "deviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOnLeftOrRightSide");

  if (v4)
  {
    v5 = self->_horizontalPencilView;
  }
  else
  {
    -[PNPPairingView pencilView](self->_pairingView, "pencilView");
    v5 = (PNPPencilView *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_actuallyTransitionToSpinningPlatterWithDimmingState:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[PNPPairingViewController _offsetContainerViewsIfNecessary](self, "_offsetContainerViewsIfNecessary");
  -[PNPPairingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PNPPencilView prepareMovieForSpinningPencil:](self->_horizontalPencilView, "prepareMovieForSpinningPencil:", self->_deviceState);
  -[PNPPairingView pencilView](self->_pairingView, "pencilView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareMovieForSpinningPencil:", self->_deviceState);

  if (-[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState")
    && -[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState") != 1
    || (v7 = -[PNPPairingViewController _edgeToStickToPort](self, "_edgeToStickToPort"), v7 == 1)
    || v7 == 4)
  {
    -[PNPPairingViewController _morphToSpinningPencilWithDimmingState:](self, "_morphToSpinningPencilWithDimmingState:", a3);
  }
  else
  {
    -[PNPPairingViewController _dismissChargingAndPresentSpinningPencilWithDimmingState:](self, "_dismissChargingAndPresentSpinningPencilWithDimmingState:", a3);
  }
}

- (void)_morphToSpinningPencilWithDimmingState:(int64_t)a3
{
  _QWORD v3[6];

  self->_showingChargingUI = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__PNPPairingViewController__morphToSpinningPencilWithDimmingState___block_invoke;
  v3[3] = &unk_24F4E51B0;
  v3[4] = self;
  v3[5] = a3;
  -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v3, 0);
}

uint64_t __67__PNPPairingViewController__morphToSpinningPencilWithDimmingState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "platterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterPreferencesChangedForViewController:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_offsetContainerViewsIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsTeardownChargingViews");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsSetShowsChargingStatusView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setDimmingState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDimmingState:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_currentPlatterContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preferredCornerRadius");
  objc_msgSend(v3, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v4, objc_msgSend(*(id *)(a1 + 32), "preferredEdge"), v5);

  return objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsLayoutIfNeeded");
}

- (void)_dismissChargingAndPresentSpinningPencilWithDimmingState:(int64_t)a3
{
  void *v5;
  double v6;

  self->_showingChargingUI = 0;
  -[PNPPairingViewController _offsetContainerViewsIfNecessary](self, "_offsetContainerViewsIfNecessary");
  -[PNPPairingViewController _chargingStatusViewHostsTeardownChargingViews](self, "_chargingStatusViewHostsTeardownChargingViews");
  -[PNPPairingViewController _chargingStatusViewHostsSetShowsChargingStatusView:](self, "_chargingStatusViewHostsSetShowsChargingStatusView:", 0);
  -[PNPPairingView setState:](self->_pairingView, "setState:", 0);
  -[PNPPairingView layoutIfNeeded](self->_pairingView, "layoutIfNeeded");
  -[PNPPlatterContainerView setDimmingState:](self->_horizontalPencilPlatterContainerView, "setDimmingState:", a3);
  -[PNPPlatterContainerView setDimmingState:](self->_wizardPlatterContainerView, "setDimmingState:", a3);
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v5, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v6);

  -[PNPPairingViewController _chargingStatusViewHostsLayoutIfNeeded](self, "_chargingStatusViewHostsLayoutIfNeeded");
  -[PNPPairingViewController _hideOrShowAllContainerViewsIfNeeded](self, "_hideOrShowAllContainerViewsIfNeeded");
}

- (void)_transitionToChargingFrom:(int64_t)a3
{
  if (a3 == 1 && -[PNPChargingStatusView chargingState](self->_pairingChargingStatusView, "chargingState") == 1)
    -[PNPPairingViewController _transitionToChargingFromSpinner](self, "_transitionToChargingFromSpinner");
  else
    -[PNPPairingViewController _actuallyTransitionToCharging](self, "_actuallyTransitionToCharging");
}

- (void)_transitionToChargingFromSpinner
{
  double v3;
  id v4;

  v3 = CACurrentMediaTime() - self->_spinnerElapsedTime;
  if (v3 > 1.0
    || -[PNPChargingStatusView alphaOutName](self->_pairingChargingStatusView, "alphaOutName")
    || -[PNPChargingStatusView alphaOutName](self->_horizontalChargingStatusView, "alphaOutName"))
  {
    -[PNPPairingViewController _actuallyTransitionToCharging](self, "_actuallyTransitionToCharging");
  }
  else
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__actuallyTransitionToCharging, 0, 0, 1.0 - v3);
  }
}

- (CGSize)preferredContentSize
{
  int *v2;
  double v3;
  double v4;
  CGSize result;

  if (self->_showingChargingUI)
    v2 = &OBJC_IVAR___PNPPairingViewController__pairingChargingStatusView;
  else
    v2 = &OBJC_IVAR___PNPPairingViewController__pairingView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "intrinsicContentSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updatePreferredContentSize
{
  -[PNPPairingViewController preferredContentSize](self, "preferredContentSize");
  -[PNPPairingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewRequestsDismiss:(id)a3
{
  void *v4;
  _QWORD v5[5];

  self->_viewRequestsDismissCalled = 1;
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__PNPPairingViewController_viewRequestsDismiss___block_invoke;
  v5[3] = &unk_24F4E50A0;
  v5[4] = self;
  PNPPlatterDismissPlatterContainerView(v4, 1, v5);

}

uint64_t __48__PNPPairingViewController_viewRequestsDismiss___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (v3 = *(_QWORD **)(a1 + 32), v3[131]))
  {
    objc_msgSend(v3, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);

    if (v4 == v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 1048);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __48__PNPPairingViewController_viewRequestsDismiss___block_invoke_2;
      v9[3] = &unk_24F4E50A0;
      v9[4] = v6;
      return objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v9);
    }
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

uint64_t __48__PNPPairingViewController_viewRequestsDismiss___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPPairingViewController;
  -[PNPPairingViewController dismissViewControllerAnimated:completion:](&v5, sel_dismissViewControllerAnimated_completion_, a3, a4);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("PNPParingVCDidDisappearNotification"), 0, 0, 1);

}

- (void)setDeviceState:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PNPPairingViewController deviceState](self, "deviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "edge");

  objc_storeStrong((id *)&self->_deviceState, a3);
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v7, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v8);

  -[PNPPairingViewController platterDelegate](self, "platterDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "platterPreferencesChangedForViewController:", self);

  if (v6 && !self->_viewRequestsDismissCalled)
  {
    -[PNPPlatterContainerView setDismissUsingAlpha:](self->_wizardPlatterContainerView, "setDismissUsingAlpha:", 1);
    -[PNPPlatterContainerView setDismissUsingAlpha:](self->_horizontalPencilPlatterContainerView, "setDismissUsingAlpha:", 1);
    -[PNPPairingViewController _hideOrShowAllContainerViewsIfNeeded](self, "_hideOrShowAllContainerViewsIfNeeded");
    -[PNPPlatterContainerView setDismissUsingAlpha:](self->_wizardPlatterContainerView, "setDismissUsingAlpha:", 0);
    -[PNPPlatterContainerView setDismissUsingAlpha:](self->_horizontalPencilPlatterContainerView, "setDismissUsingAlpha:", 0);
  }

}

- (void)_updateSubviewDeviceStateForContainerView:(id)a3
{
  void *v4;
  PNPPlatterContainerView *v5;
  PNPPlatterContainerView *wizardPlatterContainerView;
  uint64_t v7;
  void *v8;
  id v9;

  -[PNPPairingViewController deviceState](self, "deviceState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController _chargingStatusViewSetDeviceState:](self, "_chargingStatusViewSetDeviceState:", v4);

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v5 = (PNPPlatterContainerView *)objc_claimAutoreleasedReturnValue();
  wizardPlatterContainerView = self->_wizardPlatterContainerView;

  if (v5 == wizardPlatterContainerView)
    v7 = 976;
  else
    v7 = 1000;
  v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
  -[PNPPairingViewController deviceState](self, "deviceState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceState:");

}

- (void)_hideOrShowAllContainerViewsIfNeeded
{
  -[PNPPairingViewController _hideOrShowContainerViewIfNeeded:](self, "_hideOrShowContainerViewIfNeeded:", self->_wizardPlatterContainerView);
  -[PNPPairingViewController _hideOrShowContainerViewIfNeeded:](self, "_hideOrShowContainerViewIfNeeded:", self->_horizontalPencilPlatterContainerView);
}

- (void)_hideOrShowContainerViewIfNeeded:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v11)
  {

  }
  else
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v11, "presented");

    if (v6)
      PNPPlatterDismissPlatterContainerView(v11, 1, 0);
  }
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v11)
    goto LABEL_8;
  v8 = objc_msgSend(v11, "presented");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDF6F90];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__PNPPairingViewController__hideOrShowContainerViewIfNeeded___block_invoke;
    v12[3] = &unk_24F4E50A0;
    v10 = v11;
    v13 = v10;
    objc_msgSend(v9, "performWithoutAnimation:", v12);
    PNPPlatterPresentPlatterContainerView(v10, 1, 0);
    v7 = v13;
LABEL_8:

  }
}

uint64_t __61__PNPPairingViewController__hideOrShowContainerViewIfNeeded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)_showConnectingAnimationUI
{
  -[PNPPairingViewController _chargingStatusViewSetChargingState:](self, "_chargingStatusViewSetChargingState:", 1);
  self->_spinnerElapsedTime = CACurrentMediaTime();
  -[PNPPairingViewController _chargingStatusViewSetNeedsLayout](self, "_chargingStatusViewSetNeedsLayout");
  -[PNPPairingViewController _chargingStatusViewLayoutIfNeeded](self, "_chargingStatusViewLayoutIfNeeded");
}

- (void)_resetTimeoutTimer
{
  NSTimer *v3;
  NSTimer *timeoutTimer;

  -[PNPPairingViewController _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_pairingFailed, 0, 0, 20.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;

}

- (void)_resetTimerForWizard
{
  NSTimer *v3;
  NSTimer *timeoutTimer;

  -[PNPPairingViewController _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_pairingFailed, 0, 0, 240.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;

}

- (void)_cancelTimeoutTimer
{
  NSTimer *timeoutTimer;
  NSTimer *v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    -[NSTimer invalidate](timeoutTimer, "invalidate");
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (void)showPairingPrompt
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];
  _QWORD v6[4];
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[5];

  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__PNPPairingViewController_showPairingPrompt__block_invoke;
  v8[3] = &unk_24F4E59F0;
  v8[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2E6AA4](v8, a2);
  if (-[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState") == 1)
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __45__PNPPairingViewController_showPairingPrompt__block_invoke_2;
    v6[3] = &unk_24F4E5188;
    v7 = v4;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __45__PNPPairingViewController_showPairingPrompt__block_invoke_3;
    v5[3] = &unk_24F4E50A0;
    v5[4] = self;
    -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v6, v5);

  }
  else
  {
    v4[2](v4, 0);
  }

}

uint64_t __45__PNPPairingViewController_showPairingPrompt__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setPairingViewControllerState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsSetupChargingViews");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetChargingState:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setDimmingState:", objc_msgSend(*(id *)(a1 + 32), "_dimmingState"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDimmingState:", objc_msgSend(*(id *)(a1 + 32), "_dimmingState"));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePillUIAnimated:", a2);
}

uint64_t __45__PNPPairingViewController_showPairingPrompt__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__PNPPairingViewController_showPairingPrompt__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetIsTransitioningToBatteryUI:", 0);
}

- (void)showGenericBatteryUI
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];
  _QWORD v6[4];
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[5];

  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__PNPPairingViewController_showGenericBatteryUI__block_invoke;
  v8[3] = &unk_24F4E59F0;
  v8[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2E6AA4](v8, a2);
  if (-[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState"))
  {
    v4[2](v4, 0);
    -[PNPPairingViewController _startConnectingUITimer](self, "_startConnectingUITimer");
  }
  else
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __48__PNPPairingViewController_showGenericBatteryUI__block_invoke_2;
    v6[3] = &unk_24F4E5188;
    v7 = v4;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __48__PNPPairingViewController_showGenericBatteryUI__block_invoke_3;
    v5[3] = &unk_24F4E50A0;
    v5[4] = self;
    -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v6, v5);

  }
}

uint64_t __48__PNPPairingViewController_showGenericBatteryUI__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setPairingViewControllerState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsSetupChargingViews");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetChargingState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePillUIAnimated:", a2);
}

uint64_t __48__PNPPairingViewController_showGenericBatteryUI__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__PNPPairingViewController_showGenericBatteryUI__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetIsTransitioningToBatteryUI:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startConnectingUITimer");
}

- (void)showNeedsInternetAlert
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];
  _QWORD v6[4];
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[5];

  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke;
  v8[3] = &unk_24F4E59F0;
  v8[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2E6AA4](v8, a2);
  if (-[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState") == 1)
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke_2;
    v6[3] = &unk_24F4E5188;
    v7 = v4;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke_3;
    v5[3] = &unk_24F4E50A0;
    v5[4] = self;
    -[PNPPairingViewController _performAnimations:completion:](self, "_performAnimations:completion:", v6, v5);

  }
  else
  {
    v4[2](v4, 0);
  }

}

uint64_t __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setPairingViewControllerState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewHostsSetupChargingViews");
  objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetChargingState:", 3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setDimmingState:", objc_msgSend(*(id *)(a1 + 32), "_dimmingState"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDimmingState:", objc_msgSend(*(id *)(a1 + 32), "_dimmingState"));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePillUIAnimated:", a2);
}

uint64_t __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PNPPairingViewController_showNeedsInternetAlert__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chargingStatusViewSetIsTransitioningToBatteryUI:", 0);
}

- (void)_updatePillUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;

  v3 = a3;
  self->_showingChargingUI = 1;
  -[PNPPairingViewController _centerContainerViews](self, "_centerContainerViews");
  if (v3)
    -[PNPPairingViewController _chargingStatusViewSetIsTransitioningToBatteryUI:](self, "_chargingStatusViewSetIsTransitioningToBatteryUI:", 1);
  -[PNPPairingViewController _chargingStatusViewHostsSetShowsChargingStatusView:](self, "_chargingStatusViewHostsSetShowsChargingStatusView:", 1);
  -[PNPPairingViewController _chargingStatusViewHostsLayoutIfNeeded](self, "_chargingStatusViewHostsLayoutIfNeeded");
  -[PNPPairingViewController _chargingStatusViewUpdateConstraints](self, "_chargingStatusViewUpdateConstraints");
  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPairingViewController preferredCornerRadius](self, "preferredCornerRadius");
  -[PNPPairingViewController _updatePlatterContainerView:toPreferredCornerRadius:edge:](self, "_updatePlatterContainerView:toPreferredCornerRadius:edge:", v5, -[PNPPairingViewController preferredEdge](self, "preferredEdge"), v6);

  -[PNPPairingViewController platterDelegate](self, "platterDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "platterPreferencesChangedForViewController:", self);

  -[PNPPairingViewController _resetTimeoutTimer](self, "_resetTimeoutTimer");
}

- (int64_t)_dimmingState
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SharingViewService"));
  return v4;
}

- (void)pairingStarted
{
  -[PNPPairingViewController pairingStartedWithDimmingState:](self, "pairingStartedWithDimmingState:", -[PNPPairingViewController _dimmingState](self, "_dimmingState"));
}

- (void)showPairingPromptAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIAlertController *v11;
  UIAlertController *alertVC;
  uint64_t v13;
  void *v14;
  void *v15;
  UIAlertController *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  PencilPairingUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME"), &stru_24F4E5CD0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PencilPairingUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAIRING_PROMPT"), &stru_24F4E5CD0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PencilPairingUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONNECT"), &stru_24F4E5CD0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PencilPairingUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F4E5CD0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_alertVC)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
    v11 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertVC = self->_alertVC;
    self->_alertVC = v11;

    v13 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__PNPPairingViewController_showPairingPromptAlert__block_invoke;
    v19[3] = &unk_24F4E5AF0;
    v19[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 0, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __50__PNPPairingViewController_showPairingPromptAlert__block_invoke_2;
    v18[3] = &unk_24F4E5AF0;
    v18[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "_actionWithTitle:image:style:handler:shouldDismissHandler:", v10, 0, 1, v18, &__block_literal_global_59);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](self->_alertVC, "addAction:", v15);
    -[UIAlertController addAction:](self->_alertVC, "addAction:", v14);
    -[UIAlertController setPreferredAction:](self->_alertVC, "setPreferredAction:", v14);
    v16 = self->_alertVC;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __50__PNPPairingViewController_showPairingPromptAlert__block_invoke_4;
    v17[3] = &unk_24F4E50A0;
    v17[4] = self;
    -[PNPPairingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, v17);

  }
}

uint64_t __50__PNPPairingViewController_showPairingPromptAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapOnConnectButton");
}

uint64_t __50__PNPPairingViewController_showPairingPromptAlert__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didTapOnCancelButton");
  return objc_msgSend(*(id *)(a1 + 32), "pairingFailed");
}

uint64_t __50__PNPPairingViewController_showPairingPromptAlert__block_invoke_3()
{
  return 0;
}

uint64_t __50__PNPPairingViewController_showPairingPromptAlert__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetTimeoutTimer");
}

- (void)pairingStartedWithDimming:(BOOL)a3
{
  -[PNPPairingViewController pairingStartedWithDimmingState:](self, "pairingStartedWithDimmingState:", a3);
}

- (void)pairingStartedWithDimmingState:(int64_t)a3
{
  -[PNPPairingViewController _actuallyTransitionToSpinningPlatterWithDimmingState:](self, "_actuallyTransitionToSpinningPlatterWithDimmingState:", a3);
  -[PNPPairingViewController setPairingViewControllerState:](self, "setPairingViewControllerState:", 3);
  -[PNPPairingViewController _resetTimeoutTimer](self, "_resetTimeoutTimer");
}

- (void)pairingStartedWithDimming:(BOOL)a3 deviceType:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;

  v5 = a3;
  -[PNPPairingViewController deviceState](self, "deviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceType:", a4);

  -[PNPPairingViewController pairingStartedWithDimming:](self, "pairingStartedWithDimming:", v5);
}

- (void)pairingSucceeded
{
  -[PNPPairingViewController pairingSucceededWithShouldShowWhatsNew:deviceType:](self, "pairingSucceededWithShouldShowWhatsNew:deviceType:", 0, 0);
}

- (void)pairingSucceededWithShouldShowWhatsNew:(BOOL)a3
{
  -[PNPPairingViewController pairingSucceededWithShouldShowWhatsNew:deviceType:](self, "pairingSucceededWithShouldShowWhatsNew:deviceType:", a3, 2);
}

- (void)pairingSucceededWithShouldShowWhatsNew:(BOOL)a3 deviceType:(int64_t)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[PNPPairingViewController setPairingViewControllerState:](self, "setPairingViewControllerState:", 4);
  -[PNPPairingView setShouldShowWhatsNew:](self->_pairingView, "setShouldShowWhatsNew:", v5);
  -[PNPPairingView setDeviceType:](self->_pairingView, "setDeviceType:", a4);
  -[PNPPairingViewController _transitionToWizard](self, "_transitionToWizard");
  -[PNPPairingViewController _resetTimerForWizard](self, "_resetTimerForWizard");
}

- (void)pairingSucceededSubsequently
{
  int64_t v3;

  v3 = -[PNPPairingViewController pairingViewControllerState](self, "pairingViewControllerState");
  -[PNPPairingViewController setPairingViewControllerState:](self, "setPairingViewControllerState:", 5);
  -[PNPPairingViewController _transitionToChargingFrom:](self, "_transitionToChargingFrom:", v3);
  -[PNPPairingViewController _resetTimeoutTimer](self, "_resetTimeoutTimer");
}

- (void)pairingFailed
{
  -[PNPPairingViewController setPairingViewControllerState:](self, "setPairingViewControllerState:", 6);
  -[PNPPairingViewController viewRequestsDismiss:](self, "viewRequestsDismiss:", 0);
}

- (void)setPairingViewControllerState:(int64_t)a3
{
  self->_pairingViewControllerState = a3;
  -[UIPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL);
}

- (unint64_t)preferredEdge
{
  void *v4;
  unint64_t v5;

  if (self->_showingChargingUI)
    return 1;
  if (-[PNPPairingView state](self->_pairingView, "state"))
    return 0;
  -[PNPPairingViewController deviceState](self, "deviceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "edge");

  return v5;
}

- (double)preferredCornerRadius
{
  double v4;
  double v5;

  if (-[PNPPairingView state](self->_pairingView, "state"))
    return 16.0;
  -[PNPPairingViewController preferredContentSize](self, "preferredContentSize");
  if (v4 >= v5)
    v4 = v5;
  return v4 * 0.5;
}

- (double)_translationAmountForDismiss
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.25;

  return v5;
}

- (void)_handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double y;
  double v12;
  double v13;
  _QWORD v14[5];

  v4 = a3;
  -[PNPPairingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (objc_msgSend(v4, "state") == 2)
  {
    v10 = v9 * 0.05;
    if (v9 < 0.0)
      v10 = v9;
    self->_animationTranslation.x = v7 * 0.1;
    self->_animationTranslation.y = v10;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "state") != 3 && objc_msgSend(v4, "state") != 4 && objc_msgSend(v4, "state") != 5)
  {
LABEL_5:
    -[PNPPairingViewController _updateAnimationTranslation](self, "_updateAnimationTranslation");
    goto LABEL_13;
  }
  y = self->_animationTranslation.y;
  if (y >= 0.0
    || (v12 = fabs(y),
        -[PNPPairingViewController _translationAmountForDismiss](self, "_translationAmountForDismiss"),
        v12 <= v13))
  {
    self->_animationTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __46__PNPPairingViewController__handlePanGesture___block_invoke;
    v14[3] = &unk_24F4E50A0;
    v14[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2054, v14, 0);
  }
  else
  {
    -[PNPPairingViewController viewRequestsDismiss:](self, "viewRequestsDismiss:", 0);
  }
LABEL_13:

}

uint64_t __46__PNPPairingViewController__handlePanGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnimationTranslation");
}

- (void)_updateAnimationTranslation
{
  void *v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[PNPPairingViewController _currentPlatterContainerView](self, "_currentPlatterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v6, 0.0, self->_animationTranslation.y);
  v5 = v6;
  objc_msgSend(v3, "setAnimationTranslation:", &v5);
  -[PNPPairingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)didTapOnConnectButton
{
  PNPPairingViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "didTapToPairPencil");

    }
  }
}

- (void)didTapOnCancelButton
{
  PNPPairingViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "didTapCancelPairing");

    }
  }
}

- (void)didCompleteOneRevolution
{
  PNPPairingViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "didCompleteOneRevolutionOfSpinningPencil");

    }
  }
}

- (PNPPlatterViewControllerPlatterDelegate)platterDelegate
{
  return (PNPPlatterViewControllerPlatterDelegate *)objc_loadWeakRetained((id *)&self->platterDelegate);
}

- (void)setPlatterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->platterDelegate, a3);
}

- (PNPViewControllerAppearanceDelegate)appearanceDelegate
{
  return (PNPViewControllerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->appearanceDelegate, a3);
}

- (PNPPairingViewControllerDelegate)delegate
{
  return (PNPPairingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)pairingViewControllerState
{
  return self->_pairingViewControllerState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_initialTimer, 0);
  objc_storeStrong((id *)&self->_alertVC, 0);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_horizontalChargingStatusView, 0);
  objc_storeStrong((id *)&self->_horizontalPencilView, 0);
  objc_storeStrong((id *)&self->_horizontalPresentationPencilContainerView, 0);
  objc_storeStrong((id *)&self->_horizontalPencilPlatterContainerView, 0);
  objc_storeStrong((id *)&self->_pairingChargingStatusView, 0);
  objc_storeStrong((id *)&self->_pairingView, 0);
  objc_storeStrong((id *)&self->_wizardPlatterContainerView, 0);
}

@end
