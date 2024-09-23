@implementation UIEditMenuContentPresentation

void __54___UIEditMenuContentPresentation__displayMenu_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_editMenuPresentation:titleViewForMenu:configuration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_displayPreparedMenu:titleView:reason:didDismissMenu:configuration:", v4, v6, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

uint64_t __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionWithEvent:", 1);
}

void __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "presentAnimator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runAnimations");

}

uint64_t __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "presentAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runAnimations");

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "dismissAnimator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runAnimations");

}

void __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "dismissAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runAnimations");

}

uint64_t __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "transitionWithEvent:", 3);
}

void __72___UIEditMenuContentPresentation_editMenuListView_didSelectMenuElement___block_invoke(id *a1)
{
  char v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = objc_msgSend(a1[4], "attributes");
  v3 = WeakRetained;
  if ((v2 & 8) == 0)
  {
    objc_msgSend(WeakRetained, "displayedMenu");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 != a1[5])
    {

LABEL_6:
      v3 = WeakRetained;
      goto LABEL_7;
    }
    v6 = objc_msgSend(WeakRetained, "currentState");

    v3 = WeakRetained;
    if (v6 == 3)
    {
      objc_msgSend(WeakRetained, "hideMenuWithReason:", 1);
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __75___UIEditMenuContentPresentation__reloadMenuLayoutWithSourceRect_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
  objc_msgSend(*(id *)(a1 + 40), "containerBounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  objc_msgSend(*(id *)(a1 + 40), "menuPosition");
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  objc_msgSend(*(id *)(a1 + 40), "anchorPoint");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnchorPoint:", v3, v5);

}

@end
