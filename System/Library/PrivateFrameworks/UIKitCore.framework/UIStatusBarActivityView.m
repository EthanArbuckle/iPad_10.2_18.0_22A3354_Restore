@implementation UIStatusBarActivityView

void __38___UIStatusBarActivityView_setIsSlow___block_invoke(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "stopsAfterReversing");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 464);
    *(_QWORD *)(v4 + 464) = 0;

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "startAnimating");
  }
}

void __38___UIStatusBarActivityView_setIsSlow___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 464);
    *(_QWORD *)(v2 + 464) = 0;

  }
}

@end
