@implementation SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice

void __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke()
{
  double v0;
  void *v1;
  void *v2;
  _QWORD aBlock[5];

  v0 = __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_2();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_3;
  aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&aBlock[4] = v0;
  v1 = _Block_copy(aBlock);
  v2 = (void *)SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler;
  SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler = (uint64_t)v1;

}

double __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  double result;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  result = 0.25;
  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 0.25);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sbf_homescreenBlurGraphicsQuality");

    result = 0.25;
    if (v4 == 100)
      return 0.5;
  }
  return result;
}

double __SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) / a2;
}

@end
