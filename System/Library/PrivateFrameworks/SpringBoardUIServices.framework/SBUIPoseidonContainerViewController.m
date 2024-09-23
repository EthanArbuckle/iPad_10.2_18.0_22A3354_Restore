@implementation SBUIPoseidonContainerViewController

- (SBUIPoseidonContainerViewController)initWithAuthenticationInformationProvider:(id)a3
{
  id v4;
  SBUIPoseidonContainerViewController *v5;
  SBUIPoseidonContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPoseidonContainerViewController;
  v5 = -[SBUIPoseidonContainerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SBUIPoseidonContainerViewController setAuthenticationInformationProvider:](v5, "setAuthenticationInformationProvider:", v4);

  return v6;
}

- (void)loadView
{
  SBUIPoseidonIconView *v3;

  v3 = objc_alloc_init(SBUIPoseidonIconView);
  -[SBUIPoseidonIconView setDelegate:](v3, "setDelegate:", self);
  -[SBUIPoseidonIconView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
  -[SBUIPoseidonContainerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPoseidonContainerViewController;
  -[SBUIPoseidonContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBUIPoseidonContainerViewController _updateRotation](self, "_updateRotation");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)SBUIPoseidonContainerViewController;
  v7 = a4;
  -[SBUIPoseidonContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(&v15, 0, sizeof(v15));
  CGAffineTransformRotate(&v16, &v15, -1.0e-13);
  objc_msgSend(v9, "setTransform:", &v16);
  if (v9)
    objc_msgSend(v9, "localTransform");
  else
    memset(&v13, 0, sizeof(v13));
  CGAffineTransformRotate(&v14, &v13, 1.0e-13);
  objc_msgSend(v9, "setLocalTransform:", &v14);
  SBFWindowForViewControllerTransition();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_toWindowOrientation");

  -[SBUIPoseidonContainerViewController _setLocalTransformForOrientation:](self, "_setLocalTransformForOrientation:", v11);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__SBUIPoseidonContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E4C3F3A8;
  v12[4] = self;
  v12[5] = v11;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, 0);

}

uint64_t __90__SBUIPoseidonContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCounterTransformForOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)_setCounterTransformForOrientation:(int64_t)a3
{
  void *v4;
  _QWORD v5[6];

  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBTransformFromOrientationToOrientation(v5, a3, 1);
  objc_msgSend(v4, "setTransform:", v5);

}

- (void)_setLocalTransformForOrientation:(int64_t)a3
{
  void *v4;
  __int128 v5;
  CGAffineTransform *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];

  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
    case 1:
      v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v10[0] = *MEMORY[0x1E0C9BAA8];
      v10[1] = v5;
      v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v6 = (CGAffineTransform *)v10;
      goto LABEL_6;
    case 2:
      CGAffineTransformMakeRotation(&v9, -3.14159265);
      v6 = &v9;
      goto LABEL_6;
    case 3:
      CGAffineTransformMakeRotation(&v7, 1.57079633);
      v6 = &v7;
      goto LABEL_6;
    case 4:
      CGAffineTransformMakeRotation(&v8, -1.57079633);
      v6 = &v8;
LABEL_6:
      objc_msgSend(v4, "setLocalTransform:", v6);
      break;
    default:
      break;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  void *v6;
  id v7;

  p_legibilitySettings = &self->_legibilitySettings;
  v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", *p_legibilitySettings);

  }
}

- (void)setAuthenticated:(BOOL)a3
{
  int64_t v4;
  dispatch_time_t v5;
  _QWORD block[5];

  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    if (a3)
    {
      -[SBUIPoseidonContainerViewController setBioLockout:](self, "setBioLockout:", 0);
      if (self->_fingerOffSinceWake)
      {
        v4 = 0;
      }
      else if (self->_unlockSource == 1)
      {
        v4 = 110000000;
      }
      else
      {
        v4 = 0;
      }
      v5 = dispatch_time(0, v4);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__SBUIPoseidonContainerViewController_setAuthenticated___block_invoke;
      block[3] = &unk_1E4C3E408;
      block[4] = self;
      dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __56__SBUIPoseidonContainerViewController_setAuthenticated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showCoaching:", 0);
}

- (void)setScreenOn:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_screenOn != a3)
  {
    v3 = a3;
    self->_screenOn = a3;
    if (a3)
    {
      -[SBUIPoseidonContainerViewController _updateRotation](self, "_updateRotation");
    }
    else
    {
      -[SBUIPoseidonContainerViewController startRestToOpenCoaching:withCompletion:](self, "startRestToOpenCoaching:withCompletion:", 0, 0);
      -[SBUIPoseidonContainerViewController setFingerOffSinceWake:](self, "setFingerOffSinceWake:", 0);
      -[SBUIPoseidonContainerViewController setUnlockSource:](self, "setUnlockSource:", 0);
    }
    -[SBUIPoseidonContainerViewController showCoaching:](self, "showCoaching:", v3);
  }
}

- (void)setBioLockout:(BOOL)a3
{
  if (self->_bioLockout != a3)
  {
    self->_bioLockout = a3;
    if (a3)
      -[SBUIPoseidonContainerViewController showCoaching:](self, "showCoaching:", 0);
  }
}

