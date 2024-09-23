@implementation SBSingleSceneController

- (void)setSceneContentVisible:(BOOL)a3
{
  id WeakRetained;

  self->_sceneContentVisible = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scene:hasVisibleContent:", self->_scene, self->_sceneContentVisible);

}

- (void)didUpdateSceneTraitsDelegate:(id)a3
{
  SBTraitsSceneParticipantDelegate *v5;
  void *v6;
  SBTraitsSceneParticipantDelegate *v7;
  SBTraitsSceneParticipantDelegate *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, char);
  void *v13;
  id v14;
  id location;

  v5 = (SBTraitsSceneParticipantDelegate *)a3;
  -[SBTraitsSceneParticipantDelegate participant](v5, "participant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_lastSceneTraitsParticipantDelegate;
  v8 = v7;
  if (v7 != v5)
  {
    -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v7, "setActuateOrientationAlongsideBlock:", 0);
    objc_storeStrong((id *)&self->_lastSceneTraitsParticipantDelegate, a3);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __56__SBSingleSceneController_didUpdateSceneTraitsDelegate___block_invoke;
    v13 = &unk_1E8EA3840;
    objc_copyWeak(&v14, &location);
    -[SBTraitsSceneParticipantDelegate setActuateOrientationAlongsideBlock:](v5, "setActuateOrientationAlongsideBlock:", &v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  -[SBTraitsOrientedContentViewController setContentParticipant:](self->_orientedSceneViewController, "setContentParticipant:", v6, v10, v11, v12, v13);
  -[SBTraitsOrientedContentViewController setContainerParticipant:](self->_orientedSceneViewController, "setContainerParticipant:", v6);
  -[SBTraitsOrientedContentViewController updateOrientationIfNeeded](self->_orientedSceneViewController, "updateOrientationIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scene:didChangeTraitsParticipantDelegate:", self->_scene, v5);

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a3, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  if (!CGRectIsNull(v16))
  {
    v17.origin.x = v8;
    v17.origin.y = v10;
    v17.size.width = v12;
    v17.size.height = v14;
    if (!CGRectIsEmpty(v17))
    {
      -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");
      -[SBTraitsOrientedContentViewController view](self->_orientedSceneViewController, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setContentViewBoundsInReferenceSpace:", v8, v10, v12, v14);

    }
  }
}

- (void)_evaluateVisibility
{
  id WeakRetained;
  int v4;
  uint64_t v5;
  _BOOL8 v6;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 hidden;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  v4 = -[FBScene isValid](self->_scene, "isValid");
  v5 = -[FBScene contentState](self->_scene, "contentState");
  v6 = v5 == 2;
  if (self->_hidden || WeakRetained == 0 || v4 == 0)
  {
    v6 = 0;
  }
  else if (self->_shouldPresentAnyContentState && self->_targetDisplayConfiguration)
  {
    v6 = 1;
  }
  SBLogSystemUIScene();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = WeakRetained != 0;
    -[FBScene identifier](self->_scene, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    hidden = self->_hidden;
    v13 = 138544642;
    v14 = v11;
    v15 = 1024;
    v16 = hidden;
    v17 = 1024;
    v18 = v6;
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = v4;
    v23 = 1024;
    v24 = v5 == 2;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] hidden[%{BOOL}u] shouldBeVisible[%{BOOL}u] hasPresenter[%{BOOL}u] sceneIsValid[%{BOOL}u] contentIsReady[%{BOOL}u]", (uint8_t *)&v13, 0x2Au);

  }
  -[SBSingleSceneController _setVisible:](self, "_setVisible:", v6);
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)sceneContentStateDidChange:(id)a3
{
  FBScene *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id location;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (FBScene *)a3;
  if (self->_scene != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_scene == scene"));

  }
  v6 = -[FBScene contentState](v5, "contentState");
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (!v6)
    {
      SBLogSystemUIScene();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[FBScene identifier](self->_scene, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneContentStateDidChange: not ready", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke;
      v15[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v16, (id *)buf);
      dispatch_async(MEMORY[0x1E0C80D38], v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    SBLogSystemUIScene();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identifier](self->_scene, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneContentStateDidChange: preparing or ready", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke_26;
    block[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v13, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __56__SBSingleSceneController_didUpdateSceneTraitsDelegate___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((a3 & 3) == 2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[6], "updateOrientationIfNeeded");
    WeakRetained = v5;
  }

}

void __40__SBSingleSceneController__presentScene__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  if (WeakRetained)
  {
    SBLogSystemUIScene();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2114;
      v14 = WeakRetained;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenter[%{public}@] will present scene", buf, 0x16u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 96);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__SBSingleSceneController__presentScene__block_invoke_28;
    v10[3] = &unk_1E8EBE1A8;
    v10[4] = v5;
    v7 = (id)objc_msgSend(WeakRetained, "presentScene:viewControllerBuilderBlock:", v6, v10);
    v8 = *(id **)(a1 + 32);
    objc_msgSend(v8[3], "sceneTraitsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didUpdateSceneTraitsDelegate:", v9);

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isActive") & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activate");
  }

}

- (id)traitsOrientedViewController
{
  SBTraitsOrientedContentViewController *orientedSceneViewController;
  SBTraitsOrientedContentViewController *v4;
  SBTraitsOrientedContentViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  UIScenePresenter *v16;
  UIScenePresenter *uiScenePresenter;
  void *v18;
  BSInvalidatable *v19;
  BSInvalidatable *settingsUpdaterObserverInvalidatable;
  void *v21;

  orientedSceneViewController = self->_orientedSceneViewController;
  if (!orientedSceneViewController)
  {
    v4 = -[SBTraitsOrientedContentViewController initWithNibName:bundle:]([SBTraitsOrientedContentViewController alloc], "initWithNibName:bundle:", 0, 0);
    v5 = self->_orientedSceneViewController;
    self->_orientedSceneViewController = v4;

    -[SBTraitsOrientedContentViewController view](self->_orientedSceneViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentOrientation:", 1);
    objc_msgSend(v6, "setContainerOrientation:", 1);
    -[FBScene settings](self->_scene, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v6, "setContentViewBoundsInReferenceSpace:");

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    if (self->_scene && !self->_uiScenePresenter)
    {
      objc_msgSend(0, "deactivate");
      -[UIScenePresenter invalidate](self->_uiScenePresenter, "invalidate");
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene identifier](self->_scene, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_1E8EC7EC0;
      if (v12)
        v14 = (const __CFString *)v12;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "createPresenterWithIdentifier:priority:", v15, 0);
      v16 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      uiScenePresenter = self->_uiScenePresenter;
      self->_uiScenePresenter = v16;

      -[UIScenePresenter modifyPresentationContext:](self->_uiScenePresenter, "modifyPresentationContext:", &__block_literal_global_49_3);
      -[UIScenePresenter presentationView](self->_uiScenePresenter, "presentationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentView:", v18);

    }
    -[BSInvalidatable invalidate](self->_settingsUpdaterObserverInvalidatable, "invalidate");
    -[SBSceneSettingsUpdater addObserver:](self->_sceneSettingsUpdater, "addObserver:", self);
    v19 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    settingsUpdaterObserverInvalidatable = self->_settingsUpdaterObserverInvalidatable;
    self->_settingsUpdaterObserverInvalidatable = v19;

    -[SBSceneSettingsUpdater sceneTraitsDelegate](self->_sceneSettingsUpdater, "sceneTraitsDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSingleSceneController didUpdateSceneTraitsDelegate:](self, "didUpdateSceneTraitsDelegate:", v21);

    orientedSceneViewController = self->_orientedSceneViewController;
  }
  return orientedSceneViewController;
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_targetDisplayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_targetDisplayConfiguration, a3);
    -[SBSceneSettingsUpdater setDisplayConfiguration:](self->_sceneSettingsUpdater, "setDisplayConfiguration:", v8);
    if (v8)
    {
      -[FBScene systemShellHostingEnvironment](self->_scene, "systemShellHostingEnvironment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSystemShellHostingSpaceIdentifier:", v6);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "sceneDidChangeDisplayIdentity:", self->_scene);
    -[SBSingleSceneController _evaluateSceneActivationState](self, "_evaluateSceneActivationState");
    -[SBSingleSceneController _evaluateSceneForegroundState](self, "_evaluateSceneForegroundState");
    -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");

  }
}

- (void)setPresenter:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (!v4)
  {
    SBLogSystemUIScene();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identifier](self->_scene, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] setPresenter[nil]", (uint8_t *)&v11, 0xCu);

    }
    v8 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqual:", WeakRetained) & 1) == 0)
  {
    SBLogSystemUIScene();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identifier](self->_scene, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = WeakRetained;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] setPresenter[%{public}@] oldPresenter[%{public}@]", (uint8_t *)&v11, 0x20u);

    }
    -[SBSingleSceneController _setVisible:](self, "_setVisible:", 0);
    v8 = v4;
