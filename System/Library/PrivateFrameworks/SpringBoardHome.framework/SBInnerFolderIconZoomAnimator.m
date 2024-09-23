@implementation SBInnerFolderIconZoomAnimator

void __51___SBInnerFolderIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(v5, "iconLayerWithInfo:traitCollection:options:", *(_QWORD *)(a1 + 32), 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v7);

    objc_msgSend(v8, "bounds");
    UIRectGetCenter();
    objc_msgSend(v7, "setPosition:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "gridCellImageOfSize:forIcon:iconImageInfo:compatibleWithTraitCollection:", v5, *(_QWORD *)(a1 + 32), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
  }

  if ((objc_msgSend(v5, "isTimedOut") & 1) != 0 || objc_msgSend(v5, "progressState"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    objc_msgSend(v10, "setValue:forKey:", v12, *MEMORY[0x1E0CD2D00]);

    objc_msgSend(v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v14);

  }
  objc_msgSend(v6, "prepareToCrossfadeImageWithView:options:", v8, 2);

}

uint64_t __51___SBInnerFolderIconZoomAnimator__cleanupAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cleanupAfterCrossfade");
}

uint64_t __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyIconCrossfadeForZoomFraction:", *(double *)(a1 + 40));
}

uint64_t __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyIconTransformForZoomFraction:", *(double *)(a1 + 40));
}

uint64_t __69___SBInnerFolderIconZoomAnimator__applyIconCrossfadeForZoomFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCrossfadeFraction:", *(double *)(a1 + 32));
}

void __69___SBInnerFolderIconZoomAnimator__applyIconTransformForZoomFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  double v10;
  double v11;
  float64x2_t v12;

  v12 = 0uLL;
  v10 = 0.0;
  v11 = 0.0;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_calculateZoomedOffset:scale:forIcon:withView:", &v12, &v10, a2, v6);
  memset(&v9, 0, sizeof(v9));
  v7 = *(double *)(a1 + 40);
  CGAffineTransformMakeScale(&v9, v7 * (v10 + -1.0) + 1.0, v7 * (v11 + -1.0) + 1.0);
  *(float64x2_t *)&v9.tx = vmulq_n_f64(v12, v7);
  v8 = v9;
  objc_msgSend(v6, "setTransform:", &v8);

}

@end
