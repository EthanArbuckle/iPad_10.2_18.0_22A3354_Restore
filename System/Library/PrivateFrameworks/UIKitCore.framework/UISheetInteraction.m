@implementation UISheetInteraction

void __27___UISheetInteraction_init__block_invoke_8(uint64_t a1, uint64_t a2)
{
  double (**v3)(_QWORD, _QWORD);
  uint64_t (**v4)(void);
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(_QWORD *)a2 = 0;
  objc_msgSend(WeakRetained, "detentGetter");
  v3 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "indexOfCurrentDetentGetter");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();
  *(double *)(a2 + 8) = v3[2](v3, v5);

}

id __27___UISheetInteraction_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t (**v2)(void);
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _UIHyperpoint *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double (**v12)(_QWORD, _QWORD);
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "numberOfDetentsGetter");
  v2 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v3 = v2[2]();

  objc_msgSend(WeakRetained, "detentPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_dimensions");

  while (objc_msgSend(v4, "count") < v3)
  {
    v7 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", v6);
    objc_msgSend(v4, "addObject:", v7);

  }
  if (v3 < objc_msgSend(v4, "count"))
    objc_msgSend(v4, "removeObjectsInRange:", v3, objc_msgSend(v4, "count") - v3);
  v8 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v9 = 0;
    v10 = 2.22507386e-308;
    v11 = 1.79769313e308;
    do
    {
      objc_msgSend(WeakRetained, "detentGetter");
      v12 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = v12[2](v12, v9);

      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __27___UISheetInteraction_init__block_invoke_2;
      v22[3] = &__block_descriptor_40_e9_v16__0_d8l;
      *(double *)&v22[4] = v13;
      objc_msgSend(v14, "_mutateValue:", v22);

      if (v11 >= v13)
        v11 = v13;
      if (v10 < v13)
        v10 = v13;
      ++v9;
    }
    while (v3 != v9);
  }
  else
  {
    v11 = 1.79769313e308;
    v10 = 2.22507386e-308;
  }
  objc_msgSend(WeakRetained, "detentUnion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setRegions:", v4);

  objc_msgSend(WeakRetained, "detentContinuum");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __27___UISheetInteraction_init__block_invoke_3;
  v21[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v21[4] = v11;
  objc_msgSend(v16, "_mutateMinimumPoint:", v21);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __27___UISheetInteraction_init__block_invoke_4;
  v20[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v20[4] = v10;
  objc_msgSend(v16, "_mutateMaximumPoint:", v20);
  if (objc_msgSend(WeakRetained, "isDragging"))
  {
    v17 = v16;
  }
  else
  {
    objc_msgSend(WeakRetained, "detentUnion");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

double __27___UISheetInteraction_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = 0;
  result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

double __27___UISheetInteraction_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = 0;
  result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

double __27___UISheetInteraction_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = 0;
  result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

id __27___UISheetInteraction_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27___UISheetInteraction_init__block_invoke_6;
  v9[3] = &unk_1E16B2FB8;
  v4 = WeakRetained;
  v10 = v4;
  objc_msgSend(v2, "_mutateExtentBeyondMinimum:", v9);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __27___UISheetInteraction_init__block_invoke_7;
  v7[3] = &unk_1E16B2FB8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v2, "_mutateExtentBeyondMaximum:", v7);

  return v2;
}

void __27___UISheetInteraction_init__block_invoke_6(uint64_t a1, uint64_t a2)
{
  double (**v3)(void);

  *(_QWORD *)a2 = 0x4059000000000000;
  objc_msgSend(*(id *)(a1 + 32), "rubberBandExtentBeyondMinimumOffsetGetter");
  v3 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  *(double *)(a2 + 8) = v3[2]();

}

void __27___UISheetInteraction_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  double (**v3)(void);

  *(_QWORD *)a2 = 0x4059000000000000;
  objc_msgSend(*(id *)(a1 + 32), "rubberBandExtentBeyondMaximumOffsetGetter");
  v3 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  *(double *)(a2 + 8) = v3[2]();

}

void __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke(uint64_t a1)
{
  UIViewPropertyAnimator *v2;
  double v3;
  void *v4;
  UIViewPropertyAnimator *v5;
  _QWORD v6[5];

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = [UIViewPropertyAnimator alloc];
    v3 = _UISheetTransitionDuration();
    _UISheetTransitionTimingCurve();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v2, "initWithDuration:timingParameters:", v4, v3);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_2;
    v6[3] = &unk_1E16B1B28;
    v6[4] = *(_QWORD *)(a1 + 32);
    -[UIViewPropertyAnimator addAnimations:](v5, "addAnimations:", v6);
    -[UIViewPropertyAnimator startAnimation](v5, "startAnimation");

  }
}

uint64_t __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_2(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_3;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048612, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCurrentOffsetDidChange");
}

void __45___UISheetInteraction_draggingEndedInSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;

  objc_msgSend(*(id *)(a1 + 32), "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "detentPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "detentUnion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_translatedUnconstrainedPoint");
  v24 = 0;
  v25 = 0.0;
  v6 = objc_msgSend(v4, "_regionIndexForClosestPoint:toPoint:", &v24, v5);
  v7 = *(double *)(v5 + 8);
  v8 = v25;
  v9 = objc_msgSend(v4, "_regionIndexForClosestPoint:toPoint:", 0, objc_msgSend(v2, "_projectedPoint"));
  v10 = *(double *)(objc_msgSend(v2, "_velocity") + 8);
  v11 = fabs(v10);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SheetSpeedThreshold, (uint64_t)CFSTR("SheetSpeedThreshold"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v12 = 1000.0;
  else
    v12 = *(double *)&qword_1EDDA7D90;
  v13 = *(_QWORD *)&v10;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(double *)(objc_msgSend(v14, "_value") + 8);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 <= *(double *)(objc_msgSend(v16, "_value") + 8))
      v17 = 1;
    else
      v17 = -1;

  }
  v18 = v11 >= v12 && v6 == v9;
  if (v18 && v7 < v8 == v13 < 0)
  {
    if (v13 >= 0)
      v19 = v17;
    else
      v19 = -v17;
    v9 = (v19 + v6) & ~((v19 + v6) >> 63);
    objc_msgSend(v4, "_regions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") - 1;

    if (v9 >= v21)
      v9 = v21;
  }
  objc_msgSend(*(id *)(a1 + 32), "setIndexOfCurrentDetent:", v9);
  _UISheetTransitionSpringParametersHighSpeed(v11 >= v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "animator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setInteractionEndedSpringParameters:", v22);

  objc_msgSend(*(id *)(a1 + 32), "setDragSource:", 0);
}

@end
