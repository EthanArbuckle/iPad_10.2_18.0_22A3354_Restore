@implementation _UIEditMenuContentPresentation

- (void)displayMenu:(id)a3 configuration:(id)a4
{
  id v6;

  v6 = a3;
  -[_UIEditMenuPresentation setActiveConfiguration:](self, "setActiveConfiguration:", a4);
  -[_UIEditMenuContentPresentation _displayMenu:reason:](self, "_displayMenu:reason:", v6, 0);

}

- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuContentPresentation.m"), 96, CFSTR("Cannot replace the visible menu if there are no visible menus present."));

  }
  -[_UIEditMenuContentPresentation _displayMenu:reason:](self, "_displayMenu:reason:", v9, a4);

}

- (void)_displayMenu:(id)a3 reason:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  char v20;

  v7 = a3;
  -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuContentPresentation.m"), 103, CFSTR("Cannot update the visible menu without an active configuration"));

  }
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        v11 = -[_UIEditMenuContentPresentation _shouldReuseVisibleMenu](self, "_shouldReuseVisibleMenu"),
        v10,
        !v11))
  {
    if ((unint64_t)a4 > 2)
      v13 = 0;
    else
      v13 = qword_186684B10[a4];
    -[_UIEditMenuContentPresentation hideMenuWithReason:](self, "hideMenuWithReason:", v13);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  if (-[_UIEditMenuContentPresentation canPresentEditMenu](self, "canPresentEditMenu"))
  {
    -[_UIEditMenuPresentation delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54___UIEditMenuContentPresentation__displayMenu_reason___block_invoke;
    v16[3] = &unk_1E16C2680;
    v16[4] = self;
    v17 = v7;
    v18 = v8;
    v19 = a4;
    v20 = v12;
    objc_msgSend(v14, "_editMenuPresentation:preparedMenuForDisplay:completion:", self, v17, v16);

  }
}

- (void)_displayPreparedMenu:(id)a3 titleView:(id)a4 reason:(int64_t)a5 didDismissMenu:(BOOL)a6 configuration:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL8 v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  _UIEditMenuListView *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(void *, uint64_t);
  int v47;
  int v48;
  BOOL v49;
  int v50;
  void *v51;
  uint64_t *v52;
  _UIEditMenuListView *v53;
  void (**v54)(_QWORD, __n128);
  __n128 v55;
  int v56;
  BOOL v57;
  _BOOL4 v58;
  void *v59;
  uint64_t v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  uint64_t v63;
  _QWORD aBlock[5];
  char v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;
  CGRect v71;

  v8 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12)
    v15 = ((unint64_t)objc_msgSend(v12, "metadata") >> 24) & 1;
  else
    LOBYTE(v15) = 0;
  if (v13 || (v15 & 1) != 0)
  {
    -[_UIEditMenuContentPresentation configureContainerViewWithConfiguration:](self, "configureContainerViewWithConfiguration:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuContentPresentation setUserInterfaceStyle:](self, "setUserInterfaceStyle:", -[_UIEditMenuContentPresentation initialUserInterfaceStyle](self, "initialUserInterfaceStyle"));
    v65 = 1;
    -[_UIEditMenuContentPresentation _queryMenuSourceRectForConfiguration:isValid:](self, "_queryMenuSourceRectForConfiguration:isValid:", v14, &v65);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    if (v65)
    {
      -[_UIEditMenuPresentation setActiveConfiguration:](self, "setActiveConfiguration:", v14);
      -[_UIEditMenuPresentation setDisplayedMenu:](self, "setDisplayedMenu:", v12);
      v27 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      if (-[_UIEditMenuContentPresentation _shouldReuseVisibleMenu](self, "_shouldReuseVisibleMenu"))
      {
        -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "reloadWithMenu:titleView:animated:", v12, v13, 0);

        -[_UIEditMenuContentPresentation _updateMenuPositionAnimated:forced:](self, "_updateMenuPositionAnimated:forced:", v27, 1);
      }
      else
      {
        v57 = v27;
        v58 = v8;
        objc_msgSend(v18, "traitCollection");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[_UIEditMenuContentPresentation _listViewAxisForTraitCollection:](self, "_listViewAxisForTraitCollection:", v34);

        v36 = -[_UIEditMenuListView initWithDelegate:menu:titleView:]([_UIEditMenuListView alloc], "initWithDelegate:menu:titleView:", self, v12, v13);
        -[UIView setAlpha:](v36, "setAlpha:", 0.0);
        -[_UIEditMenuListView setAxis:](v36, "setAxis:", v35);
        objc_storeStrong((id *)&self->_currentListView, v36);
        -[_UIEditMenuContentPresentation _resolvedLayoutForMenuWithConfiguration:sourceRect:axis:](self, "_resolvedLayoutForMenuWithConfiguration:sourceRect:axis:", v14, v35, v20, v22, v24, v26);
        v37 = v18;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEditMenuListView setArrowDirection:](v36, "setArrowDirection:", objc_msgSend(v38, "arrowDirection"));
        objc_msgSend(v38, "containerBounds");
        -[_UIEditMenuListView setBounds:](v36, "setBounds:");
        objc_msgSend(v38, "menuPosition");
        -[UIView setCenter:](v36, "setCenter:");
        objc_msgSend(v38, "anchorPoint");
        v40 = v39;
        v42 = v41;
        -[UIView layer](v36, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setAnchorPoint:", v40, v42);

        v59 = v37;
        objc_msgSend(v37, "addSubview:", v36);
        -[UIView layoutIfNeeded](v36, "layoutIfNeeded");
        objc_storeStrong((id *)&self->_currentListView, v36);
        objc_storeStrong((id *)&self->_currentMenuLayout, v38);
        if (a5)
        {
          v44 = 4;
        }
        else
        {
          -[_UIEditMenuPresentation forceEndDismissalIfNeeded](self, "forceEndDismissalIfNeeded");
          v44 = 0;
        }
        -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:", v44);
        v45 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke;
        aBlock[3] = &unk_1E16B3FD8;
        aBlock[4] = self;
        v46 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        v47 = _AXSReduceMotionEnabled();
        v48 = v47;
        v49 = a5 != 2 && v47 == 0;
        v50 = !v49;
        v56 = v50;
        if (v49)
        {
          CGAffineTransformMakeScale(&v62, 0.2, 0.2);
          v61 = v62;
          -[UIView setTransform:](v36, "setTransform:", &v61);
          v60 = v45;
          v51 = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_3;
          v52 = &v60;
        }
        else
        {
          v63 = v45;
          v51 = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_2;
          v52 = &v63;
        }
        v52[1] = 3221225472;
        v52[2] = (uint64_t)v51;
        v52[3] = (uint64_t)&unk_1E16B1B50;
        v53 = v36;
        v52[4] = (uint64_t)v53;
        v52[5] = (uint64_t)self;
        v54 = (void (**)(_QWORD, __n128))_Block_copy(v52);

        v55.n128_u64[0] = 0x3FC3333333333333;
        if (!v58)
          v55.n128_f64[0] = 0.0;
        if (v57)
        {
          if (v48)
          {
            -[_UIEditMenuPresentation animateReducedMotionTransitionWithDelay:animations:completion:](self, "animateReducedMotionTransitionWithDelay:animations:completion:", v54, v46, v55.n128_f64[0]);
          }
          else if (v56)
          {
            -[_UIEditMenuPresentation animateFadeWithDelay:animations:completion:](self, "animateFadeWithDelay:animations:completion:", v54, v46, v55.n128_f64[0]);
          }
          else
          {
            -[_UIEditMenuPresentation animateScalePresentWithDelay:animations:completion:](self, "animateScalePresentWithDelay:animations:completion:", v54, v46, v55.n128_f64[0]);
          }
        }
        else
        {
          v54[2](v54, v55);
          v46[2](v46, 1);
        }

        v18 = v59;
      }
    }
    else
    {
      v29 = qword_1ECD7ADE0;
      if (!qword_1ECD7ADE0)
      {
        v29 = __UILogCategoryGetNode("EditMenuInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&qword_1ECD7ADE0);
      }
      v30 = *(NSObject **)(v29 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v71.origin.x = v20;
        v71.origin.y = v22;
        v71.size.width = v24;
        v71.size.height = v26;
        NSStringFromCGRect(v71);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v32;
        v68 = 2112;
        v69 = v33;
        _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) has an invalid target rect (%@); ignoring present.",
          buf,
          0x16u);

      }
      -[_UIEditMenuContentPresentation teardownContainerView](self, "teardownContainerView");
    }

  }
  else
  {
    v16 = _MergedGlobals_9_9;
    if (!_MergedGlobals_9_9)
    {
      v16 = __UILogCategoryGetNode("EditMenuInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&_MergedGlobals_9_9);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v14;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) did not have performable commands and/or actions; ignoring present.",
        buf,
        0xCu);
    }
    if ((unint64_t)(a5 - 1) > 1)
    {
      -[_UIEditMenuContentPresentation hideMenuWithReason:](self, "hideMenuWithReason:", 0);
    }
    else
    {
      -[_UIEditMenuPresentation forceEndPresentIfNeeded](self, "forceEndPresentIfNeeded");
      -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:", 2);
    }
  }

}

