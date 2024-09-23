@implementation PFUniformTypeUtilities

+ (UTType)canonCRWRAWImageType
{
  if (canonCRWRAWImageType_onceToken[0] != -1)
    dispatch_once(canonCRWRAWImageType_onceToken, &__block_literal_global_62);
  return (UTType *)(id)canonCRWRAWImageType_type;
}

+ (UTType)jpegXLType
{
  if (jpegXLType_onceToken != -1)
    dispatch_once(&jpegXLType_onceToken, &__block_literal_global_53);
  return (UTType *)(id)jpegXLType_type;
}

+ (UTType)sonyARWRAWImageType
{
  if (sonyARWRAWImageType_onceToken[0] != -1)
    dispatch_once(sonyARWRAWImageType_onceToken, &__block_literal_global_56);
  return (UTType *)(id)sonyARWRAWImageType_type;
}

+ (UTType)fujiRAWImageType
{
  if (fujiRAWImageType_onceToken[0] != -1)
    dispatch_once(fujiRAWImageType_onceToken, &__block_literal_global_86);
  return (UTType *)(id)fujiRAWImageType_type;
}

+ (UTType)pentaxRAWImageType
{
  if (pentaxRAWImageType_onceToken[0] != -1)
    dispatch_once(pentaxRAWImageType_onceToken, &__block_literal_global_77);
  return (UTType *)(id)pentaxRAWImageType_type;
}

+ (UTType)hasselblad3FRRAWImageType
{
  if (hasselblad3FRRAWImageType_onceToken[0] != -1)
    dispatch_once(hasselblad3FRRAWImageType_onceToken, &__block_literal_global_92);
  return (UTType *)(id)hasselblad3FRRAWImageType_type;
}

+ (UTType)panasonicRAWImageType
{
  if (panasonicRAWImageType_onceToken != -1)
    dispatch_once(&panasonicRAWImageType_onceToken, &__block_literal_global_74);
  return (UTType *)(id)panasonicRAWImageType_type;
}

+ (UTType)panasonicRW2RAWImageType
{
  if (panasonicRW2RAWImageType_onceToken[0] != -1)
    dispatch_once(panasonicRW2RAWImageType_onceToken, &__block_literal_global_71);
  return (UTType *)(id)panasonicRW2RAWImageType_type;
}

+ (UTType)olympusRAWImageType
{
  if (olympusRAWImageType_onceToken[0] != -1)
    dispatch_once(olympusRAWImageType_onceToken, &__block_literal_global_68);
  return (UTType *)(id)olympusRAWImageType_type;
}

+ (UTType)avifType
{
  if (avifType_onceToken[0] != -1)
    dispatch_once(avifType_onceToken, &__block_literal_global_32);
  return (UTType *)(id)avifType_type;
}

+ (UTType)hasselbladFFFRAWImageType
{
  if (hasselbladFFFRAWImageType_onceToken[0] != -1)
    dispatch_once(hasselbladFFFRAWImageType_onceToken, &__block_literal_global_95);
  return (UTType *)(id)hasselbladFFFRAWImageType_type;
}

+ (UTType)nikonRAWImageType
{
  if (nikonRAWImageType_onceToken[0] != -1)
    dispatch_once(nikonRAWImageType_onceToken, &__block_literal_global_80);
  return (UTType *)(id)nikonRAWImageType_type;
}

+ (UTType)leafamericaRAWImageType
{
  if (leafamericaRAWImageType_onceToken[0] != -1)
    dispatch_once(leafamericaRAWImageType_onceToken, &__block_literal_global_89);
  return (UTType *)(id)leafamericaRAWImageType_type;
}

+ (UTType)canonCR2RAWImageType
{
  if (canonCR2RAWImageType_onceToken[0] != -1)
    dispatch_once(canonCR2RAWImageType_onceToken, &__block_literal_global_59);
  return (UTType *)(id)canonCR2RAWImageType_type;
}

