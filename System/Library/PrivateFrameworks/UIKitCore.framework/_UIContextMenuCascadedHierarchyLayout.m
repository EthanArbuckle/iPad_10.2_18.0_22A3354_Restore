@implementation _UIContextMenuCascadedHierarchyLayout

- (_UIContextMenuCascadedHierarchyLayout)initWithMenuView:(id)a3
{
  id v4;
  _UIContextMenuCascadedHierarchyLayout *v5;
  _UIContextMenuCascadedHierarchyLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuCascadedHierarchyLayout;
  v5 = -[_UIContextMenuCascadedHierarchyLayout init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIContextMenuCascadedHierarchyLayout setMenuView:](v5, "setMenuView:", v4);

  return v6;
}

- (CGSize)encompassingSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submenus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _UIContextMenuCascadedHierarchyLayout *v13;
  _QWORD *v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  _QWORD v18[4];

  height = a4.height;
  width = a4.width;
  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  objc_msgSend(v8, "submenus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke;
  v11[3] = &unk_1E16DFFE0;
  v10 = v8;
  v12 = v10;
  v13 = self;
  v17 = a3;
  v15 = width;
  v16 = height;
  v14 = v18;
  objc_msgSend(v9, "enumerateNodes:", v11);

  _Block_object_dispose(v18, 8);
}

- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _UIContextMenuCascadedHierarchyLayout *v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v26 = a5;
  v12 = a6;
  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v36[3] = &unk_1E16B6F18;
  v16 = v13;
  v37 = v16;
  v17 = v14;
  v38 = v17;
  v39 = v11;
  v40 = self;
  v41 = v10;
  v27 = v10;
  v18 = v11;
  +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v36);
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v34[3] = &unk_1E16B1B28;
  v20 = v17;
  v35 = v20;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v19, 0, v34, 0);

  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.85, 0.32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  v31[3] = &unk_1E16B46D0;
  v32 = v16;
  v33 = v26;
  v31[4] = self;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7;
  v28[3] = &unk_1E16E0030;
  v29 = v20;
  v30 = v12;
  v22 = v12;
  v23 = v20;
  v24 = v16;
  v25 = v26;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v21, 0, v31, v28);

}

- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v14[3] = &unk_1E16B1D18;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v11, 0, v14, v10);

}

- (id)_metrics
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_cascadingAreaBounds
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect result;

  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAvoidInputViews");
  v7 = v4;
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "verticalSizeClass");

  v18 = 0.0;
  if (v17 == 1)
    v19 = v15;
  else
    v19 = v15 + 0.0;
  if (v17 == 1)
  {
    v20 = v9;
  }
  else
  {
    v13 = v13 + 20.0;
    v11 = v11 + 0.0;
    v20 = v9 + 20.0;
  }
  v21 = _UIContextMenuDefaultContentSpacing(v7);
  v22 = fmax(v13, 20.0);
  if (v6)
  {
    v23 = v7;
    objc_msgSend(v23, "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_isRemoteInputHostWindow");

    if ((v25 & 1) == 0)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "verticalOverlapForView:usingKeyboardInfo:", v23, 0);
        v29 = v28;
        objc_msgSend(v23, "traitCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _UIContextMenuGetPlatformMetrics(objc_msgSend(v30, "userInterfaceIdiom"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "minimumContainerInsets");
        v33 = v32;

        v18 = v29 + v33;
      }

    }
    if (v22 < v18)
      v22 = v18;
  }
  v34 = fmax(v19, v21);
  v35 = fmax(v11, v21);
  v36 = fmax(v20, 20.0);

  objc_msgSend(v7, "bounds");
  v38 = v35 + v37;
  v40 = v36 + v39;
  v42 = v41 - (v35 + v34);
  v44 = v43 - (v36 + v22);
  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:toView:", v45, v38, v40, v42, v44);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  v54 = v47;
  v55 = v49;
  v56 = v51;
  v57 = v53;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (CAPoint3D)_submenuOffsetForCascadingLeft:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CAPoint3D result;

  v3 = a3;
  -[_UIContextMenuCascadedHierarchyLayout _metrics](self, "_metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCascadedHierarchyLayout menuView](self, "menuView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");

  if (!v3)
  {
    if (!v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v5, "leadingCascadedSubmenuOffset");
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "trailingCascadedSubmenuOffset");
LABEL_6:
  v11 = v8;
  v12 = v9;
  v13 = v10;

  v14 = v11;
  v15 = v12;
  v16 = v13;
  result.z = v16;
  result.y = v15;
  result.x = v14;
  return result;
}

- (_UIContextMenuView)menuView
{
  return (_UIContextMenuView *)objc_loadWeakRetained((id *)&self->_menuView);
}

- (void)setMenuView:(id)a3
{
  objc_storeWeak((id *)&self->_menuView, a3);
}

- (BOOL)isAnimatingMenuAddition
{
  return self->_isAnimatingMenuAddition;
}

- (void)setIsAnimatingMenuAddition:(BOOL)a3
{
  self->_isAnimatingMenuAddition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuView);
}

@end
