@implementation BLSBacklightFBSSceneEnvironment(UIKit)

- (id)_settingsDiffActionsForScene:()UIKit
{
  NSObject *v0;
  _UIBacklightUISceneEnvironmentDiffAction *v1;
  void *v2;
  uint8_t v4[16];
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  bls_scenes_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v0, OS_LOG_TYPE_DEBUG, "BLSBacklightFBSSceneEnvironment (BacklightUIServices) _settingsDiffActionsForScene", v4, 2u);
  }

  v1 = objc_alloc_init(_UIBacklightUISceneEnvironmentDiffAction);
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_actionRespondersForScene:()UIKit
{
  NSObject *v0;
  _UIBacklightUISceneEnvironmentActionHandler *v1;
  void *v2;
  uint8_t v4[16];
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  bls_scenes_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v0, OS_LOG_TYPE_DEBUG, "BLSBacklightFBSSceneEnvironment (BacklightUIServices) _actionRespondersForScene", v4, 2u);
  }

  v1 = objc_alloc_init(_UIBacklightUISceneEnvironmentActionHandler);
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_setScene:()UIKit
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "_FBSScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_FBSScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_FBSScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BLSBacklightFBSSceneEnvironment+UIKit.m"), 74, CFSTR("unexpectedly scene changed from %@ to %@"), v7, v8);

    }
  }
  objc_msgSend(a1, "_setFBSScene:", v8);

}

- (_UIBacklightNullEnvironment)initWithScene:()UIKit
{
  id v4;
  void *v5;
  _UIBacklightNullEnvironment *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  _UIBacklightNullEnvironment *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__BLSBacklightFBSSceneEnvironment_UIKit__initWithScene___block_invoke;
    v10[3] = &unk_1E16DFE18;
    v11 = v4;
    v12 = a1;
    v13 = v5;
    objc_msgSend(v13, "backlightSceneEnvironmentWithCreationBlock:", v10);
    v6 = (_UIBacklightNullEnvironment *)objc_claimAutoreleasedReturnValue();

    v7 = v11;
  }
  else
  {
    v6 = -[_UIBacklightNullEnvironment initWithScene:]([_UIBacklightNullEnvironment alloc], "initWithScene:", v4);
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_INFO, "created environment:%@ scene:%@ which has nil FBSScene - this environment will not non-functional", buf, 0x16u);

    }
  }

  return v6;
}

- (id)_scene
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