+ (UTType)samsungRAWImageType
{
  if (samsungRAWImageType_onceToken[0] != -1)
    dispatch_once(samsungRAWImageType_onceToken, &__block_literal_global_83);
  return (UTType *)(id)samsungRAWImageType_type;
}

+ (UTType)supplementalResourceAAEType
{
  if (supplementalResourceAAEType_onceToken != -1)
    dispatch_once(&supplementalResourceAAEType_onceToken, &__block_literal_global_23);
  return (UTType *)(id)supplementalResourceAAEType_type;
}

+ (id)typeForURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0;
  v6 = *MEMORY[0x1E0C998E0];
  v12 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v13, v6, &v12);
  v8 = v13;
  v9 = v12;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get NSURLContentTypeKey resource value for %@: %@", buf, 0x16u);

      if (!a4)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (a4)
LABEL_4:
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_5:

  return v8;
}

+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3
{
  return (id)objc_msgSend(a1, "preferredOrFallbackFilenameExtensionForType:fallbackIdentifier:", a3, 0);
}

+ (UTType)canonTIFFRAWImageType
{
  if (canonTIFFRAWImageType_onceToken[0] != -1)
    dispatch_once(canonTIFFRAWImageType_onceToken, &__block_literal_global_65);
  return (UTType *)(id)canonTIFFRAWImageType_type;
}

void __45__PFUniformTypeUtilities_sonyARWRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.sony.arw-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sonyARWRAWImageType_type;
  sonyARWRAWImageType_type = v0;

}

void __49__PFUniformTypeUtilities_leafamericaRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.leafamerica.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)leafamericaRAWImageType_type;
  leafamericaRAWImageType_type = v0;

}

void __47__PFUniformTypeUtilities_panasonicRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.panasonic.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)panasonicRAWImageType_type;
  panasonicRAWImageType_type = v0;

}

void __47__PFUniformTypeUtilities_canonTIFFRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.canon.tif-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canonTIFFRAWImageType_type;
  canonTIFFRAWImageType_type = v0;

}

void __36__PFUniformTypeUtilities_jpegXLType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.jpeg-xl"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)jpegXLType_type;
  jpegXLType_type = v0;

}

void __45__PFUniformTypeUtilities_olympusRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.olympus.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)olympusRAWImageType_type;
  olympusRAWImageType_type = v0;

}

void __43__PFUniformTypeUtilities_nikonRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.nikon.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nikonRAWImageType_type;
  nikonRAWImageType_type = v0;

}

void __34__PFUniformTypeUtilities_avifType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.avif"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)avifType_type;
  avifType_type = v0;

}

void __44__PFUniformTypeUtilities_pentaxRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.pentax.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pentaxRAWImageType_type;
  pentaxRAWImageType_type = v0;

}

void __50__PFUniformTypeUtilities_panasonicRW2RAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.panasonic.rw2-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)panasonicRW2RAWImageType_type;
  panasonicRW2RAWImageType_type = v0;

}

void __53__PFUniformTypeUtilities_supplementalResourceAAEType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.photos.apple-adjustment-envelope"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supplementalResourceAAEType_type;
  supplementalResourceAAEType_type = v0;

}

void __46__PFUniformTypeUtilities_canonCR2RAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.canon.cr2-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canonCR2RAWImageType_type;
  canonCR2RAWImageType_type = v0;

}

void __46__PFUniformTypeUtilities_canonCRWRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.canon.crw-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canonCRWRAWImageType_type;
  canonCRWRAWImageType_type = v0;

}

void __45__PFUniformTypeUtilities_samsungRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.samsung.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)samsungRAWImageType_type;
  samsungRAWImageType_type = v0;

}

void __51__PFUniformTypeUtilities_hasselblad3FRRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.hasselblad.3fr-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hasselblad3FRRAWImageType_type;
  hasselblad3FRRAWImageType_type = v0;

}

