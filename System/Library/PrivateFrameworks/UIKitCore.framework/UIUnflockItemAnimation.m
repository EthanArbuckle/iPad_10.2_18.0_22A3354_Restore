@implementation UIUnflockItemAnimation

void __31___UIUnflockItemAnimation_play__block_invoke(uint64_t a1)
{
  _UIPortalView *v2;
  _UIPortalView *v3;
  void *v4;
  _UIUnflockReparentingView *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  id v33;
  id location;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v2 = [_UIPortalView alloc];
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v3 = -[_UIPortalView initWithFrame:](v2, "initWithFrame:");
  -[_UIPortalView setSourceView:](v3, "setSourceView:", *(_QWORD *)(a1 + 40));
  -[_UIPortalView setAllowsBackdropGroups:](v3, "setAllowsBackdropGroups:", 1);
  -[_UIPortalView setMatchesTransform:](v3, "setMatchesTransform:", 1);
  -[_UIPortalView setMatchesPosition:](v3, "setMatchesPosition:", 1);
  -[UIView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(a1 + 48), "insertSubview:aboveSubview:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setReparentingPortalView:", v3);

  v5 = [_UIUnflockReparentingView alloc];
  objc_msgSend(*(id *)(a1 + 56), "bounds");
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = -[UIView _subviewsNeedAxisFlipping](*(void **)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFlipsHorizontalAxis:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFilters:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKeyPath:", &unk_1E1A96120, CFSTR("filters.opacityPair.inputAmount"));

  objc_msgSend(*(id *)(a1 + 32), "positionReferenceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 56);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v18 = *(_QWORD *)(v17 + 40);
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "positionReferenceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:aboveSubview:", v18, v19);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addSubview:", *(_QWORD *)(v17 + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", _UIContextMenuConvertPointBetweenViews(*(void **)(a1 + 48), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v20, v21));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setReparentingContainerView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  _UIContextMenuGetFromPreview(*(void **)(a1 + 64), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32), (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v24 = *(double *)(v22 + 32);
  v23 = *(double *)(v22 + 40);
  objc_msgSend(*(id *)(a1 + 40), "center");
  v27 = sqrt((v25 - v24) * (v25 - v24) + (v26 - v23) * (v26 - v23));
  if (v27 < 1.0)
    v27 = 1.0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v27;
  v28 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setPositionTrackingProperty:", v28);

  objc_msgSend(*(id *)(a1 + 32), "positionTrackingProperty");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __31___UIUnflockItemAnimation_play__block_invoke_2;
  v32[3] = &unk_1E16E53A8;
  objc_copyWeak(&v33, &location);
  v31 = *(_QWORD *)(a1 + 72);
  v32[4] = *(_QWORD *)(a1 + 104);
  v32[5] = v31;
  +[UIView _createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:](UIView, "_createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v30, &__block_literal_global_551, v32);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __31___UIUnflockItemAnimation_play__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "positionTrackingProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  v5 = v4 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + -0.7;
  if (v5 <= 0.0)
    v6 = 1.0;
  else
    v6 = v5 / -0.3 + 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reparentingPortalView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setPresentationValue:forKey:", v7, CFSTR("opacity"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setPresentationValue:forKey:", v7, CFSTR("filters.opacityPair.inputAmount"));
}

uint64_t __31___UIUnflockItemAnimation_play__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

@end
