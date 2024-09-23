@implementation SBSystemUISceneController

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  LOBYTE(self) = -[SBFSceneWorkspaceController enumerateScenesWithBlock:](self->_sceneWorkspaceController, "enumerateScenesWithBlock:", v4);

  return (char)self;
}

- (id)addPresenter:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSPointerArray *presenters;
  NSPointerArray *v11;
  NSPointerArray *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

  }
  -[SBSystemUISceneController _presenterArray](self, "_presenterArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 226, CFSTR("presenter was already added: %@"), v5);

  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v8 = objc_alloc(MEMORY[0x1E0D01868]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__SBSystemUISceneController_addPresenter___block_invoke;
  v17[3] = &unk_1E8EC0620;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v9 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSystemUISceneController"), CFSTR("_initiallyPendedPresenters"), v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setPresentingDelegate:", self);
  presenters = self->_presenters;
  if (presenters)
  {
    v11 = presenters;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v11 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  }
  v12 = self->_presenters;
  self->_presenters = v11;

  -[NSPointerArray addPointer:](self->_presenters, "addPointer:", v5);
  -[NSPointerArray compact](self->_presenters, "compact");
  -[SBSystemUISceneController _presenterArray](self, "_presenterArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController _evaluateAvailablePresenters:forSceneControllers:](self, "_evaluateAvailablePresenters:forSceneControllers:", v13, self->_sceneControllers);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SBSystemUISceneDefaultPresenter *v25;
  SBSystemUISceneDefaultPresenter *defaultPresenter;
  SBSystemUISceneDefaultPresenter *v27;
  SBSystemUISceneController *v28;
  id v29;
  char v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a4;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v40;
    v28 = self;
    v29 = v6;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "sceneOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v9;
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v12 = 0;
LABEL_19:
          v13 = 0;
          v19 = 1;
          goto LABEL_24;
        }
        objc_msgSend(v9, "scenePlacementConfiguration");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();
        if ((v11 & 1) != 0)
        {
          objc_msgSend(v10, "targetSceneIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_19;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v10 = v6;
          v13 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v13)
          {
            v30 = v11;
            v14 = *(_QWORD *)v36;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v36 != v14)
                  objc_enumerationMutation(v10);
                v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v16, "parentSceneIdentityToken");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqual:", v12);

                if (v18)
                {
                  v13 = v16;
                  goto LABEL_22;
                }
              }
              v13 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v13)
                continue;
              break;
            }
LABEL_22:
            self = v28;
            v6 = v29;
            v11 = v30;
          }
        }
        else
        {
          v12 = 0;
          v13 = 0;
        }
        v19 = v11 ^ 1;

LABEL_24:
        objc_msgSend(v8, "targetDisplayConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "isContinuityDisplay"))
        {
          objc_msgSend(v8, "scene");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "settings");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "level");
          -[SBSystemUISceneController _continuityPresenterForDisplayIdentity:level:](self, "_continuityPresenterForDisplayIdentity:level:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setPresenter:", v24);
        }
        else if (v13)
        {
          objc_msgSend(v8, "setPresenter:", v13);
        }
        else if ((v19 & 1) != 0)
        {
          objc_msgSend(v6, "lastObject");
          v25 = (SBSystemUISceneDefaultPresenter *)objc_claimAutoreleasedReturnValue();
          defaultPresenter = v25;
          if (!v25)
            defaultPresenter = self->_defaultPresenter;
          v27 = defaultPresenter;

          objc_msgSend(v8, "setPresenter:", v27);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v33);
  }

}

- (void)_setNeedsPresentersEvaluation
{
  id v3;

  -[SBSystemUISceneController _presenterArray](self, "_presenterArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController _evaluateAvailablePresenters:forSceneControllers:](self, "_evaluateAvailablePresenters:forSceneControllers:", v3, self->_sceneControllers);

}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a4;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_clientProcessIdentity);

  if (v7)
  {
    objc_msgSend(v5, "addObserver:", self);
    v8 = v5;
    BSDispatchMain();

  }
}

