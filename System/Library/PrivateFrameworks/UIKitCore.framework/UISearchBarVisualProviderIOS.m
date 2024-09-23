@implementation UISearchBarVisualProviderIOS

double __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hostedScopeBarHeightForBarMetrics:", a2);
  v5 = v4;

  return v5;
}

void __49___UISearchBarVisualProviderIOS_setUpSearchField__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "barStyle"))
    objc_msgSend(*(id *)(a1 + 32), "colorForComponent:disabled:", 4, 0);
  else
    +[UIColor labelColor](UIColor, "labelColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setTextColor:", v2);

}

void __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_searchBarTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setEnabled:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

}

uint64_t __53___UISearchBarVisualProviderIOS_setEnabled_animated___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  double v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "numberOfSegments"))
  {
    v2 = 0;
    do
    {
      if (*(_BYTE *)(a1 + 40))
        v3 = 1.0;
      else
        v3 = 0.4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "infoViewForSegment:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", v3);

      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "numberOfSegments"));
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateMagnifyingGlassView");
}

uint64_t __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    result = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(result + 200))
      result = objc_msgSend((id)result, "setUpCancelButton");
    if (!*(_BYTE *)(v1 + 49))
      result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 200), "setAlpha:", 1.0);
  }
  if (*(_BYTE *)(v1 + 49))
    return objc_msgSend(*(id *)(v1 + 40), "layoutBelowIfNeeded");
  return result;
}

uint64_t __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

void __63___UISearchBarVisualProviderIOS_setShowsCancelButton_animated___block_invoke_3(uint64_t a1)
{
  _BYTE *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "centerPlaceholder"))
  {
    v2 = *(_BYTE **)(a1 + 32);
    if ((v2[154] & 4) != 0)
      objc_msgSend(v2, "allowCursorToAppear:", 1);
    objc_msgSend(*(id *)(a1 + 40), "textInputTraits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeferBecomingResponder:", 1);

  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "_setClipsToBounds:", *(unsigned __int8 *)(a1 + 49));
}

void __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  char v8;
  _QWORD v9[5];
  char v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_2;
  v9[3] = &unk_1E16B1B78;
  v10 = *(_BYTE *)(a1 + 48);
  v2 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_5;
  v5[3] = &unk_1E16B7110;
  v8 = v10;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v9, v5, 0.0, 0.0);

}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_2(uint64_t a1)
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
    v11 = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_3;
    v12 = &unk_1E16B1B28;
    v13 = *(_QWORD *)(a1 + 32);
    v1 = 0.0;
    v2 = &v9;
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_4;
    v7 = &unk_1E16B1B28;
    v8 = *(_QWORD *)(a1 + 32);
    v1 = 0.7;
    v2 = &v4;
  }
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, v1, 0.3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAlpha:", 0.0);
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAlpha:", 1.0);
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "setNeedsLayout");
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 64), "setNeedsLayout");
  }
  return result;
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_6(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setHidden:", 0);
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAlpha:", v2);
}

uint64_t __66___UISearchBarVisualProviderIOS_animateShowsScopeBarAnimatingOut___block_invoke_7(uint64_t a1)
{
  double x;
  double y;
  double width;
  double v5;
  CGRect v7;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    x = v7.origin.x;
    y = v7.origin.y;
    width = v7.size.width;
    objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", CGRectGetWidth(v7), 0.0);
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", x, y, width, v5);
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __93___UISearchBarVisualProviderIOS_setDeferredAutomaticShowsScopeBarInNavigationBar_hasContent___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "layoutIfNeeded");
}

void __63___UISearchBarVisualProviderIOS_revertViewHierarchyIfNecessary__block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(v1, "subviews", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "addSubview:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    objc_msgSend(v1, "removeFromSuperview");
    objc_msgSend(v2, "setNeedsLayout");
  }

}

void __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke(uint64_t a1)
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

void __48___UISearchBarVisualProviderIOS_updateRightView__block_invoke_2(uint64_t a1)
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

void __66___UISearchBarVisualProviderIOS_dictationButtonPressed_withEvent___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length");

  if (v2)
  {
    objc_msgSend(WeakRetained, "textualRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSelectedTextRange:", v3);

  }
}

uint64_t __68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateTransitionToSearchLayoutState:", *(_QWORD *)(a1 + 40));
}

_QWORD *__68___UISearchBarVisualProviderIOS_driveTransitionToSearchLayoutState___block_invoke_2(_QWORD *a1)
{
  _QWORD *result;

  *(_QWORD *)(a1[4] + 104) &= ~2uLL;
  result = (_QWORD *)a1[5];
  if (result[47] != a1[6])
    return (_QWORD *)objc_msgSend(result, "completeTransitionToSearchLayoutState:");
  return result;
}

double __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
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

double __85___UISearchBarVisualProviderIOS__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
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

double __58___UISearchBarVisualProviderIOS_configureLayout_forState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hostedScopeBarTopInsetForBarMetrics:", a2);
  v5 = v4;

  return v5;
}

@end
