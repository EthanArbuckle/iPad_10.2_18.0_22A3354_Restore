@implementation UIPreviewInteractionHighlighter

void __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  char v5;
  id v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  CGFloat Width;
  double v19;
  CGAffineTransform *v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));

  if (!WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 48), "effectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v14 = v13;

    v15 = objc_msgSend(*(id *)(a1 + 32), "clickEffectPhase");
    if (v15 == 2)
    {
      v16 = 1.01;
      if (*(_BYTE *)(a1 + 64))
        v16 = 1.0;
    }
    else if (v15 == 1)
    {
      objc_msgSend(v14, "frame");
      Width = CGRectGetWidth(v25);
      v19 = (Width + -14.36) / Width;
      if (v19 < 0.96)
        v19 = 0.96;
      v16 = 1.0 - *(double *)(a1 + 56) + *(double *)(a1 + 56) * v19;
    }
    else
    {
      v16 = 1.0;
      if (!v15)
      {
        v17 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(a1 + 64))
          v16 = *(double *)(v17 + 96);
        v16 = v16 + *(double *)(a1 + 56) * (*(double *)(v17 + 104) - v16);
      }
    }
    CGAffineTransformMakeScale(&v22, v16, v16);
    v21 = v22;
    v20 = &v21;
    goto LABEL_24;
  }
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "_highlightForInteraction:fractionComplete:ended:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 56));

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v7 = objc_msgSend(v6, "_highlightsAlongsideDefaultEffect");

    if (v7)
    {
      v8 = *(double *)(a1 + 56) * 0.0175 + 1.0;
      v9 = *(void **)(a1 + 48);
      if (v9)
      {
        objc_msgSend(v9, "effectView");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (uint64_t)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      }
      v14 = (void *)v10;
      CGAffineTransformMakeScale(&v24, v8, v8);
      v23 = v24;
      v20 = &v23;
LABEL_24:
      objc_msgSend(v14, "setTransform:", v20, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);

    }
  }
}

void __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v3 = objc_opt_respondsToSelector();

      if ((v3 & 1) != 0)
      {
        v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        objc_msgSend(v4, "_highlightDidEndForInteraction:", *(_QWORD *)(a1 + 48));

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_finalizeAfterInteractionIfNeeded");
    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = 0;

  }
}

uint64_t __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeAfterInteractionIfNeeded");
}

void __93___UIPreviewInteractionHighlighter__applyHighlightEffectsToViewControllerDuringCancellation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v8, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "interactiveHighlightEffectForView:options:", v4, 2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 48);
      *(_QWORD *)(v6 + 48) = v5;

    }
  }

}

uint64_t __73___UIPreviewInteractionHighlighter__prepareContentEffectsForInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareHighlightForInteraction:", *(_QWORD *)(a1 + 40));
}

uint64_t __68___UIPreviewInteractionHighlighter__setHighlighted_forViewIfNeeded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
