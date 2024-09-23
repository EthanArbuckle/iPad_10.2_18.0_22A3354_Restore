@implementation UIStatusBarDualIndicatorItem

void __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v5 = a4;
  if (a1[4])
  {
    objc_msgSend(a1[5], "setImage:");
    objc_msgSend(a1[6], "itemSpacing");
    v7 = v6;
    objc_msgSend(a1[6], "itemSpacingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v7);

    objc_msgSend(a1[6], "additionRemovalScale");
    v10 = v9;
    objc_msgSend(a1[6], "additionRemovalScale");
    CGAffineTransformMakeScale(&v32, v10, v11);
    v12 = a1[5];
    v31 = v32;
    objc_msgSend(v12, "setTransform:", &v31);
    objc_msgSend(a1[5], "setAlpha:", 0.0);
  }
  objc_msgSend(a1[6], "additionRemovalDuration");
  v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2;
  v27[3] = &unk_1E16B47A8;
  v28 = a1[4];
  v16 = a1[5];
  v18 = a1[5];
  v17 = a1[6];
  v29 = v16;
  v30 = v17;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3;
  v22[3] = &unk_1E16C2090;
  v23 = v18;
  v19 = a1[4];
  v20 = a1[6];
  v24 = v19;
  v25 = v20;
  v26 = v5;
  v21 = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v27, v22, v14);

}

uint64_t __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  __int128 v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  _OWORD v13[3];

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (id *)(a1 + 40);
    v2 = *(void **)(a1 + 40);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v4;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v2, "setTransform:", v13);
    v5 = 1.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "additionRemovalScale");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 48), "additionRemovalScale");
    CGAffineTransformMakeScale(&v12, v7, v8);
    v9 = *(void **)(a1 + 40);
    v3 = (id *)(a1 + 40);
    v11 = v12;
    objc_msgSend(v9, "setTransform:", &v11);
    v5 = 0.0;
  }
  return objc_msgSend(*v3, "setAlpha:", v5);
}

uint64_t __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
    if (!*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "itemSpacingConstraint");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setConstant:", 0.0);

    }
    v4 = *(void **)(a1 + 32);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
