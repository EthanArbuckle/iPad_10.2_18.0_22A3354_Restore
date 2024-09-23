@implementation RUIHalfSheetDetent

- (RUIHalfSheetDetent)init
{
  RUIHalfSheetDetent *v3;

  +[_UISheetDetent _detentWithContainerViewBlock:](RUIHalfSheetDetent, "_detentWithContainerViewBlock:", &__block_literal_global_4);
  v3 = (RUIHalfSheetDetent *)objc_claimAutoreleasedReturnValue();

  return v3;
}

double __26__RUIHalfSheetDetent_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  BOOL v4;
  double v5;
  double v6;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RUIHalfSheetDetent shouldUsePadHeightForTraitCollection:](RUIHalfSheetDetent, "shouldUsePadHeightForTraitCollection:", v3);

  if (v4)
  {
    v5 = 648.0;
  }
  else
  {
    objc_msgSend(v2, "safeAreaInsets");
    v5 = 500.0 - v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)shouldUsePadHeightForTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2 && objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

@end
