@implementation UIPreviewPresentationController

uint64_t __69___UIPreviewPresentationController__animatorForContainmentTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForDismissTransition");
}

uint64_t __65___UIPreviewPresentationController_interactionProgressDidUpdate___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "percentComplete");
  return objc_msgSend(v1, "_updateBreathingTransformWithProgress:animated:", 1);
}

void __89___UIPreviewPresentationController__preparePresentationContainerViewForPreviewTransition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __63___UIPreviewPresentationController__layoutForPreviewTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preparePresentationContainerViewForPreviewTransition");
}

void __80___UIPreviewPresentationController__unhighlightPreviewCellSnapshotViewsIfNeeded__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutForRevealUnhighlightTransition:", a2);
  if (a2 >= 1.0)
    objc_msgSend(WeakRetained, "_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded");

}

void __88___UIPreviewPresentationController__updateVisibiltyOfPreviewActionChromeForCurrentState__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "actionSheetAvailableImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPreviewActionSheet:", *(_QWORD *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_10;
  v3[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 40);
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_configureDynamicsController");
  objc_msgSend(*(id *)(a1 + 40), "platterMenuController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_beginInYLockedStatePresented");

  objc_msgSend(*(id *)(a1 + 40), "containerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id WeakRetained;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (id *)(a1 + 40);
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5
    && (objc_msgSend(v5, "_actions"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_4;
    v12[3] = &unk_1E16B1B50;
    v12[4] = v8;
    v11 = &v13;
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v12);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_2;
    block[3] = &unk_1E16DABF0;
    block[4] = v8;
    v11 = &v15;
    v15 = v3;
    v16 = WeakRetained;
    objc_copyWeak(&v17, v7);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v17);

  }
}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_3;
  v5[3] = &unk_1E16DABF0;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v2, "_dismissForHandledActionWithCompletion:", v5);
  objc_destroyWeak(&v9);

}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_3(id *a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  UIPreviewMenuItem *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  objc_msgSend(a1[4], "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[4], "handler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v3)[2](v3, a1[4], a1[5]);

  }
  objc_msgSend(a1[6], "forcePresentationControllerDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_alloc_init(UIPreviewMenuItem);
    objc_msgSend(a1[4], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewMenuItem setIdentifier:](v4, "setIdentifier:", v5);

    objc_msgSend(a1[4], "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewMenuItem setTitle:](v4, "setTitle:", v6);

    objc_msgSend(v9, "forcePresentationController:didSelectMenuItem:", a1[6], v4);
  }
  objc_msgSend(a1[5], "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "previewInteractionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_previewPresentationControllerDidScheduleDismiss");

}

uint64_t __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "_actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreviewActionItems:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_presentSubActionSheetForPreviewActionGroup:", *(_QWORD *)(a1 + 40));
}

void __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setHasAskedForDismissalInternally:", 1);
  objc_msgSend(*(id *)(a1 + 32), "previewActionSheet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "previewInteractionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_previewPresentationControllerDidScheduleDismiss");

}

uint64_t __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "centerForPlatterWithMenuViewDismissed");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCenter:", v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "centerForMenuDismissed");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "previewActionSheet");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenter:", v8, v10);

}

