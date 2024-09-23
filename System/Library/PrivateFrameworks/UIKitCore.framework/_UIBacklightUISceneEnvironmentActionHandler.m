@implementation _UIBacklightUISceneEnvironmentActionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbsSceneEnvironmentDiffAction, 0);
}

- (_UIBacklightUISceneEnvironmentActionHandler)init
{
  _UIBacklightUISceneEnvironmentActionHandler *v2;
  NSObject *v3;
  BLSBacklightFBSSceneEnvironmentActionHandler *v4;
  BLSBacklightFBSSceneEnvironmentActionHandler *fbsSceneEnvironmentDiffAction;
  objc_super v7;
  uint8_t buf[4];
  _UIBacklightUISceneEnvironmentActionHandler *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIBacklightUISceneEnvironmentActionHandler;
  v2 = -[_UIBacklightUISceneEnvironmentActionHandler init](&v7, sel_init);
  if (v2)
  {
    bls_scenes_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "create BLSBacklightUISceneEnvironmentActionHandler:%@", buf, 0xCu);
    }

    v4 = (BLSBacklightFBSSceneEnvironmentActionHandler *)objc_alloc_init(MEMORY[0x1E0D00F78]);
    fbsSceneEnvironmentDiffAction = v2->_fbsSceneEnvironmentDiffAction;
    v2->_fbsSceneEnvironmentDiffAction = v4;

  }
  return v2;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  return (id)-[BLSBacklightFBSSceneEnvironmentActionHandler respondToActions:forFBSScene:fromTransitionContext:](self->_fbsSceneEnvironmentDiffAction, "respondToActions:forFBSScene:fromTransitionContext:", a3, a4, a6);
}

@end
