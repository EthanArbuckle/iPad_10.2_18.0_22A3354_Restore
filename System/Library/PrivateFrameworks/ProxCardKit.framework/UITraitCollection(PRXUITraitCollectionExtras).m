@implementation UITraitCollection(PRXUITraitCollectionExtras)

+ (id)prx_traitCollectionWithCardSizeClass:()PRXUITraitCollectionExtras
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_traitCollectionWithValue:forTraitNamed:", v1, CFSTR("PRXCardSizeClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)prx_cardSizeClass
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_valueForTraitNamed:", CFSTR("PRXCardSizeClass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

+ (uint64_t)prx_traitCollectionWithCustomBackgroundColor:()PRXUITraitCollectionExtras
{
  return objc_msgSend(MEMORY[0x24BDF6F30], "_traitCollectionWithValue:forTraitNamed:", a3, CFSTR("customBackgroundColor"));
}

- (uint64_t)customBackgroundColor
{
  return objc_msgSend(a1, "_valueForTraitNamed:", CFSTR("customBackgroundColor"));
}

@end