- (id)sceneFromIdentityToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBFSceneWorkspaceController sceneFromIdentityToken:](self->_sceneWorkspaceController, "sceneFromIdentityToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBFSceneWorkspaceController sceneFromIdentityTokenStringRepresentation:](self->_sceneWorkspaceController, "sceneFromIdentityTokenStringRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_setupInfo
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (id)MEMORY[0x1E0C9AA70];
}

- (SBSystemUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SBSystemUISceneController *v19;
  SBSystemUISceneController *v20;
  uint64_t v21;
  NSString *jobLabel;
  uint64_t v23;
  NSString *traitsRole;
  uint64_t v25;
  NSMutableArray *sceneControllers;
  uint64_t v27;
  NSMapTable *sceneControllersByDisplayIdentity;
  uint64_t v29;
  NSMapTable *continuityPresentersByLevelForDisplayIdentity;
  uint64_t v31;
  NSMapTable *continuityFuturesByLevelForDisplayIdentity;
  SBFSceneWorkspaceDefaultDelegate *v33;
  SBFSceneWorkspaceDefaultDelegate *sceneWorkspaceControllerDelegate;
  uint64_t v35;
  SBFSceneWorkspaceController *sceneWorkspaceController;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  BSInvalidatable *stateCaptureInvalidatable;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id location;
  objc_super v50;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientProcessIdentity"));

    if (v17)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspaceIdentifier"));

  if (!v16)
    goto LABEL_10;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitsRole"));

LABEL_4:
  v50.receiver = self;
  v50.super_class = (Class)SBSystemUISceneController;
  v19 = -[SBSystemUISceneController init](&v50, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_level = a8;
    v21 = objc_msgSend(v18, "copy");
    jobLabel = v20->_jobLabel;
    v20->_jobLabel = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    traitsRole = v20->_traitsRole;
    v20->_traitsRole = (NSString *)v23;

    v20->_sceneVendingPolicy = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    sceneControllers = v20->_sceneControllers;
    v20->_sceneControllers = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v20->_clientProcessIdentity, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    sceneControllersByDisplayIdentity = v20->_sceneControllersByDisplayIdentity;
    v20->_sceneControllersByDisplayIdentity = (NSMapTable *)v27;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v29 = objc_claimAutoreleasedReturnValue();
    continuityPresentersByLevelForDisplayIdentity = v20->_continuityPresentersByLevelForDisplayIdentity;
    v20->_continuityPresentersByLevelForDisplayIdentity = (NSMapTable *)v29;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v31 = objc_claimAutoreleasedReturnValue();
    continuityFuturesByLevelForDisplayIdentity = v20->_continuityFuturesByLevelForDisplayIdentity;
    v20->_continuityFuturesByLevelForDisplayIdentity = (NSMapTable *)v31;

    v33 = (SBFSceneWorkspaceDefaultDelegate *)objc_alloc_init(MEMORY[0x1E0DA9ED0]);
    sceneWorkspaceControllerDelegate = v20->_sceneWorkspaceControllerDelegate;
    v20->_sceneWorkspaceControllerDelegate = v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9EC8]), "initWithIdentifier:delegate:", v15, v20->_sceneWorkspaceControllerDelegate);
    sceneWorkspaceController = v20->_sceneWorkspaceController;
    v20->_sceneWorkspaceController = (SBFSceneWorkspaceController *)v35;

    if ((unint64_t)(v20->_sceneVendingPolicy - 1) <= 2)
    {
      objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "processForIdentity:", v20->_clientProcessIdentity);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemUISceneController _updateClientProcess:](v20, "_updateClientProcess:", v38);

      -[FBProcess addObserver:](v20->_clientProcess, "addObserver:", v20);
      objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObserver:", v20);

    }
    objc_initWeak(&location, v20);
    v40 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - SystemUISceneController - %@"), v18);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v48, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v42 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v20->_stateCaptureInvalidatable;
    v20->_stateCaptureInvalidatable = (BSInvalidatable *)v42;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v20;
}

