@implementation UIPreviewInteractionClassicImpl

void __48___UIPreviewInteractionClassicImpl_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  double v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = 0.0;
    if (((_WORD)WeakRetained[2] & 8) != 0)
    {
      v6 = objc_loadWeakRetained(WeakRetained + 14);
      objc_msgSend(v4, "previewInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "_previewInteractionShouldAutomaticallyTransitionToPreviewAfterDelay:", v7);

      v5 = 0.0;
      if (v8)
        v5 = 3.5;
    }
    objc_msgSend(v9, "setAutomaticTouchForce:", v5);
  }

}

void __63___UIPreviewInteractionClassicImpl__prepareHighlighterIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[11];
    v4[11] = 0;

    objc_msgSend(v4, "_endInteractionIfNeeded");
    WeakRetained = v4;
  }

}

void __82___UIPreviewInteractionClassicImpl__prepareForViewControllerPresentationObserving__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[11])
  {
    objc_msgSend(v8, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[12], "viewControllerPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "_applyHighlightEffectsToViewControllerDuringCancellation:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "cancelInteraction");
    }

  }
}

@end
