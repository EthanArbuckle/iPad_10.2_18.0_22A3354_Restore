@implementation UIContextMenuUIController

void __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, _BYTE *a5)
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v10 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v14 = v10;
    objc_msgSend(v10, "collapsedPreview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_targetedLiftPreview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "_isRoughlyEqualToPreview:", v12);

    v10 = v14;
    if (v13)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v10 = v14;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a4;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
      *a5 = 1;
    }
  }

}

void __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didBeginMorphToDragPreview");
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_3;
  v5[3] = &unk_1E16B1B28;
  v5[4] = WeakRetained;
  objc_msgSend(v3, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", v4, 6, 0, v5);

}

uint64_t __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteMorphToDragPreview");
}

void __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_setDeferPreviewUpdates:", 0);
  objc_msgSend(*(id *)(a1 + 32), "previewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_targetedLiftPreview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_duiPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredStackOrder");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke_2;
    v6[3] = &unk_1E16E1408;
    v7 = *(id *)(a1 + 40);
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setPreviewProvider:", v6);

  }
}

id __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_duiPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredStackOrder:", v2);

  return *(id *)(a1 + 32);
}

uint64_t __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setCollapsedShadowStyle:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHideChromeWhenCollapsed:", 1);
}

uint64_t __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpDragViews");
}

void __59___UIContextMenuUIController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "locationInView:", v7);
  objc_msgSend(v7, "hitTest:withEvent:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __79___UIContextMenuUIController_shouldMaintainKeyboardAssertionForFirstResponder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlatterAndActionViewLayoutForce:updateAttachment:", 1, 0);
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __64___UIContextMenuUIController__needsToAvoidKeyboardForResponder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __73___UIContextMenuUIController__layoutWithUpdatedAttachment_concealedMenu___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closestScrollTruncationDetentToHeight:");
}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double MaxY;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[8];
  _OWORD v37[8];
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _OWORD v41[8];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPreviewSizeDidChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAttachment:", *(unsigned __int8 *)(a1 + 40));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "preview");
    v6 = *((double *)&v51 + 1);
    v5 = *(double *)&v51;
  }
  else
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v6 = 0.0;
    v5 = 0.0;
    v50 = 0u;
    v51 = 0u;
  }
  objc_msgSend(v3, "contextMenuUIControllerWillPerformLayout:withPreviewSize:", v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "contentPlatterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  if (v7)
    objc_msgSend(v7, "transform3D");
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zPosition");
  v11 = v10;

  if (v2)
    objc_msgSend(v2, "preview");
  else
    memset(v41, 0, sizeof(v41));
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_2;
  v38[3] = &unk_1E16B25B0;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v39 = v12;
  v40 = v13;
  _UIContextMenuItemLayoutApply((double *)v41, v12, v38);
  objc_msgSend(*(id *)(a1 + 32), "menuConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isMultiItemMenu");

  if (v15)
  {
    v37[4] = v46;
    v37[5] = v47;
    v37[6] = v48;
    v37[7] = v49;
    v37[0] = v42;
    v37[1] = v43;
    v37[2] = v44;
    v37[3] = v45;
    objc_msgSend(v12, "setTransform3D:", v37);
    objc_msgSend(v12, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZPosition:", v11);

  }
  if (v2)
    objc_msgSend(v2, "menu");
  else
    memset(v36, 0, sizeof(v36));
  _UIContextMenuItemLayoutApply((double *)v36, v8, 0);
  v31 = v8;
  objc_msgSend(v8, "layoutIfNeeded");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "menuConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessoryViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v2, "accessoryPositions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "CGPointValue");
        objc_msgSend(v23, "setCenter:");

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v58, 16);
    }
    while (v20);
  }

  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "platterContainerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v31;
    objc_msgSend(v31, "activeSubmenuFrameInCoordinateSpace:", v26);
    MaxY = CGRectGetMaxY(v60);
    objc_msgSend(v26, "bounds");
    v29 = 2 * (MaxY <= CGRectGetMaxY(v61));

  }
  else
  {
    v29 = 1;
    v27 = v31;
  }
  objc_msgSend(*(id *)(a1 + 32), "platterPanController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "moveToDetentPosition:updateScrubPath:", v29, 1);

}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_2(uint64_t a1, int a2, int a3)
{
  id v5;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "updateContentSize");
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "flocker");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateFlockLocation");

  }
}

uint64_t __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_4(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_5;
  v1[3] = &unk_1E16B1BF8;
  v2 = *(id *)(a1 + 32);
  +[UIView _animateByRetargetingAnimations:completion:](UIView, "_animateByRetargetingAnimations:completion:", v1, 0);

}

uint64_t __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumeratePlatterViewsWithBlock:", &__block_literal_global_550);
}

uint64_t __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

uint64_t __63___UIContextMenuUIController_contextMenuView_didSelectElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contextMenuUIController:didSelectMenuLeaf:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __54___UIContextMenuUIController__displayMenu_updateType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  objc_msgSend(*(id *)(a1 + 32), "_createMenuViewIfNecessaryForMenu:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMenu:updateType:alongsideAnimations:", *(_QWORD *)(a1 + 40), 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "contentPlatterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "platterPanController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenuView:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_layoutWithUpdatedAttachment:concealedMenu:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "menu");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "menuView", v12, v13, v14, v15, v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuItemLayoutApply((double *)&v12, v10, 0);

  objc_msgSend(*(id *)(a1 + 32), "menuView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_2(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_3;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:", 1, 0, 0);
}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:", 1, 0, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __59___UIContextMenuUIController__replaceVisibleMenu_withMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2 == 5)
    return objc_msgSend(v2, "_concealMenu");
  else
    return objc_msgSend(v2, "_updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:", 1, 0, 0);
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42___UIContextMenuUIController__concealMenu__block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:", 1, 0, 0);
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "platterPanController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMenuView:", 0);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v3 = *(_QWORD **)(a2 + 8);
  if (!v3 || (v4 = *(_QWORD **)a2) != 0 && v3[13] == v4[13] && v3[15] == v4[15])
  {
    v5 = objc_msgSend(v3, "userInterfaceStyle");
    if (v5 != objc_msgSend(*(id *)a2, "userInterfaceStyle"))
    {
      v6 = objc_loadWeakRetained(&to);
      objc_msgSend(v6, "_updatePlatterContainerViewTraitCollection");

    }
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_2;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &to);
    dispatch_async(MEMORY[0x1E0C80D38], v7);
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlatterAndActionViewLayoutForce:updateAttachment:", 1, 1);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "menuView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", v3, 0, 0, 0);

  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_4(uint64_t a1)
{
  id v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  v2 = objc_msgSend(v1, "state");

  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_5;
    v3[3] = &unk_1E16B3F40;
    objc_copyWeak(&v4, &to);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
  }
  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_5(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_6;
  v1[3] = &unk_1E16B3F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v1);
  objc_destroyWeak(&v2);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_6(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", v3, 4, 0, 0);

}

@end
