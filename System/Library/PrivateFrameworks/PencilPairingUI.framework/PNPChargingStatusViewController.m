@implementation PNPChargingStatusViewController

- (PNPChargingStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PNPChargingStatusViewController *v4;
  void *v5;
  PNPPlatterTransitioningDelegate *v6;
  PNPPlatterTransitioningDelegate *platterTransitioningDelegate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PNPChargingStatusViewController;
  v4 = -[PNPChargingStatusViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = (void *)objc_opt_new();
  -[PNPChargingStatusViewController setDeviceState:](v4, "setDeviceState:", v5);

  v6 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v6;

  -[PNPChargingStatusViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4->_platterTransitioningDelegate);
  -[PNPChargingStatusViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
  return v4;
}

- (void)setDeviceState:(id)a3
{
  PNPChargingStatusView *chargingStatusView;
  id v5;
  uint64_t v6;

  chargingStatusView = self->_chargingStatusView;
  v5 = a3;
  -[PNPChargingStatusView setDeviceState:](chargingStatusView, "setDeviceState:", v5);
  -[PNPChargingStatusViewController _platterContainerView](self, "_platterContainerView");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setEdge:", objc_msgSend(v5, "edge"));

  LOBYTE(v6) = objc_msgSend(v5, "batteryLevelUnknown");
  if ((v6 & 1) == 0)
    -[PNPChargingStatusViewController _configureAutoDismiss](self, "_configureAutoDismiss");
}

- (PNPDeviceState)deviceState
{
  return -[PNPChargingStatusView deviceState](self->_chargingStatusView, "deviceState");
}

- (void)loadView
{
  PNPPlatterContainerView *v3;

  v3 = objc_alloc_init(PNPPlatterContainerView);
  -[PNPChargingStatusViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  PNPChargingStatusView *v3;
  PNPChargingStatusView *chargingStatusView;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PNPChargingStatusViewController;
  -[PNPChargingStatusViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = -[PNPChargingStatusView initWithFrame:]([PNPChargingStatusView alloc], "initWithFrame:", 0.0, 0.0, 1000.0, 1000.0);
  chargingStatusView = self->_chargingStatusView;
  self->_chargingStatusView = v3;

  -[PNPChargingStatusViewController _platterContainerView](self, "_platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentView:", self->_chargingStatusView);

  -[PNPChargingStatusViewController _platterContainerView](self, "_platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEdge:", -[PNPChargingStatusViewController preferredEdge](self, "preferredEdge"));

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v3 = a3;
  +[PencilSettings sharedPencilSettings](PencilSettings, "sharedPencilSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateObsoletedAXOpaqueTouchSetting");

  v8.receiver = self;
  v8.super_class = (Class)PNPChargingStatusViewController;
  -[PNPChargingStatusViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  -[PNPChargingStatusViewController _platterContainerView](self, "_platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__PNPChargingStatusViewController_viewDidAppear___block_invoke;
  v7[3] = &unk_24F4E50A0;
  v7[4] = self;
  PNPPlatterPresentPlatterContainerView(v6, v3, v7);

}

void __49__PNPChargingStatusViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_platterContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PNPChargingStatusConfigureAutoDismissWithTime(v1, v2, 8.0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];
  CGSize v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __86__PNPChargingStatusViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_24F4E50C8;
  v5 = a3;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

void __86__PNPChargingStatusViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *MEMORY[0x24BDBF090];
  v2 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_platterContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

- (void)_configureAutoDismiss
{
  id v3;

  -[PNPChargingStatusViewController _platterContainerView](self, "_platterContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PNPChargingStatusConfigureAutoDismiss(self, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPChargingStatusViewController;
  -[PNPChargingStatusViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PNPChargingStatusViewController appearanceDelegate](self, "appearanceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidDismiss:", self);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PNPChargingStatusView intrinsicContentSize](self->_chargingStatusView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)preferredEdge
{
  void *v2;
  unint64_t v3;

  -[PNPChargingStatusViewController deviceState](self, "deviceState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "edge");

  return v3;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_chargingStatusView, 0);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
}

@end
