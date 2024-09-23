@implementation PFImageMetadata

+ (id)valueFromCGImageProperties:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5
{
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  CFTypeID v8;

  Value = 0;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a3, a4);
        if (Value)
        {
          v7 = Value;
          v8 = CFGetTypeID(Value);
          if (v8 == CFDictionaryGetTypeID())
          {
            Value = (const __CFDictionary *)CFDictionaryGetValue(v7, a5);
            if (Value)
              return Value;
          }
          else
          {
            Value = 0;
          }
        }
      }
    }
  }
  return Value;
}

+ (BOOL)readMetadataValueFromImageAtFileURL:(id)a3 dictionaryKey:(const void *)a4 key:(const void *)a5 value:(id *)a6 error:(id *)a7
{
  _QWORD v8[8];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PFImageMetadata_readMetadataValueFromImageAtFileURL_dictionaryKey_key_value_error___block_invoke;
  v8[3] = &__block_descriptor_64_e22_v16__0__NSDictionary_8l;
  v8[4] = a6;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a5;
  return objc_msgSend(a1, "queryImagePropertiesOfFileAtURL:error:block:", a3, a7, v8);
}

+ (id)imagePropertiesByRemovingKey:(const void *)a3 dictionaryKey:(const void *)a4 fromImageProperties:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = v7;
  v9 = v7;
  if (a4)
  {
    objc_msgSend(v7, "objectForKey:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v10)
    {
      objc_opt_class();
      v9 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKey:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v11)
        {
          v9 = (void *)objc_msgSend(v8, "mutableCopy");
          v12 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v12, "removeObjectForKey:", a3);
          objc_msgSend(v9, "setObject:forKey:", v12, a4);

        }
      }
    }

  }
  return v9;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id *v19;
  char v20;
  uint64_t v21;
  _QWORD v22[2];

  v8 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  convertTypeToKey(v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend(a1, "metadataTypeRequiresImageSource:", v8))
    {
      v12 = MEMORY[0x1E0C809B0];
      *a5 = 0;
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __60__PFImageMetadata_readMetadataType_fromFileURL_value_error___block_invoke;
      v17[3] = &unk_1E45A2410;
      v20 = v8;
      v18 = v11;
      v19 = a5;
      LOBYTE(a6) = objc_msgSend(a1, "enumerateImageSourceIndexesOfFileAtURL:error:block:", v10, a6, v17);

    }
    else
    {
      LOBYTE(a6) = objc_msgSend(a1, "readMetadataValueFromImageAtFileURL:dictionaryKey:key:value:error:", v10, *MEMORY[0x1E0CBCF70], v11, a5, a6);
    }
  }
  else if (a6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is invalid for the media type %s"), v8, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 0, v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromCGImageProperties:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v8 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (!objc_msgSend(a1, "metadataTypeRequiresImageSource:", v8))
  {
    if (v10)
    {
      convertTypeToKey(v8, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        if (a6)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is invalid for the media type %s"), v8, "image");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 0, v19);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v12 = 0;
        goto LABEL_13;
      }
      v12 = (void *)v14;
      objc_msgSend(a1, "valueFromCGImageProperties:dictionaryKey:key:", v10, *MEMORY[0x1E0CBCF70], v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 1;
    }
    else
    {
      if (!a6)
        goto LABEL_9;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2938];
      v24 = CFSTR("Invalid nil input properties");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 2, v12);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (a6)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is only available when using URL-based methods"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
LABEL_9:
  v15 = 0;
LABEL_15:

  return v15;
}

+ (BOOL)metadataTypeRequiresImageSource:(unsigned __int8)a3
{
  return a3 == 18;
}

+ (BOOL)writeMetadataType:(unsigned __int8)a3 value:(id)a4 toCGImageProperties:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v8 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(a1, "metadataTypeRequiresImageSource:", v8))
  {
    if (a6)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is only available when using URL-based methods"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
      v20 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    if (v11)
    {
      convertTypeToKey(v8, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v13 = (void *)v15;
        if (v10)
        {
          v16 = *MEMORY[0x1E0CBCF70];
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            v18 = (id)objc_msgSend(v17, "mutableCopy");
          else
            v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v25 = v18;
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v16);
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v10, v13);

          v20 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        if (a6)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified type (%d) is invalid for the media type %s"), v8, "image");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 0, v23);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v13 = 0;
      }
      goto LABEL_16;
    }
    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2938];
      v29 = CFSTR("Invalid nil input properties");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 2, v13);
      v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
  }
  v20 = 0;
