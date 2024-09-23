@implementation UITabContainerView

void __37___UITabContainerView_floatingTabBar__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id *WeakRetained;
  id v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v10 = objc_loadWeakRetained(WeakRetained + 79);
    objc_msgSend(v10, "tabBarContainerDidLayoutFloatingTabBar:", v11);

    objc_msgSend(v11, "_updateSidebarContentMarginsWithTabBarContentFrame:", a2, a3, a4, a5);
    objc_msgSend(v11, "_updateFloatingTabBarFrame");
    WeakRetained = v11;
  }

}

void __74___UITabContainerView__updateSidebarContentMarginsWithTabBarContentFrame___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "outlineView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setAdditionalEditingInsets:]((uint64_t)v5, v1, v2, v3, v4);

}

void __43___UITabContainerView__sidebarToggleAction__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sidebar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isHidden");

  objc_msgSend(WeakRetained, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarControllerSidebar _setHidden:userInitiated:]((uint64_t)v3, v2 ^ 1, 1);

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained[52], "removeFromSuperview");
    v2 = v11[52];
    v11[52] = 0;

    v3 = v11[53];
    v11[53] = 0;

    v4 = v11[54];
    v11[54] = 0;

    v5 = v11[55];
    v11[55] = 0;

    v6 = v11[56];
    v11[56] = 0;

    objc_msgSend(v11, "outlineView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    objc_msgSend(v11, "floatingTabBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    objc_msgSend(v11, "floatingTabBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionDidEnd");

    objc_msgSend(v11, "outlineView");
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v10[419] = 0;

    objc_msgSend(v11, "_updateVisibleBarAnimated:", 0);
    WeakRetained = v11;
  }

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_25(uint64_t a1)
{
  _UITabSidebarTransitionAnimator *v2;
  uint64_t v3;
  _UITabSidebarTransitionAnimator *v4;
  _QWORD v5[4];
  id v6;
  _UITabSidebarTransitionAnimator *v7;
  id v8;
  _QWORD v9[5];
  _UITabSidebarTransitionAnimator *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "increment");
  v2 = -[_UITabSidebarTransitionAnimator initWithContainerView:duration:]([_UITabSidebarTransitionAnimator alloc], "initWithContainerView:duration:", *(_QWORD *)(a1 + 40), 0.5);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2;
  v9[3] = &unk_1E16B47A8;
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v2;
  v11 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3;
  v5[3] = &unk_1E16B2B40;
  v6 = *(id *)(a1 + 48);
  v7 = v10;
  v8 = *(id *)(a1 + 32);
  v4 = v10;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v9, v5, 0.5, 0.0, 1.0, 0.0);

}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(a1[4], "floatingTabBarHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarContainerWillChangeFloatingTabBarVisibility:", a1[4]);

  objc_msgSend(a1[4], "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:", a1[5]);

  objc_msgSend(a1[6], "runAnimations");
  return objc_msgSend(a1[5], "runAnimations");
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3(id *a1)
{
  objc_msgSend(a1[4], "runCompletions");
  objc_msgSend(a1[5], "runCompletions");
  return objc_msgSend(a1[6], "complete");
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[19];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 483) = *(_BYTE *)(a1 + 352) ^ 1;
  objc_msgSend(*(id *)(a1 + 40), "increment");
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3254779904;
  v10[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_5;
  v10[3] = &unk_1E168B7B0;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v24 = *(_BYTE *)(a1 + 352);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v17, (id *)(a1 + 104));
  v4 = *(_OWORD *)(a1 + 304);
  v20 = *(_OWORD *)(a1 + 288);
  v5 = *(_OWORD *)(a1 + 272);
  v18 = *(_OWORD *)(a1 + 256);
  v19 = v5;
  v6 = *(_OWORD *)(a1 + 320);
  v7 = *(_OWORD *)(a1 + 336);
  v21 = v4;
  v22 = v6;
  v23 = v7;
  v14 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 80);
  v16 = *(id *)(a1 + 88);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_28;
  v8[3] = &unk_1E16B2588;
  v9 = *(id *)(a1 + 40);
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v2, 0, v10, v8);
  if (*(_BYTE *)(a1 + 353))
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[3];
  _OWORD v46[3];

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v26 = v3;
  v27 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "position");
  v14 = v13;
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 48), "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "position");
  v19 = v18;
  v21 = v20;

  if (*(_BYTE *)(a1 + 328))
  {
    v5 = *(_QWORD *)(a1 + 96);
    v9 = *(_QWORD *)(a1 + 112);
    v14 = *(_QWORD *)(a1 + 128);
    v22 = *(_OWORD *)(a1 + 248);
    v46[0] = *(_OWORD *)(a1 + 232);
    v46[1] = v22;
    v46[2] = *(_OWORD *)(a1 + 264);
    objc_msgSend(*(id *)(a1 + 48), "setTransform:", v46);
    v23 = *(_OWORD *)(a1 + 296);
    v45[0] = *(_OWORD *)(a1 + 280);
    v45[1] = v23;
    v45[2] = *(_OWORD *)(a1 + 312);
    objc_msgSend(*(id *)(a1 + 40), "setTransform:", v45);
    v19 = v14;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 104);
    v11 = *(_QWORD *)(a1 + 120);
    v16 = *(_QWORD *)(a1 + 136);
    v21 = v16;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_6;
  v28[3] = &unk_1E16E12C8;
  v29 = *(id *)(a1 + 32);
  v35 = v9;
  v36 = v11;
  v37 = v27;
  v38 = v26;
  v39 = v5;
  v40 = v7;
  v30 = *(id *)(a1 + 56);
  v31 = *(id *)(a1 + 64);
  v32 = *(id *)(a1 + 72);
  v33 = *(id *)(a1 + 40);
  v41 = v14;
  v42 = v16;
  v34 = *(id *)(a1 + 48);
  v43 = v19;
  v44 = v21;
  +[UIView _modifyAnimationsByDecomposingGeometricTypes:animations:](UIView, "_modifyAnimationsByDecomposingGeometricTypes:animations:", 1, v28);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setValue:forKeyPath:", &unk_1E1A96070, CFSTR("filters.gaussianBlur.inputRadius"));

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValue:forKeyPath:", &unk_1E1A96060, CFSTR("filters.gaussianBlur.inputRadius"));

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_6(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v2 = *(double *)(a1 + 128);
  v3 = *(double *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 64), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", v2, v3);

  v5 = *(double *)(a1 + 144);
  v6 = *(double *)(a1 + 152);
  objc_msgSend(*(id *)(a1 + 72), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v5, v6);

}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_31(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50[19];
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76[19];
  CGRect v77;
  CGRect v78;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v40 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v41 = *MEMORY[0x1E0C9D538];
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", *(_QWORD *)(a1 + 40));
  v11 = v10;
  v13 = v12;
  if (*(_BYTE *)(a1 + 552))
    v14 = -[_UITabOutlineView sidebarButtonOrigin](*(void **)(a1 + 48));
  else
    objc_msgSend(*(id *)(a1 + 56), "sidebarButtonOrigin");
  v16 = v14;
  v17 = v15;
  if (!*(_BYTE *)(a1 + 552) && objc_msgSend(*(id *)(a1 + 40), "_isTabBarHidden"))
  {
    objc_msgSend(*(id *)(a1 + 56), "frame");
    v13 = v13 - CGRectGetMaxY(v77);
  }
  v42 = v13;
  objc_msgSend(*(id *)(a1 + 64), "bounds");
  if (!CGRectEqualToRect(v78, *(CGRect *)(a1 + 152)))
  {
    objc_msgSend(*(id *)(a1 + 72), "subviews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "bounds");
    v20 = v16;
    v21 = v7;
    v22 = v3;
    v24 = v23;
    v39 = v11;
    v25 = v17;
    v26 = v9;
    v27 = v5;
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 56), "sidebarButtonOrigin");
    v32 = v24;
    v3 = v22;
    v7 = v21;
    v16 = v20;
    v33 = v29;
    v5 = v27;
    v9 = v26;
    v17 = v25;
    v11 = v39;
    objc_msgSend(v19, "setFrame:", v41 - v30, v40 - v31, v32, v33);
    objc_msgSend(v19, "bounds");
    objc_msgSend(*(id *)(a1 + 72), "setBounds:");

  }
  objc_msgSend(*(id *)(a1 + 80), "increment");
  v34 = *(id *)(a1 + 448);
  v35 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3254779904;
  v53[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_32;
  v53[3] = &unk_1E168B820;
  v54 = *(id *)(a1 + 88);
  v62 = v11;
  v63 = v42;
  v64 = v3;
  v65 = v5;
  v66 = v7;
  v67 = v9;
  v55 = *(id *)(a1 + 96);
  v56 = *(id *)(a1 + 104);
  v57 = *(id *)(a1 + 112);
  v58 = *(id *)(a1 + 120);
  v68 = v16;
  v69 = v17;
  v59 = *(id *)(a1 + 72);
  v60 = *(id *)(a1 + 128);
  v36 = *(_OWORD *)(a1 + 472);
  v70 = *(_OWORD *)(a1 + 456);
  v71 = v36;
  v72 = *(_OWORD *)(a1 + 488);
  v61 = *(id *)(a1 + 136);
  v37 = *(_OWORD *)(a1 + 520);
  v73 = *(_OWORD *)(a1 + 504);
  v74 = v37;
  v75 = *(_OWORD *)(a1 + 536);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v76, (id *)(a1 + 304));
  v51[0] = v35;
  v51[1] = 3221225472;
  v51[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_35;
  v51[3] = &unk_1E16B2588;
  v52 = *(id *)(a1 + 80);
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v34, 0, v53, v51);
  objc_msgSend(*(id *)(a1 + 80), "increment");
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.8, 0.2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v35;
  v45[1] = 3254779904;
  v45[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_36;
  v45[3] = &unk_1E168B778;
  v46 = *(id *)(a1 + 88);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v50, (id *)(a1 + 304));
  v47 = *(id *)(a1 + 104);
  v48 = *(id *)(a1 + 112);
  v49 = *(id *)(a1 + 96);
  v43[0] = v35;
  v43[1] = 3221225472;
  v43[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_38;
  v43[3] = &unk_1E16B2588;
  v44 = *(id *)(a1 + 80);
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v38, 0, v45, v43);
  if (!*(_BYTE *)(a1 + 553))
    (*(void (**)(void))(*(_QWORD *)(a1 + 144) + 16))();

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_32(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v5[3];
  _OWORD v6[3];
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3_33;
  v7[3] = &unk_1E16E12F0;
  v8 = *(id *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 112);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = v2;
  v16 = *(_OWORD *)(a1 + 128);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 144);
  v13 = *(id *)(a1 + 72);
  +[UIView _modifyAnimationsByDecomposingGeometricTypes:animations:](UIView, "_modifyAnimationsByDecomposingGeometricTypes:animations:", 1, v7);
  v3 = *(_OWORD *)(a1 + 176);
  v6[0] = *(_OWORD *)(a1 + 160);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 192);
  objc_msgSend(*(id *)(a1 + 80), "setTransform:", v6);
  v4 = *(_OWORD *)(a1 + 224);
  v5[0] = *(_OWORD *)(a1 + 208);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 240);
  objc_msgSend(*(id *)(a1 + 88), "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 88), "setAlpha:", 1.0);
  -[_UIDuoShadowView setPrimaryShadow:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 320));
  -[_UIDuoShadowView setSecondaryShadow:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 328));

}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3_33(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v2 = *(double *)(a1 + 128);
  v3 = *(double *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 64), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", v2, v3);

  v5 = *(double *)(a1 + 128);
  v6 = *(double *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 72), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", v5, v6);

}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_36(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];
  _OWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[4];

  v2 = *(_OWORD *)(a1 + 160);
  v24[0] = *(_OWORD *)(a1 + 144);
  v24[1] = v2;
  v3 = *(_OWORD *)(a1 + 192);
  v24[2] = *(_OWORD *)(a1 + 176);
  v24[3] = v3;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadii:", v24);

  v5 = *(_OWORD *)(a1 + 160);
  v20 = *(_OWORD *)(a1 + 144);
  v21 = v5;
  v6 = *(_OWORD *)(a1 + 192);
  v22 = *(_OWORD *)(a1 + 176);
  v23 = v6;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v20;
  v19[1] = v21;
  v19[2] = v22;
  v19[3] = v23;
  objc_msgSend(v7, "setCornerRadii:", v19);

  v8 = *(_OWORD *)(a1 + 160);
  v15 = *(_OWORD *)(a1 + 144);
  v16 = v8;
  v9 = *(_OWORD *)(a1 + 192);
  v17 = *(_OWORD *)(a1 + 176);
  v18 = v9;
  objc_msgSend(*(id *)(a1 + 48), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  v14[3] = v18;
  objc_msgSend(v10, "setCornerRadii:", v14);

  v11 = *(_OWORD *)(a1 + 160);
  v13[0] = *(_OWORD *)(a1 + 144);
  v13[1] = v11;
  v12 = *(_OWORD *)(a1 + 192);
  v13[2] = *(_OWORD *)(a1 + 176);
  v13[3] = v12;
  -[_UIDuoShadowView setCornerRadii:](*(id **)(a1 + 56), v13);
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_40(id *a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "complete");
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id)*((_QWORD *)WeakRetained + 59);
    if (v3 == a1[5])
    {
      *((_QWORD *)WeakRetained + 59) = 0;

      v2 = WeakRetained;
    }
  }

}

