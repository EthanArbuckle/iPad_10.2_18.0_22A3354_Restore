@implementation PFMediaUtilities

+ (BOOL)canGenerateImageDerivativesFromType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]);
  }

  return v4;
}

+ (int64_t)devicePerformanceMemoryClass
{
  if (devicePerformanceMemoryClass_onceToken[0] != -1)
    dispatch_once(devicePerformanceMemoryClass_onceToken, &__block_literal_global_3217);
  return devicePerformanceMemoryClass_deviceMemoryClass;
}

+ (BOOL)isValidImageFileForURL:(id)a3
{
  id v3;
  CGImageSource *v4;
  CGImageSource *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0)
    && (v4 = CGImageSourceCreateWithURL((CFURLRef)v3, 0)) != 0)
  {
    v5 = v4;
    +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", CGImageSourceGetType(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC520]);
    CFRelease(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)typeRequiresRasterizationDPI:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0
      || (+[PFUniformTypeUtilities adobeIllustratorType](PFUniformTypeUtilities, "adobeIllustratorType"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v4, "conformsToType:", v5),
          v5,
          (v6 & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      v7 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC5E0]);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int64_t)defaultRasterizationDPI
{
  return 150;
}

+ (BOOL)embeddedJPEGSuitableForDerivativesInRawImageSource:(CGImageSource *)a3 enforcePixelCountLimits:(BOOL)a4 timeZoneLookup:(id)a5
{
  _BOOL4 v5;
  id v7;
  PFMetadata *v8;
  PFMetadata *v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a4;
  v7 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = -[PFMetadata initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:]([PFMetadata alloc], "initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:", a3, 0, 13, v7, 1);
  v9 = v8;
  if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__PFMediaUtilities_embeddedJPEGSuitableForDerivativesInRawImageSource_enforcePixelCountLimits_timeZoneLookup___block_invoke;
    v12[3] = &unk_1E45A24E8;
    v12[4] = &v13;
    -[PFMetadata enumerateRawThumbnailInfoWithBlock:](v8, "enumerateRawThumbnailInfoWithBlock:", v12);
    v10 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v10 = 1;
    *((_BYTE *)v14 + 24) = 1;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (BOOL)embeddedJPEGSuitableForDerivativesInImageOfType:(id)a3 url:(id)a4 imageProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadata *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PFMetadata initWithImageProperties:contentType:timeZoneLookup:]([PFMetadata alloc], "initWithImageProperties:contentType:timeZoneLookup:", v8, v10, 0);

  objc_msgSend(a1, "hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:metadata:error:", v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v12, "BOOLValue");
  return (char)v9;
}

