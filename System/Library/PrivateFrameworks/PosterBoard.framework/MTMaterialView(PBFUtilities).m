@implementation MTMaterialView(PBFUtilities)

+ (id)pbf_materialView
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 54);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackdropScaleAdjustment:", &__block_literal_global_41);
  return v0;
}

+ (uint64_t)pbf_dockView
{
  return objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
}

+ (uint64_t)pbf_iconView
{
  return objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
}

- (void)pbf_scaleBlurRadiusByAmount:()PBFUtilities
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  if ((BSFloatIsOne() & 1) == 0)
  {
    objc_msgSend(a1, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKeyPath:", v7, CFSTR("filters.gaussianBlur.inputRadius"));

  }
}

@end
