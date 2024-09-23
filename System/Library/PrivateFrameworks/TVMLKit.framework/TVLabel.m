@implementation TVLabel

void __30___TVLabel_setAttributedText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection") == 1;
    objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_setCurrentTintColor:", v6);

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30___TVLabel_setAttributedText___block_invoke_2;
    v7[3] = &unk_24EB854F8;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v7);
    objc_destroyWeak(&v8);

  }
}

void __30___TVLabel_setAttributedText___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

void __30___TVLabel_setAttributedText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v11;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_accessibilityHigherContrastTintColorForColor:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x24BDF6600];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BDF6600], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);

  }
}

void __27___TVLabel_setHighlighted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection") == 1;
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v4, "tv_highlightColor");
    else
      objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_setCurrentTintColor:", v6);

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __27___TVLabel_setHighlighted___block_invoke_2;
    v7[3] = &unk_24EB854F8;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v7);
    objc_destroyWeak(&v8);

  }
}

void __27___TVLabel_setHighlighted___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

@end