- (void)hideMenuWithReason:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t *p_aBlock;
  void (**v13)(_QWORD);
  void *v14;
  _UIEditMenuListView *currentListView;
  _UIEditMenuPresentationLayout *currentMenuLayout;
  void (**v17)(void *, uint64_t);
  _QWORD v18[6];
  uint64_t aBlock;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__216;
  v21[4] = __Block_byref_object_dispose__216;
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _AXSReduceMotionEnabled();
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = a3 != 4 && v6 == 0;
    v9 = !v8;
    v10 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      aBlock = MEMORY[0x1E0C809B0];
      v11 = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_2;
      p_aBlock = &aBlock;
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v11 = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke;
      p_aBlock = &v20;
    }
    p_aBlock[1] = 3221225472;
    p_aBlock[2] = (uint64_t)v11;
    p_aBlock[3] = (uint64_t)&unk_1E16BACE0;
    p_aBlock[4] = (uint64_t)self;
    p_aBlock[5] = (uint64_t)v21;
    v13 = (void (**)(_QWORD))_Block_copy(p_aBlock);
    -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPresentation setDismissingConfiguration:](self, "setDismissingConfiguration:", v14);

    if ((unint64_t)(a3 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      -[_UIEditMenuPresentation forceEndPresentIfNeeded](self, "forceEndPresentIfNeeded");
      -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:", 2);
    }
    currentListView = self->_currentListView;
    self->_currentListView = 0;

    currentMenuLayout = self->_currentMenuLayout;
    self->_currentMenuLayout = 0;

    -[_UIEditMenuPresentation setDisplayedMenu:](self, "setDisplayedMenu:", 0);
    -[_UIEditMenuPresentation setActiveConfiguration:](self, "setActiveConfiguration:", 0);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_3;
    v18[3] = &unk_1E16BD888;
    v18[4] = self;
    v18[5] = v21;
    v17 = (void (**)(void *, uint64_t))_Block_copy(v18);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      if (v6)
      {
        -[_UIEditMenuPresentation animateReducedMotionTransitionWithDelay:animations:completion:](self, "animateReducedMotionTransitionWithDelay:animations:completion:", v13, v17, 0.0);
      }
      else if (v9)
      {
        -[_UIEditMenuPresentation animateFadeWithDelay:animations:completion:](self, "animateFadeWithDelay:animations:completion:", v13, v17, 0.0);
      }
      else
      {
        -[_UIEditMenuPresentation animateScaleDismissalWithAnimations:completion:](self, "animateScaleDismissalWithAnimations:completion:", v13, v17);
      }
    }
    else
    {
      v13[2](v13);
      v17[2](v17, 1);
    }

  }
  _Block_object_dispose(v21, 8);

}

