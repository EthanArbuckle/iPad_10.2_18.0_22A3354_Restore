@implementation UITextFloatingCursorSession

uint64_t __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "_setCursorFadedHiddenForFloatingCursor:animated:", 0, 0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeFromSuperview");
}

void __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "superview");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", v10, v3, v5, v7, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:");

}

uint64_t __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