+ (id)hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:(id)a3 metadata:(id)a4 error:(id *)a5
{
  const __CFURL *v8;
  PFMetadata *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  CGImageSourceRef v14;
  CGImageSourceRef v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = (const __CFURL *)a3;
  v9 = (PFMetadata *)a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *MEMORY[0x1E0C8A2C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !v9)
    v9 = -[PFMetadata initWithImageURL:contentType:timeZoneLookup:]([PFMetadata alloc], "initWithImageURL:contentType:timeZoneLookup:", v8, 0, 0);
  if (!v10)
  {
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to check for presence of embedded preview: failed to resolved DNG type."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v23 = 8;
LABEL_14:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v23, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_15:
    v13 = 0;
    goto LABEL_17;
  }
  -[PFMetadata contentType](v9, "contentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "conformsToType:", v10))
  {

    v13 = (id)MEMORY[0x1E0C9AAA0];
    goto LABEL_17;
  }
  v12 = -[PFMetadata isProRAW](v9, "isProRAW");

  v13 = (id)MEMORY[0x1E0C9AAA0];
  if (v12)
  {
    if (!v8)
    {
      if (!a5)
        goto LABEL_15;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to check for presence of embedded preview: invalid URL: %@"), 0, *MEMORY[0x1E0CB2938]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v25;
      v23 = 2;
      goto LABEL_14;
    }
    v14 = CGImageSourceCreateWithURL(v8, 0);
    if (v14)
    {
      v15 = v14;
      v16 = (void *)MEMORY[0x1A1B0CDDC]();
      v17 = objc_msgSend(a1, "embeddedJPEGSuitableForDerivativesInRawImageSource:enforcePixelCountLimits:timeZoneLookup:", v15, 0, 0);
      objc_autoreleasePoolPop(v16);
      CFRelease(v15);
      v18 = (void *)MEMORY[0x1E0C9AAB0];
      if (!v17)
        v18 = v13;
      v13 = v18;
      goto LABEL_17;
    }
    if (a5)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to check for presence of embedded preview: unable to create image source from %@"), v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v26;
      v23 = 1;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_17:

  return v13;
}

+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3
{
  return (id)objc_msgSend(a1, "imagePropertiesFromImageSource:atIndex:", a3, 0);
}

+ (id)imagePropertiesFromImageSource:(CGImageSource *)a3 atIndex:(unint64_t)a4
{
  CFDictionaryRef v6;
  uint8_t v8[16];

  if (a3)
  {
    if (imagePropertiesFromImageSource_atIndex__onceToken[0] != -1)
      dispatch_once(imagePropertiesFromImageSource_atIndex__onceToken, &__block_literal_global_75);
    v6 = CGImageSourceCopyPropertiesAtIndex(a3, a4, (CFDictionaryRef)imagePropertiesFromImageSource_atIndex__options);
    if (!v6)
      v6 = CGImageSourceCopyPropertiesAtIndex(a3, a4, (CFDictionaryRef)imagePropertiesFromImageSource_atIndex__optionsFallback);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NULL image source, unable to query image properties", v8, 2u);
    }
    v6 = 0;
  }
  return v6;
}

+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CBC710];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)auxiliaryImagesToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  CFDictionaryRef v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "auxiliaryImageIdentifiersToPreserveForDerivatives", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a3, a4, v12);
        if (v13)
        {
          if (!v9)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:(CGImageSource *)a3
{
  size_t PrimaryImageIndex;

  if (a3)
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
  else
    PrimaryImageIndex = 0;
  return (id)objc_msgSend(a1, "auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:imageIndex:", a3, PrimaryImageIndex);
}

+ (id)auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:(CGImageSource *)a3 imageIndex:(unint64_t)a4
{
  void *v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  objc_msgSend(a1, "auxiliaryImagesToPreserveForDerivativesFromImageSource:imageIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
    -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "intValue");
    else
      v10 = 1;
    -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __92__PFMediaUtilities_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke;
    v20[3] = &unk_1E45A2530;
    v24 = v10;
    v22 = v14;
    v23 = v17;
    v11 = v18;
    v21 = v11;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  OSType v20;
  const __CFDictionary *v21;
  CVReturn v22;
  CVReturn v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CVPixelBufferRef pixelBufferOut;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  OSType v52;
  __int16 v53;
  CVReturn v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v5 = *(_QWORD *)&a5;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v7;
  v40 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v44;
    v38 = *MEMORY[0x1E0CBC6C8];
    v37 = *MEMORY[0x1E0CBD030];
    v36 = *MEMORY[0x1E0CA8FF0];
    v34 = *MEMORY[0x1E0CBC6D0];
    v33 = *MEMORY[0x1E0CBC6B8];
    v32 = *MEMORY[0x1E0CBC718];
    v30 = *MEMORY[0x1E0CBC6D8];
    v35 = v5;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v8);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cIImageFromAuxiliaryImageInfo:applyingOrientation:scaleFactor:", v11, v5, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "extent");
          v15 = v14;
          v17 = v16;
          objc_msgSend(v11, "objectForKeyedSubscript:", v38);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v37);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "unsignedIntValue");

          v55 = v36;
          v56 = MEMORY[0x1E0C9AA70];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          pixelBufferOut = 0;
          v22 = CVPixelBufferCreate(0, (unint64_t)v15, (unint64_t)v17, v20, v21, &pixelBufferOut);
          if (v22)
          {
            v23 = v22;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109888;
              v48 = (int)v15;
              v49 = 1024;
              v50 = (int)v17;
              v51 = 1024;
              v52 = v20;
              v53 = 1024;
              v54 = v23;
              _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate CVPixelBuffer of size: %dx%d, format: %d, error: %d", buf, 0x1Au);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C9DD90], "context");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "render:toCVPixelBuffer:", v13, pixelBufferOut);

            objc_msgSend(v11, "objectForKeyedSubscript:", v34);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectForKeyedSubscript:", v33);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v10, "isEqualToString:", v32))
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", v30);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v27 = 0;
            }
            objc_msgSend(a1, "dictionaryRepresentationForAuxiliaryImagePixelBuffer:metadata:colorSpace:compatibilityMetadata:", pixelBufferOut, v25, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v10);
            CVPixelBufferRelease(pixelBufferOut);

            v5 = v35;
          }

        }
      }
      v40 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v40);
  }

  return v31;
}