LABEL_9:
    objc_storeWeak((id *)&self->_presenter, v8);
  }
  -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");

}

- (void)_presentScene
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__SBSingleSceneController__presentScene__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

- (id)_newActivationContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[UISceneRequestOptions actions](self->_sceneOptions, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_firstObjectPassingTest:", &__block_literal_global_363);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12[0] = &unk_1E91D2090;
    objc_msgSend(v3, "userActivityData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v12[1] = &unk_1E91D20A8;
    objc_msgSend(v3, "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v5;
    v12[2] = &unk_1E91D20C0;
    objc_msgSend(v3, "lastUpdateTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C0]), "initWithSettings:", v7);
    v9 = objc_alloc_init(MEMORY[0x1E0CEA350]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActions:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_evaluateSceneForegroundState
{
  FBSDisplayConfiguration *targetDisplayConfiguration;

  targetDisplayConfiguration = self->_targetDisplayConfiguration;
  if (!targetDisplayConfiguration || self->_shouldForegroundForDisplayConfiguration)
    -[SBSceneSettingsUpdater setForeground:](self->_sceneSettingsUpdater, "setForeground:", targetDisplayConfiguration != 0);
}

- (void)_evaluateSceneActivationState
{
  SBSceneSettingsUpdater *sceneSettingsUpdater;
  id v3;

  if (self->_shouldActivateForDisplayConfiguration)
  {
    if (self->_targetDisplayConfiguration)
    {
      sceneSettingsUpdater = self->_sceneSettingsUpdater;
      v3 = -[SBSingleSceneController _newActivationContext](self, "_newActivationContext");
      -[SBSceneSettingsUpdater setActive:withTransitionContext:](sceneSettingsUpdater, "setActive:withTransitionContext:", 1, v3);

    }
  }
}

- (SBSingleSceneController)initWithSceneWorkspaceController:(id)a3 sceneRequestOptions:(id)a4 clientIdentity:(id)a5 traitsRole:(id)a6 level:(double)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  SBSingleSceneController *v18;
  SBSingleSceneController *v19;
  SBFSceneWorkspaceController *sceneWorkspaceController;
  id *v21;
  SBSceneSettingsUpdater *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id *v34;
  id v35;
  SEL v36;
  objc_super v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  BSDispatchQueueAssertMain();
  if (v14)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneWorkspaceController"));

    if (v16)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneRequestOptions"));

      if (v17)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientIdentity"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitsRole"));

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)SBSingleSceneController;
  v18 = -[SBSingleSceneController init](&v37, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_traitsRole, a6);
    v19->_sceneContentVisible = 1;
    objc_storeStrong((id *)&v19->_clientIdentity, a5);
    objc_storeStrong((id *)&v19->_sceneOptions, a4);
    objc_storeStrong((id *)&v19->_sceneWorkspaceController, a3);
    sceneWorkspaceController = v19->_sceneWorkspaceController;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __112__SBSingleSceneController_initWithSceneWorkspaceController_sceneRequestOptions_clientIdentity_traitsRole_level___block_invoke;
    v33[3] = &unk_1E8EBE158;
    v36 = a2;
    v21 = v19;
    v34 = v21;
    v35 = v15;
    -[SBFSceneWorkspaceController createSceneForProcessIdentity:withOptions:completion:](sceneWorkspaceController, "createSceneForProcessIdentity:withOptions:completion:", v16, v35, v33);
    objc_msgSend(v21[12], "addObserver:", v21);
    v22 = [SBSceneSettingsUpdater alloc];
    v23 = v21[12];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBSceneSettingsUpdater initWithScene:persistentIdentifier:level:updatesGeometry:](v22, "initWithScene:persistentIdentifier:level:updatesGeometry:", v23, v25, 1, a7);
    v27 = v21[3];
    v21[3] = (id)v26;

    objc_msgSend(v21[3], "setTraitsRole:", v19->_traitsRole);
  }

  return v19;
}

