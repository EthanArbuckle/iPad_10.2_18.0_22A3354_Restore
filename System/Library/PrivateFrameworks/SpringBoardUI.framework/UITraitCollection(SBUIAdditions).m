@implementation UITraitCollection(SBUIAdditions)

+ (id)traitCollectionWithUserInterfaceStyleCompatibleWithLegibilitySettings:()SBUIAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v9;

  v3 = a3;
  v4 = v3;
  v9 = 0.0;
  if (!v3
    || ((objc_msgSend(v3, "primaryColor"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "getWhite:alpha:", &v9, 0),
         v5,
         v9 <= 0.5)
      ? (v6 = 1)
      : (v6 = 2),
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", v6, v9),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