- (void)updateMenuPositionAnimated:(BOOL)a3
{
  -[_UIEditMenuContentPresentation _updateMenuPositionAnimated:forced:](self, "_updateMenuPositionAnimated:forced:", a3, 0);
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  _UIEditMenuListView *currentListView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a3;
  -[_UIEditMenuContentPresentation currentMenuLayout](self, "currentMenuLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    currentListView = self->_currentListView;
    -[_UIEditMenuContentPresentation currentMenuLayout](self, "currentMenuLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerBounds");
    -[UIView convertRect:toCoordinateSpace:](currentListView, "convertRect:toCoordinateSpace:", v4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[UIView _currentScreenScale](self->_currentListView, "_currentScreenScale");
    v17 = UIRectRoundToScale(v9, v11, v13, v15, v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D628];
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)canPresentEditMenu
{
  return 1;
}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIEditMenuContentPresentation;
  -[_UIEditMenuPresentation didTransitionFrom:to:](&v9, sel_didTransitionFrom_to_, a3);
  if (a4 == 5)
  {
    -[_UIEditMenuContentPresentation containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeActivePresentation:", self);
    -[_UIEditMenuContentPresentation teardownContainerView](self, "teardownContainerView");
    -[_UIEditMenuPresentation setDismissingConfiguration:](self, "setDismissingConfiguration:", 0);
  }
  else
  {
    if (a4 != 2)
      return;
    -[_UIEditMenuContentPresentation containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setActivePresentation:", self);
  }

}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  return 0;
}

- (void)contentSizeCategoryDidChangeInEditMenuListView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIEditMenuContentPresentation _listViewAxisForTraitCollection:](self, "_listViewAxisForTraitCollection:", v5);
    -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAxis:", v6);

    -[_UIEditMenuContentPresentation _updateMenuPositionAnimated:forced:](self, "_updateMenuPositionAnimated:forced:", 0, 1);
  }
  else
  {
    -[_UIEditMenuContentPresentation hideMenuWithReason:](self, "hideMenuWithReason:", 0);
  }

}

- (void)editMenuListView:(id)a3 didSelectMenuElement:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "_isLeaf"))
  {
    v8 = v7;
    -[_UIEditMenuPresentation displayedMenu](self, "displayedMenu");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[_UIEditMenuPresentation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___UIEditMenuContentPresentation_editMenuListView_didSelectMenuElement___block_invoke;
    v13[3] = &unk_1E16BFAE0;
    objc_copyWeak(&v16, &location);
    v11 = v8;
    v14 = v11;
    v12 = v9;
    v15 = v12;
    objc_msgSend(v10, "_editMenuPresentation:didSelectMenuLeaf:completion:", self, v11, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    -[_UIEditMenuContentPresentation replaceVisibleMenuWithMenu:reason:](self, "replaceVisibleMenuWithMenu:reason:", v7, 1);
  }

}

- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3
{
  return 1;
}

- (id)_currentPlatformMetrics
{
  void *v2;
  void *v3;

  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v2, "_userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_convertSourceWindowRectToContainerView:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v11)
  {
    -[_UIEditMenuContentPresentation containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromWindow:", v15, x, y, width, height);
    x = v16;
    y = v17;
    width = v18;
    height = v19;

  }
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_currentScreenScale");
  v22 = UIRectRoundToScale(x, y, width, height, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)_queryMenuSourceRectForConfiguration:(id)a3 isValid:(BOOL *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  v6 = a3;
  -[_UIEditMenuPresentation delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_editMenuPresentation:targetRectForConfiguration:", self, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:toView:", v18, v9, v11, v13, v15);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v20, v22, v24, v26);
  v31 = v27;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  if (a4)
    *a4 = !CGRectIsNull(*(CGRect *)&v27);
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (id)_queryMenuSourceRectsPreferredLayoutRectsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double x;
  double y;
  double width;
  double height;
  void *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIEditMenuPresentation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_editMenuPresentation:preferredLayoutRectsForConfiguration:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "CGRectValue", v38);
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;
          -[_UIEditMenuPresentation sourceView](self, "sourceView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIEditMenuPresentation sourceView](self, "sourceView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_window");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "convertRect:toView:", v23, v14, v16, v18, v20);
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;

          -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v25, v27, v29, v31);
          x = v45.origin.x;
          y = v45.origin.y;
          width = v45.size.width;
          height = v45.size.height;
          if (!CGRectIsNull(v45))
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v36);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v10);
    }

    v6 = v38;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)_listViewAxisForTraitCollection:(id)a3
{
  NSString *v3;
  _BOOL8 IsAccessibilityCategory;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)_shouldReuseVisibleMenu
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIEditMenuContentPresentation _listViewAxisForTraitCollection:](self, "_listViewAxisForTraitCollection:", v4);

  return -[_UIEditMenuPresentation currentState](self, "currentState") == 2 && v5 == 0;
}

- (void)_reloadMenuLayoutWithSourceRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIEditMenuContentPresentation _listViewAxisForTraitCollection:](self, "_listViewAxisForTraitCollection:", v13);

  -[_UIEditMenuContentPresentation _resolvedLayoutForMenuWithConfiguration:sourceRect:axis:](self, "_resolvedLayoutForMenuWithConfiguration:sourceRect:axis:", v10, v14, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __75___UIEditMenuContentPresentation__reloadMenuLayoutWithSourceRect_animated___block_invoke;
  v23 = &unk_1E16B1B50;
  v24 = v11;
  v25 = v15;
  v16 = v15;
  v17 = v11;
  v18 = _Block_copy(&v20);
  v19 = v18;
  if (v4)
    -[_UIEditMenuPresentation animateFadeWithDelay:animations:completion:](self, "animateFadeWithDelay:animations:completion:", v18, 0, 0.0, v20, v21, v22, v23, v24, v25);
  else
    (*((void (**)(void *))v18 + 2))(v18);

}

- (void)sourceViewDidUpdateFromTraitCollection:(id)a3
{
  -[_UIEditMenuContentPresentation setUserInterfaceStyle:](self, "setUserInterfaceStyle:", -[_UIEditMenuPresentation resolvedUserInterfaceStyle](self, "resolvedUserInterfaceStyle", a3));
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v4;

  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[_UIEditMenuContentPresentation containerView](self, "containerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", a3);

  }
}

- (void)_updateMenuPositionAnimated:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  _BOOL4 v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v26 = 1;
    -[_UIEditMenuContentPresentation _queryMenuSourceRectForConfiguration:isValid:](self, "_queryMenuSourceRectForConfiguration:isValid:", v7, &v26);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if (v26)
    {
      -[_UIEditMenuContentPresentation currentMenuLayout](self, "currentMenuLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "menuSourceRect");
      v34.origin.x = v17;
      v34.origin.y = v18;
      v34.size.width = v19;
      v34.size.height = v20;
      v32.origin.x = v9;
      v32.origin.y = v11;
      v32.size.width = v13;
      v32.size.height = v15;
      v21 = CGRectEqualToRect(v32, v34);

      if (a4 || !v21)
        -[_UIEditMenuContentPresentation _reloadMenuLayoutWithSourceRect:animated:](self, "_reloadMenuLayoutWithSourceRect:animated:", v5, v9, v11, v13, v15);
    }
    else
    {
      v22 = _updateMenuPositionAnimated_forced____s_category;
      if (!_updateMenuPositionAnimated_forced____s_category)
      {
        v22 = __UILogCategoryGetNode("EditMenuInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&_updateMenuPositionAnimated_forced____s_category);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        v33.origin.x = v9;
        v33.origin.y = v11;
        v33.size.width = v13;
        v33.size.height = v15;
        NSStringFromCGRect(v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v7;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) has an invalid target rect (%@); ignoring update.",
          buf,
          0x16u);

      }
    }
  }

}

