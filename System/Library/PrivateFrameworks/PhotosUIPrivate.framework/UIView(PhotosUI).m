@implementation UIView(PhotosUI)

- (uint64_t)pu_addTransform:()PhotosUI
{
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  objc_msgSend(a1, "transform");
  t1 = v10;
  memset(&v9, 0, sizeof(v9));
  v5 = a3[1];
  *(_OWORD *)&v7.a = *a3;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = a3[2];
  CGAffineTransformConcat(&v9, &t1, &v7);
  t1 = v9;
  return objc_msgSend(a1, "setTransform:", &t1);
}

- (uint64_t)pu_setCenterAndBoundsForFrameRect:()PhotosUI
{
  double MidX;
  CGRect v12;

  MidX = CGRectGetMidX(*(CGRect *)&a2);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  objc_msgSend(a1, "setCenter:", MidX, CGRectGetMidY(v12));
  return objc_msgSend(a1, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a4, a5);
}

- (void)pu_removeAllGeometryAnimationsRecursively:()PhotosUI
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("position")) & 1) != 0
          || (objc_msgSend(v9, "hasPrefix:", CFSTR("bounds")) & 1) != 0
          || (objc_msgSend(v9, "hasPrefix:", CFSTR("opacity")) & 1) != 0
          || objc_msgSend(v9, "hasPrefix:", CFSTR("transform")))
        {
          objc_msgSend(v3, "removeAnimationForKey:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  if (a3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "pu_removeAllGeometryAnimationsRecursively:", 1);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

+ (double)pu_layoutMarginWidthForCurrentScreenSize
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;

  if (v2 >= v4)
    v2 = v4;
  objc_msgSend(MEMORY[0x1E0D7B560], "legacyLayoutMarginWidthInterpolator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForMetric:", v2);
  v7 = v6;

  return v7;
}

+ (void)_pu_animateWithDuration:()PhotosUI enforced:animations:completion:
{
  void (**v9)(_QWORD);
  void (**v10)(id, uint64_t);
  dispatch_time_t v11;
  _QWORD block[4];
  void (**v13)(id, uint64_t);

  v9 = a5;
  v10 = a6;
  if (a1 == 0.0)
  {
    v9[2](v9);
    if (v10)
      v10[2](v10, 1);
  }
  else if ((a4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, a1);
    if (v10)
    {
      v11 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__UIView_PhotosUI___pu_animateWithDuration_enforced_animations_completion___block_invoke;
      block[3] = &unk_1E58ABAC8;
      v13 = v10;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v9, v10, a1);
  }

}

+ (uint64_t)pu_animateWithEnforcedDuration:()PhotosUI animations:completion:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 1, a3, a4);
}

+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:completion:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 0, a3, a4);
}

+ (uint64_t)pu_animateWithDuration:()PhotosUI animations:
{
  return objc_msgSend(a1, "_pu_animateWithDuration:enforced:animations:completion:", 0, a3, 0);
}

+ (void)pu_transitionWithView:()PhotosUI duration:options:animations:completion:
{
  id v11;
  void *v12;
  id v13;

  v11 = a7;
  v13 = v11;
  if (a1 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", a4, a5, a6, v11, a1);
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, id))(a6 + 16))(a6, v11);
  v12 = v13;
  if (v13)
  {
    (*((void (**)(void))v13 + 2))();
LABEL_5:
    v12 = v13;
  }

}

+ (long)pu_springOscillationRootAtIndex:()PhotosUI forMass:stiffness:damping:initialVelocity:
{
  double v11;
  double v12;
  double v13;
  void *v17;

  v11 = sqrt(a4 * a5);
  v12 = a6 / (v11 + v11);
  if (v12 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIView+PhotosUI.m"), 75, CFSTR("The specified damped spring system is critically or over damped, and doesn't oscillate."));

  }
  v13 = sqrt(a5 / a4);
  return -(atan(1.0 / (-(a7 - v12 * v13) / (v13 * sqrt(1.0 - v12 * v12)))) - (double)a3 * 3.14159265) / (v13 * a5);
}

@end
