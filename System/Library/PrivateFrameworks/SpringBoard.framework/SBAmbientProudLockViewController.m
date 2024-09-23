@implementation SBAmbientProudLockViewController

- (SBAmbientProudLockViewController)initWithBiometricResource:(id)a3 authenticationController:(id)a4
{
  id v7;
  id v8;
  SBAmbientProudLockViewController *v9;
  SBAmbientProudLockViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAmbientProudLockViewController;
  v9 = -[SBAmbientProudLockViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_authenticationController, a4);
  }

  return v10;
}

- (SBAmbientProudLockViewController)init
{
  void *v3;
  void *v4;
  SBAmbientProudLockViewController *v5;

  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "authenticationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBAmbientProudLockViewController initWithBiometricResource:authenticationController:](self, "initWithBiometricResource:authenticationController:", v3, v4);

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  SBPropertyAnimatingView *v4;
  SBPropertyAnimatingView *proudLockWrapperView;
  SBUIProudLockContainerViewController *v6;
  SBUIProudLockContainerViewController *proudLockContainerViewController;
  void *v8;
  SBUIProudLockContainerViewController *v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)SBAmbientProudLockViewController;
  -[SBAmbientProudLockViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[SBAmbientProudLockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBPropertyAnimatingView);
  proudLockWrapperView = self->_proudLockWrapperView;
  self->_proudLockWrapperView = v4;

  objc_msgSend(v3, "addSubview:", self->_proudLockWrapperView);
  -[SBAmbientProudLockViewController _prepareBlurForWrapperView](self, "_prepareBlurForWrapperView");
  v6 = (SBUIProudLockContainerViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC648]), "initWithAuthenticationInformationProvider:", self);
  proudLockContainerViewController = self->_proudLockContainerViewController;
  self->_proudLockContainerViewController = v6;

  -[SBUIProudLockContainerViewController view](self->_proudLockContainerViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_initWeak(&location, self);
  v9 = self->_proudLockContainerViewController;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke;
  v24[3] = &unk_1E8E9F280;
  objc_copyWeak(&v26, &location);
  v10 = v8;
  v25 = v10;
  -[SBUIProudLockContainerViewController setAuthenticated:completion:](v9, "setAuthenticated:completion:", 1, v24);
  objc_msgSend(v3, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  v20 = v19;
  v22 = v21;
  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  Width = CGRectGetWidth(v29);
  -[SBPropertyAnimatingView setFrame:](self->_proudLockWrapperView, "setFrame:", 0.0, 0.0, Width, v22 * 0.5 + 20.0 + v22 * 0.5 + 20.0);
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, Width, v22 * 0.5 + 20.0 + v22 * 0.5 + 20.0);
  -[SBUIProudLockContainerViewController overrideProudLockIconViewLayoutWithSize:offset:extent:](self->_proudLockContainerViewController, "overrideProudLockIconViewLayoutWithSize:offset:extent:", v20, v22, v16 * 0.5, 20.0, 0.0);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "bs_addChildViewController:withSuperview:", WeakRetained[121], WeakRetained[122]);
  v3 = (void *)MEMORY[0x1E0CEABB0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "animateWithDuration:animations:", v4, 0.5);

}

uint64_t __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isBiometricLockedOut
{
  return -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState") != 0;
}

- (BOOL)hasPasscodeSet
{
  return -[SBFUserAuthenticationController hasPasscodeSet](self->_authenticationController, "hasPasscodeSet");
}

- (void)setAuthenticated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  SBUIProudLockContainerViewController *proudLockContainerViewController;
  id v7;
  void *v8;
  id authenticationCompletion;

  v4 = a3;
  proudLockContainerViewController = self->_proudLockContainerViewController;
  v7 = a4;
  -[SBUIProudLockContainerViewController setAuthenticated:](proudLockContainerViewController, "setAuthenticated:", v4);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dismissTransientProudLockAnimated, 0);
  v8 = (void *)MEMORY[0x1D17E5550](v7);

  authenticationCompletion = self->_authenticationCompletion;
  self->_authenticationCompletion = v8;

  -[SBAmbientProudLockViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dismissTransientProudLockAnimated, 0, 2.0);
}

- (void)_prepareBlurForWrapperView
{
  SBPropertyAnimatingView *proudLockWrapperView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  proudLockWrapperView = self->_proudLockWrapperView;
  if (proudLockWrapperView)
  {
    -[SBPropertyAnimatingView layer](proudLockWrapperView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("filters.gaussianBlur"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputHardEdges"));
      objc_msgSend(v6, "setName:", CFSTR("gaussianBlur"));
      objc_msgSend(v4, "filters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "mutableArrayValueForKeyPath:", CFSTR("filters"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v6);
      }
      else
      {
        v14[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setFilters:", v8);
      }

    }
    -[SBPropertyAnimatingView animatedLayerProperties](self->_proudLockWrapperView, "animatedLayerProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v13 = v12;

    objc_msgSend(v13, "addObject:", CFSTR("filters.gaussianBlur.inputRadius"));
    -[SBPropertyAnimatingView setAnimatedLayerProperties:](self->_proudLockWrapperView, "setAnimatedLayerProperties:", v13);

  }
}

- (void)_dismissTransientProudLockAnimated
{
  SBPropertyAnimatingView *v3;
  void *v4;
  void *v5;
  SBPropertyAnimatingView *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  SBPropertyAnimatingView *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v3 = self->_proudLockWrapperView;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 0.5, 0.5);
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D01908];
  v8[0] = MEMORY[0x1E0C809B0];
  v10 = v11;
  v8[1] = 3221225472;
  v8[2] = __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke;
  v8[3] = &unk_1E8EA5150;
  v9 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke_81;
  v7[3] = &unk_1E8E9E980;
  v7[4] = self;
  v6 = v3;
  objc_msgSend(v5, "animateWithSettings:actions:completion:", v4, v8, v7);

}

void __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E91CF6B8, CFSTR("filters.gaussianBlur.inputRadius"));

}

void __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke_81(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1000);
    *(_QWORD *)(v3 + 1000) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_proudLockWrapperView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
}

@end
