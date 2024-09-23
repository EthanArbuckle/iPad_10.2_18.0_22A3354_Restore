@implementation UIContextMenuPanController

void __68___UIContextMenuPanController_moveToDetentPosition_updateScrubPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") <= 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 > 2)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "originalPlatterCenter");
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "panGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);

LABEL_6:
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "panGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationInView:", v10);
  objc_msgSend(v9, "_updateMenuScrubPathWithLocationIfNecessary:");

}

void __75___UIContextMenuPanController__updateMenuScrubPathWithLocationIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  objc_msgSend(*(id *)(a1 + 32), "submenus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v27;
  if (v4 != v27)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v27, "listView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 40), "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v18, v20, v22, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendPath:", v26);

    v5 = v27;
  }

}

uint64_t __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canSwipeDownToDismiss");
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_animationsForPreviewPlusActionsStyleWithTranslation:location:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  else
    objc_msgSend(v3, "_animationsForActionsStyleWithLocation:ended:", *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 32), "_animationsForAnyAttachedAccessoryViews");
}

uint64_t __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

@end
