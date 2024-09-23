@implementation _UIBacklightUISceneEnvironmentDiffAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbsSceneEnvironmentDiffAction, 0);
}

- (_UIBacklightUISceneEnvironmentDiffAction)init
{
  _UIBacklightUISceneEnvironmentDiffAction *v2;
  NSObject *v3;
  BLSBacklightFBSSceneEnvironmentDiffAction *v4;
  BLSBacklightFBSSceneEnvironmentDiffAction *fbsSceneEnvironmentDiffAction;
  objc_super v7;
  uint8_t buf[4];
  _UIBacklightUISceneEnvironmentDiffAction *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIBacklightUISceneEnvironmentDiffAction;
  v2 = -[_UIBacklightUISceneEnvironmentDiffAction init](&v7, sel_init);
  if (v2)
  {
    bls_scenes_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "create BLSBacklightUISceneEnvironmentDiffAction:%@", buf, 0xCu);
    }

    v4 = (BLSBacklightFBSSceneEnvironmentDiffAction *)objc_alloc_init(MEMORY[0x1E0D00F80]);
    fbsSceneEnvironmentDiffAction = v2->_fbsSceneEnvironmentDiffAction;
    v2->_fbsSceneEnvironmentDiffAction = v4;

    -[BLSBacklightFBSSceneEnvironmentDiffAction setDelegate:](v2->_fbsSceneEnvironmentDiffAction, "setDelegate:", v2);
  }
  return v2;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  -[BLSBacklightFBSSceneEnvironmentDiffAction performActionsForUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:](self->_fbsSceneEnvironmentDiffAction, "performActionsForUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:", a4, a5, a6, a7);
}

- (void)performChangesWithTransitionContext:(id)a3 environmentDelta:(id)a4 performActionsBlock:(id)a5
{
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v6 = (char)a4;
  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __117___UIBacklightUISceneEnvironmentDiffAction_performChangesWithTransitionContext_environmentDelta_performActionsBlock___block_invoke;
  v11[3] = &unk_1E16DFE40;
  v12 = v7;
  v13 = v8;
  v14 = v6;
  v9 = v7;
  v10 = v8;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v9, v11, 0);

}

@end
