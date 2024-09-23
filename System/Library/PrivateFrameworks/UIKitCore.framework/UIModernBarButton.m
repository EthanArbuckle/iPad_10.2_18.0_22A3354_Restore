@implementation UIModernBarButton

void __47___UIModernBarButton__setupForUseAsImageButton__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setOverridingSymbolConfiguration:", v5);

  objc_msgSend(v6, "setNeedsLayout");
}

@end
