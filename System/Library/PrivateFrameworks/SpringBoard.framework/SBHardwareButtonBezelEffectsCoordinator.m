@implementation SBHardwareButtonBezelEffectsCoordinator

- (SBHardwareButtonBezelEffectsCoordinator)initWithWindowScene:(id)a3
{
  id v5;
  SBHardwareButtonBezelEffectsCoordinator *v6;
  uint64_t v7;
  SBCaptureButtonSettings *settings;
  void *v9;
  uint64_t v10;
  BSCompoundAssertion *systemGlowEffectAssertion;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHardwareButtonBezelEffectsCoordinator;
  v6 = -[SBHardwareButtonBezelEffectsCoordinator init](&v16, sel_init);
  if (v6)
  {
    +[SBCaptureButtonDomain rootSettings](SBCaptureButtonDomain, "rootSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    settings = v6->_settings;
    v6->_settings = (SBCaptureButtonSettings *)v7;

    objc_storeStrong((id *)&v6->_windowScene, a3);
    objc_initWeak(&location, v6);
    v9 = (void *)MEMORY[0x1E0D01718];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__SBHardwareButtonBezelEffectsCoordinator_initWithWindowScene___block_invoke;
    v13[3] = &unk_1E8EA3688;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBHardwareButtonBezelEffectsCoordinator.systemGlowEffect"), v13);
    v10 = objc_claimAutoreleasedReturnValue();
    systemGlowEffectAssertion = v6->_systemGlowEffectAssertion;
    v6->_systemGlowEffectAssertion = (BSCompoundAssertion *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __63__SBHardwareButtonBezelEffectsCoordinator_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reevaluateSystemGlowEffect");

}

- (void)dealloc
{
  BSCompoundAssertion *systemGlowEffectAssertion;
  objc_super v4;

  -[BSCompoundAssertion invalidate](self->_systemGlowEffectAssertion, "invalidate");
  systemGlowEffectAssertion = self->_systemGlowEffectAssertion;
  self->_systemGlowEffectAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonBezelEffectsCoordinator;
  -[SBHardwareButtonBezelEffectsCoordinator dealloc](&v4, sel_dealloc);
}

- (UIView)dropletLaunchPortalSourceView
{
  return (UIView *)self->_dropletLaunchWindow;
}

- (id)observePortalSourceWithHandler:(id)a3
{
  id v4;
  _SBHardwareButtonPortalObservationToken *v5;
  _SBHardwareButtonPortalObservationToken *v6;
  NSMutableArray *portalObservationTokens;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [_SBHardwareButtonPortalObservationToken alloc];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__SBHardwareButtonBezelEffectsCoordinator_observePortalSourceWithHandler___block_invoke;
  v15 = &unk_1E8EAD858;
  objc_copyWeak(&v16, &location);
  v6 = -[_SBHardwareButtonPortalObservationToken initWithObserverBlock:invalidationBlock:](v5, "initWithObserverBlock:invalidationBlock:", v4, &v12);
  portalObservationTokens = self->_portalObservationTokens;
  if (!portalObservationTokens)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v9 = (NSMutableArray *)objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15);
    v10 = self->_portalObservationTokens;
    self->_portalObservationTokens = v9;

    portalObservationTokens = self->_portalObservationTokens;
  }
  -[NSMutableArray addObject:](portalObservationTokens, "addObject:", v6, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __74__SBHardwareButtonBezelEffectsCoordinator_observePortalSourceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[5], "removeObject:", v5);

}

- (id)animateLaunchZoomUpPreludeFromButton:(int64_t)a3
{
  _SBCaptureButtonLaunchAnimationPreludeToken **p_animatingPreludeToken;
  id WeakRetained;
  id v8;
  _SBCaptureButtonLaunchAnimationPreludeToken *v9;
  NSObject *v10;
  _SBCaptureButtonLaunchAnimationPreludeToken *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  _SBCaptureButtonLaunchAnimationPreludeToken *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_animatingPreludeToken = &self->_animatingPreludeToken;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  if (WeakRetained)
  {

LABEL_4:
    v9 = 0;
    goto LABEL_5;
  }
  v8 = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);

  if (v8)
    goto LABEL_4;
  kdebug_trace();
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_performBlockAfterCATransactionCommits:", &__block_literal_global_147);
  objc_initWeak((id *)buf, self);
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 187, CFSTR("Must supply specific concrete origin from which to animate."));

  }
  self->_lastRequestedLaunchOrigin = a3;
  v12 = [_SBCaptureButtonLaunchAnimationPreludeToken alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke_2;
  v14[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v15, (id *)buf);
  v9 = -[_SBCaptureButtonLaunchAnimationPreludeToken initWithPreludeAnimating:invalidationBlock:](v12, "initWithPreludeAnimating:invalidationBlock:", self, v14);
  objc_storeWeak((id *)p_animatingPreludeToken, v9);
  self->_animatingDropletCancellation = 0;
  -[SBHardwareButtonBezelEffectsCoordinator _presentOrDismissLaunchAnimationWindowIfNecessary](self, "_presentOrDismissLaunchAnimationWindowIfNecessary");
  -[SBCaptureButtonDropletLaunchViewController animateDropletFromButtonWithMilestones:](self->_dropletLaunchViewController, "animateDropletFromButtonWithMilestones:", 0);
  -[SBHardwareButtonBezelEffectsCoordinator _setShockwaveState:completion:](self, "_setShockwaveState:completion:", 1, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
LABEL_5:
  SBLogCameraCaptureLaunchAnimation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Bezel Effects: issuing prelude token: %@", buf, 0xCu);
  }

  return v9;
}