void __112__SBSingleSceneController_initWithSceneWorkspaceController_sceneRequestOptions_clientIdentity_traitsRole_level___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(0, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("SBSingleSceneController.m"), 80, CFSTR("[%@] Scene workspace controller unexpectedly unable to create a new scene (with identifier:%@)"), v9, v10);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v3;

}

- (void)dealloc
{
  objc_super v3;

  -[SBSingleSceneController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSingleSceneController;
  -[SBSingleSceneController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  SBSingleSceneController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogSystemUIScene();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identifier](self->_scene, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating SBSingleSceneController[%p]", (uint8_t *)&v7, 0x16u);

  }
  -[BSInvalidatable invalidate](self->_settingsUpdaterObserverInvalidatable, "invalidate");
  -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v6 = (id)objc_msgSend(WeakRetained, "dismissScene:", self->_scene);

  if (-[FBScene isValid](self->_scene, "isValid"))
    -[FBScene invalidate](self->_scene, "invalidate");
  -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
  -[SBSceneSettingsUpdater setInitialSupportedInterfaceOrientations:](self->_sceneSettingsUpdater, "setInitialSupportedInterfaceOrientations:");
}

- (void)setShouldForegroundForDisplayConfiguration:(BOOL)a3
{
  self->_shouldForegroundForDisplayConfiguration = a3;
  -[SBSingleSceneController _evaluateSceneForegroundState](self, "_evaluateSceneForegroundState");
}

- (void)setShouldActivateForDisplayConfiguration:(BOOL)a3
{
  self->_shouldActivateForDisplayConfiguration = a3;
  -[SBSingleSceneController _evaluateSceneActivationState](self, "_evaluateSceneActivationState");
}

- (void)setShouldActivateUponClientConnection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  FBScene *scene;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[SBFSceneWorkspaceController delegate](self->_sceneWorkspaceController, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __65__SBSingleSceneController_setShouldActivateUponClientConnection___block_invoke;
  v10 = &unk_1E8EBE180;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setScene:shouldActivateUponClientConnection:withContextGenerator:", scene, v3, &v7);

  if (v3
    && (-[FBScene isActive](self->_scene, "isActive", v7, v8, v9, v10) & 1) == 0
    && -[SBSingleSceneController _isClientProcessRunning](self, "_isClientProcessRunning"))
  {
    -[SBSingleSceneController setSceneActive:](self, "setSceneActive:", 1);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __65__SBSingleSceneController_setShouldActivateUponClientConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_msgSend(WeakRetained, "_newActivationContext");

  return v2;
}

- (void)setShouldBeKeptActiveWhileForeground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  FBScene *scene;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[SBFSceneWorkspaceController delegate](self->_sceneWorkspaceController, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __64__SBSingleSceneController_setShouldBeKeptActiveWhileForeground___block_invoke;
  v12 = &unk_1E8EBE180;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setScene:shouldBeKeptActiveWhileForeground:withContextGenerator:", scene, v3, &v9);

  if (v3 && (-[FBScene isActive](self->_scene, "isActive", v9, v10, v11, v12) & 1) == 0)
  {
    -[FBScene settings](self->_scene, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isForeground") & 1) != 0)
    {
      v8 = -[SBSingleSceneController _isClientProcessRunning](self, "_isClientProcessRunning");

      if (v8)
        -[SBSingleSceneController setSceneActive:](self, "setSceneActive:", 1);
    }
    else
    {

    }
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __64__SBSingleSceneController_setShouldBeKeptActiveWhileForeground___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_msgSend(WeakRetained, "_newActivationContext");

  return v2;
}

- (BOOL)isSceneActive
{
  return -[SBSceneSettingsUpdater isActive](self->_sceneSettingsUpdater, "isActive");
}

- (void)setSceneActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  if (a3)
    v5 = -[SBSingleSceneController _newActivationContext](self, "_newActivationContext");
  else
    v5 = 0;
  v6 = v5;
  -[SBSceneSettingsUpdater setActive:withTransitionContext:](self->_sceneSettingsUpdater, "setActive:withTransitionContext:", v3, v5);

}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");
  }
}

- (NSString)scenePersistentIdentifier
{
  return -[SBSceneSettingsUpdater scenePersistentIdentifier](self->_sceneSettingsUpdater, "scenePersistentIdentifier");
}

void __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateVisibility");

}