void __51__PFUniformTypeUtilities_hasselbladFFFRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.hasselblad.fff-raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hasselbladFFFRAWImageType_type;
  hasselbladFFFRAWImageType_type = v0;

}

void __42__PFUniformTypeUtilities_fujiRAWImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.fuji.raw-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fujiRAWImageType_type;
  fujiRAWImageType_type = v0;

}

+ (UTType)photosLibraryType
{
  if (photosLibraryType_onceToken != -1)
    dispatch_once(&photosLibraryType_onceToken, &__block_literal_global_1928);
  return (UTType *)(id)photosLibraryType_type;
}

+ (NSString)photosLibraryIdentifier
{
  return (NSString *)CFSTR("com.apple.photos.library");
}

+ (UTType)iPhotoLibraryType
{
  if (iPhotoLibraryType_onceToken != -1)
    dispatch_once(&iPhotoLibraryType_onceToken, &__block_literal_global_8);
  return (UTType *)(id)iPhotoLibraryType_type;
}

+ (NSString)iPhotoLibraryIdentifier
{
  return (NSString *)CFSTR("com.apple.photo.library");
}

+ (UTType)apertureLibraryType
{
  if (apertureLibraryType_onceToken != -1)
    dispatch_once(&apertureLibraryType_onceToken, &__block_literal_global_11);
  return (UTType *)(id)apertureLibraryType_type;
}

+ (NSString)apertureLibraryIdentifier
{
  return (NSString *)CFSTR("com.apple.aperture.library");
}

+ (UTType)adobePhotoshopType
{
  if (adobePhotoshopType_onceToken[0] != -1)
    dispatch_once(adobePhotoshopType_onceToken, &__block_literal_global_14);
  return (UTType *)(id)adobePhotoshopType_type;
}

+ (NSString)adobePhotoshopIdentifier
{
  return (NSString *)CFSTR("com.adobe.photoshop-image");
}

+ (UTType)adobeIllustratorType
{
  if (adobeIllustratorType_onceToken[0] != -1)
    dispatch_once(adobeIllustratorType_onceToken, &__block_literal_global_17);
  return (UTType *)(id)adobeIllustratorType_type;
}

+ (NSString)adobeIllustratorIdentifier
{
  return (NSString *)CFSTR("com.adobe.illustrator.ai-image");
}

+ (UTType)supplementalResourceXMPType
{
  if (supplementalResourceXMPType_onceToken[0] != -1)
    dispatch_once(supplementalResourceXMPType_onceToken, &__block_literal_global_20);
  return (UTType *)(id)supplementalResourceXMPType_type;
}

+ (NSString)supplementalResourceXMPIdentifier
{
  return (NSString *)CFSTR("public.data");
}

+ (NSString)supplementalResourceAAEIdentifier
{
  return (NSString *)CFSTR("com.apple.photos.apple-adjustment-envelope");
}

+ (UTType)livePhotoBundleType
{
  if (livePhotoBundleType_onceToken[0] != -1)
    dispatch_once(livePhotoBundleType_onceToken, &__block_literal_global_26);
  return (UTType *)(id)livePhotoBundleType_type;
}

+ (NSString)livePhotoBundleIdentifier
{
  return (NSString *)CFSTR("com.apple.live-photo-bundle");
}

+ (UTType)livePhotoBundlePrivateType
{
  if (livePhotoBundlePrivateType_onceToken[0] != -1)
    dispatch_once(livePhotoBundlePrivateType_onceToken, &__block_literal_global_29);
  return (UTType *)(id)livePhotoBundlePrivateType_type;
}

+ (NSString)livePhotoBundlePrivateIdentifier
{
  return (NSString *)CFSTR("com.apple.private.live-photo-bundle");
}

+ (NSString)avifIdentifier
{
  return (NSString *)CFSTR("public.avif");
}

