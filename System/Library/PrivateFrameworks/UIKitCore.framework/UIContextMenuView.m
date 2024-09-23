@implementation UIContextMenuView

void __45___UIContextMenuView_setReversesActionOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 417);
  objc_msgSend(a2, "listView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReversesActionOrder:", v2);

}

void __34___UIContextMenuView_visibleMenus__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "menu");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_2;
  v10[3] = &unk_1E16B2560;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v10, v7, v8, v9);

}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "submenus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "departingNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "departingNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setDepartingNode:", 0);
  }
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisplayedMenu:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCollectionViewAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_5(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  CAFrameRateRange v15;

  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v15.minimum;
  maximum = v15.maximum;
  preferred = v15.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_6;
  v10[3] = &unk_1E16B25D8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v6;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v10, v7, v8, v9);

}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  CGRect v5;
  CGRect v6;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v6 = CGRectInset(v5, -1.0, -1.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setCollectionViewAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_7;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v4);
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scrollToFirstSignificantAction");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "didCompleteInPlaceMenuTransition");
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_9(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  CAFrameRateRange v18;

  v18 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v18.minimum;
  maximum = v18.maximum;
  preferred = v18.preferred;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_10;
  v12[3] = &unk_1E16B25D8;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v16 = v5;
  v17 = v6;
  v13 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v14 = v7;
  v15 = v8;
  *(float *)&v9 = minimum;
  *(float *)&v10 = maximum;
  *(float *)&v11 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v12, v9, v10, v11);

}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setEmphasized:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        CGAffineTransformMakeScale(&v13, 0.97, 0.97);
        objc_msgSend(v8, "listView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
        objc_msgSend(v9, "setTransform:", &v12);

        objc_msgSend(v8, "listView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAlpha:", 0.0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_11(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "listView", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

uint64_t __49___UIContextMenuView__handleSelectionForElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unHighlightItemAtIndexPath:", *(_QWORD *)(a1 + 40));
}

void __46___UIContextMenuView__handleSelectionGesture___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  id obj;
  CGPoint v10;
  CGRect v11;

  objc_msgSend(a2, "listView");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", obj);
  v6 = v5;
  v8 = v7;
  objc_msgSend(obj, "bounds");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v11, v10))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    *a3 = 1;
  }

}

BOOL __46___UIContextMenuView__handleSelectionGesture___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", objc_msgSend(a2, "action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __46___UIContextMenuView__handleSelectionGesture___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0DC5BE8];
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variantForActionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke(uint64_t a1)
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
  double v12;
  double v13;
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
  long double v24;
  void *v25;
  double v26;
  long double v27;
  void *v28;
  int v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__8;
  v46 = __Block_byref_object_dispose__8;
  v47 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "state") <= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "submenus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke_2;
    v39 = &unk_1E16B2628;
    v40 = *(id *)(a1 + 32);
    v41 = &v42;
    objc_msgSend(v2, "reverseEnumerateNodes:", &v36);

  }
  v3 = (void *)v43[5];
  if (!v3)
    goto LABEL_9;
  objc_msgSend(v3, "next");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "submenus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "current");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend((id)v43[5], "listView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    objc_msgSend((id)v43[5], "listView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForItemAtPoint:", v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v43[5], "listView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentListView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayedMenu");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexPathForElement:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "isEqual:", v21))
    {

LABEL_9:
      objc_msgSend(*(id *)(a1 + 40), "_clearHoverAutoExitTimer", v36, v37, v38, v39);
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 40), "hoverVelocityIntegrator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "velocity");
    v24 = v23;

    objc_msgSend(*(id *)(a1 + 40), "hoverVelocityIntegrator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "velocity");
    v27 = v26;

    objc_msgSend((id)v43[5], "next");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "leftOfParentWhenCascading");

    v30 = v24 < 0.0;
    if (!v29)
      v30 = v24 > 0.0;
    if (v30 && hypot(v24, v27) > 10.0)
    {

      objc_msgSend(*(id *)(a1 + 40), "_setHoverAutoExitTimer");
      goto LABEL_17;
    }

  }
  else
  {
    v7 = (void *)v43[5];
    objc_msgSend(*(id *)(a1 + 40), "submenus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "current");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
      goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "_clearHoverAutoExitTimer", v36, v37, v38, v39);
  v31 = *(void **)(a1 + 40);
  objc_msgSend(v31, "currentListView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "displayedMenu");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_handleSelectionForElement:", v33);

LABEL_17:
  v34 = (void *)v43[5];
  objc_msgSend(*(id *)(a1 + 40), "hoveredNode", v36, v37, v38, v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 != v35)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHoveredNode:", v43[5]);
    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  }
  _Block_object_dispose(&v42, 8);

}

void __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  _BOOL4 v10;
  id v11;
  CGPoint v12;
  CGRect v13;

  v11 = a2;
  objc_msgSend(v11, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", v4);
  v7 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(*(_QWORD *)(v7 + 8) + 40))
  {
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "bounds");
    v12.x = v8;
    v12.y = v9;
    v10 = CGRectContainsPoint(v13, v12);
    v7 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(v7 + 8) + 40), a2);
      v7 = *(_QWORD *)(a1 + 40);
    }
  }
  objc_msgSend(v4, "setEmphasized:", *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40) == (_QWORD)v11);

}

void __40___UIContextMenuView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v9 = v8;
  v11 = v10;

  objc_msgSend(v6, "listView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hitTest:withEvent:", *(_QWORD *)(a1 + 40), v9, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a3 = 1;
}

void __83___UIContextMenuView__setAutoNavigationTimerIfNecessaryForElement_isTrackpadHover___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleSelectionForElement:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "currentListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForElement:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setUnselectableIndexPath:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "feedbackGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(v8, "selectionChangedAtLocation:");

}

void __44___UIContextMenuView__setHoverAutoExitTimer__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentListView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayedMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleSelectionForElement:", v2);

}

id __33___UIContextMenuView_keyCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", a1, 0, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsPriorityOverSystemBehavior:", 1);
  return v2;
}

@end
