@implementation UISceneHostingView

void __41___UISceneHostingView_setPresentedScene___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setClippingDisabled:", 1);
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);

}

@end
