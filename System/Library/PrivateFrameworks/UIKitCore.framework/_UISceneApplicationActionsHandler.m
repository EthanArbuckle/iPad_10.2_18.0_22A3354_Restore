@implementation _UISceneApplicationActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v12, "isUISubclass"))
    v13 = v12;
  else
    v13 = 0;
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "lifecycleWantsUnnecessaryDelayForSceneDelivery")
    && (objc_msgSend(v14, "activatedOnce") & 1) == 0)
  {
    v15 = (void *)UIApp;
    objc_msgSend((id)UIApp, "_workspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "workspace:didReceiveActions:", v16, v9);

  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99___UISceneApplicationActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
    v19[3] = &unk_1E16B47A8;
    v20 = v9;
    v21 = v10;
    v22 = v13;
    objc_msgSend(v11, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v19, 0x1E16F0C20);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
