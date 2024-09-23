@implementation UIDocumentLaunchViewController

void __93___UIDocumentLaunchViewController_browserPresentationControllerPresentationTransitionDidEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentLaunchViewController _dismissBrowserViewController]((uint64_t)WeakRetained);

}

void __90___UIDocumentLaunchViewController_browserPresentationControllerDismissalTransitionDidEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentLaunchViewController _presentBrowserViewController]((uint64_t)WeakRetained);

}

void __53___UIDocumentLaunchViewController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  BOOL v22;
  int v23;
  id v24;
  uint64_t v25;
  char v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  _UIMagicMorphAnimation *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _UIMagicMorphAnimation *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  id v46;
  _UIDocumentUnavailablePortalContainerView *v47;
  void *v48;
  _QWORD *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  float v55;
  id *v56;
  void *v57;
  double v58;
  void *v59;
  id *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  id v71;
  _QWORD *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  _QWORD *v85;
  char v86;
  _QWORD v87[5];
  id v88;
  id v89;
  id v90;
  double v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;

  v1 = a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v77 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_37;
  v3 = WeakRetained[137];
  if (v3)
    v4 = v3[4];
  else
    LOBYTE(v4) = 0;
  if (v3)
    v3 = (_QWORD *)v3[6];
  v5 = *((_BYTE *)WeakRetained + 1088);
  v67 = *(void **)(v1 + 32);
  v6 = v3;
  objc_msgSend(v77, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v77[137];
  if (v8)
    v8 = (_QWORD *)v8[10];
  v64 = v6;
  v9 = v8;
  v73 = v77[122];
  objc_msgSend(v77, "view");
  v72 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = v77[133];
  v76 = v77[127];
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 4);
  objc_msgSend(v9, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v7;
  if (v11)
  {
    objc_msgSend(v7, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isDescendantOfView:", v12);

    v14 = v13 ^ 1;
  }
  else
  {
    v14 = 1;
  }
  v15 = v5 & 2;

  if (_AXSReduceMotionEnabled())
    v16 = 1;
  else
    v16 = _AXSReduceMotionReduceSlideTransitionsEnabled() != 0;
  v17 = v4 & 4;
  objc_msgSend(v76, "selectedDetentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.UIKit.full"));

  v65 = v1;
  v68 = v10;
  v69 = v9;
  v66 = v19;
  v70 = v17;
  if (((v14 | v16) & 1) != 0)
  {
    v20 = 0;
LABEL_16:
    v21 = 0;
LABEL_17:
    if (v21)
      v22 = v20 == 0;
    else
      v22 = 1;
    v23 = !v22;
    v24 = v21;
    goto LABEL_24;
  }
  v43 = v9;
  v21 = v43;
  if (v15)
  {
    if (!v10)
    {
      v20 = 0;
      goto LABEL_17;
    }
    _UIDocumentUnavailablePortalViewForAnimationInfo(v10);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v20);
    objc_msgSend(v77, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v20);

    v24 = v21;
    if (!v21)
      goto LABEL_59;
LABEL_44:
    if (v20)
    {
      objc_msgSend(v75, "view");
      v46 = (id)objc_claimAutoreleasedReturnValue();

      if (v21 == v46)
      {
        v47 = [_UIDocumentUnavailablePortalContainerView alloc];
        objc_msgSend(v75, "view");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[_UIDocumentUnavailablePortalContainerView initWithSourceView:](v47, v48);

        objc_msgSend(v74, "addObject:", v49);
        if (v15 || !v70)
        {
          objc_msgSend(v77, "view");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addSubview:", v49);
        }
        else
        {
          v50 = v77[128];
          objc_msgSend(v77[126], "view");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "insertSubview:belowSubview:", v49, v51);
        }

        objc_msgSend(v75, "view");
        v52 = (id)objc_claimAutoreleasedReturnValue();

        if (v24 == v52)
          v53 = v24;
        else
          v53 = (void *)v20;
        if (v24 == v52)
          v24 = v49;
        else
          v20 = (uint64_t)v49;

      }
    }
    goto LABEL_59;
  }
  if (!v17 || (v19 & 1) != 0)
  {
    if (!v10)
    {
      v20 = (uint64_t)v43;
      goto LABEL_16;
    }
    _UIDocumentUnavailablePortalViewForAnimationInfo(v10);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v24);
    objc_msgSend(v77, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v24);

  }
  else
  {
    v24 = v73;
  }
  v20 = (uint64_t)v21;
  if (v24)
    goto LABEL_44;
