@implementation UIImage(Utilities)

+ (id)vk_imageWithContentsOfURL:()Utilities
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CEA638];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);
  return v7;
}

+ (id)vk_imageNamed:()Utilities withTint:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a4;
  objc_msgSend(v5, "imageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  objc_msgSend(v7, "vk_imageWithTint:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)vk_imageNamed:()Utilities withTint:size:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0CEA638];
  v10 = a6;
  objc_msgSend(v9, "imageNamed:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vk_imageWithTint:size:", v10, a1, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)vk_imageWithTint:()Utilities size:
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
  objc_msgSend(MEMORY[0x1E0CEA618], "defaultFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v9, "setScale:");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v9, a2, a3);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__UIImage_Utilities__vk_imageWithTint_size___block_invoke;
  v15[3] = &unk_1E9465DD0;
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

- (id)vk_imageView
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0CEA658]);
  objc_msgSend(a1, "size");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", VKMRectWithSize());
  objc_msgSend(v3, "setImage:", a1);
  return v3;
}

- (uint64_t)vk_scaledImageMinDimension:()Utilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  return objc_msgSend(a1, "vk_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (uint64_t)vk_scaledImageMaxDimension:()Utilities scale:
{
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "size");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  return objc_msgSend(a1, "vk_scaledImageWithSize:scale:", round(v6 * (a2 / v8)), round(v7 * (a2 / v8)), a3);
}

- (id)vk_scaledImageWithSize:()Utilities scale:
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  objc_msgSend(a1, "imageRendererFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScale:", a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v8, a2, a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__UIImage_Utilities__vk_scaledImageWithSize_scale___block_invoke;
  v12[3] = &unk_1E9465DF8;
  v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  objc_msgSend(v9, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)vk_symbolImageWithName:()Utilities
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:");
}

- (id)vk_imageFromSubrect:()Utilities
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGImage *v16;
  CGImage *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGRect v25;

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
  v15 = objc_retainAutorelease(a1);
  if (objc_msgSend(v15, "CGImage"))
  {
    v16 = (CGImage *)objc_msgSend(v15, "vk_cgImage");
    v25.origin.x = a2;
    v25.origin.y = a3;
    v25.size.width = a4;
    v25.size.height = a5;
    v17 = CGImageCreateWithImageInRect(v16, v25);
    v18 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v15, "scale");
    objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v17);
  }
  else
  {
    objc_msgSend(v15, "CIImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v15, "CIImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageByCroppingToRect:", a2, a3, a4, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCIImage:", v23);

    }
    else
    {
      v20 = 0;
    }
  }
  return v20;
}

+ (id)vk_UIImageFromCIImage:()Utilities
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
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCIImage:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "drawInRect:", v8, v9, v5, v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)vk_orientedImageFromCGImage:()Utilities scale:transform:
{
  CGFloat v8;
  CGFloat v9;
  double Width;
  double Height;
  __int128 v12;
  CGFloat v13;
  double v14;
  double v15;
  double x;
  double y;
  CGContext *v18;
  CGContext *v19;
  __int128 v20;
  CGImage *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;

  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  Width = (double)CGImageGetWidth(image);
  Height = (double)CGImageGetHeight(image);
  v12 = a5[1];
  *(_OWORD *)&v32.a = *a5;
  *(_OWORD *)&v32.c = v12;
  *(_OWORD *)&v32.tx = a5[2];
  v13 = v8;
  *(CGFloat *)&v12 = v9;
  v14 = Width;
  v15 = Height;
  v33 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &v32);
  x = v33.origin.x;
  y = v33.origin.y;
  v18 = VKMCreateRGBABitmapContext(0, v33.size.width, v33.size.height, a4);
  if (!v18)
    goto LABEL_4;
  v19 = v18;
  CGContextTranslateCTM(v18, -x, -y);
  v20 = a5[1];
  *(_OWORD *)&v32.a = *a5;
  *(_OWORD *)&v32.c = v20;
  *(_OWORD *)&v32.tx = a5[2];
  CGContextConcatCTM(v19, &v32);
  v34.origin.x = v8;
  v34.origin.y = v9;
  v34.size.width = Width;
  v34.size.height = Height;
  CGContextDrawImage(v19, v34, image);
  v21 = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  if (!v21
    || (objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:scale:orientation:", v21, 0, a4),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        CGImageRelease(v21),
        !v22))
  {
LABEL_4:
    v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[UIImage(Utilities) vk_orientedImageFromCGImage:scale:transform:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v22;
}

+ (id)vk_orientedImageFromImage:()Utilities fromOrientation:
{
  uint64_t v5;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v5 = objc_msgSend(a3, "vk_cgImage");
  memset(&v9, 0, sizeof(v9));
  vk_transformToImageOrientation(a4, (uint64_t)&v9);
  v7 = v9;
  CGAffineTransformInvert(&v8, &v7);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_orientedImageFromCGImage:scale:transform:", v5, &v8, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vk_orientedImageFromImage:()Utilities toOrientation:
{
  uint64_t v5;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = objc_msgSend(a3, "vk_cgImage");
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  vk_transformFromImageOrientation(a4, (uint64_t)&v8);
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_orientedImageFromCGImage:scale:transform:", v5, v7, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vk_imageWithCIImage:()Utilities
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA638];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCIImage:", v4);

  return v5;
}

- (uint64_t)vk_cgImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

- (uint64_t)vk_cgImageGeneratingIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;

  v2 = objc_msgSend(a1, "vk_cgImage");
  if (!v2)
  {
    objc_msgSend(a1, "vk_ciImage");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
      objc_msgSend(v4, "extent");
      v6 = (const void *)objc_msgSend(v5, "createCGImage:fromRect:", v4);
      if (v6)
      {
        v2 = (uint64_t)v6;
        CFAutorelease(v6);

        return v2;
      }

    }
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UIImage(Utilities) vk_cgImageGeneratingIfNecessary].cold.1((uint64_t)a1, v7);

    return 0;
  }
  return v2;
}