id __129__SBSystemUISceneController_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[FBProcess removeObserver:](self->_clientProcess, "removeObserver:", self);
  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  -[SBFSceneWorkspaceController invalidate](self->_sceneWorkspaceController, "invalidate");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBSystemUISceneController _presenterArray](self, "_presenterArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "cancel");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SBSystemUISceneController;
  -[SBSystemUISceneController dealloc](&v9, sel_dealloc);
}

- (void)windowSceneDidConnect:(id)a3
{
  id v5;
  NSMapTable *sceneControllersByDisplayIdentity;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
  objc_msgSend(v5, "_fbsDisplayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](sceneControllersByDisplayIdentity, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_sceneVendingPolicy >= 2uLL)
  {
    -[NSMapTable keyEnumerator](self->_sceneControllersByDisplayIdentity, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_sceneVendingPolicy != 3
      || (objc_msgSend(v9, "nextObject"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      -[NSMapTable objectEnumerator](self->_sceneControllersByDisplayIdentity, "objectEnumerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bs_filter:", &__block_literal_global_392);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v31 = v12;
        v32 = v10;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v30 = v15;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v22, "scene");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[SBSystemUISceneController _isAllowedToRecreateSceneOnConnectingWindowScene:](self, "_isAllowedToRecreateSceneOnConnectingWindowScene:", v23);

              if (v24)
              {
                objc_msgSend(v22, "sceneOptions");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = -[SBSystemUISceneController _newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:](self, "_newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:", v5, v25);

                v27 = -[SBSystemUISceneController _newSceneControllerForWindowScene:withSceneRequestOptions:](self, "_newSceneControllerForWindowScene:withSceneRequestOptions:", v5, v26);
                objc_msgSend(v27, "setSceneActive:", objc_msgSend(v22, "isSceneActive"));

                v19 = v27;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v18);
        }
        else
        {
          v19 = 0;
        }

        v12 = v31;
        v10 = v32;
        v15 = v30;
      }
      else
      {
        v28 = -[SBSystemUISceneController _newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:](self, "_newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:", v5, 0);
        v19 = -[SBSystemUISceneController _newSceneControllerForWindowScene:withSceneRequestOptions:](self, "_newSceneControllerForWindowScene:withSceneRequestOptions:", v5, v28);

      }
    }

  }
}

BOOL __51__SBSystemUISceneController_windowSceneDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_sceneVendingPolicy)
  {
    if (!self->_sceneControllers)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SBSystemUISceneController _invalidateSceneControllersForWindowScene:](self, "_invalidateSceneControllersForWindowScene:", v5);
    if (objc_msgSend(v5, "isContinuityDisplayWindowScene"))
    {
      objc_msgSend(v5, "_fbsDisplayIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogSystemUIScene();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Continuity display %{public}@ disconnected", (uint8_t *)&v9, 0xCu);
      }

      -[NSMapTable removeObjectForKey:](self->_continuityPresentersByLevelForDisplayIdentity, "removeObjectForKey:", v6);
      -[NSMapTable removeObjectForKey:](self->_continuityFuturesByLevelForDisplayIdentity, "removeObjectForKey:", v6);

    }
  }

}

- (id)_presenterArray
{
  return -[NSPointerArray allObjects](self->_presenters, "allObjects");
}

void __42__SBSystemUISceneController_addPresenter___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained[6], "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      while ((id)objc_msgSend(WeakRetained[6], "pointerAtIndex:", v5) != v2)
      {
        if (v4 == ++v5)
          goto LABEL_8;
      }
      objc_msgSend(WeakRetained[6], "removePointerAtIndex:", v5);
      objc_msgSend(WeakRetained, "_presenterArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_evaluateAvailablePresenters:forSceneControllers:", v6, WeakRetained[5]);

    }
  }
LABEL_8:

}

- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  SBSingleSceneController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v13)
  {
    if (v11)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v12)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitsRole"));

  if (!v11)
    goto LABEL_9;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneRequestOptions"));

