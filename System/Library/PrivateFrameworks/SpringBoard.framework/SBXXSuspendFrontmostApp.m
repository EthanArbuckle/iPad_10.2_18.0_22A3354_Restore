@implementation SBXXSuspendFrontmostApp

void ___SBXXSuspendFrontmostApp_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "layoutStatePrimaryElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "workspaceEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationSceneEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    SBWorkspaceSuspendApplicationScene(v5);
    v4 = v5;
  }

}

@end