void __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke_26(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateVisibility");

}

- (void)sceneDidInvalidate:(id)a3
{
  FBScene *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (FBScene *)a3;
  if (self->_scene != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_scene == scene"));

  }
  SBLogSystemUIScene();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identifier](self->_scene, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneDidInvalidate", buf, 0xCu);

  }
  -[SBSingleSceneController _evaluateVisibility](self, "_evaluateVisibility");

}

- (void)_setVisible:(BOOL)a3
{
  FBScene *scene;
  void *v5;
  void *v6;
  void *v7;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    if (a3)
    {
      scene = self->_scene;
      v5 = (void *)SBApp;
      -[FBSDisplayConfiguration identity](self->_targetDisplayConfiguration, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInterfaceStyleProviderForDisplay:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSceneSettingsUpdater safeUpdateScene:withUserInterfaceStyle:](SBSceneSettingsUpdater, "safeUpdateScene:withUserInterfaceStyle:", scene, objc_msgSend(v7, "currentStyle"));

      -[SBSceneSettingsUpdater setAllowsTraitsArbitration:](self->_sceneSettingsUpdater, "setAllowsTraitsArbitration:", 1);
      -[SBSingleSceneController _presentScene](self, "_presentScene");
    }
    else
    {
      -[SBSingleSceneController _dismissScene](self, "_dismissScene");
      -[SBSceneSettingsUpdater setAllowsTraitsArbitration:](self->_sceneSettingsUpdater, "setAllowsTraitsArbitration:", 0);
    }
  }
}