uint64_t __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double Width;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  CGFloat v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[30];

  v4 = objc_msgSend(*(id *)(a1 + 32), "leadingQuickActionViewSelected");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if (!objc_msgSend(v5, "trailingQuickActionViewSelected"))
      return;
    objc_msgSend(*(id *)(a1 + 32), "leadingQuickActionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "center");
    v33 = v32;

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    v10 = 0.5;
    v35 = CGRectGetWidth(v53) * 0.5;

    v36 = *(void **)(a1 + 32);
    objc_msgSend(v36, "trailingQuickActionView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_trailingQuickActionOffsetForCenterPosition:swipeView:", v37, v35, v33);
    v39 = v38;
    objc_msgSend(*(id *)(a1 + 32), "trailingQuickActionViewEdgeConstraint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setConstant:", v39);

    objc_msgSend(*(id *)(a1 + 32), "trailingQuickActionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "superview");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "trailingQuickActionView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "superview");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutIfNeeded");

    objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "platterView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "center");
    v24 = v47;

    v25 = *(void **)(a1 + 32);
    if ((v3 & 0x80000) != 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(v25, "presentationContainerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "platterView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = CGRectGetWidth(v54) * -0.5;
    goto LABEL_7;
  }
  objc_msgSend(v5, "leadingQuickActionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = 0.5;
  v11 = CGRectGetWidth(v50) * 0.5;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "leadingQuickActionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_leadingQuickActionOffsetForCenterPosition:swipeView:", v13, v11, v8);
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "leadingQuickActionViewEdgeConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  objc_msgSend(*(id *)(a1 + 32), "leadingQuickActionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "leadingQuickActionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "platterView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "center");
  v24 = v23;

  v25 = *(void **)(a1 + 32);
  if ((v3 & 0x80000) != 0)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v25, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  Width = CGRectGetWidth(v51);
  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "platterView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v30 = Width + CGRectGetWidth(v52) * v10;

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "platterView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setCenter:", v30, v24);

}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "previewActionSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setHasAskedForDismissalInternally:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(*(id *)(a1 + 32), "previewInteractionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_previewPresentationControllerDidScheduleDismiss");

}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_4;
  block[3] = &unk_1E16B1BF8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke(uint64_t a1)
{
  double MidX;
  CGFloat v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(*(id *)(a1 + 32), "platterContainerBounds");
  MidX = CGRectGetMidX(v11);
  objc_msgSend(*(id *)(a1 + 32), "platterBounds");
  v3 = CGRectGetHeight(v12) * -0.5;
  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenter:", MidX, v3);

  objc_msgSend(*(id *)(a1 + 32), "centerForMenuDismissed");
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "previewActionSheet");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", v7, v9);

}

void __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presentationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "previewActionSheet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "previewInteractionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_previewPresentationControllerDidScheduleDismiss");

}

- (UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  UIPreviewPresentationController *v4;
  UIPreviewPresentationController *v5;
  UIPreviewPresentationController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPreviewPresentationController;
  v4 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v8, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_appliesVisualEffectsToPresentingView = 1;
    v6 = v4;
  }

  return v5;
}

- (int64_t)presentationStyle
{
  return 20;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController presentationTransitionWillBegin](&v9, sel_presentationTransitionWillBegin);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__UIPreviewPresentationController_presentationTransitionWillBegin__block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewPresentationController _preparePresentationAnimationsForTransitionCoordinator:](self, "_preparePresentationAnimationsForTransitionCoordinator:", v4);
  -[UIPreviewPresentationController _prepareDismissGestureRecognizersIfNeeded](self, "_prepareDismissGestureRecognizersIfNeeded");
  -[UIPreviewPresentationController containerViewConfigurationBlock](self, "containerViewConfigurationBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPreviewPresentationController containerViewConfigurationBlock](self, "containerViewConfigurationBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
}

uint64_t __66__UIPreviewPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareContainerViewForPresentationTransition");
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_);
  if (!a3)
    -[UIPreviewPresentationController _finalizeAfterDismissalTransition](self, "_finalizeAfterDismissalTransition");
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController dismissalTransitionWillBegin](&v5, sel_dismissalTransitionWillBegin);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewPresentationController _prepareDismissAnimationsForTransitionCoordinator:](self, "_prepareDismissAnimationsForTransitionCoordinator:", v4);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void (**dismissalTransitionDidEndBlock)(void);
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    -[UIPreviewPresentationController _finalizeAfterDismissalTransition](self, "_finalizeAfterDismissalTransition");
    dismissalTransitionDidEndBlock = (void (**)(void))self->_dismissalTransitionDidEndBlock;
    if (dismissalTransitionDidEndBlock)
      dismissalTransitionDidEndBlock[2]();
  }
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 0;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return 0;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = 1;
  else
    v5 = 2;
  return +[UIForcePresentationHelper visualEffectForPresentationPhase:traitCollection:variant:](UIForcePresentationHelper, "visualEffectForPresentationPhase:traitCollection:variant:", v5, a3, 0);
}

