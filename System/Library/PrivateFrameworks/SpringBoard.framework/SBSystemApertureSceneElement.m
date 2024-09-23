@implementation SBSystemApertureSceneElement

+ (id)activePlaceholderElementPassingTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "activeElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSystemApertureSceneElement_activePlaceholderElementPassingTest___block_invoke;
  v9[3] = &unk_1E8EBE318;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __68__SBSystemApertureSceneElement_activePlaceholderElementPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "placeholderContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 0;
    else
      v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (NSArray)activeElements
{
  return (NSArray *)objc_msgSend((id)SBSystemApertureSceneElementActiveElements, "allObjects");
}

+ (NSSet)scenesForBacklightSession
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "activeElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_365);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __57__SBSystemApertureSceneElement_scenesForBacklightSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scene");
}

+ (void)addActiveElement:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (void *)SBSystemApertureSceneElementActiveElements;
    if (!SBSystemApertureSceneElementActiveElements)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)SBSystemApertureSceneElementActiveElements;
      SBSystemApertureSceneElementActiveElements = v5;

      v4 = (void *)SBSystemApertureSceneElementActiveElements;
    }
    objc_msgSend(v4, "addObject:", v7);
  }
  objc_msgSend(a1, "hostedScenesDidChange");

}

+ (void)removeActiveElement:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
    objc_msgSend((id)SBSystemApertureSceneElementActiveElements, "removeObject:", v5);
  if (!objc_msgSend((id)SBSystemApertureSceneElementActiveElements, "count"))
  {
    v4 = (void *)SBSystemApertureSceneElementActiveElements;
    SBSystemApertureSceneElementActiveElements = 0;

  }
  objc_msgSend(a1, "hostedScenesDidChange");

}

+ (id)elementsReadyForPresentation
{
  return (id)objc_msgSend((id)SBSystemApertureSceneElementsReadyForPresentation, "allObjects");
}

+ (void)addElementReadyForPresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    v7 = v3;
    if (!SBSystemApertureSceneElementsReadyForPresentation)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
      SBSystemApertureSceneElementsReadyForPresentation = v5;

      v4 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

+ (void)removeElementReadyForPresentation:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend((id)SBSystemApertureSceneElementsReadyForPresentation, "removeObject:", v4);
  if (!objc_msgSend((id)SBSystemApertureSceneElementsReadyForPresentation, "count"))
  {
    v3 = (void *)SBSystemApertureSceneElementsReadyForPresentation;
    SBSystemApertureSceneElementsReadyForPresentation = 0;

  }
}

+ (void)hostedScenesDidChange
{
  id v2;

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "hostedScenesDidChange");

}

+ (id)sceneWorkspaceIdentifier
{
  return CFSTR("com.apple.SpringBoardUIServices.SystemAperture");
}

+ (FBSceneWorkspace)sceneWorkspace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SBSystemApertureSceneElement_sceneWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sceneWorkspace_onceToken != -1)
    dispatch_once(&sceneWorkspace_onceToken, block);
  return (FBSceneWorkspace *)(id)sceneWorkspace_sceneWorkspace;
}

void __46__SBSystemApertureSceneElement_sceneWorkspace__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0D22988]);
  objc_msgSend(*(id *)(a1 + 32), "sceneWorkspaceIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithIdentifier:", v5);
  v4 = (void *)sceneWorkspace_sceneWorkspace;
  sceneWorkspace_sceneWorkspace = v3;

}

+ (id)defaultAnimationParameters
{
  if (defaultAnimationParameters_onceToken != -1)
    dispatch_once(&defaultAnimationParameters_onceToken, &__block_literal_global_35_4);
  return (id)defaultAnimationParameters_params;
}

void __58__SBSystemApertureSceneElement_defaultAnimationParameters__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0DAC680]);
  +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultInterfaceElementTransitionSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "boundsBehaviorSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithFluidBehaviorSettings:tracking:retargeted:", v2, 0, 0);
  v4 = (void *)defaultAnimationParameters_params;
  defaultAnimationParameters_params = v3;

}

- (SBSystemApertureSceneElement)initWithSceneSpecification:(id)a3 sceneClientIdentity:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBSystemApertureSceneElement *v15;
  id v16;
  id v17;
  void *v18;
  SBSystemApertureSceneElement *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  SBSystemApertureSceneElement *v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend((id)objc_opt_class(), "sceneWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __147__SBSystemApertureSceneElement_initWithSceneSpecification_sceneClientIdentity_statusBarBackgroundActivitiesSuppresser_readyForPresentationHandler___block_invoke;
  v21[3] = &unk_1E8EBE3A0;
  v22 = v10;
  v23 = v11;
  v15 = self;
  v24 = v15;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "createScene:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SBSystemApertureSceneElement initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v15, "initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v18, v13, v12);
  return v19;
}

void __147__SBSystemApertureSceneElement_initWithSceneSpecification_sceneClientIdentity_statusBarBackgroundActivitiesSuppresser_readyForPresentationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSpecification:", v3);
  objc_msgSend(v4, "setClientIdentity:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_opt_class(), "sceneWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

}

- (SBSystemApertureSceneElement)initWithScene:(id)a3 statusBarBackgroundActivitiesSuppresser:(id)a4 readyForPresentationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSystemApertureSceneElement *v12;
  SBSystemApertureSceneElement *v13;
  SBSystemApertureSceneElement *result;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((SBUIIsSystemApertureEnabled() & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)SBSystemApertureSceneElement;
    v12 = -[SBSystemApertureSceneElement init](&v16, sel_init);
    v13 = v12;
    if (v12)
      -[SBSystemApertureSceneElement _commonInitWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v12, "_commonInitWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v9, 0, v10, v11);

    return v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Do not create a SBSystemApertureSceneElement if SBUIIsSystemApertureEnabled == NO."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemApertureSceneElement initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = (SBSystemApertureSceneElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (SBSystemApertureSceneElement)initWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBSystemApertureSceneElement *v15;
  SBSystemApertureSceneElement *v16;
  SBSystemApertureSceneElement *result;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((SBUIIsSystemApertureEnabled() & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSystemApertureSceneElement;
    v15 = -[SBSystemApertureSceneElement init](&v19, sel_init);
    v16 = v15;
    if (v15)
      -[SBSystemApertureSceneElement _commonInitWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v15, "_commonInitWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v11, v12, v13, v14);

    return v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Do not create a SBSystemApertureSceneElement if SBUIIsSystemApertureEnabled == NO."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemApertureSceneElement initWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (SBSystemApertureSceneElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_commonInitWithScene:(id)a3 placeholderContentProvider:(id)a4 statusBarBackgroundActivitiesSuppresser:(id)a5 readyForPresentationHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id readyHandler;
  SBSystemApertureSceneElementAccessoryView *v16;
  SBSystemApertureSceneElementAccessoryView *leadingView;
  SBSystemApertureSceneElementAccessoryView *v18;
  SBSystemApertureSceneElementAccessoryView *trailingView;
  SBSystemApertureSceneElementAccessoryView *v20;
  SBSystemApertureSceneElementAccessoryView *minimalView;
  NSMutableArray *v22;
  NSMutableArray *deferredSceneActions;
  void *v24;
  SBSystemApertureSceneElementPlaceholderWrapperView *v25;
  SBSystemApertureSceneElementPlaceholderWrapperView *leadingWrapperView;
  void *v27;
  SBSystemApertureSceneElementPlaceholderWrapperView *v28;
  SBSystemApertureSceneElementPlaceholderWrapperView *trailingWrapperView;
  void *v30;
  SBSystemApertureSceneElementPlaceholderWrapperView *v31;
  void *v32;
  SBSystemApertureSceneElementPlaceholderWrapperView *v33;
  SBSystemApertureSceneElementPlaceholderWrapperView *minimalWrapperView;
  SBSystemActionElementPreviewingCoordinator *v35;
  SBSystemActionElementPreviewingCoordinator *previewingCoordinator;
  id v37;

  v37 = a3;
  v11 = a4;
  objc_storeStrong((id *)&self->_scene, a3);
  v12 = a6;
  v13 = a5;
  objc_storeWeak((id *)&self->_placeholderContentProvider, v11);
  v14 = (void *)objc_msgSend(v12, "copy");

  readyHandler = self->_readyHandler;
  self->_readyHandler = v14;

  objc_storeWeak((id *)&self->_statusBarBackgroundActivitiesSuppresser, v13);
  v16 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E0DAC260]);
  leadingView = self->_leadingView;
  self->_leadingView = v16;

  v18 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E0DAC260]);
  trailingView = self->_trailingView;
  self->_trailingView = v18;

  v20 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E0DAC260]);
  minimalView = self->_minimalView;
  self->_minimalView = v20;

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    deferredSceneActions = self->_deferredSceneActions;
    self->_deferredSceneActions = v22;

  }
  objc_msgSend(v11, "leadingView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = -[SBSystemApertureSceneElementPlaceholderWrapperView initWithContentView:]([SBSystemApertureSceneElementPlaceholderWrapperView alloc], "initWithContentView:", v24);
    leadingWrapperView = self->_leadingWrapperView;
    self->_leadingWrapperView = v25;

    -[SBSystemApertureSceneElementPlaceholderWrapperView setDelegate:](self->_leadingWrapperView, "setDelegate:", self);
  }
  objc_msgSend(v11, "trailingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = -[SBSystemApertureSceneElementPlaceholderWrapperView initWithContentView:]([SBSystemApertureSceneElementPlaceholderWrapperView alloc], "initWithContentView:", v27);
    trailingWrapperView = self->_trailingWrapperView;
    self->_trailingWrapperView = v28;

    -[SBSystemApertureSceneElementPlaceholderWrapperView setDelegate:](self->_trailingWrapperView, "setDelegate:", self);
  }
  objc_msgSend(v11, "minimalView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = [SBSystemApertureSceneElementPlaceholderWrapperView alloc];
    if (v30 == v24)
      v32 = 0;
    else
      v32 = v30;
    v33 = -[SBSystemApertureSceneElementPlaceholderWrapperView initWithContentView:](v31, "initWithContentView:", v32);
    minimalWrapperView = self->_minimalWrapperView;
    self->_minimalWrapperView = v33;

    -[SBSystemApertureSceneElementPlaceholderWrapperView setDelegate:](self->_minimalWrapperView, "setDelegate:", self);
  }
  self->_wantsLayoutPassForClientUpdate = 1;
  self->_obstructionEdge = 1;
  v35 = (SBSystemActionElementPreviewingCoordinator *)-[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], self);
  previewingCoordinator = self->_previewingCoordinator;
  self->_previewingCoordinator = v35;

}

- (void)deactivateWhenRemovedWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id location;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (-[SBSystemApertureSceneElement isDeactivating](self, "isDeactivating"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 404, CFSTR("Cannot deactivate if already deactivating."));

  }
  if (!-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 405, CFSTR("Cannot deactivate if not activated."));

  }
  -[SBSystemApertureSceneElement _addActivationAttribute:](self, "_addActivationAttribute:", 8);
  -[SBSystemApertureSceneElement scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isActive"))
    goto LABEL_8;
  -[SBSystemApertureSceneElement scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRunning");

  if (v11)
  {
    -[SBSystemApertureSceneElement scene](self, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performUpdate:", &__block_literal_global_58_0);
LABEL_8:

  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_2;
  v19[3] = &unk_1E8EAB868;
  v20 = v5;
  v13 = v5;
  -[SBSystemApertureSceneElement setDeactivationHandler:](self, "setDeactivationHandler:", v19);
  -[SBSystemApertureSceneElement _finishDeactivationIfNeeded](self, "_finishDeactivationIfNeeded");
  objc_initWeak(&location, self);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_3;
  v16[3] = &unk_1E8E9F280;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setObject:forSetting:", MEMORY[0x1E0C9AAB0], 3213017);
}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __65__SBSystemApertureSceneElement_deactivateWhenRemovedWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend((id)objc_opt_class(), "removeElementReadyForPresentation:", WeakRetained);

}

- (void)_finishDeactivationIfNeeded
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t v7;
  int v8;
  void *v9;
  id v10;

  v3 = -[SBSystemApertureSceneElement isDeactivating](self, "isDeactivating");
  v4 = -[SBSystemApertureSceneElement _hasActivationAttribute:](self, "_hasActivationAttribute:", 1);
  v5 = -[SBSystemApertureSceneElement _hasActivationAttribute:](self, "_hasActivationAttribute:", 2);
  v6 = -[SBSystemApertureSceneElement _hasActivationAttribute:](self, "_hasActivationAttribute:", 4);
  v7 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode");
  v8 = v6 && v5 || !v5;
  if (v7 != -1)
    v8 = 0;
  if (!v4)
    v8 = 1;
  if ((v3 & v8) == 1)
  {
    -[SBSystemApertureSceneElement deactivationHandler](self, "deactivationHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureSceneElement setDeactivationHandler:](self, "setDeactivationHandler:", 0);
    v9 = v10;
    if (v10)
    {
      (*((void (**)(id, SBSystemApertureSceneElement *))v10 + 2))(v10, self);
      v9 = v10;
    }

  }
}

- (void)_addActivationAttribute:(unint64_t)a3
{
  self->_activationAttributes |= a3;
  -[SBSystemApertureSceneElement _finishDeactivationIfNeeded](self, "_finishDeactivationIfNeeded");
}

- (BOOL)_hasActivationAttribute:(unint64_t)a3
{
  return (a3 & ~self->_activationAttributes) == 0;
}

- (BOOL)isDeactivating
{
  _BOOL4 v3;

  v3 = -[SBSystemApertureSceneElement _hasActivationAttribute:](self, "_hasActivationAttribute:", 8);
  if (v3)
    LOBYTE(v3) = -[SBSystemApertureSceneElement isActivated](self, "isActivated");
  return v3;
}

- (void)invalidate
{
  SAAutomaticallyInvalidatable *alertingActivityAssertion;
  SAAutomaticallyInvalidatable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 invalidatingForMoveToPlaceholderElement;
  void *v15;
  id v16;

  if (!-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 463, CFSTR("Cannot invalidate if not activated."));

  }
  if (-[SAAutomaticallyInvalidatable isValid](self->_alertingActivityAssertion, "isValid"))
  {
    alertingActivityAssertion = self->_alertingActivityAssertion;
    self->_alertingActivityAssertion = 0;
    v5 = alertingActivityAssertion;

    -[SAAutomaticallyInvalidatable invalidateWithReason:](v5, "invalidateWithReason:", CFSTR("scene element invalidated"));
  }
  -[SBSystemApertureSceneElement setActivated:](self, "setActivated:", 0);
  -[SBSystemApertureSceneElement _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded](self, "_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded");
  -[SBSystemApertureSceneElement scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[SBSystemApertureSceneElement scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  LODWORD(v8) = -[SBSystemApertureSceneElement _ownsScene](self, "_ownsScene");
  -[SBSystemApertureSceneElement scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  if ((_DWORD)v8)
  {
    objc_msgSend(v9, "performUpdate:", &__block_literal_global_65_2);

    -[SBSystemApertureSceneElement scene](self, "scene");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");
LABEL_13:

    return;
  }
  if (!objc_msgSend(v9, "isActive"))
    goto LABEL_13;
  -[SBSystemApertureSceneElement scene](self, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isRunning"))
  {

    goto LABEL_13;
  }
  invalidatingForMoveToPlaceholderElement = self->_invalidatingForMoveToPlaceholderElement;

  if (!invalidatingForMoveToPlaceholderElement)
  {
    -[SBSystemApertureSceneElement scene](self, "scene");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performUpdate:", &__block_literal_global_66_3);
    goto LABEL_13;
  }
}

void __42__SBSystemApertureSceneElement_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_msgSend(v2, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v2, "setForeground:", 0);
  objc_msgSend(v7, "SBUISA_setLayoutMode:forSetting:", -1, 3213009);

}

void __42__SBSystemApertureSceneElement_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_msgSend(v2, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v2, "setForeground:", 0);
  objc_msgSend(v7, "SBUISA_setLayoutMode:forSetting:", -1, 3213009);

}

- (void)dealloc
{
  BSInvalidatable *activeApplicationElementAssertion;
  void *v5;
  objc_super v6;

  -[BSInvalidatable invalidate](self->_activeApplicationElementAssertion, "invalidate");
  activeApplicationElementAssertion = self->_activeApplicationElementAssertion;
  self->_activeApplicationElementAssertion = 0;

  if (-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 492, CFSTR("Failed to invalidate."));

  }
  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureSceneElement;
  -[SBSystemApertureSceneElement dealloc](&v6, sel_dealloc);
}

- (SBSystemApertureSceneElementConfiguration)configuration
{
  SBSystemApertureSceneElementConfiguration *configuration;
  SBSystemApertureSceneElementConfiguration *v4;
  SBSystemApertureSceneElementConfiguration *v5;

  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
    v5 = self->_configuration;
    self->_configuration = v4;

    configuration = self->_configuration;
  }
  return configuration;
}

- (void)setConfiguration:(id)a3
{
  SBSystemApertureSceneElementConfiguration *v5;
  SBSystemApertureSceneElementConfiguration *configuration;
  void *v7;
  id v8;

  v8 = a3;
  if (-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 504, CFSTR("SBSystemApertureSceneElementConfiguration may only be set when %@ is not activated"), self);

  }
  v5 = (SBSystemApertureSceneElementConfiguration *)objc_msgSend(v8, "copy");
  configuration = self->_configuration;
  self->_configuration = v5;

}

- (void)activate
{
  -[SBSystemApertureSceneElement activateWithInitialOtherClientSettings:](self, "activateWithInitialOtherClientSettings:", 0);
}

- (void)activateWithInitialOtherSceneSettings:(id)a3
{
  -[SBSystemApertureSceneElement activateWithInitialOtherSceneSettings:clientSettings:transitionRequestHandler:](self, "activateWithInitialOtherSceneSettings:clientSettings:transitionRequestHandler:", a3, 0, &__block_literal_global_75_2);
}

uint64_t __70__SBSystemApertureSceneElement_activateWithInitialOtherSceneSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSceneWithTransitionParameters:");
}

