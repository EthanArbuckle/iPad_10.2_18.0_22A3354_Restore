@implementation _SBStatusBarWindowRootViewController

- (_SBStatusBarWindowRootViewController)initWithWindow:(id)a3
{
  id v4;
  _SBStatusBarWindowRootViewController *v5;
  _SBStatusBarWindowRootViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBStatusBarWindowRootViewController;
  v5 = -[_SBStatusBarWindowRootViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_statusBarWindow, v4);

  return v6;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBStatusBarWindowRootViewController;
  -[_SBStatusBarWindowRootViewController loadView](&v4, sel_loadView);
  -[_SBStatusBarWindowRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id WeakRetained;
  int v4;
  char v5;
  unint64_t v6;
  void *v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStatusBar")))
  {
    v4 = __sb__runningInSpringBoard();
    v5 = v4;
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
      {

LABEL_12:
        v6 = 2;
        goto LABEL_13;
      }
    }
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExtendedDisplayWindowScene");

    if ((v5 & 1) == 0)
    if ((v8 & 1) != 0)
      goto LABEL_12;
    v6 = 30;
  }
  else
  {
    objc_msgSend(WeakRetained, "orientation");
    v6 = SBFInterfaceOrientationMaskForInterfaceOrientation();
  }
LABEL_13:

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SBStatusBarWindowRootViewController;
  -[_SBStatusBarWindowRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleStatusBar")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
    objc_msgSend(WeakRetained, "statusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(WeakRetained, "_toWindowOrientation");
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v16[3] = &unk_1E8EB5AA0;
    v17 = v9;
    v18 = WeakRetained;
    v19 = v10;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v14[3] = &unk_1E8E9EA28;
    v15 = v17;
    v12 = v17;
    v13 = WeakRetained;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, v14);

  }
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBStatusBarWindow)statusBarWindow
{
  return (SBStatusBarWindow *)objc_loadWeakRetained((id *)&self->_statusBarWindow);
}

- (void)setStatusBarWindow:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarWindow);
}

@end