id __40__SBSingleSceneController__presentScene__block_invoke_28(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_dismissScene
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[UIScenePresenter isActive](self->_uiScenePresenter, "isActive"))
    -[UIScenePresenter deactivate](self->_uiScenePresenter, "deactivate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  SBLogSystemUIScene();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identifier](self->_scene, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = WeakRetained;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenter[%{public}@] will dismiss scene", (uint8_t *)&v7, 0x16u);

  }
  v6 = (id)objc_msgSend(WeakRetained, "dismissScene:", self->_scene);

}

uint64_t __48__SBSingleSceneController__newActivationContext__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isClientProcessRunning
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processForIdentity:", self->_clientIdentity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  return v5;
}

void __55__SBSingleSceneController_traitsOrientedViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", v4);

}

- (id)traitsOrientedResizableViewController
{
  SBTraitsOrientedResizableContentViewController *resizableOrientedSceneViewController;
  FBScene *scene;
  uint64_t v6;
  SBUIKitResizableSceneHostComponent *v7;
  SBUIKitResizableSceneHostComponent *hostComponent;
  SBTraitsOrientedResizableContentViewController *v9;
  void *v10;
  SBTraitsOrientedResizableContentViewController *v11;
  SBTraitsOrientedResizableContentViewController *v12;
  void *v14;

  resizableOrientedSceneViewController = self->_resizableOrientedSceneViewController;
  if (!resizableOrientedSceneViewController)
  {
    if (-[SBSingleSceneController isSceneActive](self, "isSceneActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleSceneController.m"), 412, CFSTR("Scene can not be activated to get a proper resizable view controller."));

    }
    -[FBScene addExtension:](self->_scene, "addExtension:", objc_opt_class());
    -[SBSingleSceneController setSceneActive:](self, "setSceneActive:", 1);
    -[SBSceneSettingsUpdater setForeground:](self->_sceneSettingsUpdater, "setForeground:", 1);
    scene = self->_scene;
    v6 = objc_opt_class();
    -[FBScene componentForExtension:ofClass:](scene, "componentForExtension:ofClass:", v6, objc_opt_class());
    v7 = (SBUIKitResizableSceneHostComponent *)objc_claimAutoreleasedReturnValue();
    hostComponent = self->_hostComponent;
    self->_hostComponent = v7;

    v9 = [SBTraitsOrientedResizableContentViewController alloc];
    -[SBSingleSceneController traitsOrientedViewController](self, "traitsOrientedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBTraitsOrientedResizableContentViewController initWithContentViewController:delegate:](v9, "initWithContentViewController:delegate:", v10, self->_hostComponent);
    v12 = self->_resizableOrientedSceneViewController;
    self->_resizableOrientedSceneViewController = v11;

    resizableOrientedSceneViewController = self->_resizableOrientedSceneViewController;
  }
  return resizableOrientedSceneViewController;
}

