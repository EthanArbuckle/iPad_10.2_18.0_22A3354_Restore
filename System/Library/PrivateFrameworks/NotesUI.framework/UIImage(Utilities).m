@implementation UIImage(Utilities)

+ (id)ic_systemImageNamed:()Utilities
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend((id)ic_systemImageCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_6:
    v13 = v7;
    goto LABEL_7;
  }
  objc_msgSend(a1, "ic_symbolsNeedingUIAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (!v9)
  {
    objc_msgSend(a1, "ic_symbolsNeedingPrivateCatalog");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v4);

    objc_msgSend(a1, "ic_systemImageNamed:usePrivateCatalog:", v4, v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x1E0CB34D0];
  ICUIFrameworkBundleIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

+ (id)ic_systemImageNamed:()Utilities usePrivateCatalog:
{
  if (a4)
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_symbolsNeedingPrivateCatalog
{
  if (ic_symbolsNeedingPrivateCatalog_token != -1)
    dispatch_once(&ic_symbolsNeedingPrivateCatalog_token, &__block_literal_global_0);
  return (id)ic_symbolsNeedingPrivateCatalog_symbolsNeedingPrivateCatalog;
}

- (id)ic_decodeInBackground
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "imageRendererFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scale");
  objc_msgSend(v2, "setScale:");
  v3 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "size");
  v4 = (void *)objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__UIImage_Utilities__ic_decodeInBackground__block_invoke;
  v7[3] = &unk_1E5C1D740;
  v7[4] = a1;
  objc_msgSend(v4, "imageWithActions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ic_scaledImageWithSize:()Utilities scale:
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  if (_UIApplicationIsExtension())
  {
    objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "imageRendererFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScale:", a4);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v9, a2, a3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__UIImage_Utilities__ic_scaledImageWithSize_scale___block_invoke;
    v12[3] = &unk_1E5C1D680;
    v12[4] = a1;
    *(double *)&v12[5] = a2;
    *(double *)&v12[6] = a3;
    objc_msgSend(v10, "imageWithActions:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (uint64_t)ic_scaledImageMaxDimension:()Utilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  return objc_msgSend(a1, "ic_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (uint64_t)ic_CGImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

+ (id)ic_imageWithContentsOfURL:()Utilities
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0DC3870];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);
  return v7;
}

+ (id)ic_imageNamed:()Utilities withTint:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a4;
  objc_msgSend(v5, "imageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_imageWithTint:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ic_imageNamed:()Utilities withTint:size:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0DC3870];
  v10 = a6;
  objc_msgSend(v9, "imageNamed:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_imageWithTint:size:", v10, a1, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)ic_symbolsNeedingUIAsset
{
  if (ic_symbolsNeedingUIAsset_token[0] != -1)
    dispatch_once(ic_symbolsNeedingUIAsset_token, &__block_literal_global_15);
  return (id)ic_symbolsNeedingUIAsset_symbolsNeedingUIAsset;
}

+ (uint64_t)ic_systemImageNamed:()Utilities pointSize:
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:pointSize:");
}

+ (void)ic_cacheSystemImages
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (ic_systemImageCache)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[UIImage(Utilities) ic_cacheSystemImages]", 1, 0, CFSTR("ic_cacheSystemImages should only be called once at launch"));
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "+[UIImage(Utilities) ic_cacheSystemImages]", 1, 0, CFSTR("Unexpected call from main thread"));
    v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v1 = objc_msgSend(&unk_1E5C719D0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v1)
    {
      v2 = v1;
      v3 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v9 != v3)
            objc_enumerationMutation(&unk_1E5C719D0);
          v5 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "setObject:forKey:", v6, v5);

        }
        v2 = objc_msgSend(&unk_1E5C719D0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v2);
    }
    v7 = (void *)ic_systemImageCache;
    ic_systemImageCache = (uint64_t)v0;

  }
}

