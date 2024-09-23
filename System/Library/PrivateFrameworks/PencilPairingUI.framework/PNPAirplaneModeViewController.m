@implementation PNPAirplaneModeViewController

- (PNPAirplaneModeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PNPAirplaneModeViewController *v4;
  void *v5;
  PNPPlatterTransitioningDelegate *v6;
  PNPPlatterTransitioningDelegate *platterTransitioningDelegate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PNPAirplaneModeViewController;
  v4 = -[PNPAirplaneModeViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = (void *)objc_opt_new();
  -[PNPAirplaneModeViewController setDeviceState:](v4, "setDeviceState:", v5);

  v6 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v6;

  -[PNPAirplaneModeViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4->_platterTransitioningDelegate);
  -[PNPAirplaneModeViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
  return v4;
}

- (void)setDeviceState:(id)a3
{
  id v4;

  -[PNPAirplaneModeView setDeviceState:](self->_airplaneModeView, "setDeviceState:", a3);
  -[PNPAirplaneModeViewController _platterContainerView](self, "_platterContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdge:", -[PNPAirplaneModeViewController preferredEdge](self, "preferredEdge"));

}

- (PNPDeviceState)deviceState
{
  return -[PNPAirplaneModeView deviceState](self->_airplaneModeView, "deviceState");
}

- (void)loadView
{
  PNPPlatterContainerView *v3;

  v3 = objc_alloc_init(PNPPlatterContainerView);
  -[PNPAirplaneModeViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  PNPAirplaneModeView *v3;
  PNPAirplaneModeView *airplaneModeView;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = -[PNPAirplaneModeView initWithFrame:]([PNPAirplaneModeView alloc], "initWithFrame:", 0.0, 0.0, 1000.0, 1000.0);
  airplaneModeView = self->_airplaneModeView;
  self->_airplaneModeView = v3;

  -[PNPAirplaneModeView setBluetoothDelegate:](self->_airplaneModeView, "setBluetoothDelegate:", self);
  -[PNPAirplaneModeViewController _platterContainerView](self, "_platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentView:", self->_airplaneModeView);

  -[PNPAirplaneModeViewController _platterContainerView](self, "_platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEdge:", -[PNPAirplaneModeViewController preferredEdge](self, "preferredEdge"));

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  -[PNPAirplaneModeViewController _platterContainerView](self, "_platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__PNPAirplaneModeViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_24F4E50A0;
  v6[4] = self;
  PNPPlatterPresentPlatterContainerView(v5, v3, v6);

}

void __47__PNPAirplaneModeViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_platterContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PNPChargingStatusConfigureAutoDismissWithTime(v1, v2, 4.0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  CGSize v10;

  height = a3.height;
  width = a3.width;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__PNPAirplaneModeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24F4E50C8;
  v10 = a3;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, &__block_literal_global_8);
  v8.receiver = self;
  v8.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __84__PNPAirplaneModeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPAirplaneModeViewController;
  -[PNPAirplaneModeViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PNPAirplaneModeViewController appearanceDelegate](self, "appearanceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidDismiss:", self);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PNPAirplaneModeView intrinsicContentSize](self->_airplaneModeView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)preferredEdge
{
  return 1;
}

- (void)didTapOnBluetoothButton
{
  PNPAirplaneModeBluetoothDelegate **p_delegate;
  id WeakRetained;
  id v4;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v4, "didRequestEnablingBluetooth");

  }
}

- (void)dismissPill
{
  void *v3;
  _QWORD v4[5];

  -[PNPAirplaneModeViewController _platterContainerView](self, "_platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__PNPAirplaneModeViewController_dismissPill__block_invoke;
  v4[3] = &unk_24F4E50A0;
  v4[4] = self;
  PNPPlatterPresentPlatterContainerView(v3, 1, v4);

}

void __44__PNPAirplaneModeViewController_dismissPill__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_platterContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PNPChargingStatusConfigureAutoDismissWithTime(v1, v2, 0.0);

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

- (PNPAirplaneModeBluetoothDelegate)delegate
{
  return (PNPAirplaneModeBluetoothDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_airplaneModeView, 0);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
}

@end
