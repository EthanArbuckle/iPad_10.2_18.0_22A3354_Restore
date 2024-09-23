@implementation PBUIPosterLockViewController

- (int64_t)variant
{
  return 0;
}

- (BOOL)updatePresentation
{
  UIScenePresentation *sceneView;
  UIView *v4;
  UIScenePresentation *v5;
  UIScenePresentation *v6;
  UIScenePresentation *v7;
  PBUIPosterFloatingView *v8;
  PBUIPosterFloatingView *v9;
  PBUIPosterFloatingView *realFloatingView;
  id v11;
  void *v12;
  PBUIPosterFloatingLayerReplica *v13;
  PBUIPosterFloatingLayerReplica *v14;
  PBUIPosterFloatingLayerReplica *floatingLayerStandIn;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  sceneView = self->super._sceneView;
  if (!sceneView)
  {
    v4 = self->super._contentContainer;
    -[UIScenePresenter presentationView](self->super._presenter, "presentationView");
    v5 = (UIScenePresentation *)objc_claimAutoreleasedReturnValue();
    v6 = self->super._sceneView;
    self->super._sceneView = v5;

    v7 = self->super._sceneView;
    -[UIView bounds](v4, "bounds");
    -[UIScenePresentation setFrame:](v7, "setFrame:");
    -[UIScenePresentation setAutoresizingMask:](self->super._sceneView, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", self->super._sceneView, 0);
    v8 = [PBUIPosterFloatingView alloc];
    -[UIView bounds](v4, "bounds");
    v9 = -[PBUIPosterFloatingView initWithFrame:](v8, "initWithFrame:");
    realFloatingView = self->_realFloatingView;
    self->_realFloatingView = v9;

    -[PBUIPosterFloatingView setAutoresizingMask:](self->_realFloatingView, "setAutoresizingMask:", 18);
    v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[UIView bounds](v4, "bounds");
    v12 = (void *)objc_msgSend(v11, "initWithFrame:");
    objc_msgSend(v12, "setAutoresizingMask:", 18);
    objc_msgSend(v12, "addSubview:", self->_realFloatingView);
    -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v12, 1);
    v13 = [PBUIPosterFloatingLayerReplica alloc];
    -[UIView bounds](v4, "bounds");
    v14 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v13, "initWithFrame:");
    floatingLayerStandIn = self->_floatingLayerStandIn;
    self->_floatingLayerStandIn = v14;

    -[PBUIPosterFloatingLayerReplica setFloatingLayerStandin:](self->_floatingLayerStandIn, "setFloatingLayerStandin:", 0);
    if (soft_PUIFeatureEnabled(1) && (soft_PUIDynamicRotationIsActive() & 1) == 0)
      -[PBUIPosterFloatingLayerReplica setAutoresizingMask:](self->_floatingLayerStandIn, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", self->_floatingLayerStandIn, 2);
    -[PBUIPosterFloatingView setDefaultFloatingLayerStandin:](self->_realFloatingView, "setDefaultFloatingLayerStandin:", self->_floatingLayerStandIn);
    -[PBUIPortalReplicaView setProvider:](self->_floatingLayerStandIn, "setProvider:", self);
    -[PBUIPortalReplicaView debugView](self->_floatingLayerStandIn, "debugView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PBUIPortalReplicaView debugView](self->_floatingLayerStandIn, "debugView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "colorWithAlphaComponent:", 0.35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColor:", v19);

    }
    -[PBUIPortalReplicaView setReason:](self->_floatingLayerStandIn, "setReason:", CFSTR("FloatingLayer default standin"));

  }
  return sceneView == 0;
}

- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "pr_unlockProgress");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    objc_msgSend(v6, "externalDisplayConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController _externalDisplayConfiguration](self, "_externalDisplayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Lock variant needs to be fully locked (%@/%@)"), v7, v8);

  }
  if ((objc_msgSend(v6, "isSnapshottingForExternalDisplayHostedWallpaper") & 1) == 0
    && objc_msgSend(v11, "pr_adjustedLuminance") != 2)
  {
    v9 = soft_PF_IS_PAD_DEVICE();
    MEMORY[0x1BCCA4FB8](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Lock variant needs screen to be on (IS_PAD %@)"), v10);

  }
}