LABEL_4:
  objc_msgSend(v11, "_fbsDisplayConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBSingleSceneController initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:]([SBSingleSceneController alloc], "initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:", self->_sceneWorkspaceController, v12, self->_clientProcessIdentity, v13, a6);
  -[SBSingleSceneController setTargetDisplayConfiguration:](v16, "setTargetDisplayConfiguration:", v14);
  -[SBSingleSceneController setShouldForegroundForDisplayConfiguration:](v16, "setShouldForegroundForDisplayConfiguration:", 1);
  -[SBSingleSceneController setShouldActivateUponClientConnection:](v16, "setShouldActivateUponClientConnection:", self->_sceneVendingPolicy == 2);
  -[SBSystemUISceneController _updateShouldHideForSecureMode](self, "_updateShouldHideForSecureMode");
  -[NSMapTable objectForKey:](self->_sceneControllersByDisplayIdentity, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, "addObject:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMapTable setObject:forKey:](self->_sceneControllersByDisplayIdentity, "setObject:forKey:", v18, v15);
  -[NSMutableArray addObject:](self->_sceneControllers, "addObject:", v16);
  -[SBSystemUISceneController _presenterArray](self, "_presenterArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController _evaluateAvailablePresenters:forSceneControllers:](self, "_evaluateAvailablePresenters:forSceneControllers:", v19, self->_sceneControllers);

  return v16;
}

- (BOOL)_isAllowedToRecreateSceneOnConnectingWindowScene:(id)a3
{
  return 1;
}

- (void)_invalidateSceneControllersForWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_fbsDisplayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_sceneControllersByDisplayIdentity, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SBSystemUISceneController__invalidateSceneControllersForWindowScene___block_invoke;
  v15[3] = &unk_1E8EC0648;
  v15[4] = self;
  objc_msgSend(v5, "bs_filter:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }
  -[NSMutableArray removeObjectsInArray:](self->_sceneControllers, "removeObjectsInArray:", v6);
  -[NSMapTable removeObjectForKey:](self->_sceneControllersByDisplayIdentity, "removeObjectForKey:", v4);

}

uint64_t __71__SBSystemUISceneController__invalidateSceneControllersForWindowScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", a2);
}

- (void)_invalidateAllSceneControllers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedWindowScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SBSystemUISceneController _invalidateSceneControllersForWindowScene:](self, "_invalidateSceneControllersForWindowScene:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_newAppSceneRequestOptionsForWindowScene:(id)a3 withBlueprintOptions:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CEA948];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v10 = -[SBSystemUISceneController __newSceneIdentifierForWindowScene:](self, "__newSceneIdentifierForWindowScene:", v8);

  objc_msgSend(v9, "setIdentifier:", v10);
  objc_msgSend(v6, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "setSpecification:", v11);
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CEA348]);
    objc_msgSend(v9, "setSpecification:", v12);

  }
  objc_msgSend(v6, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActions:", v13);

  objc_msgSend(v6, "initialClientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInitialClientSettings:", v14);

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "scenePlacementConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScenePlacementConfiguration:", v15);

  }
  return v9;
}