- (NSString)debugDescription
{
  return (NSString *)-[SBSingleSceneController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSingleSceneController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSingleSceneController scenePersistentIdentifier](self, "scenePersistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("scenePersistentIdentifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSingleSceneController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSingleSceneController *v11;

  v4 = a3;
  -[SBSingleSceneController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBSingleSceneController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __65__SBSingleSceneController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("scene"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSceneContentVisible"), CFSTR("isSceneContentVisible"));
  v6 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 104));
  v7 = (id)objc_msgSend(v6, "appendObject:withName:", WeakRetained, CFSTR("presenter"));

}

- (SBFSceneWorkspaceController)sceneWorkspaceController
{
  return self->_sceneWorkspaceController;
}

- (UISceneRequestOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (FBScene)scene
{
  return self->_scene;
}

- (SBScenePresenting)presenter
{
  return (SBScenePresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (BOOL)visible
{
  return self->_visible;
}

- (SBUIKitResizableSceneHostComponent)hostComponent
{
  return self->_hostComponent;
}

- (void)setHostComponent:(id)a3
{
  objc_storeStrong((id *)&self->_hostComponent, a3);
}

- (BOOL)shouldForegroundForDisplayConfiguration
{
  return self->_shouldForegroundForDisplayConfiguration;
}

- (BOOL)shouldActivateForDisplayConfiguration
{
  return self->_shouldActivateForDisplayConfiguration;
}

- (BOOL)shouldActivateUponClientConnection
{
  return self->_shouldActivateUponClientConnection;
}

- (BOOL)shouldBeKeptActiveWhileForeground
{
  return self->_shouldBeKeptActiveWhileForeground;
}

- (BOOL)shouldPresentAnyContentState
{
  return self->_shouldPresentAnyContentState;
}

- (void)setShouldPresentAnyContentState:(BOOL)a3
{
  self->_shouldPresentAnyContentState = a3;
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSceneContentVisible
{
  return self->_sceneContentVisible;
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  return self->_targetDisplayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_hostComponent, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_resizableOrientedSceneViewController, 0);
  objc_storeStrong((id *)&self->_orientedSceneViewController, 0);
  objc_storeStrong((id *)&self->_lastSceneTraitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_uiScenePresenter, 0);
  objc_storeStrong((id *)&self->_sceneSettingsUpdater, 0);
  objc_storeStrong((id *)&self->_settingsUpdaterObserverInvalidatable, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

@end
