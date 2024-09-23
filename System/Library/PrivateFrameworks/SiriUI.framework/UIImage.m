@implementation UIImage

void __106__UIImage_UIKit_SiriUIFrameworkAdditions__siriui_semiTransparentChevronImageWithColor_allowNaturalLayout___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UITableNext"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_flatImageWithColor:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage;
  siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage = v3;

}

@end
