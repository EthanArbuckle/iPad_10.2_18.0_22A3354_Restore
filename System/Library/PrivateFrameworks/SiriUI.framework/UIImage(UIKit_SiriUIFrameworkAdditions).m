@implementation UIImage(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_semiTransparentChevronImage
{
  return objc_msgSend(a1, "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 0);
}

+ (id)siriui_semiTransparentChevronImageAndAllowNaturalLayout:()UIKit_SiriUIFrameworkAdditions
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_semiTransparentTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriui_semiTransparentChevronImageWithColor:allowNaturalLayout:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)siriui_semiTransparentChevronImageWithColor:()UIKit_SiriUIFrameworkAdditions allowNaturalLayout:
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__UIImage_UIKit_SiriUIFrameworkAdditions__siriui_semiTransparentChevronImageWithColor_allowNaturalLayout___block_invoke;
  block[3] = &unk_24D7D91F8;
  v9 = v3;
  v4 = siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__onceToken, block);
  v6 = (id)siriui_semiTransparentChevronImageWithColor_allowNaturalLayout__chevronImage;

  return v6;
}

@end