+ (id)cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6;
  uint64_t v8;
  __CVBuffer *v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = objc_msgSend(a1, "createPixelBufferFromAuxiliaryImageInfo:", a3);
  if (v8)
  {
    v9 = (__CVBuffer *)v8;
    objc_msgSend(a1, "cIImageFromPixelBuffer:applyingOrientation:scaleFactor:", v8, v6, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)dictionaryRepresentationForAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 metadata:(CGImageMetadata *)a4 colorSpace:(CGColorSpace *)a5 compatibilityMetadata:(CGImageMetadata *)a6
{
  uint64_t PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  id v14;
  size_t v15;
  id v16;
  _QWORD *v17;
  void *v18;
  CVReturn v19;
  CVReturn v20;
  void *BaseAddress;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  CGColorSpace *v29;
  CGImageMetadata *v30;
  _QWORD v31[4];
  _QWORD v32[4];
  uint8_t buf[16];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v14 = 0;
  if ((_DWORD)PixelFormatType)
  {
    if (Width)
    {
      if (Height)
      {
        v15 = BytesPerRow;
        if (BytesPerRow)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          if (!ImageIOLibraryCore_frameworkLibrary)
          {
            *(_OWORD *)buf = xmmword_1E45A25B8;
            v34 = 0;
            ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
          }
          if (ImageIOLibraryCore_frameworkLibrary && getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc())
          {
            v17 = (_QWORD *)getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc();
            if (!v17)
            {
              dlerror();
              abort_report_np();
            }
            objc_msgSend(v16, "setObject:forKeyedSubscript:", a3, *v17);
            goto LABEL_17;
          }
          v30 = a4;
          objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v15 * Height);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v29 = a5;
            v19 = CVPixelBufferLockBaseAddress(a3, 1uLL);
            if (!v19)
            {
              BaseAddress = CVPixelBufferGetBaseAddress(a3);
              v28 = objc_retainAutorelease(v18);
              memcpy((void *)objc_msgSend(v28, "mutableBytes"), BaseAddress, v15 * Height);
              CVPixelBufferUnlockBaseAddress(a3, 1uLL);
              v31[0] = *MEMORY[0x1E0CBD030];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v32[0] = v22;
              v31[1] = *MEMORY[0x1E0CBD128];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v32[1] = v23;
              v31[2] = *MEMORY[0x1E0CBCEA8];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v32[2] = v24;
              v31[3] = *MEMORY[0x1E0CBC888];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v32[3] = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CBC6C8]);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CBC6C0]);

              a5 = v29;
              a4 = v30;
LABEL_17:
              objc_msgSend(v16, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0CBC6D0]);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0CBC6B8]);
              if (a6)
                objc_msgSend(v16, "setObject:forKeyedSubscript:", a6, *MEMORY[0x1E0CBC6D8]);
              v14 = v16;
              goto LABEL_20;
            }
            v20 = v19;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v20;
              _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CVPixelBufferLockBaseAddress failed (%d)", buf, 8u);
            }
          }

          v14 = 0;
LABEL_20:

        }
      }
    }
  }
  return v14;
}

+ (__CVBuffer)createPixelBufferFromAuxiliaryImageInfo:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  size_t v6;
  size_t v7;
  size_t v8;
  void *v9;
  const __CFAllocator *v10;
  id v11;
  void *v12;
  id v13;
  __CVBuffer *v14;
  CVPixelBufferRef v16;

  v16 = 0;
  v3 = *MEMORY[0x1E0CBC6C8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBC888]), "unsignedLongValue");
  v7 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBD128]), "unsignedLongValue");
  v8 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBCEA8]), "unsignedLongValue");
  LODWORD(v5) = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBD030]), "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = objc_retainAutorelease(v9);
  v12 = (void *)objc_msgSend(v11, "bytes");
  v13 = v11;
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback_3094, v13, 0, &v16);
  v14 = v16;

  return v14;
}

+ (id)cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CGAffineTransform v11;

  if (a3)
  {
    v6 = *(_QWORD *)&a4;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageByApplyingCGOrientation:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (vabdd_f64(1.0, a5) > 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v11, a5, a5);
      objc_msgSend(v8, "imageByApplyingTransform:", &v11);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (CGImage)createImageRefFromAuxiliaryImagePixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  void *v5;
  void *v6;
  CGImage *v7;

  objc_msgSend(a1, "cIImageFromPixelBuffer:applyingOrientation:scaleFactor:", a3, *(_QWORD *)&a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extent");
    v7 = (CGImage *)objc_msgSend(v6, "createCGImage:fromRect:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (CGSize)maximumImageSizeFromProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("RawPixelWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RawPixelHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC28]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC30]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  v22 = *MEMORY[0x1E0C9D820];
  v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v7 * v9 > *MEMORY[0x1E0C9D820] * v23)
  {
    v23 = v9;
    v22 = v7;
  }
  if (v12 * v15 > v22 * v23)
  {
    v23 = v15;
    v22 = v12;
  }
  if (v18 * v21 <= v22 * v23)
    v24 = v23;
  else
    v24 = v21;
  if (v18 * v21 <= v22 * v23)
    v25 = v22;
  else
    v25 = v18;

  v26 = v25;
  v27 = v24;
  result.height = v27;
  result.width = v26;
  return result;
}

+ (BOOL)canLoadAssetAsRawForInteractiveEditingWithImageProperties:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "maximumImageSizeFromProperties:", v4);
    v8 = objc_msgSend(a1, "rawSourceMaximumPixelCountForInteractiveEditing") >= (unint64_t)(v6 * v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int64_t)rawSourceMaximumPixelCountForBackgroundProcessing
{
  if (objc_msgSend(a1, "devicePerformanceMemoryClass") < 2)
    return 25000000;
  if (objc_msgSend(a1, "devicePerformanceMemoryClass") >= 6)
    return 60217344;
  return 52664320;
}

+ (int64_t)rawSourceMaximumPixelCountForInteractiveEditing
{
  if (objc_msgSend(a1, "devicePerformanceMemoryClass") >= 6)
    return 60217344;
  else
    return 52664320;
}

+ (id)formattedCameraModelFromCameraModel:(id)a3 cameraMake:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "rangeOfString:", v11) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v5);
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v12;
      }
    }
    else
    {
      v11 = (uint64_t)v6;
    }

    v6 = (id)v11;
  }

  return v5;
}