uint64_t __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  const UIEdgeInsets *v4;

  if (*(_BYTE *)(a1 + 56))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 57))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v3);
  objc_msgSend(*(id *)(a1 + 40), "updateBarForEditingState");
  if (*(_BYTE *)(a1 + 58))
    v4 = (const UIEdgeInsets *)(*(_QWORD *)(a1 + 48) + 488);
  else
    v4 = &UIEdgeInsetsZero;
  return -[_UITabOutlineView setAdditionalEditingInsets:](*(_QWORD *)(a1 + 32), v4->top, v4->left, v4->bottom, v4->right);
}

uint64_t __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __49___UITabContainerView__configuredGroupCompletion__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[58];
  WeakRetained[58] = 0;

  objc_msgSend(WeakRetained, "_updateVisibleBarAnimated:", 0);
  objc_msgSend(WeakRetained, "_finalizeEditingState");

}

void __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UIBarButtonItem *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  if ((objc_msgSend(*(id *)(a1 + 32), "canShowFloatingUI") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648));
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "layoutIfNeeded");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 482) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 40), "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_updateOutlineViewFrame");
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 482) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 58))
  {
    objc_msgSend(*(id *)(a1 + 48), "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 632));
      objc_msgSend(WeakRetained, "tabBarContainerWillChangeFloatingTabBarVisibility:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_updateFloatingTabBarFrame");
      objc_msgSend(*(id *)(a1 + 48), "updateEditingStateIfNeeded");
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 482) = 1;
    }
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "_showsOverlaySidebarButton");
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v7 && *(_BYTE *)(v7 + 426))
    {
      *(_BYTE *)(v7 + 426) = 0;
      objc_msgSend(*(id *)(v7 + 512), "_setWantsHostedTabBarMetrics:", 0);
      objc_msgSend((id)v7, "setNeedsLayout");
    }
    v8 = *(_QWORD **)(a1 + 32);
    v9 = v8[69];
    if (!v9)
    {
      +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContentInsets:", 10.0, 8.0, 10.0, 8.0);
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v11);

      objc_msgSend(*(id *)(a1 + 32), "_sidebarToggleAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v10, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 552);
      *(_QWORD *)(v14 + 552) = v13;

      _UIBarsSetAccessibilityLimits(*(void **)(*(_QWORD *)(a1 + 32) + 552));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setPointerInteractionEnabled:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_updateOverlaySidebarButtonFrame");

      v8 = *(_QWORD **)(a1 + 32);
      v9 = v8[69];
    }
    objc_msgSend(v8, "addSubview:", v9);
    objc_msgSend(*(id *)(a1 + 32), "_updateOverlaySidebarButtonTintColor");
    objc_msgSend(*(id *)(a1 + 32), "tabModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setHidden:", objc_msgSend(v16, "isEditing"));

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 640);
    if (*(_BYTE *)(a1 + 57))
    {
      *(_QWORD *)(v17 + 640) = 0;
    }
    else
    {
      if (v18)
        goto LABEL_31;
      v23 = [UIBarButtonItem alloc];
      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[UIBarButtonItem initWithImage:menu:](v23, "initWithImage:menu:", v24, 0);
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(v26 + 640);
      *(_QWORD *)(v26 + 640) = v25;

      +[UIColor clearColor](UIColor, "clearColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setTintColor:", v18);
    }

