@implementation UIBasicHeaderFooterContentView

uint64_t __57___UIBasicHeaderFooterContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __49___UIBasicHeaderFooterContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

void __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(id *)((char *)WeakRetained + OBJC_IVAR____UIBasicHeaderFooterContentView__configuration[v4]);
    if (WeakRetained[55] != v5)
    {
      v6 = (char *)WeakRetained;
      -[_UIBasicHeaderFooterContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }

}

void __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_2(uint64_t a1)
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

uint64_t __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

@end