+ (uint64_t)vk_imageWithCGImage:()Utilities scale:orientation:
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:");
}

+ (id)vk_imageWithCVPixelBuffer:()Utilities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithCIImage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)vk_imageWithData:()Utilities
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:");
}

- (uint64_t)vk_horizontallyMirroredImage
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CEA638];
  v3 = objc_msgSend(a1, "vk_cgImage");
  objc_msgSend(a1, "scale");
  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v3, 4);
}

- (uint64_t)vk_cgImagePropertyOrientation
{
  return vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(a1, "vk_imageOrientation"));
}

+ (id)vk_orientationMetadataFromImageOrientation:()Utilities
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
    v3 = dword_1D2ED1440[a3 - 1];
  v7 = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)vk_JPEGData
{
  return objc_msgSend(a1, "vk_JPEGDataWithOrientation:", objc_msgSend(a1, "vk_imageOrientation"));
}

- (id)vk_JPEGDataWithOrientation:()Utilities
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vk_PNGData
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vk_PNGDataWithOrientation:()Utilities
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)vk_HEICDataWithCompressionQuality:()Utilities
{
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:orientation:", objc_msgSend(a1, "vk_imageOrientation"), a2);
}

- (id)vk_HEICDataWithCompressionQuality:()Utilities orientation:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBC780]);

  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)vk_HEICData
{
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:", 0.7);
}

- (uint64_t)vk_HEICDataLossless
{
  return objc_msgSend(a1, "vk_HEICDataWithCompressionQuality:", 1.0);
}

- (id)vk_imageDataWithUTType:()Utilities
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
    objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "vk_imageOrientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a1, "vk_imageDataWithUTType:metadata:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)vk_imageDataWithUTType:()Utilities metadata:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  vk_dataFromCGImage((CGImage *)objc_msgSend(a1, "vk_cgImage"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)vk_imageDataWithRequirements:()Utilities
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__UIImage_Utilities__vk_imageDataWithRequirements___block_invoke;
  v7[3] = &unk_1E9465E20;
  v7[4] = &v8;
  objc_msgSend(a1, "vk_imageDataWithRequirements:completion:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)vk_imageDataWithRequirements:()Utilities completion:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  CGImage *v11;
  void *v12;
  void *v13;
  double Width;
  double Height;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  CGImage *ResizedCGImage;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void (**v33)(id, void *, double, double);
  id v34;
  _QWORD v35[7];

  v35[6] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  objc_msgSend(v34, "uti");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v34, "uti");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(v34, "uti");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if ((v32 & 1) == 0)
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "validUTI", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, CFSTR("UTI should be HEIC, JPEG, or PNG."));
      goto LABEL_5;
    }

  }
