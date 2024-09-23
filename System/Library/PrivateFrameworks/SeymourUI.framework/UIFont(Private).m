@implementation UIFont(Private)

+ (id)_smu_preferredFontForTextStyle:()Private design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = (void *)MEMORY[0x24BEBB520];
  v13 = a7;
  v14 = a6;
  v15 = a3;
  objc_msgSend(a1, "_stringForSystemDesign:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v15, v16, objc_msgSend(a1, "_underlyingVariantForVariant:", a5), v14, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (uint64_t)_underlyingVariantForVariant:()Private
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 == 0x10000)
    v3 = 0x10000;
  else
    v3 = 0;
  if (a3 == 1280)
    v3 = 1280;
  if (a3 == 1024)
    v4 = 1024;
  else
    v4 = 0;
  if (a3 == 512)
    v4 = 512;
  if (a3 <= 1279)
    v3 = v4;
  if (a3 == 256)
    v5 = 256;
  else
    v5 = 0;
  if (a3 == 8)
    v5 = 8;
  if (a3 == 4)
    v6 = 4;
  else
    v6 = 0;
  if (a3 == 2)
    v6 = 2;
  if (a3 <= 7)
    v5 = v6;
  if (a3 <= 511)
    return v5;
  else
    return v3;
}

+ (id)_stringForSystemDesign:()Private
{
  if (a3 <= 3)
    a1 = **((id **)&unk_24F555CC8 + a3);
  return a1;
}

+ (id)smu_preferredFontForTextStyle:()Private variant:
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BEBB520];
  v7 = a3;
  objc_msgSend(v6, "_preferredFontForTextStyle:variant:", v7, objc_msgSend(a1, "_underlyingVariantForVariant:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)smu_preferredFontForTextStyle:()Private design:variant:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x24BEBB520];
  v9 = a3;
  objc_msgSend(a1, "_stringForSystemDesign:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_preferredFontForTextStyle:design:variant:", v9, v10, objc_msgSend(a1, "_underlyingVariantForVariant:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)smu_preferredFontForTextStyle:()Private design:variant:compatibleWithTraitCollection:
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x24BEBB520];
  v11 = a6;
  v12 = a3;
  objc_msgSend(a1, "_stringForSystemDesign:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_preferredFontForTextStyle:design:variant:compatibleWithTraitCollection:", v12, v13, objc_msgSend(a1, "_underlyingVariantForVariant:", a5), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)_smu_preferredFontForTextStyle:()Private maximumContentSizeCategory:compatibleWithTraitCollection:
{
  return objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:");
}

+ (id)_smu_preferredFontForTextStyle:()Private variant:maximumContentSizeCategory:compatibleWithTraitCollection:
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x24BEBB520];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(a1, "_stringForSystemDesign:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v13, v14, objc_msgSend(a1, "_underlyingVariantForVariant:", a4), v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