uint64_t __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke()
{
  return kdebug_trace();
}

void __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_storeWeak(WeakRetained + 2, 0);
    objc_msgSend(v2, "_presentOrDismissLaunchAnimationWindowIfNecessary");
    WeakRetained = v2;
  }

}

- (id)commandeerDropletAnimationWithToken:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;
  int v11;
  void *v12;
  _SBHardwareButtonLaunchZoomUpAnimationToken *v13;
  id v14;
  _SBHardwareButtonLaunchZoomUpAnimationToken *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("preludeToken != ((void *)0)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHardwareButtonBezelEffectsCoordinator commandeerDropletAnimationWithToken:].cold.1(a2, (uint64_t)self, (uint64_t)v19);
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D093F72CLL);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  v11 = BSEqualObjects();

  if (v11)
  {
    -[SBCaptureButtonDropletLaunchViewController expandHintingDropletByAddingComponents:](self->_dropletLaunchViewController, "expandHintingDropletByAddingComponents:", 7);
    objc_initWeak(location, self);
    -[SBCaptureButtonDropletLaunchViewController lendAnimatingDropletViewToExternalOwner](self->_dropletLaunchViewController, "lendAnimatingDropletViewToExternalOwner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [_SBHardwareButtonLaunchZoomUpAnimationToken alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__SBHardwareButtonBezelEffectsCoordinator_commandeerDropletAnimationWithToken___block_invoke;
    v20[3] = &unk_1E8E9F280;
    objc_copyWeak(&v22, location);
    v14 = v12;
    v21 = v14;
    v15 = -[_SBHardwareButtonLaunchZoomUpAnimationToken initWithPreludeAnimating:invalidationBlock:](v13, "initWithPreludeAnimating:invalidationBlock:", self, v20);
    objc_storeWeak((id *)&self->_animatingLaunchCompletionToken, v15);
    -[_SBHardwareButtonLaunchZoomUpAnimationToken setRequestedDropletWindowLevel:](v15, "setRequestedDropletWindowLevel:", 0.0);
    objc_msgSend(v9, "invalidate");
    objc_storeWeak((id *)&self->_animatingPreludeToken, 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 230, CFSTR("Unexpected"));

    v15 = 0;
  }
  SBLogCameraCaptureLaunchAnimation();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v15;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Bezel Effects: issuing zoom up token: %@", (uint8_t *)location, 0xCu);
  }

  return v15;
}

void __79__SBHardwareButtonBezelEffectsCoordinator_commandeerDropletAnimationWithToken___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_storeWeak(WeakRetained + 4, 0);
    objc_msgSend(WeakRetained, "_presentOrDismissLaunchAnimationWindowIfNecessary");
  }

}

