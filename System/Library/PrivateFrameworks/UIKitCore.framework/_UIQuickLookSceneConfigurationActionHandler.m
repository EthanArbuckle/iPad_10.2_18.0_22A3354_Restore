@implementation _UIQuickLookSceneConfigurationActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  return a3;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
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
  void *v18;
  _UISceneConnectionOptionsContext *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  objc_msgSend(v11, "scene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v13;
  if (!v14)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__96;
    v26 = __Block_byref_object_dispose__96;
    v27 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __118___UIQuickLookSceneConfigurationActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke;
    v21[3] = &unk_1E16C7DC8;
    v21[4] = &v22;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);
    v16 = (void *)v23[5];
    v15 = v13;
    if (v16)
    {
      objc_msgSend(v16, "loadSceneConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      if (v17)
      {
        objc_msgSend(v11, "_updateConfiguration:", v17);
        v18 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v18, "removeObject:", v23[5]);
        v15 = (void *)objc_msgSend(v18, "copy");

      }
    }
    _Block_object_dispose(&v22, 8);

  }
  v19 = objc_alloc_init(_UISceneConnectionOptionsContext);
  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v19, "setUnprocessedActions:", v15);

  return v19;
}

@end
