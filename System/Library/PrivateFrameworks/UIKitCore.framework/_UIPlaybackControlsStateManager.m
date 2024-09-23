@implementation _UIPlaybackControlsStateManager

- (_UIPlaybackControlsStateManager)initWithScene:(id)a3
{
  id v4;
  _UIPlaybackControlsStateManager *v5;
  _UIPlaybackControlsStateManager *v6;
  uint64_t v7;
  NSHashTable *fullscreenPlaybackAssertions;
  uint64_t v9;
  NSHashTable *controlsPresentedAssertions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIPlaybackControlsStateManager;
  v5 = -[_UIPlaybackControlsStateManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 261);
    v7 = objc_claimAutoreleasedReturnValue();
    fullscreenPlaybackAssertions = v6->_fullscreenPlaybackAssertions;
    v6->_fullscreenPlaybackAssertions = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 261);
    v9 = objc_claimAutoreleasedReturnValue();
    controlsPresentedAssertions = v6->_controlsPresentedAssertions;
    v6->_controlsPresentedAssertions = (NSHashTable *)v9;

  }
  return v6;
}

- (id)_beginFullscreenPlaybackSession
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPlaybackControlsState.m"), 53, CFSTR("Call must be made on main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __66___UIPlaybackControlsStateManager__beginFullscreenPlaybackSession__block_invoke;
    v15 = &unk_1E16B7FF8;
    objc_copyWeak(&v16, &location);
    v5 = _Block_copy(&v12);
    v6 = objc_alloc(MEMORY[0x1E0D01868]);
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("_UIPlaybackControlsState"), CFSTR("FullscreenPlayback"), v7, v5, v12, v13, v14, v15);

    if (self)
    {
      -[NSHashTable addObject:](self->_fullscreenPlaybackAssertions, "addObject:", v9);
      -[_UIPlaybackControlsStateManager _updateState]((id *)&self->super.isa);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_beginPresentingPlaybackControls
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPlaybackControlsState.m"), 73, CFSTR("Call must be made on main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __67___UIPlaybackControlsStateManager__beginPresentingPlaybackControls__block_invoke;
    v15 = &unk_1E16B7FF8;
    objc_copyWeak(&v16, &location);
    v5 = _Block_copy(&v12);
    v6 = objc_alloc(MEMORY[0x1E0D01868]);
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("_UIPlaybackControlsState"), CFSTR("ControlsPresented"), v7, v5, v12, v13, v14, v15);

    if (self)
    {
      -[NSHashTable addObject:](self->_controlsPresentedAssertions, "addObject:", v9);
      -[_UIPlaybackControlsStateManager _updateState]((id *)&self->super.isa);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_updateState
{
  uint64_t v2;
  id WeakRetained;
  _QWORD v4[5];

  v2 = objc_msgSend(a1[2], "count") != 0;
  if (((objc_msgSend(a1[3], "count") != 0) & v2) != 0)
    v2 = 2;
  WeakRetained = objc_loadWeakRetained(a1 + 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___UIPlaybackControlsStateManager__updateState__block_invoke;
  v4[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v4[4] = v2;
  objc_msgSend(WeakRetained, "_updateUIClientSettingsWithBlock:", v4);

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsPresentedAssertions, 0);
  objc_storeStrong((id *)&self->_fullscreenPlaybackAssertions, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