LABEL_31:
    v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 632));
    objc_msgSend(v28, "tabBarContainerWillChangeFloatingTabBarVisibility:", *(_QWORD *)(a1 + 32));

    return;
  }
  if (v7 && !*(_BYTE *)(v7 + 426))
  {
    *(_BYTE *)(v7 + 426) = 1;
    objc_msgSend(*(id *)(v7 + 512), "_setWantsHostedTabBarMetrics:", 1);
    objc_msgSend((id)v7, "setNeedsLayout");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "removeFromSuperview");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 552);
  *(_QWORD *)(v19 + 552) = 0;

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 640);
  *(_QWORD *)(v21 + 640) = 0;

  if (v22)
    goto LABEL_31;
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  v2 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v2;
  v6[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "setAdditionalTransform:", v6);
  v3 = *(_OWORD *)(a1 + 120);
  v5[0] = *(_OWORD *)(a1 + 104);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 136);
  return objc_msgSend(*(id *)(a1 + 40), "setTransform:", v5);
}

void __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 464))
    {
      v11 = WeakRetained;
      v3 = objc_msgSend(WeakRetained, "_currentVisibleComponents");
      WeakRetained = v11;
      if (v3 == *(_QWORD *)(a1 + 64))
      {
        v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 482);
        if ((v3 & 2) != 0)
        {
          v6 = v4 != 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "superview");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v4 != 0;
          if (v5)
          {
            v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 632));
            objc_msgSend(v7, "tabBarContainerWillChangeFloatingTabBarVisibility:", v11);

            objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
            v6 = 1;
          }
        }
        if ((v3 & 4) == 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "superview");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
            v6 = 1;
          }
        }
        if (objc_msgSend(v11, "canShowFloatingUI"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "superview");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "removeFromSuperview");
LABEL_15:
            objc_msgSend(v11, "delegate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "didUpdateVisibleAppearance");

            WeakRetained = v11;
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 482) = 0;
            goto LABEL_16;
          }
        }
        WeakRetained = v11;
        if (v6)
          goto LABEL_15;
      }
    }
  }
LABEL_16:

}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_4(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:", a1[5]);

  objc_msgSend(a1[5], "runAnimations");
  return objc_msgSend(a1[6], "runAnimations");
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "runCompletions");
  return objc_msgSend(*(id *)(a1 + 40), "runCompletions");
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __49___UITabContainerView_updateDimmingViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __49___UITabContainerView_updateDimmingViewAnimated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(_BYTE *)(result + 40))
      return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  }
  return result;
}

id __55___UITabContainerView_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1)
{
  return +[_UIFloatingTabBarItemView dragPreviewForItem:userInterfaceStyle:](_UIFloatingTabBarItemView, "dragPreviewForItem:userInterfaceStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
