@implementation SBDashBoardEmergencyDialerController

- (SBDashBoardEmergencyDialerController)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardEmergencyDialerController *v6;
  SBDashBoardEmergencyDialerController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDashBoardEmergencyDialerController;
  v6 = -[SBDashBoardEmergencyDialerController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addKeyObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardEmergencyDialerController;
  -[SBDashBoardEmergencyDialerController dealloc](&v4, sel_dealloc);
}

- (BOOL)isMakingEmergencyCall
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);
  v3 = objc_msgSend(WeakRetained, "bs_isAppearingOrAppeared");

  return v3;
}

- (void)launchEmergencyDialer
{
  -[SBDashBoardEmergencyDialerController launchEmergencyDialerAnimated:](self, "launchEmergencyDialerAnimated:", 1);
}

- (void)launchEmergencyDialerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SBDashBoardEmergencyDialerViewController **p_emergencyDialerViewController;
  id WeakRetained;
  SBDashBoardEmergencyDialerViewController *v7;
  CSCoverSheetViewController *coverSheetViewController;
  _QWORD v9[4];
  BOOL v10;

  v3 = a3;
  p_emergencyDialerViewController = &self->_emergencyDialerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);

  if (!WeakRetained)
  {
    v7 = objc_alloc_init(SBDashBoardEmergencyDialerViewController);
    objc_storeWeak((id *)p_emergencyDialerViewController, v7);
    coverSheetViewController = self->_coverSheetViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__SBDashBoardEmergencyDialerController_launchEmergencyDialerAnimated___block_invoke;
    v9[3] = &__block_descriptor_33_e5_v8__0l;
    v10 = v3;
    -[CSCoverSheetViewController _presentModalViewController:animated:completion:](coverSheetViewController, "_presentModalViewController:animated:completion:", v7, v3, v9);

  }
}

void __70__SBDashBoardEmergencyDialerController_launchEmergencyDialerAnimated___block_invoke(uint64_t a1)
{
  id v2;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isCoverSheetHostingAnApp"))
    objc_msgSend(v2, "setCoverSheetPresented:animated:withCompletion:", 1, *(unsigned __int8 *)(a1 + 32), 0);

}

- (void)emergencyDialerExitedWithError:(id)a3
{
  -[SBDashBoardEmergencyDialerController exitEmergencyDialerAnimated:](self, "exitEmergencyDialerAnimated:", 0);
}

- (void)exitEmergencyDialerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CSCoverSheetViewController *coverSheetViewController;
  id WeakRetained;

  v3 = a3;
  coverSheetViewController = self->_coverSheetViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_emergencyDialerViewController);
  -[CSCoverSheetViewController _dismissModalViewController:animated:completion:](coverSheetViewController, "_dismissModalViewController:animated:completion:", WeakRetained, v3, 0);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D1BBD8];
  v6 = a4;
  objc_msgSend(v5, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("showEmergencyDialer"));

  if ((_DWORD)v5)
  {
    if (objc_msgSend(v7, "showEmergencyDialer"))
      -[SBDashBoardEmergencyDialerController launchEmergencyDialer](self, "launchEmergencyDialer");
    else
      -[SBDashBoardEmergencyDialerController exitEmergencyDialerAnimated:](self, "exitEmergencyDialerAnimated:", 1);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_emergencyDialerViewController);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end
