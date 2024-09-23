@implementation PBUIWallpaperInactiveTreatment

- (id)applyToImage:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v10 = (void *)getPIParallaxLegacyPosterStyleClass_softClass;
  v23 = getPIParallaxLegacyPosterStyleClass_softClass;
  if (!getPIParallaxLegacyPosterStyleClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getPIParallaxLegacyPosterStyleClass_block_invoke;
    v19[3] = &unk_1E6B94840;
    v19[4] = &v20;
    __getPIParallaxLegacyPosterStyleClass_block_invoke((uint64_t)v19);
    v10 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v20, 8);
  if (v11)
  {
    v18 = 0;
    objc_msgSend(v11, "applyInactiveStyleToImage:error:", v9, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (v13 || !v12)
    {
      if (a5)
      {
        v13 = objc_retainAutorelease(v13);
        v14 = 0;
        *a5 = v13;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = v12;
      v12 = v14;
    }
    goto LABEL_13;
  }
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v24[0] = *MEMORY[0x1E0CB2D60];
    v24[1] = v16;
    v25[0] = CFSTR("<PIParallaxLegacyPosterStyle> could not be loaded.");
    v25[1] = CFSTR("Check that it should exist on this platform and that you are able to link it.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.PBUIRenderer"), 1, v13);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v9;
LABEL_13:

    goto LABEL_14;
  }
  v14 = 0;
  v12 = v9;
LABEL_14:

  return v14;
}

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2D80];
    v10[0] = *MEMORY[0x1E0CB2D60];
    v10[1] = v7;
    v11[0] = CFSTR("PBUIWallpaperInactiveTreatment does not support CoreAnimation rendering.");
    v11[1] = CFSTR("Use a PBUIRenderer that support CoreImage.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.PBUIRenderer"), 1, v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBUIWallpaperInactiveTreatment init](+[PBUIWallpaperInactiveTreatment allocWithZone:](PBUIWallpaperInactiveTreatment, "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIWallpaperInactiveTreatment)initWithCoder:(id)a3
{
  PBUIWallpaperInactiveTreatment *v4;

  v4 = objc_alloc_init(PBUIWallpaperInactiveTreatment);

  return v4;
}

@end