- (void)preludeToken:(id)a3 expandHintingDropletByAddingComponents:(unint64_t)a4 shockwave:(BOOL)a5
{
  _BOOL4 v5;
  id WeakRetained;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a5;
  v12 = a3;
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
    v9 = BSEqualObjects();

    if (v9)
    {
      kdebug_trace();
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "_performBlockAfterCATransactionCommits:", &__block_literal_global_23_0);
      v10 = -[SUIAShockwaveViewController state](self->_shockwaveViewController, "state");
      if (v5)
        v11 = 2;
      else
        v11 = 0;
      -[SBHardwareButtonBezelEffectsCoordinator _setShockwaveState:completion:](self, "_setShockwaveState:completion:", v11, 0);
      if (-[SBCaptureButtonDropletLaunchViewController expandHintingDropletByAddingComponents:](self->_dropletLaunchViewController, "expandHintingDropletByAddingComponents:", a4)|| v10 != -[SUIAShockwaveViewController state](self->_shockwaveViewController, "state"))
      {
        self->_animatingDropletCancellation = 0;
        -[SBHardwareButtonBezelEffectsCoordinator _presentOrDismissLaunchAnimationWindowIfNecessary](self, "_presentOrDismissLaunchAnimationWindowIfNecessary");
        objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
      }
    }
  }

}

uint64_t __105__SBHardwareButtonBezelEffectsCoordinator_preludeToken_expandHintingDropletByAddingComponents_shockwave___block_invoke()
{
  return kdebug_trace();
}

- (void)cancelPrelude
{
  NSObject *v3;
  SBCaptureButtonDropletLaunchViewController *dropletLaunchViewController;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _SBCaptureButtonLaunchAnimationPreludeToken **p_animatingPreludeToken;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];
  id location;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  self->_animatingDropletCancellation = 1;
  objc_initWeak(&location, self);
  SBLogCameraCaptureLaunchAnimation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Bezel Effects: Cancel prelude animatedly", buf, 2u);
  }

  dropletLaunchViewController = self->_dropletLaunchViewController;
  v15 = &unk_1E91CF748;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke;
  v11[3] = &unk_1E8EAD8C0;
  objc_copyWeak(&v12, &location);
  v5 = (void *)MEMORY[0x1D17E5550](v11);
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCaptureButtonDropletLaunchViewController resetToOffscreenAnimated:milestones:](dropletLaunchViewController, "resetToOffscreenAnimated:milestones:", 1, v6);

  if (self->_animatingShockwave)
  {
    v7 = -[SUIAShockwaveViewController state](self->_shockwaveViewController, "state");
    if (v7 == 1)
    {
      v8 = 4;
      goto LABEL_8;
    }
    if (v7 == 2)
    {
      v8 = 5;
LABEL_8:
      -[SBHardwareButtonBezelEffectsCoordinator _setShockwaveState:completion:](self, "_setShockwaveState:completion:", v8, 0);
    }
  }
  p_animatingPreludeToken = &self->_animatingPreludeToken;
  WeakRetained = objc_loadWeakRetained((id *)p_animatingPreludeToken);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_animatingPreludeToken, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[96] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentOrDismissLaunchAnimationWindowIfNecessary");
    WeakRetained = v2;
  }

}

- (CGRect)preludeAnimationRectPresentationValue
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBCaptureButtonDropletLaunchViewController preludeAnimationRectPresentationValue](self->_dropletLaunchViewController, "preludeAnimationRectPresentationValue");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)preludeAnimationVelocity
{
  double v2;
  double v3;
  CGPoint result;

  -[SBCaptureButtonDropletLaunchViewController preludeAnimationVelocity](self->_dropletLaunchViewController, "preludeAnimationVelocity");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)animatingDroplet
{
  return -[SBCaptureButtonDropletLaunchViewController animatingDroplet](self->_dropletLaunchViewController, "animatingDroplet");
}

- (id)animatingDropletContext
{
  return -[SBCaptureButtonDropletLaunchViewController animatingDropletContext](self->_dropletLaunchViewController, "animatingDropletContext");
}

