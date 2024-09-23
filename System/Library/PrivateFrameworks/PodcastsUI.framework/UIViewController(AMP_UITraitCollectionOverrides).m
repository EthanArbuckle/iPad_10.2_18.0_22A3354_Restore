@implementation UIViewController(AMP_UITraitCollectionOverrides)

- (uint64_t)layoutDirection
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "layoutDirection");

  return v2;
}

- (void)setLayoutDirection:()AMP_UITraitCollectionOverrides
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "layoutDirection") != a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLayoutDirection:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3E88];
    v10[0] = v5;
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollectionWithTraitsFromCollections:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setOverrideTraitCollection:", v9);
  }

}

@end