+ (BOOL)isValidAVFileForURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isReadable");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)mainVideoTrackForAsset:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isEnabled"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)formatDebugDescriptionForVideoTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const opaqueCMFormatDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t MediaSubType;
  void *v18;
  void *v19;
  void *v20;
  int VideoDynamicRange;
  __CFString *v22;
  __CFString *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double width;
  double height;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  __CFString *v37;
  __CFString *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  CGAffineTransform v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "formatDescriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "firstObject");

    CMFormatDescriptionGetExtension(v7, (CFStringRef)*MEMORY[0x1E0CA8E98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMFormatDescriptionGetExtension(v7, (CFStringRef)*MEMORY[0x1E0CA8D68]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    CMFormatDescriptionGetExtensions(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BitsPerComponent"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CA2318]))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2240]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dvvC"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v15 != 0;

        }
        else
        {
          v39 = 0;
        }

      }
      else
      {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
      v12 = 0;
    }
    MediaSubType = CMFormatDescriptionGetMediaSubType(v7);
    v40 = v10;
    if ((_DWORD)MediaSubType == 1752589105)
    {
      objc_msgSend(a1, "hevcProfileInformationForVideoTrackFormatDescription:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "summaryDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v20);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v5;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to get HEVC profile/tier/level for video track %@", buf, 0xCu);
        }
        v38 = CFSTR(" (profile/tier/level unavailable)");
      }

    }
    else
    {
      v38 = &stru_1E45A8128;
    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tdbit "), v12);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = &stru_1E45A8128;
    }
    VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
    v22 = CFSTR("SDR");
    if (VideoDynamicRange > 1)
      v22 = CFSTR("HDR");
    v23 = v22;
    objc_msgSend(v5, "naturalSize");
    v25 = v24;
    objc_msgSend(v5, "naturalSize");
    v27 = v26;
    objc_msgSend(v5, "preferredTransform");
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = v25;
    v46.size.height = v27;
    v47 = CGRectApplyAffineTransform(v46, &v42);
    width = v47.size.width;
    height = v47.size.height;
    v30 = (void *)MEMORY[0x1E0CB3940];
    +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", MediaSubType, v47.origin.x, v47.origin.y);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "nominalFrameRate");
    objc_msgSend(v32, "numberWithFloat:");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    v35 = CFSTR("no");
    if (v39)
      v35 = CFSTR("yes");
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ %@%@%@ %dx%d %@fps transfer=%@ color=%@ dv84=%@"), v31, v37, v23, v38, (int)width, (int)height, v33, v8, v41, v35);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("(nil video track)");
  }

  return v16;
}

+ (id)formatDebugDescriptionForAudioTrack:(id)a3
{
  void *v4;
  const opaqueCMFormatDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  if (a3)
  {
    objc_msgSend(a3, "formatDescriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const opaqueCMFormatDescription *)objc_msgSend(v4, "firstObject");

    objc_msgSend(a1, "channelLayoutNameForAudioTrackFormatDescription:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", CMFormatDescriptionGetMediaSubType(v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ channel layout: %@"), v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil audio track)");
  }
  return v9;
}

+ (id)channelLayoutNameForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  const AudioChannelLayout *ChannelLayout;
  const AudioFormatListItem *FormatList;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  uint8_t *p_inSpecifier;
  OSStatus Property;
  OSStatus v11;
  id v13;
  UInt32 ioPropertyDataSize;
  size_t v15;
  size_t sizeOut;
  _DWORD v17[4];
  int inSpecifier;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  sizeOut = 0;
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(a3, &sizeOut);
  v15 = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(a3, &v15);
  ioPropertyDataSize = 8;
  v13 = 0;
  if (v15 < 0x30)
  {
    Property = AudioFormatGetProperty(0x6C6F6E6Du, sizeOut, ChannelLayout, &ioPropertyDataSize, &v13);
    if (Property)
    {
      v11 = Property;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        inSpecifier = 67109120;
        LODWORD(v19) = v11;
        v8 = MEMORY[0x1E0C81028];
        p_inSpecifier = (uint8_t *)&inSpecifier;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
    v22 = 0;
    v21 = 0;
    inSpecifier = FormatList->mChannelLayoutTag;
    v6 = AudioFormatGetProperty(0x6C6F6E6Du, 0x20u, &inSpecifier, &ioPropertyDataSize, &v13);
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v17[0] = 67109120;
        v17[1] = v7;
        v8 = MEMORY[0x1E0C81028];
        p_inSpecifier = (uint8_t *)v17;
LABEL_9:
        _os_log_error_impl(&dword_1A16EE000, v8, OS_LOG_TYPE_ERROR, "AudioFormatGetProperty returned non-success status %d", p_inSpecifier, 8u);
      }
    }
  }
  return v13;
}

