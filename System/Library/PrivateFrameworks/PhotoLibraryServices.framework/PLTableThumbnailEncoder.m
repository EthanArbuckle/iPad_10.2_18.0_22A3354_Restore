@implementation PLTableThumbnailEncoder

+ (CGImage)_createDownscaledImageFromSourceImage:(CGImage *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  int v9;
  double v10;
  double v11;
  CGImageRef SquareCroppedImage;
  CGImage *v16;
  int v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat v22;
  CGFloat v23;
  CGContext *v24;
  CGContext *v25;
  CGImage *Image;
  NSObject *v27;
  NSObject *v28;
  int v29;
  CGImage *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v31 = *MEMORY[0x1E0C80C00];
  if (_createDownscaledImageFromSourceImage_toSize_cropped__s_onceToken != -1)
    dispatch_once(&_createDownscaledImageFromSourceImage_toSize_cropped__s_onceToken, &__block_literal_global_20584);
  CGImageGetColorSpace(a3);
  v9 = CGColorSpaceEqualToColorSpace();
  v10 = (double)CGImageGetWidth(a3);
  v11 = (double)CGImageGetHeight(a3);
  if (width == v10 && height == v11 && v9 != 0)
    return CGImageRetain(a3);
  if (v5)
    SquareCroppedImage = PLThumbnailCreateSquareCroppedImage(a3);
  else
    SquareCroppedImage = CGImageRetain(a3);
  v16 = SquareCroppedImage;
  if (SquareCroppedImage)
  {
    v17 = PLSizeMake();
    CGImageGetWidth(v16);
    CGImageGetHeight(v16);
    PLSizeMake();
    PLCGSizeScaledToFitSize();
    v32.size.width = v18;
    v32.size.height = v19;
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v33 = CGRectIntegral(v32);
    x = v33.origin.x;
    y = v33.origin.y;
    v22 = v33.size.width;
    v23 = v33.size.height;
    v24 = CGBitmapContextCreate(0, (unint64_t)v33.size.width, (unint64_t)v33.size.height, 8uLL, 4 * v17, (CGColorSpaceRef)_createDownscaledImageFromSourceImage_toSize_cropped__s_targetColorSpace, 0x2002u);
    if (v24)
    {
      v25 = v24;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = v22;
      v34.size.height = v23;
      CGContextDrawImage(v24, v34, v16);
      Image = CGBitmapContextCreateImage(v25);
      CGContextRelease(v25);
    }
    else
    {
      PLThumbnailsGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = 138543362;
        v30 = v16;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Unable to create CGContext to downscale image: %{public}@", (uint8_t *)&v29, 0xCu);
      }

      Image = 0;
    }
    CGImageRelease(v16);
  }
  else
  {
    PLThumbnailsGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = 138543362;
      v30 = a3;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Unable to create square-cropped image from full size image: %{public}@", (uint8_t *)&v29, 0xCu);
    }

    return 0;
  }
  return Image;
}

+ (CGImage)_createDownscaledImageFromSource:(CGImageSource *)a3 toSize:(CGSize)a4 cropped:(BOOL)a5
{
  CGImageSource *v5;
  double height;
  double width;
  _BOOL8 v9;
  size_t PrimaryImageIndex;
  const __CFDictionary *v12;
  CGImageRef ImageAtIndex;
  CGImage *v14;
  NSObject *v15;
  int v17;
  CGImageSource *v18;
  uint64_t v19;
  _QWORD v20[2];

  v5 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    height = a4.height;
    width = a4.width;
    if (a4.width == *MEMORY[0x1E0C9D820] && a4.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      return 0;
    }
    else
    {
      v9 = a5;
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      v19 = *MEMORY[0x1E0CBD2B8];
      v20[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, PrimaryImageIndex, v12);
      if (ImageAtIndex)
      {
        v14 = ImageAtIndex;
        v5 = (CGImageSource *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", ImageAtIndex, v9, width, height);
        CGImageRelease(v14);
      }
      else
      {
        PLThumbnailsGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17 = 138543362;
          v18 = v5;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to decode full sized image from source: %{public}@", (uint8_t *)&v17, 0xCu);
        }

        v5 = 0;
      }

    }
  }
  return v5;
}

