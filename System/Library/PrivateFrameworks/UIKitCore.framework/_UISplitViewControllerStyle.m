@implementation _UISplitViewControllerStyle

- (UIColor)primaryBackgroundColor
{
  if (dyld_program_sdk_at_least())
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  else
    +[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)splitBehaviorForSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  char v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  __int128 v26;
  int v27;
  __int128 v28;
  int v29;
  uint64_t v30;

  height = a3.height;
  width = a3.width;
  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);
  objc_msgSend(WeakRetained, "_panelImpl");
  v7 = objc_claimAutoreleasedReturnValue();

  -[_UISplitViewControllerStyle splitViewController](self, "splitViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(WeakRetained) = _UISplitViewControllerAutoHidesColumns(v8);

  if ((_DWORD)WeakRetained)
  {
    if (!v7)
    {
      v16 = 0;
      goto LABEL_36;
    }
    v9 = objc_msgSend((id)v7, "style");
    if (v9 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultAutoHidingSplitBehaviorUpdatingOverrideFlagsIfNecessaryForSize_, v7, CFSTR("UISplitViewControllerPanelImpl.m"), 1634, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v22);

    }
    v10 = objc_loadWeakRetained((id *)(v7 + 16));
    v11 = _UISplitViewControllerAutoHidesColumns(v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultAutoHidingSplitBehaviorUpdatingOverrideFlagsIfNecessaryForSize_, v7, CFSTR("UISplitViewControllerPanelImpl.m"), 1634, CFSTR("Method restricted to autohiding context for UISplitViewController"));

    }
    objc_msgSend((id)v7, "currentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else if ((objc_msgSend((id)v7, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", width, 0.0, 0.0) & 1) == 0)
    {
      v24 = 0.0;
      v25 = 0.0;
      if (v9 == 2)
      {
        objc_msgSend(*(id *)(v7 + 8), "objectForKeyedSubscript:", &unk_1E1A97488);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 ? 4 : 2;
        objc_msgSend((id)v7, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v25, &v24, v18, 1, 0, 0, width, height);

      }
      else
      {
        objc_msgSend((id)v7, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v25, &v24, 2, 1, 0, 0, width, height);
      }
      if (objc_msgSend((id)v7, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", width, v25, v24))
      {
        if (v24 <= 0.0)
        {
          v16 = 2;
        }
        else if (objc_msgSend((id)v7, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", width, 0.0, v24))
        {
          v16 = 2;
        }
        else
        {
          v16 = 3;
        }
        v19 = v16 << 18;
        goto LABEL_35;
      }
    }
    v19 = 0;
    v16 = 1;
LABEL_35:
    *(_QWORD *)(v7 + 288) = *(_QWORD *)(v7 + 288) & 0xFFFFFFFFFFF3FFFFLL | v19;
    goto LABEL_36;
  }
  v29 = 802516499;
  v28 = xmmword_18667A5F8;
  v27 = -1919324456;
  v26 = xmmword_18667A60C;
  v13 = MGIsDeviceOneOfType();
  v14 = 1194.0;
  if (v13)
    v14 = 1210.0;
  v15 = 1536.0;
  if (width > height)
    v15 = v14;
  if (width <= v15)
  {
    if (width > height)
      v14 = 1024.0;
    if (width >= v14)
    {
      if (objc_msgSend((id)v7, "_hasDoubleSideBar", &v26, 0))
        v16 = 3;
      else
        v16 = 1;
    }
    else
    {
      v16 = 2;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_36:

  return v16;
}

- (BOOL)alwaysHideSidebarToggleButton
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);
  objc_msgSend(WeakRetained, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_msgSend(v3, "_forceDisplayModeBarButtonHidden") & 1) != 0
    || (objc_msgSend(v3, "_isCollapsedOrCollapsing") & 1) != 0
    || (objc_msgSend(v3, "presentsWithGesture") & 1) == 0
    && (objc_msgSend(v3, "_visibleToggleButtonRequiresPresentsWithGesture") & 1) != 0
    || UIApp == 0;

  return v4;
}

- (UISplitViewController)splitViewController
{
  return (UISplitViewController *)objc_loadWeakRetained((id *)&self->_splitViewController);
}

- (_UISplitViewControllerStyle)initWithSplitViewController:(id)a3
{
  id v4;
  _UISplitViewControllerStyle *v5;
  _UISplitViewControllerStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISplitViewControllerStyle;
  v5 = -[_UISplitViewControllerStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_splitViewController, v4);

  return v6;
}

- (double)maximumRubberbandingDistance
{
  return 100.0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_splitViewController);
}

- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5
{
  double height;
  double width;
  UISplitViewController **p_splitViewController;
  id WeakRetained;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  int v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;

  height = a4.height;
  width = a4.width;
  v43 = *MEMORY[0x1E0C80C00];
  p_splitViewController = &self->_splitViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewController);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9916, CFSTR("Style for a dealloced UISplitViewController not expected"));

  }
  v13 = objc_loadWeakRetained((id *)p_splitViewController);
  objc_msgSend(v13, "_panelImpl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "style");
  if (a3 == 1)
  {
    v19 = 0.0;
    if (v15 == 2)
    {
      objc_msgSend(v14, "_screenSize");
      if (width < v20 && a5 == 2)
        v19 = 320.0;
      else
        v19 = 375.0;
    }
    goto LABEL_42;
  }
  if (a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        goto LABEL_20;
      _UISplitViewControllerColumnDescription(a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138412290;
      v42 = v25;
      _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Unexpected request for default max width for %@ column. Using CGFLOAT_MAX", (uint8_t *)&v41, 0xCu);
    }
    else
    {
      v22 = defaultMaximumWidthForColumn_withSize_splitBehavior____s_category;
      if (!defaultMaximumWidthForColumn_withSize_splitBehavior____s_category)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&defaultMaximumWidthForColumn_withSize_splitBehavior____s_category);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v24 = v23;
      _UISplitViewControllerColumnDescription(a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138412290;
      v42 = v25;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Unexpected request for default max width for %@ column. Using CGFLOAT_MAX", (uint8_t *)&v41, 0xCu);
    }

LABEL_20:
LABEL_21:
    *(double *)&v18 = 1.79769313e308;
    goto LABEL_41;
  }
  v16 = objc_loadWeakRetained((id *)p_splitViewController);
  v17 = _UISplitViewControllerWantsPickerBehaviors(v16);

  if ((v17 & 1) != 0)
  {
    *(double *)&v18 = 240.0;
LABEL_41:
    v19 = *(double *)&v18;
    goto LABEL_42;
  }
  -[_UISplitViewControllerStyle splitViewController](self, "splitViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "_usesExtraWidePrimaryColumn");

  if (!v27)
    goto LABEL_40;
  objc_msgSend(v14, "_screenSize");
  v19 = 320.0;
  if (width != v29 || height != v28)
    goto LABEL_42;
  if (height >= width)
    v30 = height;
  else
    v30 = width;
  if (v30 > 1210.0)
  {
    v19 = dbl_18667A670[height < width];
    goto LABEL_42;
  }
  if (height >= width)
    goto LABEL_40;
  if (width > 1112.0)
  {
    v19 = 414.0;
    goto LABEL_42;
  }
  if (width > 926.0)
  {
    v19 = 375.0;
    goto LABEL_42;
  }
  if (width <= 844.0)
  {
LABEL_40:
    *(double *)&v18 = 320.0;
    goto LABEL_41;
  }
  v31 = objc_msgSend(v14, "_layoutPrimaryOnRight");
  v32 = objc_loadWeakRetained((id *)p_splitViewController);
  objc_msgSend(v32, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaInsets");
  v35 = v34;
  v37 = v36;

  if (v31)
    v38 = v37;
  else
    v38 = v35;
  v19 = v38 + 320.0;
LABEL_42:

  return v19;
}

@end
