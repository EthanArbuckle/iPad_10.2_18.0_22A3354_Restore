@implementation PLThumbFileManager

- (BOOL)setImageForEntry:(id)a3 withIdentifier:(id)a4 orIndex:(unint64_t)a5 photoUUID:(id)a6 options:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v22;
  PLImageContainer *v23;
  PLImageContainer *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  CGContext *v37;
  CGImage *v38;
  CGImage *Image;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[2];
  _BYTE buf[12];
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;
  CGRect v49;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_onceToken != -1)
    dispatch_once(&setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_onceToken, &__block_literal_global_81657);
  v15 = -[PLThumbFileManagerCore isReadOnly](self, "isReadOnly");
  LOBYTE(v16) = 0;
  if (v11 && !v15)
  {
    objc_msgSend(v11, "pixelSize");
    objc_msgSend(v11, "pixelSize");
    v17 = PLSizeMake();
    v18 = (void *)MEMORY[0x1E0D732F0];
    -[PLThumbFileManagerCore format](self, "format");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "maxMasterSizeFromSourceImageSize:format:", v17, v19);

    if ((int)v17 <= (int)v20 && SHIDWORD(v17) <= SHIDWORD(v20))
    {
      v24 = (PLImageContainer *)v11;
    }
    else
    {
      PLThumbnailsGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v13;
        v44 = 2048;
        v45 = (id)(int)v17;
        v46 = 2048;
        v47 = v17 >> 32;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Attempting to set a file backed thumbnail for asset (%@) with larger allowed size (%lu, %lu), attempting downscale", buf, 0x20u);
      }

      if (!objc_msgSend(v11, "ioSurface")
        || (*(_QWORD *)buf = 0,
            !PLCreateDownscaledIOSurfaceFromIOSurface((IOSurfaceRef)objc_msgSend(v11, "ioSurface"), v20, (IOSurfaceRef *)buf))|| (v23 = [PLImageContainer alloc], v24 = -[PLImageContainer initWithIOSurface:](v23, "initWithIOSurface:", *(_QWORD *)buf), CFRelease(*(CFTypeRef *)buf), !v24))
      {
        objc_msgSend(v11, "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v40 = CFSTR("kPLCreateThumbnailFromImageAlways");
          v41 = CFSTR("kPLOptimalSourcePixelSizeKey");
          v42[0] = MEMORY[0x1E0C9AAB0];
          DCIM_NSValueFromCGSize();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v40, 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "data", v40, v41, v42[0]);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniformTypeIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)PLCreateImageFromDataWithFormat(v28, 0, 0, v29, 0, 0, v27);

          v24 = -[PLImageContainer initWithCGImage:]([PLImageContainer alloc], "initWithCGImage:", DCIM_CGImageRefFromPLImage());
        }
        else if (objc_msgSend(v11, "CGImage"))
        {
          v37 = CGBitmapContextCreate(0, (int)v20, v20 >> 32, 8uLL, 4 * (int)v20, (CGColorSpaceRef)setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_P3ColorSpace, 2u);
          v38 = (CGImage *)objc_msgSend(v11, "CGImage");
          v49.origin.x = 0.0;
          v49.origin.y = 0.0;
          v49.size.width = (double)(int)v20;
          v49.size.height = (double)SHIDWORD(v20);
          CGContextDrawImage(v37, v49, v38);
          Image = CGBitmapContextCreateImage(v37);
          CGContextRelease(v37);
          v24 = -[PLImageContainer initWithCGImage:]([PLImageContainer alloc], "initWithCGImage:", Image);
          CGImageRelease(Image);
        }
        else
        {
          v24 = 0;
        }
      }
    }
    v16 = -[PLThumbFileManager _writeImage:forThumbIdentifier:](self, "_writeImage:forThumbIdentifier:", v24, v12);
    PLThumbnailsGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v16)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        v44 = 2112;
        v45 = v12;
        v33 = "Saved file backed thumbnail for asset (%@) thumb identifier (%@)";
        v34 = v32;
        v35 = OS_LOG_TYPE_DEBUG;
LABEL_22:
        _os_log_impl(&dword_199541000, v34, v35, v33, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      v44 = 2112;
      v45 = v12;
      v33 = "Failed to write file backed thumbnail for asset (%@) thumb identifier (%@)";
      v34 = v32;
      v35 = OS_LOG_TYPE_ERROR;
      goto LABEL_22;
    }

  }
  return v16;
}

- (BOOL)_writeImage:(id)a3 forThumbIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CGImage *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    v15 = 0;
    goto LABEL_20;
  }
  -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniformTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC530]);

    if (v13)
    {
      objc_msgSend(v6, "data");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

  }
  v14 = 0;
LABEL_9:
  v16 = *MEMORY[0x1E0D09418];
  v28[0] = &unk_1E3760200;
  v17 = *MEMORY[0x1E0D09410];
  v27[0] = v16;
  v27[1] = v17;
  v25 = *MEMORY[0x1E0D09618];
  v26 = &unk_1E3764790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((objc_msgSend(v6, "hasAuxiliaryImages") & 1) != 0
      || !objc_msgSend(v6, "ioSurface")
      || (objc_msgSend(v6, "ioSurface"), PFFigJPEGDataFromImage(), (v14 = 0) == 0))
    {
      if (objc_msgSend(v6, "CGImage"))
      {
        v20 = (CGImage *)objc_msgSend(v6, "CGImage");
        objc_msgSend(v6, "auxiliaryImageRecords");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PLJPEGDataFromImage(v20, 1, v21, 0.899999976);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
    }
  }
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, 0);

    v15 = objc_msgSend(v14, "writeToFile:options:error:", v8, 1073741825, 0);
  }
  else
  {
    v15 = 0;
  }

LABEL_20:
  return v15;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFData *v9;
  void *v10;
  int CGImageFromImageData;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  CGImage *CGImageFromJPEGData;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfFile:", v8);
    v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (-[__CFData length](v9, "length"))
    {
      +[PLJPEGThumbnailDecode decodeSessionOptions](PLJPEGThumbnailDecode, "decodeSessionOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageFromImageData = PFFigCreateCGImageFromImageData();

      PLThumbnailsGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CGImageFromImageData;
        -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        v22 = 2048;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %@ returned %ld for %@.", buf, 0x20u);

      }
      PLThumbnailsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[PLThumbFileManagerCore thumbnailPathForThumbIdentifier:](self, "thumbnailPathForThumbIdentifier:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Fall back to software decoding for %@", buf, 0xCu);

      }
      CGImageFromJPEGData = CreateCGImageFromJPEGData(v9);
    }
    else
    {
      CGImageFromJPEGData = 0;
    }

  }
  else
  {
    CGImageFromJPEGData = 0;
  }

  return CGImageFromJPEGData;
}

CGColorSpaceRef __80__PLThumbFileManager_setImageForEntry_withIdentifier_orIndex_photoUUID_options___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  setImageForEntry_withIdentifier_orIndex_photoUUID_options__s_P3ColorSpace = (uint64_t)result;
  return result;
}

@end
