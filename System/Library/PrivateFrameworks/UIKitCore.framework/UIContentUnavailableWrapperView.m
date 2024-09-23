@implementation UIContentUnavailableWrapperView

uint64_t __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_defaultContentScrollViewForEdge:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    if (v8)
      goto LABEL_7;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "_temporaryCoordinatingReplacement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 48);

  if (v10 == v11)
    objc_msgSend(v8, "_setTemporaryCoordinatingReplacement:", 0);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v12, "removeObjectForKey:", v13);

    goto LABEL_11;
  }
  objc_msgSend(v12, "setObject:forKey:", v9, v13);

LABEL_7:
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(a2, "setKeyboardDismissMode:", objc_msgSend(v9, "keyboardDismissMode"));
    objc_msgSend(a2, "setAlwaysBounceVertical:", objc_msgSend(v9, "alwaysBounceVertical"));
  }
  objc_msgSend(v9, "_setTemporaryCoordinatingReplacement:", a2);
  v14 = 1;
LABEL_12:

  return v14;
}

void __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != a2)
  {
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", v5);

    objc_msgSend(a2, "addGestureRecognizer:", v5);
  }

}

uint64_t __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_replaceContentViewWithViewForConfiguration:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
}

void __103___UIContentUnavailableWrapperView__updateBackgroundViewHandlersForPreviousContentView_newContentView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBackgroundView");

}

uint64_t __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", *(_QWORD *)(a1 + 32), 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  id *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (!a3)
  {
    objc_msgSend(a1[5], "removeFromSuperview");
    goto LABEL_5;
  }
  objc_msgSend(a1[4], "removeFromSuperview");
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 53, a1[5]);
LABEL_5:
    v5 = WeakRetained;
  }

}

@end
