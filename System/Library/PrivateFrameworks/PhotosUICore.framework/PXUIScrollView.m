@implementation PXUIScrollView

void __48___PXUIScrollView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "px_cancelScrollGesture");

}

uint64_t __68___PXUIScrollView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsFocusFastScrolling:", objc_msgSend(*(id *)(a1 + 32), "_isFocusFastScrolling"));
}

void __37___PXUIScrollView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "_outermostLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zPosition");
  if (v4 == 0.0)
  {
    objc_msgSend(v16, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zPosition");
    v7 = v6;

  }
  else
  {
    v7 = v4;
  }

  v8 = v16;
  if (v7 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v9 = objc_msgSend(v16, "isUserInteractionEnabled");
    v8 = v16;
    if (v9)
    {
      objc_msgSend(v16, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
      v11 = v10;
      v13 = v12;
      v14 = objc_msgSend(v16, "pointInside:withEvent:", *(_QWORD *)(a1 + 40));
      v8 = v16;
      if (v14)
      {
        objc_msgSend(v16, "hitTest:withEvent:", *(_QWORD *)(a1 + 40), v11, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
        }

        v8 = v16;
      }
    }
  }

}

@end