- (id)ic_imageWithTint:()Utilities
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "size");
  objc_msgSend(a1, "ic_imageWithTint:size:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ic_imageWithTint:()Utilities size:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v9, "setScale:");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v9, a2, a3);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__UIImage_Utilities__ic_imageWithTint_size___block_invoke;
  v15[3] = &unk_1E5C1D658;
  v18 = a2;
  v19 = a3;
  v20 = 0;
  v21 = 0;
  v22 = a2;
  v23 = a3;
  v16 = v8;
  v17 = a1;
  v12 = v8;
  objc_msgSend(v11, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)ic_scaledImageMinDimension:()Utilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  return objc_msgSend(a1, "ic_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (id)ic_imageFromRect:()Utilities
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGImage *v15;
  CGImage *v16;
  void *v17;
  double v18;
  void *v19;
  CGRect v21;

  objc_msgSend(a1, "scale");
  if (v10 > 1.0)
  {
    objc_msgSend(a1, "scale");
    a2 = a2 * v11;
    objc_msgSend(a1, "scale");
    a3 = a3 * v12;
    objc_msgSend(a1, "scale");
    a4 = a4 * v13;
    objc_msgSend(a1, "scale");
    a5 = a5 * v14;
  }
  v15 = (CGImage *)objc_msgSend(a1, "ic_CGImage");
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  v16 = CGImageCreateWithImageInRect(v15, v21);
  v17 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "scale");
  objc_msgSend(v17, "imageWithCGImage:scale:orientation:", v16, objc_msgSend(a1, "imageOrientation"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v16);
  return v19;
}

- (id)ic_imageWithBackgroundColor:()Utilities
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "size");
  v6 = (void *)objc_msgSend(v5, "initWithSize:");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__UIImage_Utilities__ic_imageWithBackgroundColor___block_invoke;
  v10[3] = &unk_1E5C1D568;
  v11 = v4;
  v12 = a1;
  v7 = v4;
  objc_msgSend(v6, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ic_UIImageFromCIImage:()Utilities
{
  id v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  CGSize v13;

  v3 = a3;
  objc_msgSend(v3, "extent");
  v5 = v4;
  v7 = v6;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContext(v13);
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCIImage:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "drawInRect:", v8, v9, v5, v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)ic_orientedImageFromCGImage:()Utilities scale:transform:
{
  __int128 v8;
  __int128 v9;
  CGFloat v10;
  CGFloat v11;
  double Width;
  double Height;
  __int128 v14;
  CGFloat v15;
  double v16;
  double v17;
  double x;
  double y;
  CGContext *v20;
  CGContext *v21;
  __int128 v22;
  CGImage *Image;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CGAffineTransform v34;
  CGAffineTransform transform;
  CGRect v36;
  CGRect v37;

  v8 = a5[1];
  *(_OWORD *)&v34.a = *a5;
  *(_OWORD *)&v34.c = v8;
  *(_OWORD *)&v34.tx = a5[2];
  CGAffineTransformInvert(&transform, &v34);
  v9 = *(_OWORD *)&transform.c;
  *a5 = *(_OWORD *)&transform.a;
  a5[1] = v9;
  a5[2] = *(_OWORD *)&transform.tx;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  Width = (double)CGImageGetWidth(a4);
  Height = (double)CGImageGetHeight(a4);
  v14 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v14;
  *(_OWORD *)&transform.tx = a5[2];
  v15 = v10;
  *(CGFloat *)&v14 = v11;
  v16 = Width;
  v17 = Height;
  v36 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v14 - 8), &transform);
  x = v36.origin.x;
  y = v36.origin.y;
  v20 = (CGContext *)TSUCreateRGBABitmapContext();
  if (!v20)
    goto LABEL_4;
  v21 = v20;
  CGContextTranslateCTM(v20, -x, -y);
  v22 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v22;
  *(_OWORD *)&transform.tx = a5[2];
  CGContextConcatCTM(v21, &transform);
  v37.origin.x = v10;
  v37.origin.y = v11;
  v37.size.width = Width;
  v37.size.height = Height;
  CGContextDrawImage(v21, v37, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  if (!Image
    || (objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:scale:orientation:", Image, 0, a1),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        CGImageRelease(Image),
        !v24))
  {
LABEL_4:
    v25 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[UIImage(Utilities) ic_orientedImageFromCGImage:scale:transform:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

+ (id)ic_orientedImageFromImage:()Utilities fromOrientation:
{
  CGImage *v3;
  _OWORD v5[6];

  v3 = (CGImage *)objc_msgSend(a3, "ic_CGImage");
  CGImageGetWidth(v3);
  CGImageGetHeight(v3);
  ICTransformFromImageOrientation();
  memset(v5, 0, sizeof(v5));
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_orientedImageFromCGImage:scale:transform:", v3, v5, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ic_orientedImageFromImage:()Utilities toOrientation:
{
  CGImage *v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = (CGImage *)objc_msgSend(a3, "ic_CGImage");
  CGImageGetWidth(v3);
  CGImageGetHeight(v3);
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  ICTransformFromImageOrientation();
  v4 = (void *)MEMORY[0x1E0DC3870];
  memset(&v6, 0, sizeof(v6));
  CGAffineTransformInvert(&v7, &v6);
  objc_msgSend(v4, "ic_orientedImageFromCGImage:scale:transform:", v3, &v7, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)ic_imageWithCGImage:()Utilities scale:orientation:
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:");
}

+ (uint64_t)ic_imageWithData:()Utilities
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:");
}

- (uint64_t)ic_horizontallyMirroredImage
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = objc_msgSend(a1, "ic_CGImage");
  objc_msgSend(a1, "scale");
  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v3, 4);
}

- (uint64_t)ic_imageCenteredWithBackgroundColor:()Utilities size:
{
  return objc_msgSend(a1, "ic_imageCenteredWithBackgroundColor:size:cornerRadius:", a3, a4, 0.0);
}

- (id)ic_imageCenteredWithBackgroundColor:()Utilities size:cornerRadius:
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a2, a3);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__UIImage_Utilities__ic_imageCenteredWithBackgroundColor_size_cornerRadius___block_invoke;
  v15[3] = &unk_1E5C1D6A8;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v16 = v10;
  v17 = a1;
  v12 = v10;
  objc_msgSend(v11, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ic_orientationMetadataFromImageOrientation:()Utilities
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) > 6)
    v3 = 1;
  else
    v3 = dword_1ACA58278[a3 - 1];
  v7 = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)ic_JPEGData
{
  return objc_msgSend(a1, "ic_JPEGDataWithOrientation:", objc_msgSend(a1, "ic_imageOrientation"));
}

