@implementation SBHScreenTypeForCurrentDevice

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke()
{
  double v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t result;

  if (__sb__runningInSpringBoard())
  {
    __sb__mainScreenReferenceBounds();
    v1 = v0;
    v3 = v2;
    v5 = v4;
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_referenceBounds");
    v1 = v9;
    v3 = v10;
    v5 = v11;
    v7 = v12;

  }
  if (__sb__runningInSpringBoard())
  {
    __sb__mainScreenScale();
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v14 = v16;

  }
  v17 = SBFEffectiveArtworkSubtype();
  v18 = SBFEffectiveDeviceClass();
  v19 = SBFEffectiveHomeButtonType();
  result = _SBHScreenTypeLookup(v18, v19, v17, &__block_literal_global_2, &__block_literal_global_4, &__block_literal_global_10, v1, v3, v5, v7, v14);
  SBHScreenTypeForCurrentDevice_screenType = result;
  return result;
}

BOOL __SBHScreenTypeForCurrentDevice_block_invoke_2()
{
  return MGGetSInt32Answer() == 7;
}

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke_3()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;

  v0 = MGIsDeviceOfType();
  v1 = MGIsDeviceOfType();
  v2 = MGIsDeviceOfType();
  v3 = MGIsDeviceOfType();
  v4 = MGIsDeviceOfType();
  return v2 | v3 | v0 | v1 | v4 | MGIsDeviceOfType();
}

uint64_t __SBHScreenTypeForCurrentDevice_block_invoke_4()
{
  SBFEffectiveDisplayCornerRadius();
  return BSFloatEqualToFloat();
}

@end
