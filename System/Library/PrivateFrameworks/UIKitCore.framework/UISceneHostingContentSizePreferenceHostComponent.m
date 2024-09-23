@implementation UISceneHostingContentSizePreferenceHostComponent

void __127___UISceneHostingContentSizePreferenceHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  v3 = v2;
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v3, v5);

}

@end
