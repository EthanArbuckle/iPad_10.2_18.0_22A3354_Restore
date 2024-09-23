@implementation UITextDragCaretView

uint64_t __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", v4);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39___UITextDragCaretView__performUpdate___block_invoke(uint64_t a1)
{
  const CGPath *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  __int128 v37;
  _OWORD v38[3];

  v2 = CGPathRetain((CGPathRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "path"));
  v3 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "_caretColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v4);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
    objc_msgSend(v6, "caretRectForPosition:", *(_QWORD *)(a1 + 40));
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
    objc_msgSend(v15, "textInputView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertRect:fromView:", v16, v8, v10, v12, v14);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = 0;
  }
  else
  {
    objc_msgSend(v3, "_rangeColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v26);

    objc_msgSend(*(id *)(a1 + 32), "_configureMask:withPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(_QWORD *)(a1 + 48));
    v18 = v27;
    v20 = v28;
    v22 = v29;
    v24 = v30;
    v25 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v18, v20, v22, v24);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mask");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v32 == v25)
  {
    v34 = *(unsigned __int8 *)(a1 + 64);

    if (v34)
    {
      objc_msgSend(v25, "animationForKey:", CFSTR("bounds"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v35, "copy");

      objc_msgSend(v33, "setKeyPath:", CFSTR("path"));
      objc_msgSend(v33, "setFromValue:", v2);
      objc_msgSend(v25, "addAnimation:forKey:", v33, CFSTR("path"));
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMask:", v25);
LABEL_9:

  CGPathRelease(v2);
  v36 = *(void **)(a1 + 32);
  v37 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v38[0] = *MEMORY[0x1E0C9BAA8];
  v38[1] = v37;
  v38[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v36, "setTransform:", v38);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __39___UITextDragCaretView__performUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 416));
  objc_msgSend(WeakRetained, "_caretRect");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.8, 0.8);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