- (id)activateHintDropletForButton:(int64_t)a3
{
  void *v5;

  if (-[SBHardwareButtonBezelEffectsCoordinator hintDropletsEnabled](self, "hintDropletsEnabled"))
  {
    -[SBHardwareButtonBezelEffectsCoordinator _setHintDropletWindowVisible:](self, "_setHintDropletWindowVisible:", 1);
    -[SBHardwareButtonHintDropletViewController activateHintDropletForButton:](self->_hintDropletViewController, "activateHintDropletForButton:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)associateHintView:(id)a3 withButton:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[SBHardwareButtonBezelEffectsCoordinator hintDropletsEnabled](self, "hintDropletsEnabled"))
  {
    -[SBHardwareButtonBezelEffectsCoordinator _setHintDropletWindowVisible:](self, "_setHintDropletWindowVisible:", 1);
    -[SBHardwareButtonHintDropletViewController associateHintView:withButton:](self->_hintDropletViewController, "associateHintView:withButton:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8;
  SBHardwareButtonHintDropletViewController *hintDropletViewController;
  NSObject *v10;

  v8 = a5;
  if (-[SBHardwareButtonBezelEffectsCoordinator hintDropletsEnabled](self, "hintDropletsEnabled"))
  {
    hintDropletViewController = self->_hintDropletViewController;
    if (hintDropletViewController)
    {
      -[SBHardwareButtonHintDropletViewController updateHintContentVisibility:forButton:animationSettings:](hintDropletViewController, "updateHintContentVisibility:forButton:animationSettings:", a3, a4, v8);
    }
    else
    {
      SBLogButtonHintingUI();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBHardwareButtonBezelEffectsCoordinator updateHintContentVisibility:forButton:animationSettings:].cold.1(v10);

    }
  }

}

- (id)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 reason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a4;
  -[SBWindowScene assistantController](self->_windowScene, "assistantController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isSystemAssistantExperienceEnabled") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[SBHardwareButtonBezelEffectsCoordinator _policyAggregator](self, "_policyAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsCapability:", 28);

  if (!v9)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  self->_systemGlowActivating = a3 == 0;
  -[BSCompoundAssertion acquireForReason:](self->_systemGlowEffectAssertion, "acquireForReason:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  self->_systemGlowActivating = a3 == 0;
  -[SBHardwareButtonBezelEffectsCoordinator _reevaluateSystemGlowEffect](self, "_reevaluateSystemGlowEffect");
}

- (void)_reevaluateSystemGlowEffect
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  SBHardwareButtonHintDropletViewController *hintDropletViewController;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[BSCompoundAssertion isActive](self->_systemGlowEffectAssertion, "isActive");
  SBLogButtonHintingUI();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHardwareButtonHintDropletViewController description](self->_hintDropletViewController, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("nil");
    if (v5)
      v7 = (const __CFString *)v5;
    v10[0] = 67109378;
    v10[1] = v3;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "reevaluateSystemGlowEffect: %{BOOL}u viewController: %@", (uint8_t *)v10, 0x12u);

  }
  if ((v3 & 1) != 0)
  {
    hintDropletViewController = self->_hintDropletViewController;
    if (self->_systemGlowActivating)
      v9 = 1;
    else
      v9 = 2;
  }
  else
  {
    self->_systemGlowActivating = 0;
    hintDropletViewController = self->_hintDropletViewController;
    v9 = 0;
  }
  -[SBHardwareButtonHintDropletViewController setKeylineStyle:](hintDropletViewController, "setKeylineStyle:", v9);
}

- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBHardwareButtonBezelEffectsCoordinator _setHintDropletWindowVisible:](self, "_setHintDropletWindowVisible:", 1);
  -[SBHardwareButtonHintDropletViewController setDropletLayoutCallback:forButton:](self->_hintDropletViewController, "setDropletLayoutCallback:forButton:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)hintDropletViewControllerDidBecomeIdle:(id)a3
{
  if (self->_hintDropletViewController == a3)
    -[SBHardwareButtonBezelEffectsCoordinator _setHintDropletWindowVisible:](self, "_setHintDropletWindowVisible:", 0);
}

- (void)_presentOrDismissLaunchAnimationWindowIfNecessary
{
  id WeakRetained;
  _BOOL8 animatingDropletCancellation;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  if (WeakRetained)
  {
    animatingDropletCancellation = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);
    if (v5)
      animatingDropletCancellation = 1;
    else
      animatingDropletCancellation = self->_animatingDropletCancellation;

  }
  -[SBHardwareButtonBezelEffectsCoordinator _setLaunchAnimationWindowVisible:](self, "_setLaunchAnimationWindowVisible:", animatingDropletCancellation);
  -[SBHardwareButtonBezelEffectsCoordinator _updateLaunchAnimationWindowLevelIfNecessary](self, "_updateLaunchAnimationWindowLevelIfNecessary");
}

