@implementation UISceneHostingSheetPresentationHostComponent

void __123___UISceneHostingSheetPresentationHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setRemoteClientConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __72___UISceneHostingSheetPresentationHostComponent__setSheetConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "setSheetConfiguration:", *(_QWORD *)(a1 + 32));
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnimationSettings:", v5);

  }
  else
  {
    objc_msgSend(v10, "setAnimationSettings:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "hostScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sheetConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "_shouldFenceChangeToConfiguration:", *(_QWORD *)(a1 + 32)))
  {
    +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnimationFence:", v9);

  }
}

@end