+ (id)_encodeDownscaledImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  double Width;
  __objc2_class **v25;
  unint64_t v26;
  __CFData *Mutable;
  CGImageDestinationRef v28;
  CGImageDestination *v29;
  CGColorSpace *DeviceRGB;
  CGImage *CopyWithColorSpace;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString **v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!a3 || !v9)
  {
    v11 = *MEMORY[0x1E0D74498];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61002, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_6;
  }
  v13 = objc_msgSend(v9, "thumbnailKind");
  if (v13 < 3)
  {
    v11 = *MEMORY[0x1E0D74498];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61002, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_6:
      v14 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 61001, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      goto LABEL_25;
    }
    goto LABEL_10;
  }
  if (v13 == 3)
  {
    v22 = *MEMORY[0x1E0CBC840];
    v23 = *MEMORY[0x1E0CBC830];
    v49[0] = *MEMORY[0x1E0CBCA18];
    v49[1] = v23;
    v50[0] = v22;
    v50[1] = &unk_1E375E550;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v50;
    v21 = v49;
  }
  else
  {
    if (v13 != 4)
    {
LABEL_10:
      v16 = 0;
      goto LABEL_13;
    }
    v17 = *MEMORY[0x1E0CBC870];
    v18 = *MEMORY[0x1E0CBC878];
    v51[0] = *MEMORY[0x1E0CBCA18];
    v51[1] = v18;
    v52[0] = v17;
    v52[1] = &unk_1E375E538;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v52;
    v21 = v51;
  }
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 2);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  Width = (double)CGImageGetWidth(a3);
  v25 = off_1E365A000;
  v26 = +[PLTableThumbnailEncoderResult _minKtxDataLengthFromImageSize:](PLTableThumbnailEncoderResult, "_minKtxDataLengthFromImageSize:", Width, (double)CGImageGetHeight(a3));
  Mutable = CFDataCreateMutable(0, v26 + 1024);
  v28 = CGImageDestinationCreateWithData(Mutable, CFSTR("org.khronos.ktx"), 1uLL, 0);
  if (!v28)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0D74498];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("Can't create destination");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 61003, v34);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    CFRelease(Mutable);
    goto LABEL_25;
  }
  v29 = v28;
  if (objc_msgSend(v9, "thumbnailKind") == 4)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(a3, DeviceRGB);
    v25 = off_1E365A000;
    CGColorSpaceRelease(DeviceRGB);
    CGImageDestinationAddImage(v29, CopyWithColorSpace, v16);
    CGImageRelease(CopyWithColorSpace);
  }
  else
  {
    CGImageDestinationAddImage(v29, a3, v16);
  }
  if (!CGImageDestinationFinalize(v29))
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0D74498];
    v45 = *MEMORY[0x1E0CB2D50];
    v46 = CFSTR("Finalize failed");
    v37 = (void *)MEMORY[0x1E0C99D80];
    v38 = &v46;
    v39 = &v45;
    goto LABEL_22;
  }
  if (CFDataGetLength(Mutable) < v26)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0D74498];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("KTX data too short");
    v37 = (void *)MEMORY[0x1E0C99D80];
    v38 = &v48;
    v39 = &v47;
LABEL_22:
    objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 61003, v40);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    goto LABEL_24;
  }
  v41 = (void *)objc_msgSend(objc_alloc(v25[419]), "initWithKtxData:uuid:format:", Mutable, v10, v9);
  v15 = 0;
LABEL_24:
  CFRelease(v29);
  CFRelease(Mutable);
  if (!v41)
  {
LABEL_25:
    if (v15)
    {
      if (a6)
      {
LABEL_27:
        v15 = objc_retainAutorelease(v15);
        v41 = 0;
        *a6 = v15;
        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61004, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (a6)
        goto LABEL_27;
    }
    v41 = 0;
  }
LABEL_30:

  return v41;
}

