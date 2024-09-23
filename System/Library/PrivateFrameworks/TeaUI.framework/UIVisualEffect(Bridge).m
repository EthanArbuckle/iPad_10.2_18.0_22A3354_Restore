@implementation UIVisualEffect(Bridge)

+ (uint64_t)ts_sideBarEffect
{
  return 0;
}

+ (uint64_t)ts_sideBarSelectionEffect
{
  return 0;
}

+ (id)ts_visualEffectsForBarWithBackgroundColor:()Bridge
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F50], "effectCompositingColor:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ts_visualEffectsForWhiteBackgroundBarAppearance
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  v17 = 0;
  v18 = 0;
  v6 = 0x3FE0000000000000;
  v7 = 0;
  v10 = 0;
  v11 = 0x3FE0000000000000;
  v12 = 0u;
  v13 = 0u;
  v15 = 0;
  v16 = 0;
  v14 = 0x3FE0000000000000;
  v19 = xmmword_1B16C26F0;
  v20 = vdupq_n_s64(0x3FDF0A3D70A3D70AuLL);
  v21 = 0x3FE0000000000000;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", &v6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v17 = 0;
  v18 = 0;
  v6 = 0x3FC3333333333333;
  v7 = 0;
  v10 = 0;
  v11 = 0x3FC3333333333333;
  v12 = 0u;
  v13 = 0u;
  v15 = 0;
  v16 = 0;
  v14 = 0x3FC3333333333333;
  v19 = xmmword_1B16C2700;
  v20 = vdupq_n_s64(0x3FEB333333333333uLL);
  v21 = 0x3FEB333333333333;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v3;
  v22[2] = v0;
  v22[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ts_visualEffectsForBlackBackgroundBarAppearance
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v19;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  v17 = 0;
  v18 = 0;
  v6 = 0x3FE0000000000000;
  v7 = 0;
  v10 = 0;
  v11 = 0x3FE0000000000000;
  v12 = 0u;
  v13 = 0u;
  v15 = 0;
  v16 = 0;
  v14 = 0x3FE0000000000000;
  v19 = (int64x2_t)xmmword_1B16C26F0;
  v20 = vdupq_n_s64(0x3FDF0A3D70A3D70AuLL);
  v21 = 0x3FE0000000000000;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", &v6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v17 = 0;
  v18 = 0;
  v6 = 0x3FC3333333333333;
  v7 = 0;
  v10 = 0;
  v11 = 0x3FC3333333333333;
  v12 = 0u;
  v13 = 0u;
  v15 = 0;
  v16 = 0;
  v14 = 0x3FC3333333333333;
  v19 = vdupq_n_s64(0x3FC3333333333333uLL);
  v20 = v19;
  v21 = 0x3FEB333333333333;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v3;
  v22[2] = v0;
  v22[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)ts_blurEffectWithNewBarStyle
{
  return objc_msgSend(MEMORY[0x1E0DC3510], "_effectWithStyle:invertAutomaticStyle:", 1100, 0);
}

+ (id)ts_floatingTabBarEffect
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.25, 0.06);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.75, 0.75, 1.0, 0.06);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3658];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__UIVisualEffect_Bridge__ts_floatingTabBarEffect__block_invoke;
  v12[3] = &unk_1E6309540;
  v13 = v1;
  v14 = v0;
  v3 = v0;
  v4 = v1;
  objc_msgSend(v2, "colorWithDynamicProvider:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0DC3F50], "effectCompositingColor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectCombiningEffects:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
