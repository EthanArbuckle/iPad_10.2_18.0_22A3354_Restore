@implementation UIKeyboardLayerHostView

void __58___UIKeyboardLayerHostView_setCurrentPresentationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_setVisibilityPropagationEnabled:", objc_msgSend(v2, "_isVisibilityPropagationEnabled"));

}

void __81___UIKeyboardLayerHostView__initWithLayer_owningScene_keyboardMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setKeyboardScene:", v3);

}

void __102___UIKeyboardLayerHostView_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePairingState");

}

uint64_t __62___UIKeyboardLayerHostView_initWithKeyboardLayer_owningScene___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "identityToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", WeakRetained[62]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __47___UIKeyboardLayerHostView__updatePairingState__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPresentedLayerTypes:", objc_msgSend(v4, "presentedLayerTypes") | 2);
  objc_msgSend(*(id *)(a1 + 32), "currentPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setVisibilityPropagationEnabled:", objc_msgSend(v3, "_isVisibilityPropagationEnabled"));

  objc_msgSend(v4, "setInheritsSecurity:", objc_msgSend(*(id *)(a1 + 32), "inheritsSecurity"));
}

uint64_t __67___UIKeyboardLayerHostView_initWithKeyboardProxyLayer_owningScene___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "proxiedKeyboardOwner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", WeakRetained[62]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __48___UIKeyboardLayerHostView_setInheritsSecurity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInheritsSecurity:", *(unsigned __int8 *)(a1 + 32));
}

@end