- (void)activateWithInitialOtherClientSettings:(id)a3
{
  -[SBSystemApertureSceneElement activateWithInitialOtherSceneSettings:clientSettings:transitionRequestHandler:](self, "activateWithInitialOtherSceneSettings:clientSettings:transitionRequestHandler:", 0, a3, &__block_literal_global_76_1);
}

uint64_t __71__SBSystemApertureSceneElement_activateWithInitialOtherClientSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSceneWithTransitionParameters:");
}

- (void)activateWithInitialOtherSceneSettings:(id)a3 clientSettings:(id)a4 transitionRequestHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id transitionRequestHandler;
  void *v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 525, CFSTR("Already activated."));

  }
  -[SBSystemApertureSceneElement setActivated:](self, "setActivated:", 1);
  -[SBSystemApertureSceneElement _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded](self, "_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded");
  v12 = (void *)MEMORY[0x1D17E5550](v9);

  transitionRequestHandler = self->_transitionRequestHandler;
  self->_transitionRequestHandler = v12;

  -[SBSystemApertureSceneElement _activateSceneWithInitialOtherSettings:clientSettings:initialLayoutMode:](self, "_activateSceneWithInitialOtherSettings:clientSettings:initialLayoutMode:", v11, v10, 1);
  -[SBSystemApertureSceneElement _updateReadyForPresentationIfNeeded](self, "_updateReadyForPresentationIfNeeded");
}

- (void)activateWithPostActivationPlaceholderTest:(id)a3 foundPlaceholderHandler:(id)a4
{
  id v6;
  void *v7;
  id postSceneActivationPlaceholderTest;
  void *v9;
  id postSceneActivationPlaceholderElementFoundHandler;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  postSceneActivationPlaceholderTest = self->_postSceneActivationPlaceholderTest;
  self->_postSceneActivationPlaceholderTest = v7;

  v9 = (void *)objc_msgSend(v6, "copy");
  postSceneActivationPlaceholderElementFoundHandler = self->_postSceneActivationPlaceholderElementFoundHandler;
  self->_postSceneActivationPlaceholderElementFoundHandler = v9;

  -[SBSystemApertureSceneElement activate](self, "activate");
}

- (void)updateWithConnectedScene:(id)a3 configuration:(id)a4 elementAssertionAcquisitionHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  SBSystemApertureSceneElementConfiguration *v14;
  SBSystemApertureSceneElementConfiguration *configuration;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *deferredSceneActions;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  SBSystemApertureSceneElement *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (!-[SBSystemApertureSceneElement isActivated](self, "isActivated") || !WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 541, CFSTR("Invalid to add a scene to an inactive element or one that isn't using placeholder content"));

  }
  objc_storeStrong((id *)&self->_scene, a3);
  if (v11)
  {
    v14 = (SBSystemApertureSceneElementConfiguration *)objc_msgSend(v11, "copy");
    configuration = self->_configuration;
    self->_configuration = v14;

  }
  -[SBSystemApertureSceneElement _activateSceneWithInitialOtherSettings:clientSettings:initialLayoutMode:](self, "_activateSceneWithInitialOtherSettings:clientSettings:initialLayoutMode:", 0, 0, -[SBSystemApertureSceneElement _clientLayoutModeForLayoutMode:](self, "_clientLayoutModeForLayoutMode:", -[SBSystemApertureSceneElement layoutMode](self, "layoutMode")));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = self->_deferredSceneActions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20) + 16))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20));
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v18);
  }

  deferredSceneActions = self->_deferredSceneActions;
  self->_deferredSceneActions = 0;

  objc_msgSend(WeakRetained, "noteSceneClientWantsControlOfElementWithAssertionTransferBlock:", v12, (_QWORD)v27);
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "SBUISA_containerViewFrame");
  -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", 128, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement _applyTransitionParameters:](self, "_applyTransitionParameters:", v23);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
  v32 = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v25);

}

- (void)_activateSceneWithInitialOtherSettings:(id)a3 clientSettings:(id)a4 initialLayoutMode:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  SBSystemApertureSceneElementTransitionParameters *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[5];
  SBSystemApertureSceneElementTransitionParameters *v48;
  id v49;
  id v50;

  v46 = a3;
  v9 = a4;
  -[SBSystemApertureSceneElement scene](self, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  -[SBSystemApertureSceneElement scene](self, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layerManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  v13 = objc_alloc_init(SBSystemApertureSceneElementTransitionParameters);
  if (-[SBSystemApertureSceneElement _requiresForegroundScene](self, "_requiresForegroundScene"))
  {
    -[SBSystemApertureSceneElementTransitionParameters setWantsForeground:](v13, "setWantsForeground:", 1);
  }
  else
  {
    -[SBSystemApertureSceneElement scene](self, "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureSceneElementTransitionParameters setWantsForeground:](v13, "setWantsForeground:", objc_msgSend(v15, "isForeground"));

  }
  -[SBSystemApertureSceneElementTransitionParameters setShouldSetForeground:](v13, "setShouldSetForeground:", -[SBSystemApertureSceneElementTransitionParameters wantsForeground](v13, "wantsForeground"));
  v16 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v16, "SBUISA_setLayoutMode:forSetting:", a5, 3213009);
  -[SBSystemApertureSceneElement _obstructedAreaFrame](self, "_obstructedAreaFrame");
  objc_msgSend(v16, "SBUISA_setCGRect:forSetting:", 3213015);
  if (v46)
    objc_msgSend(v16, "applySettings:");
  -[SBSystemApertureSceneElement _sizeForSceneView](self, "_sizeForSceneView");
  -[SBSystemApertureSceneElementTransitionParameters setSceneSize:](v13, "setSceneSize:");
  -[SBSystemApertureSceneElementTransitionParameters setOtherSystemApertureSceneSettingsToApply:](v13, "setOtherSystemApertureSceneSettingsToApply:", v16);
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = (void *)MEMORY[0x1E0DAC6D0];
  objc_msgSend((id)objc_opt_class(), "defaultAnimationParameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transientLocalResizeSceneActionWithAnimationParameters:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setActions:", v22);
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (-[SBSystemApertureSceneElement _ownsScene](self, "_ownsScene"))
    goto LABEL_13;
  -[SBSystemApertureSceneElement scene](self, "scene");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_9;
  v25 = (void *)v24;
  -[SBSystemApertureSceneElement scene](self, "scene");
  v45 = v16;
  v26 = v17;
  v27 = WeakRetained;
  v28 = v22;
  v29 = v9;
  v30 = a2;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isActive");

  a2 = v30;
  v9 = v29;
  v22 = v28;
  WeakRetained = v27;
  v17 = v26;
  v16 = v45;

  if ((v32 & 1) == 0)
  {
LABEL_13:
    -[SBSystemApertureSceneElement scene](self, "scene");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isActive");

    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 585, CFSTR("Scene should not be active!"));

    }
    -[SBSystemApertureSceneElement scene](self, "scene");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke;
    v47[3] = &unk_1E8EBE4D0;
    v47[4] = self;
    v48 = v13;
    v49 = v9;
    v50 = WeakRetained;
    objc_msgSend(v37, "configureParameters:", v47);

    -[SBSystemApertureSceneElement scene](self, "scene");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateWithTransitionContext:", v17);

  }
  else
  {
LABEL_9:
    -[SBSystemApertureSceneElement scene](self, "scene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isActive");

    if ((v34 & 1) == 0 && !WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 607, CFSTR("Scene must be active prior to activating element if we're not showing placeholder content."));

    }
    -[SBSystemApertureSceneElementTransitionParameters setTransitionContext:](v13, "setTransitionContext:", v17);
    -[SBSystemApertureSceneElement _updateSceneWithTransitionParameters:](self, "_updateSceneWithTransitionParameters:", v13);
  }
  -[SBSystemApertureSceneElement scene](self, "scene");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    v41 = -[SBSystemApertureSceneElement _sceneDisplayConfigurationValid](self, "_sceneDisplayConfigurationValid");

    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneElement.m"), 611, CFSTR("Scenes must use valid display configurations for system aperture."));

    }
  }

}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_2;
  v10[3] = &unk_1E8EB0DF0;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  objc_msgSend(v6, "updateSettingsWithBlock:", v10);
  v5 = *(void **)(a1 + 48);
  if (v5 || *(_QWORD *)(a1 + 56))
  {
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_3;
    v7[3] = &unk_1E8EBE4A8;
    v8 = v5;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v6, "updateClientSettingsWithBlock:", v7);

  }
}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", 1);
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_updateMutableSceneSettings:withParameters:", v4, *(_QWORD *)(a1 + 40));
}

void __104__SBSystemApertureSceneElement__activateSceneWithInitialOtherSettings_clientSettings_initialLayoutMode___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v8 = v6;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v8, "applySettings:");
  v7 = objc_msgSend(*(id *)(a1 + 40), "contentRole");
  if (v7)
    objc_msgSend(v8, "SBUISA_setContentRole:forSetting:", v7, 3213018);

}

- (BOOL)_sceneDisplayConfigurationValid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isMainDisplay") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isContinuityDisplay");

  return v6;
}

- (id)_existingAlertingAssertion
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "alertingActivityAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_alertHost);
    objc_msgSend(v6, "alertAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)_isValidAlertingSource:(int64_t)a3
{
  int64_t alertingSource;
  BOOL v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SAUIAlertingSourceUnspecified is an invalid source."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemApertureSceneElement _isValidAlertingSource:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0CBE06CLL);
  }
  alertingSource = self->_alertingSource;
  if (alertingSource == a3)
    return 1;
  v6 = alertingSource == 0;
  if (alertingSource)
  {
    SBLogSystemApertureHosting();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_alertingSource;
      v10 = CFSTR("[invalid]");
      v11 = CFSTR("[invalid]");
      if (v9 <= 2)
        v11 = off_1E8EBE788[v9];
      if (a3 == 1)
        v10 = CFSTR("SAUIAlertingSourceHost");
      if (a3 == 2)
        v10 = CFSTR("SAUIAlertingSourceClient");
      v12 = v10;
      v19 = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_error_impl(&dword_1D0540000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Changing alerting source is not allowed. Attempting to change alerting source from %{public}@ to %{public}@", (uint8_t *)&v19, 0x20u);

    }
  }
  else
  {
    self->_alertingSource = a3;
    SBLogSystemApertureHosting();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("[invalid]");
      if (a3 == 1)
        v14 = CFSTR("SAUIAlertingSourceHost");
      if (a3 == 2)
        v14 = CFSTR("SAUIAlertingSourceClient");
      v15 = v14;
      v19 = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting alerting to %{public}@", (uint8_t *)&v19, 0x16u);

    }
  }

  return v6;
}

- (void)_handleAlertingAssertionRequestForReason:(id)a3 implicitlyDismissable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  id WeakRetained;
  SAAutomaticallyInvalidatable *v11;
  SAAutomaticallyInvalidatable *alertingActivityAssertion;
  SAAutomaticallyInvalidatable *v13;
  void *v14;
  id v15;
  SBUISystemApertureAlertingAction *v16;
  SBUISystemApertureAlertingAction *alertingAction;
  void *v18;
  FBScene *scene;
  void *v20;
  _QWORD v21[6];
  id v22;
  _QWORD v23[5];
  id v24;
  id from;
  id *p_from;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id location;
  id *p_location;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v4 = a4;
  v6 = a3;
  if ((-[SBUISystemApertureAlertingAction isValid](self->_alertingAction, "isValid") & 1) == 0)
  {
    -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isValid");
    v9 = MEMORY[0x1E0C809B0];
    if ((v8 & 1) == 0 && -[SBSystemApertureSceneElement hasActivityBehavior](self, "hasActivityBehavior"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
      objc_msgSend(WeakRetained, "alertWithReason:implicitlyDismissable:", v6, v4);
      v11 = (SAAutomaticallyInvalidatable *)objc_claimAutoreleasedReturnValue();
      alertingActivityAssertion = self->_alertingActivityAssertion;
      self->_alertingActivityAssertion = v11;

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_alertingActivityAssertion);
      v13 = self->_alertingActivityAssertion;
      v38[0] = v9;
      v38[1] = 3221225472;
      v38[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke;
      v38[3] = &unk_1E8EA35D8;
      objc_copyWeak(&v39, &location);
      objc_copyWeak(&v40, &from);
      -[SAAutomaticallyInvalidatable addInvalidationBlock:](v13, "addInvalidationBlock:", v38);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
    objc_initWeak(&v37, self);
    location = 0;
    p_location = &location;
    v33 = 0x3042000000;
    v34 = __Block_byref_object_copy__113;
    v35 = __Block_byref_object_dispose__113;
    v36 = 0;
    from = 0;
    p_from = &from;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__99;
    v29 = __Block_byref_object_dispose__100;
    v14 = (void *)MEMORY[0x1E0D016A0];
    v23[0] = v9;
    v23[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_102;
    v23[3] = &unk_1E8EBE520;
    v23[1] = 3221225472;
    objc_copyWeak(&v24, &v37);
    v23[4] = &location;
    objc_msgSend(v14, "responderWithHandler:", v23);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DAC678]);
    v16 = (SBUISystemApertureAlertingAction *)objc_msgSend(v15, "initWithInfo:responder:", 0, p_from[5]);
    alertingAction = self->_alertingAction;
    self->_alertingAction = v16;

    objc_storeWeak(p_location + 5, self->_alertingAction);
    -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_3;
    v21[3] = &unk_1E8EBE548;
    v21[4] = &location;
    v21[5] = &from;
    objc_copyWeak(&v22, &v37);
    objc_msgSend(v18, "addInvalidationBlock:", v21);

    if (self->_alertingSource == 2)
    {
      scene = self->_scene;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_alertingAction, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene sendActions:](scene, "sendActions:", v20);

    }
    objc_destroyWeak(&v22);
    _Block_object_dispose(&from, 8);

    objc_destroyWeak(&v24);
    _Block_object_dispose(&location, 8);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v37);

  }
}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (id)WeakRetained[41];
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(a1 + 40));

    WeakRetained = v6;
    if (v3 == v4)
    {
      v5 = (void *)v6[41];
      v6[41] = 0;

      WeakRetained = v6;
    }
  }

}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v4);

}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_existingAlertingAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isValid"))
    objc_msgSend(v6, "invalidateWithReason:", v3);

LABEL_8:
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "_alertingAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if (v8 == v9)
    objc_msgSend(v7, "_setAlertingAction:", 0);

}

void __95__SBSystemApertureSceneElement__handleAlertingAssertionRequestForReason_implicitlyDismissable___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "annul");
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "_alertingAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == WeakRetained)
    objc_msgSend(v2, "_setAlertingAction:", 0);

}

- (id)sceneSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)sceneClientSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)setActivated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_activated != a3)
  {
    v3 = a3;
    self->_activated = a3;
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_backlightIsOrWillBecomeActive = objc_msgSend(v5, "backlightState") != 4;

    -[SBSystemApertureSceneElement _updateActiveElementsAndAssociatedApplication](self, "_updateActiveElementsAndAssociatedApplication");
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
      objc_msgSend(v6, "addObserver:", self);
    else
      objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void)setBacklightIsOrWillBecomeActive:(BOOL)a3
{
  if (self->_backlightIsOrWillBecomeActive != a3)
  {
    self->_backlightIsOrWillBecomeActive = a3;
    -[SBSystemApertureSceneElement _updateSceneBackgroundStateIfNeeded](self, "_updateSceneBackgroundStateIfNeeded");
  }
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  _BOOL4 v4;

  if ((unint64_t)a3 < 4)
  {
    if (-[SBSystemApertureSceneElement _shouldHandleLaunchAction](self, "_shouldHandleLaunchAction"))
    {
      LOBYTE(v4) = -[SBSystemApertureSceneElement _handleLaunchAction](self, "_handleLaunchAction");
      return v4;
    }
    if (-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 1
      || -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 2)
    {
      -[SBSystemApertureSceneElement _updateScene:activatingIfNeeded:settingsWithTransitionBlock:](self, "_updateScene:activatingIfNeeded:settingsWithTransitionBlock:", self->_scene, 0, &__block_literal_global_110_0);
    }
LABEL_10:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (a3 != 4)
    goto LABEL_10;
  v4 = -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 128);
  if (v4)
  {
    -[SBSystemApertureSceneElement _updateScene:activatingIfNeeded:settingsWithTransitionBlock:](self, "_updateScene:activatingIfNeeded:settingsWithTransitionBlock:", self->_scene, 0, &__block_literal_global_112);
    LOBYTE(v4) = 1;
  }
  return v4;
}

id __55__SBSystemApertureSceneElement_handleElementViewEvent___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6C8]), "initWithCommand:", 13);
  objc_msgSend(v1, "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setActions:", v3);
  return v0;
}

id __55__SBSystemApertureSceneElement_handleElementViewEvent___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6C8]), "initWithCommand:", 11);
  objc_msgSend(v1, "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setActions:", v3);
  return v0;
}

- (BOOL)_shouldHandleLaunchAction
{
  BOOL v3;

  v3 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 1
    || -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 2;
  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 16))
    return 0;
  else
    return !-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 32) || !v3;
}

- (BOOL)_handleLaunchAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_associatedAppBundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SBUISA_associatedScenePersistenceIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();

  if (!(v4 | v6))
  {
    -[SBApplicationSceneHandle persistenceIdentifier](self->_associatedApplicationSceneHandle, "persistenceIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  -[SBSystemApertureSceneElement launchActionHandler](self, "launchActionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sceneElement:decisionForLaunchActionOfAppWithBundleIdentifier:persistenceIdentifier:", self, v4, v6);

  v9 = v8 != 1
    && -[SBSystemApertureSceneElement _activateCorrespondingAppSceneIfPossible:](self, "_activateCorrespondingAppSceneIfPossible:", v8);
  v10 = v8 == 1 || v9;

  return v10;
}

- (id)_bundleIdForLaunchTargetWithScenePersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__99;
  v22 = __Block_byref_object_dispose__100;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__SBSystemApertureSceneElement__bundleIdForLaunchTargetWithScenePersistenceIdentifier___block_invoke;
    v15[3] = &unk_1E8EBE5D0;
    v16 = v4;
    v17 = &v18;
    objc_msgSend(v6, "enumerateSceneManagersWithBlock:", v15);

  }
  v7 = (void *)v19[5];
  if (!v7)
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SBUISA_launchURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      SBWorkspaceApplicationForURLWithError(v9, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

    }
    v7 = (void *)v19[5];
  }
  v13 = v7;
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __87__SBSystemApertureSceneElement__bundleIdForLaunchTargetWithScenePersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "existingSceneHandleForPersistenceIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

