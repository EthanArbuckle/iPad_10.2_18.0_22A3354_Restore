@implementation UIClickHighlightInteractionEffect

void __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double Width;
  double Height;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 32), "targetedPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_previewMode");

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v5 = 1.0;
    v6 = 1.0;
    if (v4 == 1)
      v6 = fmax(fmin(*(double *)(a1 + 56) / 0.1, 1.0), 0.0);
    objc_msgSend(*(id *)(a1 + 40), "setBackgroundAlpha:", v6);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v7 == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "anchorView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setZPosition:", 100.0);

      objc_msgSend(*(id *)(a1 + 48), "maximumProgress");
      v18 = (*(double *)(a1 + 56) + -1.0) / (v17 + -1.0);
      objc_msgSend(*(id *)(a1 + 40), "bounds");
      Width = CGRectGetWidth(v35);
      objc_msgSend(*(id *)(a1 + 40), "bounds");
      Height = CGRectGetHeight(v36);
      if (Width >= Height)
        Height = Width;
      v21 = _UIPlatterLiftScaleForEdgeDimensions(Height);
      v5 = fmax(fmin(1.0 - v18 + v18 * v21, v21), 1.0);
      objc_msgSend(*(id *)(a1 + 40), "setShadowAlpha:", v18 + (1.0 - v18) * 0.0);
    }
    else if (v7 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "bounds");
      x = v33.origin.x;
      y = v33.origin.y;
      v10 = v33.size.width;
      v11 = v33.size.height;
      v12 = CGRectGetWidth(v33);
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = v10;
      v34.size.height = v11;
      v13 = CGRectGetHeight(v34);
      if (v12 >= v13)
        v13 = v12;
      v14 = fmin((v13 + -14.36) / v13, 0.96);
      if (v14 < 0.87)
        v14 = 0.87;
      v5 = 1.0 - *(double *)(a1 + 56) + *(double *)(a1 + 56) * v14;
    }
    if (_AXSReduceMotionEnabled())
      v5 = 1.0;
    objc_msgSend(*(id *)(a1 + 40), "anchorView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProgress:", 1.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setShadowAlpha:", 0.0);
    v5 = 1.0;
    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 40), "setBackgroundAlpha:", 0.0);
  }
  objc_msgSend(*(id *)(a1 + 32), "continuationPreview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "_isVisible");

  if (v24)
    objc_msgSend(*(id *)(a1 + 32), "continuationPreview");
  else
    objc_msgSend(*(id *)(a1 + 32), "targetedPreview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "target");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    objc_msgSend(v26, "transform");
  else
    memset(&v31, 0, sizeof(v31));
  v32 = v31;

  v31 = v32;
  CGAffineTransformScale(&v30, &v31, v5, v5);
  objc_msgSend(*(id *)(a1 + 40), "anchorView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v30;
  objc_msgSend(v28, "setTransform:", &v29);

}

uint64_t __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_2(uint64_t a1)
{
  int has_internal_diagnostics;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (has_internal_diagnostics)
  {
    if (v3 < 0)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Over-decremented highlight effect animation count!", buf, 2u);
      }

    }
  }
  else if (v3 < 0)
  {
    v6 = kClickHighlightMatchMoveAnimationKey_block_invoke___s_category;
    if (!kClickHighlightMatchMoveAnimationKey_block_invoke___s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&kClickHighlightMatchMoveAnimationKey_block_invoke___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Over-decremented highlight effect animation count!", v8, 2u);
    }
  }
  result = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(result + 16) && !*(_BYTE *)(result + 24))
    return objc_msgSend((id)result, "_completeHighlightEffect");
  return result;
}

uint64_t __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_42(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

@end