- (id)_resolvedLayoutForMenuWithConfiguration:(id)a3 sourceRect:(CGRect)a4 axis:(int64_t)a5
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double height;
  uint64_t v37;
  double v38;
  double v39;
  CGFloat MidX;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  void *v83;
  void *v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  double MaxY;
  double v99;
  double v100;
  int v102;
  double v103;
  double v104;
  double v105;
  double MinY;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  BOOL v148;
  void *v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  void *v155;
  void *v156;
  int64_t v157;
  double v158;
  CGFloat v159;
  double MaxX;
  double v161;
  double v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  double rect;
  CGFloat v171;
  double v172;
  double v173;
  CGFloat v174;
  double v175;
  double r2;
  CGFloat r2a;
  CGFloat r2b;
  double r2_8;
  double r2_8a;
  double r2_16;
  double r2_24;
  double v183;
  __int128 v184;
  double v185;
  double v186;
  CGFloat v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  double v193;
  double MidY;
  uint64_t v195;
  _BYTE v196[128];
  uint64_t v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;

  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v197 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuContentPresentation.m"), 578, CFSTR("Cannot resolve the menu layout without a list view."));

  }
  v164 = y;
  v165 = x;
  v163 = width;
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuContentPresentation.m"), 579, CFSTR("Cannot resolve the menu layout without a source view to the edit menu."));

  }
  v14 = objc_msgSend(v11, "preferredArrowDirection") - 3;
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v15);
  v17 = v16;

  -[_UIEditMenuContentPresentation _preferredContentInsetsForContainerViewWithConfiguration:](self, "_preferredContentInsetsForContainerViewWithConfiguration:", v11);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v21 + v27;
  v30 = v19 + v29;
  v32 = v31 - (v21 + v25);
  v34 = v33 - (v19 + v23);

  v198.origin.x = v28;
  v198.origin.y = v30;
  v198.size.width = v32;
  v198.size.height = v34;
  v199 = CGRectInset(v198, v17, 0.0);
  v183 = v199.origin.y;
  v185 = v199.origin.x;
  v35 = v199.size.width;
  height = v199.size.height;
  v37 = objc_msgSend(v11, "preferredArrowDirection");
  v195 = v37;
  v38 = v164;
  v200.origin.x = v165;
  v200.origin.y = v164;
  v39 = v163;
  v200.size.width = v163;
  v200.size.height = rect;
  MidX = CGRectGetMidX(v200);
  v201.origin.x = v165;
  v201.origin.y = v164;
  v201.size.width = v163;
  v201.size.height = rect;
  v193 = MidX;
  MidY = CGRectGetMidY(v201);
  __asm { FMOV            V0.2D, #0.5 }
  v192 = _Q0;
  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  r2_16 = height;
  r2_24 = v35;
  objc_msgSend(v45, "intrinsicContentSizeForContainer:containerSize:", v46, v35, height);
  v48 = v47;
  v50 = v49;

  -[_UIEditMenuContentPresentation currentListView](self, "currentListView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "arrowSizeForDirection:", v37);
  v53 = v52;
  v55 = v54;

  v56 = -0.0;
  if (v14 >= 2)
    v57 = v55;
  else
    v57 = -0.0;
  v58 = v50 + v57;
  if (v14 < 2)
    v56 = v53;
  if (v37)
  {
    v59 = v165;
  }
  else
  {
    r2 = v56;
    r2_8 = v48;
    v186 = v58;
    v60 = v58 + 6.0;
    if (objc_msgSend(v11, "_prefersMenuPresentationInView"))
    {
      v61 = v60;
      v62 = v60 * 5.0;
      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bounds");
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v72 = v71;
      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_window");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "convertRect:toView:", v74, v66, v68, v70, v72);
      v76 = v75;
      v78 = v77;
      v80 = v79;
      v82 = v81;

      -[_UIEditMenuPresentation sourceView](self, "sourceView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_window");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "bounds");
      v239.origin.x = v85;
      v239.origin.y = v86;
      v239.size.width = v87;
      v239.size.height = v88;
      v202.origin.x = v76;
      v202.origin.y = v78;
      v202.size.width = v80;
      v202.size.height = v82;
      v203 = CGRectIntersection(v202, v239);
      v89 = v203.origin.x;
      v90 = v203.origin.y;
      v91 = v203.size.width;
      v92 = v203.size.height;

      -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v89, v90, v91, v92);
      if (v96 > v62)
      {
        v240.origin.x = v93;
        v240.origin.y = v94;
        v240.size.width = v95;
        v240.size.height = v96;
        v204.origin.y = v183;
        v204.origin.x = v185;
        v204.size.height = r2_16;
        v204.size.width = r2_24;
        v205 = CGRectIntersection(v204, v240);
        v183 = v205.origin.y;
        v185 = v205.origin.x;
        r2_16 = v205.size.height;
        r2_24 = v205.size.width;
      }
      v39 = v163;
      v59 = v165;
      v60 = v61;
    }
    else
    {
      v59 = v165;
    }
    v206.origin.x = v185;
    v206.origin.y = v183;
    v206.size.width = r2_24;
    v206.size.height = r2_16;
    v97 = v60 + CGRectGetMinY(v206);
    v207.origin.x = v185;
    v207.origin.y = v183;
    v207.size.width = r2_24;
    v207.size.height = r2_16;
    MaxY = CGRectGetMaxY(v207);
    if (a5)
    {
      v99 = MaxY - v60;
      v208.origin.x = v59;
      v38 = v164;
      v208.origin.y = v164;
      v208.size.width = v39;
      v208.size.height = rect;
      v100 = v97 - CGRectGetMinY(v208);
      v209.origin.x = v59;
      v209.origin.y = v164;
      v209.size.width = v39;
      v209.size.height = rect;
      _NF = CGRectGetMaxY(v209) - v99 < v100;
    }
    else
    {
      v210.origin.x = v59;
      v38 = v164;
      v210.origin.y = v164;
      v210.size.width = v39;
      v210.size.height = rect;
      _NF = CGRectGetMinY(v210) < v97;
    }
    v102 = _NF;
    v56 = r2;
    v48 = r2_8;
    if (v102)
      v37 = 1;
    else
      v37 = 2;
    v195 = v37;
    v58 = v186;
  }
  v103 = v48 + v56;
  if (a5)
  {
    if (v37 == 2)
    {
      v213.origin.x = v59;
      v213.origin.y = v38;
      v213.size.width = v39;
      v213.size.height = rect;
      v105 = v58;
      MinY = CGRectGetMinY(v213);
      v214.origin.y = v183;
      v214.origin.x = v185;
      v214.size.height = r2_16;
      v214.size.width = r2_24;
      v107 = CGRectGetMinY(v214);
    }
    else
    {
      v104 = v58;
      if (v37 != 1)
      {
LABEL_33:
        v58 = fmin(v58, fmax(v58 * 0.5, v104));
        goto LABEL_34;
      }
      v211.origin.y = v183;
      v211.origin.x = v185;
      v211.size.height = r2_16;
      v211.size.width = r2_24;
      v105 = v58;
      MinY = CGRectGetMaxY(v211);
      v212.origin.x = v59;
      v212.origin.y = v38;
      v212.size.width = v39;
      v212.size.height = rect;
      v107 = CGRectGetMaxY(v212);
    }
    v108 = MinY - v107;
    v58 = v105;
    v104 = v108 + -6.0;
    goto LABEL_33;
  }
