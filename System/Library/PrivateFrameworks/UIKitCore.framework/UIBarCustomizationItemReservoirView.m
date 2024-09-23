@implementation UIBarCustomizationItemReservoirView

void __54___UIBarCustomizationItemReservoirView_initWithItems___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "_minimumLineSpacing");
  v3 = v2;
  objc_msgSend(v5, "flowLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumLineSpacing:", v3);

  objc_msgSend(v5, "invalidateLayoutAndForceUpdate:", 0);
}

uint64_t __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

void __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _OWORD v23[3];
  _OWORD v24[2];
  __int128 v25;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v24[0] = *MEMORY[0x1E0C9BAA8];
    v13 = v24[0];
    v24[1] = v14;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v12 = v25;
    objc_msgSend(v2, "setTransform:", v24);
    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v23[1] = v14;
    v23[2] = v12;
    objc_msgSend(v3, "setTransform:", v23);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 13.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v22, 0.6, 0.6);
    v7 = *(void **)(a1 + 32);
    v21 = v22;
    objc_msgSend(v7, "setTransform:", &v21);
    CGAffineTransformMakeScale(&v20, 0.2, 0.2);
    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    objc_msgSend(v8, "setTransform:", &v19);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 21.6666667;
  }
  objc_msgSend(v4, "_setContinuousCornerRadius:", v6);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "transform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  objc_msgSend(v11, "setTransform:", v15);

}

void __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_3(uint64_t a1)
{
  id v2;

  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v2, 0, *(_QWORD *)(a1 + 32), 0);

}

uint64_t __48___UIBarCustomizationItemReservoirView_addItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLabelVisible:", 1);
}

@end