- (id)ic_JPEGDataWithOrientation:()Utilities
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ic_PNGData
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_PNGDataWithOrientation:()Utilities
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ic_PDFData
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CD0DB8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DC8]), "initWithImage:", a1);
  objc_msgSend(v2, "insertPage:atIndex:", v3, 0);
  objc_msgSend(v2, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ic_imageDataWithUTType:()Utilities
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "ic_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "ic_imageOrientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a1, "ic_imageDataWithUTType:metadata:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ic_imageDataWithUTType:()Utilities metadata:
{
  __CFString *v6;
  const __CFDictionary *v7;
  __CFData *v8;
  CGImageDestination *v9;
  CGImageDestination *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v6 = a3;
  v7 = a4;
  v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v9 = CGImageDestinationCreateWithData(v8, v6, 1uLL, 0);
  if (!v9)
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[UIImage(Utilities) ic_imageDataWithUTType:metadata:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_10;
  }
  v10 = v9;
  CGImageDestinationAddImage(v9, (CGImageRef)objc_msgSend(a1, "ic_CGImage"), v7);
  if (!CGImageDestinationFinalize(v10))
  {
    v20 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[UIImage(Utilities) ic_imageDataWithUTType:metadata:].cold.2((uint64_t)v6, v20);

    CFRelease(v10);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  CFRelease(v10);
  v11 = (void *)-[__CFData copy](v8, "copy");
LABEL_11:

  return v11;
}

+ (id)ic_fileIconForURL:()Utilities withPreferredSize:
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  char v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForURL:isContentManaged:sourceAuditToken:", a5, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v7, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || (objc_msgSend(v8, "size"), v10 < a1) || (objc_msgSend(v9, "size"), v11 < a2))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v7, 6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        if (!v9
          || (objc_msgSend(v12, "size"), v15 = v14, objc_msgSend(v9, "size"), v15 > v16)
          && (objc_msgSend(v13, "size"), v18 = v17, objc_msgSend(v9, "size"), v18 > v19))
        {
          v20 = v13;

          v9 = v20;
        }

      }
      else if (!v9)
      {
        v23 = 1;
        goto LABEL_16;
      }
    }
    objc_msgSend(v9, "size");
    if (v21 >= a1)
    {
      objc_msgSend(v9, "size");
      if (v22 >= a2)
        goto LABEL_22;
    }
    v23 = 0;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v7, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24
      && ((v23 & 1) != 0
       || (objc_msgSend(v24, "size"), v27 = v26, objc_msgSend(v9, "size"), v27 > v28)
       && (objc_msgSend(v25, "size"), v30 = v29, objc_msgSend(v9, "size"), v30 > v31)))
    {

      v9 = v25;
    }
    else
    {

      if (!v9)
      {
        v34 = 1;
        goto LABEL_26;
      }
    }