LABEL_59:
  v23 = 0;
  if (v24 && v20)
  {
    objc_msgSend(v75, "view");
    v54 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
      v27 = 1.0;
    else
      v27 = 0.0;
    if (v21 == v54)
    {
      v25 = 0;
      v23 = 1;
      v26 = 1;
    }
    else
    {
      objc_msgSend(v75, "view");
      v56 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIView _backing_clientLayer](v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v27;
      *(float *)&v58 = v55;
      objc_msgSend(v57, "setOpacity:", v58);

      objc_msgSend(v75, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "view");
      v60 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIView _backing_clientLayer](v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
        -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v59, v72, -3, (uint64_t)v61);

      v26 = 0;
      v23 = 1;
      v25 = 1;
    }
    goto LABEL_27;
  }
LABEL_24:
  v25 = 0;
  v26 = 0;
  if (v15)
    v27 = 1.0;
  else
    v27 = 0.0;
LABEL_27:
  v62 = v24;
  v63 = (void *)v20;
  objc_msgSend(v67, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "viewForKey:", CFSTR("UITransitionContextToView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v67, "containerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v29);

  }
  objc_msgSend(v77, "interruptibleAnimatorForTransition:", v67);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke;
  v87[3] = &unk_1E16E53F8;
  v92 = v15 >> 1;
  v93 = v26;
  v87[4] = v77;
  v91 = v27;
  v94 = v23;
  v95 = v70 >> 2;
  v96 = v66;
  v71 = v29;
  v88 = v71;
  v33 = v28;
  v89 = v33;
  v97 = v25;
  v34 = v75;
  v90 = v34;
  objc_msgSend(v31, "addAnimations:", v87);
  if (v23)
  {
    v35 = objc_alloc_init(_UIMagicMorphAnimation);
    v36 = v62;
    -[_UIMagicMorphAnimation morphTo:reparentWithoutAnimation:completion:](v35, "morphTo:reparentWithoutAnimation:completion:", v62, v25, 0);
    v78 = v32;
    v79 = 3221225472;
    v80 = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_6;
    v81 = &unk_1E16BD778;
    v82 = v67;
    v37 = v74;
    v83 = v74;
    v86 = v25;
    v84 = v34;
    v38 = v72;
    v85 = v72;
    v39 = v63;
    -[_UIMagicMorphAnimation morphTo:reparentWithoutAnimation:completion:](v35, "morphTo:reparentWithoutAnimation:completion:", v63, v25, &v78);
    v40 = v77[132];
    v77[132] = v35;
    v41 = v35;

    v42 = v64;
    v1 = v65;
  }
  else
  {
    v78 = v32;
    v79 = 3221225472;
    v80 = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_7;
    v81 = &unk_1E16B42D0;
    v82 = v67;
    objc_msgSend(v31, "addCompletion:", &v78);
    v42 = v64;
    v1 = v65;
    v38 = v72;
    v37 = v74;
    v36 = v62;
    v39 = v63;
  }

LABEL_37:
  objc_msgSend(*(id *)(v1 + 40), "startAnimation");

}