- (BOOL)_activateCorrespondingAppSceneIfPossible:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBLockScreenUnlockRequest *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SBSystemApertureSceneElement *v28;
  id v29;
  id location;

  if (a3 == 2)
  {
    v4 = 0;
  }
  else
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_associatedScenePersistenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SBSystemApertureSceneElement _bundleIdForLaunchTargetWithScenePersistenceIdentifier:](self, "_bundleIdForLaunchTargetWithScenePersistenceIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SBUISA_launchURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SBUISA_launchAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (+[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists"), v11 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v11, "applicationWithBundleIdentifier:", v6), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v11, v12))
  {
    v13 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setSource:](v13, "setSource:", 24);
    -[SBLockScreenUnlockRequest setIntent:](v13, "setIntent:", 3);
    -[SBLockScreenUnlockRequest setName:](v13, "setName:", CFSTR("Launch App from System Aperture Unlock"));
    -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v13, "setWantsBiometricPresentation:", 1);
    -[SBSystemApertureSceneElementScenePresenterView _sbWindowScene](self->_sceneView, "_sbWindowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenUnlockRequest setWindowScene:](v13, "setWindowScene:", v14);
    objc_initWeak(&location, self);
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke;
    v22 = &unk_1E8EBE618;
    v23 = v6;
    objc_copyWeak(&v29, &location);
    v16 = v14;
    v24 = v16;
    v25 = v4;
    v26 = v8;
    v27 = v10;
    v28 = self;
    objc_msgSend(v15, "unlockWithRequest:completion:", v13, &v19);

    -[SBSystemApertureSceneElement setHasHandledLaunchAction:](self, "setHasHandledLaunchAction:", 1, v19, v20, v21, v22);
    -[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture");
    if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 512))
    {
      -[SBSystemApertureSceneElement setAffiliatedWithSessionMonitor:](self, "setAffiliatedWithSessionMonitor:", 0);
      if (-[SAAutomaticallyInvalidatable isValid](self->_alertingActivityAssertion, "isValid"))
        -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_alertingActivityAssertion, "invalidateWithReason:", CFSTR("Dismissing upon handling launch action"));
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBDeviceApplicationSceneEntity *v10;
  SBDeviceApplicationSceneEntity *v11;
  int v12;
  char v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBDeviceApplicationSceneEntity *v21;
  _QWORD v22[4];
  SBDeviceApplicationSceneEntity *v23;

  if (!a2)
    return;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.InCallService")))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v5 = objc_msgSend(WeakRetained, "isActivated");

    if (!v5)
      return;
  }
  objc_msgSend(*(id *)(a1 + 40), "sceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    objc_msgSend(v6, "displayIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDeviceApplicationSceneEntity entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", v8, v9, v6, v2);
    v10 = (SBDeviceApplicationSceneEntity *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [SBDeviceApplicationSceneEntity alloc];
    v12 = __sb__runningInSpringBoard();
    v13 = v12;
    if (v12)
    {
      v14 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
    }
    objc_msgSend(v6, "displayIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBDeviceApplicationSceneEntity initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:](v11, "initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:", v8, v14, v6, v15);

    if ((v13 & 1) != 0)
      goto LABEL_11;
  }

LABEL_11:
  if (*(_QWORD *)(a1 + 56))
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E0]), "initWithURL:", *(_QWORD *)(a1 + 56));
  else
    v16 = *(id *)(a1 + 64);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v10, "addActions:", v18);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 208), "_fbsDisplayConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_2;
  v22[3] = &unk_1E8E9EE78;
  v23 = v10;
  v21 = v10;
  objc_msgSend(v20, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v19, v22, &__block_literal_global_129_2);

}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 61);
  objc_msgSend(v3, "setEventLabel:", CFSTR("LaunchFromSystemAperture"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_3;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 62);
  objc_msgSend(v4, "setActivatingEntity:", *(_QWORD *)(a1 + 32));

}

uint64_t __73__SBSystemApertureSceneElement__activateCorrespondingAppSceneIfPossible___block_invoke_4()
{
  return 1;
}

- (id)_inferredElementIdentifier
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;

  v3 = (id)*MEMORY[0x1E0DAC9A0];
  -[FBScene clientHandle](self->_scene, "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MusicUIService")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC970];
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.VoiceMemos")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC9A8];
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ReplayKit.ReplayKitAngel")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC980];
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC938];
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Sharing.AirDropUI")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC930];
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0DAC998];
  }
  else
  {
    if (!-[SBSystemApertureSceneElement hasActivityBehavior](self, "hasActivityBehavior"))
      goto LABEL_5;
    v6 = (id *)MEMORY[0x1E0DAC958];
  }
  v7 = *v6;

  v3 = v7;
LABEL_5:

  return v3;
}

- (NSString)elementIdentifier
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    v6 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "elementIdentifier");
    else
      -[SBSystemApertureSceneElement _inferredElementIdentifier](self, "_inferredElementIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)clientIdentifier
{
  id WeakRetained;
  void *v4;
  NSString *clientIdentifier;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  v4 = WeakRetained;
  if (WeakRetained && !self->_scene)
  {
    objc_msgSend(WeakRetained, "clientIdentifier");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    clientIdentifier = self->_clientIdentifier;
    if (!clientIdentifier)
    {
      -[FBScene clientHandle](self->_scene, "clientHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_clientIdentifier;
      self->_clientIdentifier = v7;

      clientIdentifier = self->_clientIdentifier;
    }
    v9 = clientIdentifier;
  }
  v10 = v9;

  return v10;
}

- (void)setReadyForPresentation:(BOOL)a3
{
  _BOOL4 v3;
  id readyHandler;
  void (**v6)(id, SBSystemApertureSceneElement *, uint64_t);

  if (self->_readyForPresentation != a3)
  {
    v3 = a3;
    self->_readyForPresentation = a3;
    -[SBSystemApertureSceneElement _updateActiveElementsAndAssociatedApplication](self, "_updateActiveElementsAndAssociatedApplication");
    if (v3)
      -[SBSystemApertureSceneElement _addActivationAttribute:](self, "_addActivationAttribute:", 16);
    if (self->_readyHandler)
    {
      v6 = (void (**)(id, SBSystemApertureSceneElement *, uint64_t))MEMORY[0x1D17E5550]();
      readyHandler = self->_readyHandler;
      self->_readyHandler = 0;

      objc_msgSend((id)objc_opt_class(), "addElementReadyForPresentation:", self);
      v6[2](v6, self, 1);

    }
  }
}

- (void)setLayoutHost:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layoutHost, obj);
    self->_initialPreferredLayoutMode = -[SBSystemApertureSceneElement preferredLayoutMode](self, "preferredLayoutMode");
    -[SBSystemApertureSceneElement _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded](self, "_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded");
    v5 = obj;
  }

}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id WeakRetained;
  SBSystemApertureSceneElementPlaceholderWrapperView *minimalWrapperView;
  SBSystemApertureSceneElementAccessoryView *v20;
  SBSystemApertureSceneElementAccessoryView *minimalView;
  SBSystemApertureSceneElementPlaceholderWrapperView **p_leadingWrapperView;
  void *v23;
  void *v24;
  uint64_t v25;
  SBSystemApertureSceneElementPlaceholderWrapperView *leadingWrapperView;
  SBSystemApertureSceneElementAccessoryView *v27;
  SBSystemApertureSceneElementAccessoryView *leadingView;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  layoutMode = self->_layoutMode;
  if (layoutMode == a3)
    return;
  if (a3 == -1)
  {
    -[SBSystemApertureSceneElement setHasBeenRemoved:](self, "setHasBeenRemoved:", 1);
    layoutMode = self->_layoutMode;
  }
  self->_mostRecentLayoutModeChangeReason = a4;
  SBLogSystemApertureHosting();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SAUIStringFromElementViewLayoutMode();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SAUIStringFromElementViewLayoutMode();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v9;
    v40 = 2114;
    v41 = v10;
    v42 = 2114;
    v43 = v11;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ layoutMode: %{public}@ -> %{public}@", buf, 0x20u);

  }
  self->_layoutMode = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SBSystemApertureSceneElement _layoutObservers](self, "_layoutObservers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "elementLayoutSpecifier:layoutModeDidChange:reason:", self, layoutMode, a4);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v15);
  }

  self->_wantsLayoutPassForClientUpdate = 1;
  if (a3 < 1)
  {
    if (layoutMode <= 1)
      -[SBSystemApertureSceneElement _layoutHostMayNotPerformLayoutUpdate](self, "_layoutHostMayNotPerformLayoutUpdate");
    if (a3 == -1)
      -[SBSystemApertureSceneElement _finishDeactivationIfNeeded](self, "_finishDeactivationIfNeeded");
    goto LABEL_33;
  }
  -[SBSystemApertureSceneElement _addActivationAttribute:](self, "_addActivationAttribute:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (a3 == 2)
  {
    p_leadingWrapperView = &self->_leadingWrapperView;
    leadingWrapperView = self->_leadingWrapperView;
    if (!leadingWrapperView)
      goto LABEL_32;
    -[SBSystemApertureSceneElementPlaceholderWrapperView contentView](leadingWrapperView, "contentView");
    v27 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();
    leadingView = self->_leadingView;

    if (v27 == leadingView)
      goto LABEL_32;
    objc_msgSend(WeakRetained, "leadingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_31;
    objc_msgSend(WeakRetained, "minimalView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 != v23)
      goto LABEL_31;
    v25 = 264;
    goto LABEL_30;
  }
  if (a3 != 1)
    goto LABEL_32;
  minimalWrapperView = self->_minimalWrapperView;
  if (!minimalWrapperView)
    goto LABEL_32;
  -[SBSystemApertureSceneElementPlaceholderWrapperView contentView](minimalWrapperView, "contentView");
  v20 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();
  minimalView = self->_minimalView;

  if (v20 == minimalView)
    goto LABEL_32;
  p_leadingWrapperView = &self->_minimalWrapperView;
  objc_msgSend(WeakRetained, "minimalView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(WeakRetained, "leadingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 == v23)
    {
      v25 = 248;
LABEL_30:
      objc_msgSend(*(id *)((char *)&self->super.isa + v25), "setContentView:", 0);
    }
  }
LABEL_31:
  -[SBSystemApertureSceneElementPlaceholderWrapperView setContentView:](*p_leadingWrapperView, "setContentView:", v23);

LABEL_32:
LABEL_33:
  if (layoutMode == 3)
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "SBUISA_hasMenuPresentation");

    if (v31)
    {
      -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "menuPresentationRequestDidChangeForLayoutSpecifier:", self);

    }
  }
  -[SBSystemApertureSceneElement _updateSceneBackgroundStateIfNeeded](self, "_updateSceneBackgroundStateIfNeeded");
  -[SBSystemApertureSceneElement _updateActiveElementsAndAssociatedApplication](self, "_updateActiveElementsAndAssociatedApplication");
  -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
}

- (int64_t)_layoutModeForClientLayoutMode:(int64_t)a3
{
  int64_t result;

  result = 0;
  switch(a3)
  {
    case -1:
      result = -1;
      break;
    case 0:
      if (-[SBSystemApertureSceneElement isActivated](self, "isActivated")
        && !-[SBSystemApertureSceneElement isDeactivating](self, "isDeactivating")
        && (self->_leadingWrapperView || self->_trailingWrapperView))
      {
        goto LABEL_10;
      }
      result = 0;
      break;
    case 2:
      result = 1;
      break;
    case 3:
LABEL_10:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)_clientLayoutModeForLayoutMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return 0;
  else
    return qword_1D0E8BAA8[a3 + 1];
}

- (int64_t)preferredLayoutMode
{
  void *v3;
  int64_t v4;
  int64_t v5;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_preferredLayoutMode"));
  v5 = -[SBSystemApertureSceneElement maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode");

  if (v4 >= v5)
    return v5;
  else
    return v4;
}

- (int64_t)minimumSupportedLayoutMode
{
  void *v3;
  int64_t v4;
  int64_t v5;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_minimumLayoutMode"));
  v5 = -[SBSystemApertureSceneElement maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode");

  if (v4 >= v5)
    return v5;
  else
    return v4;
}

- (int64_t)maximumSupportedLayoutMode
{
  void *v3;
  int64_t v4;
  void *v5;
  int v6;
  int64_t v7;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBSystemApertureSceneElement _layoutModeForClientLayoutMode:](self, "_layoutModeForClientLayoutMode:", objc_msgSend(v3, "SBUISA_maximumLayoutMode"));

  -[SBSystemApertureSceneElement elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAC970]);

  if (v6)
    v7 = 3;
  else
    v7 = v4;
  if (-[SBSystemApertureSceneElement hasBeenRemoved](self, "hasBeenRemoved"))
    return -1;
  else
    return v7;
}

- (BOOL)isRequestingMenuPresentation
{
  void *v3;
  BOOL v4;

  if (-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") != 3)
    return 0;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "SBUISA_hasMenuPresentation"))
    v4 = -[SBSystemApertureSceneElement _supportsMenuPresentations](self, "_supportsMenuPresentations");
  else
    v4 = 0;

  return v4;
}

- (void)setHasBeenRemoved:(BOOL)a3
{
  id v4;

  if (self->_hasBeenRemoved != a3)
  {
    self->_hasBeenRemoved = a3;
    if (-[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture"))
    {
      -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

    }
  }
}

- (void)setSuppressedByProximityReader:(BOOL)a3
{
  if (self->_suppressedByProximityReader != a3)
  {
    self->_suppressedByProximityReader = a3;
    -[SBSystemApertureSceneElement _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded](self, "_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded");
  }
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  id WeakRetained;

  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)pop
{
  -[SBSystemActionElementPreviewingCoordinator pop](self->_previewingCoordinator, a2);
}

- (void)suppressForReason:(int64_t)a3
{
  -[SBSystemApertureSceneElement setSuppressedByProximityReader:](self, "setSuppressedByProximityReader:", a3 == 7);
}

- (void)setSuppressed:(BOOL)a3
{
  if (!a3)
    -[SBSystemApertureSceneElement setSuppressedByProximityReader:](self, "setSuppressedByProximityReader:", 0);
}

- (BOOL)_isAssociatedWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 4096))
  {
    v8 = 0;
  }
  else
  {
    -[SBApplicationSceneHandle application](self->_associatedApplicationSceneHandle, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  objc_msgSend(WeakRetained, "clientIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v4);

  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 4096))
  {
    v14 = 0;
  }
  else
  {
    -[FBScene clientHandle](self->_scene, "clientHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "isEqualToString:", v4);

  }
  return v8 | v7 | v13 | v14;
}

- (BOOL)_isAssociatedWithSceneWithPersistenceIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (-[SBSystemApertureSceneElement _isAssociatedWithBundleIdentifier:](self, "_isAssociatedWithBundleIdentifier:", CFSTR("com.apple.InCallService"))&& (objc_msgSend(v4, "isEqualToString:", CFSTR("SBAmbientFullScreenPresentationInCallSceneIdentifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "SBUISA_associatedScenePersistenceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistenceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[SBApplicationSceneHandle persistenceIdentifier](self->_associatedApplicationSceneHandle, "persistenceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistenceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v16, "isEqualToString:", v17);

    }
  }

  return v5;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[SBSystemApertureSceneElement requiresSuppressionFromSystemAperture](self, "requiresSuppressionFromSystemAperture")|| -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 1024))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[SBSystemApertureSceneElement _isAssociatedWithBundleIdentifier:](self, "_isAssociatedWithBundleIdentifier:", v7)|| -[SBSystemApertureSceneElement _isAssociatedWithSceneWithPersistenceIdentifier:](self, "_isAssociatedWithSceneWithPersistenceIdentifier:", v6);
  }

  return v8;
}

- (BOOL)shouldSuppressElementWhilePresentingSceneWithIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v4 = a3;
  LOBYTE(v5) = !-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 4)
            && -[SBSystemApertureSceneElement _isAssociatedWithSceneWithPersistenceIdentifier:](self, "_isAssociatedWithSceneWithPersistenceIdentifier:", v4);
  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 1024))
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_associatedScenePersistenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = !-[SBSystemApertureSceneElement _isAssociatedWithSceneWithPersistenceIdentifier:](self, "_isAssociatedWithSceneWithPersistenceIdentifier:", v4);
  }

  return v5;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  BOOL v11;
  _BOOL4 v12;

  v4 = a3;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SBUISA_associatedScenePersistenceIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
  {
    v11 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    objc_msgSend(WeakRetained, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  LOBYTE(v12) = 0;
  if (!-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 2) && !v11)
    LOBYTE(v12) = (BSEqualStrings() & 1) == 0
               && -[SBSystemApertureSceneElement _isAssociatedWithBundleIdentifier:](self, "_isAssociatedWithBundleIdentifier:", v4);
  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 1024))
    v12 = !-[SBSystemApertureSceneElement _isAssociatedWithBundleIdentifier:](self, "_isAssociatedWithBundleIdentifier:", v4);

  return v12;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return !-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 8);
}

- (BOOL)shouldSuppressElementWhileOnContinuityDisplay
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 2048))
    return 1;
  -[SBSystemApertureSceneElement associatedApplicationSceneHandle](self, "associatedApplicationSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InCallService"));

  return v7;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[FBScene clientHandle](self->_scene, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[FBScene clientHandle](self->_scene, "clientHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PassbookUISceneService")) ^ 1;

  }
  return v5;
}

- (BOOL)shouldSuppressElementWhilePresentingNoAppsOrScenes
{
  return -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 1024);
}

