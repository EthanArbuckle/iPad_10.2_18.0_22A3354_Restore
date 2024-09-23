@implementation _UIContextMenuStackedHierarchyLayout

- (_UIContextMenuStackedHierarchyLayout)initWithMenuView:(id)a3
{
  id v4;
  _UIContextMenuStackedHierarchyLayout *v5;
  _UIContextMenuStackedHierarchyLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuStackedHierarchyLayout;
  v5 = -[_UIContextMenuStackedHierarchyLayout init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIContextMenuStackedHierarchyLayout setMenuView:](v5, "setMenuView:", v4);

  return v6;
}

- (CGSize)encompassingSize
{
  __int128 v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  CGSize result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x4010000000;
  v13 = &unk_18685B0AF;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *MEMORY[0x1E0C9D628];
  v15 = v2;
  -[_UIContextMenuStackedHierarchyLayout menuView](self, "menuView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submenus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56___UIContextMenuStackedHierarchyLayout_encompassingSize__block_invoke;
  v9[3] = &unk_1E16D6820;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateNodes:", v9);

  v5 = v11[6];
  v6 = v11[7];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v29[3];
  uint64_t v30;

  height = a4.height;
  width = a4.width;
  -[_UIContextMenuStackedHierarchyLayout menuView](self, "menuView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  objc_msgSend(v8, "submenus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") - 1;

  v30 = v11;
  objc_msgSend(v8, "bounds");
  v13 = v12;
  v15 = v14;
  -[_UIContextMenuStackedHierarchyLayout _metrics](self, "_metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submenus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __107___UIContextMenuStackedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke;
  v20[3] = &unk_1E16D6848;
  v28 = a3;
  v24 = width;
  v25 = height;
  v18 = v8;
  v21 = v18;
  v23 = v29;
  v26 = v13;
  v27 = v15;
  v19 = v16;
  v22 = v19;
  objc_msgSend(v17, "enumerateNodes:", v20);

  _Block_object_dispose(v29, 8);
}

- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  char v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[4];
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  __int128 v59;
  __int128 v60;

  v10 = a3;
  v11 = a4;
  v32 = a5;
  v12 = a6;
  -[_UIContextMenuStackedHierarchyLayout menuView](self, "menuView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "listView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayedMenu");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cellForElement:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setUserInteractionEnabled:", 0);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x4010000000;
  v58[3] = &unk_18685B0AF;
  v59 = 0u;
  v60 = 0u;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x4010000000;
  v55[3] = &unk_18685B0AF;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v15, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  if (!v18)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke;
    v47[3] = &unk_1E16D6870;
    v48 = v13;
    v49 = v15;
    v50 = v17;
    v53 = v58;
    v51 = v11;
    v54 = v55;
    v52 = v14;
    +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v47);

  }
  v30 = v12;
  v31 = v10;
  v20 = objc_msgSend(v13, "retainHighlightOnMenuNavigation");
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v19;
  v42[1] = 3221225472;
  v42[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  v42[3] = &unk_1E16B4030;
  v46 = v20;
  v22 = v14;
  v43 = v22;
  v44 = v15;
  v23 = v17;
  v45 = v23;
  v40[0] = v19;
  v40[1] = 3221225472;
  v40[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v40[3] = &unk_1E16B2588;
  v24 = v44;
  v41 = v24;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v21, 0, v42, v40);

  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.85, 0.4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  v33[3] = &unk_1E16D6898;
  v26 = v22;
  v34 = v26;
  v27 = v32;
  v37 = v27;
  v28 = v13;
  v35 = v28;
  v38 = v58;
  v39 = v55;
  v29 = v24;
  v36 = v29;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v25, 0, v33, 0);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v58, 8);

}

- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  char v38;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[_UIContextMenuStackedHierarchyLayout menuView](self, "menuView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "listView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = objc_msgSend(v14, "retainHighlightOnMenuNavigation");
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v35[3] = &unk_1E16B4008;
  v19 = v15;
  v36 = v19;
  v38 = (char)v12;
  v37 = v16;
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v33[3] = &unk_1E16B2588;
  v20 = v37;
  v34 = v20;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v17, 0, v35, v33);

  if ((_DWORD)v12)
  {
    objc_msgSend(v19, "displayedMenu");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "indexPathForElement:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "highlightItemAtIndexPath:", v22);
  }
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v28[3] = &unk_1E16D68C0;
  v29 = v20;
  v30 = v14;
  v31 = v19;
  v32 = v10;
  v24 = v19;
  v25 = v14;
  v26 = v10;
  v27 = v20;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v23, 0, v28, v11);

}

- (id)_metrics
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuStackedHierarchyLayout menuView](self, "menuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UIContextMenuView)menuView
{
  return (_UIContextMenuView *)objc_loadWeakRetained((id *)&self->_menuView);
}

- (void)setMenuView:(id)a3
{
  objc_storeWeak((id *)&self->_menuView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuView);
}

@end