LABEL_5:
  if (!objc_msgSend(v34, "maxLength"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, CFSTR("The max length requirement should be greater than zero."));
  if (!objc_msgSend(v34, "minLength"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.minLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, CFSTR("The min length requirement should be greater than zero."));
  if (!objc_msgSend(v34, "maxDataLength"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxDataLength > 0", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, CFSTR("The max data length requirement should be greater than zero."));
  v10 = objc_msgSend(v34, "maxLength");
  if (v10 <= objc_msgSend(v34, "minLength"))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "requirements.maxLength > requirements.minLength", "-[UIImage(Utilities) vk_imageDataWithRequirements:completion:]", 0, 0, CFSTR("The max length requirement should not be less than the min length requirement."));
  v11 = (CGImage *)objc_msgSend(a1, "vk_cgImage");
  objc_msgSend((id)objc_opt_class(), "vk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "vk_imageOrientation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  Width = (double)CGImageGetWidth(v11);
  Height = (double)CGImageGetHeight(v11);
  v35[0] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)objc_msgSend(v34, "maxLength"));
  v35[1] = v16;
  v35[2] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)(objc_msgSend(v34, "maxLength") - objc_msgSend(v34, "minLength")) * 0.5+ (double)(unint64_t)objc_msgSend(v34, "minLength"));
  v35[3] = v17;
  v18 = 0;
  v35[4] = VKMClampSizeToMaxLength(Width, Height, (double)(unint64_t)objc_msgSend(v34, "minLength"));
  v35[5] = v19;
  v20 = *MEMORY[0x1E0CBC780];
  do
  {
    v21 = (double *)&v35[2 * v18];
    v22 = *v21;
    v23 = v21[1];
    ResizedCGImage = vk_createResizedCGImage(v11, (unint64_t)*v21, (unint64_t)v23);
    v25 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1D2ED1428[v25]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v20);

      objc_msgSend(v34, "uti");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      vk_dataFromCGImage(ResizedCGImage, v27, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "length");
      if (v29 <= objc_msgSend(v34, "maxDataLength"))
        break;

      if (++v25 == 3)
      {
        CGImageRelease(ResizedCGImage);
        goto LABEL_19;
      }
    }
    CGImageRelease(ResizedCGImage);
    Height = v23;
    Width = v22;
    if (v28)
      goto LABEL_21;
LABEL_19:
    ++v18;
  }
  while (v18 != 3);
  v28 = 0;
  v22 = Width;
  v23 = Height;
LABEL_21:
  v33[2](v33, v28, v22, v23);

}

+ (id)vk_fileIconForURL:()Utilities withPreferredSize:
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
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v7, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || (objc_msgSend(v8, "size"), v10 < a1) || (objc_msgSend(v9, "size"), v11 < a2))
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v7, 6);
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
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v7, 4);
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
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v7, 7);
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

- (void)vk_decodeWithCompletion:()Utilities
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

  v4 = vk_decodeWithCompletion__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&vk_decodeWithCompletion__onceToken, &__block_literal_global_41);
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke_2;
  v13 = &unk_1E9462BA8;
  v14 = a1;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "blockOperationWithBlock:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)vk_decodeWithCompletion__drawingDecodingOperationQueue, "addOperation:", v9, v10, v11, v12, v13, v14);

}

- (id)vk_decodeInBackground
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
  v3 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(a1, "size");
  v4 = (void *)objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__UIImage_Utilities__vk_decodeInBackground__block_invoke;
  v7[3] = &unk_1E9464C68;
  v7[4] = a1;
  objc_msgSend(v4, "imageWithActions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)vk_imageWithColor:()Utilities size:
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

+ (double)vk_aspectFitImageFrameForViewWithFrame:()Utilities imageSize:
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

- (void)vk_cropRectZeroAlpha
{
  CGImage *v2;
  CGColorSpace *v3;
  CGContext *v4;
  size_t Width;
  size_t Height;
  unsigned __int8 *Data;
  size_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  size_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  size_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  CGRect v21;

  v2 = (CGImage *)objc_msgSend(a1, "vk_cgImage");
  v3 = vk_newARGB8BitmapContextFromImage(v2);
  if (v3)
  {
    v4 = v3;
    Width = CGImageGetWidth(v2);
    Height = CGImageGetHeight(v2);
    v21.size.height = (double)Height;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = (double)Width;
    CGContextDrawImage(v4, v21, v2);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v4);
    if (Data)
    {
      if (Height)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = Height;
        v12 = Width;
        do
        {
          if (Width)
          {
            v13 = 0;
            v14 = Data;
            do
            {
              v16 = *v14;
              v14 += 4;
              v15 = v16;
              if (v12 >= v13)
                v17 = v13;
              else
                v17 = v12;
              if (v10 <= v13)
                v18 = v13;
              else
                v18 = v10;
              if (v11 >= v8)
                v19 = v8;
              else
                v19 = v11;
              if (v9 <= v8)
                v20 = v8;
              else
                v20 = v9;
              if (v15)
              {
                v12 = v17;
                v11 = v19;
                v10 = v18;
                v9 = v20;
              }
              ++v13;
            }
            while (Width != v13);
            Data += 4 * Width;
          }
          ++v8;
        }
        while (v8 != Height);
      }
      CGContextRelease(v4);
      objc_msgSend(a1, "scale");
    }
    else
    {
      CGContextRelease(v4);
    }
  }
}

+ (void)vk_orientedImageFromCGImage:()Utilities scale:transform:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", a5, a6, a7, a8, 0);
}

- (void)vk_cgImageGeneratingIfNecessary
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Error creating CGImage from image: %@", (uint8_t *)&v2, 0xCu);
}

@end