- (id)__newSceneIdentifierForWindowScene:(id)a3
{
  SBFSceneWorkspaceController *sceneWorkspaceController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_sceneIDGeneration;
  sceneWorkspaceController = self->_sceneWorkspaceController;
  v5 = a3;
  -[SBFSceneWorkspaceController sceneWorkspaceIdentifier](sceneWorkspaceController, "sceneWorkspaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "_fbsDisplayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SUIS-%@:[%@] - %lu"), v8, v11, self->_sceneIDGeneration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_newSceneControllerForWindowScene:(id)a3 withSceneRequestOptions:(id)a4
{
  return -[SBSystemUISceneController _newSceneControllerForWindowScene:sceneRequestOptions:traitsRole:level:](self, "_newSceneControllerForWindowScene:sceneRequestOptions:traitsRole:level:", a3, a4, self->_traitsRole, self->_level);
}

- (id)__sceneFutureIdentifierForWindowScene:(id)a3 level:(double)a4
{
  SBFSceneWorkspaceController *sceneWorkspaceController;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  sceneWorkspaceController = self->_sceneWorkspaceController;
  v6 = a3;
  -[SBFSceneWorkspaceController sceneWorkspaceIdentifier](sceneWorkspaceController, "sceneWorkspaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "_fbsDisplayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SUIS-Future-%@:[%@][%f]"), v9, v12, *(_QWORD *)&a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_continuityPresenterForDisplayIdentity:(id)a3 level:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SBSystemUISceneDefaultPresenter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMapTable objectForKey:](self->_continuityPresentersByLevelForDisplayIdentity, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowSceneForDisplayIdentity:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_FBSScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workspaceService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_fbsDisplayConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemUISceneController __sceneFutureIdentifierForWindowScene:level:](self, "__sceneFutureIdentifierForWindowScene:level:", v12, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke;
    v52[3] = &unk_1E8EC06C0;
    v27 = v16;
    v53 = v27;
    v28 = v15;
    v54 = v28;
    v55 = v19;
    v56 = v21;
    v57 = v23;
    v58 = v25;
    v59 = a4;
    v49 = v14;
    objc_msgSend(v14, "createScene:", v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v45 = v28;
      v48 = v13;
      SBLogSystemUIScene();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v29, "identifier");
        v31 = v27;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v32;
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "Scene future %{public}@ created", buf, 0xCu);

        v27 = v31;
      }

      v50[0] = v26;
      v50[1] = 3221225472;
      v50[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_82;
      v50[3] = &unk_1E8EA2B20;
      v47 = v27;
      v33 = v27;
      v51 = v33;
      objc_msgSend(v29, "activateWithCompletion:", v50);
      -[NSMapTable objectForKey:](self->_continuityFuturesByLevelForDisplayIdentity, "objectForKey:", v6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_continuityFuturesByLevelForDisplayIdentity, "setObject:forKey:", v34, v6);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4, v45);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v29, v35);

      objc_msgSend(v29, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_opt_class();
      v38 = v36;
      if (v37)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v38;
        else
          v39 = 0;
      }
      else
      {
        v39 = 0;
      }
      v41 = v39;

      if (v41)
      {
        v10 = -[SBSystemUISceneDefaultPresenter initWithWindowHostingPresentationOnWindowScene:]([SBSystemUISceneDefaultPresenter alloc], "initWithWindowHostingPresentationOnWindowScene:", v41);
        -[NSMapTable objectForKey:](self->_continuityPresentersByLevelForDisplayIdentity, "objectForKey:", v6);
        v42 = objc_claimAutoreleasedReturnValue();
        if (!v42)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v42 = objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_continuityPresentersByLevelForDisplayIdentity, "setObject:forKey:", v42, v6);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v42, "setObject:forKey:", v10, v43);

      }
      else
      {
        SBLogSystemUIScene();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[SBSystemUISceneController _continuityPresenterForDisplayIdentity:level:].cold.1((uint64_t)v33, v42);
        v10 = 0;
      }
      v40 = v49;

      v27 = v47;
      v13 = v48;
      v28 = v46;
    }
    else
    {
      v10 = 0;
      v40 = v49;
    }

  }
  return v10;
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSpecification:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_2;
  v7[3] = &unk_1E8EC0698;
  v8 = *(id *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v4, "configureParameters:", v7);

}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  __int128 v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_3;
  v8[3] = &unk_1E8EC0670;
  v9 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v6 = a2;
  objc_msgSend(v6, "updateSettingsWithBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_4;
  v7[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v7[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v6, "updateClientSettingsWithBlock:", v7);

}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setForeground:", 1);
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

uint64_t __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredLevel:", *(double *)(a1 + 32));
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_82(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogSystemUIScene();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Scene future %{public}@ creation complete %u error %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

}

- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  NSMapTable *sceneControllersByDisplayIdentity;
  void *v38;
  void *v39;
  unint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void (**v48)(id, _QWORD, void *);
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSMutableArray *obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;
  const __CFString *v73;
  _BYTE v74[128];
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(id, _QWORD, void *))a6;
  BSDispatchQueueAssertMain();
  if (v10)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

