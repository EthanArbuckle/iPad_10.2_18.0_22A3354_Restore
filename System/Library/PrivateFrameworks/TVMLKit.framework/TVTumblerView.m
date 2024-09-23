@implementation TVTumblerView

uint64_t __32___TVTumblerView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 48), "arrowLeading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "focusedItemIndex") <= 0)
    v3 = 0.0;
  else
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

  objc_msgSend(*(id *)(a1 + 48), "arrowTrailing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "focusedItemIndex") >= *(_QWORD *)(a1 + 120) - 1)
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(v4, "setAlpha:", v5);

  return objc_msgSend(*(id *)(a1 + 48), "performSelector:withObject:afterDelay:", sel__enableMove, 0, 0.1);
}

uint64_t __32___TVTumblerView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex") != *(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_markItemViewForReuse:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "unfocusedItemIndex");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setUnfocusedItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
  return result;
}

void __40___TVTumblerView__markItemViewForReuse___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

@end
