@implementation SBModalAlertPresenter

- (void)sceneManager:(id)a3 willUpdateScene:(id)a4 withSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  id v9;
  id v10;

  v10 = a4;
  v8 = a5;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[SBModalAlertPresenter scene](self, "scene");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:](self, "_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:", objc_msgSend(v8, "isForeground"), 0);
  }

}

- (FBScene)scene
{
  return self->_scene;
}

- (void)_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:(BOOL)a3 fromOrToTerminalState:(BOOL)a4
{
  _BOOL4 v4;
  SBModalAlertPresentationCoordinator *v7;
  SBModalAlertPresentationCoordinator *modalAlertPresentationCoordinator;
  _BOOL4 v9;
  SBModalAlertPresentationCoordinator *v10;
  void *v11;

  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_modalAlertPresentationCoordinator)
  {
    objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
    v7 = (SBModalAlertPresentationCoordinator *)objc_claimAutoreleasedReturnValue();
    modalAlertPresentationCoordinator = self->_modalAlertPresentationCoordinator;
    self->_modalAlertPresentationCoordinator = v7;

    if (!self->_modalAlertPresentationCoordinator)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalAlertPresenter.m"), 216, CFSTR("SBModalAlertPresenter was Unable to retrieve a presentation coordinator."));

    }
  }
  v9 = -[SBModalAlertPresenter isShowingModalAlert](self, "isShowingModalAlert");
  v10 = self->_modalAlertPresentationCoordinator;
  if (v9 && v4)
    -[SBModalAlertPresentationCoordinator _addModalAlertPresenterIfNecessary:](v10, "_addModalAlertPresenterIfNecessary:", self);
  else
    -[SBModalAlertPresentationCoordinator _removeModalAlertPresenter:](v10, "_removeModalAlertPresenter:", self);
}

- (BOOL)isShowingModalAlert
{
  return self->_visibleModalAlertCount || -[NSHashTable count](self->_visibleAlertAssertions, "count") != 0;
}

- (SBModalAlertPresenter)initWithScene:(id)a3
{
  id v5;
  void *v6;
  SBModalAlertPresenter *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalAlertPresenter.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBModalAlertPresenter _initWithModalAlertPresentationCoordinator:sceneManager:scene:](self, "_initWithModalAlertPresentationCoordinator:sceneManager:scene:", 0, v6, v5);

  return v7;
}

- (id)_initWithModalAlertPresentationCoordinator:(id)a3 sceneManager:(id)a4 scene:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBModalAlertPresenter *v13;
  uint64_t v14;
  NSHashTable *visibleAlertAssertions;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalAlertPresenter.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneManager"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBModalAlertPresenter;
  v13 = -[SBModalAlertPresenter init](&v18, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    visibleAlertAssertions = v13->_visibleAlertAssertions;
    v13->_visibleAlertAssertions = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_modalAlertPresentationCoordinator, a3);
    objc_storeStrong((id *)&v13->_sceneManager, a4);
    objc_storeStrong((id *)&v13->_scene, a5);
    if (v13->_scene)
      -[FBSceneManager addObserver:](v13->_sceneManager, "addObserver:", v13);
  }

  return v13;
}

- (id)initForSystemApplication
{
  void *v3;
  _BYTE *v4;

  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBModalAlertPresenter _initWithModalAlertPresentationCoordinator:sceneManager:scene:](self, "_initWithModalAlertPresentationCoordinator:sceneManager:scene:", 0, v3, 0);

  if (v4)
    v4[41] = 1;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSceneManager removeObserver:](self->_sceneManager, "removeObserver:", self);
  -[SBModalAlertPresentationCoordinator _removeModalAlertPresenter:](self->_modalAlertPresentationCoordinator, "_removeModalAlertPresenter:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBModalAlertPresenter;
  -[SBModalAlertPresenter dealloc](&v3, sel_dealloc);
}

- (BOOL)isForeground
{
  FBScene *scene;
  void *v3;
  char v4;

  if (self->_isSystemPresenter)
  {
    LOBYTE(scene) = 1;
  }
  else
  {
    scene = self->_scene;
    if (scene)
    {
      -[FBScene settings](scene, "settings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isForeground");

      LOBYTE(scene) = v4;
    }
  }
  return (char)scene;
}