LABEL_18:

  return v20;
}

+ (BOOL)queryImagePropertiesOfFileAtURL:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v22 = *MEMORY[0x1E0CBD240];
  v23[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PFImageMetadata_queryImagePropertiesOfFileAtURL_error_block___block_invoke;
  v14[3] = &unk_1E45A2438;
  v11 = v10;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = &v18;
  objc_msgSend(a1, "enumerateImageSourceIndexesOfFileAtURL:error:block:", v8, a4, v14);
  LOBYTE(a4) = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return (char)a4;
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
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 1, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_11:

  return v12;
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
  return (id)objc_msgSend(a1, "auxiliaryImageRecordsToPreserveForDerivativesFromImageSource:imageIndex:", a3, CGImageSourceGetPrimaryImageIndex(a3));
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
    v20[2] = __91__PFImageMetadata_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke;
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

+ (id)auxiliaryImageIdentifiersToPreserveForDerivatives
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CBC710];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)transformAuxiliaryImages:(id)a3 scaleFactor:(double)a4 applyingOrientation:(unsigned int)a5
{
  return +[PFMediaUtilities transformAuxiliaryImages:scaleFactor:applyingOrientation:](PFMediaUtilities, "transformAuxiliaryImages:scaleFactor:applyingOrientation:", a3, *(_QWORD *)&a5, a4);
}

+ (CGImage)createImageRefFromAuxiliaryImageInfo:(id)a3 applyingOrientation:(unsigned int)a4 scaleFactor:(double)a5
{
  void *v5;
  void *v6;
  CGImage *v7;

  objc_msgSend(a1, "cIImageFromAuxiliaryImageInfo:applyingOrientation:scaleFactor:", a3, *(_QWORD *)&a4, a5);
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
  CVPixelBufferCreateWithBytes(v10, v7, v8, (OSType)v5, v12, v6, (CVPixelBufferReleaseBytesCallback)_AuxiliaryImageCVPixelBufferReleaseBytesCallback, v13, 0, &v16);
  v14 = v16;

  return v14;
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

+ (BOOL)imageSourceIsSpatial:(CGImageSource *)a3
{
  PFMetadata *v3;
  BOOL v4;

  v3 = -[PFMetadata initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:]([PFMetadata alloc], "initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:", a3, 0, 13, 0, 1);
  v4 = -[PFMetadata isSpatialMedia](v3, "isSpatialMedia");

  return v4;
}

void __91__PFImageMetadata_auxiliaryImageRecordsToPreserveForDerivativesFromImageSource_imageIndex___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __63__PFImageMetadata_queryImagePropertiesOfFileAtURL_error_block___block_invoke(uint64_t a1, CGImageSourceRef isrc, size_t index, _BYTE *a4)
{
  CFDictionaryRef v6;
  CFDictionaryRef v7;

  v6 = CGImageSourceCopyPropertiesAtIndex(isrc, index, *(CFDictionaryRef *)(a1 + 32));
  if (v6)
  {
    v7 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CFRelease(v7);
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

CFDictionaryRef __60__PFImageMetadata_readMetadataType_fromFileURL_value_error___block_invoke(CFDictionaryRef result, CGImageSourceRef isrc, size_t index, _BYTE *a4)
{
  CFDictionaryRef v5;

  if (*((_BYTE *)result + 48) == 18)
  {
    v5 = result;
    result = CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc, index, *((CFStringRef *)result + 4));
    if (result)
    {
      result = result;
      **((_QWORD **)v5 + 5) = result;
      *a4 = 1;
    }
  }
  return result;
}

id __85__PFImageMetadata_readMetadataValueFromImageAtFileURL_dictionaryKey_key_value_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  objc_msgSend(*(id *)(a1 + 40), "valueFromCGImageProperties:dictionaryKey:key:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = (id)objc_claimAutoreleasedReturnValue();
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