+ (UTType)heicSequenceType
{
  if (heicSequenceType_onceToken[0] != -1)
    dispatch_once(heicSequenceType_onceToken, &__block_literal_global_35);
  return (UTType *)(id)heicSequenceType_type;
}

+ (NSString)heicSequenceIdentifier
{
  return (NSString *)CFSTR("public.heics");
}

+ (UTType)pictType
{
  if (pictType_onceToken != -1)
    dispatch_once(&pictType_onceToken, &__block_literal_global_38);
  return (UTType *)(id)pictType_type;
}

+ (NSString)pictIdentifier
{
  return (NSString *)CFSTR("com.apple.pict");
}

+ (UTType)quicktimeImageType
{
  if (quicktimeImageType_onceToken != -1)
    dispatch_once(&quicktimeImageType_onceToken, &__block_literal_global_41);
  return (UTType *)(id)quicktimeImageType_type;
}

+ (NSString)quicktimeImageIdentifier
{
  return (NSString *)CFSTR("com.apple.quicktime-image");
}

+ (UTType)icoType
{
  if (icoType_onceToken != -1)
    dispatch_once(&icoType_onceToken, &__block_literal_global_44);
  return (UTType *)(id)icoType_type;
}

+ (NSString)icoIdentifier
{
  return (NSString *)CFSTR("com.microsoft.ico");
}

+ (UTType)macPaintType
{
  if (macPaintType_onceToken != -1)
    dispatch_once(&macPaintType_onceToken, &__block_literal_global_47);
  return (UTType *)(id)macPaintType_type;
}

+ (NSString)macPaintIdentifier
{
  return (NSString *)CFSTR("com.apple.macpaint-image");
}

+ (UTType)jpeg2000Type
{
  if (jpeg2000Type_onceToken != -1)
    dispatch_once(&jpeg2000Type_onceToken, &__block_literal_global_50);
  return (UTType *)(id)jpeg2000Type_type;
}

+ (NSString)jpeg2000Identifier
{
  return (NSString *)CFSTR("public.jpeg-2000");
}

+ (NSString)jpegXLIdentifier
{
  return (NSString *)CFSTR("public.jpeg-xl");
}

+ (NSString)sonyARWRAWImageIdentifier
{
  return (NSString *)CFSTR("com.sony.arw-raw-image");
}

+ (NSString)canonCR2RAWImageIdentifier
{
  return (NSString *)CFSTR("com.canon.cr2-raw-image");
}

+ (NSString)canonCRWRAWImageIdentifier
{
  return (NSString *)CFSTR("com.canon.crw-raw-image");
}

+ (NSString)canonTIFFRAWImageIdentifier
{
  return (NSString *)CFSTR("com.canon.tif-raw-image");
}

+ (NSString)olympusRAWImageIdentifier
{
  return (NSString *)CFSTR("com.olympus.raw-image");
}

+ (NSString)panasonicRW2RAWImageIdentifier
{
  return (NSString *)CFSTR("com.panasonic.rw2-raw-image");
}

+ (NSString)panasonicRAWImageIdentifier
{
  return (NSString *)CFSTR("com.panasonic.raw-image");
}

+ (NSString)pentaxRAWImageIdentifier
{
  return (NSString *)CFSTR("com.pentax.raw-image");
}

+ (NSString)nikonRAWImageIdentifier
{
  return (NSString *)CFSTR("com.nikon.raw-image");
}

+ (NSString)samsungRAWImageIdentifier
{
  return (NSString *)CFSTR("com.samsung.raw-image");
}

+ (NSString)fujiRAWImageIdentifier
{
  return (NSString *)CFSTR("com.fuji.raw-image");
}

+ (NSString)leafamericaRAWImageIdentifier
{
  return (NSString *)CFSTR("com.leafamerica.raw-image");
}

+ (NSString)hasselblad3FRRAWImageIdentifier
{
  return (NSString *)CFSTR("com.hasselblad.3fr-raw-image");
}

