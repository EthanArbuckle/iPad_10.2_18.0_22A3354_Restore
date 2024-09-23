@implementation UIAlertController

void __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_1325);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTextFieldResults:", v3);

  objc_msgSend(a1[5], "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[5], "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

uint64_t __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stickySelection") ^ 1;
}

__CFString *__61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24EF60C48;
  v4 = v2;

  return v4;
}

id __57__UIAlertController_AlertPresenter__setButtons_forAlert___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "actionForButton:inAlert:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isPreferred");

  if ((_DWORD)v4)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
  return v6;
}

@end
