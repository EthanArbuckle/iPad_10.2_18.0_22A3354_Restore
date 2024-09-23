@implementation WTTextPlaceholderController

void __48___WTTextPlaceholderController_beginPlaceholder__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;
    v6 = v3;

    objc_msgSend(*(id *)(a1 + 32), "_beginShowingShimmerHighlightsWithCaretRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48___WTTextPlaceholderController_beginPlaceholder__block_invoke_2;
    v9[3] = &unk_251C073B8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    v7 = *(_OWORD *)(a1 + 56);
    v11 = *(_OWORD *)(a1 + 40);
    v12 = v7;
    v8 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

uint64_t __48___WTTextPlaceholderController_beginPlaceholder__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_beginShowingShimmerHighlightsWithCaretRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __79___WTTextPlaceholderController__visualRectsForRects_containerBounds_caretRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  double MinY;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  void *v22;
  void *v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "count") - 1 == a3;
  v8 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "_widthRatioForIteration:isFinal:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v7);
  v10 = v8 * v9;
  objc_msgSend(v6, "rect");
  MinX = CGRectGetMinX(v24);
  objc_msgSend(v6, "rect");
  MinY = CGRectGetMinY(v25);
  objc_msgSend(v6, "rect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  Height = CGRectGetHeight(v26);
  if (*(_QWORD *)(a1 + 96) == 1)
    MinX = *(double *)(a1 + 80) - v10;
  v22 = *(void **)(a1 + 48);
  +[WTTextSelectionRect rectWithRect:](WTTextSelectionRect, "rectWithRect:", MinX, MinY + 1.5, v10, Height + -1.5 + -1.5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

void __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateEffectForPhase:", 2);

}

void __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateEffectForPhase:", 3);

}

void __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateEffectForPhase:", 0);

}

void __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_2;
    v6[3] = &unk_251C07430;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

uint64_t __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