- (void)_setLaunchAnimationWindowVisible:(BOOL)a3
{
  SBFSecureTouchPassThroughWindow *dropletLaunchWindow;
  SBCaptureButtonDropletLaunchViewController *v5;
  SBCaptureButtonDropletLaunchViewController *dropletLaunchViewController;
  SBFSecureTouchPassThroughWindow *v7;
  SBFSecureTouchPassThroughWindow *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  SUIAShockwaveViewController *v25;
  SUIAShockwaveViewController *shockwaveViewController;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  SBCaptureButtonDropletLaunchViewController *v33;
  SUIAShockwaveViewController *v34;
  SBFSecureTouchPassThroughWindow *v35;
  uint8_t v36[16];
  uint8_t buf[16];

  dropletLaunchWindow = self->_dropletLaunchWindow;
  if (a3)
  {
    if (dropletLaunchWindow)
      return;
    v5 = -[SBCaptureButtonDropletLaunchViewController initWithButtonOrigin:]([SBCaptureButtonDropletLaunchViewController alloc], "initWithButtonOrigin:", self->_lastRequestedLaunchOrigin);
    dropletLaunchViewController = self->_dropletLaunchViewController;
    self->_dropletLaunchViewController = v5;

    v7 = (SBFSecureTouchPassThroughWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9ED8]), "initWithWindowScene:role:debugName:", self->_windowScene, CFSTR("SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinator"), CFSTR("Hardware Button Bezel Effects Coordinator - Droplet Launch"));
    v8 = self->_dropletLaunchWindow;
    self->_dropletLaunchWindow = v7;

    -[SBFSecureTouchPassThroughWindow bs_setHitTestingDisabled:](self->_dropletLaunchWindow, "bs_setHitTestingDisabled:", 1);
    -[SBFSecureTouchPassThroughWindow setWindowLevel:](self->_dropletLaunchWindow, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 15.0 + 1.0);
    -[SBFSecureTouchPassThroughWindow setRootViewController:](self->_dropletLaunchWindow, "setRootViewController:", self->_dropletLaunchViewController);
    +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel](SBButtonBezelGeometryInfo, "buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizedButtonHWRectForButton:", self->_lastRequestedLaunchOrigin);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v18 = objc_alloc(MEMORY[0x1E0DB0F58]);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v24 = objc_msgSend(v18, "initWithNormalizedButtonEdgeLocation:shockwaveViewBounds:", v11, v13, v15, v17, v20, v21, v22, v23);

    v25 = (SUIAShockwaveViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F60]), "initWithStyle:", v24);
    shockwaveViewController = self->_shockwaveViewController;
    self->_shockwaveViewController = v25;

    -[SBCaptureButtonDropletLaunchViewController addChildViewController:](self->_dropletLaunchViewController, "addChildViewController:", self->_shockwaveViewController);
    -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonDropletLaunchViewController view](self->_dropletLaunchViewController, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v27, "setFrame:");

    -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAutoresizingMask:", 18);

    -[SBCaptureButtonDropletLaunchViewController view](self->_dropletLaunchViewController, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIAShockwaveViewController view](self->_shockwaveViewController, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "insertSubview:atIndex:", v31, 0);

    -[SUIAShockwaveViewController didMoveToParentViewController:](self->_shockwaveViewController, "didMoveToParentViewController:", self->_dropletLaunchViewController);
    -[SBFSecureTouchPassThroughWindow setHidden:](self->_dropletLaunchWindow, "setHidden:", 0);
    -[SBHardwareButtonBezelEffectsCoordinator _beginRequiringBacklightAssertionForReason:](self, "_beginRequiringBacklightAssertionForReason:", CFSTR("Hardware Button Bezel Effects Coordinator - Droplet Launch"));
    SBLogCameraCaptureLaunchAnimation();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "Bezel Effects Window: Visible", buf, 2u);
    }

  }
  else
  {
    if (!dropletLaunchWindow)
      return;
    -[SBFSecureTouchPassThroughWindow setHidden:](dropletLaunchWindow, "setHidden:", 1);
    -[SBFSecureTouchPassThroughWindow setRootViewController:](self->_dropletLaunchWindow, "setRootViewController:", 0);
    v33 = self->_dropletLaunchViewController;
    self->_dropletLaunchViewController = 0;

    v34 = self->_shockwaveViewController;
    self->_shockwaveViewController = 0;

    v35 = self->_dropletLaunchWindow;
    self->_dropletLaunchWindow = 0;

    -[SBHardwareButtonBezelEffectsCoordinator _endRequiringBacklightAssertionForReason:](self, "_endRequiringBacklightAssertionForReason:", CFSTR("Hardware Button Bezel Effects Coordinator - Droplet Launch"));
    SBLogCameraCaptureLaunchAnimation();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Bezel Effects Window: Hidden", v36, 2u);
    }
  }

}

