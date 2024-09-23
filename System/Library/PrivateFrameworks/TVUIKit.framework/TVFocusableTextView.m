@implementation TVFocusableTextView

id __38___TVFocusableTextView_initWithFrame___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDF6EF8]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v1, "setBackgroundColor:", 0);
  objc_msgSend(v1, "setTextContainerInset:", 0.0, -5.0, 0.0, -5.0);
  objc_msgSend(v1, "setScrollEnabled:", 0);
  objc_msgSend(v1, "setEditable:", 0);
  objc_msgSend(v1, "setUserInteractionEnabled:", 0);
  objc_msgSend(v1, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v1, "setSelectable:", 0);
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 0.0);

  objc_msgSend(v1, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumNumberOfLines:", 0);

  objc_msgSend(v1, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  return v1;
}

uint64_t __70___TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __43___TVFocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v16, "mutableCopy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x24BEBB490]);
    v12 = v11;

    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v12, "setAlignment:", 4);
    v13 = *MEMORY[0x24BEBB3A8];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BEBB3A8], a3, a4);
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    v8 = v16;
  }

}

void __43___TVFocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

    v10 = *MEMORY[0x24BEBB368];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BEBB368], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);

  }
}

@end
