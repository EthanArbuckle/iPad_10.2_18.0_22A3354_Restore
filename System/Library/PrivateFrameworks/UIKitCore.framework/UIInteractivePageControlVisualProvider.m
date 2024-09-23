@implementation UIInteractivePageControlVisualProvider

void __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke_2(uint64_t a1)
{
  -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
}

void __93___UIInteractivePageControlVisualProvider_animateTransitionIndicatorsFromPage_toPage_ripple___block_invoke(uint64_t a1)
{
  -[_UIInteractivePageControlVisualProvider _transitionIndicatorForPage:toEnabled:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_3(uint64_t result, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

void __72___UIInteractivePageControlVisualProvider__setDisplayedPage_completion___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v2 = (double)*(uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "continuousDisplayedPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:", v2);

  objc_msgSend(*(id *)(a1 + 32), "indicatorFeed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeIndicatorForPage:", *(_QWORD *)(a1 + 48));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "indicatorFeed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeIndicatorForPage:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(id **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 <= v8)
    v10 = 2 * (v9 < v8);
  else
    v10 = 1;
  if (v7)
    v11 = v10;
  else
    v11 = 0;
  objc_msgSend(v17, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v7, v9), v11);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(id **)(a1 + 32);
  if (v12 <= v13)
    v15 = 2 * (v12 < v13);
  else
    v15 = 1;
  if (v14)
    v16 = v15;
  else
    v16 = 0;
  objc_msgSend(v6, "setMode:direction:", -[_UIInteractivePageControlVisualProvider _indicatorModeForPage:](v14, v12), v16);

}

void __50___UIInteractivePageControlVisualProvider_prepare__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[_UIInteractivePageControlVisualProvider _updateReuseQueue]((uint64_t)WeakRetained);
    objc_msgSend(v2[1], "setNeedsLayout");
    WeakRetained = v2;
  }

}

uint64_t __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setContentTransform:", v3);
}

uint64_t __65___UIInteractivePageControlVisualProvider_setPreciseTouchedPage___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __68___UIInteractivePageControlVisualProvider_setPage_interactionState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentPage");
  if (result == *(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "interactionState");
    if (result == *(_QWORD *)(a1 + 48))
      return objc_msgSend(*(id *)(a1 + 32), "setInteractionState:", 0);
  }
  return result;
}

id *__56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "contentView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransform:", &v6);

  if (*(_BYTE *)(a1 + 88))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "scrubProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v3);

  return -[_UIInteractivePageControlVisualProvider _updateIndicatorMode](*(id **)(a1 + 32));
}

uint64_t __56___UIInteractivePageControlVisualProvider_setScrubbing___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048628, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __62___UIInteractivePageControlVisualProvider_setPlatterExpanded___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdatePageIndicatorTintColor");
}

@end