+ (NSString)hasselbladFFFRAWImageIdentifier
{
  return (NSString *)CFSTR("com.hasselblad.fff-raw-image");
}

+ (UTType)openEXRImageType
{
  if (openEXRImageType_onceToken[0] != -1)
    dispatch_once(openEXRImageType_onceToken, &__block_literal_global_98);
  return (UTType *)(id)openEXRImageType_type;
}

+ (NSString)openEXRImageIdentifier
{
  return (NSString *)CFSTR("com.ilm.openexr-image");
}

+ (id)typeWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (typeWithIdentifier__onceToken[0] == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(typeWithIdentifier__onceToken, &__block_literal_global_101);
  if (!v4)
    goto LABEL_8;
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&typeWithIdentifier__sTypeWithIdentifierCacheLock);
  objc_msgSend((id)typeWithIdentifier__sTypeWithIdentifierCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend((id)typeWithIdentifier__sTypeWithIdentifierCache, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&typeWithIdentifier__sTypeWithIdentifierCacheLock);
LABEL_9:

  return v5;
}

+ (id)typeWithFilenameExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (typeWithFilenameExtension__onceToken == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&typeWithFilenameExtension__onceToken, &__block_literal_global_103);
  if (!v4)
    goto LABEL_8;
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&typeWithFilenameExtension__sTypeWithExtensionCacheLock);
  objc_msgSend((id)typeWithFilenameExtension__sTypeWithExtensionCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend((id)typeWithFilenameExtension__sTypeWithExtensionCache, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&typeWithFilenameExtension__sTypeWithExtensionCacheLock);
LABEL_9:

  return v5;
}

+ (id)typeWithFilenameExtension:(id)a3 conformingToType:(id)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3 fallbackIdentifier:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__onceToken[0] == -1)
  {
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v6, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v7;
    v12 = v11;

    objc_msgSend(a1, "canonTIFFRAWImageIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v8 = CFSTR("tiff");
    }
    else
    {
      objc_msgSend(a1, "supplementalResourceAAEIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
      {
        v8 = CFSTR("aae");
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v12, "isEqualToString:", v17);

        if (v18)
          v8 = CFSTR("dat");
        else
          v8 = 0;
      }
    }

    goto LABEL_16;
  }
  dispatch_once(preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__onceToken, &__block_literal_global_104);
  if (!v6)
    goto LABEL_5;
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  objc_msgSend((id)preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap, "objectForKeyedSubscript:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  if (v8)
    goto LABEL_19;
  objc_msgSend(v6, "preferredFilenameExtension");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
LABEL_16:
  if (v6 && v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
    objc_msgSend((id)preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap, "setObject:forKeyedSubscript:", v8, v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  }
LABEL_19:

  return v8;
}

+ (BOOL)type:(id)a3 conformsToOneOfTypes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)filenameExtension:(id)a3 conformsToOneOfTypes:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "typeForFilenameExtensionOrLastPathComponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "type:conformsToOneOfTypes:", v7, v6);

  return (char)a1;
}

+ (BOOL)url:(id)a3 conformsToType:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "typeForURL:error:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "conformsToType:", v6);

  return (char)a1;
}

+ (BOOL)url:(id)a3 conformsToOneOfTypes:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  objc_msgSend(a1, "typeForURL:error:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 && (objc_msgSend(a1, "type:conformsToOneOfTypes:", v7, v6) & 1) != 0;

  return v8;
}

+ (id)resourceModelTypeForFilenameExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xmp")))
  {
    +[PFUniformTypeUtilities supplementalResourceXMPType](PFUniformTypeUtilities, "supplementalResourceXMPType");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v5 = (void *)v6;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("aae")))
  {
    +[PFUniformTypeUtilities supplementalResourceAAEType](PFUniformTypeUtilities, "supplementalResourceAAEType");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDynamic"))
  {

LABEL_6:
    v5 = 0;
  }
LABEL_10:

  return v5;
}

