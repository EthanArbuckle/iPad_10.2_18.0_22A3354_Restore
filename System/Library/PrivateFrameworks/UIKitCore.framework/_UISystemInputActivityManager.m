@implementation _UISystemInputActivityManager

- (_UISystemInputActivityManager)initWithScene:(id)a3
{
  id v4;
  _UISystemInputActivityManager *v5;
  _UISystemInputActivityManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemInputActivityManager;
  v5 = -[_UISystemInputActivityManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (id)beginTrackingSystemInputActivity
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[_UISystemInputActivityManager _activeSystemInputInteraction](self, "_activeSystemInputInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0D01868]);
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __65___UISystemInputActivityManager_beginTrackingSystemInputActivity__block_invoke;
    v11 = &unk_1E16B7FF8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("SystemInputActivity"), CFSTR("Active System Input Interaction"), v5, &v8);

    -[_UISystemInputActivityManager set_activeSystemInputInteraction:](self, "set_activeSystemInputInteraction:", v3, v8, v9, v10, v11);
    -[_UISystemInputActivityManager _updateClientSettingsSystemInputActive:](self, "_updateClientSettingsSystemInputActive:", 1);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)windowHostingScene
{
  return objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_updateClientSettingsSystemInputActive:(BOOL)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[4];
  char v9;

  v3 = a3;
  -[_UISystemInputActivityManager windowHostingScene](self, "windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "_hasInvalidated") & 1) == 0)
    {
      objc_msgSend(v5, "_effectiveUIClientSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "systemInputActive");

      if (v7 != v3)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __72___UISystemInputActivityManager__updateClientSettingsSystemInputActive___block_invoke;
        v8[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        v9 = v3;
        objc_msgSend(v5, "_updateUIClientSettingsWithBlock:", v8);
      }
    }
  }

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (BSSimpleAssertion)_activeSystemInputInteraction
{
  return (BSSimpleAssertion *)objc_loadWeakRetained((id *)&self->__activeSystemInputInteraction);
}

- (void)set_activeSystemInputInteraction:(id)a3
{
  objc_storeWeak((id *)&self->__activeSystemInputInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__activeSystemInputInteraction);
  objc_destroyWeak((id *)&self->_scene);
}

@end