- (void)_updateLaunchAnimationWindowLevelIfNecessary
{
  double v3;
  id WeakRetained;
  double v5;
  double v6;
  id v7;

  v3 = *MEMORY[0x1E0CEBBD0] + 15.0 + 1.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "requestedDropletWindowLevel");
    v6 = v5;
    if (!BSFloatEqualToFloat())
      v3 = v6;
  }
  -[SBFSecureTouchPassThroughWindow setWindowLevel:](self->_dropletLaunchWindow, "setWindowLevel:", v3);

}

- (void)_setShockwaveState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SUIAShockwaveViewController *shockwaveViewController;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v6 = a4;
  v7 = (void *)(self->_shockwaveAnimationRevisionID + 1);
  self->_shockwaveAnimationRevisionID = (unint64_t)v7;
  self->_animatingShockwave = 1;
  objc_initWeak(&location, self);
  shockwaveViewController = self->_shockwaveViewController;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBHardwareButtonBezelEffectsCoordinator__setShockwaveState_completion___block_invoke;
  v10[3] = &unk_1E8EAA3E8;
  objc_copyWeak(v12, &location);
  v12[1] = v7;
  v9 = v6;
  v11 = v9;
  -[SUIAShockwaveViewController setState:animated:recommendedNextAction:completion:](shockwaveViewController, "setState:animated:recommendedNextAction:completion:", a3, 1, 0, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __73__SBHardwareButtonBezelEffectsCoordinator__setShockwaveState_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 11) == *(_QWORD *)(a1 + 48))
    *((_BYTE *)WeakRetained + 80) = 0;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);
    v7 = v9;
  }

}

