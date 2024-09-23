@implementation UIDragSetDownItemAnimation

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  id v8;
  CAFrameRateRange v9;

  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v9.minimum;
  maximum = v9.maximum;
  preferred = v9.preferred;
  objc_msgSend((id)objc_opt_class(), "defaultSingleItemAnimationForPlatterView:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_2(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  id v8;
  CAFrameRateRange v9;

  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v9.minimum;
  maximum = v9.maximum;
  preferred = v9.preferred;
  objc_msgSend((id)objc_opt_class(), "defaultMultiItemAnimationForPlatterView:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_3(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  id v8;
  CAFrameRateRange v9;

  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v9.minimum;
  maximum = v9.maximum;
  preferred = v9.preferred;
  objc_msgSend((id)objc_opt_class(), "defaultDropAnimationForPlatterView:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

void __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "animationReachedTarget");

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "animationCompleted");

}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dropContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "targetFrame");
  v5 = v4 + v3 * 0.5;
  v8 = v7 + v6 * 0.5;
  objc_msgSend(WeakRetained, "setCenter:", v5, v8, 0.0);
  objc_msgSend(v2, "_currentScreenScale");
  v10 = UIPointRoundToScale(v5, v8, v9);
  v12 = v11;
  objc_msgSend(WeakRetained, "platterContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertPoint:toCoordinateSpace:", v14, v10, v12);
  v16 = v15;
  v18 = v17;

  objc_msgSend(WeakRetained, "platterContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v16, v18);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(WeakRetained, "propertyAnimator", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_animations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i) + 16))();
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v24);
  }

}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v11;
  CATransform3D v12;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CATransform3D v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setLifted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundVisible:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShadowVisible:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setConstrainSize:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setStackRotation:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setAppliesOriginalRotation:", objc_msgSend(WeakRetained, "previewMode") != 4);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setStackRotation:", 0.0);
  v3 = 0uLL;
  memset(&v15, 0, sizeof(v15));
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "targetTransformIncludingAppliedTransform:", 0);
    v3 = 0uLL;
  }
  *(_OWORD *)&v14.c = v3;
  *(_OWORD *)&v14.tx = v3;
  *(_OWORD *)&v14.a = v3;
  v12 = v15;
  CATransform3DGetAffineTransform(&t1, &v12);
  objc_msgSend(WeakRetained, "targetedDropPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(&v11, 0, sizeof(v11));
  CGAffineTransformConcat(&v14, &t1, &v11);

  v8 = *(void **)(a1 + 48);
  objc_msgSend(WeakRetained, "targetedDropPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_duiPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unscaledSize");
  *(_OWORD *)&v12.m11 = *(_OWORD *)&v14.a;
  *(_OWORD *)&v12.m13 = *(_OWORD *)&v14.c;
  *(_OWORD *)&v12.m21 = *(_OWORD *)&v14.tx;
  objc_msgSend(v8, "applyTransform:withSize:", &v12);

}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShadowVisible:", 0);
}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundVisible:", 0);
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *(*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "animationReachedTarget");
  objc_msgSend(WeakRetained, "propertyAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_completions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__240;
  v30 = __Block_byref_object_dispose__240;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_52;
  aBlock[3] = &unk_1E16B1B28;
  v7 = v5;
  v25 = v7;
  v31 = _Block_copy(aBlock);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2_53;
  v16[3] = &unk_1E16EC4C0;
  v23 = *(_BYTE *)(a1 + 96);
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 64);
  v20 = *(_OWORD *)(a1 + 48);
  v21 = v9;
  v22 = *(_OWORD *)(a1 + 80);
  v17 = v8;
  v18 = WeakRetained;
  v19 = &v26;
  v10 = (void (**)(_QWORD))_Block_copy(v16);
  objc_msgSend(WeakRetained, "visualTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "_setDownAnimation:shouldDelaySetDownOfDragItem:completion:", v12, v13, v10);

  if ((v14 & 1) != 0)
  {
    (*(void (**)(void))(v27[5] + 16))();
    v15 = (void *)v27[5];
    v27[5] = 0;

  }
  else
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v26, 8);
}

void __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_52(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2_53(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;

  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v2, "transform");
      v3 = *(void **)(a1 + 32);
    }
    else
    {
      v3 = 0;
      memset(&t1, 0, sizeof(t1));
    }
    v4 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&t2.a = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&t2.c = v4;
    *(_OWORD *)&t2.tx = *(_OWORD *)(a1 + 88);
    CGAffineTransformConcat(&v23, &t1, &t2);
    v20 = v23;
    objc_msgSend(v3, "setTransform:", &v20);
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "updatedPreviewWasAdded");
  objc_msgSend(*(id *)(a1 + 40), "updatedAppPlatterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "removeFromSuperview");
  }
  else
  {
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(&v18, 0, sizeof(v18));
    objc_msgSend(*(id *)(a1 + 40), "updatedTargetedDropPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v17, 0, sizeof(v17));
    CGAffineTransformConcat(&v19, &v18, &v17);
    objc_msgSend(*(id *)(a1 + 40), "updatedAppPlatterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v19;
    objc_msgSend(v13, "setTransform:", &v16);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v14)
    (*(void (**)(void))(v14 + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "animationCompleted");
}

void __80___UIDragSetDownItemAnimation_reparentRetargetingContainerViewInTargetContainer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", &unk_1E1A963A0, CFSTR("filters.opacityPair.inputAmount"));

}

uint64_t __57___UIDragSetDownItemAnimation_performTrackingAnimations___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __55___UIDragSetDownItemAnimation_performSpringAnimations___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

void __57___UIDragSetDownItemAnimation_animationCompletionHandler__block_invoke(uint64_t a1)
{
  int has_internal_diagnostics;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (!--*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20))
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    if (has_internal_diagnostics)
    {
      if (!v3)
      {
        __UIFaultDebugAssertLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "The completion handler must be not be nil for this set down animation", buf, 2u);
        }

      }
    }
    else if (!v3)
    {
      v8 = _UIInternalPreference_DNDSetDownReparentingCrossfadeDuration_block_invoke___s_category;
      if (!_UIInternalPreference_DNDSetDownReparentingCrossfadeDuration_block_invoke___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_UIInternalPreference_DNDSetDownReparentingCrossfadeDuration_block_invoke___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "The completion handler must be not be nil for this set down animation", v10, 2u);
      }
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 112);
      *(_QWORD *)(v5 + 112) = 0;

    }
  }
}

uint64_t __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", &unk_1E1A963B0, CFSTR("filters.opacityPair.inputAmount"));

}

uint64_t __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setHidden:", 1);
}

void __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateTargetedDropPreview:", *(_QWORD *)(a1 + 32));

}

uint64_t __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CATransform3D v11;
  CGAffineTransform t1;
  CGAffineTransform v13;

  memset(&v13, 0, sizeof(v13));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  if (v2)
    objc_msgSend(v2, "targetTransform");
  else
    memset(&v11, 0, sizeof(v11));
  CATransform3DGetAffineTransform(&t1, &v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v13, &t1, &t2);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 160);
  objc_msgSend(*(id *)(v5 + 80), "_duiPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unscaledSize");
  v9 = v13;
  objc_msgSend(v6, "applyTransform:withSize:", &v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAlpha:", 0.0);
}

@end
