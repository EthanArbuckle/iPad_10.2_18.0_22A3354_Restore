@implementation PNPLockScreenViewController

- (PNPLockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PNPLockScreenViewController *v4;
  void *v5;
  PNPPlatterTransitioningDelegate *v6;
  PNPPlatterTransitioningDelegate *platterTransitioningDelegate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PNPLockScreenViewController;
  v4 = -[PNPLockScreenViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = (void *)objc_opt_new();
  -[PNPLockScreenViewController setDeviceState:](v4, "setDeviceState:", v5);

  v6 = objc_alloc_init(PNPPlatterTransitioningDelegate);
  platterTransitioningDelegate = v4->_platterTransitioningDelegate;
  v4->_platterTransitioningDelegate = v6;

  -[PNPLockScreenViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4->_platterTransitioningDelegate);
  -[PNPLockScreenViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDeviceState:(id)a3
{
  id v4;

  -[PNPDeviceStateConfigurable setDeviceState:](self->_pillView, "setDeviceState:", a3);
  -[PNPLockScreenViewController _platterContainerView](self, "_platterContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdge:", -[PNPLockScreenViewController preferredEdge](self, "preferredEdge"));

}

- (PNPDeviceState)deviceState
{
  return (PNPDeviceState *)-[PNPDeviceStateConfigurable deviceState](self->_pillView, "deviceState");
}

- (void)loadView
{
  PNPPlatterContainerView *v3;

  v3 = objc_alloc_init(PNPPlatterContainerView);
  -[PNPLockScreenViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  PNPStackedPillView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PNPDeviceStateConfigurable *v8;
  PNPDeviceStateConfigurable *pillView;
  PNPDeviceStateConfigurable *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = [PNPStackedPillView alloc];
  PencilPairingUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NAME"), &stru_24F4E5CD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PencilPairingUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNLOCK"), &stru_24F4E5CD0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PNPStackedPillView initWithFrame:topString:bottomString:](v3, "initWithFrame:topString:bottomString:", v5, v7, 0.0, 0.0, 1000.0, 1000.0);

  pillView = self->_pillView;
  self->_pillView = v8;
  v10 = v8;

  -[PNPLockScreenViewController _platterContainerView](self, "_platterContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentView:", self->_pillView);

  -[PNPLockScreenViewController _platterContainerView](self, "_platterContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEdge:", -[PNPLockScreenViewController preferredEdge](self, "preferredEdge"));

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  -[PNPLockScreenViewController _platterContainerView](self, "_platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__PNPLockScreenViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_24F4E50A0;
  v6[4] = self;
  PNPPlatterPresentPlatterContainerView(v5, v3, v6);

}

void __45__PNPLockScreenViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_platterContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PNPChargingStatusConfigureAutoDismiss(v1, v2);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PNPLockScreenViewController appearanceDelegate](self, "appearanceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidDismiss:", self);

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
  v9[2] = __82__PNPLockScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24F4E50C8;
  v10 = a3;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, &__block_literal_global_7);
  v8.receiver = self;
  v8.super_class = (Class)PNPLockScreenViewController;
  -[PNPLockScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __82__PNPLockScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
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

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PNPDeviceStateConfigurable intrinsicContentSize](self->_pillView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)preferredEdge
{
  return 1;
}

- (void)dismissPill
{
  void *v3;
  _QWORD v4[5];

  -[PNPLockScreenViewController _platterContainerView](self, "_platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__PNPLockScreenViewController_dismissPill__block_invoke;
  v4[3] = &unk_24F4E50A0;
  v4[4] = self;
  PNPPlatterPresentPlatterContainerView(v3, 1, v4);

}

void __42__PNPLockScreenViewController_dismissPill__block_invoke(uint64_t a1)
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

- (PNPDeviceStateConfigurable)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_destroyWeak((id *)&self->appearanceDelegate);
  objc_destroyWeak((id *)&self->platterDelegate);
  objc_storeStrong((id *)&self->_platterTransitioningDelegate, 0);
}

@end
