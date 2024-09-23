@implementation UIFloatingTabBarItemView

uint64_t __49___UIFloatingTabBarItemView__createViewHierarchy__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateFontAndColors");
}

void __49___UIFloatingTabBarItemView__updateFontAndColors__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v2);

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

@end