- (BOOL)_updateRequiresSuppressionFromSystemAperture
{
  BOOL v3;
  BOOL v4;

  v3 = -[SBSystemApertureSceneElement requiresSuppressionFromSystemAperture](self, "requiresSuppressionFromSystemAperture");
  v4 = -[SBSystemApertureSceneElement _calculateRequiresSuppressionFromSystemAperture](self, "_calculateRequiresSuppressionFromSystemAperture");
  self->_requiresSuppressionFromSystemAperture = v4;
  return v3 ^ v4;
}

- (BOOL)_calculateRequiresSuppressionFromSystemAperture
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;

  if (-[SBSystemApertureSceneElement isAffiliatedWithSessionMonitor](self, "isAffiliatedWithSessionMonitor")
    && !-[SBSystemApertureSceneElement hasBeenRemoved](self, "hasBeenRemoved"))
  {
    return 0;
  }
  v3 = -[SBSystemApertureSceneElement preferredLayoutMode](self, "preferredLayoutMode") <= 0
    && !-[SBSystemApertureSceneElement requiresSuppressionFromSystemAperture](self, "requiresSuppressionFromSystemAperture")|| -[SBSystemApertureSceneElement maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode") < 1;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SBUISA_associatedAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 256);
  if (v6)
    v8 = 0;
  else
    v8 = v7;
  v9 = v3 || v8;
  -[SBSystemApertureSceneElement elementIdentifier](self, "elementIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DAC970]))
    goto LABEL_14;
  v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.VoiceMemos"));

  if (v11)
  {
    +[SBSystemApertureSceneElement activeElements](SBSystemApertureSceneElement, "activeElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 |= objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_154);
LABEL_14:

  }
  v12 = v9 != 0;
  if ((-[SAAutomaticallyInvalidatable isValid](self->_alertingActivityAssertion, "isValid") & 1) == 0)
  {
    v13 = -[SAAssertion isValid](self->_elementHostPrefersSuppressionAssertion, "isValid");
    if (v9)
      v12 = 1;
    else
      v12 = v13;
  }
  if (-[SBSystemApertureSceneElement hasHandledLaunchAction](self, "hasHandledLaunchAction"))
    v14 = -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 512);
  else
    v14 = 0;
  v4 = (v14 | v12 | -[SBSystemApertureSceneElement hasBeenRemoved](self, "hasBeenRemoved")) != 0;

  return v4;
}

uint64_t __79__SBSystemApertureSceneElement__calculateRequiresSuppressionFromSystemAperture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "elementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DAC9A8]);

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  void *v3;
  void *v4;
  int v5;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "SBUISA_preventsInteractiveDismissal") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isMinimalPresentationPossible
{
  BOOL v3;
  void *v4;

  if (-[SBSystemApertureSceneElement hasAlertBehavior](self, "hasAlertBehavior"))
    return self->_minimalView != 0;
  -[SBSystemApertureSceneElement configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMinimalPresentationPossible"))
    v3 = self->_minimalView != 0;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)_effectivePresentationBehaviors
{
  void *v3;
  unint64_t v4;
  id WeakRetained;
  void *v6;
  BOOL v7;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SBUISA_presentationBehaviors");

  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  v6 = WeakRetained;
  if (self->_scene)
    v7 = 1;
  else
    v7 = WeakRetained == 0;
  if (!v7)
    v4 = objc_msgSend(WeakRetained, "presentationBehaviors");

  return v4;
}

- (BOOL)_hasPresentationBehavior:(unint64_t)a3
{
  unint64_t v5;
  void *v6;

  LOBYTE(v5) = (a3 & ~-[SBSystemApertureSceneElement _effectivePresentationBehaviors](self, "_effectivePresentationBehaviors")) == 0;
  if (-[SBSystemApertureSceneElement alwaysAllowTapToAppForBodyTaps](self, "alwaysAllowTapToAppForBodyTaps"))
  {
    if (a3 == 16)
    {
      LOBYTE(v5) = 0;
    }
    else if (a3 == 32)
    {
      -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = ((unint64_t)objc_msgSend(v6, "SBUISA_presentationBehaviors") >> 4) & 1;

    }
  }
  return v5;
}

- (BOOL)isAffiliatedWithSessionMonitor
{
  return -[SAAutomaticallyInvalidatable isValid](self->_sessionMonitorAssertion, "isValid");
}

- (UIColor)keyColor
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (WeakRetained && !self->_scene && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "keyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_keyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIColor *)v4;
}

- (void)setAffiliatedWithSessionMonitor:(BOOL)a3
{
  int v3;
  id WeakRetained;
  SAAutomaticallyInvalidatable *v6;
  SAAutomaticallyInvalidatable *sessionMonitorAssertion;
  id v8;

  v3 = a3;
  if (-[SBSystemApertureSceneElement hasHandledLaunchAction](self, "hasHandledLaunchAction"))
    v3 &= ~-[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 512);
  if (v3 != -[SBSystemApertureSceneElement isAffiliatedWithSessionMonitor](self, "isAffiliatedWithSessionMonitor"))
  {
    if ((v3 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "systemManagedAlertingActivityAssertionWithReason:", CFSTR("affiliated with session monitor"));
        v6 = (SAAutomaticallyInvalidatable *)objc_claimAutoreleasedReturnValue();
        sessionMonitorAssertion = self->_sessionMonitorAssertion;
        self->_sessionMonitorAssertion = v6;

      }
    }
    else
    {
      -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_sessionMonitorAssertion, "invalidateWithReason:", CFSTR("no longer associated with session monitor"));
    }
    if (-[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture"))
    {
      -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

    }
  }
}

- (BOOL)isAlerting
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  objc_msgSend(WeakRetained, "alertingActivityAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  return v4;
}

- (id)requestAlertingAssertionImplicitlyDismissable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBSystemApertureSceneElement _isValidAlertingSource:](self, "_isValidAlertingSource:", 1))
  {
    -[SBSystemApertureSceneElement _handleAlertingAssertionRequestForReason:implicitlyDismissable:](self, "_handleAlertingAssertionRequestForReason:implicitlyDismissable:", CFSTR("Scene Element - SBSystemApertureContextAccepting Request"), v3);
    -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture"))
    {
      -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setElementProviderPrefersSuppression:(BOOL)a3
{
  SAAssertion *elementHostPrefersSuppressionAssertion;
  SAAssertion *v5;
  SAAssertion *v6;
  SAAssertion *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  elementHostPrefersSuppressionAssertion = self->_elementHostPrefersSuppressionAssertion;
  if (a3)
  {
    if (!-[SAAssertion isValid](elementHostPrefersSuppressionAssertion, "isValid"))
    {
      v5 = (SAAssertion *)objc_alloc_init(MEMORY[0x1E0DB07E0]);
      v6 = self->_elementHostPrefersSuppressionAssertion;
      self->_elementHostPrefersSuppressionAssertion = v5;

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_elementHostPrefersSuppressionAssertion);
      v7 = self->_elementHostPrefersSuppressionAssertion;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __69__SBSystemApertureSceneElement_setElementProviderPrefersSuppression___block_invoke;
      v12 = &unk_1E8EA35D8;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(&v14, &from);
      -[SAAssertion addInvalidationBlock:](v7, "addInvalidationBlock:", &v9);
      if (-[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture", v9, v10, v11, v12))
      {
        -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SAAssertion invalidateWithReason:](elementHostPrefersSuppressionAssertion, "invalidateWithReason:", CFSTR("setElementProviderPrefersSuppression called with NO"));
  }
}

void __69__SBSystemApertureSceneElement_setElementProviderPrefersSuppression___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (id)*((_QWORD *)WeakRetained + 51);
    v9 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));

    v3 = v9;
    if (v4 == v5)
    {
      v6 = (void *)v9[51];
      v9[51] = 0;

      v7 = objc_msgSend(v9, "_updateRequiresSuppressionFromSystemAperture");
      v3 = v9;
      if (v7)
      {
        objc_msgSend(v9, "layoutHost");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", v9);

        v3 = v9;
      }
    }
  }

}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  int64_t v3;
  SBSystemApertureSceneElementPlaceholderWrapperView *trailingWrapperView;
  void *v5;
  id WeakRetained;
  void *v7;
  BOOL v8;
  double v9;
  double v10;

  v3 = -[SBSystemApertureSceneElement isProminent](self, "isProminent");
  trailingWrapperView = self->_trailingWrapperView;
  if (trailingWrapperView)
  {
    -[SBSystemApertureSceneElementPlaceholderWrapperView contentView](trailingWrapperView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    objc_msgSend(WeakRetained, "trailingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v7)
    {
      -[SBSystemApertureSceneElementPlaceholderWrapperView bounds](self->_trailingWrapperView, "bounds");
      v8 = v10 == 0.0 && v9 == 0.0;
    }
    else
    {
      v8 = 0;
    }

    if (v8)
      return v3 | 2;
  }
  return v3;
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;

  v6 = a3;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 2)
  {
    if (objc_msgSend(v7, "SBUISA_specifiesPreferredPaddingForCompactLayout"))
    {
      -[SBSystemApertureSceneElement leadingView](self, "leadingView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v6)
      {
        v10 = 1;
      }
      else
      {
        -[SBSystemApertureSceneElement trailingView](self, "trailingView");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v11 == v6;

      }
      goto LABEL_10;
    }
  }
  else if (a4 == 1 && objc_msgSend(v7, "SBUISA_attachedMinimalViewRequiresZeroPadding"))
  {
    -[SBSystemApertureSceneElement minimalView](self, "minimalView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v6;
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement leadingView](self, "leadingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    objc_msgSend(v6, "SBUISA_preferredPaddingForCompactLayout");
    v9 = v10;
  }
  else
  {
    -[SBSystemApertureSceneElement trailingView](self, "trailingView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v5)
    {
      objc_msgSend(v6, "SBUISA_preferredPaddingForCompactLayout");
      v9 = v11;
    }
    else
    {
      -[SBSystemApertureSceneElement minimalView](self, "minimalView");

      v9 = 0.0;
    }
  }

  return v9;
}

- (BOOL)isFixedInOrientation
{
  void *v4;
  char v5;

  if (-[SBSystemApertureSceneElement wantsSpecialFlowerBoundsResizingAnimationForWallet](self, "wantsSpecialFlowerBoundsResizingAnimationForWallet"))
  {
    return 1;
  }
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "SBUISA_prefersFixedPortraitOrientation");

  return v5;
}

- (void)_layoutHostMayNotPerformLayoutUpdate
{
  void *v3;
  id v4;

  if (-[SBSystemApertureSceneElement wantsLayoutPassForClientUpdate](self, "wantsLayoutPassForClientUpdate")
    && -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") <= 1)
  {
    -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SBUISA_containerViewFrame");
    -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", -193, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (-[SBSystemApertureSceneElement _updateReasonsForTransitionWithProposedParameters:excludingReasons:](self, "_updateReasonsForTransitionWithProposedParameters:excludingReasons:", v4, -193))
    {
      self->_wantsLayoutPassForClientUpdate = 0;
      -[SBSystemApertureSceneElement _applyTransitionParameters:](self, "_applyTransitionParameters:", v4);
    }

  }
}

- (BOOL)_requiresForegroundScene
{
  BOOL v3;
  void *v4;

  if (-[SBSystemApertureSceneElement backlightIsOrWillBecomeActive](self, "backlightIsOrWillBecomeActive"))
  {
    return -[SBSystemApertureSceneElement elementAppearState](self, "elementAppearState")
        || -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") > 0;
  }
  else
  {
    -[SBSystemApertureSceneElement configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "entersBackgroundWhenBacklightIsOff") & 1) != 0)
    {
      v3 = 0;
    }
    else if (-[SBSystemApertureSceneElement elementAppearState](self, "elementAppearState"))
    {
      v3 = 1;
    }
    else
    {
      v3 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") > 0;
    }

  }
  return v3;
}

- (void)_updateSceneBackgroundStateIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_containerViewFrame");
  -[SBSystemApertureSceneElement _proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:](self, "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", -129, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSystemApertureSceneElement _updateReasonsForTransitionWithProposedParameters:excludingReasons:](self, "_updateReasonsForTransitionWithProposedParameters:excludingReasons:", v4, -129))
  {
    SBLogSystemApertureHosting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 1024;
      v10 = objc_msgSend(v4, "wantsForeground");
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updating to foreground %{BOOL}u", (uint8_t *)&v7, 0x12u);

    }
    -[SBSystemApertureSceneElement _applyTransitionParameters:](self, "_applyTransitionParameters:", v4);
  }

}

- (BOOL)isBiometricKit
{
  void *v2;
  void *v3;
  char v4;

  -[SBSystemApertureSceneElement presentable](self, "presentable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requesterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.BiometricKitUI"));

  return v4;
}

- (int64_t)customLayoutRequestingSpecialFlowerBoundsResizingAnimation
{
  if (-[SBSystemApertureSceneElement isBiometricKit](self, "isBiometricKit"))
    return 3;
  if (-[SBSystemApertureSceneElement wantsSpecialFlowerBoundsResizingAnimationForWallet](self, "wantsSpecialFlowerBoundsResizingAnimationForWallet"))
  {
    return 3;
  }
  return 0;
}

- (void)systemApertureElementAssertionAcquired
{
  -[SBSystemApertureSceneElement _addActivationAttribute:](self, "_addActivationAttribute:", 2);
}

- (void)systemApertureElementAssertionInvalidated
{
  -[SBSystemApertureSceneElement _addActivationAttribute:](self, "_addActivationAttribute:", 4);
}

- (NSSet)representedBackgroundActivityIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SBUISA_backgroundActivitiesToSuppress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement associatedApplication](self, "associatedApplication");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend((id)SBApp, "nowLocatingApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureSceneElement associatedApplication](self, "associatedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      objc_msgSend(v4, "setByAddingObject:", *MEMORY[0x1E0DB0AF0]);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }
  return (NSSet *)v4;
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return (-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_associatedApplicationSceneHandle, "preferredHardwareButtonEventTypes") & 2) != 0&& -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_associatedApplicationSceneHandle, "handleHardwareButtonEventType:", 1);
}

- (BOOL)handleVolumeDownButtonPress
{
  return (-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_associatedApplicationSceneHandle, "preferredHardwareButtonEventTypes") & 4) != 0&& -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_associatedApplicationSceneHandle, "handleHardwareButtonEventType:", 2);
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_associatedApplicationSceneHandle, "preferredHardwareButtonEventTypes");
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      v6 = 3;
      return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_associatedApplicationSceneHandle, "handleHardwareButtonEventType:", v6);
    }
    return 0;
  }
  if ((v5 & 0x10) == 0)
    return 0;
  v6 = 4;
  return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_associatedApplicationSceneHandle, "handleHardwareButtonEventType:", v6);
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (a4 != 4)
    -[SBSystemApertureSceneElement setBacklightIsOrWillBecomeActive:](self, "setBacklightIsOrWillBecomeActive:", 1, a4, a5);
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  -[SBSystemApertureSceneElement setBacklightIsOrWillBecomeActive:](self, "setBacklightIsOrWillBecomeActive:", a4 != 4);
}

