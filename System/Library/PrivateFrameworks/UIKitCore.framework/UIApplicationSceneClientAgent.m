@implementation UIApplicationSceneClientAgent

void __66__UIApplicationSceneClientAgent_scene_handleEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "message");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

uint64_t __73__UIApplicationSceneClientAgent_scene_didInitializeWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)scene:(id)a3 didInitializeWithEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)UIApp, "_workspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__UIApplicationSceneClientAgent_scene_didInitializeWithEvent_completion___block_invoke;
    v18[3] = &unk_1E16C8428;
    v19 = v10;
    objc_msgSend(v15, "workspace:didCreateScene:withTransitionContext:completion:", v11, v13, v16, v18);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIApplicationSceneClientAgent;
    -[FBSBasicSceneClientAgent scene:didInitializeWithEvent:completion:](&v17, sel_scene_didInitializeWithEvent_completion_, v8, v9, v10);
  }

}

- (void)scene:(id)a3 handleEvent:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)UIApp, "_workspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_9;
  objc_msgSend(v9, "settingsDiff");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_5:
    objc_msgSend(v9, "settingsDiff");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__UIApplicationSceneClientAgent_scene_handleEvent_withCompletion___block_invoke;
    v23[3] = &unk_1E16C8478;
    v24 = v10;
    objc_msgSend(v14, "scene:didUpdateWithDiff:transitionContext:completion:", v13, v17, v18, v23);

    goto LABEL_10;
  }
  objc_msgSend(v9, "transitionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_5;
  objc_msgSend(v9, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
LABEL_9:
    v22.receiver = self;
    v22.super_class = (Class)UIApplicationSceneClientAgent;
    -[FBSBasicSceneClientAgent scene:handleEvent:withCompletion:](&v22, sel_scene_handleEvent_withCompletion_, v8, v9, v10);
    goto LABEL_10;
  }
  objc_msgSend(v9, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scene:didReceiveActions:", v13, v21);

  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_10:

}

- (UIApplicationSceneClientAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIApplicationSceneClientAgent;
  return -[UIApplicationSceneClientAgent init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIApplicationSceneClientAgent;
  -[UIApplicationSceneClientAgent dealloc](&v2, sel_dealloc);
}

- (void)scene:(id)a3 willInvalidateWithEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)UIApp, "_workspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__UIApplicationSceneClientAgent_scene_willInvalidateWithEvent_completion___block_invoke;
    v18[3] = &unk_1E16C8450;
    v19 = v10;
    objc_msgSend(v15, "workspace:willDestroyScene:withTransitionContext:completion:", v11, v13, v16, v18);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIApplicationSceneClientAgent;
    -[FBSBasicSceneClientAgent scene:willInvalidateWithEvent:completion:](&v17, sel_scene_willInvalidateWithEvent_completion_, v8, v9, v10);
  }

}

uint64_t __74__UIApplicationSceneClientAgent_scene_willInvalidateWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