+ (id)formatDebugDescriptionForMetadataTrack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const opaqueCMFormatDescription *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const opaqueCMFormatDescription *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "formatDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const opaqueCMFormatDescription *)objc_msgSend(v5, "firstObject");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    CMFormatDescriptionGetExtensions(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0x1E0CB3000uLL;
    if (v7)
    {
      v26 = v6;
      v28 = v4;
      v27 = v7;
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2138]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v34)
      {
        v33 = *(_QWORD *)v37;
        v32 = *MEMORY[0x1E0CA24F8];
        v31 = *MEMORY[0x1E0CA2510];
        v30 = *MEMORY[0x1E0CA2588];
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v37 != v33)
              objc_enumerationMutation(v10);
            objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v32);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", objc_msgSend(v13, "unsignedIntValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v31);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              v16 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v9 + 2368)), "initWithData:encoding:", v15, 30);
            else
              v16 = CFSTR("(unknown metadata key value)");
            objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", v16, v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v9;
            objc_msgSend(*(id *)(v9 + 2368), "stringWithFormat:", CFSTR("\n\t- %@"), v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v19);

            if (objc_msgSend(v17, "isEqualToString:", v30))
            {
              objc_msgSend(a1, "segmentIdentifierDescriptionForMetadataTrack:", v28);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v35, "addObjectsFromArray:", v20);

            }
            v9 = v18;
          }
          v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v34);
      }

      v8 = v27;
      v4 = v28;
      v6 = v26;
    }
    v21 = *(void **)(v9 + 2368);
    +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", CMFormatDescriptionGetMediaSubType(v6));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "componentsJoinedByString:", &stru_1E45A8128);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ %@"), v22, v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = CFSTR("(nil metadata track)");
  }

  return v24;
}

+ (id)segmentIdentifierDescriptionForMetadataTrack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Float64 Seconds;
  void *v13;
  uint64_t v14;
  CMTime time;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v4, &v19);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v3, 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v6);
    v8 = 0;
    if (objc_msgSend(v5, "canAddOutput:", v6))
    {
      objc_msgSend(v5, "addOutput:", v6);
      if (objc_msgSend(v5, "startReading"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "nextTimedMetadataGroup");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          do
          {
            memset(v18, 0, sizeof(v18));
            v17 = 0u;
            objc_msgSend(v10, "timeRange");
            v11 = (void *)MEMORY[0x1E0CB3940];
            *(_OWORD *)&time.value = v17;
            time.epoch = *(_QWORD *)&v18[0];
            Seconds = CMTimeGetSeconds(&time);
            time = *(CMTime *)((char *)v18 + 8);
            objc_msgSend(v11, "stringWithFormat:", CFSTR("\n\t  - Segment start %.02fs duration %.02fs"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&time));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

            objc_msgSend(v7, "nextTimedMetadataGroup");
            v14 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v14;
          }
          while (v14);
        }
        objc_msgSend(v5, "cancelReading");
      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)hevcProfileInformationForVideoTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  if (CMFormatDescriptionGetMediaSubType(a3) == 1752589105)
  {
    CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA2240]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hvcC"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || FigHEVCBridge_GetHEVCParameterSetAtIndex()
      || FigHEVCBridge_GetSPSProfileTierLevel())
    {
      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProfile:", v8);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTier:", v9);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLevel:", v10);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (void)enumerateVideoTrackFormatDescriptionsInAsset:(id)a3 withBlock:(id)a4
{
  void (**v5)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  const opaqueCMFormatDescription *v20;
  uint64_t MediaSubType;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *))a4;
  v32 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a3, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v10 = *MEMORY[0x1E0C8A808];
    v22 = *MEMORY[0x1E0C8A808];
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "mediaType", v22, v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v10);

        if (v14)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v12, "formatDescriptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v24 + 1) + 8 * j);
                MediaSubType = CMFormatDescriptionGetMediaSubType(v20);
                v5[2](v5, v12, v20, MediaSubType, &v32);
                if (v32)
                {

                  goto LABEL_20;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              if (v17)
                continue;
              break;
            }
          }

          v10 = v22;
          v9 = v23;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }
LABEL_20:

}

+ (id)debugDescriptionForPlayerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v4 = a3;
  objc_msgSend(v4, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("assetTrack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(a1, "debugDescriptionForAssetOrPlayerItemTracks:asset:duration:", v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)debugDescriptionForAssetOrPlayerItemTracks:(id)a3 asset:(id)a4 duration:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  _BOOL4 v20;
  const __CFString *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  CMTime time;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB37A0];
  v10 = a3;
  objc_msgSend(v9, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a5;
  objc_msgSend(v11, "appendFormat:", CFSTR("Duration: %.02fs\n\n"), CMTimeGetSeconds(&time));
  objc_msgSend(v11, "appendString:", CFSTR("*** Tracks ***\n"));
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __78__PFMediaUtilities_debugDescriptionForAssetOrPlayerItemTracks_asset_duration___block_invoke;
  v26 = &unk_1E45A2558;
  v12 = v11;
  v27 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v23);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v8;
    objc_msgSend(v13, "variants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v12, "appendFormat:", CFSTR("\n*** Variants (%tu) ***\n"), v15, v23, v24, v25, v26);
    objc_msgSend(a1, "_debugDescriptionForAssetVariants:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v16);

    objc_msgSend(v12, "appendFormat:", CFSTR("\n*** URL ***\n"));
    objc_msgSend(v13, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_debugDescriptionForAssetURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v18);

  }
  else
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("\n(no URL/variants info because asset is of type '%@')\n"), v14, v23, v24, v25, v26);
  }

  v20 = +[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback](PFMediaCapabilities, "currentDeviceIsEligibleForHDRPlayback");
  v21 = CFSTR("no");
  if (v20)
    v21 = CFSTR("yes");
  objc_msgSend(v12, "appendFormat:", CFSTR("\nCurrent Device Eligible for HDR Playback: %@\n\n"), v21);

  return v12;
}