- (void)_updatePortalViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  SBSystemApertureSceneElementAccessoryView *leadingView;
  SBSystemApertureSceneElementAccessoryView *v11;
  void *v12;
  uint64_t v13;
  SBSystemApertureSceneElementAccessoryView *trailingView;
  SBSystemApertureSceneElementAccessoryView *v15;
  void *v16;
  uint64_t v17;
  SBSystemApertureSceneElementAccessoryView *minimalView;
  SBSystemApertureSceneElementAccessoryView *v19;
  void *v20;
  uint64_t v21;
  SBSystemApertureSceneElementAccessoryView *v22;
  SBSystemApertureSceneElementAccessoryView *detachedMinimalView;
  SBSystemApertureSceneElementAccessoryView *v24;
  SBSystemApertureSceneElementAccessoryView *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  int v29;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SBUISA_contextId");
  if (objc_msgSend(v27, "contentState") == 2)
  {
    objc_msgSend(v27, "layerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__SBSystemApertureSceneElement__updatePortalViews__block_invoke;
    v28[3] = &__block_descriptor_36_e22_B16__0__FBSceneLayer_8l;
    v29 = v4;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "contextID");

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v3, "SBUISA_leadingViewRenderingId");
  leadingView = self->_leadingView;
  objc_msgSend(v3, "SBUISA_preferredLeadingViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](leadingView, "setPreferredSize:");
  -[SBSystemApertureSceneElementAccessoryView setSourceLayerRenderingId:contextId:](self->_leadingView, "setSourceLayerRenderingId:contextId:", v9, v8);
  v11 = self->_leadingView;
  objc_msgSend(v3, "SBUISA_leadingViewAccessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementAccessoryView setAccessibilityLabel:](v11, "setAccessibilityLabel:", v12);

  v13 = objc_msgSend(v3, "SBUISA_trailingViewRenderingId");
  trailingView = self->_trailingView;
  objc_msgSend(v3, "SBUISA_preferredTrailingViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](trailingView, "setPreferredSize:");
  -[SBSystemApertureSceneElementAccessoryView setSourceLayerRenderingId:contextId:](self->_trailingView, "setSourceLayerRenderingId:contextId:", v13, v8);
  v15 = self->_trailingView;
  objc_msgSend(v3, "SBUISA_trailingViewAccessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementAccessoryView setAccessibilityLabel:](v15, "setAccessibilityLabel:", v16);

  v17 = objc_msgSend(v3, "SBUISA_minimalViewRenderingId");
  minimalView = self->_minimalView;
  objc_msgSend(v3, "SBUISA_preferredMinimalViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](minimalView, "setPreferredSize:");
  -[SBSystemApertureSceneElementAccessoryView setSourceLayerRenderingId:contextId:](self->_minimalView, "setSourceLayerRenderingId:contextId:", v17, v8);
  v19 = self->_minimalView;
  objc_msgSend(v3, "SBUISA_minimalViewAccessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementAccessoryView setAccessibilityLabel:](v19, "setAccessibilityLabel:", v20);

  v21 = objc_msgSend(v3, "SBUISA_detachedMinimalViewRenderingId");
  if (v21 && !self->_detachedMinimalView)
  {
    v22 = (SBSystemApertureSceneElementAccessoryView *)objc_alloc_init(MEMORY[0x1E0DAC260]);
    detachedMinimalView = self->_detachedMinimalView;
    self->_detachedMinimalView = v22;

  }
  v24 = self->_detachedMinimalView;
  objc_msgSend(v3, "SBUISA_preferredDetachedMinimalViewSize");
  -[SBSystemApertureSceneElementAccessoryView setPreferredSize:](v24, "setPreferredSize:");
  -[SBSystemApertureSceneElementAccessoryView setSourceLayerRenderingId:contextId:](self->_detachedMinimalView, "setSourceLayerRenderingId:contextId:", v21, v8);
  v25 = self->_detachedMinimalView;
  objc_msgSend(v3, "SBUISA_detachedMinimalViewAccessibilityLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementAccessoryView setAccessibilityLabel:](v25, "setAccessibilityLabel:", v26);

}

BOOL __50__SBSystemApertureSceneElement__updatePortalViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "type") == 1 && objc_msgSend(v3, "contextID") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (BOOL)_tryMovingToPlaceholderElementWithClientSettingsDiff:(id)a3 forScene:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id postSceneActivationPlaceholderTest;
  void (**v16)(_QWORD, _QWORD);
  id postSceneActivationPlaceholderElementFoundHandler;
  BOOL v18;
  id readyHandler;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_postSceneActivationPlaceholderTest)
  {
    objc_msgSend((id)objc_opt_class(), "activePlaceholderElementPassingTest:", self->_postSceneActivationPlaceholderTest);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    postSceneActivationPlaceholderTest = self->_postSceneActivationPlaceholderTest;
    self->_postSceneActivationPlaceholderTest = 0;

    if (self->_postSceneActivationPlaceholderElementFoundHandler)
    {
      v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550]();
      postSceneActivationPlaceholderElementFoundHandler = self->_postSceneActivationPlaceholderElementFoundHandler;
      self->_postSceneActivationPlaceholderElementFoundHandler = 0;

      v18 = v14 != 0;
      if (v14)
      {
        readyHandler = self->_readyHandler;
        self->_readyHandler = 0;

        self->_invalidatingForMoveToPlaceholderElement = 1;
        ((void (**)(_QWORD, void *))v16)[2](v16, v14);
        objc_msgSend(v14, "scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v11, v10, v12, v13);
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  int64_t v24;
  int64_t v25;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  double v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  int64_t v49;
  BOOL v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  _BOOL4 v78;
  _BOOL4 v79;
  double v80;
  _BOOL4 v81;
  _BOOL4 v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  int v91;
  double v92;
  _BOOL4 v93;
  double *v94;
  _BOOL4 v95;
  uint64_t v96;
  _BOOL4 v97;
  double v98;
  void *v99;
  _BOOL4 v100;
  uint64_t v101;
  _BOOL4 v102;
  _BOOL4 v103;
  uint64_t v104;
  _BOOL4 v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  char v110;
  int v111;
  int v112;
  void *v113;
  void *v114;
  char v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t i;
  uint64_t v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  int v137;
  int v138;
  _BOOL4 v139;
  void *v140;
  id v141;
  id v142;
  double v143;
  void *v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  const __CFString *v151;
  SBSystemApertureSceneElement *v152;
  uint8_t buf[4];
  void *v154;
  __int16 v155;
  void *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "clientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  SBLogSystemApertureHosting();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v154 = v17;
    v155 = 2114;
    v156 = v15;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ received clientSettings update with changes: %{public}@", buf, 0x16u);

  }
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBSystemApertureSceneElement _tryMovingToPlaceholderElementWithClientSettingsDiff:forScene:oldClientSettings:transitionContext:](self, "_tryMovingToPlaceholderElementWithClientSettingsDiff:forScene:oldClientSettings:transitionContext:", v11, v10, v12, v13))
  {
LABEL_7:
    v140 = v15;
    v141 = v11;
    v145 = v13;
    v142 = v10;
    v19 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode");
    -[SBSystemApertureSceneElement _updatePortalViews](self, "_updatePortalViews");
    -[SBSystemApertureSceneElement _updateReadyForPresentationIfNeeded](self, "_updateReadyForPresentationIfNeeded");
    -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v12, "SBUISA_preferredLayoutMode");
    v22 = objc_msgSend(v18, "SBUISA_preferredLayoutMode");
    v23 = v21 != v22;
    if ((-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") & 0x8000000000000000) == 0)
    {
      v24 = -[SBSystemApertureSceneElement maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode");
      v25 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode");
      v23 = v21 != v22 || v24 < v25;
    }
    objc_msgSend(v12, "SBUISA_associatedAppBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "SBUISA_associatedAppBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = BSEqualStrings();

    objc_msgSend(v12, "SBUISA_associatedScenePersistenceIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "SBUISA_associatedScenePersistenceIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = BSEqualStrings();

    LODWORD(v30) = objc_msgSend(v12, "SBUISA_presentationBehaviors");
    if (((objc_msgSend(v18, "SBUISA_presentationBehaviors") ^ v30) & 0x40ELL) != 0)
      v23 = 1;
    if ((v29 & 1) == 0)
      -[SBSystemApertureSceneElement _updateActiveElementsAndAssociatedApplication](self, "_updateActiveElementsAndAssociatedApplication");
    objc_msgSend(v12, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(v18, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    v43 = v35 != v42;
    if (v33 != v44)
      v43 = 1;
    if (v39 != v41)
      v43 = 1;
    v45 = v37 != v40 || v43;
    v46 = objc_msgSend(v12, "SBUISA_preferredCustomLayout");
    v47 = objc_msgSend(v18, "SBUISA_preferredCustomLayout");
    v138 = v29;
    v139 = v23;
    if (v47 == 3)
    {
      -[SBSystemApertureSceneElement setWantsSpecialFlowerBoundsResizingAnimationForWallet:](self, "setWantsSpecialFlowerBoundsResizingAnimationForWallet:", 1);
      v48 = v46 != 3;
      v49 = 3;
      goto LABEL_41;
    }
    v50 = v46 == v47;
    v48 = v46 != v47;
    if (!v47 && v50)
    {
      objc_msgSend(v12, "SBUISA_preferredCustomAspectRatio");
      v52 = v51;
      v54 = v53;
      objc_msgSend(v18, "SBUISA_preferredCustomAspectRatio");
      v49 = 0;
      v48 = v54 != v56 || v52 != v55;
      if (v55 == 1.0 && v56 == 1.0)
        goto LABEL_38;
    }
    else if (v47 == 2)
    {
      v49 = 2;
    }
    else
    {
      if (v47 == 1)
      {
LABEL_38:
        v49 = 1;
        goto LABEL_41;
      }
      v49 = 0;
    }
LABEL_41:
    self->_systemApertureCustomLayout = v49;
    objc_msgSend(v12, "SBUISA_preferredLeadingViewSize");
    v143 = v57;
    v136 = v58;
    objc_msgSend(v18, "SBUISA_preferredLeadingViewSize");
    v60 = v59;
    v62 = v61;
    objc_msgSend(v12, "SBUISA_preferredTrailingViewSize");
    v64 = v63;
    v66 = v65;
    objc_msgSend(v18, "SBUISA_preferredTrailingViewSize");
    v68 = v67;
    v70 = v69;
    objc_msgSend(v12, "SBUISA_preferredMinimalViewSize");
    v72 = v71;
    v74 = v73;
    objc_msgSend(v18, "SBUISA_preferredMinimalViewSize");
    v134 = v75;
    v132 = v76;
    v77 = v136;
    v78 = v136 == v62 && v143 == v60;
    v135 = v64;
    v79 = v64 == v68;
    v80 = v70;
    v81 = v66 == v70 && v79;
    v133 = v74;
    v82 = v74 != v76 || v72 != v75;
    if (v19 != 3 || ((v45 | v48) & 1) == 0)
    {
      if (-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 2)
      {
        objc_msgSend(v12, "SBUISA_preferredPaddingForCompactLayout");
        v130 = v84;
        v131 = v83;
        v86 = v85;
        v88 = v87;
        objc_msgSend(v18, "SBUISA_preferredPaddingForCompactLayout");
        v50 = v86 == v76;
        v80 = v70;
        if (v50)
        {
          v76 = v131;
          if (v131 == v75)
          {
            v75 = v130;
            if (v130 == v89 && v78 && v81 && v88 == v77)
            {
LABEL_65:
              v91 = objc_msgSend(v12, "SBUISA_contextId");
              v144 = v20;
              v93 = v91 != objc_msgSend(v18, "SBUISA_contextId")
                 && objc_msgSend(v12, "SBUISA_contextId") == 0;
              if (self->_leadingWrapperView)
              {
                v94 = (double *)MEMORY[0x1E0C9D820];
                v95 = !v78 && v136 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v143 == *MEMORY[0x1E0C9D820];
                v96 = objc_msgSend(v12, "SBUISA_leadingViewRenderingId");
                v97 = v96 != objc_msgSend(v18, "SBUISA_leadingViewRenderingId")
                   && objc_msgSend(v12, "SBUISA_leadingViewRenderingId") == 0;
                if (v95 || v97 || v93)
                {
                  v92 = *v94;
                  v98 = v60;
                  if (v60 != *v94 || (v92 = v94[1], v98 = v62, v62 != v92))
                  {
                    if (objc_msgSend(v18, "SBUISA_leadingViewRenderingId", v92, v98)
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      -[SBSystemApertureSceneElementPlaceholderWrapperView setContentView:](self->_leadingWrapperView, "setContentView:", self->_leadingView);
                    }
                  }
                }
              }
              v99 = v144;
              if (self->_trailingWrapperView)
              {
                v100 = !v81 && v66 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v135 == *MEMORY[0x1E0C9D820];
                v101 = objc_msgSend(v12, "SBUISA_trailingViewRenderingId");
                v102 = v101 != objc_msgSend(v18, "SBUISA_trailingViewRenderingId")
                    && objc_msgSend(v12, "SBUISA_trailingViewRenderingId") == 0;
                if (v100 || v102 || v93)
                {
                  if (v68 != *MEMORY[0x1E0C9D820] || (v92 = *(double *)(MEMORY[0x1E0C9D820] + 8), v80 != v92))
                  {
                    if (objc_msgSend(v18, "SBUISA_trailingViewRenderingId")
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      -[SBSystemApertureSceneElementPlaceholderWrapperView setContentView:](self->_trailingWrapperView, "setContentView:", self->_trailingView);
                    }
                  }
                }
              }
              if (self->_minimalWrapperView)
              {
                if (v82)
                {
                  v92 = v133;
                  v103 = v133 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v72 == *MEMORY[0x1E0C9D820];
                }
                else
                {
                  v103 = 0;
                }
                v104 = objc_msgSend(v12, "SBUISA_minimalViewRenderingId", v92);
                v105 = v104 != objc_msgSend(v18, "SBUISA_minimalViewRenderingId")
                    && objc_msgSend(v12, "SBUISA_minimalViewRenderingId") == 0;
                if (v103 || v105 || v93)
                {
                  v106 = *MEMORY[0x1E0C9D820];
                  v107 = v134;
                  if (v134 != *MEMORY[0x1E0C9D820]
                    || (v106 = *(double *)(MEMORY[0x1E0C9D820] + 8), v107 = v132, v132 != v106))
                  {
                    if (objc_msgSend(v18, "SBUISA_minimalViewRenderingId", v106, v107)
                      && objc_msgSend(v18, "SBUISA_contextId"))
                    {
                      -[SBSystemApertureSceneElementPlaceholderWrapperView setContentView:](self->_minimalWrapperView, "setContentView:", self->_minimalView);
                    }
                  }
                }
              }
              objc_msgSend(v12, "SBUISA_backgroundActivitiesToSuppress");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "SBUISA_backgroundActivitiesToSuppress");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = BSEqualSets();

              if ((v110 & 1) == 0)
                -[SBSystemApertureSceneElement _acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded](self, "_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded");
              v111 = objc_msgSend(v12, "SBUISA_hasMenuPresentation");
              if (v111 != -[SBSystemApertureSceneElement isRequestingMenuPresentation](self, "isRequestingMenuPresentation"))objc_msgSend(v144, "menuPresentationRequestDidChangeForLayoutSpecifier:", self);
              v112 = objc_msgSend(v12, "SBUISA_preventsAutomaticDismissal");
              v13 = v145;
              if (v112 != objc_msgSend(v18, "SBUISA_preventsAutomaticDismissal"))
                -[SBSystemApertureSceneElement _updateAlertAssertionIfNecessary](self, "_updateAlertAssertionIfNecessary");
              objc_msgSend(v12, "SBUISA_keyColor");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "SBUISA_keyColor");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = BSEqualObjects();

              if ((v115 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v151 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
                v152 = self;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v117);

              }
              v118 = v139 | v138 & v137 ^ 1;
              objc_msgSend(v145, "actions");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = objc_msgSend(v119, "count");

              if (v120)
              {
                v148 = 0u;
                v149 = 0u;
                v146 = 0u;
                v147 = 0u;
                objc_msgSend(v145, "actions");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v146, v150, 16);
                if (v122)
                {
                  v123 = v122;
                  v124 = 0;
                  v125 = *(_QWORD *)v147;
                  do
                  {
                    for (i = 0; i != v123; ++i)
                    {
                      if (*(_QWORD *)v147 != v125)
                        objc_enumerationMutation(v121);
                      v127 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i);
                      if (-[SBSystemApertureSceneElement _handleAction:](self, "_handleAction:", v127))
                      {
                        if (v124)
                        {
                          objc_msgSend(v124, "addObject:", v127);
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v127);
                          v124 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                      }
                    }
                    v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v146, v150, 16);
                  }
                  while (v123);
                }
                else
                {
                  v124 = 0;
                }

                v99 = v144;
                v13 = v145;
                v118 = v139 | v138 & v137 ^ 1;
                if (objc_msgSend(v124, "count"))
                {
                  objc_msgSend(v145, "actions");
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  v129 = (void *)objc_msgSend(v128, "mutableCopy");

                  objc_msgSend(v129, "minusSet:", v124);
                  objc_msgSend(v145, "setActions:", v129);

                }
              }
              if ((v118 | -[SBSystemApertureSceneElement _updateRequiresSuppressionFromSystemAperture](self, "_updateRequiresSuppressionFromSystemAperture")) == 1)objc_msgSend(v99, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

              v11 = v141;
              v10 = v142;
              v15 = v140;
              goto LABEL_141;
            }
          }
        }
      }
      else if (-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") != 1 || !v82)
      {
        goto LABEL_65;
      }
    }
    objc_msgSend(v20, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self, v75, v76, v77);
    goto LABEL_65;
  }
LABEL_141:

}

- (void)sceneContentStateDidChange:(id)a3
{
  -[SBSystemApertureSceneElement _updateReadyForPresentationIfNeeded](self, "_updateReadyForPresentationIfNeeded", a3);
  -[SBSystemApertureSceneElement _updatePortalViews](self, "_updatePortalViews");
}

- (void)sceneDidInvalidate:(id)a3
{
  void *v4;
  id v5;

  -[SBSystemApertureSceneElement sceneInvalidationHandler](self, "sceneInvalidationHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement setSceneInvalidationHandler:](self, "setSceneInvalidationHandler:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, SBSystemApertureSceneElement *))v5 + 2))(v5, self);
    v4 = v5;
  }

}

- (BOOL)_supportsMenuPresentations
{
  void *v2;
  void *v3;
  char v4;

  -[FBScene clientHandle](self->_scene, "clientHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.InCallService"));

  return v4;
}

- (BOOL)_handleAction:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  BOOL v16;
  BOOL v17;
  void (**WeakRetained)(_QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  SBSystemApertureSceneElement *v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement elementHost](self, "elementHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    SBLogSystemApertureHosting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received command %{public}@", (uint8_t *)&v29, 0x16u);

    }
    switch(objc_msgSend(v8, "command"))
    {
      case 1:
        v14 = -[SBSystemApertureSceneElement preferredLayoutMode](self, "preferredLayoutMode");
        v15 = -[SBSystemApertureSceneElement layoutMode](self, "layoutMode");
        v16 = -[SBSystemApertureSceneElement _hasActivationAttribute:](self, "_hasActivationAttribute:", 1);
        v17 = 0;
        if (v14 != v15 && !v16)
          v17 = self->_initialPreferredLayoutMode != 0;
        if (v14 != v15 && !v17)
        {
          if (-[SAAutomaticallyInvalidatable isValid](self->_alertingActivityAssertion, "isValid"))
            -[SAAutomaticallyInvalidatable invalidateWithReason:](self->_alertingActivityAssertion, "invalidateWithReason:", CFSTR("requestTransitionToPreferredLayoutMode"));
          else
            objc_msgSend(v9, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);
        }
        break;
      case 2:
        objc_msgSend(v10, "elementRequestsNegativeResponse:", self);
        break;
      case 3:
        -[SBSystemApertureSceneElement clientInvalidationRequestHandler](self, "clientInvalidationRequestHandler");
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureSceneElement setClientInvalidationRequestHandler:](self, "setClientInvalidationRequestHandler:", 0);
        if (WeakRetained)
        {
          ((void (**)(_QWORD, SBSystemApertureSceneElement *))WeakRetained)[2](WeakRetained, self);
          goto LABEL_36;
        }
        SBLogSystemApertureHosting();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[SBSystemApertureSceneElement _handleAction:].cold.1(v23);
        goto LABEL_35;
      case 4:
        if (-[SBSystemApertureSceneElement layoutMode](self, "layoutMode") != 3
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          break;
        }
        objc_msgSend(v10, "elementRequestsSignificantUpdateTransition:", self);
        objc_msgSend(v9, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6C8]), "initWithCommand:", 5);
        -[SBSystemApertureSceneElement _handleAction:](self, "_handleAction:", WeakRetained);
        goto LABEL_36;
      case 5:
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_loadWeakRetained((id *)&self->_gestureHandler);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SBLogSystemApertureHosting();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543362;
            v30 = v20;
            _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Requesting cancellation of resize gesture for %{public}@.", (uint8_t *)&v29, 0xCu);

          }
          objc_msgSend(WeakRetained, "elementRequestsCancellingResizeGesture:", self);
        }
        goto LABEL_36;
      case 6:
        if (!-[SBSystemApertureSceneElement _isValidAlertingSource:](self, "_isValidAlertingSource:", 2))
          break;
        v21 = self;
        v22 = 0;
        goto LABEL_31;
      case 7:
        if (!-[SBSystemApertureSceneElement _isValidAlertingSource:](self, "_isValidAlertingSource:", 2))
          break;
        v21 = self;
        v22 = 1;