- (void)setResignActive:(BOOL)a3
{
  if (self->_resignActive != a3)
  {
    self->_resignActive = a3;
    if (a3)
    {
      -[SBUIPoseidonContainerViewController showCoaching:](self, "showCoaching:", 0);
      -[SBUIPoseidonContainerViewController startRestToOpenCoaching:withCompletion:](self, "startRestToOpenCoaching:withCompletion:", 0, 0);
    }
    else
    {
      -[SBUIPoseidonContainerViewController showCoaching:](self, "showCoaching:", 1);
    }
  }
}

- (void)startRestToOpenCoaching:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  SBUIPoseidonContainerViewController *v16;
  void (**v17)(id, uint64_t);

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[SBUIPoseidonContainerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[SBUIPoseidonContainerViewController authenticationInformationProvider](self, "authenticationInformationProvider"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isBiometricLockedOut"), v8, (v9 & 1) == 0))
  {
    -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "state");

    if (v12 == 2)
    {
      if (v6)
        v6[2](v6, 1);
    }
    else
    {
      -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __78__SBUIPoseidonContainerViewController_startRestToOpenCoaching_withCompletion___block_invoke;
      v14[3] = &unk_1E4C3F3D0;
      v15 = v7;
      v16 = self;
      v17 = v6;
      objc_msgSend(v13, "setState:forIdleTimeout:withCompletion:", 2, 0, v14);

    }
  }
  else
  {
    -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setState:", 0);

  }
}

uint64_t __78__SBUIPoseidonContainerViewController_startRestToOpenCoaching_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "poseidonContainerViewControllerCoachingStateDidChange:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  id v4;

  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fillRestToOpenWithDuration:", a3);

}

- (void)resetRestToOpen
{
  id v2;

  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetRestToOpen");

}

- (void)updateContainsFirstRowIcons:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainsFirstRowIcons:", v3);

}

- (void)updateSidebarComplicationFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSidebarFrame:", x, y, width, height);

}

- (BOOL)coachingActive
{
  void *v2;
  BOOL v3;

  -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") != 0;

  return v3;
}

- (void)showCoaching:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (!a3)
  {
    -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (v7 == 2)
      return;
    -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:", 0);
    goto LABEL_9;
  }
  -[SBUIPoseidonContainerViewController authenticationInformationProvider](self, "authenticationInformationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_authenticated)
  {
    v8 = v4;
    if ((objc_msgSend(v4, "isBiometricLockedOut") & 1) == 0
      && objc_msgSend(v8, "hasBiometricAuthenticationCapabilityEnabled")
      && !self->_resignActive)
    {
      -[SBUIPoseidonContainerViewController _poseidonIconView](self, "_poseidonIconView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setState:", 1);

    }
LABEL_9:
    v4 = v8;
  }

}

- (id)_poseidonIconView
{
  SBUIPoseidonIconView *testPoseidonIconView;

  testPoseidonIconView = self->_testPoseidonIconView;
  if (testPoseidonIconView)
    return testPoseidonIconView;
  -[SBUIPoseidonContainerViewController view](self, "view");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateRotation
{
  uint64_t v3;

  v3 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  -[SBUIPoseidonContainerViewController _setCounterTransformForOrientation:](self, "_setCounterTransformForOrientation:", v3);
  -[SBUIPoseidonContainerViewController _setLocalTransformForOrientation:](self, "_setLocalTransformForOrientation:", v3);
}

- (void)poseidonIconViewCoachingStateDidChange:(id)a3
{
  id v4;

  -[SBUIPoseidonContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poseidonContainerViewControllerCoachingStateDidChange:", self);

}

- (id)_testPoseidonIconView
{
  return self->_testPoseidonIconView;
}

- (void)setTestPoseidonIconView:(id)a3
{
  SBUIPoseidonIconView *v5;
  SBUIPoseidonIconView *v6;

  v5 = (SBUIPoseidonIconView *)a3;
  if (self->_testPoseidonIconView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_testPoseidonIconView, a3);
    v5 = v6;
  }

}

- (SBUIPoseidonContainerViewControllerDelegate)delegate
{
  return (SBUIPoseidonContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBUIPoseidonContainerViewControllerLockStatusProvider)authenticationInformationProvider
{
  return (SBUIPoseidonContainerViewControllerLockStatusProvider *)objc_loadWeakRetained((id *)&self->_authenticationInformationProvider);
}

- (void)setAuthenticationInformationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationInformationProvider, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (BOOL)isBioLockout
{
  return self->_bioLockout;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)fingerOffSinceWake
{
  return self->_fingerOffSinceWake;
}

- (void)setFingerOffSinceWake:(BOOL)a3
{
  self->_fingerOffSinceWake = a3;
}

- (int)unlockSource
{
  return self->_unlockSource;
}

- (void)setUnlockSource:(int)a3
{
  self->_unlockSource = a3;
}

- (BOOL)resignActive
{
  return self->_resignActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_authenticationInformationProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testPoseidonIconView, 0);
}

@end
