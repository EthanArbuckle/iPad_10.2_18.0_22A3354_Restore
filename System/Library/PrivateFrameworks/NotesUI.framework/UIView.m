@implementation UIView

uint64_t __65__UIView_ICDidMoveToWindowHandler__ic_addDidMoveToWindowHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__UIView_IC__ic_viewControllerManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "ic_window");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__UIView_IC__ic_imageRenderedFromLayer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

void __75__UIView_IC__ic_imageRenderedFromViewHierarchyAfterScreenUpdates_fallback___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bounds");
  if ((objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", *(unsigned __int8 *)(a1 + 48)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }

}

void __28__UIView_IC__ic_renderImage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

uint64_t __74__UIView_IC__ic_animateWithDuration_timingFunction_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__UIView_Utilities__ic_performWithoutAnimationOnMainThread___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__UIView_Utilities__ic_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
