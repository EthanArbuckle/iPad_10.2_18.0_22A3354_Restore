@implementation UISceneKeyboardProxyLayerForwardingPresentationScene

void __131___UISceneKeyboardProxyLayerForwardingPresentationScene_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateKeyboardLayersForScene:", a2);

}

@end
