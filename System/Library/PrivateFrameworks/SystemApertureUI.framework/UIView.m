@implementation UIView

void __53__UIView_SystemApertureUIAdditions___sauiBlurKeyPath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("filters"), "stringByAppendingFormat:", CFSTR(".%@"), *MEMORY[0x24BDE5A78]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sauiBlurKeyPath___sauiBlurKeyPath;
  _sauiBlurKeyPath___sauiBlurKeyPath = v0;

}

void __64__UIView_SystemApertureUIAdditions___sauiBlurInputRadiusKeyPath__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sauiBlurKeyPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@"), *MEMORY[0x24BDE5B18]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath;
  _sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath = v1;

}

@end