LABEL_22:
    objc_msgSend(v9, "size");
    if (v32 >= a1)
    {
      objc_msgSend(v9, "size");
      if (v33 >= a2)
      {
LABEL_32:

        return v9;
      }
    }
    v34 = 0;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v7, 7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      if ((v34 & 1) != 0
        || (objc_msgSend(v35, "size"), v38 = v37, objc_msgSend(v9, "size"), v38 > v39)
        && (objc_msgSend(v36, "size"), v41 = v40, objc_msgSend(v9, "size"), v41 > v42))
      {
        v43 = v36;

        v9 = v43;
      }
    }

    goto LABEL_32;
  }
  v9 = 0;
  return v9;
}

- (void)ic_decodeWithCompletion:()Utilities
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v4 = ic_decodeWithCompletion__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&ic_decodeWithCompletion__onceToken, &__block_literal_global_51);
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_2;
  v13 = &unk_1E5C1D718;
  v14 = a1;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "blockOperationWithBlock:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ic_decodeWithCompletion__drawingDecodingOperationQueue, "addOperation:", v9, v10, v11, v12, v13, v14);

}

+ (id)ic_imageWithColor:()Utilities size:
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a1;
  v13.height = a2;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a1;
  v14.size.height = a2;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (double)ic_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:
{
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  double v15;
  float v16;
  double v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v11 = 0;
  v12 = 0;
  v13 = CGRectGetWidth(*(CGRect *)(&a3 - 2)) / a5;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = a3;
  v19.size.height = a4;
  v14 = CGRectGetHeight(v19) / a6;
  v15 = a5 * fminf(v13, v14);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = a3;
  v20.size.height = a4;
  v16 = (CGRectGetWidth(v20) - v15) * 0.5;
  v17 = roundf(v16);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectGetHeight(v21);
  return a1 + v17;
}

- (void)ic_cropRectZeroAlpha
{
  CGImage *v2;
  uint64_t v3;
  CGContext *v4;
  size_t Width;
  size_t Height;
  unsigned __int8 *Data;
  size_t v8;
  size_t v9;
  size_t v10;
  unsigned __int8 *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  CGRect v22;

  v2 = (CGImage *)objc_msgSend(a1, "ic_CGImage");
  v3 = objc_msgSend(a1, "ic_newARGB8BitmapContextFromImage:", v2);
  if (v3)
  {
    v4 = (CGContext *)v3;
    Width = CGImageGetWidth(v2);
    Height = CGImageGetHeight(v2);
    v22.size.height = (double)Height;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = (double)Width;
    CGContextDrawImage(v4, v22, v2);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v4);
    CGContextRelease(v4);
    if (Data)
    {
      if (Height)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = Data;
        v12 = Height;
        v13 = Width;
        do
        {
          if (Width)
          {
            v14 = 0;
            v15 = v11;
            do
            {
              v17 = *v15;
              v15 += 4;
              v16 = v17;
              if (v13 >= v14)
                v18 = v14;
              else
                v18 = v13;
              if (v10 <= v14)
                v19 = v14;
              else
                v19 = v10;
              if (v12 >= v8)
                v20 = v8;
              else
                v20 = v12;
              if (v9 <= v8)
                v21 = v8;
              else
                v21 = v9;
              if (v16)
              {
                v13 = v18;
                v12 = v20;
                v10 = v19;
                v9 = v21;
              }
              ++v14;
            }
            while (Width != v14);
            v11 += 4 * Width;
          }
          ++v8;
        }
        while (v8 != Height);
      }
      free(Data);
      objc_msgSend(a1, "scale");
    }
  }
}

- (CGContextRef)ic_newARGB8BitmapContextFromImage:()Utilities
{
  size_t Width;
  size_t Height;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v7;
  void *v8;
  void *v9;
  CGContextRef v10;

  Width = CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB)
    return 0;
  v7 = DeviceRGB;
  v8 = malloc_type_malloc(4 * Width * Height, 0xBB5841ABuLL);
  if (v8)
  {
    v9 = v8;
    v10 = CGBitmapContextCreate(v8, Width, Height, 8uLL, 4 * Width, v7, 2u);
    if (!v10)
      free(v9);
  }
  else
  {
    v10 = 0;
  }
  CGColorSpaceRelease(v7);
  return v10;
}

+ (void)ic_orientedImageFromCGImage:()Utilities scale:transform:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", a5, a6, a7, a8, 0);
}

- (void)ic_imageDataWithUTType:()Utilities metadata:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Failed to create CGImageDestinationRef", a5, a6, a7, a8, 0);
}

- (void)ic_imageDataWithUTType:()Utilities metadata:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[UIImage(Utilities) ic_imageDataWithUTType:metadata:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

@end