+ (NSArray)typesSupportedForImport
{
  if (typesSupportedForImport_onceToken != -1)
    dispatch_once(&typesSupportedForImport_onceToken, &__block_literal_global_110);
  return (NSArray *)(id)typesSupportedForImport_supportedTypes;
}

+ (id)typeForFilenameExtensionOrLastPathComponent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "pathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", &stru_1E45A8128))
      v5 = v3;
    else
      v5 = v4;
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (NSArray)supportedImageTypes
{
  if (supportedImageTypes_onceToken[0] != -1)
    dispatch_once(supportedImageTypes_onceToken, &__block_literal_global_114);
  return (NSArray *)(id)supportedImageTypes_supportedImageTypes;
}

+ (NSArray)supportedMovieTypes
{
  if (supportedMovieTypes_onceToken != -1)
    dispatch_once(&supportedMovieTypes_onceToken, &__block_literal_global_116);
  return (NSArray *)(id)supportedMovieTypes_supportedMovieTypes;
}

+ (NSArray)supportedAudioTypes
{
  if (supportedAudioTypes_onceToken != -1)
    dispatch_once(&supportedAudioTypes_onceToken, &__block_literal_global_118);
  return (NSArray *)(id)supportedAudioTypes_supportedTypes;
}

+ (NSArray)imageTypesUnsupportedForImport
{
  if (imageTypesUnsupportedForImport_onceToken[0] != -1)
    dispatch_once(imageTypesUnsupportedForImport_onceToken, &__block_literal_global_119);
  return (NSArray *)(id)imageTypesUnsupportedForImport_unsupportedTypes;
}

+ (NSArray)imageTypesNotWellSupportedForSharing
{
  if (imageTypesNotWellSupportedForSharing_onceToken[0] != -1)
    dispatch_once(imageTypesNotWellSupportedForSharing_onceToken, &__block_literal_global_122);
  return (NSArray *)(id)imageTypesNotWellSupportedForSharing_notWellSupportedTypes;
}

+ (id)typeForHFSType:(unsigned int)a3
{
  return 0;
}

+ (id)typeForHFSType:(unsigned int)a3 conformingToType:(id)a4
{
  return 0;
}

void __62__PFUniformTypeUtilities_imageTypesNotWellSupportedForSharing__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0CEC698];
  +[PFUniformTypeUtilities avifType](PFUniformTypeUtilities, "avifType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v0;
  +[PFUniformTypeUtilities jpegXLType](PFUniformTypeUtilities, "jpegXLType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  +[PFUniformTypeUtilities openEXRImageType](PFUniformTypeUtilities, "openEXRImageType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)imageTypesNotWellSupportedForSharing_notWellSupportedTypes;
  imageTypesNotWellSupportedForSharing_notWellSupportedTypes = v3;

}

void __56__PFUniformTypeUtilities_imageTypesUnsupportedForImport__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[PFUniformTypeUtilities quicktimeImageType](PFUniformTypeUtilities, "quicktimeImageType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities pictType](PFUniformTypeUtilities, "pictType", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  +[PFUniformTypeUtilities icoType](PFUniformTypeUtilities, "icoType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", CFSTR("FPX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)imageTypesUnsupportedForImport_unsupportedTypes;
  imageTypesUnsupportedForImport_unsupportedTypes = v6;

}

void __45__PFUniformTypeUtilities_supportedAudioTypes__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x1E0CEC450];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToType:", v6))
          objc_msgSend(v1, "addObject:", v8);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)supportedAudioTypes_supportedTypes;
  supportedAudioTypes_supportedTypes = v9;

}

void __45__PFUniformTypeUtilities_supportedMovieTypes__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x1E0CEC568];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToType:", v6))
          objc_msgSend(v1, "addObject:", v8);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)supportedMovieTypes_supportedMovieTypes;
  supportedMovieTypes_supportedMovieTypes = v9;

}

