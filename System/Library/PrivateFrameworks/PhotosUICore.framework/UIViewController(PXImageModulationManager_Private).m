@implementation UIViewController(PXImageModulationManager_Private)

- (uint64_t)px_isImageModulationEnabled
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)PXImageModulationEnabledAssociationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)px_setImageModulationEnabled:()PXImageModulationManager_Private
{
  const void *v2;
  id v3;

  v2 = (const void *)PXImageModulationEnabledAssociationKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

- (double)px_effectiveHDRFocus
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "_px_imageModulationMixFactorWithPresentedViewController:", v2);
    v4 = v3;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke;
    v10[3] = &unk_1E512DE90;
    v10[4] = a1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke_2;
    v8[3] = &unk_1E512DE90;
    v9 = v2;
    v5 = PXImageModulationFloatByLinearlyInterpolatingFloats(v10, v8, v4);

  }
  else
  {
    objc_msgSend(a1, "px_HDRFocus");
    v5 = v6;
  }

  return v5;
}

- (double)px_effectiveImageModulationIntensity
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  objc_msgSend(a1, "px_topmostPresentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "_px_imageModulationMixFactorWithPresentedViewController:", v2);
    v4 = v3;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke;
    v11[3] = &unk_1E512DE90;
    v11[4] = a1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke_2;
    v9[3] = &unk_1E512DE90;
    v10 = v2;
    v5 = PXImageModulationFloatByLinearlyInterpolatingFloats(v11, v9, v4);

  }
  else
  {
    objc_msgSend(a1, "px_imageModulationIntensity");
    v5 = v6;
  }
  if (px_effectiveImageModulationIntensity_onceToken != -1)
    dispatch_once(&px_effectiveImageModulationIntensity_onceToken, &__block_literal_global_292);
  if (px_effectiveImageModulationIntensity_hookExists)
  {
    objc_msgSend(a1, "px_effectiveImageModulationIntensityWithProposedValue:", v5);
    v5 = v7;
  }

  return v5;
}

- (double)_px_imageModulationMixFactorWithPresentedViewController:()PXImageModulationManager_Private
{
  id v4;
  int v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "_appearState");
  if (v5 == 3)
  {
    v7 = objc_msgSend(a1, "px_isImageModulationEnabled") == 0;
    v8 = 1.0;
    v9 = 0.0;
LABEL_6:
    if (v7)
      v6 = v8;
    else
      v6 = v9;
    goto LABEL_10;
  }
  if (v5 == 2)
  {
    v6 = 1.0;
    goto LABEL_10;
  }
  v6 = 0.0;
  if (v5 == 1)
  {
    v7 = objc_msgSend(v4, "px_isImageModulationEnabled") == 0;
    v8 = 0.0;
    v9 = 1.0;
    goto LABEL_6;
  }
LABEL_10:

  return v6;
}

@end