+ (BOOL)_shouldInterdictServiceViewTouches
{
  return 1;
}

- (BOOL)_allowsAutorotation
{
  return 0;
}

- (void)_prepareContainerViewForPresentationTransition
{
  void *v3;
  void *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIPresentationController containerView](self, "containerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewPresentationController setPresentationWindow:](self, "setPresentationWindow:", v3);

  if (!-[UIPreviewPresentationController _allowsAutorotation](self, "_allowsAutorotation"))
  {
    -[UIPreviewPresentationController presentationWindow](self, "presentationWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginDisablingInterfaceAutorotation");

  }
  v5 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
  objc_msgSend(v8, "bounds");
  -[UIView setFrame:](v5, "setFrame:");
  -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  objc_storeStrong((id *)&self->_presentationContainerEffectView, v5);
  objc_msgSend(v8, "addSubview:", v5);
  if (-[UIPreviewPresentationController appliesVisualEffectsToPresentingView](self, "appliesVisualEffectsToPresentingView"))
  {
    -[UIPreviewPresentationController _prepareStatusBarForPresentationTransition](self, "_prepareStatusBarForPresentationTransition");
    -[UIPreviewPresentationController _prepareKeyboardForPresentationTransition](self, "_prepareKeyboardForPresentationTransition");
  }
  -[UIPresentationController presentedView](self, "presentedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewPresentationController _presentationContainerView](self, "_presentationContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  objc_msgSend(v8, "convertRect:toView:", v7);
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v7, "addSubview:", v6);
  -[UIPreviewPresentationController _presentationTransitionWillBeginForContainerEffectView:](self, "_presentationTransitionWillBeginForContainerEffectView:", v5);
  if (-[UIPreviewPresentationController appliesVisualEffectsToPresentingView](self, "appliesVisualEffectsToPresentingView"))
  {
    +[UIWindow _synchronizeDrawingWithPreCommitHandler:](UIWindow, "_synchronizeDrawingWithPreCommitHandler:", 0);
  }

}

- (void)_prepareKeyboardForPresentationTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _keyboardSceneDelegate](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rootInputWindowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isChangingPlacement");

    if ((v8 & 1) == 0)
    {
      -[UIPreviewPresentationController setCurrentPinnedResponder:](self, "setCurrentPinnedResponder:", v5);
      objc_msgSend(v4, "_beginPinningInputViewsOnBehalfOfResponder:", v5);
      +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__155;
      v32 = __Block_byref_object_dispose__155;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__155;
      v26 = __Block_byref_object_dispose__155;
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPresentationController containerView](self, "containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __76__UIPreviewPresentationController__prepareKeyboardForPresentationTransition__block_invoke;
      v17 = &unk_1E16DAE80;
      v12 = v10;
      v18 = v12;
      v13 = v11;
      v19 = v13;
      v20 = &v28;
      v21 = &v22;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v14);
      -[UIPreviewPresentationController setKeyboardSnapshotters:](self, "setKeyboardSnapshotters:", v29[5], v14, v15, v16, v17);
      -[UIPreviewPresentationController setKeyboardWindows:](self, "setKeyboardWindows:", v23[5]);

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);

    }
  }

}

void __76__UIPreviewPresentationController__prepareKeyboardForPresentationTransition__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[UIKBViewTreeSnapshotter snapshotterForKeyboardView:afterScreenUpdates:](UIKBViewTreeSnapshotter, "snapshotterForKeyboardView:afterScreenUpdates:", v7, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "snapshotView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v7, "bounds");
      objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v7);
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(*(id *)(a1 + 32), "insertSubview:belowSubview:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
      objc_msgSend(v7, "setAlpha:", 0.0);

    }
  }

}

