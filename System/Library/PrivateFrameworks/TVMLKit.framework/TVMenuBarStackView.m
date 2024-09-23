@implementation TVMenuBarStackView

void __40___TVMenuBarStackView_setSelectedIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v7;
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setSelected:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) == a3);

    }
  }

}

void __49___TVMenuBarStackView__buttonEventTouchUpInside___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v8;
  else
    v7 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v7))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

@end