LABEL_3:
  if (!self->_sceneVendingPolicy)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = SBSystemUISceneControllerErrorDomain;
    v75 = *MEMORY[0x1E0CB2D50];
    v76[0] = CFSTR("The controller policy doesn't allow to handle this request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 2, v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2](v11, 0, v12);
    goto LABEL_44;
  }
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v10;
  if (!v12)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (self->_sceneVendingPolicy == 1)
    {
      v29 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v27, "activeDisplayWindowScene");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithObject:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v27, "connectedWindowScenes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!objc_msgSend(v31, "count"))
      goto LABEL_42;
    v56 = v28;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v55 = v31;
    obja = v31;
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (!v32)
    {
      v48 = v11;
      goto LABEL_41;
    }
    v33 = v32;
    v34 = *(_QWORD *)v62;
    v57 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v62 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
        objc_msgSend(v36, "_fbsDisplayIdentity");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](sceneControllersByDisplayIdentity, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        if (v40 > 4)
        {
          if (!v11)
            goto LABEL_34;
          v44 = (void *)MEMORY[0x1E0CB35C8];
          v45 = SBSystemUISceneControllerErrorDomain;
          v69 = v57;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reached maximum allowed number of scenes per display (%d)"), 5);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 5, v47);
          v41 = (id)objc_claimAutoreleasedReturnValue();

          v10 = v58;
          v11[2](v11, 0, v41);
          v42 = v11;
        }
        else
        {
          v41 = -[SBSystemUISceneController _newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:](self, "_newAppSceneRequestOptionsForWindowScene:withBlueprintOptions:", v36, v10);
          v42 = -[SBSystemUISceneController _newSceneControllerForWindowScene:withSceneRequestOptions:](self, "_newSceneControllerForWindowScene:withSceneRequestOptions:", v36, v41);
          objc_msgSend(v42, "setSceneActive:", 1);
          if (v11)
          {
            objc_msgSend(v42, "scene");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *, void *))v11)[2](v11, v43, 0);

          }
        }

LABEL_34:
        v11 = 0;
      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      v11 = 0;
      v48 = 0;
      if (!v33)
      {
LABEL_41:

        v11 = v48;
        v28 = v56;
        v12 = 0;
        v31 = v55;
LABEL_42:

        goto LABEL_43;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_39;
  objc_msgSend(v10, "scenePlacementConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
    goto LABEL_39;
  v15 = v12;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = self->_sceneControllers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (!v16)
  {
LABEL_17:

    v10 = v58;
    v12 = v15;
LABEL_39:
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v51 = SBSystemUISceneControllerErrorDomain;
    v72 = *MEMORY[0x1E0CB2D50];
    v73 = CFSTR("Tried to re-activate an unknown scene session");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, 3, v52);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2](v11, 0, v28);
    v11 = 0;
    goto LABEL_43;
  }
  v17 = v16;
  v18 = *(_QWORD *)v66;
