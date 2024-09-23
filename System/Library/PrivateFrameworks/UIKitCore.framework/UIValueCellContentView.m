@implementation UIValueCellContentView

uint64_t __49___UIValueCellContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __41___UIValueCellContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

void __44___UIValueCellContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  char *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = 2;
    if (!a2)
      v4 = 1;
    v5 = *(id *)((char *)WeakRetained + OBJC_IVAR____UIValueCellContentView__configuration[v4]);
    if (WeakRetained[55] != v5)
    {
      v6 = (char *)WeakRetained;
      -[_UIValueCellContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }

}

void __44___UIValueCellContentView_setConfiguration___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[53];
    WeakRetained[53] = 0;

    v2 = (void *)WeakRetained[52];
    WeakRetained[52] = 0;

  }
}

uint64_t __44___UIValueCellContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

uint64_t __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40) == 1)
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfLines:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 48), 99999.0);
}

void __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfLines:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 88)
    || (objc_msgSend(*(id *)(a1 + 40), "_isInLayoutSubviews") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "layer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "needsLayout"),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    if (v3 != *MEMORY[0x1E0C9D820] || v2 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

@end