void __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned __int8 *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  float v21;
  id *v22;
  void *v23;
  double v24;
  _QWORD v25[4];
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  char v32;
  char v33;
  _QWORD v34[6];
  _QWORD v35[6];
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v2 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 73))
      goto LABEL_6;
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(a1 + 64));
    goto LABEL_6;
  }
  if (!*(_BYTE *)(a1 + 73))
    goto LABEL_5;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_2;
  v35[3] = &unk_1E16B1888;
  v35[4] = *(_QWORD *)(a1 + 32);
  v35[5] = *(_QWORD *)(a1 + 64);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v35);
LABEL_6:
  if (*(_BYTE *)(a1 + 74) && !*(_BYTE *)(a1 + 72) && *(_BYTE *)(a1 + 75))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", *(double *)(a1 + 64));
    v3 = *(double *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 1040;
    goto LABEL_14;
  }
  if (!*(_BYTE *)(a1 + 73))
  {
    v3 = *(double *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 1024;
LABEL_14:
    objc_msgSend(*(id *)(v4 + v5), "setAlpha:", v3);
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    v34[0] = v2;
    v34[1] = 3221225472;
    v34[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_3;
    v34[3] = &unk_1E16B1888;
    v34[4] = *(_QWORD *)(a1 + 32);
    v34[5] = *(_QWORD *)(a1 + 64);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v34);
  }
LABEL_15:
  v31[0] = v2;
  v31[1] = 3221225472;
  v31[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_4;
  v31[3] = &unk_1E16B70C0;
  v31[4] = *(_QWORD *)(a1 + 32);
  v32 = *(_BYTE *)(a1 + 72);
  v33 = *(_BYTE *)(a1 + 74);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v31);
  if (*(_BYTE *)(a1 + 72))
    v6 = 1;
  else
    v6 = *(_BYTE *)(a1 + 74) != 0;
  v7 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 1000);
  if (v7 && v7[432] != v6)
  {
    v7[432] = v6;
    -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews](v7);
  }
  if (!*(_BYTE *)(a1 + 76) && (*(_BYTE *)(a1 + 75) || !*(_BYTE *)(a1 + 74)))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 40), "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v25[0] = v2;
      v25[1] = 3221225472;
      v25[2] = __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_5;
      v25[3] = &unk_1E16B20D8;
      v26 = *(id *)(a1 + 40);
      v27 = v9;
      v28 = v11;
      v29 = v13;
      v30 = v15;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
      objc_msgSend(*(id *)(a1 + 40), "setFrame:", v9, v11, v13, v15);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "frame");
      x = v36.origin.x;
      y = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;
      v20 = CGRectGetHeight(v36);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectOffset(v37, 0.0, v20);
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    }
  }
  -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](*(void **)(a1 + 32), 2 * *(unsigned __int8 *)(a1 + 72));
  if (*(_BYTE *)(a1 + 77))
  {
    v21 = 1.0 - *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 56), "view");
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIView _backing_clientLayer](v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v24 = v21;
    objc_msgSend(v23, "setOpacity:", v24);

  }
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", *(double *)(a1 + 40));
}

unsigned __int8 *__84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_4(uint64_t a1)
{
  int v1;
  unsigned __int8 *result;

  if (*(_BYTE *)(a1 + 40))
    v1 = *(_BYTE *)(a1 + 41) != 0;
  else
    v1 = 1;
  result = *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 1000);
  if (result)
  {
    if (result[432] != v1)
    {
      result[432] = v1;
      return -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews](result);
    }
  }
  return result;
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_5(uint64_t a1)
{
  CGFloat Height;
  CGRect v4;

  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  v4 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, Height);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

void __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD *v11;
  id *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v14);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIView _backing_clientLayer](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setOpacity:", v9);

    objc_msgSend(*(id *)(a1 + 48), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "view");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIView _backing_clientLayer](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v10, v11, -2, (uint64_t)v13);

  }
}