- (void)_setHintDropletWindowVisible:(BOOL)a3
{
  SBFSecureTouchPassThroughWindow *hintDropletWindow;
  SBHardwareButtonHintDropletViewController *v5;
  SBHardwareButtonHintDropletViewController *v6;
  SBFSecureTouchPassThroughWindow *v7;
  SBFSecureTouchPassThroughWindow *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  SBHardwareButtonHintDropletViewController *hintDropletViewController;
  SBFSecureTouchPassThroughWindow *v13;
  __int16 v14;
  __int16 v15;

  hintDropletWindow = self->_hintDropletWindow;
  if (!a3)
  {
    if (!hintDropletWindow)
      return;
    -[SBFSecureTouchPassThroughWindow setHidden:](hintDropletWindow, "setHidden:", 1);
    -[SBFSecureTouchPassThroughWindow setRootViewController:](self->_hintDropletWindow, "setRootViewController:", 0);
    hintDropletViewController = self->_hintDropletViewController;
    self->_hintDropletViewController = 0;

    v13 = self->_hintDropletWindow;
    self->_hintDropletWindow = 0;

    -[SBHardwareButtonBezelEffectsCoordinator _endRequiringBacklightAssertionForReason:](self, "_endRequiringBacklightAssertionForReason:", CFSTR("Hardware Button Bezel Effects Coordinator Hinting"));
    SBLogButtonHintingUI();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v14 = 0;
    v10 = "Bezel Effects Hint Droplet Window: Hidden";
    v11 = (uint8_t *)&v14;
    goto LABEL_9;
  }
  if (!hintDropletWindow && -[SBHardwareButtonBezelEffectsCoordinator hintDropletsEnabled](self, "hintDropletsEnabled"))
  {
    v5 = (SBHardwareButtonHintDropletViewController *)objc_opt_new();
    v6 = self->_hintDropletViewController;
    self->_hintDropletViewController = v5;

    -[SBHardwareButtonHintDropletViewController setDelegate:](self->_hintDropletViewController, "setDelegate:", self);
    v7 = (SBFSecureTouchPassThroughWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9ED8]), "initWithWindowScene:role:debugName:", self->_windowScene, CFSTR("SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinatorHinting"), CFSTR("Hardware Button Bezel Effects Coordinator Hinting"));
    v8 = self->_hintDropletWindow;
    self->_hintDropletWindow = v7;

    -[SBFSecureTouchPassThroughWindow setWindowLevel:](self->_hintDropletWindow, "setWindowLevel:", 10000000.5);
    -[SBFSecureTouchPassThroughWindow setRootViewController:](self->_hintDropletWindow, "setRootViewController:", self->_hintDropletViewController);
    -[SBFSecureTouchPassThroughWindow setHidden:](self->_hintDropletWindow, "setHidden:", 0);
    -[SBHardwareButtonBezelEffectsCoordinator _reevaluateSystemGlowEffect](self, "_reevaluateSystemGlowEffect");
    -[SBHardwareButtonBezelEffectsCoordinator _beginRequiringBacklightAssertionForReason:](self, "_beginRequiringBacklightAssertionForReason:", CFSTR("Hardware Button Bezel Effects Coordinator Hinting"));
    SBLogButtonHintingUI();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      return;
    }
    v15 = 0;
    v10 = "Bezel Effects Hint Droplet Window: Visible";
    v11 = (uint8_t *)&v15;
LABEL_9:
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_10;
  }
}

- (BOOL)hintDropletsEnabled
{
  void *v2;
  char v3;
  void *v4;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "deviceSupportsHWButtonBezelEffects") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SBHardwareButtonHintDropletsEnabled"));

  }
  return v3;
}

- (id)_policyAggregator
{
  void *v2;
  void *v3;

  -[SBWindowScene sceneManager](self->_windowScene, "sceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "policyAggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_beginRequiringBacklightAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *liveUpdatingAssertion;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[NSCountedSet addObject:](self->_backlightAssertionRequiringReasons, "addObject:", v5);
  if (!self->_liveUpdatingAssertion && self->_windowScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Animating Bezel Effects, assertion first required for <%@>:"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D00F48];
    objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", self->_windowScene);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", self->_windowScene);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acquireWithExplanation:observer:attributes:", v6, 0, v11);
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    liveUpdatingAssertion = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = v12;

  }
}

- (void)_endRequiringBacklightAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  BSInvalidatable *liveUpdatingAssertion;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSCountedSet removeObject:](self->_backlightAssertionRequiringReasons, "removeObject:", v5);
  -[NSCountedSet anyObject](self->_backlightAssertionRequiringReasons, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[BSInvalidatable invalidate](self->_liveUpdatingAssertion, "invalidate");
    liveUpdatingAssertion = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGlowEffectAssertion, 0);
  objc_storeStrong((id *)&self->_hintDropletViewController, 0);
  objc_storeStrong((id *)&self->_hintDropletWindow, 0);
  objc_storeStrong((id *)&self->_liveUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_backlightAssertionRequiringReasons, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shockwaveViewController, 0);
  objc_storeStrong((id *)&self->_dropletLaunchViewController, 0);
  objc_storeStrong((id *)&self->_dropletLaunchWindow, 0);
  objc_storeStrong((id *)&self->_portalObservationTokens, 0);
  objc_destroyWeak((id *)&self->_animatingLaunchCompletionToken);
  objc_destroyWeak((id *)&self->_animatingPreludeToken);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

- (void)commandeerDropletAnimationWithToken:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBHardwareButtonBezelEffectsCoordinator.m");
  v16 = 1024;
  v17 = 211;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)updateHintContentVisibility:(os_log_t)log forButton:animationSettings:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Got an attempt to update hint content appearance state with no actual hint UI active", v1, 2u);
}

@end