void __45__PFUniformTypeUtilities_supportedImageTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0CEC520];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedImageTypes_supportedImageTypes;
  supportedImageTypes_supportedImageTypes = v0;

}

void __49__PFUniformTypeUtilities_typesSupportedForImport__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99DE8];
  +[PFUniformTypeUtilities supportedImageTypes](PFUniformTypeUtilities, "supportedImageTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithArray:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[PFUniformTypeUtilities supportedMovieTypes](PFUniformTypeUtilities, "supportedMovieTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v2);

  +[PFUniformTypeUtilities supportedAudioTypes](PFUniformTypeUtilities, "supportedAudioTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)typesSupportedForImport_supportedTypes;
  typesSupportedForImport_supportedTypes = v4;

}

void __89__PFUniformTypeUtilities_preferredOrFallbackFilenameExtensionForType_fallbackIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap;
  preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap = (uint64_t)v0;

}

void __52__PFUniformTypeUtilities_typeWithFilenameExtension___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)typeWithFilenameExtension__sTypeWithExtensionCache;
  typeWithFilenameExtension__sTypeWithExtensionCache = v0;

}

void __45__PFUniformTypeUtilities_typeWithIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)typeWithIdentifier__sTypeWithIdentifierCache;
  typeWithIdentifier__sTypeWithIdentifierCache = v0;

}

void __42__PFUniformTypeUtilities_openEXRImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.ilm.openexr-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)openEXRImageType_type;
  openEXRImageType_type = v0;

}

void __38__PFUniformTypeUtilities_jpeg2000Type__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.jpeg-2000"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)jpeg2000Type_type;
  jpeg2000Type_type = v0;

}

void __38__PFUniformTypeUtilities_macPaintType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.macpaint-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)macPaintType_type;
  macPaintType_type = v0;

}

void __33__PFUniformTypeUtilities_icoType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.microsoft.ico"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)icoType_type;
  icoType_type = v0;

}

void __44__PFUniformTypeUtilities_quicktimeImageType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.quicktime-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)quicktimeImageType_type;
  quicktimeImageType_type = v0;

}

void __34__PFUniformTypeUtilities_pictType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.pict"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pictType_type;
  pictType_type = v0;

}

void __42__PFUniformTypeUtilities_heicSequenceType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.heics"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)heicSequenceType_type;
  heicSequenceType_type = v0;

}

void __52__PFUniformTypeUtilities_livePhotoBundlePrivateType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.private.live-photo-bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)livePhotoBundlePrivateType_type;
  livePhotoBundlePrivateType_type = v0;

}

void __45__PFUniformTypeUtilities_livePhotoBundleType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.live-photo-bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)livePhotoBundleType_type;
  livePhotoBundleType_type = v0;

}

void __53__PFUniformTypeUtilities_supplementalResourceXMPType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.data"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supplementalResourceXMPType_type;
  supplementalResourceXMPType_type = v0;

}

void __46__PFUniformTypeUtilities_adobeIllustratorType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.illustrator.ai-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)adobeIllustratorType_type;
  adobeIllustratorType_type = v0;

}

void __44__PFUniformTypeUtilities_adobePhotoshopType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.photoshop-image"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)adobePhotoshopType_type;
  adobePhotoshopType_type = v0;

}

void __45__PFUniformTypeUtilities_apertureLibraryType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.aperture.library"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)apertureLibraryType_type;
  apertureLibraryType_type = v0;

}

void __43__PFUniformTypeUtilities_iPhotoLibraryType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.photo.library"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iPhotoLibraryType_type;
  iPhotoLibraryType_type = v0;

}

void __43__PFUniformTypeUtilities_photosLibraryType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.photos.library"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)photosLibraryType_type;
  photosLibraryType_type = v0;

}

@end
