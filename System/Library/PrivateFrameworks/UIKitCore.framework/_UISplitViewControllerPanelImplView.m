@implementation _UISplitViewControllerPanelImplView

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v8 = CGRectGetWidth(v11);
  v10.receiver = self;
  v10.super_class = (Class)_UISplitViewControllerPanelImplView;
  -[UILayoutContainerView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (v8 != CGRectGetWidth(v12))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v9 = CGRectGetWidth(v13);
    -[_UISplitViewControllerPanelImplView _didChangeWidthFrom:to:](self, v8, v9);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v8 = CGRectGetWidth(v11);
  v10.receiver = self;
  v10.super_class = (Class)_UISplitViewControllerPanelImplView;
  -[UILayoutContainerView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (v8 != CGRectGetWidth(v12))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v9 = CGRectGetWidth(v13);
    -[_UISplitViewControllerPanelImplView _didChangeWidthFrom:to:](self, v8, v9);
  }
}

- (void)_didChangeWidthFrom:(double)a3 to:
{
  void *v6;
  uint64_t v7;
  id *v8;
  void *WeakRetained;
  char v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  BOOL v22;
  const __CFString *v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  int v43;
  double v44;
  id v45;
  int v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id *v50;
  double v51;
  _BYTE buf[12];
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "impl");
    v50 = (id *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v50, "style"))
      goto LABEL_64;
    objc_msgSend(a1, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50 || !v6)
      goto LABEL_64;
    v7 = objc_msgSend(v50, "style");
    if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v47 = v7;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateDisplayModeIfNecessaryForChangeFromOldWidth_toNewWidth_, v50, CFSTR("UISplitViewControllerPanelImpl.m"), 3512, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v49);

    }
    v8 = v50 + 2;
    WeakRetained = objc_loadWeakRetained(v50 + 2);
    if (!_UISplitViewControllerAutoHidesColumns(WeakRetained))
      goto LABEL_63;
    v10 = objc_msgSend(v50, "_isCollapsedOrCollapsing");

    if ((v10 & 1) != 0)
    {
LABEL_64:

      return;
    }
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      v11 = qword_1ECD7D548;
      if (!qword_1ECD7D548)
      {
        v11 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7D548);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = objc_loadWeakRetained(v8);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v14;
        v53 = 2048;
        v54 = a2;
        v55 = 2048;
        v56 = a3;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@: Updating display mode if necessary for change in width from %g to %g", buf, 0x20u);

      }
    }
    objc_msgSend(v50, "currentState");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v50, "displayMode");
    v16 = objc_msgSend(v50, "preferredDisplayMode");
    if (v15 == v16 && v16)
    {
      if (_UIGetUISplitViewControllerChamoisResizeLogging())
      {
        v17 = qword_1ECD7D550;
        if (!qword_1ECD7D550)
        {
          v17 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1ECD7D550);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          v20 = objc_loadWeakRetained(v8);
          _UISplitViewControllerDisplayModeDescription(v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = ((unint64_t)v50[36] & 0xC0000) != 0 && v15 == 1;
          v23 = &stru_1E16EDF20;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v20;
          if (v22)
            v23 = CFSTR(" Clearing behavior override flags.");
          v53 = 2112;
          v54 = *(double *)&v21;
          v55 = 2112;
          v56 = *(double *)&v23;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%@: Will not change preferred display mode, %@, for change in width.%@", buf, 0x20u);

        }
      }
      if (v15 != 1)
        goto LABEL_63;
      v50[36] = (id)((unint64_t)v50[36] & 0xFFFFFFFFFFF3FFFFLL);
      goto LABEL_28;
    }
    if (v15 > 6 || ((1 << v15) & 0x56) == 0)
    {
      if (_UIGetUISplitViewControllerChamoisResizeLogging())
      {
        v37 = qword_1ECD7D558;
        if (!qword_1ECD7D558)
        {
          v37 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v37, (unint64_t *)&qword_1ECD7D558);
        }
        v38 = *(NSObject **)(v37 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = v38;
          v40 = objc_loadWeakRetained(v8);
          _UISplitViewControllerDisplayModeDescription(v15);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v40;
          v53 = 2112;
          v54 = *(double *)&v41;
          _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "%@: Will not change non-tile display mode, %@, for change in width", buf, 0x16u);

        }
      }
      goto LABEL_63;
    }
    if (a3 < a2)
    {
      if (!objc_msgSend(WeakRetained, "_collapsedState") && v15 != 1)
      {
        v51 = 0.0;
        *(_QWORD *)buf = 0;
        objc_msgSend(v50, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v51, v15, 1, 0, 0, a2, 800.0);
        v24 = 0;
        if (!objc_msgSend(v50, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", a3, *(double *)buf, v51)|| (v24 = 1, *(double *)buf <= 0.0)|| v51 <= 0.0)
        {
LABEL_29:
          if (v24 && v24 != v15)
          {
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v25 = qword_1ECD7D560;
              if (!qword_1ECD7D560)
              {
                v25 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v25, (unint64_t *)&qword_1ECD7D560);
              }
              v26 = *(NSObject **)(v25 + 8);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v27 = v26;
                v28 = objc_loadWeakRetained(v8);
                _UISplitViewControllerDisplayModeDescription(v15);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                _UISplitViewControllerDisplayModeDescription(v24);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v28;
                v53 = 2112;
                v54 = *(double *)&v29;
                v55 = 2112;
                v56 = *(double *)&v30;
                _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "%@: Automatically changing displayMode from %@ to %@ for change in width", buf, 0x20u);

              }
            }
            objc_msgSend(v50, "setUserGeneratedDisplayMode:", 0);
            objc_msgSend(v50, "panelController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setNeedsUpdate");

          }
          goto LABEL_63;
        }
        if ((objc_msgSend(v50, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", a3, 0.0, v51) & 1) == 0)
        {
          v24 = objc_msgSend(v50, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", 2);
          goto LABEL_29;
        }
LABEL_28:
        v24 = 1;
        goto LABEL_29;
      }
LABEL_63:

      goto LABEL_64;
    }
    if (a3 <= a2)
      goto LABEL_63;
    objc_msgSend(WeakRetained, "leadingWidth");
    if (v32 != 0.0)
      goto LABEL_63;
    objc_msgSend(WeakRetained, "trailingWidth");
    if (v33 != 0.0)
      goto LABEL_63;
    objc_msgSend(WeakRetained, "supplementaryWidth");
    if (v34 != 0.0 && ((unint64_t)v50[36] & 0xC0000) == 0x80000)
      goto LABEL_63;
    v51 = 0.0;
    *(_QWORD *)buf = 0;
    objc_msgSend(WeakRetained, "supplementaryWidth");
    if (v35 == 0.0)
    {
      v36 = objc_loadWeakRetained(v8);
      if (_UISplitViewControllerAutoHidesColumns(v36) && qword_1ECD7D5A0 != -1)
        dispatch_once(&qword_1ECD7D5A0, &__block_literal_global_1255);
      if (byte_1ECD7D4C3)
      {

        goto LABEL_66;
      }
      v42 = objc_loadWeakRetained(v8);
      v43 = _UISplitViewControllerAutoRevealsFullSidebar(v42);

      if (v43)
      {
LABEL_66:
        v24 = 2;
        objc_msgSend(v50, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", buf, &v51, 2, 0, 0, a3, 800.0);
        if ((objc_msgSend(v50, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", a3, *(double *)buf, v51) & 1) == 0)
        {
LABEL_67:
          v50[36] = (id)((unint64_t)v50[36] & 0xFFFFFFFFFFF3FFFFLL);
          goto LABEL_29;
        }
        goto LABEL_71;
      }
    }
    objc_msgSend(WeakRetained, "supplementaryWidth");
    if (v44 > 0.0)
    {
      v45 = objc_loadWeakRetained(v8);
      v46 = _UISplitViewControllerAutoRevealsFullSidebar(v45);

      if (v46)
      {
        if ((objc_msgSend(v50, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", a3, 0.0, 0.0) & 1) == 0)
        {
          v24 = objc_msgSend(v50, "_greatestAllowedAutohidingDisplayModeInSize:", a3, 800.0);
          goto LABEL_67;
        }
      }
    }
LABEL_71:
    v24 = 0;
    goto LABEL_29;
  }
}

- (UISplitViewControllerPanelImpl)impl
{
  return (UISplitViewControllerPanelImpl *)objc_loadWeakRetained((id *)&self->_impl);
}

- (void)setImpl:(id)a3
{
  objc_storeWeak((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_impl);
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)_UISplitViewControllerPanelImplView;
  -[UIView focusItemsInRect:](&v19, sel_focusItemsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISplitViewControllerPanelImplView impl](self, "impl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_primaryViewControllerFocusPromiseItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  -[UIView coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21.origin.x = _UIFocusItemFrameInCoordinateSpace(v10, v11);
  v21.origin.y = v12;
  v21.size.width = v13;
  v21.size.height = v14;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v15 = CGRectIntersectsRect(v20, v21);

  if (v15)
  {
    objc_msgSend(v8, "arrayByAddingObject:", v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v16 = v8;
  }
  v17 = v16;

  return v17;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

@end
