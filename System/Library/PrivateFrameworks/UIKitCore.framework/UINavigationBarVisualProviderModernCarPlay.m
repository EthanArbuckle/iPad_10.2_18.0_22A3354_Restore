@implementation UINavigationBarVisualProviderModernCarPlay

uint64_t __55___UINavigationBarVisualProviderModernCarPlay_teardown__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leadingBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBarButtonGroups:", v2);

}

void __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBarButtonGroups:", v2);

}

uint64_t __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_5(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "setAlpha:", 0.0);
  objc_msgSend(a1[7], "setAlpha:", 1.0);
  objc_msgSend(a1[8], "setAlpha:", 1.0);
  return objc_msgSend(a1[9], "setAlpha:", 1.0);
}

uint64_t __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_6(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(a1[5], "removeFromSuperview");
  return objc_msgSend(a1[6], "removeFromSuperview");
}

@end