- (void)_finalizeAfterDismissalTransition
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIPreviewPresentationController localStatusBar](self, "localStatusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIPreviewPresentationController setLocalStatusBar:](self, "setLocalStatusBar:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIPreviewPresentationController keyboardWindows](self, "keyboardWindows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8++), "setAlpha:", 1.0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[UIPreviewPresentationController setKeyboardWindows:](self, "setKeyboardWindows:", 0);
  -[UIPreviewPresentationController keyboardSnapshotters](self, "keyboardSnapshotters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_426);

  -[UIPreviewPresentationController setKeyboardSnapshotters:](self, "setKeyboardSnapshotters:", 0);
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _keyboardSceneDelegate](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewPresentationController currentPinnedResponder](self, "currentPinnedResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && objc_msgSend(v11, "_isPinningInputViewsOnBehalfOfResponder:", v12))
  {
    objc_msgSend(v11, "_stopPinningInputViewsOnBehalfOfResponder:", v12);
    objc_msgSend(v12, "becomeFirstResponder");
  }
  -[UIPreviewPresentationController presentationWindow](self, "presentationWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDisablingInterfaceAutorotationAnimated:", 1);

  -[UIPreviewPresentationController setPresentationWindow:](self, "setPresentationWindow:", 0);
}

void __68__UIPreviewPresentationController__finalizeAfterDismissalTransition__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "snapshotView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (id)_presentationContainerView
{
  void *v2;
  void *v3;

  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_preparePresentationAnimationsForTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = a3;
  if (-[UIPreviewPresentationController appliesVisualEffectsToPresentingView](self, "appliesVisualEffectsToPresentingView"))
  {
    if (v4)
    {
      v5[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke;
      v6[3] = &unk_1E16B2150;
      v6[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke_2;
      v5[3] = &unk_1E16B2150;
      objc_msgSend(v4, "animateAlongsideTransition:completion:", v6, v5);
    }
    else
    {
      -[UIPreviewPresentationController _layoutForPreview](self, "_layoutForPreview");
    }
  }

}

uint64_t __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;

  v3 = objc_msgSend(a2, "initiallyInteractive");
  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_layoutForInteractiveHighlight");
  else
    return objc_msgSend(v4, "_layoutForPreview");
}

void __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_animatePreviewTransitionIfNeeded:", v3);

}

- (void)_prepareDismissAnimationsForTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (-[UIPreviewPresentationController appliesVisualEffectsToPresentingView](self, "appliesVisualEffectsToPresentingView"))
  {
    if (v4)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __85__UIPreviewPresentationController__prepareDismissAnimationsForTransitionCoordinator___block_invoke;
      v5[3] = &unk_1E16B2150;
      v5[4] = self;
      objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);
    }
    else
    {
      -[UIPreviewPresentationController _layoutForCancel](self, "_layoutForCancel");
    }
  }

}

uint64_t __85__UIPreviewPresentationController__prepareDismissAnimationsForTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForCancel");
}

- (void)_prepareDismissGestureRecognizersIfNeeded
{
  void *v3;
  void *v4;
  UITapGestureRecognizer *v5;

  -[UIPreviewPresentationController previewPresentationDelegate](self, "previewPresentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDismissGestureRecognizer_);
    -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[UIPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v5);

    -[UIPreviewPresentationController setDismissGestureRecognizer:](self, "setDismissGestureRecognizer:", v5);
  }
}