LABEL_31:
        -[SBSystemApertureSceneElement _handleAlertingAssertionRequestForReason:implicitlyDismissable:](v21, "_handleAlertingAssertionRequestForReason:implicitlyDismissable:", CFSTR("Scene Element - Client SBUISystemApertureCommandRequest"), v22);
        break;
      case 8:
        -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureSceneElement clientIdentifier](self, "clientIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("client requests disable automatic invalidation");
        v25 = WeakRetained;
        v26 = 0;
        goto LABEL_34;
      case 9:
        -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
        WeakRetained = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureSceneElement clientIdentifier](self, "clientIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("client requests enable automatic invalidation");
        v25 = WeakRetained;
        v26 = 1;
LABEL_34:
        objc_msgSend(v25, "setAutomaticallyInvalidatable:lockingWithKey:reason:", v26, v23, v24);
LABEL_35:

LABEL_36:
        break;
      case 10:
        -[SBSystemApertureSceneElement _existingAlertingAssertion](self, "_existingAlertingAssertion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "resetAutomaticInvalidationTimer");

        break;
      default:
        break;
    }
  }

  return v8 != 0;
}

- (BOOL)_ownsScene
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SBSystemApertureSceneElement scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workspaceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sceneWorkspaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (CGRect)_obstructedAreaFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorRegionSize");

  -[SBSystemApertureSceneElementScenePresenterView bounds](self->_sceneView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  SBRectWithSize();
  UIRectCenteredXInRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SBSystemApertureSceneElementScenePresenterView window](self->_sceneView, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:fromCoordinateSpace:", self->_sceneView, v5, v7, v9, v11);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = -[SBSystemApertureSceneElement systemApertureCustomLayout](self, "systemApertureCustomLayout");
  if ((v29 | 2) == 3)
  {
    v30 = v29;
    objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minimumScreenEdgeInsets");
    v33 = v32;
    v70.origin.x = v22;
    v70.origin.y = v24;
    v70.size.width = v26;
    v70.size.height = v28;
    v34 = v33 - CGRectGetMinY(v70);

    v35 = fmax(v34, 0.0);
    if (v30 == 1
      && (!-[SBSystemApertureSceneElement obstructionEdge](self, "obstructionEdge")
       || -[SBSystemApertureSceneElement obstructionEdge](self, "obstructionEdge") == 2))
    {
      -[SBSystemApertureSceneElementScenePresenterView superview](self->_sceneView, "superview");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureSceneElementScenePresenterView superview](self->_sceneView, "superview");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bounds");
      objc_msgSend(v36, "convertRect:toView:", self->_sceneView);
      rect_24 = v39;
      v69 = v38;
      rect_8 = v41;
      rect_16 = v40;

      -[SBSystemApertureSceneElementScenePresenterView superview](self->_sceneView, "superview");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureSceneElementScenePresenterView superview](self->_sceneView, "superview");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bounds");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[SBSystemApertureSceneElementScenePresenterView window](self->_sceneView, "window");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "convertRect:toView:", v52, v45, v47, v49, v51);
      rect = v53;
      v55 = v54;
      v57 = v56;
      v59 = v58;

      if (-[SBSystemApertureSceneElement obstructionEdge](self, "obstructionEdge"))
      {
        v71.origin.y = rect_24;
        v71.origin.x = v69;
        v71.size.height = rect_8;
        v71.size.width = rect_16;
        CGRectGetMaxX(v71);
        v72.origin.x = v13;
        v72.origin.y = v35;
        v72.size.width = v15;
        v72.size.height = v17;
        CGRectGetMinY(v72);
        v73.origin.x = v13;
        v73.origin.y = v35;
        v73.size.width = v17;
        v73.size.height = v15;
        CGRectGetWidth(v73);
      }
      else
      {
        v75.origin.y = rect_24;
        v75.origin.x = v69;
        v75.size.height = rect_8;
        v75.size.width = rect_16;
        CGRectGetMinX(v75);
      }
      objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "interSensorRegionInWindowSpace");
      v74.origin.x = rect;
      v74.origin.y = v55;
      v74.size.width = v57;
      v74.size.height = v59;
      CGRectGetMinY(v74);

      v76.origin.y = rect_24;
      v76.origin.x = v69;
      v76.size.height = rect_8;
      v76.size.width = rect_16;
      CGRectGetMidY(v76);
      v77.origin.x = v13;
      v77.origin.y = v35;
      v77.size.width = v15;
      v77.size.height = v17;
      CGRectGetWidth(v77);
    }
  }
  UIRectRoundToScale();
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)hasAlertBehavior
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SBUISA_contentRole");

  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    v4 = objc_msgSend(WeakRetained, "contentRole");

  }
  return v4 == 1;
}

- (void)setAlertHost:(id)a3
{
  id v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  void *v7;
  NSMutableArray *deferredSceneActions;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_alertHost, v4);
    if (v4)
    {
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __45__SBSystemApertureSceneElement_setAlertHost___block_invoke;
      v14 = &unk_1E8E9DF28;
      objc_copyWeak(&v15, &location);
      v6 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v11);
      v7 = v6;
      if (self->_scene)
      {
        v6[2](v6);
      }
      else
      {
        deferredSceneActions = self->_deferredSceneActions;
        v9 = (void *)objc_msgSend(v6, "copy", v11, v12, v13, v14);
        v10 = (void *)MEMORY[0x1D17E5550]();
        -[NSMutableArray addObject:](deferredSceneActions, "addObject:", v10);

      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

void __45__SBSystemApertureSceneElement_setAlertHost___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[17];
    v3 = (void *)MEMORY[0x1E0C99E60];
    v6 = WeakRetained;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6C8]), "initWithCommand:", 12);
    objc_msgSend(v3, "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendActions:", v5);

    objc_msgSend(v6, "_updateAlertAssertionIfNecessary");
    WeakRetained = v6;
  }

}

- (BOOL)hasActivityBehavior
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SBUISA_contentRole");

  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
    v4 = objc_msgSend(WeakRetained, "contentRole");

  }
  return v4 == 2;
}

- (void)setActivityHost:(id)a3
{
  id v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  void *v7;
  NSMutableArray *deferredSceneActions;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_activityHost, v4);
    if (v4)
    {
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __48__SBSystemApertureSceneElement_setActivityHost___block_invoke;
      v14 = &unk_1E8E9DF28;
      objc_copyWeak(&v15, &location);
      v6 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v11);
      v7 = v6;
      if (self->_scene)
      {
        v6[2](v6);
      }
      else
      {
        deferredSceneActions = self->_deferredSceneActions;
        v9 = (void *)objc_msgSend(v6, "copy", v11, v12, v13, v14);
        v10 = (void *)MEMORY[0x1D17E5550]();
        -[NSMutableArray addObject:](deferredSceneActions, "addObject:", v10);

      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

void __48__SBSystemApertureSceneElement_setActivityHost___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[17];
    v3 = (void *)MEMORY[0x1E0C99E60];
    v6 = WeakRetained;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6C8]), "initWithCommand:", 12);
    objc_msgSend(v3, "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendActions:", v5);

    objc_msgSend(v6, "_updateAlertAssertionIfNecessary");
    WeakRetained = v6;
  }

}

- (CGRect)_frameInSceneContainerForView:(id)a3
{
  SBSystemApertureSceneElementAccessoryView *v4;
  SBSystemApertureSceneElementScenePresenterView *sceneView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  SBSystemApertureSceneElementAccessoryView *v19;
  SBSystemApertureSceneElementAccessoryView *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  v4 = (SBSystemApertureSceneElementAccessoryView *)a3;
  sceneView = self->_sceneView;
  -[SBSystemApertureSceneElementAccessoryView center](v4, "center");
  v7 = v6;
  v9 = v8;
  -[SBSystemApertureSceneElementAccessoryView superview](v4, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElementScenePresenterView convertPoint:fromView:](sceneView, "convertPoint:fromView:", v10, v7, v9);

  -[SBSystemApertureSceneElementAccessoryView bounds](v4, "bounds");
  UIRectCenteredAboutPointScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBSystemApertureSceneElement leadingView](self, "leadingView");
  v19 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();
  if (v19 == v4 || self->_minimalView == v4 && -[SBSystemApertureSceneElement layoutAxis](self, "layoutAxis") == 1)
  {

LABEL_6:
    -[SBSystemApertureSceneElement _obstructedAreaFrame](self, "_obstructedAreaFrame");
    UIRectGetCenter();
    v26.origin.x = v12;
    v26.origin.y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    CGRectGetHeight(v26);
    UIRoundToViewScale();
    v14 = v21;
    goto LABEL_7;
  }
  -[SBSystemApertureSceneElement trailingView](self, "trailingView");
  v20 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();

  if (v20 == v4)
    goto LABEL_6;
LABEL_7:

  v22 = v12;
  v23 = v14;
  v24 = v16;
  v25 = v18;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  const __CFString *clientIdentifier;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  BOOL v30;
  BOOL v31;
  char v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  _QWORD v42[5];
  id v43;

  v7 = a4;
  v8 = a5;
  self->_wantsLayoutPassForClientUpdate = 0;
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "SBUISA_layoutMode") > 1 || -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") < 1;

  v11 = -[SBSystemApertureSceneElement _hasPresentationBehavior:](self, "_hasPresentationBehavior:", 64);
  if (!v10 && v11)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (self->_clientIdentifier)
      clientIdentifier = (const __CFString *)self->_clientIdentifier;
    else
      clientIdentifier = CFSTR("<unknown client ID>");
    objc_msgSend(v12, "requestUserAttentionScreenWakeFromSource:reason:", 35, clientIdentifier);

  }
  v15 = MEMORY[0x1E0C809B0];
  v16 = (void *)MEMORY[0x1E0CEABB0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v42[3] = &unk_1E8E9E820;
  v42[4] = self;
  v17 = v7;
  v43 = v17;
  objc_msgSend(v16, "_performWithoutRetargetingAnimations:", v42);
  -[SBSystemApertureSceneElement _frameInSceneContainerForView:](self, "_frameInSceneContainerForView:", v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  if (-[SBSystemApertureSceneElement wantsSpecialFlowerBoundsResizingAnimationForWallet](self, "wantsSpecialFlowerBoundsResizingAnimationForWallet"))
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "SBUISA_appliedLayoutMode") == 4;

  }
  else
  {
    v27 = 0;
  }
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "SBUISA_appliedLayoutMode") == 3)
  {
    -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "SBUISA_layoutMode") == 3
       && -[SBSystemApertureSceneElement layoutMode](self, "layoutMode") == 2;

  }
  else
  {
    v30 = 0;
  }

  v31 = -[SBSystemApertureSceneElement hasCompletedInitialPresentation](self, "hasCompletedInitialPresentation");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v32 = objc_msgSend(v8, "isPerformingSystemApertureCustomContentTransition") ^ 1 | (v27 || v31 && v30);
  else
    v32 = 1;
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v35[3] = &unk_1E8EBE6A0;
  v35[4] = self;
  v36 = v17;
  v41 = v32;
  v37 = v19;
  v38 = v21;
  v39 = v23;
  v40 = v25;
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_194;
  v34[3] = &unk_1E8E9EA28;
  v34[4] = self;
  v33 = v17;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v35, v34);

}

uint64_t __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupSceneViewInContainerView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSceneViewInContainerView:", *(_QWORD *)(a1 + 40));
}

void __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int8x8_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BYTE *v21;
  uint8x8_t v22;
  int v23;
  unint64_t v24;
  __CFString *v25;
  void *v26;
  _QWORD v27[4];
  _OWORD v28[2];
  char v29;
  _BYTE buf[24];
  void *v31;
  id v32[4];

  v32[2] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_layoutSceneViewInContainerView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_frameInSceneContainerForView:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(*(id *)(a1 + 32), "_clientLayoutModeForLayoutMode:", objc_msgSend(*(id *)(a1 + 32), "layoutMode"))
      + 1;
  if (v10 > 5)
    v11 = 0;
  else
    v11 = qword_1D0E8BAD0[v10];
  objc_msgSend(*(id *)(a1 + 32), "_proposeTransitionParametersForTransitionToFrameInSceneView:excludingParametersAssociatedWithReasons:usingCurrentAnimationParameters:", v11, *(unsigned __int8 *)(a1 + 80), v3, v5, v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int8x8_t)objc_msgSend(*(id *)(a1 + 32), "_updateReasonsForTransitionWithProposedParameters:excludingReasons:", v12, v11);
  SBLogSystemApertureHosting();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)(a1 + 64);
    v28[0] = *(_OWORD *)(a1 + 48);
    v28[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v28, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v27 = v3;
    *(double *)&v27[1] = v5;
    *(double *)&v27[2] = v7;
    *(double *)&v27[3] = v9;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v27, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v26 = v17;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __SBSystemApertureSceneUpdateReasonsDescription_block_invoke;
      v31 = &unk_1E8E9EB40;
      v20 = v19;
      v32[0] = v20;
      v21 = buf;
      v29 = 0;
      v22 = (uint8x8_t)vcnt_s8(v13);
      v22.i16[0] = vaddlv_u8(v22);
      v23 = v22.i32[0];
      if (v22.i32[0])
      {
        v24 = 0;
        do
        {
          if (((1 << v24) & *(_QWORD *)&v13) != 0)
          {
            (*(void (**)(_BYTE *))&buf[16])(v21);
            if (v29)
              break;
            --v23;
          }
          if (v24 > 0x3E)
            break;
          ++v24;
        }
        while (v23 > 0);
      }

      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v17 = v26;
    }
    else
    {
      v25 = CFSTR("none");
    }
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v31 = v18;
    LOWORD(v32[0]) = 2112;
    *(id *)((char *)v32 + 2) = v25;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Transition from %@ to %@ -- Applying because parameters needed updates for reason %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_applyTransitionParameters:", v12);

}

void __106__SBSystemApertureSceneElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_194(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "SBUISA_appliedLayoutMode");

  if (v4 >= 2)
    objc_msgSend(*(id *)(a1 + 32), "setHasCompletedInitialPresentation:", 1);
}

- (void)_setupSceneViewInContainerView:(id)a3
{
  id v4;
  id v5;
  SBSystemApertureSceneElementScenePresenterView *v6;
  SBSystemApertureSceneElementScenePresenterView *sceneView;
  void (**v8)(_QWORD);
  void *v9;
  NSMutableArray *deferredSceneActions;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  if (!self->_sceneView)
  {
    v5 = objc_alloc(MEMORY[0x1E0DAC268]);
    -[SBSystemApertureSceneElement _frameForSceneViewInContainerView:](self, "_frameForSceneViewInContainerView:", v4);
    v6 = (SBSystemApertureSceneElementScenePresenterView *)objc_msgSend(v5, "initWithFrame:");
    sceneView = self->_sceneView;
    self->_sceneView = v6;

    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __63__SBSystemApertureSceneElement__setupSceneViewInContainerView___block_invoke;
    v16 = &unk_1E8E9DF28;
    objc_copyWeak(&v17, &location);
    v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v13);
    -[SBSystemApertureSceneElement scene](self, "scene", v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v8[2](v8);
    }
    else
    {
      deferredSceneActions = self->_deferredSceneActions;
      v11 = (void *)objc_msgSend(v8, "copy");
      v12 = (void *)MEMORY[0x1D17E5550]();
      -[NSMutableArray addObject:](deferredSceneActions, "addObject:", v12);

    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  if (v4
    && (-[SBSystemApertureSceneElementScenePresenterView isDescendantOfView:](self->_sceneView, "isDescendantOfView:", v4) & 1) == 0)
  {
    objc_msgSend(v4, "insertSubview:atIndex:", self->_sceneView, 0);
  }

}

void __63__SBSystemApertureSceneElement__setupSceneViewInContainerView___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[26];
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setScene:", v3);

    WeakRetained = v4;
  }

}

- (void)_layoutSceneViewInContainerView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a3;
  -[SBSystemApertureSceneElement sceneView](self, "sceneView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement _frameForSceneViewInContainerView:](self, "_frameForSceneViewInContainerView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (CGRect)_frameForSceneViewInContainerView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[SBSystemApertureSceneElement _sizeForSceneView](self, "_sizeForSceneView");
  v8 = v7;
  v10 = v9;
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    UIRectCenteredIntegralRectScale();
    v5 = v11;
    v8 = v12;
    v10 = v13;
    v6 = 0.0;
  }

  v14 = v5;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)_sizeForSceneView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBSystemApertureSceneElementConfiguration *configuration;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSystemApertureSceneElement _supportsMenuPresentations](self, "_supportsMenuPresentations"))
    objc_msgSend(v3, "maximumPossibleSizeWhilePresentingMenu");
  else
    objc_msgSend(v3, "maximumExpandedSize");
  v6 = v4;
  v7 = v5;
  if (!-[SBSystemApertureSceneElement _supportsMenuPresentations](self, "_supportsMenuPresentations"))
    v7 = v7 * 1.2;
  configuration = self->_configuration;
  if (configuration)
  {
    -[SBSystemApertureSceneElementConfiguration maximumHeight](configuration, "maximumHeight");
    if (v9 != *MEMORY[0x1E0CEBDE0])
    {
      -[SBSystemApertureSceneElementConfiguration maximumHeight](self->_configuration, "maximumHeight");
      v7 = v10;
    }
  }

  v11 = v6;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3
{
  return -[SBSystemApertureSceneElement _updateReasonsForTransitionWithProposedParameters:excludingReasons:](self, "_updateReasonsForTransitionWithProposedParameters:excludingReasons:", a3, 0);
}

