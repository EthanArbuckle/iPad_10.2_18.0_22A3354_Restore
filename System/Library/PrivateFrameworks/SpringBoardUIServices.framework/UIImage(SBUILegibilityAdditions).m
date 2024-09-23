@implementation UIImage(SBUILegibilityAdditions)

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:
{
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double Height;
  double v25;
  char v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v41[9];
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  CGRect v61;

  v18 = a6;
  v19 = a7;
  v20 = a11;
  v21 = SBUILegibilityImageSizeForContentSizeAndSettings(v18, a2);
  v23 = v22;
  UIRectCenteredIntegralRectScale();
  Height = CGRectGetHeight(v61);
  objc_msgSend(v18, "minFillHeight", *(_QWORD *)&a1);
  if (Height < v25)
    v26 = a8;
  else
    v26 = 0;
  if (a10 == 4)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(v18, "shadowColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  v60 = 0;
  v28 = v21 * 0.2;
  v29 = v23 * 0.2;
  v30 = (void *)MEMORY[0x1E0CEA638];
  v31 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke;
  v42[3] = &unk_1E4C3F5F0;
  v48 = ceilf(v28);
  v49 = ceilf(v29);
  v50 = a2;
  v51 = a3;
  v52 = a1;
  v32 = v27;
  v43 = v32;
  v54 = v26;
  v33 = v19;
  v44 = v33;
  v34 = v18;
  v45 = v34;
  v47 = &v55;
  v53 = a10;
  v35 = v20;
  v46 = v35;
  v36 = (id)objc_msgSend(v30, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a10, v35, v42, v48, v49, a1);
  if (a9)
  {
    objc_msgSend((id)v56[5], "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v34, a10, v35, *a9, v21, v23);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41[0] = v31;
    v41[1] = 3221225472;
    v41[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_3;
    v41[3] = &unk_1E4C3F618;
    v41[5] = 0;
    v41[6] = 0;
    v41[4] = &v55;
    *(double *)&v41[7] = v21;
    *(double *)&v41[8] = v23;
    objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a10, v35, v41, v21, v23, a1);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;

  _Block_object_dispose(&v55, 8);
  return v38;
}

- (id)sbui_strikeImageForLegibilitySettings:()SBUILegibilityAdditions strength:size:type:pool:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;

  v14 = a6;
  v15 = a8;
  v16 = a1;
  v17 = v16;
  if (a2 > 0.0)
  {
    objc_msgSend(v16, "scale");
    v19 = v18;
    if (v14)
    {
      objc_msgSend(v14, "shadowSettings");
      v20 = *((_QWORD *)&v32 + 1);
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v20 = 0;
    }
    v21 = (void *)MEMORY[0x1E0CEA638];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __98__UIImage_SBUILegibilityAdditions__sbui_strikeImageForLegibilitySettings_strength_size_type_pool___block_invoke;
    v24[3] = &unk_1E4C3F5C8;
    v26 = v20;
    v27 = a2;
    v25 = v17;
    v28 = 0;
    v29 = 0;
    v30 = a3;
    v31 = a4;
    v22 = v17;
    objc_msgSend(v21, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", a7, v15, v24, 0, a3, a4, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:
{
  id v17;
  id v18;
  id v19;
  void *v20;

  v17 = a10;
  v18 = a7;
  v19 = a6;
  objc_msgSend((id)objc_opt_class(), "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:", v19, v18, a8, 0, a9, v17, a1, a2, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:pool:
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  objc_msgSend(a1, "size");
  objc_msgSend(v10, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:type:pool:", v9, a1, 4, v8, a2, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:type:pool:
{
  id v15;
  id v16;
  id v17;
  void *v18;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  objc_msgSend((id)objc_opt_class(), "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", v17, v16, 1, a8, v15, a1, a2, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
