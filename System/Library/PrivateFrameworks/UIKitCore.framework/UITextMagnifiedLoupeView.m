@implementation UITextMagnifiedLoupeView

void __46___UITextMagnifiedLoupeView_setModelPosition___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_8;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_8)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_8);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Expected _transitionGroupCompletion to be nil. This could cause adverse behavior when closing the magnifier loupe.", v2, 2u);
  }
}

void __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[426] = 1;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "layoutSubviews");
    WeakRetained = v2;
  }

}

void __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[427] = 1;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "layoutSubviews");
    WeakRetained = v2;
  }

}

uint64_t __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 1;
    objc_msgSend(*(id *)(a1 + 40), "increment");
    objc_msgSend(WeakRetained, "_resetAnimationState");
    objc_msgSend(WeakRetained, "layoutSubviews");
    objc_msgSend(WeakRetained, "modelPosition");
    objc_msgSend(WeakRetained, "_updatePortalViewTransformForPosition:zoomScale:");
  }

}

uint64_t __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048635, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __56___UITextMagnifiedLoupeView__configuredGroupCompletion___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    WeakRetained[424] = 0;
  v6 = WeakRetained;
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v3, "setHidden:", 1);
  objc_msgSend(v4, "setHiddenForLoupeAnimation:", 0);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);

}

@end