- (unint64_t)_updateReasonsForTransitionWithProposedParameters:(id)a3 excludingReasons:(unint64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v7 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "otherSystemApertureSceneSettingsToApply");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke;
  v36[3] = &unk_1E8EBE6C8;
  v36[4] = &v37;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke_2;
  v32 = &unk_1E8EBE6F0;
  v10 = (id)MEMORY[0x1D17E5550](v36);
  v35 = v10;
  v11 = v9;
  v33 = v11;
  v12 = v8;
  v34 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](&v29);
  (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 128, objc_msgSend(v12, "isForeground", v29, v30, v31, v32) ^ objc_msgSend(v7, "wantsForeground"));
  objc_msgSend(v11, "objectForSetting:", 3213016);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "objectForSetting:", 3213016);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "unsignedIntegerValue");
    v16 = v15 != objc_msgSend(v12, "SBUISA_minimalViewLayoutAxis");
  }
  else
  {
    v16 = 0;
  }
  (*((void (**)(id, uint64_t, _BOOL8))v10 + 2))(v10, 256, v16);
  if (v14)

  v13[2](v13, 2, 3213010);
  if ((a4 & 1) != 0)
  {
    v23 = 0;
  }
  else
  {
    -[SBSystemApertureSceneElement _sizeForSceneView](self, "_sizeForSceneView");
    v18 = v17;
    v20 = v19;
    -[SBSystemApertureSceneElement scene](self, "scene");
    self = (SBSystemApertureSceneElement *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureSceneElement settings](self, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v23 = v20 != v22 || v18 != v21;
  }
  (*((void (**)(id, uint64_t, _BOOL8))v10 + 2))(v10, 1, v23);
  if ((a4 & 1) == 0)
  {

  }
  v13[2](v13, 4, 3213012);
  v13[2](v13, 8, 3213011);
  v13[2](v13, 16, 3213013);
  v13[2](v13, 512, 3213014);
  v13[2](v13, 32, 3213015);
  objc_msgSend(v11, "objectForSetting:", 3213009);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = objc_msgSend(v12, "SBUISA_layoutMode");
    v26 = v25 != objc_msgSend(v11, "SBUISA_layoutModeforSetting:", 3213009);
  }
  else
  {
    v26 = 0;
  }
  (*((void (**)(id, uint64_t, _BOOL8))v10 + 2))(v10, 64, v26);

  v27 = v38[3] & ~a4;
  _Block_object_dispose(&v37, 8);

  return v27;
}

uint64_t __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= a2;
  return result;
}

void __99__SBSystemApertureSceneElement__updateReasonsForTransitionWithProposedParameters_excludingReasons___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "objectForSetting:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "SBUISA_CGRectforSetting:", a3);
    objc_msgSend(*(id *)(a1 + 40), "otherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SBUISA_CGRectforSetting:", a3);
    v8 = SBFRectApproximatelyEqualToRect();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, a2, v8 ^ 1u);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, a2, 0);
  }

}

- (id)_proposeTransitionParametersForTransitionToFrameInSceneView:(CGRect)a3 excludingParametersAssociatedWithReasons:(unint64_t)a4 usingCurrentAnimationParameters:(BOOL)a5
{
  __int16 v6;
  double height;
  double width;
  double y;
  double x;
  SBSystemApertureSceneElementTransitionParameters *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __int16 v17;
  BOOL v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = objc_alloc_init(SBSystemApertureSceneElementTransitionParameters);
  if ((v6 & 0x40) != 0)
  {
    if ((v6 & 0x80) != 0)
      goto LABEL_9;
    v16 = 0;
    goto LABEL_7;
  }
  v13 = -[SBSystemApertureSceneElement _clientLayoutModeForLayoutMode:](self, "_clientLayoutModeForLayoutMode:", -[SBSystemApertureSceneElement layoutMode](self, "layoutMode"));
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "SBUISA_layoutMode");
  v16 = v13 != v15;

  if ((v6 & 0x80) == 0)
  {
LABEL_7:
    v18 = -[SBSystemApertureSceneElement _requiresForegroundScene](self, "_requiresForegroundScene");
    -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18 ^ objc_msgSend(v19, "isForeground");

    if (v16 || (v20 & 1) != 0)
    {
      v17 = v6 & 0xFF1E;
      if ((v20 & 1) != 0)
        goto LABEL_13;
      goto LABEL_11;
    }
LABEL_9:
    v17 = v6;
    goto LABEL_13;
  }
  if (v13 == v15)
    goto LABEL_9;
  v17 = v6 & 0xFF1E;
LABEL_11:
  if (-[SBSystemApertureSceneElement _requiresForegroundScene](self, "_requiresForegroundScene"))
    v17 = v6 & 0xFB1E;
LABEL_13:
  if ((v17 & 0x40) != 0 || !a5)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC680]), "initWithFluidBehaviorSettings:tracking:retargeted:", 0, 0, 0);
  }
  else
  {
    +[SBSystemApertureFluidAnimator currentAnimationParameters](SBSystemApertureFluidAnimator, "currentAnimationParameters");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;
  if ((v17 & 0x400) != 0)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBSystemApertureSceneElement sceneSettings](self, "sceneSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "SBUISA_layoutMode") == 4)
  {
    v25 = -[SBSystemApertureSceneElement _clientLayoutModeForLayoutMode:](self, "_clientLayoutModeForLayoutMode:", -[SBSystemApertureSceneElement layoutMode](self, "layoutMode"));

    if ((v17 & 0x400) != 0 || a5 || v25 > 3)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnimationFence:", v24);
  }

LABEL_26:
  if (-[SBSystemApertureSceneElement mostRecentLayoutModeChangeReason](self, "mostRecentLayoutModeChangeReason") == 3)
    objc_msgSend(MEMORY[0x1E0DAC6D0], "userInitiatedSceneResizeActionWithAnimationParameters:", v22);
  else
    objc_msgSend(MEMORY[0x1E0DAC6D0], "sceneResizeActionWithAnimationParameters:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActions:", v27);

  -[SBSystemApertureSceneElementTransitionParameters setTransitionContext:](v12, "setTransitionContext:", v23);
  v28 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  if ((v17 & 0x40) != 0)
  {
    if ((v17 & 0x10) != 0)
      goto LABEL_31;
  }
  else
  {
    objc_msgSend(v28, "SBUISA_setLayoutMode:forSetting:", -[SBSystemApertureSceneElement _clientLayoutModeForLayoutMode:](self, "_clientLayoutModeForLayoutMode:", -[SBSystemApertureSceneElement layoutMode](self, "layoutMode")), 3213009);
    if ((v17 & 0x10) != 0)
    {
LABEL_31:
      if ((v17 & 0x200) != 0)
        goto LABEL_32;
      goto LABEL_43;
    }
  }
  -[SBSystemApertureSceneElement _frameInSceneContainerForView:](self, "_frameInSceneContainerForView:", self->_minimalView);
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213013);
  if ((v17 & 0x200) != 0)
  {
LABEL_32:
    if ((v17 & 8) != 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  -[SBSystemApertureSceneElement _frameInSceneContainerForView:](self, "_frameInSceneContainerForView:", self->_detachedMinimalView);
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213014);
  if ((v17 & 8) != 0)
  {
LABEL_33:
    if ((v17 & 4) != 0)
      goto LABEL_34;
    goto LABEL_45;
  }
LABEL_44:
  -[SBSystemApertureSceneElement leadingView](self, "leadingView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement _frameInSceneContainerForView:](self, "_frameInSceneContainerForView:", v31);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213011, v33, v35, v37, v39);
  if ((v17 & 4) != 0)
  {
LABEL_34:
    if ((v17 & 2) != 0)
      goto LABEL_35;
    goto LABEL_46;
  }
LABEL_45:
  -[SBSystemApertureSceneElement trailingView](self, "trailingView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneElement _frameInSceneContainerForView:](self, "_frameInSceneContainerForView:", v40);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213012, v42, v44, v46, v48);
  if ((v17 & 2) != 0)
  {
LABEL_35:
    if ((v17 & 1) != 0)
      goto LABEL_36;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213010, x, y, width, height);
  if ((v17 & 1) != 0)
  {
LABEL_36:
    if ((v17 & 0x80) != 0)
      goto LABEL_37;
    goto LABEL_48;
  }
LABEL_47:
  -[SBSystemApertureSceneElement sceneView](self, "sceneView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  v51 = v50;
  v53 = v52;

  -[SBSystemApertureSceneElementTransitionParameters setSceneSize:](v12, "setSceneSize:", v51, v53);
  if ((v17 & 0x80) != 0)
  {
LABEL_37:
    if ((v17 & 0x20) != 0)
      goto LABEL_38;
LABEL_49:
    -[SBSystemApertureSceneElement _obstructedAreaFrame](self, "_obstructedAreaFrame");
    objc_msgSend(v28, "SBUISA_setCGRect:forSetting:", 3213015);
    if ((v17 & 0x100) != 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_48:
  -[SBSystemApertureSceneElementTransitionParameters setWantsForeground:](v12, "setWantsForeground:", -[SBSystemApertureSceneElement _requiresForegroundScene](self, "_requiresForegroundScene"));
  -[SBSystemApertureSceneElementTransitionParameters setShouldSetForeground:](v12, "setShouldSetForeground:", 1);
  if ((v17 & 0x20) == 0)
    goto LABEL_49;
LABEL_38:
  if ((v17 & 0x100) == 0)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBSystemApertureSceneElement layoutAxis](self, "layoutAxis"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forSetting:", v29, 3213016);

  }
LABEL_40:
  -[SBSystemApertureSceneElementTransitionParameters setOtherSystemApertureSceneSettingsToApply:](v12, "setOtherSystemApertureSceneSettingsToApply:", v28);

  return v12;
}

- (void)_applyTransitionParameters:(id)a3
{
  void (**transitionRequestHandler)(id, SBSystemApertureSceneElement *, id);

  transitionRequestHandler = (void (**)(id, SBSystemApertureSceneElement *, id))self->_transitionRequestHandler;
  if (transitionRequestHandler)
    transitionRequestHandler[2](transitionRequestHandler, self, a3);
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing;
  CGFloat bottom;
  double leading;
  CGFloat top;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSDirectionalEdgeInsets result;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings", a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 == 3)
  {
    objc_msgSend(v11, "SBUISA_customLayoutPreferredOutsetsFromUnsafeArea");
    top = v24;
    leading = v25;
    bottom = v26;
    trailing = v27;
  }
  else if (a3 == 2)
  {
    -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "SBUISA_specifiesPreferredPaddingForCompactLayout");

    if (v14)
    {
      -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "SBUISA_preferredPaddingForCompactLayout");
      v17 = v16;
      v19 = v18;

      objc_msgSend(v12, "SBUISA_preferredLeadingViewSize");
      v21 = v17 + v20;
      objc_msgSend(v12, "SBUISA_preferredTrailingViewSize");
      v23 = v19 + v22;
      leading = -v21;
      trailing = -v23;
    }
  }

  v28 = top;
  v29 = leading;
  v30 = bottom;
  v31 = trailing;
  result.trailing = v31;
  result.bottom = v30;
  result.leading = v29;
  result.top = v28;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height;
  double width;
  SBSystemApertureSceneElementAccessoryView *v9;
  void *v10;
  id WeakRetained;
  SBSystemApertureSceneElementAccessoryView *v12;
  SBSystemApertureSceneElementAccessoryView *v13;
  double v14;
  double v15;
  SBSystemApertureSceneElementAccessoryView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = (SBSystemApertureSceneElementAccessoryView *)a4;
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
  if (a5 != 1 || self->_minimalView != v9)
  {
    -[SBSystemApertureSceneElement leadingView](self, "leadingView");
    v12 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();

    if (v12 == v9)
    {
      objc_msgSend(WeakRetained, "leadingView");
      v16 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();
      if (v16 != v9)
      {
        objc_msgSend(v10, "SBUISA_preferredLeadingViewSize");
LABEL_13:
        v14 = v17;
        v15 = v18;

        goto LABEL_16;
      }
    }
    else
    {
      -[SBSystemApertureSceneElement trailingView](self, "trailingView");
      v13 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();

      if (v13 != v9)
      {
        if (self->_detachedMinimalView != v9)
        {
          v14 = *MEMORY[0x1E0C9D820];
          v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          goto LABEL_16;
        }
        objc_msgSend(v10, "SBUISA_preferredDetachedMinimalViewSize");
        goto LABEL_15;
      }
      objc_msgSend(WeakRetained, "trailingView");
      v16 = (SBSystemApertureSceneElementAccessoryView *)objc_claimAutoreleasedReturnValue();
      if (v16 != v9)
      {
        objc_msgSend(v10, "SBUISA_preferredTrailingViewSize");
        goto LABEL_13;
      }
    }
    -[SBSystemApertureSceneElementAccessoryView sizeThatFits:](v9, "sizeThatFits:", width, height);
    goto LABEL_13;
  }
  objc_msgSend(v10, "SBUISA_preferredMinimalViewSize");
LABEL_15:
  v14 = v19;
  v15 = v20;
LABEL_16:
  v21 = fmax(v14, 0.0);
  v22 = fmax(v15, 0.0);
  if (v21 < width)
    width = v21;
  if (v22 < height)
    height = v22;

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)_updateSceneWithTransitionParameters:(id)a3
{
  id v4;
  FBScene *scene;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  scene = self->_scene;
  if (objc_msgSend(v4, "wantsForeground"))
    v6 = objc_msgSend(v4, "shouldSetForeground");
  else
    v6 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SBSystemApertureSceneElement__updateSceneWithTransitionParameters___block_invoke;
  v8[3] = &unk_1E8EBE718;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SBSystemApertureSceneElement _updateScene:activatingIfNeeded:settingsWithTransitionBlock:](self, "_updateScene:activatingIfNeeded:settingsWithTransitionBlock:", scene, v6, v8);

}

uint64_t __69__SBSystemApertureSceneElement__updateSceneWithTransitionParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateMutableSceneSettings:withParameters:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "transitionContext");
}

- (void)_updateScene:(id)a3 activatingIfNeeded:(BOOL)a4 settingsWithTransitionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _BOOL4 v10;
  int v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[SBSystemApertureSceneElementConfiguration allowsSceneReactivation](self->_configuration, "allowsSceneReactivation");
  v11 = objc_msgSend(v8, "isActive");
  v12 = v11;
  if (!v10)
  {
    if (!v11)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(v8, "updateSettingsWithTransitionBlock:", v9);
    goto LABEL_13;
  }
  if ((objc_msgSend(v8, "isActive") & 1) != 0)
    goto LABEL_9;
  if ((v12 & 1) == 0 && v6)
  {
    SBLogSystemApertureHosting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Activating scene because it's foreground and isn't active and client allows it", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__99;
    v26 = __Block_byref_object_dispose__100;
    v27 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke;
    v20 = &unk_1E8EBE768;
    p_buf = &buf;
    v21 = v9;
    objc_msgSend(v8, "configureParameters:", &v17);
    objc_msgSend(v8, "activateWithTransitionContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v17, v18, v19, v20);

    _Block_object_dispose(&buf, 8);
    goto LABEL_13;
  }
LABEL_10:
  SBLogSystemApertureHosting();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSystemApertureSceneElement succinctDescription](self, "succinctDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping scene settings update because it's not active and client doesn't allow us to", (uint8_t *)&buf, 0xCu);

  }
LABEL_13:

}

void __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke_2;
  v5[3] = &unk_1E8EBE740;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(a2, "updateSettingsWithBlock:", v5);

}

void __92__SBSystemApertureSceneElement__updateScene_activatingIfNeeded_settingsWithTransitionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateMutableSceneSettings:(id)a3 withParameters:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "shouldSetForeground"))
  {
    objc_msgSend(v16, "setForeground:", objc_msgSend(v5, "wantsForeground"));
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v5, "sceneSize");
    objc_msgSend(v16, "setFrame:", v6, v7, v8, v9);
    objc_msgSend(v16, "setInterfaceOrientation:", 1);
  }
  objc_msgSend(v16, "otherSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  objc_msgSend(v5, "otherSystemApertureSceneSettingsToApply");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySettings:", v15);

}

- (void)_updateReadyForPresentationIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "*** Client SPI Misuse: Invalid attempt to post two elements in jindo with the same elementIdentifier, << %{public}@ >> ***", (uint8_t *)&v2, 0xCu);
}