LABEL_34:
  v175 = v103;
  -[_UIEditMenuContentPresentation _resolvedMenuPositionForArrowDirection:availableBounds:sourceRect:menuSize:menuPosition:anchorPoint:](self, "_resolvedMenuPositionForArrowDirection:availableBounds:sourceRect:menuSize:menuPosition:anchorPoint:", &v195, &v193, &v192, v185, v183, r2_24, r2_16, v59, v38, v39, rect, *(_QWORD *)&v103, *(_QWORD *)&v58);
  v215.origin.x = v185;
  v215.origin.y = v183;
  v215.size.width = r2_24;
  v215.size.height = r2_16;
  r2_8a = CGRectGetMinX(v215);
  v216.origin.x = v185;
  v216.origin.y = v183;
  v216.size.width = r2_24;
  v216.size.height = r2_16;
  v162 = CGRectGetMinY(v216);
  v217.origin.x = v185;
  v217.origin.y = v183;
  v217.size.width = r2_24;
  v217.size.height = r2_16;
  MaxX = CGRectGetMaxX(v217);
  v218.origin.x = v185;
  v218.origin.y = v183;
  v109 = v103;
  v218.size.width = r2_24;
  v218.size.height = r2_16;
  v110 = CGRectGetMaxY(v218);
  v111 = v193 - v109 * *(double *)&v192;
  v112 = MidY - v58 * *((double *)&v192 + 1);
  v161 = v109 + v111;
  -[_UIEditMenuContentPresentation _queryMenuSourceRectsPreferredLayoutRectsForConfiguration:](self, "_queryMenuSourceRectsPreferredLayoutRectsForConfiguration:", v11);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v113;
  v187 = v58;
  if (v14 >= 2 && v113)
  {
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v115 = v113;
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v188, v196, 16);
    if (v116)
    {
      v117 = v116;
      v171 = v111;
      v158 = v110;
      v174 = v112;
      v157 = a5;
      v118 = *(_QWORD *)v189;
LABEL_38:
      v119 = 0;
      while (1)
      {
        if (*(_QWORD *)v189 != v118)
          objc_enumerationMutation(v115);
        objc_msgSend(*(id *)(*((_QWORD *)&v188 + 1) + 8 * v119), "CGRectValue");
        v120 = v219.origin.x;
        v121 = v219.origin.y;
        v122 = v219.size.width;
        v123 = v219.size.height;
        v173 = CGRectGetMaxX(v219);
        v220.origin.y = v183;
        v220.origin.x = v185;
        v220.size.height = r2_16;
        v220.size.width = r2_24;
        v172 = CGRectGetMaxX(v220);
        r2a = v120;
        v221.origin.x = v120;
        v221.origin.y = v121;
        v221.size.width = v122;
        v221.size.height = v123;
        v241.origin.x = r2_8a;
        v241.origin.y = v112;
        v241.size.width = r2_24;
        v241.size.height = v58;
        v222 = CGRectIntersection(v221, v241);
        v223 = CGRectStandardize(v222);
        v124 = v223.origin.x;
        v125 = v223.origin.y;
        v126 = v223.size.width;
        v127 = v223.size.height;
        if (!CGRectIsNull(v223))
        {
          v224.origin.x = v171;
          v224.origin.y = v112;
          v224.size.width = v175;
          v224.size.height = v187;
          if (!CGRectIsNull(v224))
          {
            v225.origin.x = v124;
            v225.origin.y = v125;
            v225.size.width = v126;
            v225.size.height = v127;
            v226 = CGRectStandardize(v225);
            v168 = v226.origin.y;
            v169 = v226.origin.x;
            v166 = v226.size.height;
            v167 = v226.size.width;
            v226.origin.x = v171;
            v226.origin.y = v112;
            v226.size.width = v175;
            v226.size.height = v187;
            v227 = CGRectStandardize(v226);
            v242 = CGRectInset(v227, 0.0001, 0.0001);
            v228.origin.y = v168;
            v228.origin.x = v169;
            v228.size.height = v166;
            v228.size.width = v167;
            if (CGRectContainsRect(v228, v242))
            {
              v109 = v175;
              v39 = v163;
              v38 = v164;
              v59 = v165;
              a5 = v157;
              v58 = v187;
LABEL_56:
              v110 = v158;
              v111 = v171;
              goto LABEL_57;
            }
          }
        }
        v229.origin.x = v124;
        v229.origin.y = v125;
        v229.size.width = v126;
        v229.size.height = v127;
        if (CGRectGetWidth(v229) > 180.0)
          break;
        ++v119;
        v58 = v187;
        if (v117 == v119)
        {
          v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v188, v196, 16);
          if (v117)
            goto LABEL_38;
          v109 = v175;
          v39 = v163;
          v38 = v164;
          v59 = v165;
          a5 = v157;
          goto LABEL_56;
        }
      }
      v230.origin.x = v124;
      v230.origin.y = v125;
      v230.size.width = v126;
      v230.size.height = v127;
      v128 = CGRectGetWidth(v230);
      if (v175 >= v128)
        v129 = v128;
      else
        v129 = v175;
      if (v173 <= v172)
      {
        v231.origin.x = r2a;
        v231.origin.y = v121;
        v231.size.width = v122;
        v231.size.height = v123;
        v130 = CGRectGetMaxX(v231) - v129;
        a5 = v157;
      }
      else
      {
        a5 = v157;
        v130 = r2a;
      }
      v109 = v129;
      r2b = v130;
      v161 = v129 + v130;
      v232.origin.x = v124;
      v232.origin.y = v125;
      v232.size.width = v126;
      v232.size.height = v127;
      r2_8a = CGRectGetMinX(v232);
      v233.origin.x = v124;
      v233.origin.y = v125;
      v233.size.width = v126;
      v233.size.height = v127;
      v162 = CGRectGetMinY(v233);
      v234.origin.x = v124;
      v234.origin.y = v125;
      v234.size.width = v126;
      v234.size.height = v127;
      MaxX = CGRectGetMaxX(v234);
      v235.origin.x = v124;
      v235.origin.y = v125;
      v235.size.width = v126;
      v235.size.height = v127;
      v159 = CGRectGetMaxY(v235);
      v184 = v192;
      v236.origin.x = v171;
      v112 = v174;
      v236.size.width = v175;
      v236.origin.y = v174;
      v236.size.height = v187;
      v237 = CGRectStandardize(v236);
      v131 = v237.origin.x;
      v132 = v237.origin.y;
      v133 = v237.size.width;
      v134 = v237.size.height;
      v237.origin.x = r2b;
      v237.origin.y = v174;
      v237.size.width = v109;
      v237.size.height = v187;
      v238 = CGRectStandardize(v237);
      v135 = *(double *)&v184 * v133;
      v110 = v159;
      v136 = v131 + v135;
      v58 = v187;
      *(double *)&v192 = (v136 - v238.origin.x) / v238.size.width;
      *((double *)&v192 + 1) = (v132 + *((double *)&v184 + 1) * v134 - v238.origin.y) / v238.size.height;
      v111 = r2b;
      v39 = v163;
      v38 = v164;
      v59 = v165;
    }