LABEL_9:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v66 != v18)
      objc_enumerationMutation(obj);
    v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
    objc_msgSend(v20, "scenePersistentIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", v15);

    if (!v22)
      goto LABEL_15;
    objc_msgSend(v20, "sceneOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      break;

LABEL_15:
    if (v17 == ++v19)
    {
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v17)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  v10 = v58;
  objc_msgSend(v58, "scenePlacementConfiguration");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setScenePlacementConfiguration:", v49);

  objc_msgSend(v20, "scene");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (!v28)
    goto LABEL_39;
  ((void (**)(id, void *, void *))v11)[2](v11, v28, 0);
  -[SBSystemUISceneController _setNeedsPresentersEvaluation](self, "_setNeedsPresentersEvaluation");
LABEL_43:

LABEL_44:
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  FBProcess *clientProcess;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  FBProcess *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  FBProcess *v51;
  SBSystemUISceneController *v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentIdentifiers"));

  }
  v50 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

  }
  -[NSMapTable keyEnumerator](self->_sceneControllersByDisplayIdentity, "keyEnumerator");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_sceneControllers, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "pid");

  clientProcess = self->_clientProcess;
  if (clientProcess)
  {
    v51 = clientProcess;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "processForPID:", v15);
    v51 = (FBProcess *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "nextObject");
  v19 = objc_claimAutoreleasedReturnValue();
  v53 = v9;
  if (v19)
  {
    v20 = (void *)v19;
    v52 = self;
    do
    {
      -[NSMapTable objectForKey:](self->_sceneControllersByDisplayIdentity, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __95__SBSystemUISceneController_destroyScenesWithPersistentIdentifiers_processIdentity_completion___block_invoke;
      v63[3] = &unk_1E8EC0648;
      v64 = v9;
      objc_msgSend(v21, "bs_filter:", v63);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v60 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              objc_msgSend(v28, "scenePersistentIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v29);
              objc_msgSend(v28, "invalidate");

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          }
          while (v25);
        }

        self = v52;
        -[NSMutableArray removeObjectsInArray:](v52->_sceneControllers, "removeObjectsInArray:", v23);
        objc_msgSend(v21, "removeObjectsInArray:", v23);
        v30 = (void *)-[NSMutableArray copy](v52->_sceneControllers, "copy");
        -[SBSystemUISceneController _activeSceneControllersAfterRemoving:](v52, "_activeSceneControllersAfterRemoving:", v30);

        v9 = v53;
      }

      objc_msgSend(v54, "nextObject");
      v31 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v31;
    }
    while (v31);
  }
  v32 = v51;
  if (objc_msgSend(v18, "count"))
  {
    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v18, "count"));
      v33 = objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v34 = v18;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v56 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
            v40 = objc_alloc(MEMORY[0x1E0CEA4F8]);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v40, "initWithPersistedIdentifiers:preferredAnimationType:callbackQueue:completion:", v41, 1, 0, 0);
            -[NSObject addObject:](v33, "addObject:", v42);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        }
        while (v36);
      }

      v32 = v51;
      -[FBProcess workspace](v51, "workspace");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "sendActions:", v33);

      v9 = v53;
    }
    else
    {
      SBLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[SBSystemUISceneController destroyScenesWithPersistentIdentifiers:processIdentity:completion:].cold.1((uint64_t)self, v33);
    }

  }
  if (v50)
  {
    v44 = objc_msgSend(v18, "count");
    if (v44 == objc_msgSend(v9, "count"))
    {
      v50[2](v50, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeObjectsInArray:", v18);
      v65[0] = *MEMORY[0x1E0CB2D50];
      v65[1] = SBSystemUISceneControllerErrorInfoUnknownPersistentIdentifiersListKey;
      v66[0] = CFSTR("Unknown persistent identifiers");
      v66[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBSystemUISceneControllerErrorDomain, 4, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v50)[2](v50, 0, v47);

    }
  }

}

uint64_t __95__SBSystemUISceneController_destroyScenesWithPersistentIdentifiers_processIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "scenePersistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3
{
  id v5;
  SBSystemUISceneController *v6;
  SBSystemUISceneController *v7;
  void *v9;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

  }
  if (-[RBSProcessIdentity isEqual:](self->_clientProcessIdentity, "isEqual:", v5))
    v6 = self;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)processDidExit:(id)a3
{
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self->_clientProcessIdentity);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUISceneController.m"), 633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[process identity] isEqual:_clientProcessIdentity]"));

  }
  if ((self->_sceneVendingPolicy | 2) == 3)
    BSDispatchMain();
}

uint64_t __44__SBSystemUISceneController_processDidExit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllSceneControllers");
}