+ (id)_debugDescriptionForAssetURL:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("Scheme: %@\n"), v6);

    objc_msgSend(v5, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("Host: %@\n"), v7);

    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("Path: %@\n"), v8);

    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("Query:\n"));
    objc_msgSend(v5, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_174);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("- %@=%@\n"), v17, v18, (_QWORD)v28);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    objc_msgSend(v5, "fragment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      +[PFMediaUtilities outOfBandHintsForURL:](PFMediaUtilities, "outOfBandHintsForURL:", v3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v22, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Out of band hints: %@\n"), v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v26;
      }
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("Fragment: %@\n"), v21);

    }
    -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("\n%@\n"), v3);

  }
  else
  {
    v4 = CFSTR("(none)");
  }

  return v4;
}

+ (id)_debugDescriptionForAssetVariants:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id obj;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v4;
    obj = v4;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v40;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v6, "videoAttributes");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "codecTypes");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v36;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v36 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(a1, "stringFromFourCharCode:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13), "unsignedIntValue"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v11);
          }

          objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "videoAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "presentationSize");
          v18 = v17;
          v20 = v19;

          objc_msgSend(v6, "averageBitRate");
          v21 = (int)v18;
          v22 = (void *)MEMORY[0x1E0CB37E8];
          v24 = v23 / 1000000.0;
          objc_msgSend(v6, "videoAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "nominalFrameRate");
          objc_msgSend(v22, "numberWithDouble:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "videoAttributes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "videoRange");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v33, "appendFormat:", CFSTR("- %.02fmbit/s %@ %dx%d %@fps %@\n"), *(_QWORD *)&v24, v15, v21, (int)v20, v26, v28);

          ++v5;
        }
        while (v5 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v34);
    }

    v4 = v30;
  }
  else
  {
    v33 = CFSTR("(none)\n");
  }

  return v33;
}

+ (id)outOfBandHintsForVideoAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PFMetadata *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "resolvedURL"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "outOfBandHintsForURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else if (objc_msgSend(v6, "isFileURL"))
      {
        v10 = -[PFMetadata initWithAVAsset:options:timeZoneLookup:]([PFMetadata alloc], "initWithAVAsset:options:timeZoneLookup:", v5, 12, 0);
        -[PFMetadata outOfBandHints](v10, "outOfBandHints");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil URL for AVURLAsset %@", (uint8_t *)&v12, 0xCu);
      }
      v9 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AVAsset is not URL-based: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)outOfBandHintsForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fragment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring unexpected hints format: %@", buf, 0xCu);
      }
      v8 = 0;
      goto LABEL_16;
    }
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v11;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error decoding hints plist (%@), unexpected type %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error decoding hints plist (%@): %@", buf, 0x16u);
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

+ (id)urlByAttachingOutOfBandHintsBase64String:(id)a3 toVideoURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFragment:", v5);
    objc_msgSend(v7, "URL");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

+ (id)stringFromFourCharCode:(unsigned int)a3
{
  _BYTE v4[5];

  v4[0] = HIBYTE(a3);
  v4[1] = BYTE2(a3);
  v4[2] = BYTE1(a3);
  v4[3] = a3;
  v4[4] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v4, 30);
}

+ (unsigned)fourCharCodeFromString:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 30);
  return (v3[1] << 16) | (*v3 << 24) | (v3[2] << 8) | v3[3];
}

+ (BOOL)enumerateImageSourceIndexesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5
{
  const __CFURL *v7;
  void (**v8)(id, const void *, uint64_t, _BYTE *);
  CGImageSource *v9;
  CGImageSource *v10;
  size_t Count;
  BOOL v12;
  size_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  v8 = (void (**)(id, const void *, uint64_t, _BYTE *))a5;
  v9 = CGImageSourceCreateWithURL(v7, 0);
  if (!v9)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  v10 = v9;
  Count = CGImageSourceGetCount(v9);
  v12 = Count != 0;
  v19 = 0;
  if (Count)
  {
    v13 = Count;
    v14 = 1;
    do
    {
      v8[2](v8, v10, v14 - 1, &v19);
      if (v14 >= v13)
        break;
      ++v14;
    }
    while (!v19);
  }
  CFRelease(v10);
  if (a4)
  {
LABEL_9:
    if (!v12)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to access input media through URL %@"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 2, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_11:

  return v12;
}

+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  void *v5;
  void *v6;
  CGImage *v7;

  objc_msgSend(a1, "_cIImageFromAuxiliaryImageInfo:applyingOrientation:scaleFactor:", a3, *(_QWORD *)&a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extent");
    v7 = (CGImage *)objc_msgSend(v6, "createCGImage:fromRect:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_cIImageFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6;
  uint64_t v8;
  __CVBuffer *v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = objc_msgSend(a1, "_createPixelBufferFromAuxiliaryImageInfo:", a3);
  if (v8)
  {
    v9 = (__CVBuffer *)v8;
    objc_msgSend(a1, "_cIImageFromPixelBuffer:applyingOrientation:scaleFactor:", v8, v6, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (__CVBuffer)_createPixelBufferFromAuxiliaryImageInfo:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  size_t v6;
  size_t v7;
  size_t v8;
  void *v9;
  const __CFAllocator *v10;
  id v11;
  void *v12;
  id v13;
  __CVBuffer *v14;
  CVPixelBufferRef v16;

  v16 = 0;
  v3 = *MEMORY[0x1E0CBC6C8];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBC888]), "unsignedLongValue");
  v7 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBD128]), "unsignedLongValue");
  v8 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBCEA8]), "unsignedLongValue");
  LODWORD(v5) = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, (const void *)*MEMORY[0x1E0CBD030]), "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = objc_retainAutorelease(v9);
  v12 = (void *)objc_msgSend(v11, "bytes");
  v13 = v11;
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback_3094, v13, 0, &v16);
  v14 = v16;

  return v14;
}