LABEL_57:

  }
  if (v111 >= r2_8a)
  {
    if (v161 <= MaxX)
      goto LABEL_69;
    v140 = fmax(v109 - (v161 - MaxX), 180.0);
    v141 = v140 - v109;
    if (v14 < 2)
      v109 = v140;
    else
      v141 = -0.0;
    v139 = (v161 - MaxX + v141) / v109 + *(double *)&v192;
  }
  else
  {
    v137 = fmax(v109 - (r2_8a - v111), 180.0);
    v138 = v137 - v109;
    if (v14 < 2)
      v109 = v137;
    else
      v138 = -0.0;
    v139 = *(double *)&v192 - (r2_8a - v111 + v138) / v109;
  }
  *(double *)&v192 = v139;
LABEL_69:
  if (v112 >= v162)
  {
    if (v58 + v112 <= v110)
      goto LABEL_74;
    v142 = (v58 + v112 - v110) / v58 + *((double *)&v192 + 1);
  }
  else
  {
    v142 = *((double *)&v192 + 1) - (v162 - v112) / v58;
  }
  *((double *)&v192 + 1) = v142;
LABEL_74:
  if (v14 >= 2)
  {
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "traitCollection");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuListView minimumRequiredWidthForArrowInRoundedListViewForAxis:traitCollection:](_UIEditMenuListView, "minimumRequiredWidthForArrowInRoundedListViewForAxis:traitCollection:", a5, v144);
    v146 = v145 / v109;

    if (*(double *)&v192 >= v146)
    {
      v147 = 1.0 - v146;
      v148 = *(double *)&v192 <= 1.0 - v146;
      v58 = v187;
      if (!v148)
      {
        v193 = v109 * (v147 - *(double *)&v192) + v193;
        *(double *)&v192 = v147;
      }
    }
    else
    {
      v193 = v109 * (v146 - *(double *)&v192) + v193;
      *(double *)&v192 = v146;
      v58 = v187;
    }
  }
  v149 = (void *)objc_opt_new();
  objc_msgSend(v149, "setContainerBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v109, v58);
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v193;
  v152 = MidY;
  objc_msgSend(v150, "_currentScreenScale");
  objc_msgSend(v149, "setMenuPosition:", UIPointRoundToScale(v151, v152, v153));

  objc_msgSend(v149, "setAnchorPoint:", v192);
  objc_msgSend(v149, "setArrowDirection:", v195);
  objc_msgSend(v149, "setMenuSourceRect:", v59, v38, v39, rect);

  return v149;
}

- (UIEdgeInsets)_preferredContentInsetsForContainerViewWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat rect;
  CGRect v33;
  CGRect v34;
  UIEdgeInsets result;

  v4 = a3;
  -[_UIEditMenuContentPresentation containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "_isRemoteKeyboardWindow") & 1) != 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v15 = objc_msgSend(v4, "_ignoresKeyboardAvoidance");

  if ((v15 & 1) == 0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isOnScreen"))
    {
      objc_msgSend(v5, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_isTextEffectsWindow");

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v14, "visibleInputViewFrameInView:", v5);
        rect = v18;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v5, "bounds");
        MaxY = CGRectGetMaxY(v33);
        v34.origin.x = rect;
        v34.origin.y = v20;
        v34.size.width = v22;
        v34.size.height = v24;
        v26 = fmax(MaxY - CGRectGetMinY(v34), 0.0);
      }
      else
      {
        objc_msgSend(v14, "verticalOverlapForView:usingKeyboardInfo:", v5, 0);
      }
      v27 = v26 + 6.0;
      if (v11 < v27)
        v11 = v27;
    }
    goto LABEL_9;
  }