uint64_t __58__SBSystemUISceneController_processManager_didAddProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateClientProcess:", *(_QWORD *)(a1 + 40));
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_clientProcessIdentity);

  if (v7)
  {
    objc_msgSend(v5, "removeObserver:", self);
    BSDispatchMain();
  }

}

uint64_t __61__SBSystemUISceneController_processManager_didRemoveProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateClientProcess:", 0);
}

- (void)_updateClientProcess:(id)a3
{
  FBProcess *clientProcess;
  void *v6;
  void *v7;
  RBSProcessHandle *v8;
  RBSProcessHandle *clientProcessHandle;
  id v10;

  v10 = a3;
  BSDispatchQueueAssertMain();
  objc_storeStrong((id *)&self->_clientProcess, a3);
  clientProcess = self->_clientProcess;
  if (clientProcess)
  {
    v6 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", -[FBProcess pid](clientProcess, "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleForIdentifier:error:", v7, 0);
    v8 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
    clientProcessHandle = self->_clientProcessHandle;
    self->_clientProcessHandle = v8;

  }
  else
  {
    v7 = self->_clientProcessHandle;
    self->_clientProcessHandle = 0;
  }

  -[SBSystemUISceneController _updateShouldHideForSecureMode](self, "_updateShouldHideForSecureMode");
}

- (void)_updateShouldHideForSecureMode
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  NSMapTable *sceneControllersByDisplayIdentity;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id obj;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[RBSProcessHandle sb_canDrawWhileLocked](self->_clientProcessHandle, "sb_canDrawWhileLocked");
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedWindowScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    v26 = !v3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v10, "secureDisplayStateProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend((id)SBApp, "authenticationController");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        v15 = objc_msgSend(v14, "isInSecureDisplayMode");
        sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
        objc_msgSend(v10, "_fbsDisplayIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](sceneControllersByDisplayIdentity, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v20)
        {
          v21 = v20;
          v22 = v15 & v26;
          v23 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v28 != v23)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setHidden:", v22);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v21);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[SBSystemUISceneController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSystemUISceneController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_jobLabel, CFSTR("Job Label"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemUISceneController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SBSystemUISceneController *v10;

  -[SBSystemUISceneController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_traitsRole, CFSTR("Traits Role"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SBSystemUISceneController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v8);
  v6 = v5;

  return v6;
}

void __67__SBSystemUISceneController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("Client Process Identity"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("Scene Workspace Controller"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDictionarySection:withName:skipIfEmpty:", v5, CFSTR("Scene controllers by window scene"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_presenterArray");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("Presenters"), 0);

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
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (RBSProcessIdentity)clientProcessIdentity
{
  return self->_clientProcessIdentity;
}

- (int64_t)sceneVendingPolicy
{
  return self->_sceneVendingPolicy;
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (double)level
{
  return self->_level;
}

- (SBFSceneWorkspaceDefaultDelegate)sceneWorkspaceControllerDelegate
{
  return self->_sceneWorkspaceControllerDelegate;
}

- (void)setSceneWorkspaceControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sceneWorkspaceControllerDelegate, a3);
}

- (SBFSceneWorkspaceController)sceneWorkspaceController
{
  return self->_sceneWorkspaceController;
}

- (SBSystemUISceneDefaultPresenter)defaultPresenter
{
  return self->_defaultPresenter;
}

- (void)setDefaultPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPresenter, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceControllerDelegate, 0);
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
  objc_storeStrong((id *)&self->_clientProcessIdentity, 0);
  objc_storeStrong((id *)&self->_continuityFuturesByLevelForDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_continuityPresentersByLevelForDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_sceneControllersByDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_clientProcessHandle, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
}

- (void)_continuityPresenterForDisplayIdentity:(uint64_t)a1 level:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Scene future %{public}@ with a non UIWindowScene delegate", (uint8_t *)&v2, 0xCu);
}

- (void)destroyScenesWithPersistentIdentifiers:(uint64_t)a1 processIdentity:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  v3 = 138543362;
  v4 = v2;
}

@end
