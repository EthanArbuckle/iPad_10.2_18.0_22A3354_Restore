@implementation UIHitTestGestureContainer

BOOL ___UIHitTestGestureContainer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (*(double (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  performHitTest(v4, a2, v5, v6, v7, v8, *(double *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = v9;
  if (!v9)
    v11 = *(void **)(v10 + 40);
  objc_storeStrong((id *)(v10 + 40), v11);

  return v9 != 0;
}

@end
