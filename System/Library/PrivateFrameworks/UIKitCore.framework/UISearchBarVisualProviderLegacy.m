@implementation UISearchBarVisualProviderLegacy

uint64_t __56___UISearchBarVisualProviderLegacy_setEnabled_animated___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "numberOfSegments"))
  {
    v2 = 0;
    do
    {
      if (*(_BYTE *)(a1 + 40))
        v3 = 1.0;
      else
        v3 = 0.4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "infoViewForSegment:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", v3);

      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "numberOfSegments"));
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateMagnifyingGlassView");
}

uint64_t __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    result = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(result + 152))
      result = objc_msgSend((id)result, "setUpCancelButton");
    if (!*(_BYTE *)(v1 + 49))
      result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 152), "setAlpha:", 1.0);
  }
  if (*(_BYTE *)(v1 + 49))
    return objc_msgSend(*(id *)(v1 + 40), "layoutBelowIfNeeded");
  return result;
}

uint64_t __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

void __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _BYTE *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "centerPlaceholder"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));

    if (!WeakRetained)
    {
      v3 = *(_BYTE **)(a1 + 32);
      if ((v3[106] & 4) != 0)
        objc_msgSend(v3, "allowCursorToAppear:", 1);
      objc_msgSend(*(id *)(a1 + 40), "textInputTraits");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDeferBecomingResponder:", 1);

    }
  }
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke(uint64_t a1)
{
  double v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;

  if (*(_BYTE *)(a1 + 40))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_2;
    v12 = &unk_1E16B1B28;
    v13 = *(_QWORD *)(a1 + 32);
    v1 = 0.7;
    v2 = &v9;
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_3;
    v7 = &unk_1E16B1B28;
    v8 = *(_QWORD *)(a1 + 32);
    v1 = 0.0;
    v2 = &v4;
  }
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, v1, 0.3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", 1.0);
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", 0.0);
}

uint64_t __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_4(uint64_t result)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(*(_QWORD *)(result + 32) + 104) &= ~0x40000000u;
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 104);
  *(_DWORD *)(v1 + 104) = v2 & 0x7FFFFFFF;
  if (v2 < 0)
    return objc_msgSend(*(id *)(result + 32), "updateScopeBarFrame");
  return result;
}

void __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 40), "rightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  }
}

void __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 40), "rightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  }
}

uint64_t __55___UISearchBarVisualProviderLegacy_updateScopeBarFrame__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "layoutIfNeeded");
}

uint64_t __49___UISearchBarVisualProviderLegacy_setUpScopeBar__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "layoutBelowIfNeeded");
}

void __52___UISearchBarVisualProviderLegacy_setUpSearchField__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "barStyle"))
    objc_msgSend(*(id *)(a1 + 32), "colorForComponent:disabled:", 4, 0);
  else
    +[UIColor labelColor](UIColor, "labelColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setTextColor:", v2);

}

double __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double Width;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 64))
  {
    Width = CGRectGetWidth(*(CGRect *)&v9);
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    v16 = CGRectIntersection(*(CGRect *)(a1 + 32), v18);
    return Width - CGRectGetMinX(v16);
  }
  else
  {
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    v17 = CGRectIntersection(*(CGRect *)&v9, v19);
    return CGRectGetMaxX(v17);
  }
}

double __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double Width;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 64))
  {
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    v16 = CGRectIntersection(*(CGRect *)&v9, v18);
    return CGRectGetMaxX(v16);
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)&v9);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    v17 = CGRectIntersection(*(CGRect *)(a1 + 32), v19);
    return Width - CGRectGetMinX(v17);
  }
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_3(uint64_t a1)
{
  CGFloat v2;
  double v3;
  double v4;
  double v5;

  v2 = CGRectGetMaxX(*(CGRect *)(a1 + 48)) + 13.0;
  UIRoundToViewScale(*(void **)(a1 + 40));
  v4 = v3 + 1.0;
  objc_msgSend(*(id *)(a1 + 32), "landscapeScopeBarWidth");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setFrame:", v2, v4, v5, *(double *)(a1 + 112));
}

uint64_t __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "layoutIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 1.0;
  if ((*(_DWORD *)(v2 + 104) & 0x40000) == 0)
    v3 = 0.0;
  return objc_msgSend(*(id *)(v2 + 152), "setAlpha:", v3);
}

void __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "transitionToPrivateStyle:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 240) && (*(_DWORD *)(v2 + 104) & 0x38) == 0x10)
  {
    objc_msgSend(*(id *)(a1 + 40), "_searchBarTextField");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setBottomEffectBackgroundVisible:", 1);

  }
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", 1.0);
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", 0.0);
}

uint64_t __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "transitionToPrivateStyle:", -2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 1);
}

@end