+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  size_t PrimaryImageIndex;
  const __CFDictionary *v13;
  CGImageRef ImageAtIndex;
  CGImage *v15;
  NSObject *v16;
  int v18;
  CGImageSource *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (a3)
  {
    if (objc_msgSend(v10, "count"))
    {
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      v20 = *MEMORY[0x1E0CBD2B8];
      v21[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, PrimaryImageIndex, v13);
      if (ImageAtIndex)
      {
        v15 = ImageAtIndex;
        objc_msgSend(a1, "encodeThumbnailImage:toFormats:withUUID:error:", ImageAtIndex, v10, v11, a6);
        a3 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v15);
      }
      else
      {
        PLThumbnailsGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 138543362;
          v19 = a3;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unable to decode full sized image from source: %{public}@", (uint8_t *)&v18, 0xCu);
        }

        a3 = 0;
      }

    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

+ (id)encodeThumbnailSource:(CGImageSource *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  CGImage *v17;
  void *v18;
  id v19;
  id v21;

  v10 = a4;
  v11 = a5;
  if (a3 && v10)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61002, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(v10, "size");
  v16 = objc_msgSend(v13, "_createDownscaledImageFromSource:toSize:cropped:", a3, objc_msgSend(v10, "isCropped"), v14, v15);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61001, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_8:
      if (a6)
      {
LABEL_9:
        v19 = objc_retainAutorelease(v19);
        v18 = 0;
        *a6 = v19;
        goto LABEL_13;
      }
LABEL_12:
      v18 = 0;
      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61004, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
      goto LABEL_9;
    goto LABEL_12;
  }
  v17 = (CGImage *)v16;
  v21 = v12;
  objc_msgSend(a1, "_encodeDownscaledImage:toFormat:withUUID:error:", v16, v10, v11, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21;

  CGImageRelease(v17);
  if (!v18)
  {
    if (v19)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_13:

  return v18;
}

+ (id)encodeThumbnailImage:(CGImage *)a3 toFormats:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  CGImage *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v23;
  CGImage *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v13 = (CGImage *)objc_msgSend(a1, "createCascadeSeedImageFromSourceImage:toFormats:", a3, v10);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v23 = a6;
    v24 = v13;
    v16 = 0;
    v17 = *(_QWORD *)v28;
    if (v13)
      a3 = v13;
    while (2)
    {
      v18 = 0;
      v19 = v16;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
        v26 = v19;
        objc_msgSend(a1, "encodeThumbnailImage:toFormat:withUUID:error:", a3, v20, v11, &v26, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v26;

        if (!v21)
        {

          if (v23)
          {
            v16 = objc_retainAutorelease(v16);
            v12 = 0;
            *v23 = v16;
          }
          else
          {
            v12 = 0;
          }
          goto LABEL_14;
        }
        objc_msgSend(v12, "addObject:", v21);

        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
        continue;
      break;
    }
LABEL_14:
    v13 = v24;

  }
  CGImageRelease(v13);

  return v12;
}

+ (id)encodeThumbnailImage:(CGImage *)a3 toFormat:(id)a4 withUUID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  CGImage *v17;
  void *v18;
  id v20;

  v10 = a4;
  v11 = a5;
  if (!a3 || !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61002, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_7;
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(v10, "size");
  v16 = objc_msgSend(v13, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v10, "isCropped"), v14, v15);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61001, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