uint64_t __67__SBSystemApertureSceneElement__updateReadyForPresentationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "_hasActivationAttribute:", 16) && (objc_msgSend(v3, "isDeactivating") & 1) == 0)
  {
    objc_msgSend(v3, "placeholderContentProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "placeholderContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v4 = SAElementIdentityEqualToIdentity();
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldSuppressBackgroundActivities
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  if (-[SBSystemApertureSceneElement isSuppressedByProximityReader](self, "isSuppressedByProximityReader"))
  {
    -[SBSystemApertureSceneElement elementIdentifier](self, "elementIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0DAC938]) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  if (!-[SBSystemApertureSceneElement isActivated](self, "isActivated"))
    return 0;
  -[SBSystemApertureSceneElement layoutHost](self, "layoutHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)_acquireOrUpdateAppStatusBarSessionsAssertionIfNeeded
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[SBSystemApertureSceneElement _shouldSuppressBackgroundActivities](self, "_shouldSuppressBackgroundActivities"))
  {
    -[SBSystemApertureSceneElement representedBackgroundActivityIdentifiers](self, "representedBackgroundActivityIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v11 = v3;
  if (objc_msgSend(v3, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[FBScene clientHandle](self->_scene, "clientHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "acquireSuppressionAssertionForBackgroundActivities:reason:", v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[SBSystemApertureSceneElement statusBarStyleOverridesSuppressionAssertion](self, "statusBarStyleOverridesSuppressionAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[SBSystemApertureSceneElement setStatusBarStyleOverridesSuppressionAssertion:](self, "setStatusBarStyleOverridesSuppressionAssertion:", v9);
}

- (void)_updateAlertAssertionIfNecessary
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  id v7;

  if (-[SBSystemApertureSceneElement hasAlertBehavior](self, "hasAlertBehavior"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
    objc_msgSend(WeakRetained, "alertAssertion");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
    objc_msgSend(WeakRetained, "alertingActivityAssertion");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "SBUISA_preventsAutomaticDismissal");

  if (v5)
  {
    -[SBSystemApertureSceneElement clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutomaticallyInvalidatable:lockingWithKey:reason:", 0, v6, CFSTR("client prevents automatic dismissal"));

  }
}

- (void)_updateActiveElementsAndAssociatedApplication
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  SBApplication *v15;
  SBApplication *associatedApplication;
  SBApplication *v17;
  int v18;
  BSInvalidatable *v19;
  BSInvalidatable *v20;
  void *activeApplicationElementAssertion;
  BSInvalidatable *v22;
  BSInvalidatable *v23;
  id v24;

  if (-[SBSystemApertureSceneElement isActivated](self, "isActivated")
    && -[SBSystemApertureSceneElement isReadyForPresentation](self, "isReadyForPresentation")
    && (-[SBSystemApertureSceneElement _requiresForegroundScene](self, "_requiresForegroundScene")
     || -[SBSystemApertureSceneElement preferredLayoutMode](self, "preferredLayoutMode") >= 1))
  {
    +[SBSystemApertureSceneElement addActiveElement:](SBSystemApertureSceneElement, "addActiveElement:", self);
    v3 = 1;
  }
  else
  {
    +[SBSystemApertureSceneElement removeActiveElement:](SBSystemApertureSceneElement, "removeActiveElement:", self);
    v3 = 0;
  }
  -[SBSystemApertureSceneElement sceneClientSettings](self, "sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SBUISA_associatedAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v24 = v5;
  }
  else
  {
    -[SBApplicationSceneHandle application](self->_associatedApplicationSceneHandle, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v24 = v8;
    }
    else
    {
      -[FBScene clientHandle](self->_scene, "clientHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[SBSystemApertureSceneElement associatedApplication](self, "associatedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualStrings();

  if ((v13 & 1) == 0)
  {
    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applicationWithBundleIdentifier:", v24);
    v15 = (SBApplication *)objc_claimAutoreleasedReturnValue();
    associatedApplication = self->_associatedApplication;
    self->_associatedApplication = v15;

  }
  v17 = self->_associatedApplication;
  if (!v3)
  {
    if (v17)
      goto LABEL_29;
LABEL_27:
    -[BSInvalidatable invalidate](self->_activeApplicationElementAssertion, "invalidate");
    activeApplicationElementAssertion = self->_activeApplicationElementAssertion;
    self->_activeApplicationElementAssertion = 0;
    goto LABEL_28;
  }
  if (v17)
    v18 = v13;
  else
    v18 = 0;
  if (v18 != 1)
  {
    if (v17)
    {
      v19 = self->_activeApplicationElementAssertion;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!self->_activeApplicationElementAssertion)
  {
    v19 = 0;
LABEL_26:
    -[BSInvalidatable invalidate](v19, "invalidate");
    v20 = self->_activeApplicationElementAssertion;
    self->_activeApplicationElementAssertion = 0;

    activeApplicationElementAssertion = objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
    objc_msgSend(activeApplicationElementAssertion, "acquireActiveElementAssertionForApplication:reason:", self->_associatedApplication, CFSTR("scene element request"));
    v22 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v23 = self->_activeApplicationElementAssertion;
    self->_activeApplicationElementAssertion = v22;

LABEL_28:
  }
LABEL_29:

}

- (SBSystemApertureSceneElementAccessoryView)leadingView
{
  void *leadingWrapperView;

  leadingWrapperView = self->_leadingWrapperView;
  if (!leadingWrapperView)
    leadingWrapperView = self->_leadingView;
  return (SBSystemApertureSceneElementAccessoryView *)leadingWrapperView;
}

- (SBSystemApertureSceneElementAccessoryView)trailingView
{
  void *trailingWrapperView;

  trailingWrapperView = self->_trailingWrapperView;
  if (!trailingWrapperView)
    trailingWrapperView = self->_trailingView;
  return (SBSystemApertureSceneElementAccessoryView *)trailingWrapperView;
}

- (SBSystemApertureSceneElementAccessoryView)minimalView
{
  void *minimalWrapperView;

  minimalWrapperView = self->_minimalWrapperView;
  if (!minimalWrapperView)
    minimalWrapperView = self->_minimalView;
  return (SBSystemApertureSceneElementAccessoryView *)minimalWrapperView;
}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4;
  NSHashTable *layoutObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    layoutObservers = self->__layoutObservers;
    v8 = v4;
    if (!layoutObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->__layoutObservers;
      self->__layoutObservers = v6;

      layoutObservers = self->__layoutObservers;
    }
    -[NSHashTable addObject:](layoutObservers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  id v4;
  NSHashTable *layoutObservers;
  NSHashTable *v6;
  id v7;

  v4 = a3;
  layoutObservers = self->__layoutObservers;
  v7 = v4;
  if (v4 && layoutObservers)
  {
    -[NSHashTable removeObject:](layoutObservers, "removeObject:", v4);
    layoutObservers = self->__layoutObservers;
  }
  if (!-[NSHashTable count](layoutObservers, "count"))
  {
    v6 = self->__layoutObservers;
    self->__layoutObservers = 0;

  }
}

- (void)element:(id)a3 visibilityWillChange:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 1;
  else
    v4 = 3;
  -[SBSystemApertureSceneElement setElementAppearState:](self, "setElementAppearState:", v4);
}

- (void)element:(id)a3 visibilityDidChange:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  -[SBSystemApertureSceneElement setElementAppearState:](self, "setElementAppearState:", v4);
}

- (void)setElementAppearState:(int)a3
{
  if (self->_elementAppearState != a3)
  {
    self->_elementAppearState = a3;
    -[SBSystemApertureSceneElement _updateSceneBackgroundStateIfNeeded](self, "_updateSceneBackgroundStateIfNeeded");
    -[SBSystemApertureSceneElement _updateActiveElementsAndAssociatedApplication](self, "_updateActiveElementsAndAssociatedApplication");
  }
}

- (void)placeholderWrapperViewDidChangeContentView:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

}

- (NSString)description
{
  return (NSString *)-[SBSystemApertureSceneElement descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBSystemApertureSceneElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene clientHandle](self->_scene, "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("client"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemApertureSceneElement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBSystemApertureSceneElement *v11;

  v4 = a3;
  -[SBSystemApertureSceneElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBSystemApertureSceneElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __70__SBSystemApertureSceneElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("sceneIdentifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("elementIdentifier"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReadyForPresentation"), CFSTR("isReadyForPresentation"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isActivated"), CFSTR("isActivated"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v9, CFSTR("configuration"), 1);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "layoutMode");
  SAUIStringFromElementViewLayoutMode();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("layoutMode"));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:skipIfEmpty:", v15, CFSTR("clientBundleIdentifier"), 1);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sceneClientSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "SBUISA_associatedAppBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:withName:skipIfEmpty:", v18, CFSTR("associatedAppBundleIdentifier"), 1);

  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sceneClientSettings");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "SBUISA_associatedScenePersistenceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendString:withName:skipIfEmpty:", v20, CFSTR("associatedScenePersistenceIdentifier"), 1);

}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  return (SBSystemAperturePlatformElementHosting *)objc_loadWeakRetained((id *)&self->_platformElementHost);
}

- (void)setPlatformElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_platformElementHost, a3);
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (unint64_t)obstructionEdge
{
  return self->_obstructionEdge;
}

- (void)setObstructionEdge:(unint64_t)a3
{
  self->_obstructionEdge = a3;
}

- (int64_t)systemApertureCustomLayout
{
  return self->_systemApertureCustomLayout;
}

- (SBSystemApertureGestureHandling)gestureHandler
{
  return (SBSystemApertureGestureHandling *)objc_loadWeakRetained((id *)&self->_gestureHandler);
}

- (void)setGestureHandler:(id)a3
{
  objc_storeWeak((id *)&self->_gestureHandler, a3);
}

- (SAAlertHosting)alertHost
{
  return (SAAlertHosting *)objc_loadWeakRetained((id *)&self->_alertHost);
}

- (SAActivityHosting)activityHost
{
  return (SAActivityHosting *)objc_loadWeakRetained((id *)&self->_activityHost);
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (SAElementHosting)elementHost
{
  return (SAElementHosting *)objc_loadWeakRetained((id *)&self->_elementHost);
}

- (void)setElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_elementHost, a3);
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
}

- (BOOL)isReadyForPresentation
{
  return self->_readyForPresentation;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
  objc_storeStrong((id *)&self->_presentable, a3);
}

- (id)clientInvalidationRequestHandler
{
  return self->_clientInvalidationRequestHandler;
}

- (void)setClientInvalidationRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)sceneInvalidationHandler
{
  return self->_sceneInvalidationHandler;
}

- (void)setSceneInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SBSystemApertureSceneElementLaunchActionHandling)launchActionHandler
{
  return (SBSystemApertureSceneElementLaunchActionHandling *)objc_loadWeakRetained((id *)&self->_launchActionHandler);
}

- (void)setLaunchActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_launchActionHandler, a3);
}

- (SBApplication)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
  objc_storeStrong((id *)&self->_associatedApplication, a3);
}

- (BOOL)alwaysAllowTapToAppForBodyTaps
{
  return self->_alwaysAllowTapToAppForBodyTaps;
}

- (void)setAlwaysAllowTapToAppForBodyTaps:(BOOL)a3
{
  self->_alwaysAllowTapToAppForBodyTaps = a3;
}

- (SBDeviceApplicationSceneHandle)associatedApplicationSceneHandle
{
  return self->_associatedApplicationSceneHandle;
}

- (void)setAssociatedApplicationSceneHandle:(id)a3
{
  objc_storeStrong((id *)&self->_associatedApplicationSceneHandle, a3);
}

- (SBSystemApertureSceneElementPlaceholderContentProviding)placeholderContentProvider
{
  return (SBSystemApertureSceneElementPlaceholderContentProviding *)objc_loadWeakRetained((id *)&self->_placeholderContentProvider);
}

- (void)setPlaceholderContentProvider:(id)a3
{
  objc_storeWeak((id *)&self->_placeholderContentProvider, a3);
}

- (SBSystemApertureBackgroundActivitiesSuppressing)statusBarBackgroundActivitiesSuppresser
{
  return (SBSystemApertureBackgroundActivitiesSuppressing *)objc_loadWeakRetained((id *)&self->_statusBarBackgroundActivitiesSuppresser);
}

- (void)setStatusBarBackgroundActivitiesSuppresser:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarBackgroundActivitiesSuppresser, a3);
}

- (SBSystemApertureSceneElementScenePresenterView)sceneView
{
  return self->_sceneView;
}

- (void)setSceneView:(id)a3
{
  objc_storeStrong((id *)&self->_sceneView, a3);
}

- (void)setLeadingView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingView, a3);
}

- (void)setTrailingView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingView, a3);
}

- (void)setMinimalView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalView, a3);
}

- (SBSystemApertureSceneElementAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (void)setDetachedMinimalView:(id)a3
{
  objc_storeStrong((id *)&self->_detachedMinimalView, a3);
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)leadingWrapperView
{
  return self->_leadingWrapperView;
}

- (void)setLeadingWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingWrapperView, a3);
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)trailingWrapperView
{
  return self->_trailingWrapperView;
}

- (void)setTrailingWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingWrapperView, a3);
}

- (SBSystemApertureSceneElementPlaceholderWrapperView)minimalWrapperView
{
  return self->_minimalWrapperView;
}

- (void)setMinimalWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalWrapperView, a3);
}

- (NSMutableArray)deferredSceneActions
{
  return self->_deferredSceneActions;
}

- (void)setDeferredSceneActions:(id)a3
{
  objc_storeStrong((id *)&self->_deferredSceneActions, a3);
}

- (id)postSceneActivationPlaceholderTest
{
  return self->_postSceneActivationPlaceholderTest;
}

- (void)setPostSceneActivationPlaceholderTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)postSceneActivationPlaceholderElementFoundHandler
{
  return self->_postSceneActivationPlaceholderElementFoundHandler;
}

- (void)setPostSceneActivationPlaceholderElementFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)invalidatingForMoveToPlaceholderElement
{
  return self->_invalidatingForMoveToPlaceholderElement;
}

- (void)setInvalidatingForMoveToPlaceholderElement:(BOOL)a3
{
  self->_invalidatingForMoveToPlaceholderElement = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)requiresSuppressionFromSystemAperture
{
  return self->_requiresSuppressionFromSystemAperture;
}

- (void)setRequiresSuppressionFromSystemAperture:(BOOL)a3
{
  self->_requiresSuppressionFromSystemAperture = a3;
}

- (id)readyHandler
{
  return self->_readyHandler;
}

- (id)deactivationHandler
{
  return self->_deactivationHandler;
}

- (void)setDeactivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)transitionRequestHandler
{
  return self->_transitionRequestHandler;
}

- (NSHashTable)_layoutObservers
{
  return self->__layoutObservers;
}

- (SAAutomaticallyInvalidatable)_alertingActivityAssertion
{
  return self->_alertingActivityAssertion;
}

- (int64_t)alertingSource
{
  return self->_alertingSource;
}

- (SAAutomaticallyInvalidatable)_sessionMonitorAssertion
{
  return self->_sessionMonitorAssertion;
}

- (SBUISystemApertureAlertingAction)_alertingAction
{
  return self->_alertingAction;
}

- (void)_setAlertingAction:(id)a3
{
  objc_storeStrong((id *)&self->_alertingAction, a3);
}

- (SBSystemActionElementPreviewingCoordinator)previewingCoordinator
{
  return self->_previewingCoordinator;
}

- (BOOL)wantsLayoutPassForClientUpdate
{
  return self->_wantsLayoutPassForClientUpdate;
}

- (void)setWantsLayoutPassForClientUpdate:(BOOL)a3
{
  self->_wantsLayoutPassForClientUpdate = a3;
}

- (int64_t)mostRecentLayoutModeChangeReason
{
  return self->_mostRecentLayoutModeChangeReason;
}

- (void)setMostRecentLayoutModeChangeReason:(int64_t)a3
{
  self->_mostRecentLayoutModeChangeReason = a3;
}

- (unint64_t)activationAttributes
{
  return self->_activationAttributes;
}

- (BSInvalidatable)statusBarStyleOverridesSuppressionAssertion
{
  return self->_statusBarStyleOverridesSuppressionAssertion;
}

- (void)setStatusBarStyleOverridesSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarStyleOverridesSuppressionAssertion, a3);
}

- (BSInvalidatable)activeApplicationElementAssertion
{
  return self->_activeApplicationElementAssertion;
}

- (void)setActiveApplicationElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_activeApplicationElementAssertion, a3);
}

- (BOOL)wantsSpecialFlowerBoundsResizingAnimationForWallet
{
  return self->_wantsSpecialFlowerBoundsResizingAnimationForWallet;
}

- (void)setWantsSpecialFlowerBoundsResizingAnimationForWallet:(BOOL)a3
{
  self->_wantsSpecialFlowerBoundsResizingAnimationForWallet = a3;
}

- (SBSystemApertureSettings)settings
{
  return self->_settings;
}

- (SAAssertion)elementHostPrefersSuppressionAssertion
{
  return self->_elementHostPrefersSuppressionAssertion;
}

- (void)setElementHostPrefersSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_elementHostPrefersSuppressionAssertion, a3);
}

- (int)elementAppearState
{
  return self->_elementAppearState;
}

- (BOOL)hasHandledLaunchAction
{
  return self->_hasHandledLaunchAction;
}

- (void)setHasHandledLaunchAction:(BOOL)a3
{
  self->_hasHandledLaunchAction = a3;
}

- (BOOL)hasCompletedInitialPresentation
{
  return self->_hasCompletedInitialPresentation;
}

- (void)setHasCompletedInitialPresentation:(BOOL)a3
{
  self->_hasCompletedInitialPresentation = a3;
}

- (BOOL)hasBeenRemoved
{
  return self->_hasBeenRemoved;
}

- (BOOL)backlightIsOrWillBecomeActive
{
  return self->_backlightIsOrWillBecomeActive;
}

- (int64_t)initialPreferredLayoutMode
{
  return self->_initialPreferredLayoutMode;
}

- (void)setInitialPreferredLayoutMode:(int64_t)a3
{
  self->_initialPreferredLayoutMode = a3;
}

- (BOOL)isSuppressedByProximityReader
{
  return self->_suppressedByProximityReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementHostPrefersSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeApplicationElementAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarStyleOverridesSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
  objc_storeStrong((id *)&self->_alertingAction, 0);
  objc_storeStrong((id *)&self->_sessionMonitorAssertion, 0);
  objc_storeStrong((id *)&self->_alertingActivityAssertion, 0);
  objc_storeStrong((id *)&self->__layoutObservers, 0);
  objc_storeStrong(&self->_transitionRequestHandler, 0);
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_readyHandler, 0);
  objc_storeStrong(&self->_postSceneActivationPlaceholderElementFoundHandler, 0);
  objc_storeStrong(&self->_postSceneActivationPlaceholderTest, 0);
  objc_storeStrong((id *)&self->_deferredSceneActions, 0);
  objc_storeStrong((id *)&self->_minimalWrapperView, 0);
  objc_storeStrong((id *)&self->_trailingWrapperView, 0);
  objc_storeStrong((id *)&self->_leadingWrapperView, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_destroyWeak((id *)&self->_statusBarBackgroundActivitiesSuppresser);
  objc_destroyWeak((id *)&self->_placeholderContentProvider);
  objc_storeStrong((id *)&self->_associatedApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_destroyWeak((id *)&self->_launchActionHandler);
  objc_storeStrong(&self->_sceneInvalidationHandler, 0);
  objc_storeStrong(&self->_clientInvalidationRequestHandler, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_destroyWeak((id *)&self->_activityHost);
  objc_destroyWeak((id *)&self->_alertHost);
  objc_destroyWeak((id *)&self->_gestureHandler);
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithScene:(const char *)a1 statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithScene:(const char *)a1 placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_isValidAlertingSource:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleAction:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Client requested invalidation, but no clientInvalidationRequestHandler exists.", v1, 2u);
}

@end
