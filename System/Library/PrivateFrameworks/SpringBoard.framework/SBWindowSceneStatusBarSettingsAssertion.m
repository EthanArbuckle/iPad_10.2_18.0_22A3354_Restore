@implementation SBWindowSceneStatusBarSettingsAssertion

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowSceneStatusBarSettingsAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBWindowSceneStatusBarSettingsAssertion *v11;

  v4 = a3;
  -[SBWindowSceneStatusBarSettingsAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SBWindowSceneStatusBarSettingsAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

id __81__SBWindowSceneStatusBarSettingsAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("settings"));
  v3 = *(void **)(a1 + 32);
  SBWindowSceneStatusBarSettingsLevelDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("level"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("reason"));
}

- (NSString)description
{
  return (NSString *)-[SBWindowSceneStatusBarSettingsAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)acquireWithAnimationParameters:(id)a3
{
  SBWindowSceneStatusBarAssertionManager **p_assertionManager;
  id v5;
  id WeakRetained;

  p_assertionManager = &self->_assertionManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_assertionManager);
  objc_msgSend(WeakRetained, "_addStatusBarSettingsAssertion:withAnimationParameters:", self, v5);

}

- (void)modifySettingsWithBlock:(id)a3 animationParameters:(id)a4
{
  SBStatusBarSettings *settings;
  id v7;
  void (**v8)(id, id);
  SBStatusBarSettings *v9;
  SBStatusBarSettings *v10;
  id WeakRetained;
  id v12;

  if (a3)
  {
    settings = self->_settings;
    v7 = a4;
    v8 = (void (**)(id, id))a3;
    v12 = (id)-[SBStatusBarSettings mutableCopy](settings, "mutableCopy");
    v8[2](v8, v12);

    v9 = (SBStatusBarSettings *)objc_msgSend(v12, "copy");
    v10 = self->_settings;
    self->_settings = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->_assertionManager);
    objc_msgSend(WeakRetained, "_modifiedStatusBarSettingsAssertion:withAnimationParameters:", self, v7);

  }
}

- (SBStatusBarSettings)settings
{
  return self->_settings;
}

- (unint64_t)level
{
  return self->_level;
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 statusBarHidden:(BOOL)a4 atLevel:(unint64_t)a5 reason:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  SBMutableStatusBarSettings *v12;
  double v13;
  void *v14;
  id v15;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = objc_alloc_init(SBMutableStatusBarSettings);
  v13 = 1.0;
  if (v7)
    v13 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setAlpha:](v12, "setAlpha:", v14);

  v15 = -[SBWindowSceneStatusBarSettingsAssertion _initWithWindowSceneStatusBarAssertionManager:settings:atLevel:reason:](self, "_initWithWindowSceneStatusBarAssertionManager:settings:atLevel:reason:", v11, v12, a5, v10);
  return v15;
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 settings:(id)a4 atLevel:(unint64_t)a5 reason:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBWindowSceneStatusBarSettingsAssertion *v14;
  uint64_t v15;
  SBStatusBarSettings *settings;
  uint64_t v17;
  NSString *reason;
  uint64_t v19;
  NSDate *timestamp;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBWindowSceneStatusBarSettingsAssertion;
  v14 = -[SBWindowSceneStatusBarSettingsAssertion init](&v25, sel_init);
  if (v14)
  {
    if (a5 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBWindowSceneStatusBarSettingsAssertion.m"), 36, CFSTR("invalid status bar settings level"));

      if (v12)
      {
LABEL_4:
        if (v13)
        {
LABEL_5:
          v15 = objc_msgSend(v12, "copy");
          settings = v14->_settings;
          v14->_settings = (SBStatusBarSettings *)v15;

          v14->_level = a5;
          v17 = objc_msgSend(v13, "copy");
          reason = v14->_reason;
          v14->_reason = (NSString *)v17;

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v19 = objc_claimAutoreleasedReturnValue();
          timestamp = v14->_timestamp;
          v14->_timestamp = (NSDate *)v19;

          objc_storeWeak((id *)&v14->_assertionManager, v11);
          goto LABEL_6;
        }
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBWindowSceneStatusBarSettingsAssertion.m"), 38, CFSTR("invalid reason"));

        goto LABEL_5;
      }
    }
    else if (v12)
    {
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBWindowSceneStatusBarSettingsAssertion.m"), 37, CFSTR("invalid status bar settings"));

    if (v13)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:

  return v14;
}

- (void)acquire
{
  -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](self, "acquireWithAnimationParameters:", 0);
}

- (SBWindowSceneStatusBarSettingsAssertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarSettingsAssertion.m"), 30, CFSTR("use initWithSettings:..."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBWindowSceneStatusBarSettingsAssertion;
  -[SBWindowSceneStatusBarSettingsAssertion dealloc](&v3, sel_dealloc);
}

- (void)modifySettingsWithBlock:(id)a3
{
  -[SBWindowSceneStatusBarSettingsAssertion modifySettingsWithBlock:animationParameters:](self, "modifySettingsWithBlock:animationParameters:", a3, 0);
}

- (void)invalidate
{
  -[SBWindowSceneStatusBarSettingsAssertion invalidateWithAnimationParameters:](self, "invalidateWithAnimationParameters:", 0);
}

- (void)invalidateWithAnimationParameters:(id)a3
{
  SBWindowSceneStatusBarAssertionManager **p_assertionManager;
  id v5;
  id WeakRetained;

  p_assertionManager = &self->_assertionManager;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_assertionManager);
  objc_msgSend(WeakRetained, "_removeStatusBarSettingsAssertion:withAnimationParameters:", self, v5);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarSettingsAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (SBWindowSceneStatusBarAssertionManager)assertionManager
{
  return (SBWindowSceneStatusBarAssertionManager *)objc_loadWeakRetained((id *)&self->_assertionManager);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_destroyWeak((id *)&self->_assertionManager);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
