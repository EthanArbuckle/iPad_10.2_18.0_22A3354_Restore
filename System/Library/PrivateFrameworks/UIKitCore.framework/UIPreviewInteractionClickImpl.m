@implementation UIPreviewInteractionClickImpl

void __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresentationAssistant:", 0);
  -[_UIPreviewInteractionClickImpl _endInteractionDidComplete:wasCancelledByClient:]((uint64_t)WeakRetained, 1u, 0);

}

uint64_t __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_3;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endInteractionEffectIfNeeded");
}

void __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  double v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v6, "ended") & 1) == 0)
  {
    objc_msgSend(v6, "progress");
    -[_UIPreviewInteractionClickImpl _delegateUpdatePreviewTransitionWithProgress:ended:](WeakRetained, 0, v4);
    objc_msgSend(WeakRetained, "interactionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interaction:didChangeWithContext:", WeakRetained, v6);

  }
}

void __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  double v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v5, "ended") & 1) == 0)
  {
    objc_msgSend(v5, "progress");
    -[_UIPreviewInteractionClickImpl _delegateUpdateCommitTransitionWithProgress:ended:](WeakRetained, 0, v4);
  }

}

uint64_t __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (a2)
  {
    v2 = result;
    v3 = (void *)UIApp;
    v4 = objc_msgSend(*(id *)(result + 40), "type");
    objc_msgSend(*(id *)(v2 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_eventRoutingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cancelAllEventsOfType:onEventRoutingScene:", v4, v7);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke_2;
    v8[3] = &unk_1E16B1B28;
    v8[4] = *(_QWORD *)(v2 + 32);
    return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  }
  return result;
}

uint64_t __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endInteractionEffectIfNeeded");
}

@end
