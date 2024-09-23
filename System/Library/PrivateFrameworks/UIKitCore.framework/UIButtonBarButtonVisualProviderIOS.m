@implementation UIButtonBarButtonVisualProviderIOS

_QWORD *__73___UIButtonBarButtonVisualProviderIOS_configureButton_fromBarButtonItem___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  _QWORD *v11;
  _QWORD *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  _QWORD *result;
  double v31;
  double v32;
  double v33;

  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "alignmentRectInsets");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v8 = objc_msgSend(*(id *)(a1 + 32), "hasBaseline");
    v9 = 0.0;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_defaultBackIndicatorBaselineInsetCompact:", *(unsigned __int8 *)(a1 + 81));
      v9 = v5 + v10;
    }
    v11 = *(_QWORD **)(a1 + 40);
    if (v11[9])
    {
      objc_msgSend(v11, "_imageInsetsForBarButtonItem:compact:isBackButton:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 81), 1);
      objc_msgSend(*(id *)(a1 + 40), "_configureImageBackButtonWithImageInsets:backButtonLayoutInsets:useBaselineAlignment:", v8);
    }
    else if (v11[8])
    {
      objc_msgSend(v11, "backButtonTitlePositionOffsetForCompact:", *(unsigned __int8 *)(a1 + 81));
      objc_msgSend(*(id *)(a1 + 40), "_configureTextBackButtonWithTitlePositionAdjustment:backButtonLayoutInsets:useBaselineAlignment:", v8);
    }
    else
    {
      objc_msgSend(v11, "_configureBackButtonWithBackButtonLayoutInsets:useBaselineAlignment:", v8, 0.0, v3, v9, v7);
    }
  }
  else
  {
    v12 = *(_QWORD **)(a1 + 40);
    if (v12[9])
    {
      objc_msgSend(v12, "_imageInsetsForBarButtonItem:compact:isBackButton:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 81), 0);
      objc_msgSend(*(id *)(a1 + 40), "_configureImageWithInsets:paddingEdges:additionalPadding:", *(_QWORD *)(a1 + 56));
    }
    else if (v12[8])
    {
      objc_msgSend(*(id *)(a1 + 48), "titlePositionAdjustmentForBarMetrics:", *(_QWORD *)(a1 + 72));
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 40), "titlePositionOffsetForCompact:", *(unsigned __int8 *)(a1 + 81));
      v16 = v15;
      v18 = v17;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 88));
      objc_msgSend(WeakRetained, "defaultTextPadding");
      v21 = v20;

      v22 = *(_QWORD *)(a1 + 56);
      if ((v22 & 8) != 0)
      {
        v25 = v21 + *(double *)(a1 + 64);
      }
      else
      {
        v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 88));
        objc_msgSend(v23, "defaultEdgeSpacing");
        v25 = v24;

        v22 = *(_QWORD *)(a1 + 56);
      }
      v26 = v14 + v16;
      if ((v22 & 2) != 0)
      {
        v29 = v21 + *(double *)(a1 + 64);
      }
      else
      {
        v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 88));
        objc_msgSend(v27, "defaultEdgeSpacing");
        v29 = v28;

      }
      objc_msgSend(*(id *)(a1 + 40), "_configureTextWithOffset:additionalPadding:", v26, v18, 0.0, v29, 0.0, v25);
    }
  }
  result = *(_QWORD **)(a1 + 40);
  if (result[10])
  {
    objc_msgSend(result, "backButtonBackgroundVerticalAdjustmentForCompact:", *(unsigned __int8 *)(a1 + 81));
    v32 = v31;
    if (fabs(v31) < 2.22044605e-16)
    {
      objc_msgSend(*(id *)(a1 + 48), "backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:", *(unsigned __int8 *)(a1 + 81));
      v32 = v33;
    }
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_addConstraintsForBackgroundViewWithOffset:isBackButton:resizesImage:", *(unsigned __int8 *)(a1 + 80), objc_msgSend(*(id *)(a1 + 48), "_resizesBackgroundImage"), v32);
  }
  return result;
}

uint64_t __60___UIButtonBarButtonVisualProviderIOS__setupAlternateTitles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "width");
  v6 = v5;
  objc_msgSend(v4, "width");
  v8 = v7;

  v9 = -1;
  if (v6 <= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

uint64_t __69___UIButtonBarButtonVisualProviderIOS__configureImageOrTitleCompact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v5);
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);

      }
    }
    else
    {
      v9 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category;
      if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);

      }
    }
    v13 = objc_loadWeakRetained(v5);
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(v5);
    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_213;
    v24 = &unk_1E16B58D0;
    objc_copyWeak(&v25, v5);
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v16, 0, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v25);
  }

  return v7;
}

void __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_213(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerActionForEvent:", 0);

}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_4(uint64_t a1)
{
  return -[UIBarButtonItemGroup _representativeItemMenu](*(void **)(a1 + 32));
}

@end
