@implementation SBCaptureButtonCoachingController

- (SBCaptureButtonCoachingController)initWithHUDController:(id)a3
{
  id v5;
  SBCaptureButtonCoachingController *v6;
  SBCaptureButtonCoachingController *v7;
  SBCaptureButtonCoachingHUDViewController *v8;
  SBCaptureButtonCoachingHUDViewController *hudViewController;
  SBHUDController *hudController;
  SBCaptureButtonCoachingHUDViewController *v11;
  objc_class *v12;
  void *v13;
  id v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonCoachingController;
  v6 = -[SBCaptureButtonCoachingController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hudController, a3);
    v8 = -[SBCaptureButtonCoachingHUDViewController initWithNibName:bundle:]([SBCaptureButtonCoachingHUDViewController alloc], "initWithNibName:bundle:", 0, 0);
    hudViewController = v7->_hudViewController;
    v7->_hudViewController = v8;

    hudController = v7->_hudController;
    v11 = v7->_hudViewController;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBHUDController HUDSessionForViewController:identifier:](hudController, "HUDSessionForViewController:identifier:", v11, v13);

  }
  return v7;
}

- (void)dealloc
{
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  objc_super v4;

  -[SBTraitsPipelineBlockBasedPolicySpecifier invalidate](self->_blockBasedPolicySpecifier, "invalidate");
  blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
  self->_blockBasedPolicySpecifier = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonCoachingController;
  -[SBCaptureButtonCoachingController dealloc](&v4, sel_dealloc);
}

- (void)showCoachingUIWithText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeStateName:(id)a5 dismissInterval:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SBTraitsPipelineBlockBasedPolicySpecifier *v15;
  SBTraitsPipelineBlockBasedPolicySpecifier *v16;
  SBTraitsPipelineBlockBasedPolicySpecifier *blockBasedPolicySpecifier;
  uint64_t v18;
  void *v19;
  void *v20;
  SBCaptureButtonCoachingHUDViewController *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SBHUDController windowScene](self->_hudController, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "traitsArbiter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && !self->_blockBasedPolicySpecifier)
  {
    objc_initWeak(&location, self);
    v15 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __117__SBCaptureButtonCoachingController_showCoachingUIWithText_glyphPackageName_glyphLandscapeStateName_dismissInterval___block_invoke;
    v25 = &unk_1E8EA7798;
    objc_copyWeak(&v26, &location);
    v16 = -[SBTraitsPipelineBlockBasedPolicySpecifier initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:](v15, "initWithPolicySpecifierBlock:specifierDescription:componentOrder:arbiter:", &v22, CFSTR("CaptureButton HUD"), &unk_1E91D2360, v14);
    blockBasedPolicySpecifier = self->_blockBasedPolicySpecifier;
    self->_blockBasedPolicySpecifier = v16;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  v18 = *MEMORY[0x1E0DAB5C0];
  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB5C0], v22, v23, v24, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "HUDViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v21 = -[SBCaptureButtonCoachingHUDViewController initWithNibName:bundle:]([SBCaptureButtonCoachingHUDViewController alloc], "initWithNibName:bundle:", 0, 0);

    -[SBCaptureButtonCoachingHUDViewController setDelegate:](v21, "setDelegate:", self);
    -[SBHUDController HUDSessionForViewController:identifier:](self->_hudController, "HUDSessionForViewController:identifier:", v21, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
  }
  objc_msgSend(v20, "setCoachingText:glyphPackageName:glyphLandscapeState:", v10, v11, v12);
  objc_msgSend(v19, "presentWithDismissalInterval:animated:", 0, a6);
  objc_msgSend(v20, "transitionToState:animated:completion:", 1, 1, 0);

}

void __117__SBCaptureButtonCoachingController_showCoachingUIWithText_glyphPackageName_glyphLandscapeStateName_dismissInterval___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateAcquiredParticipantsPolicies:", v3);

}

- (void)dismissCoachingUI
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  SBCaptureButtonCoachingController *v7;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB5C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HUDViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") && (objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(v3, "invalidateDismissalTimer");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__SBCaptureButtonCoachingController_dismissCoachingUI__block_invoke;
    v5[3] = &unk_1E8E9DEB0;
    v6 = v3;
    v7 = self;
    objc_msgSend(v4, "transitionToState:animated:completion:", 0, 1, v5);

  }
}

void __54__SBCaptureButtonCoachingController_dismissCoachingUI__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "invalidate");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

- (void)setExtraCoachingUIButtonOffset:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__SBCaptureButtonCoachingController_setExtraCoachingUIButtonOffset___block_invoke;
  v3[3] = &unk_1E8E9DE88;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
}

void __68__SBCaptureButtonCoachingController_setExtraCoachingUIButtonOffset___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB5C0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HUDViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPositionOffset:", *(double *)(a1 + 40), 0.0);

}

- (void)_updateAcquiredParticipantsPolicies:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "role");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBTraitsParticipantRoleHUD"));

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientationWithStateTypes:", &unk_1E91CF568);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setOrientationResolutionPolicyInfo:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)captureButtonCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)(a4 - 1) < 2)
  {
    v7 = v6;
    -[SBCaptureButtonCoachingController _startObservingSignalsToDismissIfNeeded](self, "_startObservingSignalsToDismissIfNeeded");
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v7 = v6;
    -[SBCaptureButtonCoachingController _stopObservingSignalsToDismissIfNeeded](self, "_stopObservingSignalsToDismissIfNeeded");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)captureButtonCoachingHUDViewControllerWillRotate:(id)a3
{
  id v3;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB5C0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rescheduleDismissalTimer");

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_dismissGestureRecognizer == a3)
  {
    -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB5C0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "HUDViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_dismissGestureRecognizer == a3)
    -[SBCaptureButtonCoachingController dismissCoachingUI](self, "dismissCoachingUI");
}

- (void)_startObservingSignalsToDismissIfNeeded
{
  SBFailingSystemGestureRecognizer *v3;
  SBFailingSystemGestureRecognizer *dismissGestureRecognizer;
  SBFailingSystemGestureRecognizer *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_dismissGestureRecognizer)
  {
    v3 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    -[SBFailingSystemGestureRecognizer setDelegate:](v3, "setDelegate:", self);
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = v3;
    v5 = v3;

    -[SBHUDController windowScene](self->_hudController, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemGestureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:withType:", self->_dismissGestureRecognizer, 137);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__backlightLevelChanged_, *MEMORY[0x1E0DAC2F8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__volumeButtonPressed_, *MEMORY[0x1E0DAC3F8], 0);

  }
}

- (void)_stopObservingSignalsToDismissIfNeeded
{
  void *v3;
  void *v4;
  SBFailingSystemGestureRecognizer *dismissGestureRecognizer;
  id v6;

  if (self->_dismissGestureRecognizer)
  {
    -[SBHUDController windowScene](self->_hudController, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemGestureManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_dismissGestureRecognizer);

    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC2F8], 0);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC3F8], 0);

  }
}

- (void)_backlightLevelChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  id v13;

  objc_msgSend(a3, "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC2E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC308]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (v5 == 3 && v11 > v8)
    -[SBCaptureButtonCoachingController dismissCoachingUI](self, "dismissCoachingUI");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockBasedPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hudViewController, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
}

@end