- (void)_handleDismissGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  -[UIPreviewPresentationController previewPresentationDelegate](self, "previewPresentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewPresentationController:shouldDismissViewController:", self, v4);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[UIPresentationController presenting](self, "presenting")
    || -[UIPresentationController dismissing](self, "dismissing"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    -[UIPreviewPresentationController dismissGestureRecognizer](self, "dismissGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v6)
    {
      -[UIPresentationController presentedView](self, "presentedView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationInView:", v11);
      v8 = objc_msgSend(v11, "pointInside:withEvent:", 0) ^ 1;

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (void)_layoutForInteractiveHighlight
{
  -[UIPreviewPresentationController _applyVisualEffectsForPresentationPhase:](self, "_applyVisualEffectsForPresentationPhase:", 1);
}

- (void)_layoutForPreview
{
  -[UIPreviewPresentationController _applyVisualEffectsForPresentationPhase:](self, "_applyVisualEffectsForPresentationPhase:", 2);
}

- (void)_layoutForCancel
{
  -[UIPreviewPresentationController _applyVisualEffectsForPresentationPhase:](self, "_applyVisualEffectsForPresentationPhase:", 0);
}

+ (BOOL)_shouldApplyVisualEffectsToPresentingView
{
  return 1;
}

- (void)_applyVisualEffectsForPresentationPhase:(unint64_t)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3 == 1;
    v5 = (void *)objc_opt_class();
    -[UIPresentationController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_backgroundEffectForTraitCollection:interactive:", v6, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffect:", v8);

}

- (void)_animatePreviewTransitionIfNeeded:(id)a3
{
  id v4;
  void *v5;
  _QWORD aBlock[5];

  v4 = a3;
  if ((objc_msgSend(v4, "isCancelled") & 1) == 0 && objc_msgSend(v4, "initiallyInteractive"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__UIPreviewPresentationController__animatePreviewTransitionIfNeeded___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    if (_AXSReduceMotionEnabled())
    {
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.2, 0.0);
    }
    else
    {
      objc_opt_self();
      _durationOfSpringAnimation(2.0, 1500.0, 93.0, 0.0);
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v5, 0);
    }

  }
}

uint64_t __69__UIPreviewPresentationController__animatePreviewTransitionIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForPreview");
}

- (UIPreviewPresentationControllerDelegate)previewPresentationDelegate
{
  return (UIPreviewPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_previewPresentationDelegate);
}

- (void)setPreviewPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_previewPresentationDelegate, a3);
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (BOOL)appliesVisualEffectsToPresentingView
{
  return self->_appliesVisualEffectsToPresentingView;
}

- (void)setAppliesVisualEffectsToPresentingView:(BOOL)a3
{
  self->_appliesVisualEffectsToPresentingView = a3;
}

- (UIVisualEffectView)presentationContainerEffectView
{
  return self->_presentationContainerEffectView;
}

- (void)setPresentationContainerEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContainerEffectView, a3);
}

- (UIView)localStatusBar
{
  return self->_localStatusBar;
}

- (void)setLocalStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_localStatusBar, a3);
}

- (NSArray)keyboardSnapshotters
{
  return self->_keyboardSnapshotters;
}

- (void)setKeyboardSnapshotters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSHashTable)keyboardWindows
{
  return self->_keyboardWindows;
}

- (void)setKeyboardWindows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (UIResponder)currentPinnedResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_currentPinnedResponder);
}

- (void)setCurrentPinnedResponder:(id)a3
{
  objc_storeWeak((id *)&self->_currentPinnedResponder, a3);
}

- (UIWindow)presentationWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_presentationWindow);
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeWeak((id *)&self->_presentationWindow, a3);
}

- (id)containerViewConfigurationBlock
{
  return self->_containerViewConfigurationBlock;
}

- (void)setContainerViewConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (id)dismissalTransitionDidEndBlock
{
  return self->_dismissalTransitionDidEndBlock;
}

- (void)setDismissalTransitionDidEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalTransitionDidEndBlock, 0);
  objc_storeStrong(&self->_containerViewConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_presentationWindow);
  objc_destroyWeak((id *)&self->_currentPinnedResponder);
  objc_storeStrong((id *)&self->_keyboardWindows, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshotters, 0);
  objc_storeStrong((id *)&self->_localStatusBar, 0);
  objc_storeStrong((id *)&self->_presentationContainerEffectView, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_previewPresentationDelegate);
}

@end