uint64_t __84___UIDocumentLaunchViewController__configureBrowserTransitionWithTransitionContext___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void __79___UIDocumentLaunchViewController__prepareDocumentAnimationInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 133, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64___UIDocumentLaunchViewController__presentBrowserViewController__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 isParentViewControllerDisappearedOr;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setAlpha:", 1.0);
  isParentViewControllerDisappearedOr = -[_UIDocumentLaunchViewController _isParentViewControllerDisappearedOrAppearing](*(void **)(a1 + 32));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  if (isParentViewControllerDisappearedOr)
  {
    objc_msgSend(v4, "setAlpha:", 1.0);
    -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](*(void **)(a1 + 32), 2);
  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.0);
  }
}

uint64_t __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, 0.5, 0.0);
}

void __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", 0.0);
  -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](*(void **)(a1 + 32), 0);
}

id __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDocumentCreationIntentFromActionIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a2, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_2;
    v11[3] = &unk_1E16B65D8;
    v12 = *(id *)(a1 + 32);
    v13 = v5;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, v8, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a2;
  }

  return v9;
}

void __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDocumentUnavailableBrowserViewController(*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDocumentCreationIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_13;
    if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_13)
    {
      v4 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_13);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Ignoring document creation request as the import handler for a previous request has not been called. When implementing -[UIDocumentBrowserViewControllerDelegate documentBrowser:didRequestDocumentCreationWithHandler:], be sure to call the import handler when either the document has been created or the request has been canceled. Browser view controller: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v2, "_initiateDocumentCreationWithIntent:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  if (!*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return 0;
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDocumentCreationIntentFromActionIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[5];
  v6 = v5;
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

uint64_t __60___UIDocumentLaunchViewController__firstResponderDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFirstResponder");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
  return result;
}

void __54___UIDocumentLaunchViewController__layoutContentViews__block_invoke(double *a1, void *a2, void *a3)
{
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MinY;
  double MinX;
  double v22;
  double Width;
  void *v24;
  void *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if (a3)
  {
    if (!a2)
      return;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIDocumentLaunchViewController _layoutContentViews]_block_invoke");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIDocumentLaunchViewController.m"), 809, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView != nil"));

    if (!a2)
      return;
  }
  objc_msgSend(a3, "center");
  objc_msgSend(a2, "setCenter:");
  objc_msgSend(a3, "bounds");
  objc_msgSend(a2, "setBounds:");
  objc_msgSend(a2, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != a3)
    objc_msgSend(a3, "addSubview:", a2);
  v7 = objc_msgSend(a2, "edgesInsettingLayoutMarginsFromSafeArea");
  v8 = a1[4] + 0.0;
  if ((v7 & 1) == 0)
    v8 = 0.0;
  v9 = a1[5] + 0.0;
  if ((v7 & 2) == 0)
    v9 = 0.0;
  v10 = a1[6] + 0.0;
  if ((v7 & 4) == 0)
    v10 = 0.0;
  v11 = a1[7] + 0.0;
  if ((v7 & 8) == 0)
    v11 = 0.0;
  v12 = v11 + v9 + a1[10];
  v13 = v12 * 0.5;
  if (v12 >= 0.0)
    v13 = 0.0;
  v14 = fmax(v12, 0.0);
  v15 = v10 + v8 + a1[11];
  v16 = v15 * 0.5;
  if (v15 >= 0.0)
    v16 = 0.0;
  v17 = fmax(v15, 0.0);
  v18 = a1[8] - v9 + v13;
  v19 = a1[9] - v8 + v16;
  v26.origin.x = v18;
  v26.origin.y = v19;
  v26.size.width = v14;
  v26.size.height = v17;
  MinY = CGRectGetMinY(v26);
  v27.origin.x = v18;
  v27.origin.y = v19;
  v27.size.width = v14;
  v27.size.height = v17;
  MinX = CGRectGetMinX(v27);
  v22 = a1[12];
  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v28);
  v29.origin.x = v18;
  v29.origin.y = v19;
  v29.size.width = v14;
  v29.size.height = v17;
  objc_msgSend(a2, "setLayoutMargins:", MinY, MinX, v22, Width - CGRectGetMaxX(v29));
}

@end