+ (id)_cIImageFromPixelBuffer:(__CVBuffer *)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CGAffineTransform v11;

  if (a3)
  {
    v6 = *(_QWORD *)&a4;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageByApplyingCGOrientation:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (vabdd_f64(1.0, a5) > 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v11, a5, a5);
      objc_msgSend(v8, "imageByApplyingTransform:", &v11);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (double)gainMapHeadroomForHDRGain:(double)a3 gainMapValue:(double)a4
{
  double v4;
  double v5;

  if (a3 >= 1.0)
  {
    if (a4 <= 0.01)
      return exp2(a4 * -70.0 + 3.0);
    v4 = a4 * -0.303030303 + 2.0;
    v5 = 0.303030303;
  }
  else
  {
    if (a4 <= 0.01)
      return exp2(a4 * -20.0 + 1.8);
    v4 = a4 * -0.101010101 + 1.5;
    v5 = 0.101010101;
  }
  return exp2(v4 + v5);
}

+ (id)protectedTemporaryItemsSubdirectoryName
{
  return CFSTR("TemporaryItems");
}

uint64_t __49__PFMediaUtilities__debugDescriptionForAssetURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

void __78__PFMediaUtilities_debugDescriptionForAssetOrPlayerItemTracks_asset_duration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%2tu)\t%@: "), a3 + 1, v5);
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C8A808]))
  {
    v6 = *(void **)(a1 + 32);
    +[PFMediaUtilities formatDebugDescriptionForVideoTrack:](PFMediaUtilities, "formatDebugDescriptionForVideoTrack:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = (void *)v7;
    objc_msgSend(v6, "appendString:", v7);

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C8A7A0]))
  {
    v6 = *(void **)(a1 + 32);
    +[PFMediaUtilities formatDebugDescriptionForAudioTrack:](PFMediaUtilities, "formatDebugDescriptionForAudioTrack:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C8A7D0]))
  {
    v6 = *(void **)(a1 + 32);
    +[PFMediaUtilities formatDebugDescriptionForMetadataTrack:](PFMediaUtilities, "formatDebugDescriptionForMetadataTrack:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

void __92__PFMediaUtilities_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setAuxiliaryImageInfo:", v5);

  objc_msgSend(v7, "setIdentifier:", v6);
  objc_msgSend(v7, "setSourceImageOrientation:", *(unsigned int *)(a1 + 56));
  objc_msgSend(v7, "setSourceImageSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

uint64_t __59__PFMediaUtilities_imagePropertiesFromImageSource_atIndex___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0CBD140];
  v7[1] = CFSTR("kCGImageSourceKeepOriginalProfile");
  v11[0] = MEMORY[0x1E0C9AAB0];
  v11[1] = MEMORY[0x1E0C9AAB0];
  v1 = *MEMORY[0x1E0CBD258];
  v8 = *MEMORY[0x1E0CBD278];
  v0 = v8;
  v9 = v1;
  v11[2] = MEMORY[0x1E0C9AAB0];
  v11[3] = MEMORY[0x1E0C9AAB0];
  v10 = *MEMORY[0x1E0CBD200];
  v11[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v7, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imagePropertiesFromImageSource_atIndex__options;
  imagePropertiesFromImageSource_atIndex__options = v2;

  v4 = objc_msgSend((id)imagePropertiesFromImageSource_atIndex__options, "mutableCopy");
  v5 = (void *)imagePropertiesFromImageSource_atIndex__optionsFallback;
  imagePropertiesFromImageSource_atIndex__optionsFallback = v4;

  return objc_msgSend((id)imagePropertiesFromImageSource_atIndex__optionsFallback, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v0);
}

uint64_t __110__PFMediaUtilities_embeddedJPEGSuitableForDerivativesInRawImageSource_enforcePixelCountLimits_timeZoneLookup___block_invoke(uint64_t result, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(a2 * a3) - 1000001 <= 0xD59F7E)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

void __48__PFMediaUtilities_devicePerformanceMemoryClass__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DevicePerformanceMemoryClass"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  devicePerformanceMemoryClass_deviceMemoryClass = objc_msgSend(v0, "integerValue");

}

+ (id)tracksWithMediaType:(id)a3 forAsset:(id)a4
{
  return (id)objc_msgSend(a4, "tracksWithMediaType:", a3);
}

+ (id)trackWithTrackID:(int)a3 forAsset:(id)a4
{
  return (id)objc_msgSend(a4, "trackWithTrackID:", *(_QWORD *)&a3);
}

+ (CGImage)copyCGImageFromImageGenerator:(id)a3 atTime:(id *)a4 actualTime:(id *)a5 error:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  return (CGImage *)objc_msgSend(a3, "copyCGImageAtTime:actualTime:error:", &v7, a5, a6);
}

+ (BOOL)insertTimeRange:(id *)a3 ofAsset:(id)a4 atTime:(id *)a5 intoMutableComposition:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  _OWORD v66[3];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v10, "tracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  v13 = *MEMORY[0x1E0C8A7A0];
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v68;
    v42 = v10;
    v48 = a1;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v17, "mediaType", v42);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addMutableTrackWithMediaType:preferredTrackID:", v18, objc_msgSend(v17, "trackID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v18) = objc_msgSend(v19, "trackID");
        if ((_DWORD)v18 != objc_msgSend(v17, "trackID"))
        {
          if (a7)
          {
            v38 = (void *)MEMORY[0x1E0CB35C8];
            v74 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to preserve trackID"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v40);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_36:

          v37 = 0;
          goto LABEL_37;
        }
        objc_msgSend(v17, "mediaType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v13);

        if (v21)
        {
          objc_msgSend(v19, "setAlternateGroupID:", objc_msgSend(v17, "alternateGroupID"));
          objc_msgSend(v17, "languageCode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setLanguageCode:", v22);

        }
        v23 = *(_OWORD *)&a3->var0.var3;
        v66[0] = *(_OWORD *)&a3->var0.var0;
        v66[1] = v23;
        v66[2] = *(_OWORD *)&a3->var1.var1;
        v64 = *MEMORY[0x1E0CA2E68];
        v65 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        if (!objc_msgSend(v19, "insertTimeRange:ofTrack:atTime:error:", v66, v17, &v64, a7))
          goto LABEL_36;

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      v10 = v42;
      a1 = v48;
      if (v14)
        continue;
      break;
    }
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(a1, "tracksWithMediaType:forAsset:", v13, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v45)
  {
    v42 = v10;
    v44 = *(_QWORD *)v61;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v61 != v44)
          objc_enumerationMutation(obj);
        v46 = v24;
        v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v24);
        objc_msgSend(v11, "trackWithTrackID:", objc_msgSend(v25, "trackID", v42));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v51 = v25;
        objc_msgSend(v25, "availableTrackAssociationTypes");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
        if (v27)
        {
          v28 = v27;
          v49 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v57 != v49)
                objc_enumerationMutation(v47);
              v30 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              +[PFMediaUtilities associatedTracksOfTypeForTrack:trackAssociationType:](PFMediaUtilities, "associatedTracksOfTypeForTrack:trackAssociationType:", v51, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v53;
                do
                {
                  for (k = 0; k != v33; ++k)
                  {
                    if (*(_QWORD *)v53 != v34)
                      objc_enumerationMutation(v31);
                    objc_msgSend(v11, "trackWithTrackID:", objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "trackID"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "addTrackAssociationToTrack:type:", v36, v30);

                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
                }
                while (v33);
              }

            }
            v28 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          }
          while (v28);
        }

        v24 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v45);
    v37 = 1;
LABEL_37:
    v10 = v42;
  }
  else
  {
    v37 = 1;
  }

  return v37;
}

+ (id)metadataForFormat:(id)a3 forAssetTrack:(id)a4
{
  return (id)objc_msgSend(a4, "metadataForFormat:", a3);
}

+ (id)metadataForFormat:(id)a3 forAsset:(id)a4
{
  return (id)objc_msgSend(a4, "metadataForFormat:", a3);
}

+ (void)videoComposition:(id)a3 applier:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(MEMORY[0x1E0C8B3C8], "videoCompositionWithAsset:applyingCIFiltersWithHandler:completionHandler:", a3, a4, a5);
}

+ (void)exportAsynchronously:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "exportAsynchronouslyWithCompletionHandler:", a4);
}

+ (int64_t)statusForExportSession:(id)a3
{
  return objc_msgSend(a3, "status");
}

+ (id)errorForExportSession:(id)a3
{
  return (id)objc_msgSend(a3, "error");
}

+ (id)associatedTracksOfTypeForTrack:(id)a3 trackAssociationType:(id)a4
{
  return (id)objc_msgSend(a3, "associatedTracksOfType:", a4);
}

@end