- (void)setVisibleModalAlertCount:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_visibleModalAlertCount != a3)
  {
    self->_visibleModalAlertCount = a3;
    SBLogAlertItems();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identityToken](self->_scene, "identityToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Setting visible modal alert count for [%@] to %zu", (uint8_t *)&v8, 0x16u);

    }
    -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessary](self, "_addOrRemoveModalAlertPresenterIfNecessary");
  }
}

- (void)incrementVisibleModalAlertCount
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t visibleModalAlertCount;
  int v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  ++self->_visibleModalAlertCount;
  SBLogAlertItems();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identityToken](self->_scene, "identityToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    visibleModalAlertCount = self->_visibleModalAlertCount;
    v7 = 138412546;
    v8 = v5;
    v9 = 2048;
    v10 = visibleModalAlertCount;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Incremented visible modal alert count for [%@] to %zu", (uint8_t *)&v7, 0x16u);

  }
  -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessary](self, "_addOrRemoveModalAlertPresenterIfNecessary");
}

- (void)decrementVisibleModalAlertCount
{
  unint64_t visibleModalAlertCount;
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  visibleModalAlertCount = self->_visibleModalAlertCount;
  if (visibleModalAlertCount)
  {
    self->_visibleModalAlertCount = visibleModalAlertCount - 1;
    SBLogAlertItems();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identityToken](self->_scene, "identityToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_visibleModalAlertCount;
      v8 = 138412546;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Decremented visible modal alert count for [%@] to %zu", (uint8_t *)&v8, 0x16u);

    }
    -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessary](self, "_addOrRemoveModalAlertPresenterIfNecessary");
  }
}

- (id)acquireVisibleModalAlertAssertionWithDescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSUInteger v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  NSUInteger v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__SBModalAlertPresenter_acquireVisibleModalAlertAssertionWithDescription___block_invoke;
  v11[3] = &unk_1E8E9DCD8;
  v11[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("modalAlertPresenterContentAssertion"), v4, MEMORY[0x1E0C80D38], v11);

  SBLogAlertItems();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identifier](self->_scene, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSHashTable count](self->_visibleAlertAssertions, "count");
    *(_DWORD *)buf = 134218498;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    v16 = 2048;
    v17 = v9 + 1;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring visible modal alert assertion (%p) for presenter: %{public}@, count %zu", buf, 0x20u);

  }
  -[NSHashTable addObject:](self->_visibleAlertAssertions, "addObject:", v6);
  return v6;
}

void __74__SBModalAlertPresenter_acquireVisibleModalAlertAssertionWithDescription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogAlertItems();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
    v7 = 134218498;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6 - 1;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating visible modal alert assertion (%p) for presenter: %{public}@, count %zu", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveModalAlertPresenterIfNecessary");

}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[SBModalAlertPresentationCoordinator _removeModalAlertPresenter:](self->_modalAlertPresentationCoordinator, "_removeModalAlertPresenter:", self);
    -[FBSceneManager removeObserver:](self->_sceneManager, "removeObserver:", self);
  }
}

- (NSString)description
{
  return (NSString *)-[SBModalAlertPresenter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBModalAlertPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBModalAlertPresenter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  _QWORD v9[4];
  id v10;
  SBModalAlertPresenter *v11;

  -[SBModalAlertPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBModalAlertPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyProem:", v9);
  v7 = v5;

  return v7;
}

id __63__SBModalAlertPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("alertCount"));
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 41))
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("isSystemPresenter"));
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 24), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v6, CFSTR("sceneID"));

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "clientProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:withName:", v9, CFSTR("bundleID"));

  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("visibleAlertAssertions"));
}

- (void)_addOrRemoveModalAlertPresenterIfNecessary
{
  -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:](self, "_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:", -[SBModalAlertPresenter isForeground](self, "isForeground"), 0);
}

- (void)_setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (unint64_t)visibleModalAlertCount
{
  return self->_visibleModalAlertCount;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return self->_modalAlertPresentationCoordinator;
}

- (void)setModalAlertPresentationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, a3);
}

- (FBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAlertAssertions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, 0);
}

@end
