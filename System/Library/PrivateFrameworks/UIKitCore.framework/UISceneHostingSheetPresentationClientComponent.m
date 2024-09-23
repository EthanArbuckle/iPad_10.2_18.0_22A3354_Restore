@implementation UISceneHostingSheetPresentationClientComponent

uint64_t __125___UISceneHostingSheetPresentationClientComponent_applySheetConfigurationToLocalPresentationControllerWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __108___UISceneHostingSheetPresentationClientComponent__sheetPresentationControllerClientConfigurationDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "setSheetClientConfiguration:", v4);
  +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v6);

}

@end