LABEL_7:
    if (a6)
    {
LABEL_8:
      v12 = objc_retainAutorelease(v12);
      v18 = 0;
      *a6 = v12;
      goto LABEL_12;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v17 = (CGImage *)v16;
  v20 = 0;
  objc_msgSend(a1, "_encodeDownscaledImage:toFormat:withUUID:error:", v16, v10, v11, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  CGImageRelease(v17);
  if (!v18)
  {
    if (v12)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 61004, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_12:

  return v18;
}

+ (CGSize)smallestSizeThatFitsSourceSize:(CGSize)a3 withinFitFormat:(id)a4 andLargerSquareFormat:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  CGSize result;
  CGRect v32;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v11 = a5;
  if (!v10 || objc_msgSend(v10, "isSquare"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTableThumbnailEncoder.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fitFormat && !fitFormat.isSquare"));

    if (v11)
    {
LABEL_4:
      if ((objc_msgSend(v11, "isSquare") & 1) != 0)
        goto LABEL_5;
    }
  }
  else if (v11)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTableThumbnailEncoder.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("squareFormat && squareFormat.isSquare"));

LABEL_5:
  objc_msgSend(v11, "dimension");
  v13 = v12;
  objc_msgSend(v10, "dimension");
  if (v13 < v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLTableThumbnailEncoder.m"), 426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("squareFormat.dimension >= fitFormat.dimension"));

  }
  if (width <= 0.0 || height <= 0.0)
  {
    v24 = *MEMORY[0x1E0C9D820];
    v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v10, "size");
    objc_msgSend(v10, "size");
    PLSizeMake();
    PLSizeFromCGSize();
    PLCGSizeScaledToFitSize();
    v16 = v15;
    v18 = v17;
    objc_msgSend(v11, "dimension");
    if (height > width)
      v20 = v18 * (v19 / v16);
    else
      v20 = v19;
    if (height > width)
      v21 = v19;
    else
      v21 = v16 * (v19 / v18);
    v22 = 0;
    v23 = 0;
    v32 = CGRectIntegral(*(CGRect *)(&v20 - 3));
    v24 = v32.size.width;
    v25 = v32.size.height;
  }

  v26 = v24;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

+ (CGImage)createCascadeSeedImageFromSourceImage:(CGImage *)a3 toFormats:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  CGImage *v18;
  void *v19;
  void *v20;
  char v21;
  double Width;
  double Height;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "formatMode", (_QWORD)v44));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count") != 1
      || (objc_msgSend(v9, "objectAtIndexedSubscript:", 0),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "size"),
          v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v15, "isCropped"), v16, v17), v15, !v18))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0, (_QWORD)v44);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isSquare") & 1) == 0)
      {

        goto LABEL_18;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isSquare");

      if ((v21 & 1) != 0)
        goto LABEL_18;
      Width = (double)CGImageGetWidth(a3);
      Height = (double)CGImageGetHeight(a3);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "smallestSizeThatFitsSourceSize:withinFitFormat:andLargerSquareFormat:", v24, v25, Width, Height);
      v27 = v26;
      v29 = v28;

      v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, 0, v27, v29);
      if (!v18)
      {
LABEL_18:
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isSquare");

        v18 = 0;
        if ((v31 & 1) == 0)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          v18 = 0;
          if ((unint64_t)objc_msgSend(v9, "count") >= 2)
          {
            v34 = 1;
            while (1)
            {
              objc_msgSend(v9, "objectAtIndexedSubscript:", v34);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v33, "isSquare") & 1) != 0)
                break;

              if (objc_msgSend(v9, "count") <= (unint64_t)++v34)
              {
                v33 = 0;
LABEL_27:
                v18 = 0;
                goto LABEL_28;
              }
            }
            if (!v33)
              goto LABEL_27;
            objc_msgSend(v32, "size");
            PLSizeFromCGSize();
            CGImageGetWidth(a3);
            CGImageGetHeight(a3);
            PLSizeMake();
            PLCGSizeScaledToFitSize();
            v36 = v35;
            v38 = v37;
            objc_msgSend(v33, "dimension");
            if (v36 < v39)
              goto LABEL_27;
            objc_msgSend(v33, "dimension");
            if (v38 < v40)
              goto LABEL_27;
            objc_msgSend(v32, "size");
            v18 = (CGImage *)objc_msgSend(a1, "_createDownscaledImageFromSourceImage:toSize:cropped:", a3, objc_msgSend(v32, "isCropped"), v42, v43);
          }
LABEL_28:

        }
      }
    }

    goto LABEL_30;
  }
  v18 = 0;
LABEL_30:

  return v18;
}

CGColorSpaceRef __80__PLTableThumbnailEncoder__createDownscaledImageFromSourceImage_toSize_cropped___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  _createDownscaledImageFromSourceImage_toSize_cropped__s_targetColorSpace = (uint64_t)result;
  return result;
}

@end