- (void)invalidate
{
  UIScenePresenter *floatingPresenter;
  objc_super v4;

  -[UIScenePresenter invalidate](self->_floatingPresenter, "invalidate");
  floatingPresenter = self->_floatingPresenter;
  self->_floatingPresenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterLockViewController;
  -[PBUIPosterVariantViewController invalidate](&v4, sel_invalidate);
}

- (void)_updateFloatingLayer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  UIScenePresenter *floatingPresenter;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIScenePresenter *v18;
  UIScenePresenter *v19;
  PBUIPosterFloatingView *realFloatingView;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[FBScene layerManager](self->super._scene, "layerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "level");
        v10 = v9;
        if (objc_msgSend(v8, "type") == 1 && v10 == 1000.0)
        {
          LODWORD(v5) = objc_msgSend(v8, "contextID");
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  if ((_DWORD)v5 != self->_floatingContextID)
  {
    self->_floatingContextID = v5;
    -[UIScenePresenter invalidate](self->_floatingPresenter, "invalidate");
    floatingPresenter = self->_floatingPresenter;
    self->_floatingPresenter = 0;

    if (self->_floatingContextID)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-floating"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA930], "targetForContextID:", self->_floatingContextID);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene uiPresentationManager](self->super._scene, "uiPresentationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createPresenterForLayerTarget:identifier:priority:", v16, v15, 100);
      v18 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v19 = self->_floatingPresenter;
      self->_floatingPresenter = v18;

      -[UIScenePresenter modifyPresentationContext:](self->_floatingPresenter, "modifyPresentationContext:", &__block_literal_global_134);
      -[UIScenePresenter activate](self->_floatingPresenter, "activate");
      realFloatingView = self->_realFloatingView;
      -[UIScenePresenter presentationView](self->_floatingPresenter, "presentationView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterFloatingView addSubview:](realFloatingView, "addSubview:", v21);

    }
  }
}

void __52__PBUIPosterLockViewController__updateFloatingLayer__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PBUIPosterLockViewController;
  v10 = a4;
  v11 = a3;
  -[PBUIPosterVariantViewController scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v15, sel_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext_, v11, v10, a5, a6);
  v12 = objc_alloc_init(MEMORY[0x1E0D22950]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__PBUIPosterLockViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v14[3] = &unk_1E6B947F8;
  v14[4] = self;
  objc_msgSend(v12, "observeLayersWithBlock:", v14);
  v13 = objc_msgSend(v11, "clientSettings");

  objc_msgSend(v12, "inspectDiff:withContext:", v10, v13);
  objc_msgSend(v12, "removeAllObservers");

}

uint64_t __106__PBUIPosterLockViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFloatingLayer");
}

- (id)registerPortalSourceObserver:(id)a3
{
  return -[PBUIFixedReplicaSourceProvider registerPortalSourceObserver:](self->super._portalProvider, "registerPortalSourceObserver:", a3);
}

- (void)legibilitySettingsDidChange
{
  PBUIPosterFloatingView *realFloatingView;
  void *v4;
  objc_super v5;

  realFloatingView = self->_realFloatingView;
  -[PBUIPosterVariantViewController legibilitySettings](self, "legibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterFloatingView setLegibilitySettings:](realFloatingView, "setLegibilitySettings:", v4);

  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterLockViewController;
  -[PBUIPosterVariantViewController legibilitySettingsDidChange](&v5, sel_legibilitySettingsDidChange);
}

- (id)portalSourceForReplicaView:(id)a3
{
  PBUIPosterFloatingLayerReplica *v4;
  void *v5;
  char v6;
  PBUIPosterFloatingView *v7;

  v4 = (PBUIPosterFloatingLayerReplica *)a3;
  if (self->_floatingLayerStandIn == v4
    || (objc_opt_respondsToSelector() & 1) != 0
    && (-[FBScene settings](self->super._scene, "settings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "pr_isDepthEffectDisallowed"),
        v5,
        (v6 & 1) == 0))
  {
    v7 = self->_realFloatingView;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingLayerStandIn, 0);
  objc_storeStrong((id *)&self->_realFloatingView, 0);
  objc_storeStrong((id *)&self->_floatingPresenter, 0);
}

@end