LABEL_10:

  v28 = v7;
  v29 = v9;
  v30 = v11;
  v31 = v13;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (void)_resolvedMenuPositionForArrowDirection:(int64_t *)a3 availableBounds:(CGRect)a4 sourceRect:(CGRect)a5 menuSize:(CGSize)a6 menuPosition:(CGPoint *)a7 anchorPoint:(CGPoint *)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  int64_t v19;
  double MaxX;
  CGFloat v21;
  double v22;
  double MinX;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  CGFloat v37;
  double MaxY;
  CGFloat v39;
  double v40;
  double v41;
  double MinY;
  double v43;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  CGFloat r1;
  id v62;
  double v63;
  double v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  height = a6.height;
  width = a6.width;
  v11 = a5.size.height;
  v12 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  v19 = *a3;
  r1 = a4.size.height;
  if ((unint64_t)(*a3 - 3) <= 1)
  {
    MaxX = CGRectGetMaxX(a4);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = v12;
    v65.size.height = v11;
    v21 = CGRectGetMaxX(v65);
    v66.size.width = v12;
    v66.size.height = v11;
    v22 = MaxX - v21 + -6.0;
    v66.origin.x = x;
    v66.origin.y = y;
    MinX = CGRectGetMinX(v66);
    v67.origin.x = v17;
    v67.origin.y = v16;
    v67.size.width = v15;
    v67.size.height = r1;
    v24 = MinX - CGRectGetMinX(v67) + -6.0;
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v25, "_userInterfaceIdiom"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "horizontalMenuMaximumWidth");
    v28 = v27 * 0.35;

    if ((v19 != 3 || (v63 > v22 ? (v29 = v22 < v28) : (v29 = 0), v29 ? (v30 = v24 <= v22) : (v30 = 1), v30))
      && (v19 != 4 || (v63 > v24 ? (v31 = v24 < v28) : (v31 = 0), v31 ? (v32 = v24 <= v22) : (v32 = 0), v32)))
    {
      *a3 = 3;
      **(_QWORD **)&height = 0;
      v52 = CGRectGetMaxX(a5);
      v74.origin.x = v17;
      v74.origin.y = v16;
      v74.size.width = v15;
      v74.size.height = r1;
      v34 = fmin(v52, CGRectGetMaxX(v74));
      v35 = 6.0;
    }
    else
    {
      *a3 = 4;
      **(_QWORD **)&height = 0x3FF0000000000000;
      v33 = CGRectGetMinX(a5);
      v68.origin.x = v17;
      v68.origin.y = v16;
      v68.size.width = v15;
      v68.size.height = r1;
      v34 = fmax(v33, CGRectGetMinX(v68));
      v35 = -6.0;
    }
    **(double **)&width = v34 + v35;
    return;
  }
  v59 = a4.size.width;
  v37 = a4.size.height;
  MaxY = CGRectGetMaxY(a4);
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = v12;
  v69.size.height = v11;
  v39 = CGRectGetMaxY(v69);
  v70.size.height = v11;
  v40 = -6.0;
  v70.size.width = v12;
  v41 = MaxY - v39 + -6.0;
  v70.origin.x = x;
  v70.origin.y = y;
  MinY = CGRectGetMinY(v70);
  v71.origin.x = v17;
  v71.origin.y = v16;
  v71.size.width = v59;
  v71.size.height = v37;
  v43 = MinY - CGRectGetMinY(v71) + -6.0;
  if (v19 == 1 && v64 > v41 && v43 > v41)
    goto LABEL_33;
  if (v19 == 2)
  {
    if (v64 <= v43 || v43 > v41)
    {
LABEL_33:
      *a3 = 2;
      *(_QWORD *)(*(_QWORD *)&height + 8) = 0x3FF0000000000000;
      v72.origin.x = v17;
      v72.origin.y = v16;
      v72.size.width = v59;
      v72.size.height = v37;
      v47 = v64 + CGRectGetMinY(v72) + 6.0;
      v73.origin.x = v17;
      v73.origin.y = v16;
      v73.size.width = v59;
      v73.size.height = v37;
      v48 = CGRectGetMaxY(v73) + 6.0;
      v49 = a5.origin.x;
      v50 = a5.origin.y;
      v51 = CGRectGetMinY(a5);
      goto LABEL_40;
    }
    *a3 = 1;
  }
  else
  {
    *a3 = v19;
    if (v19 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v43);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuContentPresentation.m"), 867, CFSTR("Failed to resolve undefined UIEditMenuArrowDirection: %ld"), v19);

      return;
    }
  }
  *(_QWORD *)(*(_QWORD *)&height + 8) = 0;
  v75.origin.x = v17;
  v75.origin.y = v16;
  v75.size.width = v59;
  v75.size.height = v37;
  v47 = CGRectGetMinY(v75) + -6.0;
  v76.origin.x = v17;
  v76.origin.y = v16;
  v76.size.width = v59;
  v76.size.height = v37;
  v48 = CGRectGetMaxY(v76) - v64 + -6.0;
  v49 = a5.origin.x;
  v50 = a5.origin.y;
  v51 = CGRectGetMaxY(a5);
  v40 = 6.0;
LABEL_40:
  v58 = v47;
  v53 = fmax(v47, fmin(v51, v48));
  if (v53 == v51)
  {
    *(double *)(*(_QWORD *)&width + 8) = v51 + v40;
  }
  else
  {
    v77.origin.x = v17;
    v77.origin.y = v16;
    v77.size.width = v59;
    v77.size.height = r1;
    v80.origin.x = v49;
    v80.origin.y = v50;
    v80.size.width = a5.size.width;
    v80.size.height = a5.size.height;
    v78 = CGRectIntersection(v77, v80);
    v54 = v78.origin.x;
    v55 = v78.origin.y;
    v56 = v78.size.width;
    v57 = v78.size.height;
    if (!CGRectIsNull(v78))
    {
      v79.origin.x = v54;
      v79.origin.y = v55;
      v79.size.width = v56;
      v79.size.height = v57;
      v53 = fmax(v58, fmin(CGRectGetMidY(v79), v48));
    }
    *(double *)(*(_QWORD *)&width + 8) = v53;
  }
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (_UIEditMenuListView)currentListView
{
  return self->_currentListView;
}

- (_UIEditMenuPresentationLayout)currentMenuLayout
{
  return self->_currentMenuLayout;
}

- (void)setCurrentMenuLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentMenuLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMenuLayout, 0);
  objc_storeStrong((id *)&self->_currentListView, 0);
}

@end
