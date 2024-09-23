@implementation UIImage(WKAdditions)

+ (id)wk_imageWithContentsOfURL:()WKAdditions
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(v3, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("cpbitmap"));

    v10 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v3, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v10, "imageWithContentsOfCPBitmapFile:flags:", v11, 0);
    else
      objc_msgSend(v10, "imageWithContentsOfFile:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)wk_imageFromColor:()WKAdditions
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  void *v7;
  CGSize v9;
  CGRect v10;

  v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContext(v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v7;
}

+ (uint64_t)wk_internalSystemName:()WKAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
}

+ (id)wk_imageWithLightAppearanceImage:()WKAdditions darkAppearanceImage:
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)v7;
  if (!(v6 | v7))
  {
    v14 = (id)objc_opt_new();
LABEL_8:
    v13 = v14;
    goto LABEL_9;
  }
  if (!v7)
  {
    v14 = (id)v6;
    goto LABEL_8;
  }
  if (!v6)
  {
    v14 = (id)v7;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionByModifyingTraits:", &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionByModifyingTraits:", &__block_literal_global_4_3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = v11;
  v17[0] = v6;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wk_dynamicImageWithTraitCollectionToImageMap:baseImage:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

+ (id)wk_overlayForegroundImage:()WKAdditions overBackgroundImage:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  double v23;
  double v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v18 = (id)objc_opt_new();
LABEL_8:
    v17 = v18;
    goto LABEL_9;
  }
  if (!v6)
  {
    v18 = (id)v5;
    goto LABEL_8;
  }
  if (!v5)
  {
    v18 = (id)v6;
    goto LABEL_8;
  }
  objc_msgSend((id)v6, "size");
  v9 = v8;
  objc_msgSend((id)v5, "size");
  v11 = fmax(v9, v10);
  objc_msgSend(v7, "size");
  v13 = v12;
  objc_msgSend((id)v5, "size");
  v15 = fmax(v13, v14);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v11, v15);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__UIImage_WKAdditions__wk_overlayForegroundImage_overBackgroundImage___block_invoke;
  v20[3] = &unk_1E6EF9F58;
  v23 = v11;
  v24 = v15;
  v21 = v7;
  v22 = (id)v5;
  objc_msgSend(v16, "imageWithActions:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v17;
}

+ (id)wk_splitThumbnailWithLightAppearanceImage:()WKAdditions darkAppearanceImage:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[12];

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v29 = (id)objc_opt_new();
LABEL_8:
    v28 = v29;
    goto LABEL_9;
  }
  if (!v6)
  {
    v29 = (id)v5;
    goto LABEL_8;
  }
  if (!v5)
  {
    v29 = (id)v6;
    goto LABEL_8;
  }
  objc_msgSend((id)v5, "size");
  v9 = v8 * 0.5;
  objc_msgSend((id)v5, "size");
  v11 = v10;
  objc_msgSend((id)v5, "scale");
  v13 = WKSizeApplyScale(v9, v11, v12);
  v15 = v14;
  objc_msgSend(v7, "size");
  v17 = v16 * 0.5;
  objc_msgSend(v7, "size");
  v19 = v18;
  objc_msgSend(v7, "scale");
  v21 = WKSizeApplyScale(v17, v19, v20);
  v23 = v22;
  objc_msgSend((id)v5, "wk_cropImageToRect:", 0.0, 0.0, v13, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wk_cropImageToRect:", v21, 0.0, v21, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = fmax(v15, v23);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v13 + v21, v26);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __86__UIImage_WKAdditions__wk_splitThumbnailWithLightAppearanceImage_darkAppearanceImage___block_invoke;
  v31[3] = &unk_1E6EF9F80;
  *(double *)&v31[6] = v13 + v21;
  *(double *)&v31[7] = v26;
  *(double *)&v31[8] = v13;
  *(double *)&v31[9] = v15;
  *(double *)&v31[10] = v21;
  *(double *)&v31[11] = v23;
  v31[4] = v24;
  v31[5] = v25;
  objc_msgSend(v27, "imageWithActions:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v28;
}

+ (id)wk_dynamicImageWithTraitCollectionToImageMap:()WKAdditions baseImage:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v8 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    v8 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v8)
          v8 = v13;
        objc_msgSend(v8, "imageAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "registerImage:withTraitCollection:", v14, v12);

      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v8;
}

- (id)wk_cropImageToRect:()WKAdditions
{
  CGImage *v9;
  CGImage *v10;
  void *v11;
  CGRect v13;

  v9 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  v10 = CGImageCreateWithImageInRect(v9, v13);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v10);
  return v11;
}

@end
